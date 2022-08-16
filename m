Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C433C32772
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfKgF9GQGXIVDpCm0AeFPhSzKXCfa8Ov/br7uJMkzG4=; b=vVDALX7/NUbvAN
	5pscuyaewX15U5M7h7M97r1ZPfM91GG3z3bJbDdkU+QOlTbNl/Gw6xc/Ub95btjDg1+RwzsOTpU4g
	C3nbDF/uT4o34hTGbzvHok7euqzQcOtTF/HSl+sJbVKSy5lK+32ubp2JlSZ/ymOC7/QwY156SXKxC
	wEWpGWIuctBdk6NODy5U2wD8hJ+wst8ktIkaEA4+pvSAxLNnNWbkxZc6QRPjovCpeyZjUdIwmB739
	KGQuqI1e6/tr8vtCry94I/2BLKwbzfmbR57tbaw0Tcne4n4N0mDNyWQTPfzCi79lGteJipWoBaGkF
	Jn0agKm9UV+9j93BLbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrO8-00FpPj-6q; Tue, 16 Aug 2022 07:53:24 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrNP-00FopL-VS
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 07:52:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id d14so13701600lfl.13
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lQtHUsLH/WWCjoSjGefd7DortRFai1vXhVwE4aiVS2E=;
        b=Gpqfoc8EPuBG/IljADnLwp/zZ7Nu6MdA2w8NhpnOCBNu9qs8xm0QIuRHmed86YGInA
         z4FqE3LGcbyeZKuqzdqYkN3c7is6lO+R1yDTrwClA4vLaTzzDnWBF3Y+txa+1VBeypwr
         SaXP//AlTJcEacqBsAGcykak0VHCzos8jgsTjyfbQylCtiWDMjOukU1f6fWR8YdymijK
         7lviToGRHXGreerj/g15B8oy2C0mBKLXa1WY5LCOq+2qX3GOrnjj6iOBcMs9pTZFdbT6
         3huQNMrBaYBMsrC6JzASl+D7SxlxSZl9GL8z8CJR6Zvlap0LH1vi0c2jCGq5oiiM3Lrq
         48qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lQtHUsLH/WWCjoSjGefd7DortRFai1vXhVwE4aiVS2E=;
        b=ZjSTUOuWzR+iX9EycWr2byK82aFXlTz84koYMtiyoQQkWjsPSS+RevFfecU48DTdub
         SbrGcF1o4p7nbuMpfrq8bmPSXCP1OXP/bFqtg+xruhT4Lw/L+0FIW4jygihEhzQEepnX
         o0SVWOf7iaJHU40GgLlLfAmr4TEQFZIwOKjCul82QdU58EZQiZhnFjLXBM0CipcRiIZc
         a9hlGyXe2fOG1TWFCGQW8dwXM6L9XGRe9Kwv5ZlHmsnys7NRsSOTrBrKHIAuVDTJhskZ
         E9hsNzOtyYgHMNR5/qwistL6VbWVFlnxhjBI3T2ShCkqRbJ2bVFr1vepBMj3lo0H+KFm
         fLNw==
X-Gm-Message-State: ACgBeo0+hq5d5dt4vd3PHbAFVFtM2ievE/md8n7uQ/1XDflrGtJ76Y6m
	k0zVvxvyaFmVEftggtJWQDKzFg==
X-Google-Smtp-Source: AA6agR5VnT3udntrZZ7EpKwe70edEBA0fLvgAKcwEb7zHnAozngFaACreSwQIdagnlyVDCnpihCy4A==
X-Received: by 2002:a05:6512:ba2:b0:48b:7c:84 with SMTP id b34-20020a0565120ba200b0048b007c0084mr6544937lfv.48.1660636353707;
        Tue, 16 Aug 2022 00:52:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id s3-20020a056512314300b0048aa0ab6448sm1312234lfi.15.2022.08.16.00.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:52:33 -0700 (PDT)
Message-ID: <8b912cdd-e69d-dea0-046e-6e02a9984859@linaro.org>
Date: Tue, 16 Aug 2022 10:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_005245_566695_C390DA34 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

On 15/08/2022 18:14, Lad Prabhakar wrote:
> Document Renesas RZ/Five (R9A07G043) SoC.
> 
> More info about RZ/Five SoC:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
