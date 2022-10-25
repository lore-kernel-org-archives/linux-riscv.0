Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6CFC38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rmoVYsgXuMoOEoPX5sbP/gvNqjvgosT4fbUh6VdreI=; b=rQtzFEqPQPoPd9
	TXm+UXbeLBR2CAUV5hc6aTtCT8s+FWeG5OiBmq3M/FDU8a+pu7i4ULmredc+Ivb/T8Kutzl5uBlP6
	pW7LBJYHxtLDs8cZFGjFwWBDMEKLEc+N1oOWPb66Uc+HSuTiPm2LlqiU2LbGZbrSTtmxJic0JQAIT
	huLnuTGZv1aOY28kDgYvNb3+YiRxT5b7TRVtmwzRaAhmqjkYWRBT/Mgf0Ks0dYYfvgXX2I52CEQg4
	M4FpbeCPbnL1QyCV9Ggz5y/zTs4RtN2sd8bRykk+xSnsslWDgrlzqI/RJUIw7Z3VCtQYHjD0yB7v0
	oNwZxtObrbaB8w7n4EGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMaj-006G9O-Cg; Tue, 25 Oct 2022 16:15:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMaQ-006G33-Sb; Tue, 25 Oct 2022 16:15:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id y14so13830525ejd.9;
        Tue, 25 Oct 2022 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6UbVAonXzXEF4tPDCKPCg7WA+lFJIW3l1l+LGaIaaE=;
        b=RjpvOL7MSyyleyOkn8duD/qRqvUDoc6ReK96YgdY5m0G5KbDzB58n9ZiozO5uLkYzl
         WGKrhs3fXBqlLFh2WalirQ+LuFXGXrw0T65oKEfXNv6vKU6fdrvf5mkPLCnqYg4GG9AD
         zl3lgzL9PGDRBLuN1Dz3NdxNQIuTw1Zdb4eAtSKWLAcAUqVenhNFXJkDG3Td3vkrZqkI
         +ZUIotgvcfu2D+YHA7WPGU+B7km+CGQsyfDuY5jkALCn7i7b67de2tO4HitSy7IBPvIX
         YpEu8r8wj5RIoAkggInn9ZfemMGg677A4W2Dypf5py66SRM96J7/lypK2wDBhB9YQCyl
         lMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6UbVAonXzXEF4tPDCKPCg7WA+lFJIW3l1l+LGaIaaE=;
        b=tBpFbjnGnWgdemy7NhO/SHrV643/HiTZt9XI1Ogj2zvmJfJpXkcPVzpspIKGvQyqiJ
         p4BHsu0bEpR0pqAwJEI/ZkyvEHj6OqyqFx4B7pq6t1T3pPo/+qRDu6aJAjWYLn5waRIH
         tPE5ctD0THI3QRB8prC85Ordn8qcxE8ABya8tjDAWqIUL1bOI6gJiumb5/3KdkIxThsj
         yR0WajcxfyaRiYxn50bWDb4IMK9BnfG9JuVzHSnuIAx7oL/chB/DbCovxyjlDRwRxGap
         u+oZAvP1JFvgt6BfbkaktL7lI1ChP44e1Xq4H+zhf45yPTMeajqjKW2YeXxp/d3FS10t
         mGYQ==
X-Gm-Message-State: ACrzQf0h4EmKfuOUPHuqHBZtuhKXlG/JUSKSziRCbVUpLZDmwJtsKXVp
	qncyRGyFazOAiSzEA+REEOMSg2gZHu8iDtCFQts=
X-Google-Smtp-Source: AMsMyM6vy+HKe105A0nfDnGKP7UgYHtFcSSQKGQ0dQB7bPXBOvkwm8XyyCyR6qhyWVIACh56BdQUdBIdPqCHtiZCRtc=
X-Received: by 2002:a17:906:5a4b:b0:78d:4e5a:d101 with SMTP id
 my11-20020a1709065a4b00b0078d4e5ad101mr32495249ejc.196.1666714528655; Tue, 25
 Oct 2022 09:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:15:02 +0100
Message-ID: <CA+V-a8vGW9Vngo+Rs2=v=c6Q-iCxqh9DR=TT2i1K1-cRTza25A@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_091530_949073_FDD17BBE 
X-CRM114-Status: GOOD (  23.44  )
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

Hi Geert.

Thank you for the review.

On Tue, Oct 25, 2022 at 1:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> (now replying to the latest version)
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> > so that this can be shared with the RZ/Five SoC.
> >
> > Implementation is based on the discussion [0] where I have used option#2.
> >
> > The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> > identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> > created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> > (r9a07g043F.dtsi)
>
> Thanks for your series!
>
> > Sending this as an RFC to get some feedback.
> >
> > r9a07g043f.dtsi will look something like below:
> >
> > #include <dt-bindings/interrupt-controller/irq.h>
> >
> > #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> > #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na
>
> Originally, when I assumed incorrectly that dtc does not support
> arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
> ("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
> although the second parameter now has a completely different meaning ;-)
>
> However, as the NCEPLIC does support interrupt flags, unlike the SiFive
> PLIC, there is no need to have the flags parameter in the macro.
>
> Moreover,  it looks like the SOC_PERIPHERAL_IRQ_NUMBER()
> intermediate is not needed, so you can just write:
>
>     #define SOC_PERIPHERAL_IRQ(nr)  (nr + 32)
>
Agreed, I'll change it as per your suggestion and send a v2.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
