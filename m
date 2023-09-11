Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F4FC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 02:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBUt6A2FkNG/rEPNqkI5uLpohDbx+ovMx8v0QJ8Vaok=; b=AIumtYlpGU+zn/
	LVs16r+Jku5/IiwztqvXnLLVmLALlHm2TO43993W+QOdgKgVm2KYHejOtfwETxYWFPlVlz/aPVB7o
	T5zL5GFnmCVDlhwStqZfL3xhE7NH7358cJtAsckcndsUG6eItMHrtKrm2gmLlOR0Fqc6AI7PiTirj
	+KH+/oPNSJyYycxGHip1cHaFSK+KrbKiGfJH9s5ogbOWhcCKXO5rcbY2P+SxVlOB6NyWTFVL43Jo5
	wAWkgdEDDNKlH9Xgfl7jNUHaMGvTGVpSZwcUIpjRDIe1bYHdeXjIKcRhbJUCRqZgTwGzHIQQYFuW5
	8NpAGNSbIOlEpzAT+R+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWzU-00H7Js-1W;
	Mon, 11 Sep 2023 02:49:32 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWzQ-00H7JO-17;
	Mon, 11 Sep 2023 02:49:30 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38B2mndQ062834;
	Mon, 11 Sep 2023 10:48:49 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 11 Sep 2023 10:48:48 +0800
Date: Mon, 11 Sep 2023 10:48:44 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <anup@brainfault.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <ajones@ventanamicro.com>,
        <heiko@sntech.de>, <samuel@sholland.org>, <geert+renesas@glider.be>,
        <n.shubin@yadro.com>, <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>
Subject: Re: [PATCH 3/4] riscv: errata: Add Andes PMU errata
Message-ID: <ZP6ADIAqZn0kkxwB@APC323>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-4-peterlin@andestech.com>
 <20230907-158e1f7e1e866d8c02726c9c@fedora>
 <20230907-7bc08398d2f95c14e1c0bc76@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907-7bc08398d2f95c14e1c0bc76@fedora>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38B2mndQ062834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_194928_845104_7E82F83B 
X-CRM114-Status: GOOD (  34.30  )
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

On Thu, Sep 07, 2023 at 12:02:46PM +0100, Conor Dooley wrote:
> On Thu, Sep 07, 2023 at 10:27:03AM +0100, Conor Dooley wrote:
> > Hey,
> > 
> > On Thu, Sep 07, 2023 at 10:16:34AM +0800, Yu Chien Peter Lin wrote:
> > > Before the ratification of Sscofpmf, the Andes PMU extension
> > > implements the same mechanism and is compatible with existing
> > > SBI PMU driver of perf to support event sampling and mode
> > > filtering with programmable hardware performance counters.
> > 
> > If it actually was, you'd not need to modify the driver ;)
> > 
> > > This patch adds PMU support for Andes 45-series CPUs by
> > > introducing a CPU errata.
> > 
> > I don't really understand this in all honesty. You don't have Sscofpmf
> > support with a bug, you have something that is Sscofpmf-adjactent that
> > predates it. Why claim to support an extension that you do not, only to
> > have to come along and try to clean things up afterwards, instead of
> > accurately declaring what you do support from the outset?
> 
> Reading this again, I don't think that I have been particularly clear,
> sorry. My point is that this is not a fix for a bug in your
> implementation of Sscofpmf, but rather adding probing for what is
> effectively a custom ISA extension that happens to be very similar to
> the standard one. As it is not an implementation bug, errata should
> not be abused to support vendor extensions, and either DT or ACPI should
> be used to inform the operating system about its presence.
> 
> Cheers,
> Conor.
> 
> > 
> > (and just because someone already got away with it, doesn't mean that
> > you get a free pass on it, sorry)

Apologize for any confusion caused by the name. I thought it would make it
easier to find the related functions and files in OpenSBI, didn't expect
that it may have misled people to abuse the use of errata, you are right,
I should have chosen my words more carefully.

In my opinion, this is simply a pre-sepc solution to enable missing perf
features before the standard is finalized. The underlying logic remains the
same, so we can still use the errata to patch a few lines of CSR accesses
and align with other vendors. This way, we can make minimal changes and
avoid performance overhead to the driver.

> > Thanks,
> > Conor.
> > 
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
> > 
> > btw, what did Locus Wei-Han Chen do here? Are you missing
> > a Co-developed-by: tag?

Yes I missed the CD-tag, will fix it.
Thanks for the review.

> > > Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> > > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > > ---
> > >  arch/riscv/Kconfig.errata            | 13 ++++++++
> > >  arch/riscv/errata/andes/errata.c     | 45 +++++++++++++++++++++++++++-
> > >  arch/riscv/include/asm/errata_list.h | 43 ++++++++++++++++++++++++--
> > >  drivers/perf/riscv_pmu_sbi.c         | 20 +++++++++----
> > >  4 files changed, 111 insertions(+), 10 deletions(-)

Best regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
