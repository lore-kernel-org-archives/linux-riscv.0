Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F82C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PGaD380ADk3vEtMmV1+Ohv9qR7TJzGB3vdfEwsyg7z0=; b=ovi6CT2Yb7jVMS73Izrr1AUUR1
	yYWVC+/qdl1wqAGCvKDf5bJbD1hfYs28FusuDnqkj6VJ74xLFY6ny3mZFs2W//W6+/xyrliW8hfnc
	bmYMMHA9BI5qfU69lutCLEK57TZXx7I/LgXQe0c9oC5oBZm4gVwfbcnq+veSKGkrIwYAMO91Ql8XA
	SY9Py8njoebBT87u2RdXfIKdTBmNCJseGACRXXBbpLtAwMYLyoJbzyB5YK93TMIy5Rix9G1s6iOdS
	9bOCCJkfDKnJyklJCtlmLViCXOKSEylCBZ6vukQBcXV/bT/O5P37sB+SUy75p4q+3lUbK30fWo4wl
	l9XqQwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEAH3-0000000HL6W-0eZZ;
	Mon, 03 Jun 2024 16:11:05 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEAGz-0000000HL60-18SG
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 16:11:03 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E8CA1412C3
	for <linux-riscv@lists.infradead.org>; Mon,  3 Jun 2024 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1717431055;
	bh=vU5/sQdk1KvDzjQYZ2m7el5n+WnYafJy1tTstO9fsbo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ec1EpI/ZnZaNbFyYaw4OdNLdGqXvgn6mGAIQ1UC4SOr3yCDJptgd9SvQTRbaIP9tj
	 s5WJrzfcHSevqUltFPJMOJd0iNhnYx2/8U9lhvKrxtSRO70wGy+KCmY8IYVzRzmA1R
	 Ce9it4n46vEenC1MbmoAslYw2fJ9JYR7CzoTaDmByZOkw1xg7e4lzRDlIGBQPhO2s/
	 K/WqnohGFITONnOswA+BAtqtjfOr6l0663tkYKTBMuqsAhaEtYL/n0XxZFt79iz+jh
	 ioBUoEAjTrSbA3Uluu5YCkb/hHTGthcq+G7qp0mdQ9gXnl6V3xLfoXrZc6svUv3hq6
	 FsKmjGFoZhXRA==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52b977e1780so22038e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 09:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717431055; x=1718035855;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vU5/sQdk1KvDzjQYZ2m7el5n+WnYafJy1tTstO9fsbo=;
        b=W7v9AxEv0RoaDQy03c1ibIaAXlzI4YCeN6//4fQWoxyGj4IUILDgx5NXS6WD0YxSsK
         FNhx6Ncfa9yWcg7bBKjuOhVNJ9+VaBKxPfJcap7gQtc7O2NTypGh5gAGZvO9IbUZSCwQ
         /08b0o6eZ60RqhQsOcJ7ozipwqwv/ikaVQD62bqgyH7Mok4YSewYAegU3ahNRm+akVTw
         1DIoBvXk3nm/IqIY7zycK7FAGJQHw9Zpr5UEKniWB2PV2dP644HKW1Hg5L8GHQMK+pbG
         PdVucsruVbuTPSbsR4jfSp1o0HMXheCCkB9nvkeIa/Ty8M6fRfLaisyx/IFudBWVwv6y
         ctAg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0W7EfzsYcHqLEhOu3wc+Cg6D9jWHwABxXWdSH8CWXcw6DuxEGuLkxm1gLqOssY5jClKilzZ8jULFNfojpH9IdLEkCvxTCCVQhKFCr5Wp
X-Gm-Message-State: AOJu0YwnDKhiO2s9WFBfMfpVHPkJVheqnhHNDLtARIRwIP1uT1O1vzK9
	1VSqJefJKs1zOi+7OzZRNSwoaau1ZDXFUD3aj5asB/NkX6iAEZMW1eIW3RySbeCGTmXBJ51g4IR
	Za/9UjYV8nRbsj/QhSl9uci7MAta3CP3iVpUkq4Pkmnn5WzT5n1dZiOCtdU2fFkOWRCNXJBcupy
	bbyFMjnh7HGsDs8Fkw3a70U1fP5gubcELfhExuBtVqqVz9x1YnBZ9xnLse
X-Received: by 2002:a19:7604:0:b0:529:b9ad:52b5 with SMTP id 2adb3069b0e04-52b896c1655mr5647288e87.41.1717431055148;
        Mon, 03 Jun 2024 09:10:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX6z4960cX+FBq7s+WxsbEO4lbLdIqqK/67kXSz/Vcjt4Ec0DAtIzwSWZ6eBsX3hWA66D8uBk/mSKdElTxnrs=
X-Received: by 2002:a19:7604:0:b0:529:b9ad:52b5 with SMTP id
 2adb3069b0e04-52b896c1655mr5647266e87.41.1717431054746; Mon, 03 Jun 2024
 09:10:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Jun 2024 16:10:52 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240603150759.9643-1-matthias.bgg@kernel.org>
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Date: Mon, 3 Jun 2024 16:10:52 +0000
Message-ID: <CAJM55Z82+_RL1Z+DCW+_xgE7ZMmiWdPekCt6qtREPXg1jB+68g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: Update flash partition layout
To: matthias.bgg@kernel.org, kernel@esmil.dk, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, duwe@suse.de, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	heinrich.schuchardt@canonical.com, paul.walmsley@sifive.com, 
	linux-riscv@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_091101_588192_F1739BB1 
X-CRM114-Status: GOOD (  12.76  )
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

matthias.bgg@ wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> Up to now, the describe flash partition layout has some gaps.
> Use the whole flash chip by getting rid of the gaps.
>
> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Hi Matthias,

Thanks for the patch.

>
> ---
>
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8ff6ea64f0489..37b4c294ffcc5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -321,16 +321,13 @@ partitions {
>  			#size-cells = <1>;
>
>  			spl@0 {
> -				reg = <0x0 0x80000>;
> +				reg = <0x0 0xf0000>;

..this is definitely fine, but..

>  			};
>  			uboot-env@f0000 {
>  				reg = <0xf0000 0x10000>;
>  			};
>  			uboot@100000 {
> -				reg = <0x100000 0x400000>;
> -			};
> -			reserved-data@600000 {
> -				reg = <0x600000 0xa00000>;
> +				reg = <0x100000 0xf00000>;

Do we know that all of the VF2 1.2A, VF2 1.3B and Milk-V Mars boards have at
least 15kB SPI flash chips? In other words were there a reason this previously
ended at 10kB?

Also it looks like my Mars board and VF2 1.3B both report discovering a
"gd25lq128d" chip of 16kB, so why stop at 15kB?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
