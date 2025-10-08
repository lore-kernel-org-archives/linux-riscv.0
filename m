Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2310CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssQwTLcy3sHbQ1pSiNgBiuHK20/e9XQbrY9SmKHoLnk=; b=evCxyC/gNkD2fQhLTlHKHQpP4E
	cWNsAUCc9W58nl80N2D6dA5sFDvTlBqSJwINI7XExNF1AZoN5hThOf5CFuxbGiVbB67YSnk/0P+s6
	X23df1b/DK/tRsCEYgeFBi+54x2KMuPkx/gzx5WVRcaYSyetxAK7HYC4XQ225nqegg9owREqBHXBa
	sCqncyhwUrCowmDbAc3X4xdyT8bXOJ6IRKVPqpZ+OegAsBVDlnuDnHmpbQqa0PwAY1vxbdPdBJ0Yl
	cBFXmy08bTXsQtvpFHca/fmhVakdecOxuc2UmGAGR5jwEFlxBzsdpkYHcxI3JSUet4tmhJ5toUs7q
	Q4FH4pHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XxR-00000004Nu7-3s6J;
	Wed, 08 Oct 2025 17:28:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XxP-00000004Nti-3wsS
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 17:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A49E445751;
	Wed,  8 Oct 2025 17:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171BAC4CEE7;
	Wed,  8 Oct 2025 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759944486;
	bh=jwdCdiB3JXrP+/r0f6H5LB358mwYJ7mIQcuQdBsmhaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N6ouxzpyEzXdYDVx2I5BS9P4P/w2S9R8pIxo8m1MoPcjHjdt0Fy6kALENLDqTY+5P
	 1IyQfiOSZl/f5w5TlxdnYXCyoDzQ5A1exTCnKh3ifsZ2nHx3bTYy8XcrLFflp2cDjc
	 w/QDw236Mi9qw5npJ/H3Zy7p3Ii9185gBherfQrtCGmk9Ovh3SA44X0+UkahBSciBM
	 otcmDn1kH9cjTLuR1SLYqBcmZ/uRepf79/9QMeRRW9AYfyXXXdxUupU5wGrso99kAv
	 hMISjmoy4k9JvR/koxSkc4oILcPrmJP6UYEFQJSSZ06TmR2HOq4c3vlObC7E+k+S7a
	 snVO0asEehymw==
Date: Wed, 8 Oct 2025 11:28:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Miquel_Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, wangyuli@uniontech.com
Subject: Re: [PATCH] riscv: kgdb: Ensure that BUFMAX > NUMREGBYTES
In-Reply-To: <68da3e6d.050a0220.c13dc.0f9a@mx.google.com>
Message-ID: <2f6dd420-2bfd-794d-182c-74934577272d@kernel.org>
References: <20250915143252.154955-1-mikisabate@gmail.com> <68da3e6d.050a0220.c13dc.0f9a@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-95744204-1759944486=:929355"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_102808_004791_F60D4010 
X-CRM114-Status: GOOD (  13.90  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-95744204-1759944486=:929355
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 29 Sep 2025, Miquel Sabaté Solà wrote:

> Miquel Sabaté Solà @ 2025-09-15 16:32 +02:
> 
> > The current value of BUFMAX is similar as in other architectures, but as
> > per documentation on KGDB (see
> > 'Documentation/process/debugging/kgdb.rst'), BUFMAX has to be larger
> > than NUMREGBYTES.
> >
> > Some NUMREGBYTES architectures (e.g. powerpc or hexagon) actually define
> > BUFMAX in relation to NUMREGBYTES, and thus this condition is always
> > guaranteed. Since 2048 is a value that is generally accepted on all
> > architectures, and that is larger than the current value of NUMREGBYTES,
> > we can keep this value in arch/riscv, but we can at least add an
> > 'static_assert' as an extra measure just in case NUMREGBYTES changes in
> > the future for some unforseen reason.
> >
> > Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>

[ ... ]

> Gentle ping :)

Thanks, queued for early v6.18-rc.


- Paul 
--8323329-95744204-1759944486=:929355
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-95744204-1759944486=:929355--

