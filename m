Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581B5C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 04:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCPdGPrmhZ32ssu2N/rVnCXaoIq0reTWq5Z9p9hFgBI=; b=v4NrC1+swxnAba
	qvXbuu6BjbS2Kdhy4iK/oWtUjWxTcFNy6CkHeX5qZJ4CKH4e8OZ8WxUAtUIY53978DjXHNYYhDh2Y
	60n96tblMM3RibXs5eLa4+vLFr+M08q+bDGbBY46KHXjodlhYxJXZbh2QeVMQF7bqMFDAF0YZ5abj
	/9orIyaWLODnMQCm6t/f/fHpjiY0dEXty5Q2KSp2Uej4TR0nvFgLxkDeXCxTCfRRzjViX831d1md6
	eTE2jYjOC6uCgB7feXTwFbFjdh3PqAXfF8COPqPs2mtS8Mdr54hy7Du9Nuuf4YDonGo8vvI+3IyS/
	t6zURMD2G/swdHEQVeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfwZ-00000006vVv-3yUj;
	Wed, 05 Mar 2025 04:01:16 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfwX-00000006vVb-0NWL
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 04:01:14 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so59938595ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741147272; x=1741752072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=QOSJhIFbwNFq+b1uIIwyjtAmxCputLErXw0/jG3fmkJae8psF3LlJvieIHS60NS97h
         8+OGs6ca483B4fPZKa9T4DAFPE1oS1akRznOrMMGrnBQPF40xwY83xV7Ym9cHPQggGBK
         A7xiZj2eyB4lj0qlPnxUPbXoCqdZ+NqOHoKBGM4tnZBdBmeKNOn835Hex/KTWzs47Gt7
         OWxI/p1MrWPmA2oWibGdnv04mqqqTJYfmk9uifZkmkREVr5AQX1bmRIxQlT/iCTWuc/n
         UEdZ3YwM+nfMuXd9ozkO6CQyhmdxPcrZxTTwoGoMtvLOl4LaDcWpVyQ//By/Fngy7ZzQ
         B+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741147272; x=1741752072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=jI6pYr3NaBGCEUTKCosTIRh5Bz8NrCZO0bSC1Zpr31wY5MKKonYKmXUpXjyyLcAViu
         9dltjJdH4dA7yM09J5HkFXQvA8TlVVPrYI+/Ciqxt8nWA0vnVq1n9uvhycCBhoga4G7w
         f9hncTFRsLZlKc6MAjrLBIK0V8vYmzECgJOqZ1DChzyd//eJyUno2Vvxw3hNX4GZmisM
         /AkVxnky0tyeg5AWkerxD+AsYtr3iGX1Q5R+HvX8i/NZ1yUKlJtZy+avLLV87dsEZUZ3
         eXSOiQ2BmUz0+QezS5QmzrD7UVu2DQgi6hWFQMxckYn862+5aIJUOWz4aMoT2BE8tijd
         BJBg==
X-Forwarded-Encrypted: i=1; AJvYcCXOJHNIMtk5SCfvp0S55aYAY8hR4Tdg6Pa8jV34bhpxh04d1bzZ3bVOWMimU8I1tN8yc0RQcVNg368NfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzog1xxiCy9u9E3srk/3exSYRCDGVJBwUNn1SKghisuKGF/rT6y
	eqhz1It9H3J7DQH3zx/F1DvNWRh4/oWtMnINaDeZahPAoT6eSYK6RxqEgPDQS1D+wbsw4nFgqo7
	121Q=
X-Gm-Gg: ASbGncsD7M8JFyTLCPyTv65MtpqGc2SXudIleGYWXmAO0sNmNhXQEWhx142W3v6ILHN
	N7AnOV+fE+BioLHqHx3/lhf5gxn+/aoIslD176ggbnFBR/Z3JrkRXgrHwVw4J++05jKIwu1H+bn
	Xxhz4NEcclFCy1AUiARluPkaSgmw9nXa4mpIswiFqG0oIgdFBqRKCzElVGQ/skt62wOFdGU/v7x
	R39/FkVD8QkHDGhWME9WrmlFGsnOdyuDcTvu2b9aVHjfBQB8AFvqe9R3yVdVYOo+PNda7XhEbtk
	YNkTXBowmif4uKJjNXcjqCJyw4zMYN2qsDKFa4Q=
X-Google-Smtp-Source: AGHT+IHu3MJTjF5+qGVR/U5nf98lXZ/G6BYq/rEMfIvyKQ41zfGyelWGxeEJNcGMavArNtzdZ37kIw==
X-Received: by 2002:a05:6e02:1d03:b0:3d3:e2d9:5a58 with SMTP id e9e14a558f8ab-3d42b97c976mr17539195ab.17.1741147271939;
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deee5121sm34666245ab.65.2025.03.04.20.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Message-ID: <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
Date: Tue, 4 Mar 2025 22:01:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
 <20250305030540-GYA62563@gentoo>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250305030540-GYA62563@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_200113_141906_D438A944 
X-CRM114-Status: GOOD (  13.45  )
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

On 2025-03-04 9:05 PM, Yixun Lan wrote:
>>>> +        clocks = <&ccu 176>, <&ccu 90>;
>>>> +        clock-names = "apb", "twsi";
>>> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
>>> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
>>> from above docs, there are two clocks 
>>> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
>>> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
>>>
>>> I'd suggest to name it according to the functionality, thus 'func', 'bus'
>>> clock, not its source.. which would make it more system wide consistent
>>
>> Also in that same register is:
>>
>> 2	RST	RW	0x1	TWSI0 Reset Generation
>> This field resets both the APB and functional domain.
>> - 0: No Reset
>> - 1: Reset
>>
>> Which means you need a 'resets' property in the binding as well.
>>
> right, there is reset needed
> 
> I'd suggest to add it as an incremental patch later, when we
> implement real reset driver, and also complete the calling reset
> consumer API in i2c driver
> 
> but, let me know if this is not the right way to go

If you add the resets property later, that's a breaking change to the DT,
because existing devicetrees will not have that property. So you would have to
make the reset consumer in the driver optional, even if it's not really
optional, to work with older DTs. So it is _possible_ to add incrementally, but
not recommended because it adds "legacy" code that never really goes away.

It's okay to define the binding as requiring the resets property now, even
before the reset controller driver is merged. You just won't be able to add the
I2C controller to the DTS until the reset controller binding is merged. But
since the reset controller is the same IP block as the clock controller, its
binding should be available soon anyway.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
