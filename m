Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C13C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/eij+cdhVOyGxG2NCv6lGKYqqiGj2YznnDmnVy5RSk=; b=Pn+e+FiW1ZOBhw
	ObO50Emje1f3ympVriL/o2S5WSU7njsa9iSKXcQBhl5zjL6p1DUxqm3znhJoVhwhrdPbLs6txnYiv
	uaYRSNfcvgQoPqnhE9SrcOBmVg7ZN6wDJLokoGTzI507ZwVuaSO1mfipt+nISCAPrBbBXoWzUSP00
	OSDdp+oX3ej8tUl+8104QDBT0F7uhGCYQi8iFewe/K8kbWwKRoxePv6g/StjCfSBShc798Ag3ilnt
	3KBJiuE4hfVs+/7mQN9n5hXvIwxhnLoFv92A/cgEbs5HQdiXurrRy6EWvUHmtt0HobDiGk4fno1cX
	+xawf4LNNI5Mf1c3MjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Q7-009ylt-Cp; Wed, 04 Jan 2023 15:11:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD1D5-008TC8-BW
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 10:41:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C11A1063;
	Wed,  4 Jan 2023 02:42:02 -0800 (PST)
Received: from bogus (unknown [10.163.75.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0AC33F71A;
	Wed,  4 Jan 2023 02:41:16 -0800 (PST)
Date: Wed, 4 Jan 2023 10:41:16 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <20230104104116.ob666fm6agkoildy@bogus>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
 <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
 <Y7Rg28suWh1RUbkU@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7Rg28suWh1RUbkU@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_024127_516373_8F62B972 
X-CRM114-Status: GOOD (  27.50  )
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

On Tue, Jan 03, 2023 at 05:07:39PM +0000, Conor Dooley wrote:
> Hello!
> 
> Couple comments for you.
> 
> +CC Sudeep: I've got a question for you below.
> 
> On Tue, Jan 03, 2023 at 07:53:38AM +0000, Leyfoon Tan wrote:
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > > Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
> > > initialization stage
> > > On Tue, Jan 03, 2023 at 11:53:16AM +0800, Ley Foon Tan wrote:
> > > > topology_parse_cpu_capacity() is failed to allocate memory with
> > > > kcalloc() after read "capacity-dmips-mhz" DT parameter in CPU DT
> 
> Uhh, so where did this "capacity-dmips-mhz" property actually come from?
> I had a quick check of qemu with grep & I don't see anything there that
> would add this property.

From the DT properties.

> This property should not be valid on anything other than arm AFAICT.
>

Not sure if we restrict that on arm/arm64 only, but yes it is mostly used
on asymmetric CPU systems.


[...]

> > > > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > > > index 3373df413c88..ddb2afba6d25 100644
> > > > --- a/arch/riscv/kernel/smpboot.c
> > > > +++ b/arch/riscv/kernel/smpboot.c
> > > > @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
> > > >
> > > >  void __init smp_prepare_boot_cpu(void)  {
> > > > -	init_cpu_topology();
> > > >  }
> > > >
> > > >  void __init smp_prepare_cpus(unsigned int max_cpus) @@ -48,6 +47,8
> > > @@
> > > > void __init smp_prepare_cpus(unsigned int max_cpus)
> > > >  	int ret;
> > > >  	unsigned int curr_cpuid;
> > > >
> > > > +	init_cpu_topology();
> 
> I know arm64 does this, but there is any real reason for us to do so?
> @Sudeep, do you know why arm64 calls that each time?

Not sure what you are referring as called each time. IIUC smp_prepare_cpus()
must be called only once on the primary during the boot to prepare for
the secondary boot. The difference is by this stage we know the max possible
CPU and supply the same to the call.

> Or if it is worth "saving" that call on riscv, since arm64 is clearly
> happily calling it for many years & calling it later would likely head
> off a good few allocation issues (like the one we saw with the topology
> reworking a few months ago).
>

Yes the failure seems like similar issue we saw with cacheinfo and early
allocation on RISC-V. However I can't recall why we have done this way
on arm64 and not in smp_prepare_boot_cpu() like in RISC-V.

Not sure if that was any helpful.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
