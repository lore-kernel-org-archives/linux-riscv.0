Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDBEC369B4
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PGTwfk8mJ5PXTY0qE49wdNlG/ObBCG2yMwtju7prox4=; b=nyCV6+4ZJefEu1
	TkOdn/ALNghMifyWyzE/5OiIBC+6lLIg0rvhUnl7Yz+ivX4AI1nHOUlwHvIgFc/CemoJ/bUwMK1ol
	kwZ7ucYIolMfTmGriTvt8NKTF4eN56E165bCSxZLgc/N5LKYmCqhk55hiVyXGtl86tO2UTruMTJs2
	0vNQh6yagZS/ElSiiTOhhOIcBikWmvbw8pZP6MdW3kVP2NULaeC5SCxkAHQHYvAzET/bJc0Yu/wPe
	wGwz0lPbIF0CcQZG8VlI8d5DS8RJ/o311V1SMppWv+9qwlcMTA6W0s7WCaHapwpNMXfzL+QkNQ7V7
	8bTwaNzVkohSZJi+2IpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fW9-00000005ldQ-1a3M;
	Tue, 15 Apr 2025 12:35:57 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fPQ-00000005k6f-1diO
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:29:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-73c17c770a7so367569b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720139; x=1745324939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FENkVPZrdXUfWlwZOpIjF8fd7DB1ly5m5isMQSaF4Ak=;
        b=YQWZPVTINg5i8a681aSFWNY778fGUJEJCm0dJpqD7dxQZoyG0TZ2oUnYjDz1L8TCVE
         9H4LWR/GAG3wURSrFe+VguzFznvlDIg/cfcdfCTh397KdwaY3Os9kfn9/lHtFRtFBM6n
         1GRwcfzxRxL0quFwXmJZZezmJSUDkAqUcKRkfaEjHynnWZ22b/H1l37Qx9JU9Oj+aAq1
         oqyfc4++C/beYDLdfRclQbix4j0/bbx4gHKDBqLM8uCuMifDQY/ifBKO5ej9/C4CivAO
         kR0PeR9yW+nseBavieVPLrx5PGfkL6n3lE08r0rJ7iet24UwijtpOUeRxr2k8leTB9QF
         RqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720139; x=1745324939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FENkVPZrdXUfWlwZOpIjF8fd7DB1ly5m5isMQSaF4Ak=;
        b=vK/p4ood5M65KUv9bo/HdyVdBKMaa0Em7td/8hmCm0MdXI9KJGW9AWf0l8irt20Mwd
         VxI18tWdShmdv14NO6b8hua5kY+W/bFqHRoX9vWVbfffNgzwsiS0unMzL/pcWCKJ3RTh
         E4DPrmjI7UKCB3POI+bWBDuGJN89cZaCU1OrG6dy7L1TzPvXApB8UO4P+Jg276ouh6oU
         T/jMwIyORyPmG3pHLHD4tbxOOfYEj6PJ43/Pha26QHix3zMCXTrCvR7DzIbxdTutaOVC
         Z3el/ErhBwDMj7+2Uks4NPfQsuSozAQwhI1JeJekczInrRe1pu7c56W69Eo8bv5aRzAG
         RkQw==
X-Forwarded-Encrypted: i=1; AJvYcCUuTXZ/+q+vLmHtOez+MA8YVgo9M5dk8DU9C3oRflbQR+e7brfY2zQUAx4y7/RFSNo7sCZ+EjswmZ8DvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu5JABDXqm5fezr9gSby6YPh0L45gL40X4y1nXnupBLA/500qa
	RqVasKdzY2/d7MqkKUKpOy6y+GUhaDSqt90WGBlT0vSQm8+NLj0W
