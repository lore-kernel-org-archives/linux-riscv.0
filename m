Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ED2C7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGZCeSWq0Mcv/vQTYmhKe54m6ZOxidtPl480BdyZsNQ=; b=y5Cg9h/gFcWJPd
	/BSsSToEkPMm3Rg/Z7T0Ksq4mQ6kcdH4dCPuJ3iuo5q91fVyvyCNJqLkzX0bETnkCd8Fjskw0rWhd
	msPAdcQfFwdPEfyKgkiY61dhvIvzM0WSBshp3UlfKJEL0SlI6nHcoPMJ4GwRjDqPg8TPCMO5Wt0mB
	UuxQqT2+QmvE90EYtpetq7B9nC+ZMV35GKI1IgxLUci5mSnepE7Gqt2iMAPevYllKvE2E27ToLgpb
	gIUBmWmL8g/IiKFhBpYXTd3gtLauu2YP+Y6SeganxxcqxsuSTWGRCrMeDyKiXHIzFIegeOgKfMqsX
	GUIZ2P73QxHo3DP3u1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYL-000000003qr-2Op7;
	Thu, 29 Aug 2024 01:02:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY7-000000003g6-3Up5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-714226888dfso128415b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893327; x=1725498127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fidSIArz80o0wKmWpcFbdk3lLWLuSUf3Uv0hxlg4FbY=;
        b=YMwJwp+7HCqLdnn6x18w+7CUiqPzGyeWzloJNRZDUDfdz3WbjMvnW99CWHEMkix9/P
         IxYlKFA1crrJc1AonmT/st6dCr8Cc9Uh3XeXg8pHNQghhw6yvv3XbrC/1pq8oXec8avK
         j2sII/B04ins++nL0EucbkZdB7MQcebT1nAGZi9WKRYZ4hObQb5ifHPDJhFH68f/VGU3
         pFnz2PSRw8oybbtyC5cOectem+B3jinEteASJGpGZumHpqkS0q1dh5OAYS4MqT9Tvouz
         bWN0DQBI/siGLF9jqxm87b7jkl3Wr6yrBW/6CMaSPipRaZOnrt4AtYu0EYnqc0uQMvRw
         qvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893327; x=1725498127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fidSIArz80o0wKmWpcFbdk3lLWLuSUf3Uv0hxlg4FbY=;
        b=sAiIkmivrLGIEDyk1BKKTiR5RYtvHrSgpgza8JIUgQf1izSj75/ys88Go5zj44z9BW
         9PJjpufLtxgtESkIxOtoB6005A4ztumri6rBPIzCy8vSegewRZRsu4Fe1Z859uqQNUgk
         RlTtrkT0xn7U4AW0wQK90JIymxtEdJmyMsRy+foTJ7GGfQK4oRmEDQowH14ESooA8mN4
         akh0B73CDn4XzhFPl2YIQTIOxvWp/HpAcC9dh3GXXSLZU0cvTdzZbF7ri98zgVQWO7k8
         E4gfQEmtZTML3WhiT/35y2DSchq0slD7LMuETjDIxa+OdlGWIhXhM4R7wArsQ4PpuHoB
         BAxw==
X-Forwarded-Encrypted: i=1; AJvYcCXMo4PcCveF0dO94aD/qSpgjuucAtf+hyBkcp800sLjggaSiInptHBn6WPb+Wa6B3Dw8RTUcVolByIYTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6y7igjrye2mUb1ANgTfLH4IlXAGoUJqlXWX1S2KxwUorlRd/T
	QpaVNVsL0xTMRGGmTlAXmu/IHzWQtmpUoZUaxqjIL+Ee4Zw4ilxjcKFhsyg6V/Y=
X-Google-Smtp-Source: AGHT+IEBNQtiCiCgVLUJ84PQe0m7uIiW6abUHQVzRmj5lhZHlZn1YYt8QBg0ustTrLy0CYAITZNs+Q==
X-Received: by 2002:a05:6a00:198d:b0:714:21f0:c799 with SMTP id d2e1a72fcca58-715dfb26b96mr1439189b3a.12.1724893327118;
        Wed, 28 Aug 2024 18:02:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:02:06 -0700 (PDT)
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
Subject: [PATCH v4 08/10] riscv: hwprobe: Export the Supm ISA extension
Date: Wed, 28 Aug 2024 18:01:30 -0700
Message-ID: <20240829010151.2813377-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180208_258175_2B324A5F 
X-CRM114-Status: GOOD (  12.61  )
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

(no changes since v2)

Changes in v2:
 - New patch for v2

 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..a6d725b9d138 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,6 +239,9 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
+       defined in version 1.0.0-rc2 of the RISC-V Pointer Masking manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..6fdaefa62e14 100644
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
index 8d1b5c35d2a7..b6497dc0e7f1 100644
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
