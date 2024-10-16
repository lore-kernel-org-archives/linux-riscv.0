Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E488D2A559
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cq82IUQ0P4E0bS3YWUKHZv9b+raox79LHPPGNt6mqxo=; b=GRgXRqPMtZbrrl
	r+coWWcsfI3QbZeJrbk4xA/1WsMxTNgq444EETJJ+6+69J6ileUNal8RijYFY9KhWhvHZ8AztOxYS
	LOoBtSfteWnUigEKyX1eGTB6+/Lpv3dvaRSS9T0/dG4kpI8FX2+XYqxMgduIfygTUx2qYtKKDJdKt
	6okl/Nz1hL0t3yHEVVUkOtVVEeYpX2WBWymngiIfTXXxCA1MWotGmXReCa9gXuShaideE7M+hC5Nv
	aTqKQQpnVsdDpSsYV1foTUr9UgLdIdOpy+R7NsG/QRilTQrJok4iDb1EuGZyJsfIxgUwgai127y+6
	gzITlv9WaLXnRWYxHgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdR-0000000CwfH-3Wnb;
	Wed, 16 Oct 2024 20:28:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdQ-0000000Cwdq-3LLV
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 20:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yDDaRB4PMyQ9/gql9k5VOFo/XTjSV8DD59ducmwypkQ=; b=fB4uI0GTRfSRkPj34F+Bmu/DFG
	OBFAyBDQmqK+2AXYO7/QNkxLbkLb7CUOV+GKvWGcC8fKkCj8vKh3QBCjExX7jjGbdZ0559VJ/USBR
	BbD4CtvfItc9qApG5XHipY7MVOHTu3gFCcnONWfbNrj4RvYz6BbXYuUP+hr5shXpDP/dblbYr7nR2
	j7xo3NirXR+POVXt1G1CG90+u20O0gmfoQth8nQucWZdMgaJ4rl/RDv2n524+BLucUS80m70OCTep
	ccXN2uKXXDzNYtD4KIcoTJqFKofyQUwJI9lcU6Et8yU4xxS7LME22c6xB9rL+QonUpdqk+a03Ihsl
	KZ1NAg1Q==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdG-00000006u86-203o
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:38 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so158837a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110512; x=1729715312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDDaRB4PMyQ9/gql9k5VOFo/XTjSV8DD59ducmwypkQ=;
        b=ZsXa1sLs23oME9v/z1udNv/pPRLfT/SoKCvzO3ZE5w5ZEn9F87fisiHV8miy8T7qyJ
         bDwO25y0Cl+bcicNHPPR6AEtQVOoflNYYGvIGAj8gaVfK5QStSUdIxJbBX9QWyGxWkvC
         HkJJKwx5lI/Tt1pVdh80dVzB0HC9hHhtT8j/44bsoLyJCQ0UZLcYkBpcONKuPBhQqy+c
         FnhOOzyVoZl7NFPn1qlZ0Wc/4ouZdWLhtT++rx05u+dt4NFI2nQdolWYfsY6KOt1oK+Z
         SgRvdZlA2wnF1KJpPAScArgiFKqUw/Z7on8UcTNokoMkylvPtlnx7VmbgHmJH7faAdHt
         GSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110512; x=1729715312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDDaRB4PMyQ9/gql9k5VOFo/XTjSV8DD59ducmwypkQ=;
        b=RFKMpUQoQepHlA1vunOB+cbsmmAEkJDqgLAatLizTYP1toKyKpgeQXd9yzMG4LZSsf
         sxbiWm17+HeZzyrpAyVOkNhQrd/T4gCUXkW+iIaZkn+qQwdSWpQml6IE00Gf+30q2REt
         IXrc8mWiTlUAIbgxIAhtdLdjRHLHJwZKbrI36OEABLxy20mCbB+IT9AHBK6KzLg+OAY3
         uEvtXez6cwNqvsz+/+zKADtwpppLIWf3zY7EhZL9siqU09yAXFNyzFMvTDh8s2a4RvVz
         N10UrltI0NRT+qMKVrpl6uYf4rzc0a1jvxpA4dm8c26QoXu+MsnjWXaGKxA1xyswqtPh
         w7yw==
X-Forwarded-Encrypted: i=1; AJvYcCXAx4pHzUjuT8fk7AJQxUpQlM/x41FlCYUkvCAZVsFV2vBbWv1lBCwX7U48dgbtkW6R9MivPdAdOCGOSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziFggdK6A1SurWxe5yzjxxrmv0dqWHX6Zwy1qbopCByWHieWa8
	YfDr/PxlWw0qfBlhswwXuaDk/d6JT/9Qu4upWs9TVN3Wof54cMHCWTuxhDFmOFY=
X-Google-Smtp-Source: AGHT+IGd95Nmg0ggJul1Nr8wTLHIFKzUNFoXxBz4pua5goLKaPs4AurYTi27dLM3qyJ4bgLA2nsYeA==
X-Received: by 2002:a17:90a:644e:b0:2e2:ba35:3574 with SMTP id 98e67ed59e1d1-2e3152ca49bmr21323024a91.11.1729110511688;
        Wed, 16 Oct 2024 13:28:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:31 -0700 (PDT)
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
Subject: [PATCH v5 08/10] riscv: hwprobe: Export the Supm ISA extension
Date: Wed, 16 Oct 2024 13:27:49 -0700
Message-ID: <20241016202814.4061541-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_212836_749107_FDD68286 
X-CRM114-Status: GOOD (  13.23  )
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

Supm is a virtual ISA extension defined in the RISC-V Pointer Masking
specification, which indicates that pointer masking is available in
U-mode. It can be provided by either Smnpm or Ssnpm, depending on which
mode the kernel runs in. Userspace should not care about this
distinction, so export Supm instead of either underlying extension.

Hide the extension if the kernel was compiled without support for the
pointer masking prctl() interface.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v5:
 - Update pointer masking spec version to 1.0 in hwprobe documentation

Changes in v2:
 - New patch for v2

 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..b9aec2e5bbd4 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,6 +239,9 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
+       defined in version 1.0 of the RISC-V Pointer Masking extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..868ff41b93d6 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..0ac78e9f7c94 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -150,6 +150,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
 		}
+
+		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
+			EXT_KEY(SUPM);
 #undef EXT_KEY
 	}
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
