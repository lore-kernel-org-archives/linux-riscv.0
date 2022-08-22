Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088FBC32774
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmHNseDjdwFDYiGXBhKIZte0vWi2G/+kiGRK/hp9jGI=; b=I7D2ZatKFCIKby
	ITivSBvOoyJsYnzZ3a13kERZlsc1AQnhDCJrrG2GBkABJe7G5CX+YtePYp6/39o59t/TP0JQGJnf6
	mkrcSsLR4c2LOCrOjWyJWmwE3BuonCuCo5h4GNBbrlhtaTHWXqFVkuZbsxOumvwo9lhVlHptL1EOm
	Gz9O8fFwbQc/8/UXfiS617gGlJVfYUu5MXu/mu10gF+P4ucG7NdRMfFoOxKeduXenGiFiRMRGIBJh
	24u960Wy9ydeyj5hY0WKg8Tiu06wA70JwbCIUYUIKwWVbMIwDQ3kDJVAulCkgXzkOnUHkZSIS/Nni
	ZGymAAFpLb2ey7+QFBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPwz5-003lD5-Bs; Mon, 22 Aug 2022 02:16:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPwyj-003kyB-Vv; Mon, 22 Aug 2022 02:15:53 +0000
Received: by mail-pf1-x434.google.com with SMTP id g129so5704204pfb.8;
        Sun, 21 Aug 2022 19:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1iHPy2MJm6s7J5XdJO/siHoKhzaKKWD/EXtuZwe5/AE=;
        b=mKi9In1cguwoEOIvsqd6r243Uwmb97pem6sMmVbQ/lX7DKmHGQ4Cz8u7NaUAMolab3
         HmdgTa5cqnb+GfgxLAPvRC2VcgnhWhU/izaXxri5eH+EgDoV+6M0er9uK9apm/9k6Wa+
         O6vWMuPgbVirYyTOwBORRtmkCs2pdpI1E3AlnfMY1g6INcFNsiY5OxCc+eK21YnW41W/
         9gNulkHUPIkdHnMs5921OdcrPwHgoXozCfdiUiIdwYospQ2cvraEremg4xnjuFFKYkFu
         gDjp9ye/aSfYYNx/jRfdI/eCYmQuHZst3at0UYKdKX8Agaty19wI93E6qRscBDPMtYU4
         QtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1iHPy2MJm6s7J5XdJO/siHoKhzaKKWD/EXtuZwe5/AE=;
        b=Ja8bB+KQCCYjXE7jRa6zXBbozm4Hqybi3eNMKGNAcyVeBDNJA2xI96RKzKbb3F26Z6
         MXtt4OgYajAhtP9ABGE42ciec4CxHuK/h4OOqezXpg5USSOuJlNO3x36KdBtwsxZ8lpl
         JOlp/RMsK7oo2mej6wtGk4+BEpWHxiczZi9/TXQWTvqseEOVxcM3JUD8J6IE7V4nJhoq
         XCjGz6OLIGF+ynuBqAYHIYD0bfXyng5I5npf3XxAsBNLkbshlcnfnaPMYV8r9x7pMV0y
         qrZhZ2UPAe+JmdZiI+d7R589l7r78WfLrXnr65uZbPzKwNV4GvD3tUBxIP37sBi7VvdR
         jxog==
X-Gm-Message-State: ACgBeo1Ov5y8fKiZDt/r0gy0tMHhBq8uFsvxr3gEGXgftemZ0m/blJDa
	2rUsVlShWTUvlTZS/NbRlpV2znyIYg==
X-Google-Smtp-Source: AA6agR5RhOvnr+n8C+QckGvAPfLQPD+H4Z9Kyq6FS5FDBt09E1rsRMXpjGgfl8V7Hzvo18Hl1aKTcg==
X-Received: by 2002:a63:ce06:0:b0:41d:dcc3:aa6e with SMTP id y6-20020a63ce06000000b0041ddcc3aa6emr15448270pgf.251.1661134548425;
        Sun, 21 Aug 2022 19:15:48 -0700 (PDT)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79723000000b005321340753fsm7312139pfg.103.2022.08.21.19.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 19:15:47 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pingfan Liu <kernelfans@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dan Li <ashimida@linux.alibaba.com>,
	Song Liu <song@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	John Crispin <john@phrozen.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Price <steven.price@arm.com>
