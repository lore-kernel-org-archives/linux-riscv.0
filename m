Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95AE606A32F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 00:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g0GcB+yD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlHl1Mci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CGIMH4XfW6JRe9ymbfklJ6y5y6oY+rIvufOGbtBhWxU=; b=g0GcB+yDRbtaAf8EcPX45Eizr0
	A125uGkVqsNWEFRUXKW8DUCLMgrlfpBBOjw8UY4rtVqKIYvlXsQvZSN4usy4X7/OQPFIErpBZM9jF
	tk4Ajhb0BeKg+FYUKuLUM7HkZ+2U/5WCD+o3rLjboXRYYp6qsHXY6ydTED99/GoTfR5rn7wDw9Oom
	kJum+/bk0pDNSY6yu9de5gjJku0Zo0OwbR/YjPPln7Oiq4FashmzSQL1YKP5F1CYNexpBp5Rtiz6U
	8VmcHhtBQrTPT/EL3V6Xo8F0Jv9d6j8HGSv1cx9R4h7a01/1UjrZ+Vb6da0UsfU2lV7XlN7SJCZf2
	xgYuVNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpi1-0000000AYcN-2aia;
	Thu, 19 Nov 2026 00:09:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTphz-0000000AYcA-2Q5g
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 00:08:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0F9C61F0D;
	Thu, 19 Nov 2026 00:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F5F1F000C4;
	Thu, 19 Nov 2026 00:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046938;
	bh=oCtb0rmvOejtjE2/BHaNuLkSWcxZ+u9oa3/QMh/gz8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SlHl1McigILCjwGqLBRVEYs44LEZkG27A3EF/tAmD2VvmyZKhzgkZy3BKB1j6XypZ
	 mZUVdeSvC8y6ukb0YUQtoINI0F9Ld5Uc5Scouj/YvTTWTHLLQZICmZjH0Ee/9OJ+yZ
	 Ss+4j4hUthyFUF7j5M4IBaZzqC0wmCQvpJk7tDinjxkEr2aayn6MX1jWTd0qBRa1CF
	 lERVIYcl8+J776Ruy+yubAqvf5YcO2BBO9z9ltaY6WMqx2pgbVKImlh9BKaYt3SZR3
	 +6xWb86OFrIc2DXlPWGm8K2/xkvlcVLc9Li3Cy/ogyhizIf8/rmKSvxD+wz5c/YoPc
	 ELAgsr8wJGC7g==
Date: Thu, 19 Nov 2026 00:08:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan
 <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei
 <cp0613@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua
 Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong
 Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse
 <james.morse@arm.com>, Kornel =?UTF-8?B?RHVsxJliYQ==?=
 <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter Newman
 <peternewman@google.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, Tony
 Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui
 <cuiyunhui@bytedance.com>, Zhanpeng Zhang
 <zhangzhanpeng.jasper@bytedance.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng
 Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 1/5] riscv_cbqri: Add capacity controller core
Message-ID: <20261119000846.776930b3@jic23-hlaptop>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
	<20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 14:06:21 -0800
Drew Fustini <fustini@kernel.org> wrote:

> Add the core for RISC-V CBQRI capacity controllers: the register
> layout, the capability probe, and the allocation operations that
> program a capacity block mask for an RCID and read it back.
> 
> A discovery layer maps the register block and describes the controller
> in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> the controller from that descriptor and adds it to the controller list,
> which stays private to the core. The core owns the controller state
> after registration, so nothing in it depends on how the controller was
> discovered. The caller keeps the register mapping alive.
> 
> Tested-by: Zeng Heng <zengheng@picoheart.com>
> Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

A couple more drive by comments.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> new file mode 100644
> index 000000000000..5522872f5cc1
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_devices.c


> +
> +/* Read the configured CBM for closid on the AT half via READ_LIMIT. */
> +int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
> +			    u32 at, u32 *cbm_out)
> +{
> +	int err;
> +
> +	guard(mutex)(&ctrl->lock);
> +
> +	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, at, 0);
> +	if (err == 0) {
> +		/*
> +		 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
> +		 * ncblks > 32, so the mask fits the low 32-bit word of the
> +		 * cc_block_mask register.
> +		 */
> +		*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> +	}
> +
> +	return err;
Unless this gets more complex in later patches I'd do
	if (err)
		return err;

	/*
	 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
	 * ncblks > 32, so the mask fits the low 32-bit word of the
	 * cc_block_mask register.
	 */
	*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);

	return 0;

Just to keep error handling out of line and that
comment block less indented.

> +}


