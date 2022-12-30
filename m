Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F67EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Dec 2022 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKJP0jpCHb2lgT/Fpa4Kb2y468EBZr489J/k3H1CW08=; b=nuDfH3UWuZr4xn
	z8OKg7O/1WsFFImLsJttZyv7/Vu1wKHzO+WmEoI3dhzz5Gwy5QSSveIw6+qlnyG/zXy3YJ+gyNGS6
	lMIRSkQfb6+/xCqK2p9UeTGRpop458/33NEKzD9dN1SQw/2GHNRBy7GKGXlRzfwylaRyT/4OTlZLE
	sbZzw+54GkzYvuUdovd16uPUcBvVRV70wQRwPQJ/8JumvHHyz8+MiCFOgzuyM3ogt4g9ElhcIFlVN
	OLR7ZaMNK1DgQTBivR7htQpg9RupiMwkKtTiWii1OSNFQbDm8F+OTGdVByO7uzuc8ak5ClY0eJlMJ
	wyIgsAxyHZ3apzdn0Llw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBNbo-00E6HB-53; Fri, 30 Dec 2022 22:12:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBNbl-00E6Ed-K0
	for linux-riscv@lists.infradead.org; Fri, 30 Dec 2022 22:12:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id bt23so16608029lfb.5
        for <linux-riscv@lists.infradead.org>; Fri, 30 Dec 2022 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpuawFo1QryumZl9aqxUrtpkYD+9l4HMQlvhPEkbBZ4=;
        b=QFbwHGTzXUFD6JakV9JZvxSJXCAHYNNMnJFJPUD/Di8lCLRqfZxe3LaRNFtHHhkvyU
         6KjIwxSUHS/JXPfRxMOreMMxRNOl+zE3zBK+V9RKAU4Y9VtDfVIZ0JMxmhR7RRfASQcF
         +faCwgfE1EhEj070V4Maxq0DuyTynB05bzreVW0TDDxNSDzJJ/Q0B/XERv/i/hEmivpe
         0XxZgAPLcnF+Vp+Ly4FofuASkvDEvxvjOEyDO3ZtBBJvOR0TTh/VhxsxkUQEY5izzLtF
         mv4IO383wPoFLOXUzv1cYtFVoPPNWGZlZvA2ecjY3p4k/0Bxt7mpp9AQfdugGKqds5EI
         cQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpuawFo1QryumZl9aqxUrtpkYD+9l4HMQlvhPEkbBZ4=;
        b=K5K8tqI3AflaU74+RyoHDqx51DZSuGjbY9WI26MuYwVO5sjTjl0dAbhYCR8Jb3VFw7
         27j/LXqtK5U+PhqTArveckq3sKeH7B0aPk3/8cYA5SqexLMtoRajTz4qRnuLl3st+xLE
         TPc72MoD6Mm3okCD+ScRCXQvO20nr1yriTTobNiPdFEYABUUxfDu0UdRzhQlfUbCEA0l
         JLGvH1Ub2C8FoRSsg3qaipxnMToojzLPBIEkDYOc8ZbRrSZZKlLMFY9joSvMauXH437b
         S48kYRoAcJ7G4Y9IehPxotrUryJcQwkmuTTNFDJcS7E8DaPVCo4kMzS4YI4XIJCj6s2J
         yf3g==
X-Gm-Message-State: AFqh2koKWgWRGwalM9pBj7DGdx29apxwUh+6VLe4CfHeBDSioKOkS+N5
	+OyKvAV7XRLSkk38xRfjj/8=
X-Google-Smtp-Source: AMrXdXtYKIpCc3pFJcBPgY/PHdBRKzVXrrerQEtak+qK6HorvL54qWfN7H8mI7WOXOxmR4ofQebKwg==
X-Received: by 2002:a05:6512:3683:b0:4b5:b46d:e52 with SMTP id d3-20020a056512368300b004b5b46d0e52mr8204019lfs.50.1672438326052;
        Fri, 30 Dec 2022 14:12:06 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id u1-20020ac243c1000000b004b18163476esm3608728lfl.112.2022.12.30.14.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 14:12:05 -0800 (PST)
Date: Sat, 31 Dec 2022 01:12:04 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: errata: fix T-Head dcache.cva encoding
Message-ID: <Y69iNMQ60gXYkKus@curiosity>
References: <20221227020258.303900-1-uwu@icenowy.me>
 <CAJF2gTSGvEnTqEqR9f+zU8T3VS8FoCtsgSk=9hz6cWxAL630zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSGvEnTqEqR9f+zU8T3VS8FoCtsgSk=9hz6cWxAL630zQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_141209_697326_E736F8AF 
X-CRM114-Status: GOOD (  22.80  )
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

> > The dcache.cva encoding shown in the comments are wrong, it's for
> > dcache.cval1 (which is restricted to L1) instead.
> >
> > Fix this in the comment and in the hardcoded instruction.
> >
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > The code is tested on a LiteX SoC with OpenC906 core, and it
> > successfully boots to Systemd on a SD card connected to LiteSDCard.
> >
> > This change should be not noticable on C906, but on multi-core C910
> > cluster it should fixes something. Unfortunately TH1520 seems to be not
> > so ready to test mainline patches on.
> >
> >  arch/riscv/include/asm/errata_list.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 4180312d2a70..605800bd390e 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(                                           \
> >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> >   *   0000001    01001      rs1       000      00000  0001011
> >   * dcache.cva rs1 (clean, virtual address)
> > - *   0000001    00100      rs1       000      00000  0001011
> > + *   0000001    00101      rs1       000      00000  0001011
> >   *
> >   * dcache.cipa rs1 (clean then invalidate, physical address)
> >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > @@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(                                           \
> >   *   0000000    11001     00000      000      00000  0001011
> >   */
> >  #define THEAD_inval_A0 ".long 0x0265000b"
> > -#define THEAD_clean_A0 ".long 0x0245000b"
> > +#define THEAD_clean_A0 ".long 0x0255000b"
> >  #define THEAD_flush_A0 ".long 0x0275000b"
> >  #define THEAD_SYNC_S   ".long 0x0190000b"

Nice catch ! I experimented with T-Head RVB-ICE board on the up-to-date
upstream kernel, using device tree and some other bits from the vendor
kernel [1]. Without this patch, emmc on this board does not work since
noncoherent dma sync operations use incorrect 'clean' instruction.
Applying this patch fixes emmc operations, so

Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

[1] https://github.com/T-head-Semi/linux/tree/linux-5.10.4

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
