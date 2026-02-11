Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E100FEB5946
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 00:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJCsX7/4NPrSf1r+3w3LHPZZZl4CmgA+NHCg+wqDHgc=; b=yVeGvxxw9deELJ
	2aM/401vBfWBC6HaFUKEWh7iQbrVL263HvkvYc5ZZaDYnn7M7sRXh12/hzYeMa8EjoYVAnspf8VZT
	M8ZttDgFt7L01/qOKse9i6PKJDRvbiu8/kmZXiP1gmNWePHV0NaB7R6IoGzflBdpd4DOPgicANa8k
	+Hcq/GyhQ/ph3bJmkQSwZbqobFCij9BNJyN3k6fivd3BFKU3l3JWgoaXSVpUxjougEHh1dIcqrj1B
	nxn+eqDdd0oaXmfyrTz1ntCiJTbTaa5GqFg2NyA/Rqmsk3e6Gt7qzH3Iy4q6vzJOdVOSvh3D7xriY
	UTh9NBvuNdLejCX7rBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpyXV-000000004Jg-1f53;
	Wed, 11 Feb 2026 00:57:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpyXT-000000004Ja-3lap
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 00:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8328160136;
	Wed, 11 Feb 2026 00:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92776C116C6;
	Wed, 11 Feb 2026 00:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770771426;
	bh=yzkylkEQyMlLPX3kedBSzjU8RsbSf5Jk4i2N65fCL30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vsd+Xx+447hSpwSmZtlt6wlU5Hsp407El/yFKvfrSUqG3FQLSrDuVoVM2V36u6YDn
	 1mo+o/9mKLtQoy/ggzuyPhHQ90EZlJ5/SJcYf0kxikYec8x+iqQ7dj690JynShMoiw
	 7iWldpWyz+lEAyyK4Gqz4ZtYUJ344F3VnoTZbuU2Q0EbOykBR4n/0+YM03kjkyajTH
	 k49D3J6/m8KCdRCyjHnLyE6jOnu9uAhfn/SnU5gh8XKWyeuwXazTEo2syDUuEgGHC5
	 8ybe5SdKk8diqA5JAdonfw4eNFzGAZ0saK5NJLG3bJ+DQ04fk2I8NCFr8GYJzAM8Wm
	 pnz+0JYn9w8yw==
Date: Tue, 10 Feb 2026 16:57:04 -0800
From: Drew Fustini <fustini@kernel.org>
To: Gong Shuai <gsh517025@gmail.com>
Subject: Re: [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl interface for
 CBQRI controllers
Message-ID: <aYvT4I7qWyJGuMDR@gen8>
References: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
 <20260209141649.330184-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260209141649.330184-1-gong.shuai@sanechips.com.cn>
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
Cc: x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, cp0613@linux.alibaba.com, cuiyunhui@bytedance.com, gong.shuai@sanechips.com.cn, zhiwei_liu@linux.alibaba.com, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, vasu@rivosinc.com, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, palmer@dabbelt.com, rkrcmar@ventanamicro.com, Dave.Martin@arm.com, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, npitre@baylibre.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, pjw@kernel.org, tony.luck@intel.com, peternewman@google.com, linux-kernel@vger.kernel.org, fenghua.yu@intel.com, samuel.holland@sifive.com, james.morse@arm.com, krzk+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 09, 2026 at 10:16:49PM +0800, Gong Shuai wrote:
> Hi, Drew
> 
> > Add interface for CBQRI controller drivers to make use of the resctrl
> > filesystem.
> > 
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> >
> > ...
> >
> > +u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> > +			    u32 closid, enum resctrl_conf_type type)
> > +{
> > +	struct cbqri_resctrl_dom *hw_dom;
> > +	struct cbqri_controller *ctrl;
> > +	int reg_offset;
> > +	u32 percent;
> > +	u32 rbwb;
> > +	u64 reg;
> > +	int err;
> > +
> > +	hw_dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
> > +
> > +	ctrl = hw_dom->hw_ctrl;
> > +
> > +	if (!r->alloc_capable)
> > +		return resctrl_get_default_ctrl(r);
> > +
> > +	switch (r->rid) {
> > +	case RDT_RESOURCE_L2:
> > +	case RDT_RESOURCE_L3:
> > +		/* Clear cc_block_mask before read limit operation */
> > +		cbqri_set_cbm(ctrl, 0);
> > +
> > +		/* Capacity read limit operation for RCID (closid) */
> > +		err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, type, closid);
> 
> It looks like the parameter order might be incorrect. I believe it
> should be:
> cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, type);

Thanks, I will fix so that closid and type are the correct order.
> 
> > +		if (err < 0) {
> > +			pr_err("%s(): operation failed: err = %d", __func__, err);
> > +			return resctrl_get_default_ctrl(r);
> > +		}
> > ...
> 
> Sorry for the resend, my company email had some formatting issues,
> so I'm sending this from my personal address.
> 
> Hope it doesn't cause any trouble!

No problem.

Thanks
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
