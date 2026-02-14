Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C48EF584B
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAWdWqolMBMslnUSko0kBkNEkmVY5pjDIFYxsv5u6rc=; b=MZbRexWdGgxnWU
	047v7BPySvXnQMyzPRohl7db0CKBq2fiOjdGh1AfOQeRRlxyV2ha83yMf9pdy05xesHiSmPO+uIhJ
	cXdSe0Co3HO4eca2ZvdS8rOub0vbligQEGVWiD3HXjaRdzcNzwKSxqHu+kXGo6shWYxNqOZBEIWoZ
	iOyorhF/rjtiA5inYI9RBuNXSwn8ukquhu0Tz4pZnVDS2y2mIRa+Dl2+0yI4Yi3fxjnhvcU/Hd/fl
	klCx0wcncmCWbf8C60Rb6geC5XYOqOovMjBMX2vSvODFyE3JjtkQJzROzyuDWMMEoH/vFIrwinao5
	aKHTfrFgJ+rDjXx7duFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIap-00000004kvH-1YEK;
	Sat, 14 Feb 2026 16:34:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIan-00000004kvB-3cXE
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 16:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF912600BB;
	Sat, 14 Feb 2026 16:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA927C16AAE;
	Sat, 14 Feb 2026 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771086840;
	bh=4W58A1qF2KMzD+CNPgn+QF1OmJw16hqgvTE9E1HsVeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs9v7tEMNej7LNy7z7/h2afCc6HElvd5q9t+qse1Y1zd66p7wDvC2meIBgHJTTHfn
	 RG0micMqePg+kAByNIQfRKLoCBurORHuzEbiQ6FB8qIpytQhBhowe8TG72e12U28ng
	 io0Rb4ItKzI6PJvfj7x6BFlyfaEAK7Z+NAht2HzzxQvzYdmsGIUed6RYuS6wc0iFiu
	 Usi43vf67e7RZwNwTE2ydq2nGkezYIJhXzxgel++t2dMSCc9NnleO1fUEcklxhMFLA
	 UQuyHFuhmvsbmXHNg7RUu0UKO0I8Xc+astLdSmxQEnIH4s+kG9j0Ca2R6e7OejEoDx
	 9vffDt9JGbUIw==
Date: Sat, 14 Feb 2026 08:34:12 -0800
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl resources
 and domains
Message-ID: <aZCkBOPLof_Wr0t4@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
 <34bb3ae7-b48e-4c29-8762-0d16e0e7838f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34bb3ae7-b48e-4c29-8762-0d16e0e7838f@intel.com>
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 13, 2026 at 03:15:57PM -0800, Reinette Chatre wrote:
> Hi Drew,
> 
> (caveat for all my comments)
> I scanned this series for resctrl interactions and my comments are
> focused around that instead of a thorough review of all the code
> within. 

Thanks for spending the time to review. It has helped me to realize that
there is a lot cruft leftover from when I was developing based on the
mpam snapshot at the time (2023) and never reorganized after rebasing on
upstream.

> 
> On 1/28/26 12:27 PM, Drew Fustini wrote:
> > diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
> > index ff2c7eff50be..c0402dd06cfa 100644
> > --- a/arch/riscv/kernel/qos/internal.h
> > +++ b/arch/riscv/kernel/qos/internal.h
> > @@ -65,6 +65,11 @@
> >  #define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
> >  #define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
> >  
> > +int qos_resctrl_setup(void);
> > +void qos_resctrl_exit(void);
> > +int qos_resctrl_online_cpu(unsigned int cpu);
> > +int qos_resctrl_offline_cpu(unsigned int cpu);
> > +
> >  /* Capacity Controller hardware capabilities */
> >  struct riscv_cbqri_capacity_caps {
> >  	u16 ncblks; /* number of capacity blocks */
> > @@ -125,4 +130,26 @@ struct cbqri_controller {
> >  	bool mon_capable;
> >  };
> >  
> > +struct cbqri_resctrl_res {
> > +	struct rdt_resource     resctrl_res;
> > +	struct cbqri_controller controller;
> > +	u32 max_rcid;
> > +	u32 max_mcid;
> > +};
> > +
> > +struct cbqri_resctrl_dom {
> > +	struct rdt_domain_hdr       resctrl_dom_hdr;
> 
> The resctrl_dom_hdr above should not be needed and indeed does
> not seem to be used in this series. The two members below it,
> struct rdt_ctrl_domain and struct rdt_mon_domain (now named
> rdt_l3_mon_domain), have the necessary struct rdt_domain_hdr as
> their first member.

Thank you for the insight. I think added this when trying get the code
working again after rebasing from an old mpam snapshot to upstream last
year. It does seem like I didn't understand the data structures well
enough and should clean up cbqri_resctrl_dom.
> 
> Without any comments or changelog that describes the other members
> I am not able to really consider their inclusion here. From the
> names it seems that most members are intended to support the
> control domain usage so it is not clear to me why the cbqri domain
> contains both a control and monitor domain while they are interacted
> with separately by resctrl. From what I can tell resctrl_mon_dom
> is not used by this implementation.
> 
> As hinted above, when you rebase you will find that struct rdt_mon_domain
> is now named struct rdt_l3_mon_domain (see commit 4bc3ef46ff41
> ("x86,fs/resctrl: Rename struct rdt_mon_domain and rdt_hw_mon_domain")) to
> make it obvious that it is specific to L3 monitoring. Having this
> as a member for all cbqri domains will then become increasingly confusing
> since the cbqri_resctrl_dom is also used for L2 cache allocation as well as the
> memory bandwidth allocation that are not at L3 scope.
> 
> I think it may be simplest to drop the resctrl_mon_dom member until
> monitoring is supported?

Thanks for the suggestion. Monitoring broke when rebasing on upstream
and also the realization that my approach to MBM was too much of a hack.
I think that does make sense for me to remove all the monitoring code
until I have a working implementation based on the current upstream.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
