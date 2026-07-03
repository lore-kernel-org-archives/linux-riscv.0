Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E2C43602
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GcqdaSovPtH1soxIkh+X06YPnJttfawXHX1fsmAdzs=; b=IJgvtcOvbARLHk
	WPwQqS5wR+lhBfzK8A71v8bt+HHnQzYq01B3LW6omC87fX8GX+r27ttLvShjApk5KUo70yaU3Mvyq
	lCGeksFCEr/ga0QszFJwmm+37+1K6aVAPYtS5VUvTUuFDtefvWsBkeFKHoGkoqx2cWu2k74A8aS6d
	Og0Iud+5XZcC52HlvKcVNo9TzWgcatN+IrY9TAZl8JHpWULw6Am1/t3x0SS9tXs1LuXhdpWwrVVMk
	IQydgoXv0EqhYpsZ1yuU9wSEYKot3z3lzL4LoU43abjR2hvkQHU7jAJjBOnK8OrM9LZobkFI9weVy
	MEIY2+/2AElsLqYeWpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYp4-00000006JlT-196C;
	Fri, 03 Jul 2026 08:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYp2-00000006JlK-01Cf
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 08:00:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6942640ADD;
	Fri,  3 Jul 2026 08:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01171F000E9;
	Fri,  3 Jul 2026 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783065627;
	bh=N6cvB6ilYfXF9Z+EldI441PSyI9lUhF0hrtl69qJt7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gF2rbx1ppjqa9+2qsNeLPi+Dr2B6uYU5jU8z5gb2wDPgIeKuRlItYFkeO0++ERkLy
	 WPvyzPIjbipYpLrP67Ua4EXeUGGJAARcis1cpcHOZ7OgxypilI6yvDTW/4Os0pCDTR
	 Z7GmHDUQMB7BLPxVBNMicUYmFuqzJF9mbFZU+6XCsunk4+/GlRX7snOL6wXVMWrnE5
	 YWq6SdeWTqgCc8LOAZ9uRPf43Ho1otnVSXVTUDl4WKTMh60V2Wrn2HJ60Jy3GJ+43u
	 Wi1jX8hHDHYsBtIgrVL7mAbyxfChNsCoFG0jZBO4T3eCLC05Ig28n1JXtNZtyECWN7
	 aKPO4wDGwEZ+A==
Date: Fri, 3 Jul 2026 01:00:25 -0700
From: Drew Fustini <fustini@kernel.org>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <akdsGZm8e9w5idhn@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-5-c9c1342fe3cf@kernel.org>
 <473da771-b711-457b-b9ad-491fee111b16@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <473da771-b711-457b-b9ad-491fee111b16@nvidia.com>
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

On Wed, Jul 01, 2026 at 01:18:41PM -0700, Fenghua Yu wrote:
> Hi, Drew,

Hi, thanks for reviewing.

> Could you please change my email address to my NVIDIA email
> fenghuay@nvidia.com?

No problem.

> On 6/28/26 14:18, Drew Fustini wrote:
> > Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> > RDT_RESOURCE_L3 schemata.
> > 
> > Mismatched CC caps at the same cache level are treated as a fatal
> > configuration error since fs/resctrl exposes a single per-rid cap
> > set. Domains are created lazily in the cpuhp online callback so
> > cpu_mask reflects only currently online CPUs.
> > 
> > Assisted-by: Claude:claude-opus-4-7
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >   MAINTAINERS                      |   2 +
> >   arch/riscv/include/asm/resctrl.h | 147 ++++++++
> >   drivers/resctrl/Kconfig          |   4 +
> >   drivers/resctrl/Makefile         |   1 +
> >   drivers/resctrl/cbqri_resctrl.c  | 787 +++++++++++++++++++++++++++++++++++++++
> >   5 files changed, 941 insertions(+)
> [SNIP]
> 
> > +/*
> > + * Walk cbqri_controllers and pick one capacity controller (CC) per cache
> > + * level (L2/L3) to back the corresponding RDT_RESOURCE_L*. When more than
> > + * one CC sits at the same level (e.g. one per socket), they must agree on
> > + * rcid_count / ncblks / alloc_capable. A mismatch is fatal because resctrl
> > + * exposes a single set of caps per rid. The first matching controller wins.
> > + */
> > +static int cbqri_resctrl_pick_caches(void)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&cbqri_controllers_lock);
> 
> Is it better to change mutex_lock()/mutex_unlock() to
>  guard(mutex)(&cbqri_controllers_lock)?
> 
> 1. This code is simpler and can avoid potential missing unlock issue.
> 2. This matches mpam code.

