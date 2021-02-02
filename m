Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E705C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB0F64F6D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB0F64F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pUlm7rgeP55SFvFxjN6Te86tH9/Qy0+/yEv2wA3lyU0=; b=IHnCAnSzpbiUxconCzffoa+PP
	ByER5aKOlp65Pe5e7XecEalhjAB8VYb2ofxNtuTsAHiOvNA52PorDeR0/JSFtVgY9nlUBtjNvgU8R
	8qrWVwu0CU78nmlLu4xSGgNTWyBB20ueVwlGmo5pW/T/gCUcn3LXCfGgdjD7DdGeveAEvtK4TPvfK
	CUgEVe1ATchcRSJm/AY6PgAijMfEjtwEz4/0rHczJixuh29W76LgtG+zvSHgvo61Rz6BCKIdOOZuu
	Qfl8ki6n1R2XatkyiJHMP1ALgK/83Lx4/Gy4dv8GmE43ibm6HSkWhjQZqhwAeqIqHAivFAnzSxCt5
	0eq8K/zxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zqk-0001Gn-GS; Tue, 02 Feb 2021 17:52:26 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zqh-0001GH-5J
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 17:52:24 +0000
Received: by mail-io1-xd32.google.com with SMTP id p72so22247097iod.12
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOrAsI9ECEqjrlv+6wp2oH4vgydFA4E3CWu3kSvwGsU=;
 b=SdvqO3yzA54cMvkZn4hPoBJNO5CbXtUVneJfkrzmkX6g9piC8e6AyTMmCvIzesAFus
 3G9IUnbbWB7MqS47imMQNzrTYdYa3EI5wfFYcTQaXdaCnr4UAuUfyckXozbuH95sPJFv
 VFpIaXKI07u4wOSlPg4PIo+G7Ms3sGAq5dtIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOrAsI9ECEqjrlv+6wp2oH4vgydFA4E3CWu3kSvwGsU=;
 b=EY4bA7nHPPsbV5UswZsLlVIz7E/tLPz6RDMCkl48bxdsIUjbQ6d9KmgXeInbybxIwV
 YhI6VplO330R24039hlafPXtSkf4uxqoXQivvzzuTqQtKbmqPLNRqKNocT7lrdK4Wxdp
 M6uEypuKIGyt8FKIByDnQnY1mLIIFRBJkh12DMA7rrcXYkssorl6n21/a1De3Xt+RxFA
 pFVxVaygKlxZ1T4YbH4riuRtK/7HlP/cITLs8npOn1F/dbuFsmYOu2ACztaNimh2WfrM
 p2lBHbNqYEUr5Iyu4A6cOjgkIpIhWNJPjXDLksoEq8+SsNJa/WcJAMNPif7p8GNTrdBE
 EW3g==
X-Gm-Message-State: AOAM530/IQDJP2TAxfO22d4Y7Phf5kI6m/DtddQzT/XpNVq/3Rbd+KU3
 Wv7oyGGmXNDZ+83Sf956M5/4I5qAKf3hK5jcH58p
X-Google-Smtp-Source: ABdhPJytO9BOGj16U07hR7rNXcptz2orHWOipnJZfVmYJ+EXZYgWy6DRm9GzFvXClpYmVVkjjgn+386TDSOkeQqeWzY=
X-Received: by 2002:a05:6602:2d0d:: with SMTP id
 c13mr6284271iow.51.1612288340110; 
 Tue, 02 Feb 2021 09:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-6-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-6-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 09:52:08 -0800
Message-ID: <CAOnJCUJh6iFEFR0_S1OrmyHLHCY_mjovg8mdc4gd5Cwk4QWkew@mail.gmail.com>
Subject: Re: [PATCH v14 05/16] dt-bindings: update sifive clint compatible
 string
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_125223_349586_DCEDE074 
X-CRM114-Status: GOOD (  17.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add the "canaan,k210-clint" compatible string to the Sifive clint
> bindings to indicate the use of the "sifive,clint0" IP block in the
> Canaan Kendryte K210 SoC. The description of the compatible string
> property is also updated to reflect this addition.
>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 2a0e9cd9fbcf..1a7d582a208f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,16 +22,23 @@ description:
>
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-clint
> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - const: sifive,fu540-c000-clint
> +          - const: sifive,clint0
> +
> +      - items:
> +          - const: canaan,k210-clint
> +          - const: sifive,clint0
>
>      description:
> -      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
>        Supported compatible strings are -
>        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> -      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> -      CLINT v0 IP block with no chip integration tweaks.
> +      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
> +      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
> +      integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details
>
>    reg:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