X-Gm-Gg: ASbGncvrI35jq+GRanL4mRV6aZ+4VXl7N+f1Mv7G97g0/ib11V+x1N6aLTTg+0gDSha
	TN3ZguAoLVfvh3nLd6wrxWOatrv4wzm5jneJI6sp0jcHwJIEdKmd4Qi99lQOZjMLRHo28s7Q4bi
	ZP8pFIrWOAz8K2aoi3BQi6zSkQOC6LJ64bglD9TlI65b6tvcPvmq+AdLxIeFos72E5XFqfdXulo
	d5yb9l0bOLksoE/vq21TZWGAr3rYnPKPBijRFmv9Jco6KjyfDicK8jd6fazWuEZ0mDHprUmbOtp
	lMoE9xsuUmk8KVavbiOiUpsRXn2RB3bE3w7bfb5mXJakuVxKtj6RqtbKIYgaEg==
X-Google-Smtp-Source: AGHT+IE9rRI3sV/c1IEbsmtgMV/3FSBB8AbgRXFWGUElqksSl5VBAp1cIvmxwGtICoaKZ3jNaZNcZA==
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr21712379b3a.10.1744720139495;
        Tue, 15 Apr 2025 05:28:59 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198e9csm8334898b3a.28.2025.04.15.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:28:58 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: defconfig: Remove EXPERT
Date: Tue, 15 Apr 2025 21:58:31 +0930
Message-ID: <20250415122832.982610-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_052900_429476_F64C229A 
X-CRM114-Status: GOOD (  14.00  )
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

The setting of EXPERT is a leftover from when the riscv defconfig was
first added. As mentioned in the EXPERT Kconfig help text it is not
intended to be set in the usual case.

Upon removal a bunch of intrusive debug-related kernel options are no
longer set, which is good. A few may want to come back in the future but
let those be advocated for on a case by case basis.

NAMESPACES, SYSFS_SYSCALL and MEDIA_SUPPORT_FILTER default on and thus
fall out of the defconfig.

Set VIDEO_CADENCE_CSI2RX=y to ensure VIDEO_CADENCE_CSI2RX stays enabled.

Set DEBUG_KERNEL=y in line with other arch defconfigs. This turns on
tracing.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This supersedes https://lore.kernel.org/all/20250404062235.671872-1-joel@jms.id.au/
as it is a fix for the root cause: by removing EXPERT causes
MEDIA_SUPPORT_FILTER=y like most other defconfigs and thus the
unwanted MEDIA drivers stay disabled.

To view the change between the old .config and the new, use a recipe
such as:

make ARCH=riscv defconfig && cp .config config-before-removing-expert
git am 0001-riscv-defconfig-Remove-EXPERT.patch
make ARCH=riscv defconfig
diff -up config-before-removing-expert .config | grep "^+\|^-" | grep CONFIG

The output when run on v6.15-rc1:

