Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DBEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhRk/lIqmI/68zec3Q+wtR6TH1oWkHstaG+u+MC+grY=; b=pOVUFjeRsIDtNi
	H+0oztmHjJn9RLVHV42Emc+a5kNEsKoSgMJvjKCzpSzH9ERRoOklIZIJbw6+y0+uutE1ia/Jc7Anx
	OLemklCb1GK2X2Okt84GErxWdBg7r8ZhXUDzbo3zaC85PXtvbhiHGIStpRKKv4uWI/AOqE5sONGAn
	jscDIXwIyeR6KB6zs7/zO6eKalSF+m+iUOdK3GkFPWZFvPoo89p6KEPbERHHqfRdzeLbHO0xwz1s6
	Ef/HmMUOLI+gjT/rFGtQbBUoEE7caIMz3oKIHp6bxh7VEOK+SZVjkFFo4JsV1OjzKHafWDX1AhVDh
	Mc83C8ep6w3+1Ttc4MzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65LJ-004tG2-F6; Tue, 28 Jun 2022 07:09:01 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65LG-004tF4-Tj
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 07:09:00 +0000
Received: by mail-qv1-f48.google.com with SMTP id o43so18792381qvo.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 00:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lScN3gMa3B+jKKFR5EiTq6EuQY+/4GeckwwsLv10h1E=;
        b=OmtdUm4Z1hmCAdDhy4aHe6Aoc5JwtZhBFs5OiVBZHmJ+jdez43/0Za8UN0wkKRQfGf
         zbaWh9A+1C9aQsifBMtap64GgpaKSFse3heTj0GmapO2e9+4xBwQwEpXKj4zUs8xnI/0
         raqjhODYX1JNr+uF10HjhfRxmsD5Tak3ASrEHZY7txMo1d6S5GnMfv2dqmM/Cd32Ix53
         yLzVP/4nwRu6MbWkyC5BrWAzH+cyrVixszY7VAQP8DWv0gsw7XIKgK+0V/ABAodSQUQs
         U9sOUAMYkdD/C0usshbfOzz7mlYAz6hvotR5rkkLIcwGQSvsWWpCYIMzE0fJpCLTqauN
         feZw==
X-Gm-Message-State: AJIora+IVyoM+548wlfjMyg3vSfEmER37jHCOfDWg36gJDFSZuzlTOaO
	yavMTtFu/FpFL2Jrc7XIL8LD0+a3AAOqWQ==
X-Google-Smtp-Source: AGRyM1vyT42ojXu1TFxqGkvFeAzlbcPip1rBt9mN6ipvh118Trkq0/vtO5FsyejJaQFfgH6Gq8Zm0Q==
X-Received: by 2002:ad4:408d:0:b0:470:46eb:3a1a with SMTP id l13-20020ad4408d000000b0047046eb3a1amr1364557qvp.113.1656400136278;
        Tue, 28 Jun 2022 00:08:56 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id l26-20020ac848da000000b003177969a48fsm8604842qtr.21.2022.06.28.00.08.55
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:08:56 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id p7so19261786ybm.7
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 00:08:55 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17966996ybu.604.1656400124939; Tue, 28
 Jun 2022 00:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie> <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org> <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
In-Reply-To: <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:08:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Message-ID: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-spi <linux-spi@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_000858_994756_A2FF09BD 
X-CRM114-Status: GOOD (  25.91  )
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

On Tue, Jun 28, 2022 at 8:30 AM <Conor.Dooley@microchip.com> wrote:
> On 28/06/2022 00:29, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> >> controller, but according to the documentation & devicetree it has 6
> >> interrupts rather than the standard one. Add a custom compatible that
> >> supports the 6 interrupt configuration which falls back to the standard
> >> binding which is currently the one in use in the devicetree entry.
> >
> > But it works with only 1 interrupt?
>
> Seemingly...

The Linux driver uses the only first interrupt.

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
