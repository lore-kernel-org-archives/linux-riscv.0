Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B5C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dInLkt5mO+VyAkoRBf1ky5lzYwPsGZsY9af9BYMFkoc=; b=KZMyIf7uOYsWOk
	0IH9NnbiusUBECOWMMznBEctxE/91sVIsZ9eMwLYhohT9GRdKhiisyZP3cWqS0oO8MSC/SQzUp6T3
	q8k5vtojgp+JpjwGAoxkJTz6faurkMQSC8lFXVBTHEhA2zVI69V7Ftl/PQSoPFuv/Ep8fgfIgyuvE
	egnFtmRbRoAXZSCdnOwp4lGsktEu7qOwsF76cokw/LKPvfIVIshhE79NKt2ZR4lA4GvA/ytwnB+mZ
	7WyNZW1n9+4HYEutGIy8kv6l0ROvgTuHowrA0Mfy9giO8DCGte3MAqV75V/VM02X/BeP7ipR1F4Lo
	NmEhXVgwbHj83Nat3e8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossVU-00HNw8-V6; Wed, 09 Nov 2022 21:21:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossVS-00HNvF-2E
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:21:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A078B61CFD;
	Wed,  9 Nov 2022 21:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FC6C433C1;
	Wed,  9 Nov 2022 21:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668028868;
	bh=pYOUc1BS7odG85FnGBnRIQ06I5+LA9EdxedOUyOFmIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkJcHEHyn6lMw04x36p3Y6vrP+++bdC0/MvAaaLxzf7yeLVDaAC8+UzA4YVzOMTkE
	 AENO6PZF3meTKmb3/S0Gqha4HT64KiVyz03dnM8tBfF6A9TjLfuvA8uSWfyYkQ6jyz
	 j+YUqJNWlSAckT/fHaiz7jeUTQM3epCavo+B1O1lIPd/aT6E1FZpgS1etg2wZHdEpF
	 YLV8jtR8eZCQMA1+3uLYa0DBQ0TiVr1iQQgWwUR4/Etub57OTqtq2SAWnyQrbCjq79
	 /gIiNVVVQSSXrbcqEcu+ZTRc/dKkQPuZ2eM+hC+M1wYkU1DMLE4LXyoUEfmGc7J2FS
	 xwSR+vQumW71g==
Date: Wed, 9 Nov 2022 21:21:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, geert+renesas@glider.be
Cc: prabhakar.csengg@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, geert+renesas@glider.be,
	magnus.damm@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
	Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
	anup@brainfault.org, Atish Patra <atishp@rivosinc.com>,
	heinrich.schuchardt@canonical.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
Message-ID: <Y2wZvZLAENWh6qvs@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <mhng-563fb6cf-4505-4137-8da1-13f631e1c74f@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-563fb6cf-4505-4137-8da1-13f631e1c74f@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132110_188207_E206EB03 
X-CRM114-Status: GOOD (  18.91  )
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

On Wed, Nov 09, 2022 at 11:55:24AM -0800, Palmer Dabbelt wrote:
> On Fri, 28 Oct 2022 09:59:14 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 

> > Lad Prabhakar (7):
> >   dt-bindings: riscv: Sort the CPU core list alphabetically
> >   dt-bindings: riscv: Add Andes AX45MP core to the list
> >   riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> >   riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
> >   riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
> >   MAINTAINERS: Add entry for Renesas RISC-V
> >   riscv: configs: defconfig: Enable Renesas RZ/Five SoC

> Geert was mentioning taking these though one of his trees, that works for me
> so
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Happy to do a shared tag or whatever, but I think we can just skip that
> here.  The only conflicts would be defconfig and Kconfig.socs, but I don't
> think anything big is in the works for either -- unless Conor was planning
> on re-spinning that Kconfig.socs rework?

Uh, nah. I've got a wee bit (the removal of selects) that is "ready" but
there's zero urgency so it can wait for after v6.2-rc1. I don't think
it'd conflict anyway. The rest of it I need to sort out a v1 of, but I've
been distracted. Should be safe to take the defconfig & Kconfig.socs stuff
in terms of me doing anything.

Geert, would you be able to apply the first two patches on top of
v6.1-rc1 just in case, as you mentioned previously, it needs to become
part of a shared branch? Seems unlikely at this point in the cycle
though.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
