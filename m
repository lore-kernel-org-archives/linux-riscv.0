Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1A9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 12:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1E62173C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 12:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVOi8g1x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjcBjbah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1E62173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNp40YM+KtpmF+Ghzt7kOHCI4s9YZD5rziZVzGPARYQ=; b=VVOi8g1xTenIrV
	+5iiqmKRXf8BKuF73bJzHjHZvFqJS/0qC+Nsyt8Wm+/r/wgSk/COaxoijALfe1OZLUe2ljQusg6WA
	WCZZl2K0SSTdy7l31ffvZf1cOIiE/7m1Kk9ncxoFoj3jorfcfFwiJiw4+I4FOFH/xFK/ghKEdvx/a
	5uGcapwJ6phhYeK0kvmxRY35BOReT2Rh3Mm0/BiYXjcPS4wCsYrDEneJPAWSEETCfbcWRytfrWUcA
	Q5iA/UnyKTL0cWEF3MfPxrohwCMwIMtTh2qYRAdU57t87eNrVbsgNqwsc1v8uFg6/k9pQE37bjFtN
	0qeoIx0qf1yRHKGr63aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gviKJ-0007OC-I8; Mon, 18 Feb 2019 12:47:15 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gviKH-0007No-N8
 for linux-riscv@lists.infradead.org; Mon, 18 Feb 2019 12:47:15 +0000
Received: by mail-lf1-x141.google.com with SMTP id q11so12182029lfd.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Feb 2019 04:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhM/mauBJck6aHRYgcqqFsOsl1B7ZjHg4yd8uzUwQDE=;
 b=mjcBjbahr86ojcygi/eLoNW179Ryv3mSs0MohtnrQAV6FyL+VV1pgHTqrSBRCfjxDD
 3P6j1Y+gqW+caEQE39wjF5Y8WsUDkaatY7qreO2lfZxw2xY9NceIH2vuB9qC2odbVX4U
 h1XX4saztnNAEoPDc82o6JaiCNHqLV2BlsDqGn7UCeKybvfN0NtqktNs3lRnKCLWD03g
 zLIXkVCt7YBC5z4sh6zI96IvebtIW/FypSqGFPqDqb5iSb6vBN31TKRKalKtaBaPdjV8
 Gv4g4zO6IeDglQk636jbmv73/AGMiHSBcis/aSCO1+g8BvwUZ6ArgCmxGQf4z7pfAf1j
 OXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhM/mauBJck6aHRYgcqqFsOsl1B7ZjHg4yd8uzUwQDE=;
 b=sneBDsuTX3lgCM91z1ivSrEieIdWWoPmbUslS686ye/KfZnGvU6hxDwmPLdWqWEhc+
 6L5NL8Au8jM6j82NaxlfcuHrUzJrWwxmmosjh9NrsIxQZB1+8htOSjx0oo9VGqtEHAsk
 CnMpRepDP7fmd6VTyJCz3Hz0nskqP6v2/Q0q8aavhVpRAfKHEgKH1RkIRj9ayUk8N+MI
 H+D40afrVsUZyANTFKQ3sLzmB0SIfsXlv4hwNiPKylUI9I4ovF7c6N0tbXtTXJPyESSA
 0X2MF7CZs+dpA85I0m65blM0npY1U3RGlz3W8UHo5nd5kaZm/ggQRvYc0O5emJKuq/0F
 aAqw==
X-Gm-Message-State: AHQUAuYLoal1lHHHSPdaOYCuZ+nowPt4k1ahQv8W7PcP7LVh4vpTfd1j
 xfQMRGYvSFXHSWPX4NcVxh7t8fgbmbhCnHsL48/K/om4
X-Google-Smtp-Source: AHgI3IZuUyk0D28Ou67GADmhMyds23jk34C0/RBSJfPoSe4kiB+TgSQa5Tjz5Ptmy8SfkVo0CA5Gf1sx8Kh8TroF6hk=
X-Received: by 2002:a19:ab19:: with SMTP id u25mr13349710lfe.64.1550494031281; 
 Mon, 18 Feb 2019 04:47:11 -0800 (PST)
MIME-Version: 1.0
References: <1550159977-8949-5-git-send-email-rppt@linux.ibm.com>
 <mhng-e6dedfc5-937e-42e5-90d6-4ce400cbc6fb@palmer-si-x1c4>
In-Reply-To: <mhng-e6dedfc5-937e-42e5-90d6-4ce400cbc6fb@palmer-si-x1c4>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 18 Feb 2019 18:16:58 +0530
Message-ID: <CAFqt6zYL8q16a0dKvNb_1MpJCuz4VrkT1pKe=eqpywxA-hnL0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: switch over to generic free_initmem()
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_044713_758835_24F48A9E 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Mike,

On Fri, Feb 15, 2019 at 2:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 14 Feb 2019 07:59:37 PST (-0800), rppt@linux.ibm.com wrote:
> > The riscv version of free_initmem() differs from the generic one only in
> > that it sets the freed memory to zero.
> >
> > Make ricsv use the generic version and poison the freed memory.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Just for clarity, does same change applicable in below places -

arch/openrisc/mm/init.c#L231
arch/alpha/mm/init.c#L290
arch/arc/mm/init.c#L213
arch/m68k/mm/init.c#L109
arch/nds32/mm/init.c#L247
arch/nios2/mm/init.c#L92
arch/openrisc/mm/init.c#L231


> > ---
> >  arch/riscv/mm/init.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 658ebf6..2af0010 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -60,11 +60,6 @@ void __init mem_init(void)
> >       mem_init_print_info(NULL);
> >  }
> >
> > -void free_initmem(void)
> > -{
> > -     free_initmem_default(0);
> > -}
> > -
> >  #ifdef CONFIG_BLK_DEV_INITRD
> >  void free_initrd_mem(unsigned long start, unsigned long end)
> >  {
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> I'm going to assume this goes in with the rest of the patch set, thanks!
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
