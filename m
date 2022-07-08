Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4734C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g+ULOpFajjtVAjLGsS0jRvdJbij/fXhgE5DFBqjT+g=; b=RjwqBFJD5uTJly
	tOSlxEctLi3E7DG544+yR6hPe+AJkgpJrNpA6C+pvSIImP9tkxiwpZuC8hrtOhEn2A40OlX8nbvjW
	Fq7EJD/iy3fga64lf/b6j3OOuPvuW1OWcOmbkmgg0zpp1KmXOP9kCaBQGk0AvTuO2TMbG0l7ngcjV
	hiKgzyV1pa8UvpJ6y5nPKK1053DwouC5Qq80LCuB8M+0+dZGIsBpCaI6Yd7D4xGTJSSPqzkkm0Mfh
	/bfdtmWejkWN3U1WmrIuo2o3dHoiH9UDV+wZqhnc77pG5VzqNuwAYY/ukKBcwqroyygS6OLX2TN00
	ypo5CCoW/8mIOQlY5qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kqA-0036P4-4x; Fri, 08 Jul 2022 10:04:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kpt-0036Ia-Im; Fri, 08 Jul 2022 10:03:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8022B622A5;
	Fri,  8 Jul 2022 10:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC89C341C0;
	Fri,  8 Jul 2022 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657274623;
	bh=vWk5klsWMrK2piIpNQRYEuuIgRWtIJtmTQpPTcJEXOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPJPcWVdKv6Gxu//uPxt+cxRLLa99VE/OiGnIMzWoC17HCaoSswa2QOHPY31aEq1a
	 ztS61Tk9jXd2wS3w36q7bwhiuJngvt1YlCiSUYQhdkw4W23yv1cAYLHp733/K8Z+XL
	 9D0Gpq/DgQUlvgk9frVOP1PZpg8qwVGOFW2Kc5t8=
Date: Fri, 8 Jul 2022 12:03:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <Conor.Dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daire.McNamara@microchip.com, Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>, hahnjo@hahnjo.de,
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, changbin.du@intel.com,
	Heiko Stuebner <heiko@sntech.de>, philipp.tomsich@vrull.eu,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Brice.Goglin@inria.fr
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Message-ID: <YsgA/eycDF9TgCIT@kroah.com>
References: <20220707220436.4105443-1-mail@conchuod.ie>
 <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus>
 <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
 <20220708092100.c6mgmnt7e2k7u634@bogus>
 <CAMuHMdXUjmG9n3BuRAz_irkmHQbp=7SYxe5VEfOhMdT4D2JfwQ@mail.gmail.com>
 <20220708094710.rxk6flrueegdsggr@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220708094710.rxk6flrueegdsggr@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_030345_734234_FCC585A6 
X-CRM114-Status: GOOD (  35.44  )
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

On Fri, Jul 08, 2022 at 10:47:10AM +0100, Sudeep Holla wrote:
> On Fri, Jul 08, 2022 at 11:28:19AM +0200, Geert Uytterhoeven wrote:
> > Hi Sudeep,
> > 
> > On Fri, Jul 8, 2022 at 11:22 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > On Fri, Jul 08, 2022 at 08:35:57AM +0000, Conor.Dooley@microchip.com wrote:
> > > > On 08/07/2022 09:24, Sudeep Holla wrote:
> > > > > On Thu, Jul 07, 2022 at 11:04:35PM +0100, Conor Dooley wrote:
> > > > >> From: Conor Dooley <conor.dooley@microchip.com>
> > > > >>
> > > > >> RISC-V & arm64 both use an almost identical method of filling in
> > > > >> default vales for arch topology. Create a weakly defined default
> > > > >> implementation with the intent of migrating both archs to use it.
> > > > >>
> > > > >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > >> ---
> > > > >>   drivers/base/arch_topology.c  | 19 +++++++++++++++++++
> > > > >>   include/linux/arch_topology.h |  1 +
> > > > >>   2 files changed, 20 insertions(+)
> > > > >>
> > > > >> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > > > >> index 441e14ac33a4..07e84c6ac5c2 100644
> > > > >> --- a/drivers/base/arch_topology.c
> > > > >> +++ b/drivers/base/arch_topology.c
> > > > >> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
> > > > >>    }
> > > > >>   }
> > > > >>
> > > > >> +void __weak store_cpu_topology(unsigned int cpuid)
> > > >
> > > > Does using __weak here make sense to you?
> > > >
> > >
> > > I don't want any weak definition and arch to override as we know only
> > > arm64 and RISC-V are the only users and they are aligned to have same
> > > implementation. So weak definition doesn't make sense to me.
> > >
> > > > >
> > > > > I prefer to have this as default implementation. So just get the risc-v
> > > > > one pushed to upstream first(for v5.20) and get all the backports if required.
> > > > > Next cycle(i.e. v5.21), you can move both RISC-V and arm64.
> > > > >
> > > >
> > > > Yeah, that was my intention. I meant to label patch 1/4 as "PATCH"
> > > > and (2,3,4)/4 as RFC but forgot. I talked with Palmer about doing
> > > > the risc-v impl. and then migrate both on IRC & he seemed happy with
> > > > it.
> > > >
> > >
> > > Ah OK, good.
> > >
> > > > If you're okay with patch 1/4, I'll resubmit it as a standalone v2.
> > > >
> > >
> > > That would be great, thanks. You can most the code to move to generic from
> > > both arm64 and risc-v once we have this in v5.20-rc1
> > 
> > Why not ignore risc-v for now, and move the arm64 implementation to
> > the generic code for v5.20, so every arch will have it at once?
> >
> 
> We could but,
> 1. This arch_topology is new and has been going through lot of changes
>    recently and having code there might make it difficult to backport
>    changes that are required for RISC-V(my guess)

Worry about future issues in the future.  Make it simple now as you know
what you are dealing with at the moment.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
