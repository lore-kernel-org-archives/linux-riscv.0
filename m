Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LtVl9PfT4wTrKTpRhtvO5V8SNIGiJyie6SfxFfd30o=; b=3fAjZHY5NO540P
	UI7WPSQEjYLWrAlPXo8SoAmaXM05bz6jVwE5TyAgS3/cJ0M91wRo5XKqRl+BRTEsqZ7HwJqA7sbrb
	Y+7KjU2xOHrYBRMmb2kOnouDFmZO1/lsxt/8QEraEcTsZS7sUKxc/88946lpECKs5indDJSPWdKcp
	QgkTiVDgQPCcuncSBs7ya0m2+VDn72iyN3d3Emkgp37Jb0C4LO7Jm6IMW/cgQWnH8pDY28xqcDHFI
	LMJMa/vD3Bjc50L/8eFaG9xXTJr+ya64AcvLtN8TZfshFrKEVjVUHTu6YXV3rbKiFDaQHn2JzvHdo
	2CdYD2lVmloZKUoB7XDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycEX-000f0d-T1; Fri, 25 Nov 2022 17:11:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycEU-000eyP-N6
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 17:11:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2E61EB82B80;
	Fri, 25 Nov 2022 17:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1EFC433D6;
	Fri, 25 Nov 2022 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669396279;
	bh=bECppbNtYiE2Wavt/C+qtMzD5xUhouliWSZABy8t5jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzWrlg4USvAaeq0RD9ZPboFW3kSrRJ5JVG+nR5YKKBW7hiK8sQk9/ohoNtxjZ6KuN
	 vk+1XA5vWhb2GJ8md8o23H9t4Xs9RST3QdXJNeuIBu+kxO1ew1x/8ryWKQkW5qmmf+
	 k74spkteUaUQG2NBFM4w09bcwVRmbE5viilHmOXsxFUJq4SYXJ4jIU4TToSxUDGrGL
	 GrlxtsXYrEDctTi6lJaUEODTHX32nEC9bGBKJenhxvyjsxrpC0JpFPnYgBf2s/PoW4
	 5F4BQzCl2YNaO3oglMLWuv6YxhLFdZ4szj6t53WjHmNz2GN8my+hzkf2EpMfcX6WH/
	 5OV9mRqe8U08g==
Date: Fri, 25 Nov 2022 17:11:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <Y4D3M6469WUX/Df7@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud>
 <3259590.VLH7GnMWUR@phil>
 <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
 <20221125152821.ytipefad7oxv733t@kamzik>
 <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
 <Y4Dv0Vfz6AAg/X19@spud>
 <CAEg0e7h-m6oMYd+W2=89t4iPLKLz6TsLzKzUmAq1vuOTeawsUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7h-m6oMYd+W2=89t4iPLKLz6TsLzKzUmAq1vuOTeawsUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_091123_062428_FD339F89 
X-CRM114-Status: GOOD (  18.94  )
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

On Fri, Nov 25, 2022 at 06:02:12PM +0100, Christoph M=FCllner wrote:
> On Fri, Nov 25, 2022 at 5:39 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, Nov 25, 2022 at 05:35:39PM +0100, Christoph M=FCllner wrote:
> > > On Fri, Nov 25, 2022 at 4:28 PM Andrew Jones <ajones@ventanamicro.com=
> wrote:
> >
> > > > /*
> > > >  * Each sub-list is sorted alphabetically.
> > > >  */
> > > > #define S_EXTENSIONS                                               =
     \
> > > >         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),    =
     \
> > > >         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),            =
     \
> > > >         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),      =
     \
> > > >         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > >
> > > > #define Zi_EXTENSIONS                                              =
     \
> > > >         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),        =
     \
> > > >         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE=
),
> > > >
> > > > #define Zb_EXTENSIONS                                              =
     \
> > > >         __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZICBOM),           =
     \
> > > >
> > > > static struct riscv_isa_ext_data isa_ext_arr[] =3D {
> > > >         Zi_EXTENSIONS
> > > >         Zb_EXTENSIONS
> > > >         S_EXTENSIONS
> > > >         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > > > };
> > >
> > > It might be worth to look how Binutils are grouping them:
> > >   https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dbfd/e=
lfxx-riscv.c#l1261
> > >
> > > They also group extensions together but use the following groups:
> > >
> > > const struct riscv_supported_ext *riscv_all_supported_ext[] =3D
> > > {
> > >   riscv_supported_std_ext,
> > >   riscv_supported_std_z_ext,
> > >   riscv_supported_std_s_ext,
> > >   riscv_supported_std_zxm_ext,
> > >   riscv_supported_vendor_x_ext,
> > >   NULL
> > > };
> >
> > I think in this case, Drew's differentiation between Zi & Zb is an
> > improvement :)
> =

> =

> That might be the case, but it also brings up the following questions:
> Where to put Zf* extensions (between Zi and Zb)?

I don't think that differs either way?

> Where to put Zk* and Zv* (after Zb*)?

Ditto?

> Adding a subgroup for each Z{N}* extension might result in many small
> groups with little benefit.

If it prevents another one of these ordering episodes, I think it's
worth doing! If a "group" only has one element it could alternatively be
added directly also.

Also neat, you got your mailer sorted :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
