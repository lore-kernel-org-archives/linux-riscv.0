Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A035C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 04:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Khz+v1cF8yyUtl+UAi0kbA/O/p71CileLwJVL80eO0=; b=k1VQEDCakdOuMt
	vG42DXFCcHjHrNvNjvh2EoDNt8bv4aaxfuXNLZsqZZ86toqqAvOExqlo/uHzKkuwDKSL+bdCJ+buF
	2GoZWgkPc7I3G87fSlFShUYLoXAu1o6/5VQem4Z1nj6QwOw78F7HBecEEs6I96n2+U0Jq8zTI2U4U
	/W5gZI4E6COg0ATBDyQ1Aj26W/nHjm326AbAO6JTo9sCKSdQHv8q3dJM1+Zr9/REjPF1IZvFzGhK4
	rpNhdjedY3cFLvh5S9p63h/DyHxBpq4Upf6yAdf6PcU8yRMYHhIwoJKnOIA8V5DFDYbotDtoVAh9N
	RKtEJ/ZslM5CHKJ0U8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQqG-0000000DbX2-1Nia;
	Tue, 18 Jun 2024 04:53:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQqD-0000000DbWD-0mp3
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 04:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D3A4616E0;
	Tue, 18 Jun 2024 04:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D13C4AF1D;
	Tue, 18 Jun 2024 04:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718686388;
	bh=nQG2ozuXtUOSTdqSimyv9RBGDU0XpREHXYREIy934Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAZqtMEo/sxEOB9MdPzkbnTvxBvBj0ED1AWxDTDTLtkU8ntdbvWYnSm0weVWZarhw
	 xFjasAxhVqTZGI49eA1mb08R48nbYnbEjuMkIQiLXZhghvqLxYsFQXeJvWRsxzYHKi
	 9n/eKdoLVoMayqZo7Iiv593iikHKn7fdmMESxdduTFH1GrdaC7P4pm/mSCy570Ny3w
	 oi6usvZZmhHFOmVDcT1yxS2Iwj8CpKY8qk8SSnNKe9kz9uj6tzhB8zNwX9Kag5Us6K
	 WRLfGdf2XcwZaXogN6HDD/lGSdDoNuaatD0pJCHN1tVww6VMwkCS72fIextCNPpsxd
	 cXubB6VFol2sQ==
Date: Tue, 18 Jun 2024 12:39:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <ZnEPbtbLhwZIHUJI@xhacker>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
 <ZnBEBQjTQtFs-fXt@xhacker>
 <20240617-synapse-carmaker-0a59c7c6edb7@spud>
 <tencent_26E7381EE1F6C5188428359AF3F908CA680A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_26E7381EE1F6C5188428359AF3F908CA680A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_215309_779115_1ED518A1 
X-CRM114-Status: GOOD (  50.41  )
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

On Tue, Jun 18, 2024 at 12:39:30AM +0800, Yangyu Chen wrote:
> 
> 
> > On Jun 17, 2024, at 23:32, Conor Dooley <conor@kernel.org> wrote:
> > 
> > On Mon, Jun 17, 2024 at 10:11:17PM +0800, Jisheng Zhang wrote:
> >> On Sun, Jun 16, 2024 at 10:48:11PM +0000, Yixun Lan wrote:
> >>> Hi Conor
> >>> Thanks for bringing this up
> >>> 
> >>> On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> >>>> On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> >>>> 
> >>>> No MAINTAINERS update, so I figure that means you don't want to maintain
> >>>> it going forwards? If there's someone out that that does care about the
> >>>> spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
> >>>> look after it.
> >>> Yangyu kind of has limited time, too many stuff for him..
> >>> 
> >>> I'd volunteered to help on this if it can fill the gap
> >>> Also I'd be more than happy if anyone willing step forward to co-maintain..
> >> 
> >> Does maintainership work like this? Is willing to do enough?
> >> FWICT, maintainership involves active patch contributing, reviewing and
> >> maintaining the whole SoC. It is better to take over the maintainership
> >> after showing enough patch contributions and understanding of the SoC.
> > 
> > I was going to reply to your other patch about providing more complete
> > "basic" support for the SoC, but I guess I'll reply here and address
> > both points. After the k230 and th1520, which were both merged with very
> > basic support and have made very little progress towards being a useful
> > platform, I'm pretty reluctant to merge another platform in a super
> > basic state. I was going to make this point before you brought it up,
> > but it's good to know I am not the only one with that view. To be clear,
> > I'm not pointing blame for those platforms, I'd just like to avoid a
> > repeat. If Yangyu doesn't have time to do any development work on the
> > platform, I'd like to see someone else (and as I mentioned Jesse is
> > interested) take on getting some of the basic driver patches written and
> > merge only when those are accepted. Having no in-tree clock and pinctrl
> > drivers is definitely a hindrance to other people doing parallel
> > development of drivers and I'd like to avoid that.
> > 
> 
> That's also my concern for the first time when I submitted initial
> support for K230. However, for SpacemiT K1, things went differently
> for its UART, and the vendor patched OpenSBI with their NOC-based
> HSM. They didn't use CLINT-MSWI as SBI HSM driver.
> 
> The vendor uses a special intel pxa uart driver, marked deprecated
> in the kernel and incompatible with ns16550. If we use ns16550 in
> the dt, the behavior of uart is like the uart has no interrupt and
> stops working permanently when fifo overruns, making many developers
> not know how to start unless they use the SBI HVC console, which
> needs to turn on CONFIG_NONPORTABLE.
> 
> For the OpenSBI, the vendor does not provide enough ISA string,
> which their chip might support, such as Zicboz. Thus, the OpenSBI
> does not correctly set up the corresponding M-Mode CSR, making the
> kernel panic when the ISA string contains this extension.
> 
> These two things takes me about one week to get the initial mainline
> kernel with full ISA extension and UART to work. Providing this
> information in the commit message helps attract more developers to
> start developing quickly.
> 
> I don't mind whether this series patch will be merged or not. The
> meaning of this series is just providing these informations. However,
> I think some details about bringing up a very basic kernel are
> essential to attract more developers. If a platform has already
> attracted some developer's attention. Providing initial support
> with the commit message to show how to bring it up is not bad.
> 
> The point is that if a developer like me has already done this but
> does not have much time to do further development, should the
> developer become the maintainer? If not, should a developer submit
> patches like this to the mailing list to provide this information
> in the commit message and make it easier for other developers to
> do further development?

This patch series is valueable, especially for the person who
has passion, time to expand the series to get pinctrl, reset and clk
ready so that the SoC is properly modeled even in the initial stage.

> 
> > Getting back to your point in this mail, whoever gets the platform to
> > that state is well suited to looking after it going forwards. Some other
> > interested parties could also join as reviewers. I don't want to see
> > people joining as maintainers that are not going to have an interest
> > in the platform going forward, as that'll just end up with me as the
> > defacto maintainer.
> > 
> 
> I agree. I also have no confidence in joining as a maintainer.
> That's why I didn't change the MAINTAINERS for the first time.
> 
> Thanks,
> Yangyu Chen
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