Subject: [RFC 02/10] cpu/hotplug: Compile smp_shutdown_nonboot_cpus() conditioned on CONFIG_SHUTDOWN_NONBOOT_CPUS
Date: Mon, 22 Aug 2022 10:15:12 +0800
Message-Id: <20220822021520.6996-3-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220822021520.6996-1-kernelfans@gmail.com>
References: <20220822021520.6996-1-kernelfans@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_191551_208472_6A5C01EA 
X-CRM114-Status: GOOD (  15.17  )
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

Only arm/arm64/ia64/riscv share the smp_shutdown_nonboot_cpus(). So
compiling this code conditioned on the macro
CONFIG_SHUTDOWN_NONBOOT_CPUS. Later this macro will brace the quick
kexec reboot code.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marco Elver <elver@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Dan Li <ashimida@linux.alibaba.com>
Cc: Song Liu <song@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Nick Hawkins <nick.hawkins@hpe.com>
Cc: John Crispin <john@phrozen.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Steven Price <steven.price@arm.com>
To: linux-arm-kernel@lists.infradead.org
To: linux-ia64@vger.kernel.org
To: linux-riscv@lists.infradead.org
To: linux-kernel@vger.kernel.org
---
 arch/Kconfig       | 4 ++++
 arch/arm/Kconfig   | 1 +
 arch/arm64/Kconfig | 1 +
 arch/ia64/Kconfig  | 1 +
 arch/riscv/Kconfig | 1 +
 kernel/cpu.c       | 3 +++
 6 files changed, 11 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index f330410da63a..be447537d0f6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -14,6 +14,10 @@ menu "General architecture-dependent options"
 config CRASH_CORE
 	bool
 
+config SHUTDOWN_NONBOOT_CPUS
+	select KEXEC_CORE
+	bool
+
 config KEXEC_CORE
 	select CRASH_CORE
 	bool
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 87badeae3181..711cfdb4f9f4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -129,6 +129,7 @@ config ARM
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC
 	select RTC_LIB
+	select SHUTDOWN_NONBOOT_CPUS
 	select SYS_SUPPORTS_APM_EMULATION
 	select THREAD_INFO_IN_TASK
 	select HAVE_ARCH_VMAP_STACK if MMU && ARM_HAS_GROUP_RELOCS
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 571cc234d0b3..8c481a0b1829 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -223,6 +223,7 @@ config ARM64
 	select PCI_SYSCALL if PCI
 	select POWER_RESET
 	select POWER_SUPPLY
+	select SHUTDOWN_NONBOOT_CPUS
 	select SPARSE_IRQ
 	select SWIOTLB
 	select SYSCTL_EXCEPTION_TRACE
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 26ac8ea15a9e..8a3ddea97d1b 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -52,6 +52,7 @@ config IA64
 	select ARCH_CLOCKSOURCE_DATA
 	select GENERIC_TIME_VSYSCALL
 	select LEGACY_TIMER_TICK
+	select SHUTDOWN_NONBOOT_CPUS
 	select SWIOTLB
 	select SYSCTL_ARCH_UNALIGN_NO_WARN
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..02606a48c5ea 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -120,6 +120,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
+	select SHUTDOWN_NONBOOT_CPUS
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 338e1d426c7e..2be6ba811a01 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1258,6 +1258,8 @@ int remove_cpu(unsigned int cpu)
 }
 EXPORT_SYMBOL_GPL(remove_cpu);
 
+#ifdef CONFIG_SHUTDOWN_NONBOOT_CPUS
+
 void smp_shutdown_nonboot_cpus(unsigned int primary_cpu)
 {
 	unsigned int cpu;
@@ -1299,6 +1301,7 @@ void smp_shutdown_nonboot_cpus(unsigned int primary_cpu)
 
 	cpu_maps_update_done();
 }
+#endif
 
 #else
 #define takedown_cpu		NULL
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
