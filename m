Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33A0C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/bJWgPt3ee1rnjP9bsmSKX4XnGNy0q9g2XnVV3tO1s=; b=gl6Aq9kYdLiHSu
	5b6DclV2fo3Cpc8jT/jKNph0QTYHH2J7tOnXqZX4zjXpiEZdeAssrCfYVAuzrBSMbEVe91Wb7XMdQ
	DnPVqAUoxfVIV3w8CI5VfLQMWNcgB83/LGtrIdfRmW+J2GLoqu51gS4w0wOkjmt61vPRvLu08JjGK
	/miDhqUpPJmknYVULh2Q+6z+UZlBejnRkc6d8rs/MkSi2mHCguFm/nAJ1slKIKJlKD1usQ7ccI342
	zPl8LkcNZRtrKzMvj63fzt34ylh3vatS43mimmkc5MnJwHG9kzk8KcuMZQqKSMviBcdMIMgSeCwgP
	wy6rbnogtFqoobm9uF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3Ey-004K0Q-Hc; Thu, 10 Nov 2022 08:48:52 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3Ev-004JyY-H1
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 08:48:51 +0000
Received: by mail-pl1-f170.google.com with SMTP id p12so922177plq.4
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 00:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj08uoQ5xO490n/iqA+9r1f6MFaSsf/Keu+IuBN/mxc=;
        b=0d2CNdUo6UYMIPmDHo/qXGu+7Vkz/uRNWHiIR0eR63BPQjjr93Nnp3Ue0vFgsPQfib
         9QW6f88i9cNV1ZL7l6/4S3tw5YVrgt5PsjfG2oNBwXL3RlbdblICEFGXRBxMsq8IEwi4
         tv3NwXxqBHDkJW4QwSBzYK5DR40v+RpPapUKbqNmfh5Nwkw171cO83XXO0WZ9ybViuvR
         nEKUspS6CaoldqwDU3FIyCKSquMIKNE2NZNKTHnDG7zGFLefFGMh58PDZG2W8hIJA/RE
         EP5Zi9ZTeOdvf+Ho9hKdOAgNFxeFD3Hlu8gRYc3hEEgMGGfDLFihxKc+n6ImHgd7ACSR
         Y8QQ==
X-Gm-Message-State: ACrzQf28laMBo+Dpm66swRlpk4F/sk6AVxMfvTDp0skC0ypA76QnepxV
	h0/idqXjtgDjs1yZDkvB1vaxb5fX+ck3WVvDcWg=
X-Google-Smtp-Source: AMsMyM4/rxvFp8pqfGwJZsdJimYqWfkYUSxbisV3VoouRxT16X9f1iy+9n4YEmJzxdp6jMr+BSNbJGOtj09Hk7fZsyc=
X-Received: by 2002:a17:90a:c917:b0:20a:a1a8:3719 with SMTP id
 v23-20020a17090ac91700b0020aa1a83719mr1301526pjt.225.1668070126727; Thu, 10
 Nov 2022 00:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20221109212219.1598355-1-conor@kernel.org> <20221109212219.1598355-4-conor@kernel.org>
In-Reply-To: <20221109212219.1598355-4-conor@kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 10 Nov 2022 09:48:35 +0100
Message-ID: <CANBLGcx6HM=G+PCth8Pg75zuHrQpF5M2HUNdr849ac4ZsbXu0A@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] MAINTAINERS: add an entry for StarFive devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, soc@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_004849_579113_A4CB47FE 
X-CRM114-Status: GOOD (  11.70  )
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

On Wed, 9 Nov 2022 at 22:23, Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Emil looks after the downstream StarFive stuff, and agreed to look after
> the upstream ones too.
>
> CC: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

Acked-by: Emil Renner Berthing <kernel@esmil.dk>

> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a57c90be001f..040d49af9bdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19622,6 +19622,11 @@ M:     Ion Badulescu <ionut@badula.org>
>  S:     Odd Fixes
>  F:     drivers/net/ethernet/adaptec/starfire*
>
> +STARFIVE DEVICETREES
> +M:     Emil Renner Berthing <kernel@esmil.dk>
> +S:     Maintained
> +F:     arch/riscv/boot/dts/starfive/
> +
>  STARFIVE JH7100 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  S:     Maintained
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
