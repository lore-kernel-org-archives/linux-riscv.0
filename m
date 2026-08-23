Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBBC5DF81
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nqQbIlkV8Ed5DXBpJyNJVrRsOGeDFwwuK4wpd9Gc3M=; b=Jhdhigdrdo7yL8
	Sldb5/Q8E4GnY/aEI9XEXLDZmS7svIOAsA28zCrbsJkHkcz6gv9ZH+RyEJRO/GPo6m3dH7/D0dXiD
	dulVgKmUHuppDEpVBvgsAI1Ce30Q29A/itR50J9Vpg8FmWFj+oVvr3xvPMj3FCx7sCxJ7ALaP+m3Z
	xwWofKuyD+Bb5CeNLdfX96oxQLp+bHCQydlW6uOlL4YmD2+wESphitFk+IAVExmKqzBkmeVv/a1Uv
	D8mxoQrDkISCXEDQfFLTGMJ+vdvi7Hd8KFKM95oAe5FhqxAZupRZSK8zag+F3rVP/vonYYL3pzZj7
	tSrMg2Dq5sVKKA6IOTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy1QD-0000000F72A-1JCm;
	Sun, 23 Aug 2026 06:11:09 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy1Q9-0000000F71k-317C
	for linux-riscv@lists.infradead.org;
	Sun, 23 Aug 2026 06:11:07 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADHzz32jopqLcoPBg--.62823S2;
	Sun, 23 Aug 2026 14:11:02 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>
Cc: Rahul Pathak <rpathak@ventanamicro.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH] mailbox: riscv-sbi-mpxy: Validate notification data length
Date: Sun, 23 Aug 2026 06:10:53 +0000
Message-Id: <20260823061053.543415-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADHzz32jopqLcoPBg--.62823S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1UGFyfCrWDXF1DtFWDJwb_yoWkZrX_G3
	Zaqr9rWr17Ca1Y9FnIy34rur4SvrW5ur9Ygr9xt395W3y09FnrXryxZrs5ZrsrZF1DZrs7
	Cw4DZ34fZw1rKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5k
	u4UUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_231106_135592_709181B6 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

mpxy_get_notifications() copies data from shared memory using a
length derived from the SBI return value:

  memcpy(notif_data, mpxy->shmem, sret.value + 16);

sret.value is not validated against the shared memory buffer size.
A buggy firmware returning a value larger than mpxy_shmem_size - 16
would cause memcpy to read beyond the shared memory mapping.

Add a bounds check before the memcpy.

Fixes: bf3022a4eb11 ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 18da9efcc..3a2d52bbc 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -315,6 +315,11 @@ static int mpxy_get_notifications(u32 channel_id,
 	if (sret.error)
 		goto err_put_cpu;
 
+	if (sret.value + 16 > mpxy_shmem_size) {
+		put_cpu();
+		return -EIO;
+	}
+
 	memcpy(notif_data, mpxy->shmem, sret.value + 16);
 	*events_data_len = sret.value;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
