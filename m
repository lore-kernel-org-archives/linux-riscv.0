Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4033606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mleZMeJH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efNG74z8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JY/wK5L4Wx6VwPIDo9crI00kw+b11f8u6NkUwixpkoM=; b=mleZMeJHaUX4EaLrn1Br7PhUWi
	CWYjavHEdm8Zi3cNntmPVezlU1BQJqttYmzFp3elix9d/yAYMzVtbXfTSw2LpYInupystUl7hxHur
	fns854lXw5s6xKzOhiFheLZAKm13TiE9o411xBRO/vCBEB1DYK2sSJvBmBytCttgpZ3IfCCNkzM+U
	6CFLWrn+wCiMijUGy4N01lD8i7urwWImPzMKa0uWyh0QFiMNR5ihc//Je9sbHKppYCT4TQYb1j9D4
	Jd8pZ++cTKwZ9CHJDoWnukUII38FU2Bat0YjEIlrH4KYXdEaNsWQjsEdomLIclJ05guzcNRFiHIK1
	Gg1725bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCO5-0000000Djpr-3qJA;
	Fri, 20 Nov 2026 00:21:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCO4-0000000Djpc-2nzu
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 00:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD29D61CDE;
	Fri, 20 Nov 2026 00:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57511F000CF;
	Fri, 20 Nov 2026 00:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134115;
	bh=SsHavNkogIpI7nSHrLjpOauuyu7Lvjb2c0H5vhNetyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=efNG74z84LnywXEzj5pgJ+IsmYMxakE8hlwVWwV96UM4dTgGzigXWukNyTOQSor0u
	 cCok2FZ2ub5Za2ZkRVaQ/ATtFWeTg+I4bztCKx+Jtu7op1cYhuyY9dbHqS2ayDahgO
	 ScejRlZ7pqrZ9y717xpTdI9eks6feje9+y5tkFnqdNsfcQQImJT3KFVmKDo4KI8oCm
	 AXAZJx9ZCgl6nuy+WqBcnjd/ralYnfKyvFv903tUk/w0Jirsy8bzacHzqMD3X6jaFX
	 IROZuIW3H/gdGCZsd38rTYBqNKa/Aqa4jmq0huqsflA15NQBnZ0HdUcwR54BX5XSyw
	 ESgAqicZPctwQ==
Date: Thu, 19 Nov 2026 16:21:53 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 1/5] riscv_cbqri: Add capacity controller core
Message-ID: <av-SoU-qFbVqz6dn@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119000846.776930b3@jic23-hlaptop>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 12:08:46AM +0000, Jonathan Cameron wrote:
> On Sat, 14 Nov 2026 14:06:21 -0800
> Drew Fustini <fustini@kernel.org> wrote:
> 
> > Add the core for RISC-V CBQRI capacity controllers: the register
> > layout, the capability probe, and the allocation operations that
> > program a capacity block mask for an RCID and read it back.
> > 
> > A discovery layer maps the register block and describes the controller
> > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> > the controller from that descriptor and adds it to the controller list,
> > which stays private to the core. The core owns the controller state
> > after registration, so nothing in it depends on how the controller was
> > discovered. The caller keeps the register mapping alive.
> > 
> > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> 
> A couple more drive by comments.

Thanks for your attention!

> > diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> > new file mode 100644
> > index 000000000000..5522872f5cc1
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_devices.c
> 
> 
> > +
> > +/* Read the configured CBM for closid on the AT half via READ_LIMIT. */
> > +int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
> > +			    u32 at, u32 *cbm_out)
> > +{
> > +	int err;
> > +
> > +	guard(mutex)(&ctrl->lock);
> > +
> > +	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, at, 0);
> > +	if (err == 0) {
> > +		/*
> > +		 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
> > +		 * ncblks > 32, so the mask fits the low 32-bit word of the
> > +		 * cc_block_mask register.
> > +		 */
> > +		*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> > +	}
> > +
> > +	return err;
> Unless this gets more complex in later patches I'd do
> 	if (err)
> 		return err;
> 
> 	/*
> 	 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
> 	 * ncblks > 32, so the mask fits the low 32-bit word of the
> 	 * cc_block_mask register.
> 	 */
> 	*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> 
> 	return 0;
> 
> Just to keep error handling out of line and that
> comment block less indented.

It doesn't get more complex so I will change it.

[..]
> > +	/* The resctrl glue keys its domains on cache_id, one controller each. */
> > +	list_for_each_entry(other, &cbqri_controllers, list) {
> > +		if (other->cache.cache_level == info->cache_level &&
> > +		    other->cache.cache_id == info->cache_id) {
> > +			pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
> > +				&ctrl->addr, info->cache_level, info->cache_id,
> > +				&other->addr);
> > +			return -EEXIST;
> > +		}
> > +	}
> > +
> > +	list_add_tail(&ctrl->list, &cbqri_controllers);
> > +	retain_and_null_ptr(ctrl);
> 
> Common trick for this is something like:
> 
> 	list_add_tail(&no_free_ptr(ctrl)->list, &cbqri_controllers);
> 
> because it couples ownership passing with stopping the autofree
> magic.  I'd personally only use retain_and_null_ptr() in cases where I need
> to check for success of the ownership being handed off.

Thanks, I will use no_free_ptr.

[..]
> > +/**
> > + * struct cbqri_controller_info - registration descriptor
> > + * @addr:        MMIO base address of the controller's register interface
> > + * @size:        size of the MMIO region
> > + * @type:        controller type (capacity)
> > + * @rcid_count:  number of supported RCIDs
> > + * @cache_id:    cache id used as the resctrl domain id
> > + * @cache_level: cache level (2 or 3) the controller backs
> > + * @base:        mapped register block, which the caller keeps mapped for
> > + *               the life of the system
> Out of order documentation is unusual.  Why?

No reason, I'll fix it.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
