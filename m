Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAEDC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0HplEuqUtHSdISC3rLuMWiEtlxAFYwRZNkd+4ZRu00=; b=p36CaCeTMNHTcQ
	3x8dlhlUiFuEraXiBq+d+eCGGXMyrH4t21dcMNEPzfVOnuvonQsviFP7WQT8p03JpYV/qpna5NbnD
	i8Ca0GmmRnooDJJQiBvPJfsP3o2/odvGHSVAIVnaEW+50Qz1R2zMjPKn65SnCtarYuK6Km4NCNvqO
	lJ0bFR9Y3jyHqL0cOQKkGUXv9g8Q6CkWbwH2Hjs/6DAPrX16DhGnCyCCCBahzsyShzT7+k1z9AUjr
	00Pd23NR3/cIuGM4hHOYe/2YCVDsHbn5gkMwEaNvmf9ELTTZ0/iY7Mpp/j19ZHAo6qhN3OT2gJvKY
	RRi/bxpPa7EVdOZJg0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY6-000000003ey-0mGK;
	Thu, 29 Aug 2024 01:02:06 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTXz-000000003bm-1ODz
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:01 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71434174201so124152b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893319; x=1725498119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvnGAjQNY6ccaQDDneANEaSxBsVmyy75aYzWJepO5sk=;
        b=nwjhCyoL9YtP3mAhLCRDlKMtlAgFCrjGtFANekfKmmUsvTycIAp0JYkoN2J6HNa42B
         ggjgveGo0769ZDNcLZokmd90oU0W9moDuqgrcWOWUrx1ry109n3GkMclMtmZsYLnDbCA
         6B0PMwQJ5148z+ZFeI2UxZM0X7oVa3u91/Nv4fMahhq+7cmXZV1e5km7myYYuu09xNif
         c4LVi3UFRp5+Sgud8yOkWzfOE0fDRda9OhjiIW9Q3YWkGlEPMXs8r5Y/g3jji2kTsJPH
         3LcJPzqwBhtrOgR4JMZ7tFqpPi3HxI4UQ3tKOWNqnUFvUeaE1FvSVxeP2bFx+0tqxR1D
         /VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893319; x=1725498119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvnGAjQNY6ccaQDDneANEaSxBsVmyy75aYzWJepO5sk=;
        b=tVYtzf7PsWHJ1ueG6k8TMQThDgX6QbDiCNgrPHSw2e/o2dBfwLOe0XYgD1c5mSYEPg
         P1r7N0/pmdAKWpx8T8iLZeF6fFbnCSE4w4zNXdvC4hvPzjyr57oB3bQJAjgDOty3gmxf
         IFOM7g0pD4oyTI5ZcXAY+gpdDBWcq1zSzw0Ku4kfrqFmjqILDCgvxuikeZiqy6iRzo1u
         CBT12InJ581bnlnKUEsZ4O1IKw9sWjlOV+zw5Z36jA5midFklPw9PYBCP3+Qmkb4qcC8
         NL2ZaT7hgkT2FcoB6obUc2/kr5wweEzzYVPA68JC0gqJjc2m72MgzDjyJj77q9uIA/kh
         zPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWNOhfueQh4ClidL24PT7MH8X0eq2ddGaw/iis+bTZS28lf0EpCBsXaQTi8XVZa624vUGY4dG2HOAERg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfWBh9nyv9sBP7OQ6hij1vwnooebRDMyAcFuE/mClKfh+puKb
	gZG+XXcxXf8UTfzjqYPeeKHh8fGERVIAs7DxwrjYyGtihWO60XVFYR9DM/kGkps=
X-Google-Smtp-Source: AGHT+IEGopUyFxNYKdi1Fm00/px6XJ4FQ28S5BEmNcwqyBZ90BZIGqFp0Q1Tx11Ndv7+QQzMV9yqMA==
X-Received: by 2002:a05:6a21:3949:b0:1c8:92ed:7c5a with SMTP id adf61e73a8af0-1cce1011e48mr1298963637.22.1724893318753;
        Wed, 28 Aug 2024 18:01:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:01:58 -0700 (PDT)
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
Subject: [PATCH v4 03/10] riscv: Add CSR definitions for pointer masking
Date: Wed, 28 Aug 2024 18:01:25 -0700
Message-ID: <20240829010151.2813377-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180159_468520_C681FE89 
X-CRM114-Status: UNSURE (   9.80  )
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

(no changes since v3)

Changes in v3:
 - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions

Changes in v2:
 - Use the correct name for the hstatus.HUPMM field

 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..fe5d4eb9adea 100644
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
+#define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
