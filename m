Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B525ED7B97
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1H1TtiU77Wkuk1lH5dE/i/sTNmo9YhggOu+yubqPYc=; b=nyXUgPuc8mtKmh
	Txm6oA18LaCQ1KbTekIj+g1ziWNXjmfPQ5U+O22wC/WAHabnntE0eoZbK9K3jjg/9uIcoi0cDkZcA
	/ZwPjVbbmF5GYIQYptXzT75nrEVve15waDMH/s3tB5xVjOYyEqF9U+zWA1YxhbhmsjyjuFHw77Mtd
	0ETllubWmdoqR82qkSaYU9VyAFrM9+OVD5E2URZfMucVhlxYd/pjhqIzq7P/vFDXvRpyGU/37QAxp
	mol0RaqzZ0NQf5Xv+cwwvvs0iwiEDOOIElnuEYtgqB6y0gGgWW+FqygrmQ2c8dsGp0jcLMiVoZEH0
	VUIf/EdKnY1MFud3uqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUy-00000000Rpx-0P5P;
	Wed, 15 Apr 2026 01:57:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUu-00000000Rm6-1nJx
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 01:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 228374456B;
	Wed, 15 Apr 2026 01:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDC5C2BCB5;
	Wed, 15 Apr 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218216;
	bh=Lea9qWwpGuHllOHQE9OSrkA/WuGf4SHRx3thbVsosbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFKveISxFV8IdtZhbDOETnR0iVSzkuTt64rFB9vLFD7PCIF9+WpIVVPuRldO3FOzl
	 E3AXRXqSsJqgCB/TCs1inhulQhzi/34WyeiPFjC9/b8kHce1pi+lK0bD1Wo4rtAMUL
	 TZ3Ns57QCjOZ0efUYU9/0l3J94LAPVXetQIXpPRak94AZVap8/dGSvgFcuAFLsbg+f
	 YrhcDELM9WdTsJ3Qnh4+BajHUo7MqGsoeGLFQk3nxSmgtqPZW+bz7NlO/HD15OIG4p
	 qs3KqLUwv6YSLIC0D4yKVD0xcamC5AjjN8xo/1Y1yYOH7P9sJ8A/dgiUPD7i1O8O4S
	 fFCGDmcBohBEg==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Apr 2026 18:54:00 -0700
Subject: [PATCH RFC v3 06/11] RISC-V: QoS: add resctrl setup and domain
 management
MIME-Version: 1.0
Message-Id: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-6-b3b2e7e9847a@kernel.org>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9762; i=fustini@kernel.org;
 h=from:subject:message-id; bh=Lea9qWwpGuHllOHQE9OSrkA/WuGf4SHRx3thbVsosbw=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTe+5D0M+h2zLGQmp4rL+f2pq1y1Pn8Ic7wf9sN8+XxL
 hxSD+0Od5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmcuo1w/+KyeqHL1/KFPc5
 6+orKpmnP5WtccUdSV2ukoUKwjFeYWaMDC+t9rpuE2O7u+UBU9ZPn8DmvZHB++853VZ5ntaZ+dL
 1HQMA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185656_515073_4D17F894 
X-CRM114-Status: GOOD (  21.62  )
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

Add the setup and domain management layer: domain allocation
(qos_new_domain), controller value initialization
(qos_init_domain_ctrlval), resource struct initialization for cache and
bandwidth resources, domain registration with the resctrl filesystem
(qos_resctrl_add_controller_domain), and the top-level setup function
(qos_resctrl_setup) that probes all controllers and calls resctrl_init().

Also add qos_resctrl_online_cpu() and qos_resctrl_offline_cpu() for CPU
hotplug integration.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/kernel/qos/qos_resctrl.c | 295 +++++++++++++++++++++++++++++++++++-
 1 file changed, 294 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/qos/qos_resctrl.c b/arch/riscv/kernel/qos/qos_resctrl.c
index a4a120f89840..8d7e3b0abb75 100644
--- a/arch/riscv/kernel/qos/qos_resctrl.c
+++ b/arch/riscv/kernel/qos/qos_resctrl.c
@@ -675,7 +675,23 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domai
 
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
-	/* not implemented for the RISC-V resctrl implementation */
+	struct cbqri_resctrl_res *hw_res;
+	struct rdt_ctrl_domain *d;
+	enum resctrl_conf_type t;
+	u32 default_ctrl;
+	int i;
+
+	lockdep_assert_cpus_held();
+
+	hw_res = container_of(r, struct cbqri_resctrl_res, resctrl_res);
+	default_ctrl = resctrl_get_default_ctrl(r);
+
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		for (i = 0; i < hw_res->max_rcid; i++) {
+			for (t = 0; t < CDP_NUM_TYPES; t++)
+				resctrl_arch_update_one(r, d, i, t, default_ctrl);
+		}
+	}
 }
 
 void resctrl_arch_pre_mount(void)
@@ -797,3 +813,280 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	spin_unlock(&ctrl->lock);
 	return val;
 }
