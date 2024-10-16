Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA389D2F7C8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqPmt/WYUs3C8oHhMk3SM+SHEF+5LY1UFFq1DaCQP/Q=; b=PpJvCr102nDWDy
	eMVTkVBAy0EqTVfTEScJQsO/MZ7wxrJ2hekpp6wsXXZa9DRmLHmwtghalmSfnq+Qt+js7xzVUOmt1
	wPWfEFJLl9JSP+hEYKw6W2VAXu3GgzIObxXjh/jftYwDiu9Xn7CHCW49PHsAXt/GERPmrrna5SbDn
	/+R3JCtVLB69omWlB3N2KMaQc6Hv+vDSZumohcS4mQukTb6IJf7LpkWjShA902IPR9+L3+3fYVghZ
	vxz6XQHLcvhfit7MYRtdHe3Q/oZwp/vbM8/UnE8+1KV/S+3/E7uq1GEm9DAu/imaB1p0kUqCQ5alI
	wakXubc96+0F+scK616Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BbZ-0000000D2v3-37Nu;
	Wed, 16 Oct 2024 21:30:53 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ad3-0000000CwQL-1cob
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so158714a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110501; x=1729715301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UwuohaBpRoU5PwojE5+Gkdri+a8AExwGUOzfsduKVM=;
        b=R/yTDx+l8H8egLYKl/tzW8GisFLlH330twje0m3efk2SqBaA5pv5H3NytITyMnzI/5
         oZnN274g9CLpY0MjJqygKxap0ukdg5TLma6+MLeVSPj4kIBXtfOxIkzGNL5Y46o8ILYF
         3hDNURqc/w731Rk7AZNQEMu6oJU89PZ+U2h8eEJXplKSoUS40XuUE7kL/UdLko6M8ilx
         TNFOcqfSedpszNZdV1KGxaLFXY5vw8sCqkNMw7Y7YS7mzkG5wPLJWApluLNQkhbMGpp7
         47Y3AXWSAfwmlkszQoUW9X2lAVtbvl7iEDeTWyfra87K4oV6A/3YHVKb0BWOBSZkHkzt
         mwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110501; x=1729715301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UwuohaBpRoU5PwojE5+Gkdri+a8AExwGUOzfsduKVM=;
        b=Yw0OMMyJPKLk4Ne72dUWihehSUbdahh3N8Afm+0fornSWaBgRe9l4RERGlYPryhjrT
         +uo/SJ3z25QGePdeFwPQBtInp84Rc/00f9nACOL2k0aVjLGXpXwf8KTVRps8O9N554W/
         j/TIY/5QWz4ywdpy8Ee43bFWLcZzuYjbwPOVjmjRn3lt42Jrzmh7CTXkc5+yHhr5KnCj
         7qzShGZ6MLe8VoK7aJhRc8sFTxtQr39IvqjGSKl+iA7XRLaRFB6o1a0VswANSyx/rbuZ
         qlOf9HZxQIiHpMFfAxNGx/Kf/V//PjRXrvZuw7KcPF0D40sSxi3Uk7D72UkWTdOAwuiT
         wZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQd54mJ5feF3EiUPBDe1KMAJQCoOUNw9y4LUUhCtVVGW7usTn4iRtQ0K+6JYMOZxOPpoUb31m9WhvPYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxItp26RtlEImIbN+baJeyfbSXowvBS+1Ma339me/DFKXPrAOdd
	NMfj1jrWaLIoVOv5mQmtSRC+yeb75zUpTJW24av42c+JEznm6bPiIGHdt436tn4=
X-Google-Smtp-Source: AGHT+IErL2Sdr8ec9Qw+ve0FvDLKKtrRKua+qTZ3t0Y1FVqURXGPbdbwTPYS3WSCoIo51bNOUX9RUA==
X-Received: by 2002:a17:90b:802:b0:2e1:ce7b:6069 with SMTP id 98e67ed59e1d1-2e31538f1camr20096245a91.33.1729110500826;
        Wed, 16 Oct 2024 13:28:20 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:20 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 02/10] riscv: Add ISA extension parsing for pointer masking
Date: Wed, 16 Oct 2024 13:27:43 -0700
Message-ID: <20241016202814.4061541-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_132821_458688_A2543762 
X-CRM114-Status: GOOD (  12.03  )
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

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them. The
specific extension which provides pointer masking support to userspace
(Supm) depends on the kernel's privilege mode, so provide a macro to
abstract this selection.

Smmpm implies the existence of the mseccfg CSR. As it is the only user
of this CSR so far, there is no need for an Xlinuxmseccfg extension.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Rebase on riscv/for-next (ISA extension list conflicts)
 - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere

Changes in v2:
 - Provide macros for the extension affecting the kernel and userspace

 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179e..8608883da453 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,9 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_SMMPM		87
+#define RISCV_ISA_EXT_SMNPM		88
+#define RISCV_ISA_EXT_SSNPM		89
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -101,8 +104,10 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3a057c36996..94596bca464e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -377,9 +377,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
+	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
