Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6BBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/6HXz77xZjW98/E55etnGhUKc1B7Envm9o596g0K3w=; b=ypRn1Tw6ZrvEfI
	k2IJ5KSgNUoUbKfe/KDaHZTSaf+om/mkjk9nU9gb6BxQ9TX9G5K0BD71qQ0cXlQnUqlMKuTjtJpAH
	gAjUjDabIWdlwYURu6PDD5vpdO1kEqowiiRQPj1h6iARILUk2NO+v/wQaBTe4evB9MkNHSnaKvPvO
	qM7Z6RkEUJMvotWtiiC/W3Yk4LWEDB4HNxc3S5/hLQuYwEEYuL0QNmAMHVZRu7Qs69iCKmMB8XxAy
	7ltDDg+NN25XPOn5wGs2hXcxq9ubJk4k2TAjY+YOdlbfITfs6gDywt/3z2p+1wt2HUI6e0wRa4NYM
	IuTwMiuY/hmWKPdT6VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtA7G-00GIBZ-QF; Fri, 03 Dec 2021 15:04:50 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9iM-00GCTa-6d
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 14:39:08 +0000
Received: by mail-ua1-f54.google.com with SMTP id n6so5920688uak.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 06:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQtul6XVsJXpFPVfu70nnM4Df+66ubdDixJV8eC2fn8=;
 b=l+52aI+kPINLBtk3f3V8e3vjrJhczLHDPpknwTEIhNpivgyGg8cd2HYODxkC781ssW
 K2HE5izpgpBE8DdNtzwI4NyMC5M3ZsVwI/OGh+jDaEABIjxbHQ1R7xf/xv633GX1IvFl
 p3eait9MXry2nfL1LCGc2Q0cSKAU8PiG8RQ6X5nvuHu6isxXVEFrSbIgh4+6D6jVqcuV
 zkG2V956wrgZe2G3DOAkbZ5/6Lcy+Ypuahsgf0iUFDbLxS/Yb2uVKc4eduK3iAxQbvXE
 n3lgmcHgv/pbqasyDDV03/kghSGyHXFg11by8eAdKozCUFoYWi7aE1WGuW23o6uSf9q6
 NujA==
X-Gm-Message-State: AOAM531aUF2WM1dp4g1O2YfEK9NxAf+th4Jh7pImOf0CSbKSE8pqlPlh
 KgU6y6zl23f9EgfNltMO29T1k45XcIpAxGR/
X-Google-Smtp-Source: ABdhPJxKQvwe9l+hZrGFvdzumW9DSD/vgonzzLR2fYy6u0Z7T5ghgZibcBhxKDFJp2zSnjvxWK0juA==
X-Received: by 2002:ab0:36d2:: with SMTP id v18mr22933363uau.37.1638542343852; 
 Fri, 03 Dec 2021 06:39:03 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id s16sm473537uag.14.2021.12.03.06.39.03
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 06:39:03 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id az37so5781631uab.13
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 06:39:03 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr20431032vst.5.1638542342811; 
 Fri, 03 Dec 2021 06:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-5-geert@linux-m68k.org>
 <be6a6a8e-0642-80b8-5503-cb4d059ee278@microchip.com>
In-Reply-To: <be6a6a8e-0642-80b8-5503-cb4d059ee278@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Dec 2021 15:38:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXO8A0ZPq6ngjuFmUb-8RJ69pkA2eAtcskham58RsmSpA@mail.gmail.com>
Message-ID: <CAMuHMdXO8A0ZPq6ngjuFmUb-8RJ69pkA2eAtcskham58RsmSpA@mail.gmail.com>
Subject: Re: [PATCH 4/9] riscv: dts: microchip: Group tuples in interrupt
 properties
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Lewis Hanly <Lewis.Hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_063906_304722_20C3E7DF 
X-CRM114-Status: GOOD (  19.92  )
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

Hi Conor,

On Fri, Nov 26, 2021 at 9:42 AM <Conor.Dooley@microchip.com> wrote:
> On 25/11/2021 15:31, Geert Uytterhoeven wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > To improve human readability and enable automatic validation, the tuples
> > in the various properties containing interrupt specifiers should be
> > grouped.
> >
> > Fix this by grouping the tuples of "interrupts" and
> > "interrupts-extended" properties using angle brackets.

> I notice most of the icicle kit patches in this series were feedback
> items from you on my series. I am assuming your intent is that I drop

Yeah, when I commented on your series, I already had made most of
these changes to my tree, but they were in an unfinished state.

> those from my V2 (which should've been here by now but other things got
> in the way) and base on this?

That may indeed be the easiest solution: fix existing issues first, then
enable more features.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
