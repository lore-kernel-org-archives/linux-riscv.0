Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXi8GL/6JVmD5SoaQ7x7l8pgVQDcisMDUtDbOUQGsW8=; b=wMtm2Dz4RiXw/7
	w0MRAq6ftAs/iadClgpTnvXzy5OIQCivX0Pu9RTHhckoaSp2ur3Xz0dV98uGRsuXITvyyCfKJWBeb
	q9rAWhXrRjaROv8pwX4ds43hSyEX6mvXFWzcgue+ZfS8uL7g3EJK4szAg9+IyPV9e44h3UxIIHxPm
	SJS1PP9VOGKQIVDaSiqBz4UIXcXjwW36/Wn9LVUsxjh8jfGg0mlEeH+TrxQJU6Snxqk3lhme8B/9/
	BLecOQPM/fx9DpHtSIBhNj9U+2F90LG8jg6mW3+fe9QTDrxcXCdRU5I5r470FDwHPPo2XcjgAz7U4
	n2zS0JXgv1jUJQ7wfi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zUp-0077By-QM; Wed, 06 Jul 2022 07:30:51 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zUm-00779v-AX
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:30:49 +0000
Received: by mail-qk1-f182.google.com with SMTP id b125so10432543qkg.11
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7jdNwqUxVmvsNaO4xkKTr+IxISvnOUVGzWu8CWMy8I=;
        b=W4LPt1gcz37g3BXB1v3PksQJIwJAM/SJfOMRcA5xDAYrlhSqlilP7cm7+NUSoD7CN0
         I3sWvgYEhro061fNPHGfcrohpF3rSIxKBYoYMsYJG62NBEh5A3z10dhT6TXnHV2tWw+E
         U2gNxsDUfWen/HXbE1mJYAH7aemymeb84V0WTR2jTNuGsXlnoZPbG6+it9NT3y41m9hi
         iavp8r2ggo44wgFHEKEdgaGVKJT994vZl0xZNqsded8Vi3at6VuK5Z0gcqVC39m844yj
         KzC5B35EBMX/9EHlC6qiEn6ZdF+vyLX5d7HXYFJ5CyuvswrsWcaJomIzD5Y+1kpFnoPs
         Jslg==
X-Gm-Message-State: AJIora8LBI95QNA3KJHJ79xGNDQzowF55fGu58yrjqsJZS8//0AzmCYT
	s3rmgA9+pzIW6chbuVr7DpIv753Tlk356Q==
X-Google-Smtp-Source: AGRyM1suvXZdR9eM8BgI5GTXyMjwWPIj1u9Zcy/6lfh81FaFguGO29GxiDI80Yh9rVQbxW+y0Vf2TA==
X-Received: by 2002:a05:620a:4081:b0:6af:31c6:c1d3 with SMTP id f1-20020a05620a408100b006af31c6c1d3mr27195531qko.733.1657092645297;
        Wed, 06 Jul 2022 00:30:45 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bz19-20020a05622a1e9300b0031bba2e05aesm17545442qtb.58.2022.07.06.00.30.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:30:44 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31c89111f23so81069507b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:30:43 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr12871303ywg.383.1657092643442; Wed, 06
 Jul 2022 00:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com> <20220705210143.315151-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20220705210143.315151-2-emil.renner.berthing@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 09:30:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3q4W+azwo5sAUHfsL7Se9vGftHxRdmu1c5-j5fPrwow@mail.gmail.com>
Message-ID: <CAMuHMdU3q4W+azwo5sAUHfsL7Se9vGftHxRdmu1c5-j5fPrwow@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Vincent Pelletier <plr.vincent@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Ron Economos <w6rz@comcast.net>, 
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Stephen L Arnold <nerdboy@gentoo.org>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Mark Kettenis <kettenis@openbsd.org>, 
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, David Abdurachmanov <davidlt@rivosinc.com>, 
	linux-leds <linux-leds@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_003048_401206_DCB57A6A 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue, Jul 5, 2022 at 11:01 PM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
> When requesting a PWM it might return -EPROBE_DEFER if it hasn't probed
> yet. This is not an error, so just propagate the -EPROBE_DEFER without
> logging anything. There is already dev_err_probe for exactly this
> situation.
>
> Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
