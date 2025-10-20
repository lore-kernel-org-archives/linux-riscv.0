Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B9CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfCx1FwG4J8RmiuB6HcAsr4FoJ6hIh/hjTTcp2sNhkE=; b=OsIQe+HLwVIxlJ
	ppFlFMYlJI2ipLb7w+dWOim5u012i4dgEddHybRPHQ+V2UNytO6AfcqzmdU/OCCWx14qhdObCeRY3
	kgLE+z3ThYOfdI7fhvUacV21HvXKbPdqSco1oyWJoKuGHX5Q2IlyDONtFPHW/cX8a7LIaUh2KA1Tc
	c4MiPKD7javxEDSsZ7dvX+7zZAKw7dsO3lc6NlDlrwgI2qQoYkIza35QvpXiFM1AZQGAidQMm+RiX
	mnSpRBFrxAJytCup3fv+wsqbfeZrTWGogww9NtB3tTv8M21XSC+0kGMX5p52ZMJszzfN6mT5pgSpp
	Wo73VZ6cxTXdUqfPPR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwP1-0000000EsiH-1cez;
	Mon, 20 Oct 2025 20:22:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwOy-0000000EsgF-3tAW
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:22:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7811a02316bso3295247b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991764; x=1761596564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=IK9h+fkY4dXnCTCbKQbPO2ayZq/PWOeqmopiGR5kWTcx8uWoKtKu7ZzSseID5+AKPC
         ZpTbduWsdVo0oHIY6mkNwf0Dg3slGqybwG3m/DKfrIPrl2sQgG443PKgZKCjsMmyXvIp
         zfczwVWczjpgJcztdnq4NFI1vMFjsRcNgrDcPkM37pzzxV8TVhWj6v39pKe+TKk4zheA
         hsvtnlth1mvKXs67/0tD+5RO6VdWAtnmfaapE9FBF3IeKbFxLRPpS607MmWyuXwXRj9T
         4qn1vRx9iN5CgPdYmcuxJbCMgVH4a7bioYebS8uIRH2ePZ7jnQbsiYOz3LBMvqOW+O+z
         av/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991764; x=1761596564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=aWTbqG70YDJ4q6sP6uuzE2JD2V0NPlBeVPSGR9nnnXQjnUuibz1fcYkCNdaekRO9ee
         ewCH1eEs6XN/cS5uboRhPkhqmsQdgXWmcEa7IX7hpygffHfVrsKQrNUcuJMiHRRdERYC
         POVqr3MerXdvluPbbOuss0/kdIlf1tz0O2lp8nkHPfk7v90uZgd3LjeKCGPL5HMfKC/v
         O895N+qsnFhZ1Dzf1mz+4aszmdbyuR51kXZMKlKjeSCCSCPYC0pPctxVO14v0VkL/xeL
         aJgtwTKiRzhyOZYeyngszK1ZAYsGsKAutCUiR1qMrLyZPtBt0DKD+AlMhjhb6/0j6O5F
         EDHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8M33emlMPDZyusxiqzPRsBVx26xx18GKQuDQ3YmEAVu/cO7nD05V20JyjLeJGi2UWkJ+XS9fPHfve+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqxEjnD7prl//VWJHPLFzIiZO2DUEFrEMIVSgWQ3VpyCYBHFa
	gKTgQpCNR49eQVDs6qvQtc3nic0amU6Vy5Pr9SsTu8F/mY4VS6/MmMOwcvl90BVx33w=
X-Gm-Gg: ASbGnctSRoxyrr0GwG3Sa+jgQWNNzJ29VDXWds1dt/KolDDPZt3Fe3IDgEskywTNOLd
	E7eunQlkxi2eUtqsR3YWV5JMA1cu/G4XxfbbS11W8CR46bxahzXQisyZ3TtSvAcEo9+2qq8h/n4
	p/TZ0FTKx/oEjQYk+tvyd0F3O3gDFHVjW+6yFIJ9ougGUOMuQPHstmDuMSQ0g/2rSihzubxTaNX
	ymecuBTKioIjEf6lUSUQLQwcLbStgxAALgFdEQJ97+uV7ZmgxKUs368ckviS1EC0bSedqDCm1C4
	DMfXE0x9PWD5myfHTl54HYcZNGcG+XMvE1vRoEt8y893HWIKcODUBsTmA4UuXFCz6PLNm01Y43d
	EWQRfFqyMz0yMXmoxGz9Sb8XwOVue/qzLA5Nz6e0m12MMsOMRAw4/AehG4q+7eVV8zbz8ayQn7o
	M2WrBBYDu4/frA7oPRxHrE
X-Google-Smtp-Source: AGHT+IFYCNd5k3pGg0Gz/iIE7tYiAa0kkuCVaIcl8Ah/rVJcGwXUTlIvT7nX8rovlHoPNgWT7bMyjQ==
X-Received: by 2002:a05:6a20:1592:b0:32d:a91a:74d8 with SMTP id adf61e73a8af0-334a854654fmr19468716637.27.1760991763968;
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-3-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_132244_983948_385A4FAE 
X-CRM114-Status: GOOD (  14.98  )
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
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
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
index 67b59699357d..5a1a194e1180 100644
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
