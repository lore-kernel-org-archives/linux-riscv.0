Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29456C531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4gwVI0ybqd944jvxCdpKwrtxe5qFcIZDg5S2VyNnYQ=; b=lplzIci0OgK8hc
	E2uYLeuTGdJG0FPKO2dJOtPjwgE9T1WsO5k4VFm0vW/6IHGsVTqBqimYlA7pjjowSwShwT5CYvXoR
	skacv81lAA62F2EVDyUkEdxAts2aOZQiX8IwVMcOJzraI87sXb8DS92nXGlmjceMiF7103MgGzGEM
	NpAAlM2LUI77kVSzLtwPNSKzWKPPTALwQNdInmtNLhioi8BArPL5dO/jl6TuAJtGG852dudcNWWEB
	4+X3+VnpL984w0NGXvyuEU4MHQQLq0ZgeKlA6REd/gqG1YkhltAaP+BQp8i9mDYSoKFqFNWv4dOU4
	ST/FrFWip1dWV66EifYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5Y-0000000HOlt-0T2R;
	Sat, 25 Jul 2026 00:18:00 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5U-0000000HOhd-1qth
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:17:57 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aae90e595fso385370eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938675; x=1785543475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=ZZ9ritQvimZh2hxRa+uS+KKHAmCvq1JHdQOpEgnuDz3AQTfxWDQHLlS0GxqBaplfrP
         3ksIYJEDn6iyrLNDKIJvWgSG6VQvQW8EbSJtP4dq67L0F+KySd2Y9IhxS4srNIK/W7Sr
         6Gyln4e+rSciTRg7IlPbeEXJy5pfxNd0IvBb8ejKBVS5Z6GLzf9mkpH2cMep3Uuu+e8e
         9+PBaCz2az33YRowshEt1AOlffcJi7EMuXQLmg1wL2sr3k2d+x08na5fmE6/w/YoBQpF
         CxyfqiX8UIYgwV1Q/WEJl6DYzTCTGhIntiiqSjvEsogoZnGSMuu0e74GHTe7cDiEEQHr
         h6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938675; x=1785543475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=XbU5AH4AesG5//wp/ntHoazJXYxuILR4p9dgKLNoTioZ2cQIpagUAWFldp5Z5dgX4b
         VhNfPydRsP06pqNRRRciAxbhCI1F1AjNKhixHzMHhDKSNOiIoOyXPdbKYmDDegcd3RDj
         QFXFfZg4mDsifNqaQhiroyCzjVCDesk3IW9aTIgx5c1HtnO2dKbf5lH8clGWvn1aZBEc
         8UZTEzOT6JFL2nOJa3ktb3mWeYK4mbOlbZVwBaOJWQwLVqkAzb4Q1GKGVZugbGvpCrxZ
         Chb+6DPPeZxQ326hkHLBXhBxrIMAR3jSYYsqgnLxsU1scd7tKrrgxddKk0ukmXEsvF6N
         a/TA==
X-Forwarded-Encrypted: i=1; AHgh+RrbBZO6Y7om6J5sjPFXpmNAxkN2JHBrIAaa2tJiF2rgZdcrgvpzM9F2eqoahPO0OxwCYmj9Ckap7z9INA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxePz9ctnB1GgP9cr8nT6kLmnECv+X1PwSqPLIXoQIgoY68pVBJ
	/PuCSTj08ri6/F/ppE/22wUeac8ElkGyeAOovkzz10kFQ0exCJ91yfKxf44c+xR2wZw=
X-Gm-Gg: AR+sD11XgG+FDYY33vlHfnrP+uFirFPHDXhg9b9GVRkfLJ+u33PDIIv0B0ro1Y42qfn
	HKQ2qHVx95Qzl9j2c8dTal+7nICreUooQ1iDfrx2vZg07+1jZdoOpEw7HtfcACqvaJDd88ZA/AA
	MaTbifawYUFp4xf94WtBBDnmifWaEI6B4DIhjCconGQ2YmiX7+Ts3AwHuQlcb3t9/SOLrKRy1nX
	qhSZHRn+QcAf+SkDE28TNCGh0+CTyxiv/vy9Bocc5HpVtZPjT7kYUyo90WxUnLjGSzzLLXbYhzZ
	gPRRikfflrw5Rmn4Z1LfjAg5Sh+xvY0qf4Yt76I8ldBQvNrTPYJ8mg1L5XGuejg/abrJ+3YSIvk
	nzuJaD/81VxHfxFrzg7VzABPok654WiQOVSXWO9Fp5zvbWsI6dwpQvaCn9pVdYGv9mJhu2ta0K0
	GfTccOUS+gjR0oF3Gf5fdQKgoM0NYuWRMKvK4=
X-Received: by 2002:a05:6820:f026:b0:6a1:83aa:4439 with SMTP id 006d021491bc7-6aaff86707amr474448eaf.18.1784938675558;
        Fri, 24 Jul 2026 17:17:55 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm884057eaf.7.2026.07.24.17.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:55 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v4 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Fri, 24 Jul 2026 19:17:40 -0500
Message-ID: <20260725001749.2579274-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001749.2579274-1-tchiu@tenstorrent.com>
References: <20260725001749.2579274-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171756_494398_F39973C5 
X-CRM114-Status: GOOD (  10.25  )
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

Refactor riscv_v_start_kernel_context() to drop `is_nested` variable and
simplify the logic.

This introduces no functional change and works as a preparatory patch for
the kernel-mode vector fix.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/kernel/kernel_mode_vector.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 99972a48e86b..307ac369c3d4 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -121,7 +121,7 @@ static int riscv_v_stop_kernel_context(void)
 	return 0;
 }
 
-static int riscv_v_start_kernel_context(bool *is_nested)
+static int riscv_v_start_kernel_context(void)
 {
 	struct __riscv_v_ext_state *kvstate, *uvstate;
 
@@ -131,7 +131,6 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 
 	if (riscv_preempt_v_started(current)) {
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
-		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
@@ -148,6 +147,7 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		__riscv_v_vstate_save(uvstate, uvstate->datap);
 	}
 	riscv_preempt_v_clear_dirty(current);
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
 	return 0;
 }
 
@@ -187,7 +187,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	}
 }
 #else
-#define riscv_v_start_kernel_context(nested)	(-ENOENT)
+#define riscv_v_start_kernel_context()		(-ENOENT)
 #define riscv_v_stop_kernel_context()		(-ENOENT)
 #endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
 
@@ -206,20 +206,16 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
  */
 void kernel_vector_begin(void)
 {
-	bool nested = false;
-
 	if (WARN_ON(!(has_vector() || has_xtheadvector())))
 		return;
 
 	BUG_ON(!may_use_simd());
 
-	if (riscv_v_start_kernel_context(&nested)) {
+	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
 		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-	}
-
-	if (!nested)
 		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	}
 
 	riscv_v_enable();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