-# CONFIG_PREEMPT_RT is not set
-CONFIG_PREEMPT_COUNT=y
-# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
-CONFIG_EXPERT=y
+# CONFIG_EXPERT is not set
-# CONFIG_SGETMASK_SYSCALL is not set
-# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_SYSFS_SYSCALL=y
-# CONFIG_BASE_SMALL is not set
-# CONFIG_DEBUG_RSEQ is not set
-# CONFIG_PC104 is not set
+CONFIG_TRACEPOINTS=y
-# CONFIG_SUSPEND_SKIP_SYNC is not set
+CONFIG_UPROBES=y
-CONFIG_UNINLINE_SPIN_UNLOCK=y
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-# CONFIG_SLUB_TINY is not set
+# CONFIG_NET_DROP_MONITOR is not set
-# CONFIG_PCIE_BUS_TUNE_OFF is not set
-CONFIG_PCIE_BUS_DEFAULT=y
-# CONFIG_PCIE_BUS_SAFE is not set
-# CONFIG_PCIE_BUS_PERFORMANCE is not set
-# CONFIG_PCIE_BUS_PEER2PEER is not set
-# CONFIG_FIRMWARE_MEMMAP is not set
-# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_FF_MEMLESS=y
-# CONFIG_TTY_PRINTK is not set
-# CONFIG_GPIO_SYSFS is not set
-# CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER is not set
+CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y
-# CONFIG_VIDEO_CS3308 is not set
-# CONFIG_VIDEO_CS5345 is not set
-# CONFIG_VIDEO_CS53L32A is not set
-# CONFIG_VIDEO_MSP3400 is not set
-# CONFIG_VIDEO_SONY_BTF_MPX is not set
-# CONFIG_VIDEO_TDA1997X is not set
-# CONFIG_VIDEO_TDA7432 is not set
-# CONFIG_VIDEO_TDA9840 is not set
-# CONFIG_VIDEO_TEA6415C is not set
-# CONFIG_VIDEO_TEA6420 is not set
-# CONFIG_VIDEO_TLV320AIC23B is not set
-# CONFIG_VIDEO_TVAUDIO is not set
-# CONFIG_VIDEO_UDA1342 is not set
-# CONFIG_VIDEO_VP27SMPX is not set
-# CONFIG_VIDEO_WM8739 is not set
-# CONFIG_VIDEO_WM8775 is not set
-# CONFIG_VIDEO_SAA6588 is not set
-# CONFIG_VIDEO_ADV7180 is not set
-# CONFIG_VIDEO_ADV7183 is not set
-# CONFIG_VIDEO_ADV748X is not set
-# CONFIG_VIDEO_ADV7604 is not set
-# CONFIG_VIDEO_ADV7842 is not set
-# CONFIG_VIDEO_BT819 is not set
-# CONFIG_VIDEO_BT856 is not set
-# CONFIG_VIDEO_BT866 is not set
-# CONFIG_VIDEO_ISL7998X is not set
-# CONFIG_VIDEO_LT6911UXE is not set
-# CONFIG_VIDEO_KS0127 is not set
-# CONFIG_VIDEO_MAX9286 is not set
-# CONFIG_VIDEO_ML86V7667 is not set
-# CONFIG_VIDEO_SAA7110 is not set
-# CONFIG_VIDEO_SAA711X is not set
-# CONFIG_VIDEO_TC358743 is not set
-# CONFIG_VIDEO_TC358746 is not set
-# CONFIG_VIDEO_TVP514X is not set
-# CONFIG_VIDEO_TVP5150 is not set
-# CONFIG_VIDEO_TVP7002 is not set
-# CONFIG_VIDEO_TW2804 is not set
-# CONFIG_VIDEO_TW9900 is not set
-# CONFIG_VIDEO_TW9903 is not set
-# CONFIG_VIDEO_TW9906 is not set
-# CONFIG_VIDEO_TW9910 is not set
-# CONFIG_VIDEO_VPX3220 is not set
-# CONFIG_VIDEO_SAA717X is not set
-# CONFIG_VIDEO_CX25840 is not set
-# CONFIG_VIDEO_ADV7170 is not set
-# CONFIG_VIDEO_ADV7175 is not set
-# CONFIG_VIDEO_ADV7343 is not set
-# CONFIG_VIDEO_ADV7393 is not set
-# CONFIG_VIDEO_ADV7511 is not set
-# CONFIG_VIDEO_AK881X is not set
-# CONFIG_VIDEO_SAA7127 is not set
-# CONFIG_VIDEO_SAA7185 is not set
-# CONFIG_VIDEO_THS8200 is not set
-# CONFIG_VIDEO_UPD64031A is not set
-# CONFIG_VIDEO_UPD64083 is not set
-# CONFIG_VIDEO_SAA6752HS is not set
-# CONFIG_VIDEO_I2C is not set
-# CONFIG_VIDEO_M52790 is not set
-# CONFIG_VIDEO_ST_MIPID02 is not set
-# CONFIG_VIDEO_THS7303 is not set
-# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
-# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
-# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
-# CONFIG_DRM_WERROR is not set
-# CONFIG_HID_A4TECH is not set
+CONFIG_HID_A4TECH=y
-# CONFIG_HID_BELKIN is not set
+CONFIG_HID_BELKIN=y
-# CONFIG_HID_CHERRY is not set
-# CONFIG_HID_CHICONY is not set
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
-# CONFIG_HID_CYPRESS is not set
+CONFIG_HID_CYPRESS=y
-# CONFIG_HID_EZKEY is not set
+CONFIG_HID_EZKEY=y
-# CONFIG_HID_ITE is not set
+CONFIG_HID_ITE=y
-# CONFIG_HID_KENSINGTON is not set
+CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_REDRAGON is not set
-# CONFIG_HID_MICROSOFT is not set
-# CONFIG_HID_MONTEREY is not set
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+# CONFIG_QCOM_PMIC_PDCHARGER_ULOG is not set
-CONFIG_LIST_HARDENED=y
+# CONFIG_LIST_HARDENED is not set
-# CONFIG_CPUMASK_OFFSTACK is not set
-# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
-# CONFIG_VMLINUX_MAP is not set
-CONFIG_DEBUG_PAGEALLOC=y
-# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_DEBUG_PAGE_REF is not set
-CONFIG_SCHED_STACK_END_CHECK=y
+# CONFIG_SCHED_STACK_END_CHECK is not set
-CONFIG_DEBUG_VM_IRQSOFF=y
-CONFIG_DEBUG_VM=y
-# CONFIG_DEBUG_VM_MAPLE_TREE is not set
-# CONFIG_DEBUG_VM_RB is not set
-CONFIG_DEBUG_VM_PGFLAGS=y
-CONFIG_DEBUG_VM_PGTABLE=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_VM_PGTABLE is not set
-CONFIG_DEBUG_PER_CPU_MAPS=y
+# CONFIG_DEBUG_PER_CPU_MAPS is not set
-CONFIG_LOCKUP_DETECTOR=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+# CONFIG_SOFTLOCKUP_DETECTOR is not set
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
-# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
-CONFIG_DETECT_HUNG_TASK_BLOCKER=y
-CONFIG_WQ_WATCHDOG=y
+# CONFIG_DETECT_HUNG_TASK is not set
+# CONFIG_WQ_WATCHDOG is not set
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
-CONFIG_DEBUG_RWSEMS=y
+# CONFIG_DEBUG_RWSEMS is not set
-CONFIG_DEBUG_ATOMIC_SLEEP=y
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
-CONFIG_DEBUG_LIST=y
-CONFIG_DEBUG_PLIST=y
-CONFIG_DEBUG_SG=y
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_PLIST is not set
+# CONFIG_DEBUG_SG is not set
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_EQS_DEBUG=y
+CONFIG_RCU_TRACE=y
+# CONFIG_RCU_EQS_DEBUG is not set
+CONFIG_NOP_TRACER=y
+CONFIG_TRACE_CLOCK=y
+CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_TRACING=y
-# CONFIG_FTRACE is not set
+CONFIG_FTRACE=y
+# CONFIG_BOOTTIME_TRACING is not set
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_HWLAT_TRACER is not set
+# CONFIG_OSNOISE_TRACER is not set
+# CONFIG_TIMERLAT_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+# CONFIG_FTRACE_SYSCALLS is not set
+# CONFIG_TRACER_SNAPSHOT is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+CONFIG_UPROBE_EVENTS=y
+CONFIG_BPF_EVENTS=y
+CONFIG_DYNAMIC_EVENTS=y
+CONFIG_PROBE_EVENTS=y
+# CONFIG_SYNTH_EVENTS is not set
+# CONFIG_USER_EVENTS is not set
+# CONFIG_TRACE_EVENT_INJECT is not set
+# CONFIG_TRACEPOINT_BENCHMARK is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_TRACE_EVAL_MAP_FILE is not set
+# CONFIG_RING_BUFFER_STARTUP_TEST is not set
+# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
+# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
+# CONFIG_RV is not set

 arch/riscv/configs/defconfig | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..286f490ead37 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -18,12 +18,9 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
-CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
@@ -181,6 +178,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
@@ -294,25 +292,7 @@ CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_PAGEALLOC=y
-CONFIG_SCHED_STACK_END_CHECK=y
-CONFIG_DEBUG_VM=y
-CONFIG_DEBUG_VM_PGFLAGS=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_PER_CPU_MAPS=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_WQ_WATCHDOG=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_RWSEMS=y
-CONFIG_DEBUG_ATOMIC_SLEEP=y
-CONFIG_DEBUG_LIST=y
-CONFIG_DEBUG_PLIST=y
-CONFIG_DEBUG_SG=y
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_EQS_DEBUG=y
-# CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
