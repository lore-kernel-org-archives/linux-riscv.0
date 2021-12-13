Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A69C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJdiJY+mfyF1ENh1xQ52BBiY6yWLGp6kFoyMhSjsc3o=; b=k1zvH/NGhdeunl
	UEHu9y3rr/yp+srUJmiJnHj0CzCl/k3cZbqln/vChaX4yTEaVla6TjshZc2MxMlTo6cjJqtdms5os
	RkAhskXQ8+/SG2+POiZnVwyEw9FyZAWmAHc35hfWKhfVQ5Hd9ia/kyqeJptFbnccoU1s+tz2+9/DB
	SEZ8gkNBVxvda1vGedqH7A3MJ7taYu4IWriXsYJCarHI1602ntdTLS+FcCmVY8S1qEoF0d38uPwYi
	o1HUfoDpQaSVH91H8WLbIOfR8OIWMShDXZEvC1si+vXXARRX75CSmvy6ID9Xn58OlontQCWKD1eGS
	tMtd8n7r8wtgvpGDWdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwjO4-009Ekb-R3; Mon, 13 Dec 2021 11:20:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwjO1-009Eia-Lx
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 11:20:54 +0000
Received: from p5b127e39.dip0.t-ipconnect.de ([91.18.126.57]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mwjNt-0001Dm-EB; Mon, 13 Dec 2021 12:20:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: atishp@atishpatra.org, anup@brainfault.org, jszhang@kernel.org,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] riscv: provide default implementations for
 __sbi_set_timer and __sbi_send_ipi
Date: Mon, 13 Dec 2021 12:20:34 +0100
Message-Id: <20211213112034.2896536-2-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211213112034.2896536-1-heiko@sntech.de>
References: <20211213112034.2896536-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_032053_739561_CC2B3618 
X-CRM114-Status: GOOD (  10.55  )
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

The mentioned function pointers get called from different sbi functions
which may get called from other areas of the kernel without fully
checking if the sbi initialization was done.

So similarly to sbi_remote_fence_i, provide empty functions for them
to prevent any null-pointer dereferences in the future.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/sbi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 69d0a96b97d0..6a21345c6712 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -14,6 +14,13 @@
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
 
+static void __sbi_set_timer_none(uint64_t stime_value) {}
+
+static int __sbi_send_ipi_none(const unsigned long *hart_mask)
+{
+	return -EOPNOTSUPP;
+}
+
 static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
 			     unsigned long start, unsigned long size,
 			     unsigned long arg4, unsigned long arg5)
@@ -21,8 +28,9 @@ static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
 	return -EOPNOTSUPP;
 }
 
-static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
-static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
+static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init = __sbi_set_timer_none;
+static int (*__sbi_send_ipi)(const unsigned long *hart_mask)
+			    __ro_after_init = __sbi_send_ipi_none;
 static int (*__sbi_rfence)(int fid, const unsigned long *hart_mask,
 			   unsigned long start, unsigned long size,
 			   unsigned long arg4, unsigned long arg5)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
