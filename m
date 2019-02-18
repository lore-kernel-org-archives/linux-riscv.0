Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF265C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 12:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE432206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 12:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZcX74kY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3929Rhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE432206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1OoHQpxT35Z8YhxyHilstiWBHyhCS66I14COThfdh4=; b=cZcX74kYpoH0pr
	xgC4wrHweusf63mYNEopgfTXpe5BTsPWw1A9wbxU9iZOmTbIUdRqUaaA+n0UHhGMgPtWYhKmXOnBz
	2QOuTQa+NjC1od8CN/u6ejaUeWWZgvn/odL/KffnXlmokdrobLYdptq4Ma9O3+4c/MsziBSp0V5Na
	lUjT8qjv/qdvFBH1IwoPTdiuY4TkLqX/f0mLCpzLo97BUxLAjJuYP54SLuMK6KND+NxYBXCw9sAFw
	VFM/x4GBRYSZYwNgSZMBjAMDvIGe/y7rsbi+F68OYDslx9Oi/zZ7Cx4cO8nHEaosNPi1Bm1guSRvJ
	neDcKiVsJJ7EjLPZHVog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gviNZ-0000JA-Sv; Mon, 18 Feb 2019 12:50:37 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gviNW-0000Ii-Rh
 for linux-riscv@lists.infradead.org; Mon, 18 Feb 2019 12:50:36 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so14194057ljd.12
 for <linux-riscv@lists.infradead.org>; Mon, 18 Feb 2019 04:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3mDCcqlTfvGRxpNOHBVgyu2R93YF4O1+jAeLCd5+y8=;
 b=d3929Rhyr7JOx9T5ZNS/6Yvki/jgtKOl1mQuZDiAuzD+uLmHBJA2ImNlzS57u0vjU/
 jNws9qOKr7mOkjYV/Nfm4TJXQmA33N16G6VlmjdgKbs310j7PDoFa0VRVneZTdZPGi0M
 W7HvYdSndWcBXb5ZtA7BY/f7kUN02sa4TH4GuisKrt6rTa5WM9LX6XPz7dnG81E2A270
 AvCoZSdQIfycQQEG4BM+aU/M1/S8c36XS6+kwzPIa9efHzaX/TzViHgV9HoS1C27/vME
 ezEEYRnpVK5/QuJAlIUGlOJjVjPEG/u5gaHDT/EpS2x94vaeTTERXn2sYEbj2LoO3qk9
 0TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3mDCcqlTfvGRxpNOHBVgyu2R93YF4O1+jAeLCd5+y8=;
 b=g7sOzJXfh3GOuRFL1psIhvf09fRzwPcqDrTuDkO8/A+wwrLtsTvr+Ss9Bz3GIrcf5l
 Aq5GisUl+MEKsn9fFaOeHB+e87ZQBxaNxhSphyzs/yQ2kP8w8NgNyvUrV2iMaqMMs68n
 yQFdUv9trMa2eJN4vePR/ZUswgkcRRCA+b4hIUmiRRI3Aq+ZumW1KBR9QAAj/xVgzVCP
 Ob+nY3gtqf33/Qni5CJHbikLH3nVgZDirJSxED0dNJUDYuRJ6cUpRl+/vxWPXHVpsvqJ
 d+1UwXe/zjiKBfyXklApPD8nJoYHOwcXqPOThw151EOuKHj9f6zyGLams1UMvNBv45Bf
 SBqw==
X-Gm-Message-State: AHQUAuZYCsm43mMpDneXOzqLEFARKsy79kIZWeL6obaKF5rOSh7AQ+rI
 2z5IQ7TguJL+x4HD76F6v5+S40uQ/Eu/EGC2HwA=
X-Google-Smtp-Source: AHgI3Ia7IZsHQNFgpIiE0j0w/ytCYnL63rFO9AwxTQ8Wplej5TLVOxyA2h10iRJ1ZNJWTRv7b5EcitX5kmjrKENMz4g=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr12365910lja.9.1550494232904;
 Mon, 18 Feb 2019 04:50:32 -0800 (PST)
MIME-Version: 1.0
References: <1550159977-8949-5-git-send-email-rppt@linux.ibm.com>
 <mhng-e6dedfc5-937e-42e5-90d6-4ce400cbc6fb@palmer-si-x1c4>
 <CAFqt6zYL8q16a0dKvNb_1MpJCuz4VrkT1pKe=eqpywxA-hnL0Q@mail.gmail.com>
In-Reply-To: <CAFqt6zYL8q16a0dKvNb_1MpJCuz4VrkT1pKe=eqpywxA-hnL0Q@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 18 Feb 2019 18:20:20 +0530
Message-ID: <CAFqt6zZZaFU_i+srxk9rd_+5V9FTd767MH-rCocvJPfFcXJsCQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: switch over to generic free_initmem()
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_045034_896735_598949C9 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, rkuo@codeaurora.org,
 Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 18, 2019 at 6:16 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Hi Mike,
>
> On Fri, Feb 15, 2019 at 2:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Thu, 14 Feb 2019 07:59:37 PST (-0800), rppt@linux.ibm.com wrote:
> > > The riscv version of free_initmem() differs from the generic one only in
> > > that it sets the freed memory to zero.
> > >
> > > Make ricsv use the generic version and poison the freed memory.
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>
> Just for clarity, does same change applicable in below places -
>
> arch/openrisc/mm/init.c#L231
> arch/alpha/mm/init.c#L290
> arch/arc/mm/init.c#L213
> arch/m68k/mm/init.c#L109
> arch/nds32/mm/init.c#L247
> arch/nios2/mm/init.c#L92
> arch/openrisc/mm/init.c#L231

Please ignore this query. just saw the other patches.
Sorry for the noise.
>
>
> > > ---
> > >  arch/riscv/mm/init.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 658ebf6..2af0010 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -60,11 +60,6 @@ void __init mem_init(void)
> > >       mem_init_print_info(NULL);
> > >  }
> > >
> > > -void free_initmem(void)
> > > -{
> > > -     free_initmem_default(0);
> > > -}
> > > -
> > >  #ifdef CONFIG_BLK_DEV_INITRD
> > >  void free_initrd_mem(unsigned long start, unsigned long end)
> > >  {
> >
> > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >
> > I'm going to assume this goes in with the rest of the patch set, thanks!
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