+
+static struct rdt_ctrl_domain *qos_new_domain(struct cbqri_controller *ctrl)
+{
+	struct cbqri_resctrl_dom *hw_dom;
+	struct rdt_ctrl_domain *domain;
+
+	hw_dom = kzalloc_obj(*hw_dom, GFP_KERNEL);
+	if (!hw_dom)
+		return NULL;
+
+	/* associate this cbqri_controller with the domain */
+	hw_dom->hw_ctrl = ctrl;
+
+	/* the rdt_domain struct from inside the cbqri_resctrl_dom struct */
+	domain = &hw_dom->resctrl_ctrl_dom;
+
+	INIT_LIST_HEAD(&domain->hdr.list);
+
+	return domain;
+}
+
+static int qos_init_domain_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *d)
+{
+	struct cbqri_resctrl_res *hw_res;
+	int err = 0;
+	int i;
+
+	hw_res = container_of(r, struct cbqri_resctrl_res, resctrl_res);
+
+	for (i = 0; i < hw_res->max_rcid; i++) {
+		err = resctrl_arch_update_one(r, d, i, 0, resctrl_get_default_ctrl(r));
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+static int qos_init_cache_resource(struct cbqri_controller *ctrl,
+				   struct cbqri_resctrl_res *cbqri_res,
+				   enum resctrl_res_level rid, char *name,
+				   enum resctrl_scope scope)
+{
+	struct rdt_resource *res = &cbqri_res->resctrl_res;
+
+	/* Already initialized by a previous controller at this cache level */
+	if (res->name) {
+		if (cbqri_res->max_rcid != ctrl->rcid_count ||
+		    res->cache.cbm_len != ctrl->cc.ncblks) {
+			pr_err("%s controllers have mismatched capabilities\n",
+			       name);
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	cbqri_res->max_rcid = ctrl->rcid_count;
+	cbqri_res->max_mcid = ctrl->mcid_count;
+	res->rid = rid;
+	res->name = name;
+	res->alloc_capable = ctrl->alloc_capable;
+	res->schema_fmt = RESCTRL_SCHEMA_BITMAP;
+	res->ctrl_scope = scope;
+	res->cache.cbm_len = ctrl->cc.ncblks;
+	res->cache.shareable_bits = resctrl_get_default_ctrl(res);
+	res->cache.min_cbm_bits = 1;
+	return 0;
+}
+
+static int qos_init_membw_resource(struct cbqri_controller *ctrl,
+				   struct cbqri_resctrl_res *cbqri_res)
+{
+	struct rdt_resource *res = &cbqri_res->resctrl_res;
+
+	if (res->name) {
+		if (cbqri_res->max_rcid != ctrl->rcid_count ||
+		    res->membw.max_bw != DIV_ROUND_UP(ctrl->bc.mrbwb * 100,
+						      ctrl->bc.nbwblks)) {
+			pr_err("MB controllers have mismatched capabilities\n");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	cbqri_res->max_rcid = ctrl->rcid_count;
+	cbqri_res->max_mcid = ctrl->mcid_count;
+	res->rid = RDT_RESOURCE_MBA;
+	res->name = "MB";
+	res->alloc_capable = ctrl->alloc_capable;
+	res->schema_fmt = RESCTRL_SCHEMA_RANGE;
+	/*
+	 * resctrl requires a cache scope for MBA domains. Use L3 as a
+	 * proxy until the framework supports non-cache scopes for
+	 * bandwidth resources.
+	 */
+	res->ctrl_scope = RESCTRL_L3_CACHE;
+	res->membw.delay_linear = true;
+	res->membw.arch_needs_linear = true;
+	res->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+	res->membw.min_bw = 1;
+	res->membw.max_bw = DIV_ROUND_UP(ctrl->bc.mrbwb * 100, ctrl->bc.nbwblks);
+	res->membw.bw_gran = 1;
+	return 0;
+}
+
+static int qos_resctrl_add_controller_domain(struct cbqri_controller *ctrl)
+{
+	struct rdt_ctrl_domain *domain;
+	struct cbqri_resctrl_res *cbqri_res = NULL;
+	struct rdt_resource *res = NULL;
+	struct list_head *pos = NULL;
+	int err;
+
+	domain = qos_new_domain(ctrl);
+	if (!domain)
+		return -ENOSPC;
+
+	switch (ctrl->type) {
+	case CBQRI_CONTROLLER_TYPE_CAPACITY:
+		cpumask_copy(&domain->hdr.cpu_mask, &ctrl->cache.cpu_mask);
+		domain->hdr.id = ctrl->cache.cache_id;
+
+		if (ctrl->cache.cache_level == 2) {
+			cbqri_res = &cbqri_resctrl_resources[RDT_RESOURCE_L2];
+			err = qos_init_cache_resource(ctrl, cbqri_res,
+						      RDT_RESOURCE_L2, "L2",
+						      RESCTRL_L2_CACHE);
+		} else if (ctrl->cache.cache_level == 3) {
+			cbqri_res = &cbqri_resctrl_resources[RDT_RESOURCE_L3];
+			err = qos_init_cache_resource(ctrl, cbqri_res,
+						      RDT_RESOURCE_L3, "L3",
+						      RESCTRL_L3_CACHE);
+		} else {
+			pr_err("unknown cache level %d\n", ctrl->cache.cache_level);
+			err = -ENODEV;
+		}
+		if (err)
+			goto err_free_domain;
+		res = &cbqri_res->resctrl_res;
+		break;
+
+	case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
+		cpumask_copy(&domain->hdr.cpu_mask, &ctrl->mem.cpu_mask);
+		domain->hdr.id = ctrl->mem.prox_dom;
+		if (ctrl->alloc_capable) {
+			cbqri_res = &cbqri_resctrl_resources[RDT_RESOURCE_MBA];
+			err = qos_init_membw_resource(ctrl, cbqri_res);
+			if (err)
+				goto err_free_domain;
+			res = &cbqri_res->resctrl_res;
+		}
+		break;
+
+	default:
+		pr_err("unknown controller type %d\n", ctrl->type);
+		err = -ENODEV;
+		goto err_free_domain;
+	}
+
+	if (!res)
+		goto out;
+
+	err = qos_init_domain_ctrlval(res, domain);
+	if (err)
+		goto err_free_domain;
+
+	if (resctrl_find_domain(&res->ctrl_domains, domain->hdr.id, &pos)) {
+		pr_err("duplicate domain id %d for resource %s\n",
+		       domain->hdr.id, res->name);
+		err = -EEXIST;
+		goto err_free_domain;
+	}
+	if (pos)
+		list_add_tail(&domain->hdr.list, pos);
+	else
+		list_add_tail(&domain->hdr.list, &res->ctrl_domains);
+
+	err = resctrl_online_ctrl_domain(res, domain);
+	if (err) {
+		pr_err("failed to online domain %d\n", domain->hdr.id);
+		list_del(&domain->hdr.list);
+		goto err_free_domain;
+	}
+
+out:
+	return 0;
+
+err_free_domain:
+	kfree(container_of(domain, struct cbqri_resctrl_dom, resctrl_ctrl_dom));
+	return err;
+}
+
+int qos_resctrl_setup(void)
+{
+	struct rdt_ctrl_domain *domain, *domain_temp;
+	struct cbqri_controller *ctrl;
+	struct cbqri_resctrl_res *res;
+	int err = 0;
+	int i = 0;
+
+	max_rmid = U32_MAX;
+
+	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
+		res = &cbqri_resctrl_resources[i];
+		INIT_LIST_HEAD(&res->resctrl_res.ctrl_domains);
+		INIT_LIST_HEAD(&res->resctrl_res.mon_domains);
+		res->resctrl_res.rid = i;
+	}
+
+	list_for_each_entry(ctrl, &cbqri_controllers, list) {
+		err = cbqri_probe_controller(ctrl);
+		if (err) {
+			pr_err("%s(): failed (%d)\n", __func__, err);
+			goto err_free_controllers_list;
+		}
+
+		err = qos_resctrl_add_controller_domain(ctrl);
+		if (err) {
+			pr_err("%s(): failed to add controller domain (%d)\n", __func__, err);
+			goto err_free_controllers_list;
+		}
+
+		/*
+		 * CDP (code data prioritization) on x86 is similar to
+		 * the AT (access type) field in CBQRI. CDP only supports
+		 * caches so this must be a CBQRI capacity controller.
+		 */
+		if (ctrl->type == CBQRI_CONTROLLER_TYPE_CAPACITY &&
+		    ctrl->cc.supports_alloc_at_code) {
+			if (ctrl->cache.cache_level == 2)
+				exposed_cdp_l2_capable = true;
+			else
+				exposed_cdp_l3_capable = true;
+		}
+	}
+	pr_debug("alloc=%d cdp_l2=%d cdp_l3=%d\n",
+		 exposed_alloc_capable,
+		 exposed_cdp_l2_capable, exposed_cdp_l3_capable);
+
+	err = resctrl_init();
+	if (err)
+		goto err_free_controllers_list;
+
+	return 0;
+
+err_free_controllers_list:
+	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
+		res = &cbqri_resctrl_resources[i];
+		list_for_each_entry_safe(domain, domain_temp, &res->resctrl_res.ctrl_domains,
+					 hdr.list) {
+			resctrl_offline_ctrl_domain(&res->resctrl_res, domain);
+			list_del(&domain->hdr.list);
+			kfree(container_of(domain, struct cbqri_resctrl_dom, resctrl_ctrl_dom));
+		}
+	}
+
+	list_for_each_entry(ctrl, &cbqri_controllers, list) {
+		if (!ctrl->base)
+			break;
+		iounmap(ctrl->base);
+		ctrl->base = NULL;
+		release_mem_region(ctrl->addr, ctrl->size);
+	}
+
+	return err;
+}
+
+int qos_resctrl_online_cpu(unsigned int cpu)
+{
+	resctrl_online_cpu(cpu);
+	return 0;
+}
+
+int qos_resctrl_offline_cpu(unsigned int cpu)
+{
+	resctrl_offline_cpu(cpu);
+	return 0;
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
