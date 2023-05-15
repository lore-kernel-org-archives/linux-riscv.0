Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850EAC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYrOndvNG2plBuIEYcPMO4fwBWOKXOhFCM5btw8UKfo=; b=Qvs9d9v+1Wk3DW
	7CBoeBRTPjjkOVDAcOfN5heevdx2vJXWFTJUUbDDnLvx0S3QxHkpzNZaSp/MJcJ8pL47IQSk3OS2p
	0rlD5nEhgSNUi2WNAWigLBoajWgyDpX8jp/VYTpO9CC35eQHZK96y6dvjE7gy4Iwq3qOTA8UGwkCZ
	rig7afqbAnav76xhJk0PV6NL9u1StCkO6+UyyxsBbGZ5mppO6Nv8gIMq1MHN7jj7bPZXXZP1xcQ2j
	RG/LbOEhq2w9sq6QzPQ2sAd+Z1KIpJYZWyZtdcS7qVaqmaes6KayBdvGbTZOqD34SvagNinKv8UBt
	XHyOJrP1L0eWlBdGUajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRdA-0017ww-1k;
	Mon, 15 May 2023 06:24:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRd7-0017uR-23
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 06:24:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso22872083a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684131859; x=1686723859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZrCCJnB8j04SQidDp73H5RlpBN8W7gZ1uSfWyGv/a0=;
        b=gw8iMh754Svye3MoH+GldEiAvTGQQ3ivNI4h9pqyp5ulva34F/fRSSXTHRZrTh5qzs
         UCZKLAvuLoPMqtYIyZI9y5iqamV6v0lLZDIm39CVNRaXT1ptv7iyTHPWkKezjx2HSMra
         EVvPokJmbZe3x1BxjF1oo/ju1eh1ktk1QTxLgtf3Il3PvdTcOACQiuiPzR3KrOauzvBs
         zLKcxwTWzFe3EIkgo7KYO6tVHvXSMKFf3ZZXtOC9xY4s7FJoRNM7detu2IexNxkmHJEW
         L5es9j/sFYxpWMvQ0VdZGWxmkOesVtUFgTbUP7KEBPPKR52rwzdoS3EOYjeUgR1qvxT8
         FgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131859; x=1686723859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZrCCJnB8j04SQidDp73H5RlpBN8W7gZ1uSfWyGv/a0=;
        b=jUkxdnuJdVKKzgFBpJQrVY03sV8RsvfwxFkfRe2qSHbsqioRRcCm+vVirBg4KaXrbo
         IehZ4qwCtQeBL9y5i1qH5Us7k7rtFM1VDJJrqGJkEnSK/WHQIkMDveF2VDaUmwDtF+y/
         hsVZ6hCvUjAzCTLLDjdXxmZXyaZHthFNNhXzgQA2l6UsShCPZHzTOKMP2BW9gSyUvOLz
         sAQ7rNnn2d4INTfnpGPx1YL2apoIV5CXE1LYNAqXxperU8F3Opt1Ckrykc2GyX1QmgnB
         bpIxrcOAeLbjUqWGxZk4rERDRqLAWnlGyL0WqxaM8wQQSQ/3wd4mlFArUGnp0wSdGUse
         PGXQ==
X-Gm-Message-State: AC+VfDx8iEauxAWFzZh+oKAYK8zHObB6EtAJjtw8jz9rV5MTwnr7S+dP
	we7ev2k8IhlWdDA7oHggyBG0Jg==
X-Google-Smtp-Source: ACHHUZ4k7nrcgyH1Qra2Mu296AsBuB70tNW9OEut7qSvtCarjgHLds9kwSn1mp7vLBj5nECNleh6Mw==
X-Received: by 2002:a17:907:6d85:b0:966:5eb6:40e1 with SMTP id sb5-20020a1709076d8500b009665eb640e1mr25219014ejc.74.1684131858857;
        Sun, 14 May 2023 23:24:18 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id ci18-20020a170907267200b00959c6cb82basm8981963ejc.105.2023.05.14.23.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:24:18 -0700 (PDT)
Date: Mon, 15 May 2023 08:24:16 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-serial@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <20230515062416.mnxuudjbx44skclh@krzk-bin>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514165651.2199-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232421_673878_54CEFF09 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon, 15 May 2023 00:56:44 +0800, Jisheng Zhang wrote:
> Add bindings doc for Bouffalolab UART Driver
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../serial/bouffalolab,bl808-uart.yaml        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/serial/bouffalolab,bl808-uart.yaml#

See https://patchwork.ozlabs.org/patch/1781053

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