Good point, I will switch cbqri_controllers_lock lock/unlock to
guard(mutex).

> 
> > +
> > +	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> > +		struct cbqri_resctrl_res *cbqri_res;
> > +		int rid;
> > +
> > +		if (ctrl->type != CBQRI_CONTROLLER_TYPE_CAPACITY)
> > +			continue;
> > +		if (!ctrl->alloc_capable)
> > +			continue;
> > +
> > +		rid = cbqri_cache_level_to_rid(ctrl->cache.cache_level);
> > +		if (rid < 0) {
> > +			pr_info("skipping controller at unsupported cache level %u\n",
> > +				ctrl->cache.cache_level);
> > +			continue;
> > +		}
> > +
> > +		cbqri_res = &cbqri_resctrl_resources[rid];
> > +		if (cbqri_res->ctrl) {
> > +			/*
> > +			 * CCs at the same cache level must agree on every cap
> > +			 * resctrl exposes globally. Reject mismatches at pick
> > +			 * time so the inconsistency is visible at boot.
> > +			 */
> > +			if (cbqri_res->ctrl->rcid_count != ctrl->rcid_count ||
> > +			    cbqri_res->ctrl->cc.ncblks != ctrl->cc.ncblks ||
> > +			    cbqri_res->ctrl->cc.supports_alloc_at_code !=
> > +				    ctrl->cc.supports_alloc_at_code ||
> > +			    cbqri_res->ctrl->alloc_capable != ctrl->alloc_capable) {
> > +				pr_err("L%d controllers have mismatched capabilities\n",
> > +				       ctrl->cache.cache_level);
> > +				ret = -EINVAL;
> > +				break;
> 
> Is it possible to support cbqri on both L2 and L3 on the same machine?
> Failure on one controller will stop picking another other controller here.
> 
> If both L2 and L3 can be supported on the same machine, does it make sense
> to pr_err() (fatal for this controller) and continue to go to the next
> controller? So failure on L2 won't impact L3?
> 
> If that's the case, does it make sense not to return error for
> pick_caches()? So pick_caches() failure is not fatal?

Yes, both L2 and L3 can be present at once, and you're right that this
approach was too strict. I will change it so that it drops only the
offending cache level. I will make pick_caches() clear that rid so it is
not exposed and continue to the next controller. It no longer returns an
error, so an L2 mismatch leaves L3, and any future QoS feature untouched.

[..]
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int err = 0;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	/*
> > +	 * Hold cbqri_controllers_lock across the walk so a controller
> > +	 * registered after boot cannot corrupt it. The register path takes
> > +	 * it as a leaf and never cbqri_domain_list_lock, so this nesting
> > +	 * cannot invert.
> > +	 */
> > +	mutex_lock(&cbqri_controllers_lock);
> 
> guard(mutex)(&cbqri_controllers_lock)?

Ack.

> > +static int cbqri_resctrl_setup(void)
> > +{
> > +	int rid;
> > +	int err;
> > +
> > +	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++)
> > +		cbqri_resctrl_resources[rid].resctrl_res.rid = rid;
> > +
> > +	err = cbqri_resctrl_pick_caches();
> > +	if (err)
> > +		return err;
> 
> Failure in pick_caches() will abort any future cbqri features e.g. memory bw
> allocation/monitoring. Is it possible to ignore the pick_caches() failure
> and continue to setup other cbqri features? Failed caches won't impact other
> QoS features, right?

You're right, and this is the same change as the L2/L3 mismatch above. I
will drop the error return from pick_caches() so that a cache problem can
no longer abort setup or block other QoS features. Cache capacity and
memory bandwidth are separate controller types that will be picked
independently, so a failed cache will not gate bandwidth alloc/mon when
those land. The only early return I will keep is the -ENODEV for when
nothing at all is exposable.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
