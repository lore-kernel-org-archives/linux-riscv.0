Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE70C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXTMHKsN91OO7DMP/pGUJjB2Wl8vgS8513udZeM73sY=; b=GqNDOo+YaumirO
	MC7kbbMntc5hRy6rGSIbnpxUZqJuzxD+TCRqQb8NG7+mEGk15YR5h5HF6WXjpWVsfEJ0WjDZ7ryzM
	vUUW51rF1Mm9VOwbDGz8peWu+zlVv/1MHIJA8cHqS6ZLP+SDRzoHdMRXpUezJSW5YXmO9GrDAhoNg
	kqsz21QryPZAVmi0twwYTl+8+j42ye9STnHZcF7AZOhXxG8+S2pWkUPpD82+A/gDFJNyc/vi9afR2
	kCi74+Yv1uYZ0TEcYCmhlb08EeJm6c+naXUXs3VIDhoODL9N7njMV8FS8Dxt5XQJk5ZbfSHgDrkor
	7DXcq/3ToxFLUeLtdh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl5Ox-00Fxfb-Du; Sun, 01 May 2022 08:57:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl5Ou-00Fxf4-Pi
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 08:57:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id i27so22840144ejd.9
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VxzhOhKNI29ABY/z1Q8INWKSwq3v8ujlfSDXX4pCSIs=;
 b=Nc0XV+AGpnLyL5MTK0YHYhYorLX6zh0t1zVTHhSVQ9WuqrLO4z7TFdSkQYDVYexvfC
 8bHjUi57kgKR1VJ/4cBa8UVzFhhZ94Hod1xfUbdoL3oiHv+yzW87UNFvDoX+l9n7NHAE
 SL9gMYeAYKexRzV3XrZI0rW5CSp0EZJGa/bS1NfbOU5V+lcKzv5G8yhkkUg5uxqbNrdr
 D80nOW5uCgmiphXWldTyqpckQQ1U01cwzcVLRH5opu5zlF3XuzGKCN8Cei2ds5+DbZMB
 5MsQJJw+mHMPB2kE0TqQPXl4Gz0DI9VWRgI/1Sno1dL46dydS7pk+I0aQppziq+YwwBA
 ooig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VxzhOhKNI29ABY/z1Q8INWKSwq3v8ujlfSDXX4pCSIs=;
 b=lH3qWA5P6xG3YcKvr8nLKEGdHvzAyNK3bugQd3mvMg1YRP0LDKj6Kn0bPckOUpNM2d
 kNjSk8JMuA+vwoAxXkeyCvw4dBy82iEl4fvCiwGOcUFZA56obRfwgF1iCVSy8P8zSJRs
 Hkg0gbahnIsO7rtKIBXYqkojy3SfZb0VhNf2/J34BT84ZzDd00wGLEsMnxUh8+FZ30H2
 F8enFO7egHZXLL6HKoGvUenif88pyZCd1hODhiLUSLxGbfv6IbTurSL1MCDWxE3upwgG
 I8ypqho2ad+rcg7hxH98WDBjhxpffKy+w0ce07MdFwGF8QA60OSb9rRFW9UHap1vffxf
 6tMg==
X-Gm-Message-State: AOAM531pcRcJ7whw9qfXnageX9UMAte6y36c5xF7NHjivbPJxb6GBdn3
 O10Fq1G9+Mov0IQTSw8/qTiW1Q==
X-Google-Smtp-Source: ABdhPJxECiGehT3UfPAMnfrXzNMRoQMI84gMv06eV57YnkzOPgX0NNKEMBNdrM7ajJHUdKKpsZ6heA==
X-Received: by 2002:a17:907:4c8:b0:6f3:beac:260c with SMTP id
 vz8-20020a17090704c800b006f3beac260cmr6610204ejb.321.1651395475314; 
 Sun, 01 May 2022 01:57:55 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 20-20020a508e54000000b0042617ba637asm2437921edx.4.2022.05.01.01.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 01:57:54 -0700 (PDT)
Message-ID: <258640cd-01e3-2a9f-b2a5-79b2b6cc4f59@linaro.org>
Date: Sun, 1 May 2022 10:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-5-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220430130922.3504268-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_015756_891532_E6DB11F6 
X-CRM114-Status: GOOD (  14.29  )
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

On 30/04/2022 15:09, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a compatible for the icicle kit's reference design. This represents
> the FPGA fabric's contents & is versioned to denote which release of the
> reference design it applies to.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <mail@conchuod.ie>
> ---
>  .../devicetree/bindings/riscv/microchip.yaml          | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..c9d8fcc7a69e 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -17,10 +17,13 @@ properties:
>    $nodename:
>      const: '/'
>    compatible:
> -    items:
> -      - enum:
> -          - microchip,mpfs-icicle-kit
> -      - const: microchip,mpfs
> +    oneOf:
> +      - items:
> +          - enum:
> +              - microchip,mpfs-icicle-kit
> +          - const: microchip,mpfs

Blank line.

> +      - items:
> +          - const: microchip,mpfs-icicle-reference-rtlv2203

Why is this not compatible with microchip,mpfs?

>  
>  additionalProperties: true
>  


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
