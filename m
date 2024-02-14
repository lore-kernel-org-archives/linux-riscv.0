Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2EDC48BEC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk6KWTVZ77hMAarrfkjoF4rkygE17pZwCX9EuEM3EAE=; b=TsjtvQ9rdKpD+8
	6liw80TZ8sHvxAujgnUWqAaRy6N46VZddRswGIeRLPG9Y/3bOShGSgcfDUDb6Ijo+uDAwEzBFs4RC
	I68//XDTidQhpBNouehV48C8zF1ifp4COHnbWXcO4lvx8FzYe/uSDYO9J1FhaBM7G5SKMmyk+Vtgx
	MERPEoBYHzozpM4RduB21v8fBKMj86YFutLHESGgHvgLDsYObzQU8Ma/ZN7MtEaQ64/XLaTL2sy/6
	Il2Xy7Ayy7VMFEOBZe5w5ialEMfz2cckBRDNMm3AaRikcrzTU/+1wbswh3w69gSqKt1A8QuswwA+L
	KdtFoadKHWCQw//4wuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9j-0000000CCdO-1PCr;
	Wed, 14 Feb 2024 09:02:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9f-0000000CCci-21Ls
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:02:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso431543b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707901330; x=1708506130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPRsJ6g4sGjHYOROeqaGh/pr9ekDnpVi90clFxCUkAg=;
        b=cwj9o13zQclidKBWKY2UMQkw2oUuhGfHr/pWFVCGkac+e+A5K4v7wya1B7sW2jo2YR
         3C4djTK9Gsr7VauPdPsYjvJNNibNrJ/WhpPLXWa4WMXz/XFJLtjLUhZrvl3/v8bN/M77
         BAbInSWPGXNB/tGaO2gJOqaP7CGfYpQ2XoQKLuIqu7jnAPcfHIEsEVUDC8BXuKJTYm0B
         DE2zzLasvLVOtmlA5FHltueTdOj6sWeczjOR9+7j8fZ/+5dfzieTCWTWd+FIXQXuYDGf
         7/MGtkXlfhubWPRCEwxKIS4XhiMOk86gmRe6xrGzehTEPar1JVQ6+i9LSc7bCU15Lxwg
         cbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901330; x=1708506130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPRsJ6g4sGjHYOROeqaGh/pr9ekDnpVi90clFxCUkAg=;
        b=Jta3ttitsZ2tlDRow2oDZEi9isIlT0LHBlCx+BQRWc8SfcQwljXRIJKsWMMllDHJOb
         sH9GVr73uvbQriB3Lh9UJ275tHa/2LSTQFzXevzTqwLpiZlZsrxQm61JeCFRz5mdNdLQ
         r5L7Z0jqaRplo4THCHdFW0PR9R3ylWP7qQBZUdL4J2kwAxIyuRO7ykJVZbroJ5JDAXqH
         hWhszIV2orMWklCMQTSPyLTnMIGr627fxaCFj5gCH+Uaw8mrPkZ/9TV2d08HEFzpAqwc
         MyI58dYRyefMBAPFQUfh3XNAEqCert9HM954dmBTWOdSKhTHFuGM9ifh65fv7o0h2X2o
         A8RA==
X-Forwarded-Encrypted: i=1; AJvYcCUS4x3Vl8YzspNUbO1EJ4DbjHfwo/ECSkSKPVAI19zLOpi0l1PFrHUY0Tz/pygDzJjaqlgO+kEwK2W8aCgJM8RyFSgjrkcmeVPgZUnj++Tm
X-Gm-Message-State: AOJu0YySmppBjdRtKrZaZcoskFYnv9V3DpF/7LcX/PpCmDbjQEq65trE
	Jsyh8EqxpVHdPjDKNnSiXAdVXtq1eWz7uwcch6Y7+icdkqFFfc/CMXHSpOmUWGI=
X-Google-Smtp-Source: AGHT+IHy/Pj3hWoJS2WkBJmfY13iMBvhueyDKJ5A/yQfFVGdLE2c2qKte/Hxj8onksRoyE5sotknkQ==
X-Received: by 2002:a05:6a20:d487:b0:19e:4c37:8737 with SMTP id im7-20020a056a20d48700b0019e4c378737mr2014592pzb.5.1707901330438;
        Wed, 14 Feb 2024 01:02:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBa/niUfhaptGFm9lpsC7zFdtIR2IEOBXSB0tdcyp6YZbUOgFtfbI/clENDxQCc8TCx8cnV0UJM0uPePynqx9jmQ7hY4b5ASPHIgiC4ZfxONgs2/Bri+S7wIUid9Bd0gcGYFrdshm5ssWW0rX7DOV8ZmKL6m+ulTzguKOnSdLt5I/uYehmsE75yEXVwh5SFONe5K6zDtg+cMtGVcnmC/zs52MkLQukmDPBDfZPnewiiQR2bVV8CVafM5Yknt5+zeqr1cvS7wKO
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id m25-20020a638c19000000b005d7994a08dcsm2476681pgd.36.2024.02.14.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:02:10 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v3 2/2] riscv: Save/restore envcfg CSR during CPU suspend
Date: Wed, 14 Feb 2024 01:01:57 -0800
Message-ID: <20240214090206.195754-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214090206.195754-1-samuel.holland@sifive.com>
References: <20240214090206.195754-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_010211_556472_33E9A8C4 
X-CRM114-Status: GOOD (  12.35  )
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

The value of the [ms]envcfg CSR is lost when entering a nonretentive
idle state, so the CSR must be rewritten when resuming the CPU.

The [ms]envcfg CSR was added in version 1.12 of the privileged ISA, and
is used by extensions other than Zicboz. However, the kernel currenly
has no way to determine the privileged ISA version. Since Zicboz is the
only in-kernel user of this CSR so far, use it as a proxy for
determining if the CSR is implemented.

Cc: <stable@vger.kernel.org> # v6.7+
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Check for Zicboz instead of the privileged ISA version

Changes in v2:
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

 arch/riscv/include/asm/suspend.h | 1 +
 arch/riscv/kernel/suspend.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..491296a335d0 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -14,6 +14,7 @@ struct suspend_context {
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
 	unsigned long scratch;
+	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..28166006688e 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -15,6 +15,8 @@
 void suspend_save_csrs(struct suspend_context *context)
 {
 	context->scratch = csr_read(CSR_SCRATCH);
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
 
@@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, context->scratch);
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
