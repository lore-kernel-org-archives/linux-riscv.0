Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856DC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+rxknPgtGpoPgAibMURl4JqQLEtHSHQgT82qipZKKs=; b=JLLDaJjvGQG1VD
	6b5EO1IZ9MCvm5Cq5HJAjiXjjA/SBZ+JwYAhwQMuBv+7TDpyqAuFRIQZRjOafeE8Z29c7AmhcMEXB
	Dc3Rc3RDWDXhOFgDsBMdn+1VCzvUCpBZtBQAFR1PukF93QEWmIqj1JHTOPZM4XuPdkK0WPCxR8DkV
	VeMBEb55HoXY6388xIHLdmk/Ps6K4CEVicYROYeXW4GoMLCaihQEdHRh+V2mNaO7Ozhptks8kdkiO
	DBnWf8mTrCZu9LNpbxfU5wIyUYPaLzvKYkaOlpyZ4U/WBfGRte8v6SYkS520VRta9kMm8D2hE5o/w
	Eyi0dsl7cbVmjjbGTccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2J-0000000HTvQ-1tnA;
	Thu, 13 Jun 2024 17:14:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2G-0000000HTuI-0iAy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:14:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f717ee193fso9876445ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718298891; x=1718903691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWKKc9/VVGODzNuhTkLxFLmhIceztWrJoblOszvDngE=;
        b=mdvFzZLTuTZQgN5tOKnuffHYo0Gjzc7WkOpCW7IQBAFGxEUSYpX4TyY/2ddKbmBUqz
         qQH3fBrbkd1Gpw4Ed3Uv/hpLhymxdRgaYUAxlgXEwxAxEXPkziy5IHEDxcQB7LwEKVB5
         7/c1klaXC4V9G88XN6+XU7/QbzMIUv9bFB3GvzOrqld0t7xJ3Do4oK332HqVlD/rx5UE
         pzBktwIR8UBun0jQFj5oyATjuFg1/LgwCuwETbjSNZAiugU9IsZL5sjb/+f9tsMA+eMr
         oTO0Oy2cqbPXvrYcm0t6q7iAu4+7P7TYQ7/QM0XF+QNX7Up5cbZiZaD4ssh9tRagOv1D
         Tghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298891; x=1718903691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWKKc9/VVGODzNuhTkLxFLmhIceztWrJoblOszvDngE=;
        b=AfW6+VNNUfWPMU3QsurAJX+Avh5bOkOmcF9MMFLcCucNj245AUTo1pdCVlbGqueGSD
         VGkiPl0rLTmwPLB1+dubNYczL5Av9w7iQGtCMk/vWZzBsylv9RN1cb5B/ExJdMCprOpe
         6lVdAMcDY0PChjab1nu2x6FAj/qRji0H58T46QNdDzJ41kdBv2nu9KVyI3V5OWh97ugU
         SSwy/p/FBZ6WBIsN8XZcQXXfyG8SJpGC3RFOzt1LlSDHZhPPu2SElb2Yd/OfrMSQji1V
         5xmZlHBOJK6Y6LnxTrw6UFFj9Nhiw1DBm7vOdnM8AtQaSMqRw+pnoVAG2d3iaQ9SQV4q
         E43A==
X-Gm-Message-State: AOJu0Yx9dEBHv1GassLTlZ1VJfqMZ1W5flriDuXad8lKJMC6+qHueJZ9
	wlCwwR7S6+B1gRJwgsgYEz3CeIl9JKACYjpLw3wcpepOIlF54kYJSZmNOIq3wQ/ty2nNmgvntwm
	VabfPK/yVUDxBWAygjmloWCFH0diR7nX6Wq9kPcEVTwmznsr9k1aQ0AjnOOhyyPc5ucRzQBTQIE
	5nyQuVf3yhK59otpR2gwmVKqfV1f+sjxjoKIOUDMgXC6loKS82LF2Xinkz
X-Google-Smtp-Source: AGHT+IHklgQWIpYY76YIpc507mgBwe7YRfUtJ7t8FaDKK4F93+FO1RhmCjEna4DXn6WioYV2N57SxA==
X-Received: by 2002:a17:903:244a:b0:1f7:1a31:fae8 with SMTP id d9443c01a7336-1f8625cf24dmr3968735ad.26.1718298890952;
        Thu, 13 Jun 2024 10:14:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55eb0sm16445035ad.18.2024.06.13.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:14:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 1/3] riscv: Enable cbo.zero only when all harts support Zicboz
Date: Thu, 13 Jun 2024 10:14:39 -0700
Message-ID: <20240613171447.3176616-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240613171447.3176616-1-samuel.holland@sifive.com>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_101452_231773_5CBD9E48 
X-CRM114-Status: GOOD (  21.45  )
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
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/kernel/cpufeature.c | 7 ++++++-
 arch/riscv/kernel/suspend.c    | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1d6e4fda00f8..4347c9f91dc3 100644
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
@@ -768,8 +771,10 @@ unsigned long riscv_get_elf_hwcap(void)
 
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
