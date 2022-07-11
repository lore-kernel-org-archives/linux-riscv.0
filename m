Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1579FC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzzlWjzOl/qxkQDmJWTlckfBY2yiEFW5QBY4W468jzI=; b=N7ZovqbwKB5RRA
	DPa0mLo67ya9Hc/5zwiGoY35afr0f/Tu87ktF6dYS0EORtIY1uT/Z6gNSNQzmJW/ob6egEQXwaTVz
	HlxqLIXAsC/bj6FeAgGrj6X79OYZNtbDVO0uISIkAWZSOkUtIXGBODK78578zlOpe5n+VxkNzlTuk
	7uy0xnpc8pHxWUBWwDRvxH1DhsQ9cfM2l6aGJkQn1wrB19cFKE6iucpcIgEx5It1C+O4KFfDq3BNY
	K46SKYhMAoNJ9xoFD6QmEuRYh4ttmS6XK+0E95MdD15ZtpZIMCCPuUBtm4YQsNqAwcocEXJv3KqVr
	J3YC9IUi+apYYjYZrPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAp5o-00HKSw-PZ; Mon, 11 Jul 2022 08:48:36 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAp5J-00HKBd-AG
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 08:48:07 +0000
Received: by mail-pf1-f177.google.com with SMTP id 70so4232089pfx.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 01:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sArXXQj5yN5trfkMj+2zTcmQ9d7fsodbPTFMtpx4Fqo=;
        b=huaEZRevxRySVkywXdb6MDx4OUKmDACi7DemFC1NRbrOZktFBfH4aWzxgCcZt0+oEI
         zX2DhM0FIyY41C7txWmLkMZH1HQE5tdZgsnlEl6VW3AnlTZetAF17LhBCa1CpSZI0sXl
         sv0IJ+6hROC7qvnvucP3X84E8FhIy3gGki6QvHnKMQ6oZWX1t2uZ4oz7I34PU1cdAwL/
         h7JPzmxbqogtuUPVOrWR+wMoNazGMaL2zXdgIr1c6b1IpvRxbwTAirT6Ii845ElZrtNr
         lzxXoa46ze0Z6iByROfqTBXkX6tGUPv6bLBLYMa9xwF8ktBRNX8QPjOBLerVVIoUrzjN
         01ww==
X-Gm-Message-State: AJIora+lTDe3Fx/uKVcb/s3JXPnlej/CXeX2MyRTQZkT3JI0zk9q3yWA
	bdUmCT9LNLJss/CXkX1JUUSeN9zbv5hMaPwDrmGahnpTGDk=
X-Google-Smtp-Source: AGRyM1tTOkjVtGUH9tdNwvjE+j5fM7I1AwjbSHeBbgiMkXKFjNhkVs3xYJQGOpIJRPT+6JWwGobvrzMnd3NjKeY5JwI=
X-Received: by 2002:a63:1c6:0:b0:412:a989:34f4 with SMTP id
 189-20020a6301c6000000b00412a98934f4mr15578426pgb.72.1657529282742; Mon, 11
 Jul 2022 01:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220710111330.3920699-1-mail@conchuod.ie>
In-Reply-To: <20220710111330.3920699-1-mail@conchuod.ie>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 11 Jul 2022 10:47:51 +0200
Message-ID: <CANBLGcwTeOHkFMTCG+hnV4xojeAr5x_gr0ABXHq2S39ZcUzE+A@mail.gmail.com>
Subject: Re: [RFC 0/2] JH7100 Monitor Core
To: Conor Dooley <mail@conchuod.ie>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_014805_378347_10E14FCF 
X-CRM114-Status: GOOD (  15.21  )
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

On Sun, 10 Jul 2022 at 13:13, Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey Emil,
>
> Had a go at adding that E24, made it an RFC b/c I am not sure if I got
> the cache setup anywhere close to correct. I had a look in the SiFive
> E24 docs & in [0] which said "16KB I-cache with 32 Byte cache line".
> Didn't have anything else to go on, so I kept the same ratio between
> lines/sets/size as other SiFive monitor cores, but since they're not
> 32 bit I dunno if that's correct (IOW it is a wild guess).
>
> Hopefully you know better than I do..

Hi Conor,

Thanks for the patch! Unfortunately I don't know any more, but I'm
fine with adding this data for now.

/Emil

1: https://sifive.cdn.prismic.io/sifive/dc408861-94ce-4d82-a704-caddec98609d_e24_core_complex_manual_21G3.pdf

> Thanks,
> Conor.
>
> 0: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
>
> Conor Dooley (2):
>   dt-bindings: riscv: document the sifive e24
>   riscv: dts: starfive: add the missing monitor core
>
>  .../devicetree/bindings/riscv/cpus.yaml       |  2 ++
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      | 20 +++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> --
> 2.37.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
