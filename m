Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173D2CD13DE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFcUvR46tIgJKv6EO78rmelC0N0H4pIEPSAYPkTzfNQ=; b=QkXchclJ8kHTTM
	U/Z7mWeRl/AzBOhjr3iOQx77+yepJYaltcGeIwlJXHirf1gLxPGyVVhkYYfAx33YeJ7Bs4jqaG5jt
	hV3gSzxlGMQ1ICuFP+Nf/2GWPXyY1PPlJy9d6qxwOe0ZMnTr6yJKK0MEDl3l6m4k6rCqHln4ThguW
	DY8e6MuQ0a4Nr0bAVtRi8Z+j//ejpsQFEw/bnxhNMZ/p4CcYULyTRGpoDPg0Dqe2Tj0vhmWmZ60tl
	/7ulwMe5VJIPmVxAEeuULihFVna7397rF3GfN5ryDyk7KZoEaiAcTvPpcEp4b6QEGQ8v1uHMhkAC9
	ojZ0uwaHYXTojslRWDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIawd-000000067lq-3jg1;
	Thu, 30 Apr 2026 23:37:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIawc-000000067lR-0Nxf
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 23:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A828340D96;
	Thu, 30 Apr 2026 23:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12042C2BCB3;
	Thu, 30 Apr 2026 23:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777592240;
	bh=EshY6j1HpzMOQVRhy5fZwtjSoZH1Z4wUejGMVerDcaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7mvH4Jw8CiQC3zExgrtpYVedQ2T2406qeW6wbB/25ge6k2hFasdM5MGJEqqtgIPL
	 kSHl2r4KQODOpZQFNBPZU8W/KggG/BOa5gyIgrQ+4gSQdMbTGjozmxTWiyYhxRh3Bc
	 t/XnrjFbSKd9BeRpSMXaFCkr87wTYLuIqmolV0tUnO0SuTe2UR9j9IszXUkotFTB1o
	 n1pqt9PMVVPKOeONyiZgVbjW+fOcTZLr+80ntv3RtQWxnqZaToaQ5IOnHhqcixVCrS
	 Ahe3mGMozxdDP9oBEt+rR16XIWFPy6c8GaIPLyPaWDm89+zMJ9WrDC/eHicoPrqCQf
	 gJPkTc56d011A==
Date: Thu, 30 Apr 2026 16:37:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v3 05/11] RISC-V: QoS: add resctrl arch callbacks for
 CBQRI controllers
Message-ID: <afPnrjAseS00a8k9@x1>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <20260414-ssqosid-cbqri-rqsc-v7-0-v3-5-b3b2e7e9847a@kernel.org>
 <03085c36-315a-47c8-85aa-f3de88fa43bd@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03085c36-315a-47c8-85aa-f3de88fa43bd@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_163722_168370_09563A13 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2026 at 04:17:22PM -0700, Reinette Chatre wrote:
> Hi Drew,
> 
> On 4/14/26 6:53 PM, Drew Fustini wrote:
> 
> > +int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> > +			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	struct cbqri_resctrl_dom *dom;
> > +	struct cbqri_config cfg;
> > +	int err = 0;
> > +
> > +	dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
> > +	ctrl = dom->hw_ctrl;
> > +
> > +	if (!r->alloc_capable)
> > +		return -EINVAL;
> > +
> > +	switch (r->rid) {
> > +	case RDT_RESOURCE_L2:
> > +	case RDT_RESOURCE_L3:
> > +		cfg.cbm = cfg_val;
> > +		err = cbqri_apply_cache_config(dom, closid, t, &cfg);
> > +		break;
> > +	case RDT_RESOURCE_MBA:
> > +		/* convert from percentage to bandwidth blocks */
> > +		cfg.rbwb = cfg_val * ctrl->bc.nbwblks / 100;
> > +		cfg.rbwb = min_t(u64, cfg.rbwb, ctrl->bc.mrbwb);
> > +		err = cbqri_apply_bw_config(dom, closid, t, &cfg);
> 
> (Earlier comment wondered about whether rbwb cannot just be provided
> directly to cbqri_apply_bw_config().)
> 
> Apart from that it looks like this can benefit from "emulated controls"
> that we mused about at https://lore.kernel.org/lkml/e788ca62-ec63-4552-978b-9569f369afd5@intel.com/
> 
> At this time this MBA resource is constrained by the 1% steps that the
> default MB control supports and clearly it is emulated with a control that
> can support finer granularities. I am currently working on a PoC of the
> base schema descriptions on which the support for emulated controls can
> be built that should be able to expose full hardware capability.
> 
> Reinette

Thank you for your review. I have been working on a large overhaul to
the series in v4 and was about to send it. I finally realized the
sematic mismatch between resctl MB resource and what the RISC-V CBQRI
spec offers. I decided to create MB_MIN for reserved bandwidth and
MB_WGHT (weight) for shared bandwidth porpotional weight.

I didn't expect adding two new resources to be the best solution but I
wanted to offer something tangible to move the discussion forward. I
look forward to your proof of concept as I expect I can then build
proper support CBQRI bandwidth allocation (reservation and proportional
share) on top of that.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
