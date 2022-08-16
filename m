Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA7BC32773
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKdJ4IP3EkTO7CCoaRFlafLt6yudlPZuLB51MLC53zc=; b=jl0N+ph3GuSwoM
	2ryQ8EOW8jf9IFynR9yCbwGtj99xHL9HpnGEQIVNB7RDj+l3eh2gmTxokjS3l4UIgWQB5iVfd5fi6
	tRgO/dHLwzGRxIUd+RwPS5/mPiVLJhyUfbCWwnEIxr2Fqe+CqobjDKR+Ein23OzVxjeHBt8PoR+Pz
	yTPhmR3i5lvfiEm0Rb0bbNbYEWqUv6JJjTS2fpFJmGNdkAs2Y+INixnVJ0rK9jN+4+yiOWNuPLl8i
	NWjKWK2ov6mrOl/9gLMbyIx/HC0UVlkyo7QelOoZXWsGZnRG2XD9eS9RMeTc1LgWSI0fOlnaDAa4G
	pvh5lDpoeHT9i9aQEG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuUt-001RNo-0a; Tue, 16 Aug 2022 11:12:35 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuUp-001RKk-P8
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 11:12:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c28so10393768lfh.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 04:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3voalfDQmBkJPM0iEJsy/pKGiIZwChjwOwKTgiPpcq4=;
        b=u1jHFXVQelHvAsNbis29DRi8FSq7YOKJir1/5EgPIni7IHBviuSNWkvqKcxU6mb40R
         BlTCsCYh1K7sEgITXhZRYuYCN5pe2icqTkOWfoMuklIV/+8Gz8Km9Ua5GakzZb5C6vYE
         c/gtolt2fQpzqg7RzUa7JJJZHGFZesC1epB+YBppY3+iXA3X9R/+A+b/Cs8fSx7Zfgj9
         HkhIRc/RtFysjq/jswJbCKcPVLXfYAkP/TdFb/zRc/nvYNbE7Tr0tyCAg9dK61Mg2I+X
         kYaLufS6xx2BrN+tOj97sb3WT5EVJ4DulT3EMA5N8rYLWheSzQTjpo0MJU1zCmaGZXGZ
         808w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3voalfDQmBkJPM0iEJsy/pKGiIZwChjwOwKTgiPpcq4=;
        b=KonmihxtQpIt4U6aiGoQ8sB/Gn5VgbfqVuCVzPulpQPEBefNzUqj+NH/Z72Seohed7
         6UP0RnkNTPnUZdxTVqpY7PhlPvn+6436TVCcnH1anfSulunqgYwZU4h1Yl9D4fHrsDmJ
         KMSNoDTlX6fdLdnyMaugIjiJEr7F4lIXBzceeZ8SfOEMha5OEsn16PQKCQ8y6WJ9px4z
         2n+83JHPSid1C9H5lDd2WrhZ+T4O2e3i8q6SChiTpt6uGUELjP3jNw5080tItG6KS3rg
         /Hd05Zi9naTwH92IMksYczE7cj2R6qTuBKgkHrX46dUc0P05VQZM6KdIuusCV5nAZLH2
         yYtQ==
X-Gm-Message-State: ACgBeo2oFqpQdJq+1uDAY1cawqQNGEyWpAfsbqlI6iL/gKWCR6agcjtt
	jyVO71rxTLYOELd9UfUX2E5zhw==
X-Google-Smtp-Source: AA6agR5s6mmYOckWupogUoGlmi0i4i7rbgUk9CW8zTxihnx3AOW7S9ITLQhn/Y/uWTfocKkgvLXxHg==
X-Received: by 2002:ac2:50d7:0:b0:492:8830:4819 with SMTP id h23-20020ac250d7000000b0049288304819mr3641459lfm.36.1660648347906;
        Tue, 16 Aug 2022 04:12:27 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512025000b0048b18d65998sm1358896lfo.38.2022.08.16.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 04:12:26 -0700 (PDT)
Message-ID: <14753794-245a-7b27-3bd9-46b80666b7af@linaro.org>
Date: Tue, 16 Aug 2022 14:12:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <5593349.DvuYhMxLoT@jernej-laptop> <3881930.ZaRXLXkqSa@diego>
 <2249129.ElGaqSPkdT@jernej-laptop>
 <b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
 <20220816120050.07dc2416@donnerap.cambridge.arm.com>
 <29072f12-b9a3-9815-ad52-5c4f6b1634b3@linaro.org>
In-Reply-To: <29072f12-b9a3-9815-ad52-5c4f6b1634b3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_041232_017274_49087261 
X-CRM114-Status: GOOD (  13.67  )
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

On 16/08/2022 14:11, Krzysztof Kozlowski wrote:
>>
>> I think one reason might be that this is so central to the whole SoC
>> operation, that it's already referenced multiple times in the base .dtsi.
>> And having a yet unresolved reference in the .dtsi looks dodgy.
>>
>> NVidia seems to omit a base oscillator (maybe it's implicit in their
>> binding design), Marvell doesn't use a fixed-clock (but still puts their
>> base clock in armada-37xx.dtsi).
>>
>> Exynos and Renesas put a *stub* fixed-clock in the .dtsi, and set the
>> frequency in the board .dts files. Would this be a compromise?
> 
> This is exactly what I said before. The clock frequency is a property of
> the board. Feel free to keep the rest of the clock in the SoC DTSI to
> reduce duplication, but at minimum the clock should go to the board.


s/minimum the clock should go to the board/minimum the clock frequency
should go to the board./



Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
