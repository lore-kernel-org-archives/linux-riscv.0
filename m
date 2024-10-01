Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B764CEACE5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP+CuQCN/GNDyZKACt/d7rzpMxUszrKrG5KztARVrAc=; b=jsjH0LTAl77CPA
	R5dxul7792W+ichlox7/d1Oebjfdy9vM/aydWxlzmX9wN0M4P7VIVRb9FyJz9rxCV+qGqdtlGJn7f
	at902JWIxYmZtrGc+iw3ueu1gTu6xVampLnmj9Tx3Uz73226SN8RVFsOTgWgcGcHwQSuSHctROa7g
	EJ7KxqLlTLV3uGA/jICKCN2+5+hDxedTKfLh/polWlAYYjOpp9WdBYQhI4rgOFYukvRilRfbRLK3+
	2nxyuTwf9w8UVVWUBtMupDoOrghEkY0dJ8gvGdoDhjHSW8G4DAGEm3ieyCWTySRYgXBflALlJWqgV
	ubSDP0FlXlNPtqIR/wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbc-00000003VRR-3c3a;
	Tue, 01 Oct 2024 16:20:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPF-00000003Qzt-2Q9F
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e09d9f2021so3823174a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798840; x=1728403640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+5BUiXk0qE5fwdGMgQslVF9cwH/K3wvmujTMdEKiHU=;
        b=If1MDwPSESgUHnDyVGidoYHbDzFTF7II9r8uGxnnu9cTb+rq6nVxmVyrVSDUB68q+M
         nv2eO0l6NXYbmnptZaz5t7djDRFm1uNfJj0wC/PrsNgAQd7t/BpJa12QSfI6Qr2FLbhQ
         5o5+EAMHN0rWGG8B/gW/PZFfmEVNqgbHfo3lFfFJSRudjaZF2N/umlGRKGieXjCI7JVE
         g8r/EUiwFo362UI/yS0+FV4wWPzdBTGafP7XuCo4bsLlIlV/K3C55fFQMIfaLqkpfKlR
         2apJLyb3MoBlqP9uUef0p0tWRuawV/HIc22yZtiH2NCnDf3xavE4JIigitnlxW4dME4+
         JVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798840; x=1728403640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+5BUiXk0qE5fwdGMgQslVF9cwH/K3wvmujTMdEKiHU=;
        b=ATWmtXklDemr6BSGjDw4SyMgPutxTyD6S4VeNLwccvMXClhz3JksK9jxxCfg6B2ihD
         jrlbqulrWrUP2uVZ5NuFRiVmV3DVYh9VbFvUANQoD3vcspeWT3kxqBxxEa5Tk2LWKavx
         Bj5sYplFRG3S5UNbfXeSMRjahClZ7I/OTm0BEUdV/SFfSbEYTWw4cAOq7RVBM1SS3Wbj
         iJn4Se0DBOWarLAz1BNEaESfuvZzi6jm7WjhGxmb6avUYFanBwWUith0EBXynB0Xas9o
         t1S8wONAPBOF3tBzJwjPE2B3nycU/pxWrAG5PtXTT7+O14/Pf+SSFn3x3uPOBmj6ymcV
         FTLw==
X-Forwarded-Encrypted: i=1; AJvYcCUMkN6jVoIm1nr5Wr3fdgRwvJwoU49MVo1aoAvpI2qMdNP4dmxAL4cNEltnBHO0caNXN2vqAQE/Ohp32w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOeqG21muaJCy/GPvPOfy1pJ95Xbv6zQEHG5yHJkfJKxzhSJ9t
	MpmelIQ4lr0yQr3jvLRrA4JPKDh604DX8MBIcfgB5SUGN/kUVuHhlWpWZchGKb0=
X-Google-Smtp-Source: AGHT+IErQf5YjbMNwa+at3UP7ZmCJwrLyizTuL84rtWHL68ki3hQqLuCxkKzW7aSkks+lwT0RS+2sw==
X-Received: by 2002:a17:90b:4b0c:b0:2e0:808f:ef9e with SMTP id 98e67ed59e1d1-2e1848e3633mr179913a91.26.1727798840354;
        Tue, 01 Oct 2024 09:07:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:13 -0700
Subject: [PATCH 08/33] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-8-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090721_654836_B9D2EC42 
X-CRM114-Status: GOOD (  14.95  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/kernel/cpufeature.c      |  2 ++
 4 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index ce9a995730c1..344b8e8cd3e8 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/smp.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -180,4 +181,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		    riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		    riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179e..10d315a6ef0e 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,8 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_ZICFILP		87
+#define RISCV_ISA_EXT_ZICFISS		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index efa1b3519b23..9ea0021a1a75 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hwcap.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7117366d80db..96a1375d7171 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -317,6 +317,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 					  riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
