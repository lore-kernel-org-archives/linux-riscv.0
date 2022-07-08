Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C7C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byFjgBWNm0oBDHY6oEOG0foZ4OQQHflzqnSYCxGrYD4=; b=hWKkLfpUoXM6ng
	vt7njBFKDpHpOO4F0Go8clERljC0wDrL34r6xsocT8BL+S0oXsXMIlU9vL2vNQPry6nBysmYR1wPv
	Z+/NrehfFFxsacVqobdzYla/Ms562yxhv6XKT1WCQRyVr/vp3/LtaaQrKxOhg+VyUYAlBAqGKjhPC
	1rXjFAHhDXQskY80sbaTvd516Gs+u55IvpaLVtXXGYYhG51Wze4RqcXzZnZZ/pDUY+qPxpbzSKRWA
	nEUdcgUdmi747q8L/VhNcvDSG0VQdrHXAHf0hqXl3Ixjfx5NhqaBXUDvcuY7M1oUO8W/t7SEEzdUb
	Xh4xCkujn+HkTZoMmaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ugH-005p8n-8Q; Fri, 08 Jul 2022 20:34:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ufp-005otc-UC
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 20:34:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bk26so16891767wrb.11
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7OziW02Y/9peL0FmHLT2XkVqPVR8DGTtiJWYX8th9g=;
        b=UEqfB1NDxQ4fuxAn57jO5JOXC85gsDa3qdlYdPAfKQbBmBo41BVTJKXkQ286sHM7Mk
         6LPutCJJYxobipDur8SaWiKWDNA7F/5yJRFFfnxODfMMcz5WhTAYkwlNnIqarCW/dNDm
         rFrAmWedvKoHFxbVpej+fzrUb3wwchTtl0wkqL8p576qk2dEBMTgzryWnttyup4o4W1b
         vpJyZHZGw1A/THM+W8xbwymP/08dQ+TkP+qO9f6dXb50g96NFnktqZ017+y/u5POCTQf
         XwK6IzN//c27a0FxB5KOjGE/Vx49Btj/tOHFaKmR1x9LZWkDK0kNtASZsl6msEbRprvE
         JfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7OziW02Y/9peL0FmHLT2XkVqPVR8DGTtiJWYX8th9g=;
        b=g8SkgOB4AZI8jJRJT+TRHkjGMT+vVoSZImJaFZJXWpMD70xogoIJ7p6YRzOTuyvRDK
         U2M8pqwdm0a2fGS5kpvSM25XVGp7Ol8EkxCvHdsM+q+wG5JPMrQ3FrWYljO2mM3o+x8a
         /ZPSBtlSDFWYPkfIVTr1seQl1nvHcitegqFSvEgA6LK6I90g8AAjXRM0B5YwhJ9K0rLd
         3sba2/eeO06gb1JjIVuxy4hON/MIdA001aSpllFpv6DaDh4pAqjSIvmzZtMcz2Z+hHMx
         X1Z5cgLEsxomq7tmuBzowHHv02lLD1jHExI20LPokyI87Y+KZSB7qDvuw05nq9kEuqmW
         pDgQ==
X-Gm-Message-State: AJIora/bs79MLoyfgIc0TL+Nko0pg7D0L3D1MZK3a+UTHdQuJZX+dRtP
	LdGejyD/UVZ4dGbJN8/Zlk56Hw==
X-Google-Smtp-Source: AGRyM1tiuAM/tea7RwU3EO1DtUOng8CK5amFDnoeTVJhCd41MOb5se0+VDnHisrU3+re40/QC6r2Mw==
X-Received: by 2002:a5d:4582:0:b0:21d:7c57:1f4b with SMTP id p2-20020a5d4582000000b0021d7c571f4bmr4906085wrq.146.1657312437558;
        Fri, 08 Jul 2022 13:33:57 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id a3-20020a1cf003000000b0039c8a22554bsm3165034wmb.27.2022.07.08.13.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:33:56 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH v2 2/2] riscv: topology: fix default topology reporting
Date: Fri,  8 Jul 2022 21:33:43 +0100
Message-Id: <20220708203342.256459-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708203342.256459-1-mail@conchuod.ie>
References: <20220708203342.256459-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_133401_984616_E707D1A5 
X-CRM114-Status: GOOD (  15.07  )
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

From: Conor Dooley <conor.dooley@microchip.com>

RISC-V has no sane defaults to fall back on where there is no cpu-map
in the devicetree.
Without sane defaults, the package, core and thread IDs are all set to
-1. This causes user-visible inaccuracies for tools like hwloc/lstopo
which rely on the sysfs cpu topology files to detect a system's
topology.

On a PolarFire SoC, which should have 4 harts with a thread each,
lstopo currently reports:

Machine (793MB total)
  Package L#0
    NUMANode L#0 (P#0 793MB)
    Core L#0
      L1d L#0 (32KB) + L1i L#0 (32KB) + PU L#0 (P#0)
      L1d L#1 (32KB) + L1i L#1 (32KB) + PU L#1 (P#1)
      L1d L#2 (32KB) + L1i L#2 (32KB) + PU L#2 (P#2)
      L1d L#3 (32KB) + L1i L#3 (32KB) + PU L#3 (P#3)

Adding calls to store_cpu_topology() in {boot,smp} hart bringup code
results in the correct topolgy being reported:

Machine (793MB total)
  Package L#0
    NUMANode L#0 (P#0 793MB)
    L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
    L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)
    L1d L#2 (32KB) + L1i L#2 (32KB) + Core L#2 + PU L#2 (P#2)
    L1d L#3 (32KB) + L1i L#3 (32KB) + Core L#3 + PU L#3 (P#3)

CC: stable@vger.kernel.org
Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
---
 arch/riscv/Kconfig          | 2 +-
 arch/riscv/kernel/smpboot.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2af0701b7518..4b6c2fdbb57c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,7 @@ config RISCV
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
-	select GENERIC_ARCH_TOPOLOGY if SMP
+	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_EARLY_IOREMAP
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f1e4948a4b52..a1c861f84fe2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -40,6 +40,8 @@ static DECLARE_COMPLETION(cpu_running);
 void __init smp_prepare_boot_cpu(void)
 {
 	init_cpu_topology();
+
+	store_cpu_topology(smp_processor_id());
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -161,9 +163,9 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
-	update_siblings_masks(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
 	/*
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
