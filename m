Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD8CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEGd06WIaQB/qnAPTZl5gwCi/+oK03mbUbwlzmDkGsA=; b=f1XV8HgX2ETOcR
	oi+1k00/NL9dnUF7jhDR9+hh06I8kKlj8R2NK2hYbXs6/vTtkn1zfLqo1Gv1LHUoJTVmHC2/4ziMb
	83fIb+q6/BzwnSAc4XHtpJYZr327w86dZjszFBcmbKKX2zmUy2oCmo++B5RoMIApoKLYv1ab88GCJ
	sBnJ6NK1PVaVX5tBjnHbE08zIG2bxN0kmJlKc+3Nk/H97cYDFuJbznuoAwugYBwXdBS/6FMBxO7fK
	O3hf5Ciy9R+XydsgHkE1159hn9jj1UuTx95EZri1UnDjqw5Gu9TfHey/FZPos7jA61juEpxhtYXnS
	GM3g2AAgsHKvt9na/3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAAX-00000004h5z-3Khf;
	Mon, 15 Sep 2025 14:27:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAAU-00000004h4c-3yNQ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 14:27:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ebc706eb7bso376481f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1757946417; x=1758551217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=Mm2bZWKAMlj66zoHvWpAWPylKVCpUBDofa8VkvV76CW/5TFnZymLjbTxL6YDc7nK0C
         /Xnq7MuErVqvl52H3zpBJ7MWX68186WAC5SDZ+2UnF15cdhAV2I8aDCWfUYmSzhnkXTx
         JL2K38FEhZUSHzc+KX/lOh+IEEDnM1A/8qh36wXvt1YSeJuT6arFhzgizFCsyN7a9ZHc
         Qc0soEDZMRzzHfNPYLBqJVGBQoWeI7MvgOs3poEp6CzwEcMXSOONfUccme+pYQAZculQ
         QBiXJf/J+KvNbjT0uVLH1u4fonJW7JmoFhYGwzo+LmAFpFKuTVYkRTc/dmdTAd9/3L5w
         uVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946417; x=1758551217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=qSCfsp6tJuZ0r3+vM3r1fORaiVs/l5CSFSVEAbfQcZjNVQcLP/J4nVbyWKbf8hthN0
         k4qaNu7hyyXdbHu2y7IdBFxP+heUOBSfnEqI9RNy9JWfZxzZ2ix+6Qz2Kku1RD/B9jd8
         DiHMKml4dc3tC5s+T1rWR9XAP6Vlgp7qwT4hnmlGYSZwV7fUp2SJ2tnj30+p13glUt6X
         GkW+YBWbtY+hjt/m8Pra9pZ1G3eoS3yEtpJ/O4EayuHeCerjl68OetlL3v2ITpTnwThf
         1qz47MD1D/b2b+E2pBksAS9yaknrKNm3sBAyWU5E/Gg763mbeQLrPOjZkadJMkjCUaFo
         PaHw==
X-Forwarded-Encrypted: i=1; AJvYcCWCqM7qubWO8wMb1P5dBnSzW7SboM361kCyEfkrCzLOnyYsM+tGKzw0gRrpmNGanKHsdYT4vgcELik6wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhS6hs683h9cqAwJfum4pptN1WbEKIpa3aBKA0agrKnGbKK2Q6
	xRt2fiC/AEhXNZkqLTFT2Wgttr4bybfUnOT9JXva1ychzht4DDLEVDwW/6XkMjLzyfc=
X-Gm-Gg: ASbGncsMhJVg/AzbLhsVJjEYk78RB5/FXcdgCEJ+/F9ci2KSsalLvyam4N1zFFJ0DQn
	k+dJ8HP1XlO3kNJVS1EAl8VKCdiSaSHHVWirAUCQ6EwkZ1ag/mGrBB4u+9UBp/LS3gKwiJAwiZr
	1XeGHHasecaAMi8ZVcwWiZf8mdXmuzw+sXTxNQNnCNRTZGe7b4ARly2PQHp/v3XLpkAK/nxuQOc
	lwNE0Q/M9L/PRjpAIdNZlMEJX0HCjUC1cBniUTkOh06drj08HLx5lN6bMfOxaQGQCp5OzQ3O/F4
	8vlmudt3MSfEbSggVv6RU3nsXIItpi2+nz5LikeL7kBZ1p5ciuo6C2lp8xPKVcVJKRwWwUx+KkM
	59UhKPzIfrwxzmKYAAA0452s+xFRcin23/87FgMHmv6rddV+QMdd3vPoVCrOTDjKyWTbhLYs/Ge
	eYzO9dptcMIZwxX34buXh9+fpackkRHQY/
X-Google-Smtp-Source: AGHT+IFs0mXefHor0OfcKtJiaLRNa2umUlSV0hyShyz1KhSiw3PD6NcKqHt+Ht1UUfx+184BUZwpHw==
X-Received: by 2002:a05:6000:1841:b0:3ea:6680:8f97 with SMTP id ffacd0b85a97d-3ea6680924dmr3500151f8f.2.1757946416790;
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9? ([2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01baa70dsm187561225e9.15.2025.09.15.07.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Message-ID: <aff80932-861c-4527-93a1-9fc2c1eb8d8c@hammernet.be>
Date: Mon, 15 Sep 2025 16:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
 <20250915120031-GYA1251948@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250915120031-GYA1251948@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_072659_245898_295095F5 
X-CRM114-Status: GOOD (  16.59  )
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

Hello Yixun,

Thank you for the quick review.

On 9/15/25 14:00, Yixun Lan wrote:
> Hi Hendrik,
>
> On 13:28 Mon 15 Sep     , Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 389 ++++++++++++++++++-
>>  1 file changed, 386 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 381055737422..8f87f8baaf77 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,12 +11,395 @@
>>  #define K1_GPIO(x)	(x / 32) (x % 32)
>>  
>>  &pinctrl {
> Generally I'm good with this version, only have one minor comment
>
> How about adding a "/omit-if-no-ref/" before each pin cfg?
> This will shrink the final blob size if no referece to the node
That sounds like a good idea.
I will send a next version with the change.
>
>> +	uart0_0_cfg: uart0-0-cfg {
>> +		uart0-0-pins {
>> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
>> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
>> +			bias-pull-up;
>> +			drive-strength = <19>;
>> +		};
>> +	};
...
>> -- 
>> 2.43.0
>>

Kind regards,
Hendrik

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
