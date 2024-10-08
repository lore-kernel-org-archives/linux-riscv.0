Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C35CF042E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ie0oFxPq5mLOawcGKXntqLpQgsXJZnDgycUZNDRs89A=; b=ifY79/WbpWUY+E
	cw7Dke8XMlbuhak2dPQF4hQG1PwEob9eBbnvJpwMuCoFajODzjUYM0WrKeAiNne0ZnqZFeMiK1pRB
	pDH5nNGYmDo3U/owcxz2gaUe9ieDYHrAi0ELpCyUwTgxBTT2Lauxkv1yIVC1uzUm6P4epx15pVL9L
	dr5lPZSeJBqi0WImbL6WAkmEOXsJq0QAsowEWLa7ffUSXmr2a5XfDUFwUGcdq/yV7VGjOOjz82soD
	rfbZOi1XEyDN8m69+DCM9vKAIWrvJFodYeAwqxaBCO1lSfMzGjXMuaCujCJ8/0kpPC8Zh+86lgxgI
	JloOPaZz48x+XYgWXV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtg-00000007SFF-1bUY;
	Tue, 08 Oct 2024 23:45:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqc-00000007Ije-36M7
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1PgKK5psJ4uqI8azQmoLe2esobQYgrwfNA+bFUurkQQ=; b=qYrBDNboEPpfu5GiOy1lmDbW4Q
	HHtNJu53LJ2rFQ2+Ka/Up+NNr8RlvH3hhOb35bYJ8V6gmnFwirPScEdUDUlDbaJk9PzTcxfwiVBRC
	4txkgJzrfi9zOxoKJYpdBR+KeK6zTrHfwEExaEK1Pqw3T1P/gw8p7S7WKtnkCqY+TX0w8sLMbc4Hd
	OZwK7Z1Ew1q4pyNkppMpGhXklGC1dn6NKxdN1PhHAPcBzW6d49FJtMgTzM54AHc1OKb18+gQCRFEV
	bJVoDBhcJ5QcfZmaJF7qZY/Qjt+Ug7ruCFMok7kOn108KFxFpSUjdJQprD8+rB26F9bNR+MF/+Sv+
	IcwHJScA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqP-00000004hSA-3JyF
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4005696a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427090; x=1729031890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PgKK5psJ4uqI8azQmoLe2esobQYgrwfNA+bFUurkQQ=;
        b=WobEvsmkI4uEZqPJWpz92jrXzAWtjOZungiXAQqXd1fMyM2ohY8lczoMfbLxL0LbW8
         yKWwVvw0T9T1WiI/pzVtVv5GgGPiiOSeNOBVjWRCjLKtLbW6JfmRksH+/2njsxrYMfKd
         0bt2apwhSUY36YdQztAYjzsh2h062DOU19o+hOBdEJL3G2/hGyl7qEK8MJ3Qke21GXPO
         b3KFyxR9F8XlYtvzc670WYlYarBKnh3QhU/NAH63KhUJ/X2p6fgOvg9TQpL8ZbHxF7Bv
         p+usIslUI6JT75dDbTn7ZMIOy0viMuJMCkxloid6x0GWXZEa4CATOdULEwxDXtgjClnb
         SIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427090; x=1729031890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PgKK5psJ4uqI8azQmoLe2esobQYgrwfNA+bFUurkQQ=;
        b=Jv42KlNo636imFQQSPUeoxvR+he5h4rNBqCC+/71L2/nq393Z78m0WxwSns74zVM0t
         albvvjm5tt3JJYP/+iFqzVrIOcVLtlzXLQSai5CDQvlUZfmtimyzsyN/reipu5ZC2cYO
         k8YTwzaCNgRJqeB0gofdvbU/ZYNrzN0a59P5dpGWg3HEqEC+EUkGUE9EFkbS4dwIISAN
         YXcP7oN7q7IvZ/auKqgkmoRtEQFE6vgtaZVzsDUQptBUPxvfafG9e245epRuGIfjRa2J
         m5SbTGcZnndAkPqC779yl83yfPxvYESldIx+plzWIpnj1dR9bpDuDfFc1J87mlsn9x8v
         cLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5tgzljl4OZtFuqUG6kqt7B5LiXTob/SyaX3X77+CZ4zVcyqTVz9B8BNFhemwTHxqwcrr3OnKMi7HVBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdyeM6ZJWFq1NJK7S1opkJpsaRYKOd7EgH7+w4KHJyj/XYX2KC
	xUj/Q3cWH+onM8Rkh7812hKTIDWbnzR9VCSiyAztFrGsszcF7ZQC4fIZ2Ho109U=
X-Google-Smtp-Source: AGHT+IFY7chdq/RlO1VqqZI5iRB44TlQ/FpJUC1y/VZKQga2d2VHN1qSiIxLmjb9SvMQ9TpE0KT+Pw==
X-Received: by 2002:a05:6a20:9f9b:b0:1d7:f7d:5cf3 with SMTP id adf61e73a8af0-1d8a3c1d7c4mr777890637.25.1728427089845;
        Tue, 08 Oct 2024 15:38:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:50 -0700
Subject: [PATCH v6 08/33] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-8-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233819_378411_F5B3AD85 
X-CRM114-Status: GOOD (  14.82  )
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
index c1a492508835..aec3466a389c 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hwcap.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3a057c36996..70803aa66332 100644
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
