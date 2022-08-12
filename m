Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0704FC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXGL6WSC5JnCDan0bRMYxudPOm4SyeeWZcDz3oMqyoY=; b=4RUlU8iqmdfAkc
	ohKCmBamWkvfE3UeeO39X9u4qRDKuhlc4iQGsNetgOPKJ8+Q4KsUytTvgoXrS9hAi1CY5odshB9Xu
	f98KSgkfCH7g99RO5eI2O607mM4AYufF3p6U6LyyyCTExBSk6LSYmtQ236PyxlZfjQe5yVYOvgyhy
	LFrNVN6m8BFkyB0MHmBCCuNfUYNuVIc91p3MFMjxyrl7yje0bgs9G56ve0tdzsua8ko0mGf3i6uDX
	iZ5/h7weEwIjxXJrpMEYjX2zuhgyXbGVKbksBnc3beggZqx18uwUxKrnXlVBvdmrc+OZJMdVvp5d/
	hSPN3N3fklI35xMBh/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRJ9-003yTb-5i; Fri, 12 Aug 2022 09:50:23 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRJ6-003yQo-JH
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 09:50:21 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id i62so697973yba.5
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Q5LlMwsyUspPj+LtUVoQu26MZFGsOb33CHbaqq1+4jY=;
        b=HLc75iYp79U1+RfhEBEOhwMlcov52UCcyU+25l5nIgSE4ZPcnkp3oEkZQa1i+IqCy3
         reG28bNyQGn7hxdj7H/0fK8bSv1k6AnOmynkI2yzau3lzhdKQW3qTM58UQD00qyUNUCh
         eRApV/QCT8+C50xMZ/WnA9QUkmqnk0PNev9mrqEbnB8/s0Ky59r6NQC9+3bzs72p0rtl
         wauKGWXFx/3Xfw2XRThy4QMjAJA4mdquushkxg3kt/mvmsRbul11EzI9GuUL9Jbm79Di
         310jC6boc8ZKwICI780E0W9rybi02aINiEOR5O8CxYz8fC1YopKdcHy7cLthXX4W2G1R
         QL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Q5LlMwsyUspPj+LtUVoQu26MZFGsOb33CHbaqq1+4jY=;
        b=ef3rqbAdxEWYRowQ0+2MBWXKcLtfckFbB5XNBpweI2qKrAN2OtOd5NP5kKCsDAaELu
         eAxVKhktKKlvlyjNUbcBqAlO4dBxWK8w1Zmjn4AMIP5LS+/mxd0PHzz/WEIz7GYa9RLm
         cnw9v9GBKsVScrGftD/2ifVAPsPY6sldVNNJyl1rTOjfFgPn2pvXzAh9raGk5/dQ/Yrw
         vydB+BcL2+/6wzJasHiePOhgEt3kHIpvkFNfUmQ/QOZo1N97T6yXhObU2BbL6AiVvr/c
         WzYifUHAsQUgeRQW3B9ys8pCy1tHmN5uPjpniaw10n+IiE527IZDxdP2plet4qdb/Z4f
         VYuA==
X-Gm-Message-State: ACgBeo3WfqLHH1tSJOJdCEUIQh8DMoY4NYHiC5U8sDNXh8sSbC+uVsWX
	0EUGVTDO/4VEdRHSNn3nzmSwqisZJFOIRXy9xmE=
X-Google-Smtp-Source: AA6agR5Qds9HYZib7WpLaLPtA8FNj+szouC4DQXZ2jOMC4iomnaw1mEjO7ET2cQ/CJgVkEcs1O6l22bXprmAG+HAMCA=
X-Received: by 2002:a25:2245:0:b0:67b:7758:808b with SMTP id
 i66-20020a252245000000b0067b7758808bmr2793684ybi.279.1660297816681; Fri, 12
 Aug 2022 02:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org> <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org> <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org> <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org> <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
 <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
In-Reply-To: <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Aug 2022 10:49:49 +0100
Message-ID: <CA+V-a8uK3=Ca_1O_gQOm-5hUB1L95Wh_uXm5fpbAS0cbuVJE2w@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_025020_702922_9181650D 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Krzysztof and Geert,

On Fri, Aug 12, 2022 at 7:23 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/08/2022 18:42, Geert Uytterhoeven wrote:
> > At the DT validation level, I think the proper solution is to
> > merge Documentation/devicetree/bindings/arm/renesas.yaml and
> > Documentation/devicetree/bindings/riscv/renesas.yaml into a single
> > file under Documentation/devicetree/bindings/soc/renesas/.
> >
> > What do other people think?
>
> I am ok with it.
>
Thanks, I'll move this to the soc folder in v2.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
