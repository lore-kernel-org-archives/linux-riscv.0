Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA3C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttJ2njPuYs510nkyDKj/HerGZygFyZvG55DySvbDvbg=; b=BoETaQxjnbTAli
	FnGFO3OYQtt6c8/C+lJnoamPmIQ2mekdfpsc73B6A0gLl1cLmo/ak3gfpTBfkPnOs+TwmZp4VPan1
	7aLsbSJCRrhV9XRRkEZs75W4fK28kdftSR4s4hcCdD533JNVWuqnaBE7705mh3mjSHiA3eaYm7yM0
	Qz4+G0c7G1P+k8Cm6kncAbxoZeOyUi9dhbwOr3zbLPSqllHCVmvyEVWcoc2rNcR34uHqNkUDDNjVm
	Nd/u2QR7221GnTfUoZ+oaGZBPGj4Nz8v9AVVmqA/13dpgedVXX5sKBe6Sqn14SxmKEaR/EbDz0DI9
	ObSuumDM/d8hPJcCoDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQA-00000004V6b-05pk;
	Tue, 25 Jun 2024 21:09:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ6-00000004V3y-2N3R
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f4c7b022f8so51409565ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349781; x=1719954581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrGWvMN3Ht8MgkCDub4Kzj37NN41tMPLHr9Zd0plWWo=;
        b=DcPnnYuvEDyLblWsFHUcuvvUfzobI22f1CIrXVTXPaJH7p+8SvJ+mpZx5jzqpqMKEz
         DNzfV0VOOP7mCCeczhl9FiR17tzwjTyeGKmhkSn2gNNwiPOTp2B0akCuGN8UDlS2wbSL
         uNa9W+i8ulUqZeybAY3N+mOhvNs81T61hIRgUiA+Xn9QoUzxYgkRK9HY988qgg9FXeoX
         9lodOmxBJUwuWeNlzi8Bpqc9SuVr6IZIPM8N0St0vWvNJ/WTPSVPwpeB7pQaNlGGrfoq
         vqsTKY9sH8VF+0bG25bchD9TC1/XxZMUk4g1vD9YRdhC/OW3r5nfMmEIanzpEfBpkUfT
         1Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349781; x=1719954581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrGWvMN3Ht8MgkCDub4Kzj37NN41tMPLHr9Zd0plWWo=;
        b=mvMX1uCCZ1Q7SyhIn2kYNu52f0nTBaUSWbLDdADy36m1JP9nvCw+bvXCmS3qagjRHW
         eIO8Lw+YflN9fAZnJMEQ06NoSZOCjSuYTyPaM0glZLBaBiEoXhsPOS4p6pHCsSAhlOn8
         LDH8w3bIY9L7X7RTMxX/GCSv0b4SzUtLQbNwdSa9eZ4wF7boazYyAH8728wMjVyPe5Kn
         ix0qR2DK2+CWGcZxi2yh3kJgtIPtXyTUVAFN+nM1c0GJMXSHdgqkC3eKZ8YZPdDdKKhM
         H89RuFUcG1rP1zIf/M5FBIPx2T0Fot7ZbiX/+unPl4+9nKD4O5O5EMrM8n1ZRvdXlfP/
         Ub0A==
X-Forwarded-Encrypted: i=1; AJvYcCUXrVMNHckaxKyikoQ+kmMk1p64EembffAjSGl/9sb5GquzfsKiSukn7JwUijJqGg+n4SlDBA35pJW/rYvZ3SOCF7eo/AXOdeuANNHSB027
X-Gm-Message-State: AOJu0YyYm9MjZYp/7g145EUxm2tgTOtLklMWSeJfq0CA5FuKSQbXAjwc
	KSZvVVyjKv4B/bPPUBHDaZcQuV5HUL+SZ30RLd9DjZA8jNbHACiYtBu9t1rhf4eCm8i+/o/v1Vb
	q
X-Google-Smtp-Source: AGHT+IHVaMXVM6zxBwAZCg/cGqYarn4awLSQvEqo6T1mYUpeIGRyF6rap0HbZ7xb98QAIxlepqf95A==
X-Received: by 2002:a17:903:41c6:b0:1f7:35e0:5af4 with SMTP id d9443c01a7336-1fa23dce235mr106984915ad.30.1719349781063;
        Tue, 25 Jun 2024 14:09:41 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:40 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 03/10] riscv: Add CSR definitions for pointer masking
Date: Tue, 25 Jun 2024 14:09:14 -0700
Message-ID: <20240625210933.1620802-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140942_725059_D0EE22E8 
X-CRM114-Status: UNSURE (   9.84  )
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

Pointer masking is controlled via a two-bit PMM field, which appears in
various CSRs depending on which extensions are implemented. Smmpm adds
the field to mseccfg; Smnpm adds the field to menvcfg; Ssnpm adds the
field to senvcfg. If the H extension is implemented, Ssnpm also defines
henvcfg.PMM and hstatus.HUPMM.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Use the correct name for the hstatus.HUPMM field

 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..5c0c0d574f63 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -119,6 +119,10 @@
 
 /* HSTATUS flags */
 #ifdef CONFIG_64BIT
+#define HSTATUS_HUPMM		_AC(0x3000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_0	_AC(0x0000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_7	_AC(0x2000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_16	_AC(0x3000000000000, UL)
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
@@ -195,6 +199,10 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_PMM			_AC(0x300000000, ULL)
+#define ENVCFG_PMM_PMLEN_0		_AC(0x000000000, ULL)
+#define ENVCFG_PMM_PMLEN_7		_AC(0x200000000, ULL)
+#define ENVCFG_PMM_PMLEN_16		_AC(0x300000000, ULL)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
@@ -216,6 +224,12 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* mseccfg bits */
+#define MSECCFG_PMM			ENVCFG_PMM
+#define MSECCFG_PMM_PMLEN_0		ENVCFG_PMM_PMLEN_0
+#define MSECCFG_PMM_PMLEN_7		ENVCFG_PMM_PMLEN_7
+#define MSECCFG_PMM_PMLEN_16		ENVCFG_PMM_PMLEN_16
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -382,6 +396,8 @@
 #define CSR_MIP			0x344
 #define CSR_PMPCFG0		0x3a0
 #define CSR_PMPADDR0		0x3b0
+#define CSR_MSECCFG		0x747
+#define CSR_MSECCFGH		0x757
 #define CSR_MVENDORID		0xf11
 #define CSR_MARCHID		0xf12
 #define CSR_MIMPID		0xf13
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
