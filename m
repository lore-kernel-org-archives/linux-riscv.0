Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB23CD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 07:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYrmbOE4WG+gsh5ru3npiktzICVMv6xCC1Z8+PGE9ts=; b=PbZG7yiw/0+dQE
	TmUJr6kXZWYXB76sdwEf49d7bxzyNXJ4lWZQoodkpqU6XqwQypBr9p5oKGT3xjQ0+SLhjArND3/RB
	TYj7lPdlTSwG0OcgNwq4Hv9A14sqK8U8oh8dgnHLt3vqnMeLKWSYGta0Ttjflbz7rk2jqra/8StLj
	6EUVTB9GMflgTJLerHykIiAIGXk9Y4UD1Ej9e+GZqz8LMjFXgNvH8vNS+rybG1iVHaKon/B5dWM1B
	xgkAZT97g5BN9JV4ALk86NGC7c0ogRbFrobiPlFgwaj8AurP9CMkSXML1ozE5qIGFwk83sj1LcB6c
	xCjhegcMnDiKGi3BOG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnIT-0000000CYWH-15qT;
	Mon, 04 May 2026 07:00:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnIR-0000000CYVV-2FLp
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 07:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CA4343C9C;
	Mon,  4 May 2026 07:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB74FC2BCC9;
	Mon,  4 May 2026 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777878049;
	bh=O/IjjvqcY6T4mHKxT7aqn7RJ8sDV+fNCJ2tJTa/lzkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VEq4HUcf3QNgYsZ7GMLg83m0pOxdUX9O7Y8j03YlhQBitf91Vdnr63V2+j+0HE3S4
	 feXCh8vjB9auwL9Bao0bll0iph31TaHrOxHWhs42nk9Ae3PFuy+MLSSZk0yACnA5n2
	 408SIW5r8x74ZUmrxXu1zjFUWz0dJpiysSRzxeWFE0LtMdYlq9fZNb1kzuSJ+Bpuxw
	 icKSJt1AdQaIxxfYwmj+YqF/eUc24tQFV+Czmb3SpNSisxXtVadc0ovb/TM6Eti26e
	 BlTmOgKw8xwMhQS3qOQg7pLSA6pH3wqbK+OU1nPXxxv+YPnyj4wmVPYJNq6RU0Uqx5
	 7vbxOzL115vMg==
Date: Mon, 4 May 2026 09:00:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
Message-ID: <20260504090041.243520a8@foz.lan>
In-Reply-To: <87lde0bii2.fsf@trenco.lwn.net>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
	<87lde0bii2.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_000051_626575_B1BBE7F0 
X-CRM114-Status: GOOD (  39.31  )
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

On Sun, 03 May 2026 09:49:41 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This is basically the same patch series I sent during the merge
> > window, rebased on the top of post 7.1-rc1 docs-next branch.
> > It is tested both with and without O=DOCS.
> >
> > It contains just one extra trivial patch adding a missing SPDX
> > header, and, on v4, I dropped two patches touching MAINTAINERS,
> > as those aren't needed anymore.
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
> 
> One thing I kind of dislike about these magic mechanisms is that we end
> up with a single, essentially unsorted list of stuff that readers have
> to go digging their way through.  It would be nice if we could somehow
> apply a bit of structure; as the number of these handbooks grows, our
> readers would appreciate it.

The output is sorted by subsystem's name:

	for profile, entry in sorted(maint.profile_entries.items()):
	    if entry.startswith("http"):
		output += f"- `{profile} <{entry}>`_\n"
            else:
		output += f"- :doc:`{profile} <{entry}>`\n"

But yeah, as this grows, We can apply some struct there later on.

I expect that this would be good enough for "P" entries: as such entries 
are used only by the biggest subsystems, I won't expect that the profiles 
list would be too big. 

If I'm wrong, though, changing its output is easy, as all the parsing
were done in separate: all we have to do would be to change this part.

-

Now, for the full MAINTAINERS content, I agree with you. I have
a patch series here which splits the parsing from the output,
which allows placing its contents inside a table and with a
filter javascript [1]. On my view, the output is a lot more
interesting for readers this way [2].
 
> Oh well, one can always hope.  Meanwhile, this seems useful, I've
> applied it.

Thanks!

---

[1] On such series, I'm creating a table with two rows:

        output += ".. _maintainers_table:\n\n"
        output += ".. flat-table::\n"
        output += "  :header-rows: 1\n\n"
        output += "  * - Subsystem\n"
        output += "    - Properties\n\n"

        self.state.document['maintainers_included'] = True

        for name, fields in maint_parser.maint_entries.items():
            output += f"  * - {name}\n"

            tag = "-"
            for field, lines in fields.items():
                field_name = maint_parser.fields.get(field, field)

                output += f"    {tag} :{field_name}:\n        "
                output += ",\n        ".join(lines) + "\n"
                tag = " "

            output += "\n"

   Which is a lot easier to read than the current output, and adding
   a small javascript that allows filtering entries, based at the
   contents of either subsystem or properties. That should help
   readers to seek for things they're interested.

   I considered ordering it by subsystems, and did some tests with that,
   but at the final version I ended removing.

   The main issue is that MAINTAINERS entries aren't grouped by
   subsystems. Also, we don't have any field to identify to what 
   subsystem each entry belongs.

   Using the mailing list field helps to have something close enough,
   while being fast. Even so, some caveats are needed, as:

   1) several entries contain multiple ML entries, which may include:
      - subsystem ML;
      - LKML;
      - driver-specific ML;
      - vendor-specific ML.

   2) several entries have only LKML.

   For the purpose of grouping such entries, even after filtering out LKML,
   due to (1), hints are needed to try to pick subsystem ML. Perhaps the
   best hint is to check if the entry is @kernel.org, which works reasonably
   well. Yet, not all subsystems have its ML there.

   I also considered sorting them by the number of files, using iglob 
   to calculate it. That would help to place the subsystem first, followed
   by subsystem drivers, and this is fast enough with my nvme disks but 
   this could slow kernel builds on mechanical HDs.

   So, I suspect that, if we want to have something more structured,
   the first step would be to do some rework at the MAINTAINERS file.

[2] I need some time to check if are there any regressions
    on the patch that splits the logic.

Regards,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
