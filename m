Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685CC5DF8C
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 05:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d8UqkWPSCm1B/YR4mg238c5mp3aVYhaLDw4NhkIi6fE=; b=RbjJ+wuMqhKZkR
	FVJMwfD1EAoJKKXW3cqjcFvhxw0Fab9qLjJrqZnxXv2ofjHmQ4BIAlZvHaISTGFmlkSPEkjkIaswO
	K5Q+tCAKF5C8wiRjCsgzc4tbY/QK8c1jUoeSVJ4nQ1sGmfIuuWxScbE/Dd4q/Ee16TWXnwIxeSM26
	hWZ+IrimjTwebQCQT67+H6+JLc8a2/j68V4cQkEFSzjw6a/FAihNCg0hZU24iWd+M7VFyIk2BMW1M
	amPCg6Ciuf5KNlPVP4dtXmT08kHXE8xUxN6WAPq+MxAhjYPGLjaCysVespu9hqjPfPZ0xV4urtk/J
	bKS6nVqJD0EJOKhPSi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Xf-0000000F5Mo-2ORT;
	Sun, 23 Aug 2026 05:14:47 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Xc-0000000F5M9-1Qk8
	for linux-riscv@lists.infradead.org;
	Sun, 23 Aug 2026 05:14:45 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXh0G_gYpqRuZuBg--.53855S2;
	Sun, 23 Aug 2026 13:14:40 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>
Cc: Rahul Pathak <rpathak@ventanamicro.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH] mailbox: riscv-sbi-mpxy: Fix inverted notification loop
Date: Sun, 23 Aug 2026 05:14:30 +0000
Message-Id: <20260823051430.530304-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXh0G_gYpqRuZuBg--.53855S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWxXw1rKry5JFyfAFWkJFb_yoW8XFyfpa
	y2ka4YyryUJa13Z3ZrAF1kua4jg395Wr98KF40krnYyrZ8WryYqFWDta429F1rtFW0yFWI
	vanaqw1DZFyq9FDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOD
	GOUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_221444_756956_D62943CB 
X-CRM114-Status: UNSURE (   9.91  )
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

In mpxy_mbox_peek_rpmi_data(), the while loop condition checks:

  (events_data_len - pos) <= sizeof(*event)

This is inverted. The loop should continue while there is enough
remaining data to hold at least one event header, i.e. >=. With <=
the loop body is entered only when the remaining data is smaller than
one header, which is never useful. In practice, since events_data_len
is always larger than sizeof(*event) (4 bytes), the condition is false
on the first iteration and the loop is never entered.

All RPMI notification events are silently dropped.

Fix the condition from <= to >=.

Fixes: bf3022a4eb11 ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 7c9c006b7..18da9efcc 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -480,7 +480,7 @@ static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
 	struct rpmi_mbox_message msg;
 	unsigned long pos = 0;
 
-	while (pos < events_data_len && (events_data_len - pos) <= sizeof(*event)) {
+	while (pos < events_data_len && (events_data_len - pos) >= sizeof(*event)) {
 		event = (struct rpmi_notification_event *)(notif->events_data + pos);
 
 		msg.type = RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
