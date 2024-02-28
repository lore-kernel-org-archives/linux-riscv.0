Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4FDC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0ipq2qK+y7tAVcsNAcgeNNEJZDLBrPOQseBxNTd32Q=; b=gTWCLxC+PcHL/o
	o6XtxYjYbIwEnK2F3TXGWN07TemXzCPBanlUC4j8ICWvxZIg5f0HzyC/11IXId0oKGcrzjA1kr8mK
	PoDeqn28vRf5u4owo3b/d7kV0sbkLF4szOaIyy1fsIGWnaFkT3uJ3mXWTk/AGfLTc+INK3H4VO3ZP
	2QqefjvLQWLeelPWt7gLdPuYV7VDrBJovxYzopDArz5cuQA58ekmoBdPvwhWGxI866txYh/tdIggd
	zRz2MLqPl6ZVo1JiLo7Y8zrOAPeHvzaZ0nShWxCSAXVCR/iGgUFMmzHBLeZp8+cYbZDQaFEP/9xGQ
	Sf83q4HgVYEoFMxwnSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJbV-00000009NaA-0H95;
	Wed, 28 Feb 2024 13:04:09 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJbP-00000009NVD-0EzA
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:04:04 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso5713051276.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709125441; x=1709730241; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4xrPKeqtgEGV9Q4IBEmk+WaDilZyeoAcRRC9Axa6hc=;
        b=YZ04bZGWCQzhDBiflYNLfbuQLsh6l5MDKYTxhtaCbFg9qOPLN4mHQZ75NwSV+zUpCK
         RglxpCJRrTGN9cmEXD4tTb5bYSOqqPpK/83sYN43h1cVI6KddeBMK+uZ+SqpXnwn8kPY
         gvuWTTxHsEgw5V5/UIRZEZGTf/6W92SgDhe875l9hatMjINIMnNyZMkNwQ5pUP1Ltj7E
         Eyyxf3qwkrtN3/qLCwDuNzBDm1rmvAFTFrHFKYPLaok583QGR83L8sOEOUDkYMNNGzZG
         6TjhJGBcN8Q0jatoFeffvgHpNN+3bdrlX0V1ah1FWX7LJzVe3YpCnlB8SIneaRXclY8/
         Y+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125441; x=1709730241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4xrPKeqtgEGV9Q4IBEmk+WaDilZyeoAcRRC9Axa6hc=;
        b=VLcZoS+ApQOAVpb/SydessBCYao2NbnQoVYEit145F6PMX5TW89Ql6x1p+Kot1yc+A
         MNaX+M93VV80ya6NF8bT1WhD7wCee3JhAT/Aa7p9mpIWEW2UKZ2PcWVaKZp8HteK2RaI
         +kLe3RJSw5LsBSQaP36c68Q9vmoggq7EI+YIinEF7LouR01Ju8AvQSpOhjTef7QzPvzm
         uf8nmwErV5xX3m0AO/49+RunD5br16LsvKEZoYdj7MXxxHk3KbUrnAm5LTzGGWK2GagG
         /4nzDmighgUCQU+X+y8yT0y70SyFXqcMIvgTXpkRnkKRmnkoC34ZVXTtppwXSa2GTXJy
         6nXg==
X-Forwarded-Encrypted: i=1; AJvYcCVVXIjemePpIZOvrA8MzKN7NaGSRzoiKVvxO5PfZpvH9Fla6ZyqI1r6vn2yw0TTg/0YZm26WyQHgZ+7G2BMPXOTt0RUAd+gNkwaucTNMyNq
X-Gm-Message-State: AOJu0YwT7Yaey5QaPu6rfm3pSrUxZqiOP2PDQvNf2bfRFHNOXvlio9kL
	AnKZvZmlNM4/L/T69t5lPsdh5uX/uMs8QFL7RKJuRCKFw5GSaT4Zx9vzfjiwBYLJQzEA49QA+A6
	PvhmOUcGgkHBgEpqShTMJ30CQYUxoaMcnFAAMkx7Y+q102Mwr
X-Google-Smtp-Source: AGHT+IGfbfWQ26vfcOGPm96x3PWRIKRsRzOqFj+BnyrgrRljfJCRT/1aUOwJAvx2MvOjZjDrvH/UChy9Nm4zE+AZOHU=
X-Received: by 2002:a25:9c02:0:b0:dcc:2f94:591a with SMTP id
 c2-20020a259c02000000b00dcc2f94591amr1934963ybo.12.1709125441193; Wed, 28 Feb
 2024 05:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20240217144202.3808-1-jszhang@kernel.org>
In-Reply-To: <20240217144202.3808-1-jszhang@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Feb 2024 14:03:25 +0100
Message-ID: <CAPDyKFptc2K3PfrzQxzWctnCNbqRZVOmDDLDe9uWLUPp1Q7_Vw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: sdhci-of-dwcmshc: support Sophgo CV1800B and SG2002
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_050403_200371_61F836A7 
X-CRM114-Status: GOOD (  10.06  )
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

On Sat, 17 Feb 2024 at 15:55, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Add support for the mmc controller in the Sophgo CV1800B and SG2002
> with corresponding new compatible strings. Implement custom sdhci_ops.
> Currently, only sd card and no-1-8-v is implemented and tested, I will
> try to find a board with emmc and sd/sdio sdr104 support.
>
>
> Jisheng Zhang (2):
>   dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo CV1800B and SG2002
>     support
>   mmc: sdhci-of-dwcmshc: Add support for Sophgo CV1800B and SG2002
>
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  2 +
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 66 +++++++++++++++++++
>  2 files changed, 68 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
