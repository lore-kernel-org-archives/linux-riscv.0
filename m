Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DAE60A260C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4vHgsyf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nEILtDJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FuHlc6SvjpgLWq7eCmecGtjzq3VMT9L+tbktClUWcyM=; b=b4vHgsyft4oWjZN3S5aI8SAXVu
	xmi6G4bLSzRH5Jd2cAP7o+vf4UvLW1XIUJfvE3oKAamYo0frPNOt/iJJwFxsB47ysqFEk8kkHB61B
	jFQz4ONt06efmIRbfjxaxzyt5oie32+wBel6pMydIe+Uzf3+sC78mRXhfGhkCcbA5I7MM2xKdXKVT
	a9JSS3mfTO0+9+J6rXIgh7NG5CSJ6uxet+m+sMfXGPMcawp9Jhjrg5dhSXthBXF7i1xpWqN2U7wNZ
	EOPqIYyEwuj08Tw7yIKD19V6K/qAqH6NM6NF+rQ/gD8teqIJFLgzs08oBN+MEO80sZLC2+lvZ8Zne
	3j9R6QrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzq-0000000EQoR-26n0;
	Thu, 22 Oct 2026 15:46:26 +0000
Received: from out-193.mta0.migadu.com ([2001:41d0:1004:224b::c1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzl-0000000EQky-2dPO
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 15:46:23 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JMdDrJYGHoatl+CVcAcsdrIs5ssl7riEmzRfx4ikLh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683979; v=1; x=1793288779;
 b=nEILtDJcz+736p/Eemboi36CcrizEp4oc+YAgxGbIm9a+CHFnbE+3YvPIN7m0xCNxjfgHl3p
 HAGSv0sfRG8LPlcw20+X4GWtQ3HVXNooGpFaMZrcf+LvlHksxw/XFMgMpNYfR9rkKTJvYx/kRMV
 PCF/F3YHQOj5zemaivk+BZ9Q=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 96cd205962e0f05a;
	Thu, 22 Oct 2026 15:46:19 +0000
X-Mizu-Trace-ID: 96cd205962e0f05a
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 3/5] irqchip/riscv-imsic: Add MSI address list
Date: Thu, 22 Oct 2026 17:46:01 +0200
Message-ID: <20261022154603.1374754-4-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_084621_852001_34B5ECB5 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
host IMSIC target into one contiguous MSI IOVA range. MSI message
composition then uses the target CPU's position within that range.

Build an IMSIC physical address array indexed by logical CPU.
Require every possible CPU to have an initialized IMSIC page before
publishing the array. This preserves physical address zero as a valid
target and guarantees the array has num_possible_cpus() entries.

The array size and each target's index can therefore be derived
directly, without storing duplicate count or per-CPU index metadata.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..eb525c324982 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -687,6 +687,31 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
 
+static int __init imsic_init_msi_pa_list(void)
+{
+	struct imsic_global_config *global = &imsic->global;
+	phys_addr_t *msi_pa_list;
+	unsigned int cpu;
+
+	msi_pa_list = kcalloc(num_possible_cpus(), sizeof(*msi_pa_list), GFP_KERNEL);
+	if (!msi_pa_list)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+
+		if (!local->msi_va) {
+			kfree(msi_pa_list);
+			return -ENODEV;
+		}
+
+		msi_pa_list[cpu] = local->msi_pa;
+	}
+
+	imsic->msi_pa_list = msi_pa_list;
+	return 0;
+}
+
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
@@ -937,6 +962,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		goto out_local_cleanup;
 	}
 
+	rc = imsic_init_msi_pa_list();
+	if (rc) {
+		pr_err("%pfwP: failed to initialize MSI address list\n", fwnode);
+		goto out_local_cleanup;
+	}
+
 	/* Initialize matrix allocator */
 	rc = imsic_matrix_init();
 	if (rc) {
@@ -962,6 +993,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 out_free_local:
 	free_percpu(imsic->global.local);
 out_free_priv:
+	kfree(imsic->msi_pa_list);
 	kfree(imsic);
 	imsic = NULL;
 	return rc;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..e51c61dcced3 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -50,6 +50,9 @@ struct imsic_priv {
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
 
+	/* MSI target physical addresses indexed by logical CPU for IOMMU mapping */
+	phys_addr_t				*msi_pa_list;
+
 	/* Per-CPU state */
 	struct imsic_local_priv __percpu	*lpriv;
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
