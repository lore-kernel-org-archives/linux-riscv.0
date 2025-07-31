Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F16CA0EC2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7soMP+G44zDDFyu0/v8mwV0KhHBOymYzCwf6oAk2y8=; b=BzZ9rd6s9RIeXl
	6oGRnt+pcRKZI6yiV6hxycdWAWBlhoubTxtAq2X47RoLB+uuyAAhiFn+n4JKif1Lr9EmkvjI7injw
	kRXrSxUoMwQ3amcbBew5q9v54wHZM2V3V1fUNRSdh/nYaYDK1QW9D1YmXd72mQFyr+FGAkvVOD+lV
	gFLpzJtVgoqKyG0bwfKMDgQuG1+iZCJK6C/Dlx9XPgAHvXvI4DlwJ2LGXA4VfMxcnDZJjBiFz1mh5
	/F5bwdF3RtEZMxW+5RRiIBOcEwmX+Ns+L/cPrSkuwnUY4RiVG3xcvwABGPPTauKgsbgMH2KFuIKo/
	Fec5klyLlz8lh2w21/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZg-00000004bqd-0iDr;
	Thu, 31 Jul 2025 23:20:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYZ-00000004b29-2qqF
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76bd041c431so1168365b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003967; x=1754608767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/zH7pR/lYDXTCsVz0jr8PjmlJlgvFu5fq+fqB2fhJ8=;
        b=zA60qeiqKL5WLrKNJ4MgR6crGLTR8lmLV2hLFmTZ7K3UDidk2ktYuk2neF0oTKRvqw
         1nr/7oj7bYfh1GP3O0ZkqrQScINFbErHruYDivJ6dv2W7xMyAyPf7ELR0x1Kxr5Fzkbp
         qyz/n6iaqtgJlLY4RfJrsG/KgXAySzHG5GOj2vBPvkt3eXLo+HO8aqvBnSVhW67dE8eP
         GXBZOjX3HYsQ98ind0ruPC2WHhR0rFrFMEMimcrhdt0BYH61BcHa4nzqDMHO3gG7d3fH
         eCw3EnHZuCi5skTkr8VGidxCNX+T5TkMDxg3ZKesMEaB+rwiXCpBiCIPslPFmIxcti0y
         8KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003967; x=1754608767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/zH7pR/lYDXTCsVz0jr8PjmlJlgvFu5fq+fqB2fhJ8=;
        b=ULK/S3ydoYIeANE/pX2R9bi/hps3uZEyP4LDOiynuq3RM6O0iDhPNBaag+J4yXvuQo
         APjwYbRg1xK9CBrSK8JNEIlvTYLyGOr4kwxcCFNN4aExSaS77wKbRYWAxuWCQTE3UVnh
         uTK3JnlzpSVsEmM/cHMJH/w8N3xdBnIsqadUkIEpNWH8rkjBzwAvYQ3H+Np8C/3d+fRV
         ZPlF4Mm5xXccfuHQNmgsM9b4OfLn1kdHBHjKLIRVpNK4JTxbcB+j8Sp6oHery2PN6JKL
         yThnW7otHFyyX9iBrQWwYZbxRrY0ZAGZ2ZoZdKKAb3jtlYBOMgpVfBMsgYJA3VKTnX57
         xNxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwXnWIX41AnDjfdqIDO16nK3cAvrD0Rg9umNjtrA3KNJaP8cwnp7Kc7u3buY7Rv9KOi/8LvnHMHcysnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8xbGykyBDPwprnAHovNc68n5u7LWn7jRJnOIP1DCqPMKdKmGR
	BAMwOZUPweWBPg0BUKfB7pZvSsSZuhWUkK8uVcw/vYgj/UiZLW0UeJuQ0qGcy0Wawpk=
X-Gm-Gg: ASbGncvt4blMoNfadLKUiWZWW7PC4p6rXeXJ2BIdiu1QrklFyFXwuDjr0rVAUYan4Zm
	ZtJrxp21C1mZ6JoPVkyBWQTtSzY9fYn/SO//sw6qkqg1PniETPYTt4laG37h34DCDilXl7Vjhzy
	n0vEnHAub24wNS03BxNN/Bqp/ji7IAP/et5YmuPNI4Kig87Ia4REhuR/62a+r+ptEAXjH74uyuO
	Z2GFakilKX44AKfFDt5W69q+5Y80L12C55gbOvYc5VdbqKW0avmHgODL4Ftx5A/ccgs1pYi1lI7
	uUfaW3I6OTfGi6piHMzQHG7Tn1zNvpLZA4IfyVl8yGu6SUHKSWhExyXZ+ETZBttAQXqhXGMzq01
	ThPGS1oXVXKxgpH+GO1amUC9oThASM1C6b2f84J5qARg=
X-Google-Smtp-Source: AGHT+IGYtHbkIIYCjaK0pApil9XPoWC3HM910LxxJmFY6X3GTvEXVCJzuEQBTa4Y+eDTOHWGTwIO1w==
X-Received: by 2002:a17:902:ce05:b0:240:7753:3c22 with SMTP id d9443c01a7336-24096ae530dmr117950085ad.33.1754003967144;
        Thu, 31 Jul 2025 16:19:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:26 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:13 -0700
Subject: [PATCH v19 03/27] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-3-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_161927_730539_15844DDB 
X-CRM114-Status: GOOD (  15.58  )
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

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 9430dc198caa..c5c01efba3e7 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -156,4 +156,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572..d38136672650 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
