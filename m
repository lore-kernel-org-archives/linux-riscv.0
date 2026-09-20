Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C62C982DF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHfU9RJCIYkx24ejT/jvSLITJRx9eJEc+R+s6dlNad4=; b=blY5PeZfp5PeBy
	rfuyYZcIjLNgACv4edjPxXYmSzEm2nyaM0vwGSk7lO1R1HE/0O5X+7KEoZQVWYZe2N7wnH6DaJLeA
	vgNlFRKxuL3LMSEvAfn2nHQ6bM6XwfoBdC1uUzk1jJB8jFwjhn+y9MDnnzI0XxD4rAdVfDrIHGyAz
	whop8bmLnyVRndyOIQK+RgNE3EnziEzguKLFeqn50xKdykQch2VLLL+lPRaYdKNGPCJC6cXiITxvE
	EHquP31hvDVEgd9UpNQ0YZW60icq168yCpIAEnWNy6+aALDc0/W9jbzLxEhDVdqeES7DKzezaenlZ
	vOWI+oazAP8y0AIMUZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884m-0000000Gn9r-36ru;
	Sun, 20 Sep 2026 03:18:48 +0000
Received: from out-43.mta0.migadu.com ([2001:41d0:1004:224b::2b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884j-0000000Gn6Y-490r
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 03:18:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8qDy+DqOKnUJZTNHAtWwrfSexO/G9mwrT+liXKYn3E8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874323; v=1; x=1790479123;
 b=XUagWimWY1OpQwjkVhWz4/hu6rrtDujFtW9xyxvxoNQD8smrurJxjOefAAXNjqRiSb62vhys
 q7CyWLsN3QyEOtXH+3TrU4yOAuJoJPc9p6gHSo0kmFYkRHi3zrC+bEa50uaVDkmntV5NCSqTHCF
 v6o+tN3I153kenU39IQ0Q9LE=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id af7475f348ddaa80;
	Sun, 20 Sep 2026 03:18:43 +0000
X-Mizu-Trace-ID: af7475f348ddaa80
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Sun, 20 Sep 2026 11:18:04 +0800
Subject: [PATCH RFC 3/3] riscv: topology: Expose explicit CPU die topology
MIME-Version: 1.0
Message-Id: <20260920-riscv-die-topology-rfc-v1-3-071c0bf61d5f@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3696;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=8qDy+DqOKnUJZTNHAtWwrfSexO/G9mwrT+liXKYn3E8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrAxqfHg36OtFsBf+qk4LF/5dO8c4WXq9/Y5qW6Ladb
 89prfKa2lHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjCRug6Gv1I27otKp1RvUgqa
 6l1ScmpXBM8S2QszNQLlnSZV9z5X38HwV0Zr61xJX372Vhn7IleB4gPVxzKSv+z/feX5pbV50Ut
 r2AA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201846_192234_1D2D5967 
X-CRM114-Status: GOOD (  15.15  )
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

RISC-V uses the generic CPU topology model but does not provide die
topology accessors. The generic sysfs topology code consequently cannot
expose die identifiers or die sibling masks when firmware describes them.

Simply adding the accessors would create die_id, die_cpus, and
die_cpus_list on every RISC-V CPU. That would also expose -1 and a
single-CPU mask when neither DT nor ACPI supplied a die hierarchy.

Add an architecture-selectable visibility predicate for the die sysfs
attributes. Its default preserves the existing sysfs ABI on architectures
that already expose die topology. Make RISC-V expose the attributes only
when the generic topology parser recorded a non-negative die ID.

Legacy DTs, the current ACPI path, and the fallback topology leave die_id
at -1, so RISC-V does not create die sysfs files for them.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/include/asm/topology.h |  4 ++++
 drivers/base/topology.c           | 28 +++++++++++++++++++++++++++-
 include/linux/topology.h          |  3 +++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index fe1a8bf6902d9..5d99cb39f2819 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -8,6 +8,10 @@
 #include <asm/numa.h>
 #endif
 
+#define topology_die_id(cpu)		(cpu_topology[cpu].die_id)
+#define topology_die_cpumask(cpu)	(&cpu_topology[cpu].die_sibling)
+#define topology_die_sysfs_visible(cpu)	(topology_die_id(cpu) >= 0)
+
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick		topology_scale_freq_tick
 #define arch_set_freq_scale		topology_set_freq_scale
diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index c890e2a5b4280..74d5bb979b1b8 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -171,16 +171,42 @@ static struct attribute *default_attrs[] = {
 static umode_t topology_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int unused)
 {
-	if (attr == &dev_attr_ppin.attr && !topology_ppin(kobj_to_dev(kobj)->id))
+	unsigned int cpu = kobj_to_dev(kobj)->id;
+
+#ifdef TOPOLOGY_DIE_SYSFS
+	if (attr == &dev_attr_die_id.attr &&
+	    !topology_die_sysfs_visible(cpu))
+		return 0;
+#endif
+
+	if (attr == &dev_attr_ppin.attr && !topology_ppin(cpu))
 		return 0;
 
 	return attr->mode;
 }
 
+#ifdef TOPOLOGY_DIE_SYSFS
+static umode_t topology_bin_is_visible(struct kobject *kobj,
+				       const struct bin_attribute *attr, int unused)
+{
+	unsigned int cpu = kobj_to_dev(kobj)->id;
+
+	if ((attr == &bin_attr_die_cpus ||
+	     attr == &bin_attr_die_cpus_list) &&
+	    !topology_die_sysfs_visible(cpu))
+		return 0;
+
+	return attr->attr.mode;
+}
+#endif
+
 static const struct attribute_group topology_attr_group = {
 	.attrs = default_attrs,
 	.bin_attrs = bin_attrs,
 	.is_visible = topology_is_visible,
+#ifdef TOPOLOGY_DIE_SYSFS
+	.is_bin_visible = topology_bin_is_visible,
+#endif
 	.name = "topology"
 };
 
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 709a2dcf4c738..9c2c9096aff36 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -179,6 +179,9 @@ static inline int cpu_to_mem(int cpu)
 
 #if defined(topology_die_id) && defined(topology_die_cpumask)
 #define TOPOLOGY_DIE_SYSFS
+#ifndef topology_die_sysfs_visible
+#define topology_die_sysfs_visible(cpu)	((void)(cpu), true)
+#endif
 #endif
 #if defined(topology_cluster_id) && defined(topology_cluster_cpumask)
 #define TOPOLOGY_CLUSTER_SYSFS

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
