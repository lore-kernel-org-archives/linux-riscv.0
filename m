Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D095EA7197
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXL2tMTJv+cOQPkypleCY/5bJj6q0MrrRrsR3KuIdLQ=; b=4kwj3Wq+WIyHW2
	FzVL5GfODeaRJPoOsCC3b1gp3GVgOppFA2bWVJde1chsCYvQnF+AhMoSIJ1EPPUy12k11NuhEYCEM
	JnELZFPGPpwoUu0nx2HDu4jbr0y2607bOu+Fhz3j7FXkCx7TNKvGBhZSDaNFa6Hqk1mP0GCMKLQq5
	gPRWqxpGHpy1/oYlhabsgc75kwDZn9zGeEUaiF53TZB+ECyjyAfWf6KgLurSklVLhlCc3dp1G3vWc
	fyLM0EBeu+3ZWbwnD2z0d38krDB9uk++67uI8VvK5HM2Zq1kyHTrHsIE9uZLWqEu1FmnLy3wtXHOp
	+C6wuyXoIKZkF+JDEFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXS9-000000061C9-0xVe;
	Sun, 19 Apr 2026 19:05:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXS6-000000061Bh-4BjY
	for linux-riscv@lists.infradead.org;
	Sun, 19 Apr 2026 19:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0A7440502;
	Sun, 19 Apr 2026 19:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7D3C2BCAF;
	Sun, 19 Apr 2026 19:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776625504;
	bh=0o6iXnNdqdajO9sJAzsWeXyZ6igvpK08RjfL8VZgRvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DVChCz/DdGfBg9+KCUerv/hol4dJ8KH4nuQxdYFJA5hBJm/2t3v3xJz92Dwlpt+3J
	 MZDAWfNYlyvPc4Q/7CpFyUYWZYJ1XI9VPu9l7W6hmIsPSIB4D5zsUvALa+CYeyDmNf
	 KTULdMz1jgGTsejlNu2ULnMFCbeignRNcWbteuheL5FMKDpxlXFzSkRYmWj7TVsdI4
	 6Jb+oqfSIuB2bWyKc+zSCUl+pZ1fh27qdEfe1t5/d6xb9CHEcn//fLCcfleSZN+X9o
	 MAmIwoucwj0DRcqMq6C1gqji25KN8dSMYGkUaV69vYfuUxZXE8kCYKEKReydlJKaQr
	 XzgCcV+GCSd+w==
Date: Sun, 19 Apr 2026 21:04:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Dan Williams
 <djbw@kernel.org>, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2 00/11] Auto-generate maintainer profile entries
Message-ID: <20260419210456.1f3911a0@foz.lan>
In-Reply-To: <9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
	<9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_120507_096127_E3517EA6 
X-CRM114-Status: GOOD (  36.45  )
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

On Sat, 18 Apr 2026 17:05:56 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> > Hi Jon,
> > 
> > This patch series change the way maintainer entry profile links
> > are added to the documentation. Instead of having an entry for
> > each of them at an ReST file, get them from MAINTAINERS content.
> > 
> > That should likely make easier to maintain, as there will be a single
> > point to place all such profiles.
> > 
> > The output is a per-subsystem sorted (*) series of links shown as a
> > list like this:
> > 
> >     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
> >     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
> >     - Arm/Tesla Fsd Soc Support
> >     ...
> >     - Xfs Filesystem
> > 
> > Please notice that the series is doing one logical change per patch.
> > I could have merged some changes altogether, but I opted doing it
> > in small steps to help reviews. If you prefer, feel free to merge
> > maintainers_include changes on merge.
> > 
> > There is one interesting side effect of this series: there is no
> > need to add rst files containing profiles inside a TOC tree: Just
> > creating the file anywhere inside Documentation and adding a P entry
> > is enough. Adding them to a TOC won't hurt.
> > 
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Dan Williams <djbw@kernel.org>
> > Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> > 
> > (*) At the end, I opted to use sorted(), just to ensure it, even
> >     knowing that MAINTAINER entries are supposed to be sorted, as
> >     the cost of sorting ~20 already-sorted entries is negligible.
> > 
> > ---
> > 
> > v2:
> >   - I placed the to MAINTAINERS changes at the beginning.
> >   - fix a bug when O=DOCS is used;
> >   - proper handle glob "P" entries (just in case, no profiles use it ATM);
> >   - when SPHINXDIRS=process, instead of producing warnings, point to
> >     entries at https://docs.kernel.org;
> >   - MAINTAINERS parsing now happens just once;
> >   - The output won't be numered for entries inside numered TOC trees;
> >   - TOC tree is now hidden;
> >   - instead of display a TOC tree, it shows a list of profiles,
> >     ordered and named after file system name taken from MAINTAINERS file;
> >   - At the output list, both https and file profiles are shown the same
> >     way.
> > 
> > Mauro Carvalho Chehab (11):
> >   MAINTAINERS: add an entry for media maintainers profile
> >   MAINTAINERS: add maintainer-tip.rst to X86
> >   docs: maintainers_include: auto-generate maintainer profile TOC
> >   docs: auto-generate maintainer entry profile links
> >   docs: maintainers_include: use a better title for profiles
> >   docs: maintainers_include: add external profile URLs
> >   docs: maintainers_include: preserve names for files under process/
> >   docs: maintainers_include: Only show main entry for profiles
> >   docs: maintainers_include: improve its output
> >   docs: maintainers_include: fix support for O=dir
> >   docs: maintainers_include: parse MAINTAINERS just once
> > 
> >  .../maintainer/maintainer-entry-profile.rst   |  24 +--
> >  .../process/maintainer-handbooks.rst          |  17 +-
> >  Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
> >  MAINTAINERS                                   |   2 +
> >  4 files changed, 150 insertions(+), 54 deletions(-)
> >   
> 
> Just a note, not asking for a change or fix:
> 
> AFAICT, all P: entries are now listed nicely except for:
> 
> P:	rust/pin-init/CONTRIBUTING.md

That's because it doesn't follow what's expected for "P":
either a file that Sphinx can read (rst files), placed inside
Documentation/ and added to Sphinx toctree or an external html URL. 

The way it is, the subsystem profile regex won't get it.

While it is not hard to add an exception, IMO the best would be
to do:

	$ pandoc -fgfm -trst rust/pin-init/CONTRIBUTING.md > Documentation/process/pin-init.rst
	$ sed -i s,rust/pin-init/CONTRIBUTING.md,Documentation/process/pin-init.rst, MAINTAINERS 
	$ git rm rust/pin-init/CONTRIBUTING.md
	$ git add Documentation/process/pin-init.rst
	$ git commit -as

> 
> so for the series:
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!

Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
