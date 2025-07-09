Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E3C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFlHvaQ1dO7fdysnmkwKboOXDwZY6ycfdeNtf2EwOJg=; b=LT7yEhqB9sqtUv
	aups9N62VBLc1cXtabI1Rk/AAqx6ZAakf/yfWyu5UoQvGvxGyvEhyXBtm1N+Dw5VyiEzSIJ4QtnAO
	z7zDYWNlNIWHB43Uz6kc2GawM5BfERWLB3gvP/oR9vjE1KoqecXLVSdSdGbtmb8VL98ercIaVrOJc
	/DXGNfGT7V0AOYigGo4QwRbCbXFlGcDs9HasNsdkUL5L/JNXCyHg7XHwWdcNCeY+yoa1ZMcXtBupT
	ZFnjcLpIV0UIFgnz8FatpLRUU83lHviKysPbNU216mVFxHreVz6gNDjzI6b6UDmkZBkqrTby5aLzY
	Ayy3yaqhTp6swWN/3NCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZShY-00000008Rvi-0a97;
	Wed, 09 Jul 2025 11:11:00 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR7Z-000000088j3-3JVT
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 09:29:47 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-884f22f9c90so1521185241.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 02:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053382; x=1752658182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaYo87+BQlxJo8nXT672UZ6lIq0mJ1Uoyr7Ysb9T/Bc=;
        b=fCdBWnnla49vE98y8SL8cOnt0kfOdDrm4IJpeP6QlFWi4hTleaxZXVaMItA6vyBZh8
         +IxDwpkc2rWAQpJj5oEbjjPjUQ1CCpeIsStqjXD/ivvsg0knz4UfDqLS3xZXOhfkU5GR
         xwWw+bD591cACwkhOni7puqEZCCzMvSRxjDkgQM1OH1jMfulqaoAbCNzqJ9uYVFp3hNM
         6jk9Ajn6LWuXXWlvg0G6rZMZE3U7uxn1pQoiF0nJ9GluStXmfZTzzvpkKlEPXhmgBc3L
         KNmQz62ahkKV4hsbvreqTfggA/+UA31UjhPVsW6EDfzIj+HcePLBZ7yReivHOLbYIwWE
         M/QA==
X-Forwarded-Encrypted: i=1; AJvYcCVT4KfT4vA8LMXMXSX3lHQqq87ZX6LbLA9Opz+RqKjK8jWYAoleRriDT3fNYQhcmfsutuJziiYvu9bRqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmDDl9A2bKxTuP0QZe54FsBTPSh1iEK3Qoqkm0Php+3YBZ/0r4
	XcakLIWiMH+EWDM2cqVwlbUjpJQl5Z9uFAGc9ysq3d/xs8LygoXiwPcBVCFyEfmd
X-Gm-Gg: ASbGncvWaRbB0z/yLDlfrIy8PxSZKESo71my7eNXNVzpigceVGyBBQ32NMDSV9+/bgA
	iaGrKXPzMwLn1kVUtMKQD+rrnnwrtYwJG96g3lifnXFnr+1gxWT7iQpJBt/eCowO0+bSY3vs0hH
	SGhGcLXHhDH3V6Jaz7C+S7+rY4HDe1IilF8+kP3+uHO08c2eNgZjU7kp652mAFuqvlNXw/9J35E
	TEm/dUJk/P0za2F8d6YHDMtNDU3MCugpRd0t1H3HJq0xu1jDCpCG9H4Ai3Q/8f5mq6xoFFYlL7N
	GmLjfXmCQZPMfEFkC1HiUyj+D6pPEmJqL79GjAs3+ZIQfZAfdn0+q7d4b5mXKoIJKDSUbJnPaEA
	8CM3xC/gYu+t0MSXc9lEZC7jV
X-Google-Smtp-Source: AGHT+IHEuO0tOQj4cYTsCmh/rqi/RoCxx42ow/PaXvPt23KlxsVAnLu6Xo2h0dDmM4pB8Tp36rX7cw==
X-Received: by 2002:a05:6102:40cb:10b0:4e6:d995:94f9 with SMTP id ada2fe7eead31-4f54a9a273dmr544052137.12.1752053382302;
        Wed, 09 Jul 2025 02:29:42 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e93be111sm2227568241.25.2025.07.09.02.29.38
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 02:29:39 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so1679497241.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 02:29:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtcu4x/8jMYyYCzjrbwtjHC7bPyG92cJpCn/vuOvnTtsESBFlWZ0UPM35QWlgyeoTi+dIKNQ5Vl2S4+w==@lists.infradead.org
X-Received: by 2002:a05:6102:5091:b0:4e9:d847:edb8 with SMTP id
 ada2fe7eead31-4f541524375mr852293137.7.1752053378478; Wed, 09 Jul 2025
 02:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <0886d3eb81bffbc1d48e701cae21c42cad29fefe.1751988704.git.geert+renesas@glider.be>
 <20250708-jubilant-abruptly-8ff77f7986ca@spud>
In-Reply-To: <20250708-jubilant-abruptly-8ff77f7986ca@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Jul 2025 11:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwbHoEbjC2y4kpJuhx7CYsRxO9Y+eCUhJkKogk=zDs8w@mail.gmail.com>
X-Gm-Features: Ac12FXyZ7GDlpV2Gr-dl8LZKLuryF3iTrUZA8bGhHzGqftY4PGwLQkXHpr-fgIY
Message-ID: <CAMuHMdVwbHoEbjC2y4kpJuhx7CYsRxO9Y+eCUhJkKogk=zDs8w@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Walker Chen <walker.chen@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_022945_828965_EEA0E976 
X-CRM114-Status: GOOD (  23.95  )
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

On Tue, 8 Jul 2025 at 18:49, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Tue, 08 Jul 2025 17:36:48 +0200, Geert Uytterhoeven wrote:
> > The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enabled
> > in the RISC-V defconfig.  Just remove it, as it is no longer needed.
>
> As I mentioned to Palmer a few mins ago, I'll grab this along with a
> couple other soc-related defconfig patches I have. (Apologies if this
> goes out twice, I got a warning last time about a timeout, so ending again)
>
> [1/1] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
>       https://git.kernel.org/conor/c/493e9b085299

Sorry, I forgot to mention that the commit my patch fixes is only in
the sound tree.  One other patch in the original series did include a
defconfig update for a  MIPS platform, so it may be more appropriate
for Mark to include it. Or just wait for v6.17 ;-)

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
