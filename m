Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6F1C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTb+q1dSp0uQO0CdN7crLkA1UtfpMvSt31TtOFM/uGo=; b=lqaBq1h9D73ENh
	GfCb4+9WNDWn1G7+OFjccTMSCl0IwcZ2HhG1ZCXfkaw6q39DN4JU7dLHFxNkmnZu2zWRxj64X3nol
	9+lm9m+eKFezOwM/hg5+CSmBxpguRttkIoDBJLsvggTFjS0Iq0iVnSs0Os36r0KPSeBcB9OhU4qJv
	vtLKypqUIokCzzYyHCrITmbQJ1bW4mDbcaNImqRnDYG7ZiLtUFRC2c0WOPD8NCpeP407ipEGWOLT/
	y0B3VEqf+4HUS4IgPoEZ7pyV6KFhFng5He/uTfVMYtZ9KJrUx9FTprLzSdXeIPatI5qr8EcMOeP9q
	VMwtFz7K93Aq4121KDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbyp-00ArCG-8E; Wed, 27 Jul 2022 08:01:19 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbym-00Ar7K-5v
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:01:17 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id r3so29031376ybr.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4DAUtMqWwVudJqi/niJOWb+6cSIXvBRzWlx03pK1Nc=;
        b=UE9j56sjpWAsYKOcxBMjUI2ak6h/MS5YtqYJaKzcqWKbuuqSfa+F3h8Vu5AdcTPsC3
         Sd9HGogbOgcFhU/EngE77Yk77wswd7O1Ml4szPquZR7tJAqQdFKdoGBq0iwxKU/fZgII
         NL1Dgpp8/t2Nkvdqyg0cfv/AfZuLNaB8m0kH4DM0E9t26sRsMKdPZII2imgB1jnpm61i
         TzYCQ7DWuVjbH/SC99Sc9W8s8TwR6zbvJyKlHw6MjoC9mW4UeCFC7XN6MEsQcmnrgDga
         gtXiAy3w1WXrtxtI015STtvB806cc5zGnVxMzt5tp7mtAcKn2J1O7TOjv5WlhxJjKvKz
         pUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4DAUtMqWwVudJqi/niJOWb+6cSIXvBRzWlx03pK1Nc=;
        b=zKC2gdnnmQYaWLMiPsAHaHIanZLdUWrYADx+5PFj4XQZI95/zQtySCMxq/z2AbaIMq
         IeJmBaUi+m25BuqqF76zWRZlix8lF2+HayhPyCMSH1wVw2JPR04sMxdA7iAhuJ59A4R7
         bO5N+0vTg9wJMnz8hmQWb4vgZgIOXJP37b3WsiI9Ayew5ewse6BrGto/mXVU1Qd74AMa
         SDhRe9RzOWC8T8s8l0HSZXTEoIifSAmtkYG1PSqRHvBMsWAsE/kPa3sPc3dBE9oFVlDu
         BiVhBuMEtGdTEkRcgmL4QJ71kIjH8/hMZcA45FnR7Oc/kWbUD4QxACbeP4Ex4g9wSNZr
         CVhA==
X-Gm-Message-State: AJIora8yDgQxqIThBCWzgCjYKsX1DxX0MHA4YhITvwQ2DBcDvgcuJ4Ds
	s4A6Pn0V4e6LbIs+ZY0QfC1Jlgd+NzWzTsNdJm4=
X-Google-Smtp-Source: AGRyM1vn+8Q6+I5xh7dntobwuywvhGo1l2I75PEVKouLyIip06Ow1NQMkw5NmUO6c3AaYmH8P2N2SYLMHai6GYktd/Q=
X-Received: by 2002:a25:9e92:0:b0:66e:c03e:c632 with SMTP id
 p18-20020a259e92000000b0066ec03ec632mr16366501ybq.279.1658908872552; Wed, 27
 Jul 2022 01:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <e05b7ef1-64ae-4c12-7664-c70c7a35f76d@microchip.com>
In-Reply-To: <e05b7ef1-64ae-4c12-7664-c70c7a35f76d@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 09:00:45 +0100
Message-ID: <CA+V-a8tkDSKtJZZt8U4ZXZ8dd2jA4o=pAmwXuvLXV9KvSCUeUg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add support for Renesas RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	anup@brainfault.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_010116_278090_22EC7BE4 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 26, 2022 at 7:51 PM <Conor.Dooley@microchip.com> wrote:
>
> On 26/07/2022 19:06, Lad Prabhakar wrote:
> > Useful links:
> > -------------
> > [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/
> > rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-
> > andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> >
> > [1] http://www.andestech.com/en/products-solutions/andescore-processors/
> > riscv-ax45mp/
> >
> > Patch series depends on:
> > -----------------------
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> > 20220722141506.20171-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/
> > cover/20220630100241.35233-1-samuel@sholland.org/
> >
> > [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> > 20220726174525.620-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > [3] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> > 20220726174929.950-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > [4] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> > 20220726175315.1147-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> FYI, your mail client or w/e wrapped these links and none of
> them work properly :(
>
Sorry I had wrapped them around.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220722141506.20171-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220630100241.35233-1-samuel@sholland.org/

[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220726174525.620-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[3] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220726174929.950-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[4] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220726175315.1147-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
