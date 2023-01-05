Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C01FC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqUw86ODWI19bBWSKo8UQmJkeoaLqmexzF6ASXbNPEw=; b=UvDti+DIVSEMcZ
	gT/khWs9UttYEDBNbsZpq/7mo33b1GmQpMKLS6qE0et9XQec7slfszPBKChiVRuZ0mbk3Ag3Zbm3F
	hEz+8SBePnbugg7/w+8mI6yIAp8pIMRc6Ax+Igkfx/oV9UR2ibGR0BoIRFzOzlczJ6LjmU7VI6Odc
	onE1PIQb7mqfPoODm4S7nV/pCnImulSxa98MC6uGpisX9FHyXBrzhigd6Y7m/ndKd5NLcA0mQ2NcZ
	nsfL3U0g+4MDMKZB+D7LDig34G0o+oMPxQsT5pARoMzHLD+G1KYwomHAdCMe4tr2l3HogineorfBJ
	Vv/CVxsFyub25F+Hyq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYaZ-00FWdN-Vk; Thu, 05 Jan 2023 22:19:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVEN-00Dmuq-QF
	for linux-riscv@bombadil.infradead.org; Thu, 05 Jan 2023 18:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eORmBwNQAesO9AcSinEDm05/pdBlXMbb+3YQtNK7hbE=; b=GDJdqgrz72COOhSXh+K+rfFcc3
	bwz0XOaI6BZdJgTCP0edxFPNsCd2P/uWytjAooSmCnXKvqoLZVWqpa5CrRLhiiYaQZuVPcLsmg+ng
	XUkmfOa+GpUqwaWgQioA395iY1MHvnlFSXBTJwNpnHX8bITLZO9R5fRv6PVgmFJJ8tJ+iMjbu9PJI
	CiaV+qQnG5gXJM7iHXOUe0bRK42w4FsItX3yM/Cc9PmF3YzaaKDALXcStV5btKktxSPQIrHAl+9TP
	cvM8rYxjXW78pjnZvpr/XFG9NQHJlYwu+Hu/hFvmKrXwsM8d9wInL9l7+nrWwLG9/egifESMctNz/
	GVDKO3kg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDSsr-001Tct-1q
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jan 2023 16:14:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pDSss-0000bl-60; Thu, 05 Jan 2023 17:14:26 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com, linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
Date: Thu, 05 Jan 2023 17:14:25 +0100
Message-ID: <2687391.jE0xQCEvom@diego>
In-Reply-To: <20230105150045.ksqcqsypnog425gi@orel>
References: <20230103214228.841297-1-heiko@sntech.de> <2035002.VLH7GnMWUR@diego> <20230105150045.ksqcqsypnog425gi@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_161425_682242_1B761C19 
X-CRM114-Status: GOOD (  27.38  )
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

Am Donnerstag, 5. Januar 2023, 16:00:45 CET schrieb Andrew Jones:
> On Wed, Jan 04, 2023 at 04:58:00PM +0100, Heiko St=FCbner wrote:
> > Hi again,
> > =

> > Am Mittwoch, 4. Januar 2023, 15:08:33 CET schrieb Andrew Jones:
> > > On Wed, Jan 04, 2023 at 01:29:25PM +0000, Conor Dooley wrote:
> > > > On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > =

> > > > > RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
> > > > =

> > > > Hey Heiko/Palmer,
> > > > =

> > > > Was a little hard to tell from Drew's mail if he was objecting to t=
his
> > > > variant of the patch, but FWIW s/decup/dedup/ if this gets applied
> > > > as-is.
> > > =

> > > I wasn't completely objecting, but rather suggesting we still try to
> > > factor out what we can. However, after reading a bit more about macros
> > > I tried this
> > > =

> > >  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, e=
nable_1,   \
> > >                                 new_c_2, vendor_id_2, errata_id_2, en=
able_2
> > > -       ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1,=
 \enable_1
> > > +       ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_i=
d_1, \enable_1
> > >         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c=
_2
> > >  .endm
> > > =

> > > which appears to work for my simple test. Does that work for you too,
> > > Heiko? If so, then I think I'd prefer we do that. Also, we may want t=
o add
> > > quotes to all macro arguments which may contain spaces, even if things
> > > seem to work now, e.g. the \new_c_2 argument passed to ALT_NEW_CONTEN=
T.
> > =

> > Yay ... adding quotes really seems to work - at least a GNU toolchain
> =

> clang isn't complaining for my test either.

Nice =


> =

> > =

> > I guess that may have been the reason to move new_c at the end and maki=
ng
> > it vararg in ALT_NEW_CONTENT originally.
> > =

> > And in fact with added quotes the varargs argument wouldn't be necessary
> > anymore.
> > =

> > Just removing the varargs argument alone results in
> > 	Error: too many positional arguments
> > erros, but wrapping the "\new_c*" in quotes lets it compile again.
> =

> Excellent news. Do you plan to post the patch? Or should I post with your
> Reported-by tag?

I was planning on posting this today. Did the v2 an hour ago :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
