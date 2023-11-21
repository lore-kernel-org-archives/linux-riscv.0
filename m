Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED063C61D92
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+frgHB+9NVbnfvxkBJVqSiHrE0vHLrJaODPcy8zAIc=; b=fzsvBqLkAUqkUs
	U5yUWzVlAlmocO9qny9+2U6PB3vnjBqjgsnudQu38jnWTBR+U0liJ6zORAog1GQIwtwv3ugvDTr2y
	bRbpLxF2WaLwyJFfb0uMS+Sel2YsM79AsNO2zI4K5CQE1n3exyu1Xc3dB9XaYzXCKze18WN2GagFR
	rwLKKTtI+ybQlEpm6nXaxSo7zY1Wgjiph4KJW86F2lloK0zXE8YJDRxbT2V7AcJtIBtxddQDchbkO
	peCNXTiH06YkIfTgSptMueDaC2juDM7T9pmweokf3HrPF6htLFyGdaP1GIgcK6AoKmH1R2L4Zioxr
	pvoVshdMZyW+DjD0f1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4t-00GsCw-2s;
	Tue, 21 Nov 2023 13:46:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4l-00GqaY-0f;
	Tue, 21 Nov 2023 13:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hwKW27BSIGP2vflIk8amXw2dHCnmehVyW/SsrBiOkzo=; b=bIssjw2/Mjk8O39ibBLN9vbHhT
	AO1nUkBs1ooF6MG5CJ/+2w24+qAMjviTQtWGFKqEDdKTV4mfY27SkS3FkOAOpHnW1PFOAD8uT8Zp2
	RqUVA7bBpUV1aLYNeMjvFHK/Y6exbo/7COEIWDUFiXkHTTXHvIgiaptrim4n/8jXT3TPoQjfRXQ7l
	JpGSMktyj8lalUTFrsiko8bqfDqQV8ukWVcE9pbN0rweblQxnwGyVjdtFNOWLix5HhWRbBwbrSbIS
	uo3sobHGnSt1GYpIyZKFfxg7SW9VyDL7qF27QbJRteFQQBvAu5VPaF/MQQs7p26MhAFKXqu2qBAbI
	Ff2RLkfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32876 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R2e-000762-39;
	Tue, 21 Nov 2023 13:43:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R2g-00CsyV-Ss; Tue, 21 Nov 2023 13:43:54 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 01/21] arch_topology: Make register_cpu_capacity_sysctl()
 tolerant to late CPUs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R2g-00CsyV-Ss@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:43:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054603_253298_4B548D02 
X-CRM114-Status: GOOD (  15.27  )
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

From: James Morse <james.morse@arm.com>

register_cpu_capacity_sysctl() adds a property to sysfs that describes
the CPUs capacity. This is done from a subsys_initcall() that assumes
all possible CPUs are registered.

With CPU hotplug, possible CPUs aren't registered until they become
present, (or for arm64 enabled). This leads to messages during boot:
| register_cpu_capacity_sysctl: too early to get CPU1 device!
and once these CPUs are added to the system, the file is missing.

Move this to a cpuhp callback, so that the file is created once
CPUs are brought online. This covers CPUs that are added late by
mechanisms like hotplug.
One observable difference is the file is now missing for offline CPUs.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
If the offline CPUs thing is a problem for the tools that consume
this value, we'd need to move cpu_capacity to be part of cpu.c's
common_cpu_attr_groups. However, attempts to discuss this just end
up in a black hole, so this is a non-starter. Thus, if this needs
to be done, it can be done as a separate patch.
---
 drivers/base/arch_topology.c | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index b741b5ba82bd..9ccb7daee78e 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -220,20 +220,34 @@ static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
 
 static DEVICE_ATTR_RO(cpu_capacity);
 
-static int register_cpu_capacity_sysctl(void)
+static int cpu_capacity_sysctl_add(unsigned int cpu)
 {
-	int i;
-	struct device *cpu;
+	struct device *cpu_dev = get_cpu_device(cpu);
 
-	for_each_possible_cpu(i) {
-		cpu = get_cpu_device(i);
-		if (!cpu) {
-			pr_err("%s: too early to get CPU%d device!\n",
-			       __func__, i);
-			continue;
-		}
-		device_create_file(cpu, &dev_attr_cpu_capacity);
-	}
+	if (!cpu_dev)
+		return -ENOENT;
+
+	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
+
+	return 0;
+}
+
+static int cpu_capacity_sysctl_remove(unsigned int cpu)
+{
+	struct device *cpu_dev = get_cpu_device(cpu);
+
+	if (!cpu_dev)
+		return -ENOENT;
+
+	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
+
+	return 0;
+}
+
+static int register_cpu_capacity_sysctl(void)
+{
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "topology/cpu-capacity",
+			  cpu_capacity_sysctl_add, cpu_capacity_sysctl_remove);
 
 	return 0;
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
