Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA8C4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkI4iNUQB35o/ErM/snVPAfcBjmjBGKZYhfp7L8RcUY=; b=Wg1G9takBg4FGD
	ewCkP0AEm83PrNfPXKC9Wwi9iTxQDZF+jqNHh3VczsuXpgAdZ0+lm5IgioF5bdRWSIQv8/EWI1NHG
	thg6cb2ypNowf4+rhgwFrkkNkVyya7APFRmPVcIXm8SiVmy+XPZX++ftpiW+GOXigMp4+Hc+ZxJ/b
	HUZt7neJ7sdv940LrXsr6ONENSr6hN8hvw6xwJTrhPQJRFB1YlzcN6VmPBArIjHkBvWVfupjmPV+m
	FYd9alCZt/Pk41xEbhDKjpfAwckJw6Oabwa4Mx0wvl+F1H0dT2mZ1IXj+ExLelTjM4Vt9nxVp8T02
	dFp8MuvOyrYVevze4vHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Xu-00A35l-Jw; Wed, 04 Jan 2023 15:19:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3Jv-009AsP-Qf
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 12:56:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D11261042;
	Wed,  4 Jan 2023 04:57:16 -0800 (PST)
Received: from bogus (unknown [10.163.75.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3BB63F587;
	Wed,  4 Jan 2023 04:56:31 -0800 (PST)
Date: Wed, 4 Jan 2023 12:56:32 +0000
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
Message-ID: <20230104125632.ktoyt7mxjjxq5udm@bogus>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
 <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
 <Y7Rg28suWh1RUbkU@spud>
 <672440143ab04d3dbcc6de0a16bab3e1@EXMBX161.cuchost.com>
 <F86CD957-8B7C-46B9-A14B-AAE67E43CD71@kernel.org>
 <20230104104900.aohsn6zemfllub7r@bogus>
 <Y7VulIcGwuXvBES6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7VulIcGwuXvBES6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_045639_975769_260AA09E 
X-CRM114-Status: GOOD (  32.93  )
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

On Wed, Jan 04, 2023 at 12:18:28PM +0000, Conor Dooley wrote:
> Hey Sudeep,
> 
> On Wed, Jan 04, 2023 at 10:49:00AM +0000, Sudeep Holla wrote:
> > On Wed, Jan 04, 2023 at 09:49:48AM +0000, Conor Dooley wrote:
> > 
> > [...]
> > 
> > > >> Uhh, so where did this "capacity-dmips-mhz" property actually come from?
> > > >> I had a quick check of qemu with grep & I don't see anything there that
> > > >> would add this property.
> > > >> This property should not be valid on anything other than arm AFAICT.
> > > >
> > > >This DT parameter is not in default Qemu. I've added it for testing (see test steps in below). 
> > > >This is preparation to support asymmetric CPU topology for RISC-V.
> > > 
> > > The property is only valid on arm, so how does arm64 deal with such
> > > asymmetric topologies without it?
> > 
> > I don't think we can deal with asymmetric topologies without this.
> > Yes we can detect the difference in the CPU types but we can only assume
> > there are symmetric in terms of performance in absence of this property.
> 
> 
> I looked at the bindings for it and forgot that the arm directory of
> bindings applies to both arm and arm64. I see now that it is also used
> on arm64.
> 
> > 
> > > Why should we "fix" something that may never be a valid dts?
> > >
> > 
> > I would not say invalid. But surely absence of it must be handled and
> > we do that for sure. IIRC, here the presence of it is causing the issue.
> > And if it is present means someone is trying to build it(I do understand
> > this is Qemu but is quite common these days for power and performance
> > balance in many SoC)
> 
> I said "invalid" as the binding is defined for arm{,64} in arm/cpus.yaml
> & documented in the same directory in cpu-capacity.txt, but not yet on
> riscv. All bets are off if your cpu node is using invalid properties
> IMO, at least this one will fail to boot!
> 
> However, I see no reason (at this point) that we should deviate from
> what arm{,64} is doing & that documenation should probably move to a
> shared location at some point.
>

I prefer making this binding generic rather than patching to handle RISC-V
differently in the generic code. Since it is optional, the platform
need not use it if it is not needed.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
