Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A686BC432BE
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:13:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628AB60F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 628AB60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9qCdtte6UzraFVkcfTTvccAyt/aSIiZ8t7iCupzOWg=; b=2Vys7mmj9usciE
	HH6OYLRwne11aDrXhT3Z73E9qpMqHo9pX8Gpk9HdI0pb0EPjhLVYHmBY9hrLnAi1tmtgpIGR+u5Cl
	zy6j1AVM5pkTPeaIckRWm9KngHSqKRNSbKqBLEGeLDSrNA741ornGSO7nfRW2OYQC+R1j2iOxBGo/
	g/11Lq3nbLFoCyC39Dm34RhnVtIUai/Th3jpuhVFTIf38OsiGA+02n3gKgNpPegDetKUWY0RLuGOV
	7vVmpAS9QIb8W9ir2CoLhVT2cuoZv7YpwVwig1BlgM5pT7iT/PFrIMSOxgsemaiQjL5/03U6LDABk
	4xxJQiqm8fIOZDZkmULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAiz8-000hjH-Rv; Tue, 03 Aug 2021 01:12:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAiz6-000hik-PM
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 01:12:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9520560FA0;
 Tue,  3 Aug 2021 01:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627953164;
 bh=7iM0o8i7IXhADmeTNf1T0a4Y5xkOFyr9BlbacP7nCAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+w1MEJC7iZC8o5B9Vnz3cW3l77UEm0eLhyuIM6O3Okse3gi9a3SBPWveD7eYFYrb
 ljn3g+qs6GuJ/k3Sgug8voxN07+rVVkM6h9FziM55RJnjbhb5KG2MFhDhReiFVE8La
 Lfd0Y6VFLQCthLJwg8JX19DFxjtQD3yud7inxQFnoTg6d8gnvBqstEJyQ3Esj/xmgV
 TLgNF/EKmSf+R30kNgTda27imD5tlpt2RMfTiylSj1t9iILSqkwxNbfbb7lIkrEyfr
 pNSIRDUqiB/u5XRhhj4O5sjEs4mEzpMlfhzhDwe7ZJe13DnYS7t2HjnTHPetICrWf2
 2gt7vvA8Xpdew==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 tglx@linutronix.de, maz@kernel.org, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: Improve status in cpu sections of device-tree for
 cpuhotplug usage
Date: Tue,  3 Aug 2021 09:12:03 +0800
Message-Id: <1627953123-24248-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627953123-24248-1-git-send-email-guoren@kernel.org>
References: <1627953123-24248-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_181244_898060_353653F5 
X-CRM114-Status: GOOD (  12.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

If we define cpu sections with first okay & second fail:
        cpus {
                #address-cells = <1>;
                #size-cells = <0>;
                timebase-frequency = <3000000>;
                cpu@0 {
                        device_type = "cpu";
                        reg = <0>;
                        status = "okay";
			...
                };
                cpu@1 {
                        device_type = "cpu";
                        reg = <1>;
                        status = "fail";
			...
                };
        };

Currently, we only get cpu0 without cpu1 in the shell:
$ ls /sys/bus/cpu/devices/
cpu0

But it should be cpu0 online and cpu1 offline, then we could let
cpu1 online later by shell. This patch fixup the problem and let
us could make cpu1 online in the shell later after system boot:

$ ls /sys/bus/cpu/devices/
cpu0 cpu1
$ cat /sys/bus/cpu/devices/cpu0/online
1
$ cat /sys/bus/cpu/devices/cpu1/online
0

$ echo 224 > /sys/bus/cpu/devices/cpu1/hotplug/target
(cat /sys/devices/system/cpu/hotplug/states "224: online")
$ cat /sys/bus/cpu/devices/cpu1/online
1

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/cpu.c     |  5 -----
 arch/riscv/kernel/smpboot.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6d59e69..14f63fd 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -27,11 +27,6 @@ int riscv_of_processor_hartid(struct device_node *node)
 		return -ENODEV;
 	}
 
-	if (!of_device_is_available(node)) {
-		pr_info("CPU with hartid=%d is not available\n", hart);
-		return -ENODEV;
-	}
-
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=%d has no \"riscv,isa\" property\n", hart);
 		return -ENODEV;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index bd82375..c3b620b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -37,6 +37,7 @@
 #include "head.h"
 
 static DECLARE_COMPLETION(cpu_running);
+static struct cpumask cpu_delay_available_mask = { CPU_BITS_NONE };
 
 void __init smp_prepare_boot_cpu(void)
 {
@@ -99,6 +100,11 @@ void __init setup_smp(void)
 			break;
 		}
 
+		if (!of_device_is_available(dn))
+			pr_info("CPU with hartid=%d is not available\n", hart);
+		else
+			cpumask_set_cpu(cpuid, &cpu_delay_available_mask);
+
 		cpuid_to_hartid_map(cpuid) = hart;
 		early_map_cpu_to_node(cpuid, of_node_to_nid(dn));
 		cpuid++;
@@ -131,6 +137,11 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	int ret = 0;
 	tidle->thread_info.cpu = cpu;
 
+	if (!cpumask_test_cpu(cpu, &cpu_delay_available_mask)) {
+		cpumask_set_cpu(cpu, &cpu_delay_available_mask);
+		return -EIO;
+	}
+
 	ret = start_secondary_cpu(cpu, tidle);
 	if (!ret) {
 		wait_for_completion_timeout(&cpu_running,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
