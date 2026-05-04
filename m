Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491F7CD3430
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K70YmLhL7C/93fWRPZiMRWFUmepq3Wn8m2brZReGc3M=; b=1F+IFTx8fBmGOv
	0nBwdXHIgRP+NuhjwGcfeOYAd/ePGRfIYlBvgA3Pn1ovbTO6sB8gprXcXVx6Q9BxxkPMqpPlPcf8o
	wtjGFF41QnYzhpT1okZ7cyO9s+nD2xqeMzcC6bX0cve2R1GqfQQZr1WAp1G4mH6RUjBpWIKyoIcFF
	1pbUayTxS1kFxw7nR8cwH3265L2LKG5U+8pBOrGEnXugzqB7rpifl/kgD6w1yEZgoZ/qXH1P70wck
	a+sGfoBINWHG9l0ZQqzbJ4xfk59OC1Wu+lf7JleLXTM2Qz+saKdwagOdoYaM/3jO7Pp4z/wGN57lh
	FI2agnxhDaPAlUDUMVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuSN-0000000DTTH-2Sev;
	Mon, 04 May 2026 14:39:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuSM-0000000DTSQ-1jJu
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 14:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B8C961146;
	Mon,  4 May 2026 14:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9E5C2BCB8;
	Mon,  4 May 2026 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905573;
	bh=FxoWnitM8sq1qmvGum3hMvfTjjYC12V36P8W0yTzW30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I8JnDe6EUtn6YHetNFJEcZa2PNfrak+g1eIYd5Np8ZtMa8mHvCfiqaUMRMwn672Zf
	 qehRu31K4AO9YapQPUdJ5QOLjr4SqL0Pdov/OWdK1OZY/C+Sjl/svLmKRZuwHqt8mN
	 uAXgq71OSFK3U9bpCUWXDuS5zQi4iAThTdNV63saKaI+yxgNkS7Vcs+5shg9VZ8nAN
	 dGnOSCLFHMvsPVt1auoJjkVVGrEmNDNYBU2P7HNoVoOQbsvN3Pd0Mo9sZvkTo31XCX
	 PnsE1dWihKOzNX9myapNngb2M3XyFo+tcNukl6zsBI2V9Q/5pScjwZbQJVEpQcrGxK
	 EHtrRh3Ab/krQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJuSJ-0000000EoSy-02WM;
	Mon, 04 May 2026 16:39:31 +0200
Date: Mon, 4 May 2026 16:39:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
Message-ID: <20260504163930.6114320b@localhost>
In-Reply-To: <20260504090041.243520a8@foz.lan>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
	<87lde0bii2.fsf@trenco.lwn.net>
	<20260504090041.243520a8@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Mon, 4 May 2026 09:00:41 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Sun, 03 May 2026 09:49:41 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > 
> > > Hi Jon,
> > >
> > > This is basically the same patch series I sent during the merge
> > > window, rebased on the top of post 7.1-rc1 docs-next branch.
> > > It is tested both with and without O=DOCS.
> > >
> > > It contains just one extra trivial patch adding a missing SPDX
> > > header, and, on v4, I dropped two patches touching MAINTAINERS,
> > > as those aren't needed anymore.
> > >
> > > This patch series change the way maintainer entry profile links
> > > are added to the documentation. Instead of having an entry for
> > > each of them at an ReST file, get them from MAINTAINERS content.
> > >
> > > That should likely make easier to maintain, as there will be a single
> > > point to place all such profiles.
> > >
> > > The output is a per-subsystem sorted (*) series of links shown as a
> > > list like this:
> > >
> > >     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
> > >     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
> > >     - Arm/Tesla Fsd Soc Support
> > >     ...
> > >     - Xfs Filesystem
> > >
> > > Please notice that the series is doing one logical change per patch.
> > > I could have merged some changes altogether, but I opted doing it
> > > in small steps to help reviews. If you prefer, feel free to merge
> > > maintainers_include changes on merge.
> > >
> > > There is one interesting side effect of this series: there is no
> > > need to add rst files containing profiles inside a TOC tree: Just
> > > creating the file anywhere inside Documentation and adding a P entry
> > > is enough. Adding them to a TOC won't hurt.  
> > 
> > One thing I kind of dislike about these magic mechanisms is that we end
> > up with a single, essentially unsorted list of stuff that readers have
> > to go digging their way through. 

Heh, perhaps you're referring to the TOC tree. You'll see it
unsorted on diffs because the TOC tree there is hidden. As it is
a set, currently it will output a different result on each run.

Not a problem for users, but it makes harder to check differences
after patches, so I'm planning to submit a patch to keep it sorted
just for the sake of doing:

	diff -u before/ after/

Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
