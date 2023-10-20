Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9561FC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2jtShSozuIOUSeCdAncg9r8WJSaBItuZS21WW/xn8o=; b=S0g/g2Ep/eTKZL
	8TH0tubI0mhn27Ttl1A0A6dSDTqDRQ/MNIeQ5CQkbO0RTfO3BMMunceV5S8VuRmuysvSj5OADDsGi
	bRD3QNbdJQVtA2Hx73JsEDINNW2kqELOcdflDaNVwhjRfpVudWX4k18v4cD3ik64N35AZMkScIcqV
	19dpDtrWfApu36rtLB9iL3H5WVuBmzkMYYaq1PVOadkVtp7nOQeGjUB3VMk0p+I3bn6D1VLTpFpA9
	4/Kkx4GdYfinc4ct3783woY728E9GJD7FhjWjrwLNp1Gdf1dr1JgP6rpM8Q1Mx7FMEcUkuIYOrs+q
	vJejn2/HN4xmFA7YiZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpoD-002Pgp-2F;
	Fri, 20 Oct 2023 13:45:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpo5-002Pc8-0E;
	Fri, 20 Oct 2023 13:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EaJhZw0Zk+uukZ21AQLL1Wa3YNXD1P5PVQhDy79M9q0=; b=Y30Q5KtPVsMmfXmbaBaWKFuqkc
	4bqAUIrotpwascfiGwvAM0YfAx5r4v8d/93HKciObRSjY7n+A0rEs934jpl7SxrlFtDG+3WRlsmNI
	cNiSD21IKCVlHirpNr5MZGKmaa+Oy5SjiNPjHKJayZV2j9UbMHI/HvaNvluDtNQsUEyK3472J/14p
	y+c/KUjPdCl7vBQCqJnu+X+2oSn2/Ja8aXwfAC619F6dVJm89BeZF21oAKs4/ZQdyCt7IyfaiOlbe
	MXK7DC4bnANefohp3DoFA6aUIBc2qDKxDfx+OF9DeG9E3QSyDnqPLLiEvpXyDqZtG3SNsydKOetci
	0CN/heNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48962)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qtpno-0000T7-2b;
	Fri, 20 Oct 2023 14:44:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qtpnn-0001aP-Tx; Fri, 20 Oct 2023 14:44:35 +0100
Date: Fri, 20 Oct 2023 14:44:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com, gregkh@linuxfoundation.org
Subject: Re: [RFC PATCH v2 11/35] arch_topology: Make
 register_cpu_capacity_sysctl() tolerant to late CPUs
Message-ID: <ZTKEQz0DJuv/tqNH@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-12-james.morse@arm.com>
 <20230914130126.000069db@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914130126.000069db@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_064453_109196_5B47F68E 
X-CRM114-Status: GOOD (  32.93  )
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

On Thu, Sep 14, 2023 at 01:01:26PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:37:59 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > register_cpu_capacity_sysctl() adds a property to sysfs that describes
> > the CPUs capacity. This is done from a subsys_initcall() that assumes
> > all possible CPUs are registered.
> > 
> > With CPU hotplug, possible CPUs aren't registered until they become
> > present, (or for arm64 enabled). This leads to messages during boot:
> > | register_cpu_capacity_sysctl: too early to get CPU1 device!
> > and once these CPUs are added to the system, the file is missing.
> > 
> > Move this to a cpuhp callback, so that the file is created once
> > CPUs are brought online. This covers CPUs that are added late by
> > mechanisms like hotplug.
> > One observable difference is the file is now missing for offline CPUs.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> > If the offline CPUs thing is a problem for the tools that consume
> > this value, we'd need to move cpu_capacity to be part of cpu.c's
> > common_cpu_attr_groups.
> 
> I think we should do that anyway and then use an is_visible() if we want to
> change whether it is visible in offline cpus.
> 
> Dynamic sysfs file creation is horrible - particularly when done
> from an totally different file from where the rest of the attributes
> are registered.  I'm curious what the history behind that is.
> 
> Whilst here, why is there a common_cpu_attr_groups which is
> identical to the hotpluggable_cpu_attr_groups in base/cpu.c?

Looking into doing this, the easy bit is adding the attribute group
with an appropriate .is_visible dependent on cpu_present(), but we
need to be able to call sysfs_update_groups() when the state of the
.is_visible() changes.

Given the comment in sysfs_update_groups() about "if an error occurs",
rather than making this part of common_cpu_attr_groups, would it be
better that it's part of its own set of groups, thus limiting the
damage from a possible error? I suspect, however, that any error at
that point means that the system is rather fatally wounded.

This is what I have so far to implement your idea, less the necessary
sysfs_update_groups() call when we need to change the visibility of
the attributes.

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 9ccb7daee78e..06c9fc6620d2 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -215,43 +215,24 @@ static ssize_t cpu_capacity_show(struct device *dev,
 	return sysfs_emit(buf, "%lu\n", topology_get_cpu_scale(cpu->dev.id));
 }
 
-static void update_topology_flags_workfn(struct work_struct *work);
-static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
-
 static DEVICE_ATTR_RO(cpu_capacity);
 
-static int cpu_capacity_sysctl_add(unsigned int cpu)
-{
-	struct device *cpu_dev = get_cpu_device(cpu);
-
-	if (!cpu_dev)
-		return -ENOENT;
-
-	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
-
-	return 0;
-}
-
-static int cpu_capacity_sysctl_remove(unsigned int cpu)
+static umode_t cpu_present_attrs_visible(struct kobject *kobi,
+					 struct attribute *attr, int index)
 {
-	struct device *cpu_dev = get_cpu_device(cpu);
-
-	if (!cpu_dev)
-		return -ENOENT;
-
-	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
+	struct device *dev = kobj_to_dev(kobj);
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
 
-	return 0;
+	return cpu_present(cpu->dev.id) ? attr->mode : 0;
 }
 
-static int register_cpu_capacity_sysctl(void)
-{
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "topology/cpu-capacity",
-			  cpu_capacity_sysctl_add, cpu_capacity_sysctl_remove);
+const struct attribute_group cpu_capacity_attr_group = {
+	.is_visible = cpu_present_attrs_visible,
+	.attrs = cpu_capacity_attrs
+};
 
-	return 0;
-}
-subsys_initcall(register_cpu_capacity_sysctl);
+static void update_topology_flags_workfn(struct work_struct *work);
+static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
 
 static int update_topology;
 
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index a19a8be93102..954b045705c2 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -192,6 +192,9 @@ static const struct attribute_group crash_note_cpu_attr_group = {
 static const struct attribute_group *common_cpu_attr_groups[] = {
 #ifdef CONFIG_KEXEC
 	&crash_note_cpu_attr_group,
+#endif
+#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
+	&cpu_capacity_attr_group,
 #endif
 	NULL
 };
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index e117c06e0c6b..745ad21e3dc8 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -30,6 +30,8 @@ struct cpu {
 	struct device dev;
 };
 
+extern const struct attribute_group cpu_capacity_attr_group;
+
 extern void boot_cpu_init(void);
 extern void boot_cpu_hotplug_init(void);
 extern void cpu_init(void);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
