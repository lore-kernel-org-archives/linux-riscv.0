Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB49C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ez+3+x6LTjG3A+Qk7UjOZM9NTj6eFn/2KFa1hanbnc=; b=UxX+u5MI0Gol9U
	cIwcElRtpav5h9OlFne3HYCwt7I6/9HUQnzCabrGbEGiTxUjPCfAiUsTtM0z4cGM9Y7y1jK59GR13
	fkxne/KpKhI0C5Defksd3hlRL/NAqkO5IwteJRLv1gLd+i1KjegasVj2b0zH5n2Y1sVfVEmjTrl/9
	VlEf0BrvzVZurteEZWaUq0qsW1e1r7J15ano2EkHhC6PGSclTyhELUQFbprr4+9CyH1p5uhzWXPM9
	OvYwimgCNCTV9t/xh9ZgTGKUjItMwtKGAODO+YqSxJTjAqfrTYkMbsAypVDbSrXX9/FcJr0Ype64Z
	Hc5WpK1kId+tk/76ia1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrE1-005ytR-L8; Thu, 16 Dec 2021 13:55:13 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr6t-005vob-Rr
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:47:54 +0000
Received: by mail-vk1-f172.google.com with SMTP id s20so1182431vkm.1
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4uF+gM1G86VM+Kpj4DovgZM1B/9K1RNtYVUSewjskIc=;
 b=xoqI0/fFrOIBcUMkF6O6azks2/XsEJuB3Dzuk2pR5jZqYt6zqqolatDWFCnwvk9z7G
 wkI9rU3QEG2IZAyODSXS3KhIv9gEol7flO1oszrABK7m+I336nM2rUDO3VE6s8NjViY4
 afV1WgSi0OmyfnjNC2LInFMpMhSK5bismKlO4AOChkErjoc+OwOBfFOsWfHLFP05syId
 ERXytV+60CnuSLi6Z71g/evuJ4pWj6kPCPNHKjahdGEzVYMFZjMLsdMIBh1buCq3bgE1
 HptuwSBsoO17VDWY1ULSEfhnMYTVHXV9aJG2/mKLJGG/fZUM0Duch79mmbPHIhP9R2p9
 NiHA==
X-Gm-Message-State: AOAM532fuddsGCexUhldRGDdYGYdJw79FCJkToKKxTPtTLU4lmVwoLct
 rP+kGQfEPYF8Wx2G3h+UOb9Ropan93aRNQ==
X-Google-Smtp-Source: ABdhPJzWokRjUhsdlupgULTjXQsCwSmpkzUCOozW2OAnIL3IhG3N6MTWWWLAiEtnckZo8MZMjRgEzA==
X-Received: by 2002:ac5:cc63:: with SMTP id w3mr6412981vkm.41.1639662470021;
 Thu, 16 Dec 2021 05:47:50 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id 90sm75615uaq.14.2021.12.16.05.47.48
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:47:49 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id o1so47218690uap.4
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:47:48 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr5543879vst.5.1639662468579; 
 Thu, 16 Dec 2021 05:47:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639662093.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:47:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVL=dSku5MU5PjRz4owdb5ZOiWb3rymZxZ_TLVNhSwLkg@mail.gmail.com>
Message-ID: <CAMuHMdVL=dSku5MU5PjRz4owdb5ZOiWb3rymZxZ_TLVNhSwLkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>, 
 Biju Das <biju.das@bp.renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054751_944228_F08CFC7A 
X-CRM114-Status: GOOD (  19.66  )
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

On Thu, Dec 16, 2021 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G2L SoC embeds Mali-G31 bifrost GPU.
> This patch series aims to add support for the same

Oops, please ignore this email. Sorry for the noise.

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
