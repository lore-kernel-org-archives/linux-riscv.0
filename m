Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9646C43219
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkoXncmwANHUN2lIVAvi86bJqSJB4/Cjep3mhvJx83Y=; b=eknFwVB1m4UYAy
	o36JW9FDEeoIqxn0tVZbNKr5IoR3aEGQzslc4BTjTD6bCv8nO9TBrTFde8gmcTu/9MIx3SfawdLXq
	IgkknSRtMxRnRKupk96ezl6keDAyfRJ3lq22MXvySG5WJFvkQQ8XFWjs7FR4A+T/+MBc/8oE1c/qk
	fqIR6ZPrdoGi7NQ6UUOCNCajmR2X41QqgRuwCydurM5Zj4iD+nd1xQd4X8K/9nlsN8unjsZDKjcPy
	gc9DreR/QN8QkXIVe2vKXLURuAJ4U+5ksEm8zRY5ccm+2S+GzrCP/F4IW+yFXOvaXdwZdxNUApsN9
	aLfk2Z8DW9xhK+tpEE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybgp-000Nk1-7F; Fri, 25 Nov 2022 16:36:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybgl-000NgH-83
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 16:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE9D5B82B69;
	Fri, 25 Nov 2022 16:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5152C433D6;
	Fri, 25 Nov 2022 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669394188;
	bh=s3lkeC30cyg1DCeUkvZCzZu6Tp5ihVWG9m8r+HqePEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXra9aiZau+exg0K4OoABWgdlCpR/+nMBXnG5pnHHgjCx2w8DlbhRCCEJ6UW8JdQb
	 D2pq39mnpS1UR1qlVG7A516BERwV14/fTgoKGfuPynAzWnFXE87sreyB/mLcIQf5q4
	 BSRgyuL9j6Er4LDN6DBDS3bejJZ+hxAv9UJLy34kWJoYWPaltYChdvi92dK/tsmQ6i
	 ANm7wJw3gnatFQ/H4WZ1y+RqmcbFL6aPHfgP8g2LDjMIr2RvF2r3h5BGQ+Rr8wqNik
	 rNTbz2T8P7XhooWnjwn++A7QiJTfEp8S1Wdd/dKR2lW6Goo+i1enfqReLvuJ5lHbkG
	 /XiebMeVPgtTg==
Date: Fri, 25 Nov 2022 16:36:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <Y4DvCD1VvSHrKMwn@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud>
 <3259590.VLH7GnMWUR@phil>
 <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
 <20221125152821.ytipefad7oxv733t@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125152821.ytipefad7oxv733t@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_083631_611911_E333277E 
