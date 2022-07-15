Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8181DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWXA7j7XAO+y5egQQAMh2XdHxD5bhQ2eHJYzrJxWrkc=; b=i+c5Romhwhjis9
	C5s43B7fp3q2vwppR8yp6PmtXXwOtKqFWL0916wDRW5uA4Nt83o8MDL0KOhQAMicSVN8+5dKUaahJ
	ccFKyzjTdjfJr+0MS3kkkwen5FWezX0bxtjImQNDEAA1eyhwUvJ0ZJjdfAcuUvERDJDkn+rkguoju
	81wwCmAU1SYBQtJJLD+jBsDcHBTKYHjVOHtv8SrpAmj8d7IM/nb2VJ/1tVy25UxaxSb29cORpWU8j
	ZzlZ0yrSD+1gSS//WyU4B/d4AZ4L3bJpRFz2p8iHI5vjQgwVrZpIL+r59IReOLH5MgmD1i2T3y8iF
	2is883XmZkYTXlccABFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPW3-009I6Y-7n; Fri, 15 Jul 2022 17:54:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPVX-009Hwc-Ug
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:53:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so5405272wme.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3AAc+ZWRep7EdC36jKYHok1cQbg6aR7AuxmKHVGFG4=;
        b=gVM/YKXv8JXkoDC7eqAwEizXbVSH+uSr0nqKVg+ctMmY8hVlCRDjc/9ZZTsDcoN+2H
         mtpDWTezfDAJ43oAGeqE36TTu5rUoVYKhDs1f4b2F6EKLws8FDsuM4rARFFbKcbykf6/
         NvYfX4ScKZecFSytDDMovm3vqoSutLN3tR9YKPCpljzUiNgYMq9UwV4MX/M4bfQ1E64v
         02lRrWHmPVTmESUgn6sncWSekVfe8UJ0moOad7MBpLOeMZy+hWMVdcJL29q1ZEZ1ohZU
         EqmLJ7Gdg5FNlW4ImRIHlJGFyMceS9FsAuryPKNgOY32cWQPJ/0V7fB/bJqQPiBN/Sx+
         N2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3AAc+ZWRep7EdC36jKYHok1cQbg6aR7AuxmKHVGFG4=;
        b=0WfmG5i6cvYV9l9PzYeg60BRsPoZn+FvQ6wOLGs0VaMFjDjrDZyiGaSZFE+0Jfa4bV
         6amrND8iQ5S7qg7yF44bDzCANFVBbvnWwmLIe4NWieXx2m8KsLdKS+Zk/cOtRJP4TLLb
         AE4LMCHwN9aV7wF/kMcvQPPnsVJKlcFPAn5ONaaueJASzJsqIFZRoLZSa9t//IMbIyks
         UbcaB9VsmirBfOBsoSywfGtVguBD88X4nfissnX9xzKffugVDAXMQCX6X97uh9jpjmnd
         ko9rxJN1tshf0TKzAszSpA4fvjqC/KY/bH71FAFiPDLjU6IdePUOdKMxWeiA5rXxMebv
         9/Cg==
X-Gm-Message-State: AJIora9Lv3G0ZtJ21NJnNGuWcaJ9vol/XVXVvrDFRs4kWuriAclrDJaE
	OH8FN4peEq1XWmUP2rtK6IikcA==
X-Google-Smtp-Source: AGRyM1u2Ty9BYA+3hrAEWPLa6fjl0UsQSq1o0Dd1QhDAUA2o/RBWvgd7Fh+XnSDKuRZzXe3sV6deDw==
X-Received: by 2002:a05:600c:190a:b0:3a2:e8cc:57ca with SMTP id j10-20020a05600c190a00b003a2e8cc57camr15642409wmq.118.1657907621417;
        Fri, 15 Jul 2022 10:53:41 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002167efdd549sm4364131wrt.38.2022.07.15.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:53:40 -0700 (PDT)
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
Subject: [PATCH v4 2/2] riscv: topology: fix default topology reporting
Date: Fri, 15 Jul 2022 18:51:56 +0100
Message-Id: <20220715175155.3567243-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715175155.3567243-1-mail@conchuod.ie>
References: <20220715175155.3567243-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_105343_992973_F550161E 
X-CRM114-Status: GOOD (  13.72  )
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
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/Kconfig          | 2 +-
 arch/riscv/kernel/smpboot.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 205c1e2f539c..7ffac8818060 100644
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
index f1e4948a4b52..b4d5524b1077 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -49,6 +49,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	unsigned int curr_cpuid;
 
 	curr_cpuid = smp_processor_id();
+	store_cpu_topology(curr_cpuid);
 	numa_store_cpu_info(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 
@@ -161,9 +162,9 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
-	update_siblings_masks(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
 	/*
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
