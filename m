Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlNfATgNvjdyI6wRgYWPb65PGFn+tZmK7CQx/DoMeyQ=; b=Y917FDyuOCXsFe
	2LLfIk4vJl3b3qsBw8VZ19vzlzCiQZkVrDWFAM1DxcKxFIxjT7JDJ9O3MaVUuQqbxCMfkAOqNYbmo
	I+tUsQ3Vg9tB5OYXyh3/CrmAQo8+KyQ5utcMWEeRSVP7lqS5bnnHUDC2yYSdrJtgoKVA3q9Fiv2uW
	DZYMaZwlhByrsPE2CmoE6U6D5Own+KV3UlKF/Evrwi1j7DYaI6oU9XlXKnnH8EUJwVQNCiy2FNbPG
	SlZDUFsuYJYgkbqe6Nxth+1mvrDKDzwDiVBhrR71XA/W5l+CWtkb0cRhRXBstRv5kn0qwOXpnuo1+
	NbxIvwJtjRsb+Lkej0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXvy-009ohh-LC; Fri, 26 Nov 2021 09:54:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXv6-009oAl-F7
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:53:30 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1692A4002A
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920407;
 bh=mSLw2XbRlC8SWhqwCfGbIs5q4IiWwWBCeoevAptaoK4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=CQlZggMHmsgOZf8GaF6LI97HmfpwMs9d+NsJ4vB/eBEtMiFlBKtm1MocQsNjds/mk
 XObxfcG3crzsNCsp3oIJiTl1EoEsGE+j8YppPGC3YeV1yZWRP71xbgSyvORgUKZjk6
 vpIwk2yXTSOZmfyQcKDn7mGvjdK+q0Y9YynUn4gW1GMww4g1vNR1aTR8v8eFrM+LBd
 9Z/yjXCULuJQkRI9tN8LqGhxQZi3iNqmz4sbSzQaMRYO/P21RocfmLwLd5KdSydxqR
 tJq03gSlbzu5iwa00t4YMabvI9xtiuvHW/bueX+ObCN2WI9y4EEU9ofgLLxTd6OduY
 jr6c4W8bcYMyA==
Received: by mail-lf1-f70.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso3981488lfb.17
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSLw2XbRlC8SWhqwCfGbIs5q4IiWwWBCeoevAptaoK4=;
 b=XXoXLZUj5MSjxfmZyRlAMvRKobXvsCIZdQTbWiN0tGk4gM6IJS43x9l4g2hOvpXopI
 nn1IaP7vhG614Bh45ur/cHRLUc8YLOwFnE6wDYfcjX4cApdFbOslqW0NniV/tIIXsDQv
 g/SnAYu/wGxcZwFQ40rmzpxJV5IvlsL7+ELSaJFKsdFpNeKlZMN6ybzRgYPXbuPsN102
 HklPMCw66ESi0MuRpZwABVGPEsiszEKP1c/C/+JEiozu19TWbGoGgUXV1GGCLHNC8h7b
 P/S5luBcfVztGMZz/+gtUlHSW+lJy/j4+YUIRCW27PwUK0w+NRUJjZUK02XfxObs7YJV
 6Pbg==
X-Gm-Message-State: AOAM531P7dZKJZqF3l3NwHOJmI3PKm72o9dBGVPQPrqQJc+ViSoQoipr
 uT70djnyLbkCxrjSq4mKQwZ5tYebiH8ae4Uf0z9hAuGfKLwioF0q7OliVMAk7w9TiYdwmMz37ch
 u+GxfJbUSLnJyTl9eTns/pYg7omO1zi6uciVqDoWYz/85PQ==
X-Received: by 2002:a05:6512:20d4:: with SMTP id
 u20mr29704785lfr.339.1637920406536; 
 Fri, 26 Nov 2021 01:53:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoJptexUvEA/xf01vFwHfA5WAEQn2FOvHcpJ9INUY+amqmXMLi0/5ckuZMWEezfj+5WKRT9Q==
X-Received: by 2002:a05:6512:20d4:: with SMTP id
 u20mr29704771lfr.339.1637920406382; 
 Fri, 26 Nov 2021 01:53:26 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 b7sm463798lfb.224.2021.11.26.01.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:53:26 -0800 (PST)
Message-ID: <2d87b40e-9fdf-572a-a194-afc13fc20dba@canonical.com>
Date: Fri, 26 Nov 2021 10:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/9] riscv: dts: microchip: mpfs: Drop empty chosen node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-4-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-4-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015329_046742_F413057E 
X-CRM114-Status: GOOD (  16.21  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> It does not make sense to have an (empty) chosen node in an SoC-specific
> .dtsi, as chosen is meant for system-specific configuration.
> It is already provided in microchip-mpfs-icicle-kit.dts anyway.
> 
> Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index c9f6d205d2ba1a5e..794da883acb19256 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -9,9 +9,6 @@ / {
>  	model = "Microchip PolarFire SoC";
>  	compatible = "microchip,mpfs";
>  
> -	chosen {
> -	};
> -
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> 

Maybe bootloader expects it? E.g. it looks for node and fills it and
would fail if the node is missing?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
