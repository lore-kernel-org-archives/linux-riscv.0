Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90419EEF309
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=omNpfQPIMObe3FumGVf+Y1o8QOqjCiOcsuU9hzl6QiA=; b=M0UxkvZou8fisv
	44t5Pf2SFakUqZDcTNjKSdNWBc4s30v4N2FQQBVXOffnwpxaeaKkU2/eNji6aHIkaNUURWYMvk73F
	7x/DI6uqUCV07mPsXNNUrijJM2Xnps9Y2Qtlfnmi7FJHNmEWuIA8f2U4uVPGQk2uHcTGSfyaVBq9W
	iB+DMbB5dUi/+VNZuZ6zNqGscEq9cHpu3GPufboc0jf4adBPkIQX6Vo5PQQHKnyTPGT7xd0Kn2gcx
	CAjSAktYz3DgWxQIDjjtdaoiqpHNzDm5Jhgt+SOsvwPlt+9258ES2eKV/iHIrDw9/G/aEgrC+R55c
	mAnnYj4cRyDQSArD7fwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2NM-000000011hv-3kJx;
	Thu, 05 Mar 2026 06:40:00 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2NJ-000000011fu-06b2
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 06:39:58 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXqg01JalpW7+uCQ--.48975S2;
	Thu, 05 Mar 2026 14:39:49 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH net v2 0/2] net: spacemit: A few error handling fixes
Date: Thu, 05 Mar 2026 14:39:37 +0800
Message-Id: <20260305-k1-ethernet-more-fixes-v2-0-e4e434d65055@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACklqWkC/4WOwQrCMBBEf6Xs2S1JKlY9+R9SIU23dpE2msSgl
 Py7IXr3ODNvmFnBk2PycKxWcBTZs12yUJsKzKSXKyEPWYMSaica0eBNIoWJ3EIBZ+sIR36RR7l
 XB9O0sjUjQS7fHZUgd8+QWei+pqPHM4+EX9JrT2jsPHM4VrGtBTojL2sq+MQ+WPcu36Is/L8bU
 aJAoXshlRqHQW5P7I32tTa1WaBLKX0AwhpSDvIAAAA=
X-Change-ID: 20260303-k1-ethernet-more-fixes-1829c3717cfe
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowAAXqg01JalpW7+uCQ--.48975S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy3ur13WFyDXw45tr4fKrg_yoWkuFb_uF
	W8uas3GF4kWFnrCa4akFsI9rWvyrs5Jrs3tFyYqayYkry7Jrn3XrWktFWrZr1fXa1kJFnx
	J3y7ZrWrZr17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUU_WrtUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_223957_436064_BC3279BA 
X-CRM114-Status: UNSURE (   6.49  )
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

Recently a user reported a supposed UAF/double-free in this driver. It
turned out to be a false positive (ugh) from a bug with riscv's
kfence_protect_page() [1], but it did also prompt me to review the
driver code yet again. These are some fixes for error handling problems
that I've found.

[1]: https://lore.kernel.org/r/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn/

---
Changes in v2:
- Retarget to net (Andrew, Jakub)
- Drop what was patch 1 and patch 4 for now, since they are code cleanup
  only and can't affect users (Andrew, Jakub)
- Reworded cover letter
- Link to v1: https://lore.kernel.org/r/20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn

---
Vivian Wang (2):
      net: spacemit: Fix error handling in emac_alloc_rx_desc_buffers()
      net: spacemit: Fix error handling in emac_tx_mem_map()

 drivers/net/ethernet/spacemit/k1_emac.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260303-k1-ethernet-more-fixes-1829c3717cfe

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