X-CRM114-Status: GOOD (  41.59  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Drew, Christoph,

@Christoph, I did not receive your mail unfortunately as it appears to
be html. I assume you know why that's a problem and had some mailer
issues etc.

also + CC Samuel Ortiz since we discussed this elsewhere...

On Fri, Nov 25, 2022 at 04:28:21PM +0100, Andrew Jones wrote:
> On Fri, Nov 25, 2022 at 12:26:42PM +0100, Christoph M=FCllner wrote:
> > On Fri, Nov 25, 2022 at 8:49 AM Andrew Jones <ajones@ventanamicro.com>
> > wrote:
> > =

> > > On Fri, Nov 25, 2022 at 12:51:54AM +0100, Heiko Stuebner wrote:
> > > > Am Donnerstag, 24. November 2022, 23:32:58 CET schrieb Conor Dooley:
> > > > > On Thu, Nov 24, 2022 at 11:23:08PM +0100, Heiko St=FCbner wrote:
> > > ...
> > > > > > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cp=
u.c
> > > > > > > > index bf9dd6764bad..66ff36a57e20 100644
> > > > > > > > --- a/arch/riscv/kernel/cpu.c
> > > > > > > > +++ b/arch/riscv/kernel/cpu.c
> > > > > > > > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data
> > > isa_ext_arr[] =3D {
> > > > > > > >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > > > > > >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > > > > > >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > > > > > > +     __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > > > > > > >       __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > > > > > > >       __RISCV_ISA_EXT_DATA(zihintpause,
> > > RISCV_ISA_EXT_ZIHINTPAUSE),
> > > > > > > >       __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > > > > > >
> > > > > > > This one I do know that Palmer wants canonically ordered.
> > > > >
> > > > > btw, idk if you noticed but I appear to have picked canonical ord=
ering
> > > > > as today's thing to get confused about a lot.
> > > > >
> > > > > You put zbb after the S extentions - does that meant it is *not* =
an
> > > > > "Additional Standard Extension" but rather a regular Z one?
> > > >
> > > > This confuses me completely now :-) .
> > > >
> > >
> > > Can we instead post a patch to the spec that changes the order to
> > > alphabetical? The only other option I see is to develop a tool which =
sorts
> > > extensions and every RISC-V developer keeps it in their back pocket. A
> > > kernel specific tool to check each list we want to keep sorted would =
be
> > > nice too.
> > >
> > > My preference would be to change the spec to alphabetical order, thou=
gh,
> > > because the spec isn't explicit[*] enough to write a tool that can ha=
ndle
> > > all cases. We'll end up needing to have conversations like this one to
> > > write the tool and eventually the tool will be what everyone looks to,
> > > rather than the spec...
> > >
> > > [*] The spec uses words like 'can', 'should', and 'conventional'.
> > >
> > =

> > The unpriv spec is clear about the canonical order (table "Standard ISA
> > extension names"):

So I went reading the isa-manual again for the nth time.. It seems that I
missed the sentence:
Standard machine-level instruction-set extensions are prefixed with the
three letters ``Zxm''. Woops & apologies @Samuel!

However, that table is only clear (as pointed out by Drew) on a
categorical level.

> The caption under table 27.1 does indeed declare the table defines the
> canonical order and that it *must* be used for the name string, but
> almost everywhere else in chapter 27 the word "should" is used to suggest
> how extensions be ordered (only X-extensions say where they must be).
> =

> > 1) Base ISA
> > 2) Standard Unpriv Extension (non alphabetical)
> =

> The 'non alphabetical' part makes this a PITA.
> =

> And section 27.6 says the first letter "conventionally indicates...". I
> suppose we can assume it "must indicate"?

Convention would imply it *should* but not that it must. I think, for
the kernel, we take a stronger view and say that we *will* put them in
the listed order in that table.

> > 3) Standard Supervisor-Level Extensions
> =

> Are the conventions for the first character of S-extensions defined? I've
> seen 'Ss' for "Privileged arch and Supervisor-level extensions", e.g.
> Sscofpmf. 'Sv' for virtual memory (I guess) related extensions, e.g.
> Svinval, and we appear to be using alphabetical order for them.

Again, appears to be a "should". I'd vote for doing everyone a favour
and making it "must" in this case kernel wise.
> =

> > 4) Standard Machine-Level Extensions
> > 5) Non-Standard (Vendor) Extensions
> =

> Anyway, for the relatively easier problem of this kernel list and this
> patch, we could do something with defines like below in order to try and
> keep the order right.
> =

> /*
>  * Each sub-list is sorted alphabetically.
>  */
> #define S_EXTENSIONS                                                    \
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),         \
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),                 \
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),           \
>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> =

> #define Zi_EXTENSIONS                                                   \
>         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),             \
>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> =

> #define Zb_EXTENSIONS                                                   \
>         __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZICBOM),                \
> =

> static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>         Zi_EXTENSIONS
>         Zb_EXTENSIONS
>         S_EXTENSIONS
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX)

The above LGTM (apart from the accident in the zbb entry!)

Thanks for all putting up with my confusion here - although the
lack of clarity appears to be rather widespread hahaha.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