> +/**
> + * riscv_cbqri_register_cc() - register a capacity controller
> + * @info: registration descriptor. info->type must be CAPACITY. The resctrl
> + *        glue maps info->cache_level to the L2/L3 resource and uses
> + *        info->cache_id as the domain id.
> + *
> + * The caller resolves the cache level and id from its firmware description.
> + * Domain membership is resolved per CPU at hotplug, so no cpu mask is stored.
> + *
> + * Return: 0 on success, -EEXIST when a controller for the same cache level
> + * and id is already registered, or another negative errno on failure.
> + */
> +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> +{
> +	struct cbqri_controller *other;
> +	int err;
> +
> +	if (!info->addr) {
> +		pr_warn("skipping controller with invalid addr=0x0\n");
> +		return -EINVAL;
> +	}
> +
> +	if (info->type != CBQRI_CONTROLLER_TYPE_CAPACITY) {
> +		pr_warn("register_cc called with non-capacity type %u\n",
> +			info->type);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * SRMCFG encodes RCID in 12 bits. Reject an out-of-range count rather
> +	 * than let FIELD_PREP(SRMCFG_RCID_MASK, closid) truncate it silently.
> +	 */
> +	if (info->rcid_count > FIELD_MAX(SRMCFG_RCID_MASK) + 1) {
> +		pr_warn("CC at %pa has RCID count %u beyond the 12-bit SRMCFG field, skipping\n",
> +			&info->addr, info->rcid_count);
> +		return -EINVAL;
> +	}
> +
> +	struct cbqri_controller *ctrl __free(kfree) =
> +		kzalloc(sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	mutex_init(&ctrl->lock);
> +
> +	ctrl->base = info->base;
> +	ctrl->addr = info->addr;
> +	ctrl->size = info->size;
> +	ctrl->type = info->type;
> +	ctrl->rcid_count = info->rcid_count;
> +	ctrl->cache.cache_id = info->cache_id;
> +	ctrl->cache.cache_level = info->cache_level;
> +
> +	err = cbqri_probe_controller(ctrl);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * alloc_capable comes from the probe above and rcid_count from the
> +	 * discovery layer. Two RCIDs are the minimum for a useful system.
> +	 * resctrl reserves RCID 0 for the default group, so one RCID has
> +	 * nothing to allocate between, and CDP would halve it to zero.
> +	 * Reject fewer than two.
> +	 */
> +	if (ctrl->alloc_capable && ctrl->rcid_count < 2) {
> +		pr_warn("CC at %pa is alloc-capable but has fewer than 2 RCIDs, skipping\n",
> +			&ctrl->addr);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&cbqri_controllers_lock);
> +
> +	/* The resctrl glue keys its domains on cache_id, one controller each. */
> +	list_for_each_entry(other, &cbqri_controllers, list) {
> +		if (other->cache.cache_level == info->cache_level &&
> +		    other->cache.cache_id == info->cache_id) {
> +			pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
> +				&ctrl->addr, info->cache_level, info->cache_id,
> +				&other->addr);
> +			return -EEXIST;
> +		}
> +	}
> +
> +	list_add_tail(&ctrl->list, &cbqri_controllers);
> +	retain_and_null_ptr(ctrl);

Common trick for this is something like:

	list_add_tail(&no_free_ptr(ctrl)->list, &cbqri_controllers);

because it couples ownership passing with stopping the autofree
magic.  I'd personally only use retain_and_null_ptr() in cases where I need
to check for success of the ownership being handed off.


> +	return 0;
> +}
> diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
> new file mode 100644
> index 000000000000..c3e39e6d30c5
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_internal.h

> diff --git a/include/linux/riscv_cbqri.h b/include/linux/riscv_cbqri.h
> new file mode 100644
> index 000000000000..b0daa1a7e42f
> --- /dev/null
> +++ b/include/linux/riscv_cbqri.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Public registration API for the RISC-V Capacity and Bandwidth QoS
> + * Register Interface (CBQRI) core. Discovery layers call
> + * riscv_cbqri_register_cc() to hand a capacity controller descriptor to
> + * the core, which owns all subsequent state.
> + */
> +#ifndef _LINUX_RISCV_CBQRI_H
> +#define _LINUX_RISCV_CBQRI_H
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +enum cbqri_controller_type {
> +	CBQRI_CONTROLLER_TYPE_CAPACITY,
> +};
> +
> +/**
> + * struct cbqri_controller_info - registration descriptor
> + * @addr:        MMIO base address of the controller's register interface
> + * @size:        size of the MMIO region
> + * @type:        controller type (capacity)
> + * @rcid_count:  number of supported RCIDs
> + * @cache_id:    cache id used as the resctrl domain id
> + * @cache_level: cache level (2 or 3) the controller backs
> + * @base:        mapped register block, which the caller keeps mapped for
> + *               the life of the system
Out of order documentation is unusual.  Why?

> + */
> +struct cbqri_controller_info {
> +	phys_addr_t			addr;
> +	phys_addr_t			size;
> +	void __iomem			*base;
> +	enum cbqri_controller_type	type;
> +	u32				rcid_count;
> +	u32				cache_id;
> +	u32				cache_level;
> +};
> +
> +#if IS_ENABLED(CONFIG_RISCV_CBQRI)
> +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info);
> +#else
> +static inline int
> +riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
> +#endif /* _LINUX_RISCV_CBQRI_H */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
