Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76577C27C5F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XRqTy5KKN6b7c45Uw/iW28CQma7zIBq7d0Abt7lzRA=; b=p33GKuKp6kk3yu
	XoZ+X911IPXNoNC6AICoi/iEpkDdDJjlttRIGH9y0saZSytmmqI6mauw2xgUaZw+P8OtfnywvUCGg
	U0a6CgWWBqsgtY4Kl3wQHzwgHhp1eybVCwd8H8cgEZQEeKplQsdqWslFNecuJ1C4hw6TsjJkwEZHr
	zDewHMj9z/ycSuTg/2Ct0iulHjFlTKITCwBTicbe3vNEjXVlRO92X22Wmu8xttnPXPsPlE06oLXbx
	E5j4ivGc4Vuz6wtPp5f+xkSe1jL0ARvZqxfd79RXmDXPjECya1FLx4nMLqbYOeiB5Cc7v9hmlbbDr
	rNCd37KRZZUnhVgHhMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExh1-00000007Wlc-2oXV;
	Wed, 05 Jun 2024 20:57:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgv-00000007Wgk-3K5W
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 20:57:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f62fae8c3cso2639145ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 13:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717621022; x=1718225822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2bVegCzCkDHXMVMeg8qYCHprvPezD5elt/KHLJxQVU=;
        b=gsOX6GeU7JDGfBF36kSfK5MDEKhPCajFrtB8jc4e8a70+yYEn7Fy+GdRbqIEgfMNV/
         aTh/lOwzP17N3NSLYsW22gCIRLf/pYPyrZGEjQyKodPF6/qVrXxWMzbeJIOfkrzxeLQC
         eAparQPyFPXb7Qy9ru2ZxzAy36qZ7vfhaU9q10YwvgGw/oFnP3G7M3U2F2LeumkBJAIR
         acWttnC1wlTQl+o8/o+tvYSjc3kqhsA49sREwlN4SnwlAfn4K2stiLhe2xxAGT7NqshX
         xAFdTDLVQ3DZU2eBB+WY2cA9aYrxcdBLN2+i+uH2BkDMncbAKITRRJKSbjVad2o2LSJq
         wQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717621022; x=1718225822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2bVegCzCkDHXMVMeg8qYCHprvPezD5elt/KHLJxQVU=;
        b=BBcov3ObW/fAKjlWqJyTOxGWXL2nA/4rxKLqEOKckFcWiVki/8yA8aSEj6oIQwCGH6
         s7DJ9UFCFVSfEy1vKBUYiF0F0+Trp2cZb6M5ETnl3NOMs0lcUWR3PyNWLOV06NqCRqAW
         rGiE4ePCXFqke769LIf9A7NZ/3cd9QUxpCYcLPQpJdmLW4fm2BhytVtmGXCA0T4bgJKa
         7gtQ60f6dcmwVly/OXkRi5y4SLLtdjHwrXa3CjGPSmHU2w4e1Qv2havFdRA5CRP1d4G1
         kaCiQR1LlwefLcHEiRRQ4n5M4iZmDafVjFXvwx0UE1YXGNZ7MYer5xoKVYpu3R47vbsm
         cw/g==
X-Gm-Message-State: AOJu0Yy6IZDJp2/paHsaEZmvAhUUVd7Mnj4cMSoknctea2PC4oV3Ssu4
	TiyxHVvYVN5PWR8o9jtZmfNU2HLWmcwG3wlYVcGJaHTA8uC4DMe/xBnUE0VhVkJq4lY6+SGvOVR
	BygI0fCus/ORHpCUsfVF6SYViLP9ElaNY3/CJKLTSw7wIop8T4+Ozsfz5I4K49Se6poyQMai/N8
	VYC7+uaqdGe5WOICPgYe0f3N44QVY/FstG6hsONencAQuaPD/yQintlfiq
X-Google-Smtp-Source: AGHT+IEMiuzcom7/QujTrzZBUVPvtMGj/7csXw9/xKWBGQkukRtCW8OVo9AbXr0Dsd33zcb6XPLvdA==
X-Received: by 2002:a17:902:f684:b0:1f6:6ad1:fdf9 with SMTP id d9443c01a7336-1f6a5a84d6cmr39536575ad.57.1717621021640;
        Wed, 05 Jun 2024 13:57:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd86esm107332135ad.121.2024.06.05.13.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:57:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Enable cbo.zero only when all harts support Zicboz
Date: Wed,  5 Jun 2024 13:56:45 -0700
Message-ID: <20240605205658.184399-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240605205658.184399-1-samuel.holland@sifive.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_135706_103571_B3F61A44 
X-CRM114-Status: GOOD (  21.46  )
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

Currently, we enable cbo.zero for usermode on each hart that supports
the Zicboz extension. This means that the [ms]envcfg CSR value may
differ between harts. Other features, such as pointer masking and CFI,
require setting [ms]envcfg bits on a per-thread basis. The combination
of these two adds quite some complexity and overhead to context
switching, as we would need to maintain two separate masks for the
per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
support, writes[1][2]:

  I've approached Zicboz the same way I would approach all
  extensions, which is to be per-hart. I'm not currently aware of
  a platform that is / will be composed of harts where some have
  Zicboz and others don't, but there's nothing stopping a platform
  like that from being built.

  So, how about we add code that confirms Zicboz is on all harts.
  If any hart does not have it, then we complain loudly and disable
  it on all the other harts. If it was just a hardware description
  bug, then it'll get fixed. If there's actually a platform which
  doesn't have Zicboz on all harts, then, when the issue is reported,
  we can decide to not support it, support it with defconfig, or
  support it under a Kconfig guard which must be enabled by the user.

Let's follow his suggested solution and require the extension to be
available on all harts, so the envcfg CSR value does not need to change
when a thread migrates between harts. Since we are doing this for all
extensions with fields in envcfg, the CSR itself only needs to be saved/
restored when it is present on all harts.

This should not be a regression as no known hardware has asymmetric
Zicboz support, but if anyone reports seeing the warning, we will
re-evaluate our solution.

Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/cpufeature.c | 7 ++++++-
 arch/riscv/kernel/suspend.c    | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..2879e26dbcd8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -27,6 +27,8 @@
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
+static bool any_cpu_has_zicboz;
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -92,6 +94,7 @@ static bool riscv_isa_extension_check(int id)
 			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 			return false;
 		}
+		any_cpu_has_zicboz = true;
 		return true;
 	case RISCV_ISA_EXT_INVALID:
 		return false;
@@ -724,8 +727,10 @@ unsigned long riscv_get_elf_hwcap(void)
 
 void riscv_user_isa_enable(void)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+	else if (any_cpu_has_zicboz)
+		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index c8cec0cc5833..9a8a0dc035b2 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -14,7 +14,7 @@
 
 void suspend_save_csrs(struct suspend_context *context)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
@@ -37,7 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, 0);
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
