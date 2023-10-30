Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0328C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrrEPk17TQQApbGZtLDmM57H6jFs4E+935TaPgqdnW0=; b=ER1+Tz5HJThInH
	wGTffFnpK8m2UBHhYUcMrF7Kyn7OnZ7zEzGLeEGgT1EPfKb80S+/lTanjRS3gFpTQyheeA89OOwC5
	/0QECiG5puM8zylHF//DZBzhuSeMmaizqeDtA4QblCDKlCxiZGH+oQYMA5ncNsUtsoniGrqtAUiDf
	Ct5HSQrj44cYv2EUvHLKfM5DIFg6ASBYE0cKJ1jFth0CerKrFg4qwFpUCmcR8Azu+Coi5PQzYO2W5
	39ynKaPj04/MVlIapWKImA1lPzHXD1SL53qkZiaOaEgYa7z3yNupPJWb6JzUa/GfUBdb0/LJktpt8
	tJJXBxomhoAi9AozSLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOMP-002tVe-0Q;
	Mon, 30 Oct 2023 09:15:01 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOML-002tUv-2W
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 09:14:59 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a7c08b7744so37622617b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698657290; x=1699262090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7aqKrsdZIrB5ABk434LeogLx2l2c4W5AH5BU+5ySR4=;
        b=NnZoTwpkF++uL68hWfilQhOom5uuZYC+tLg+UA/oDUAkNmvJMHnL7vrMiY3Vs3tGgg
         lX5pETl4oWNgysDKEAvFoWbfmfty5yy0XWM/0GtpyNSzjLCmTo5iuJXSpDj4G9/1J1Es
         6yFn00A2pDVnbOeVGtJMr/stPDEtSS0DBSLXLUhHUeNBter7tkHvqyIsP9l19XBogjFN
         YDR4komSlZQF4PfwK/3RGzbmcT2/2fLAAjnjyGRB3P1sVVpdjZUPhnD76buhpK3EJ2IU
         y7Lmvs56X/vq5FPB10ljEIa7l/WMfIpdnU6o2hTUK6Pdz0Fx1LP/1wYdQZYztuuf8HEs
         m4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698657290; x=1699262090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7aqKrsdZIrB5ABk434LeogLx2l2c4W5AH5BU+5ySR4=;
        b=U/fFjf84PbqrvB/l/wD54BXqjts8Q7GxwlmDiSwFZYqfKGMCDpR+GsiZxAK2ZtRin0
         1h2wYrJIEOJxewxVU/r3wg+8cZNp9NrHHy4V/r2NeTSHeLM5grDUVT9+c4N4ve+obC3m
         rLXN3kY7DpDKJVRSglxYXdxElJQu7eiPA6iTfSpmE7e4JaXJOp+Tbqyg8+bIfI9HIiMg
         vLNBIdu7wcZYPaL6TcCgSQeIe/RKM5MEg01yCsxHW6rP+ITfI1vf43DaUl6n4H5ybrVW
         hwUwy87tB6P/78VS8qgpotsN1KzsyqAPsUHovbaMUrAArmGPOX1amYCZJaW8y3d9dq05
         C7QQ==
X-Gm-Message-State: AOJu0Yy9My6MUG+8HzASWM73kmpuuoxGxhZVVvquuSAjmP2D8vI10To4
	m09l+94MDFBtTmhl19PLTQMcyg==
X-Google-Smtp-Source: AGHT+IFtFlQZiOnSiJDBLR4UIwO0tx/7GTeBHUefs6bsb6z+tsAAKXgW+oOfteddFuQbSAS0y5DrPQ==
X-Received: by 2002:a0d:cb52:0:b0:59f:6675:7771 with SMTP id n79-20020a0dcb52000000b0059f66757771mr9457492ywd.35.1698657289735;
        Mon, 30 Oct 2023 02:14:49 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
        by smtp.gmail.com with ESMTPSA id e67-20020a816946000000b0059b24bd4f2asm4068279ywc.57.2023.10.30.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 02:14:49 -0700 (PDT)
Message-ID: <513ea612-b354-44d4-b6d7-490741ed14a3@ventanamicro.com>
Date: Mon, 30 Oct 2023 06:14:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
To: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 palmer@dabbelt.com, devicetree@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
 <20231029-kitten-provider-1602fa805c35@spud>
 <680a2f25-59e7-4757-ba93-1de7fe1279e3@ventanamicro.com>
 <20231029-sappy-ought-98fecff551fc@spud>
 <20231030-d3db6c3f8cf46bbdd8191d65@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231030-d3db6c3f8cf46bbdd8191d65@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_021457_837597_A51CCD60 
X-CRM114-Status: GOOD (  27.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/30/23 05:18, Andrew Jones wrote:
> On Sun, Oct 29, 2023 at 10:21:55PM +0000, Conor Dooley wrote:
>> On Sun, Oct 29, 2023 at 04:49:30PM -0300, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 10/29/23 11:53, Conor Dooley wrote:
>>>> Yo,
>>>>
>>>> On Sun, Oct 29, 2023 at 09:35:00AM -0300, Daniel Henrique Barboza wrote:
>>>>> Following the examples of cbom-block-size and cboz-block-size,
>>>>> cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
>>>>> The most common case is to have all cache block sizes to be the same
>>>>> size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
>>>>> cache operations), but there's no specification requirement for that,
>>>>> and an implementation can have different cache sizes for each operation.
>>>>>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: Conor Dooley <conor.dooley@microchip.com>
>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>
>>>> Firstly, odd CC list. Please CC the output of get_maintainer.pl in the
>>>> future.
>>>
>>> Ops, my bad
>>>
>>>>
>>>> IIRC, I mentioned defining this to Drew when he was add zicboz, but he
>>>> didn't want to add it - although he seems to have asked you to document
>>>> this. Drew, change of heart or am I not remembering correctly?
>>>> I think he cited some interpretation of the spec from Andrei W that
>>>> implied the Zicbop size would be the same as one of the other ones, but
>>>> I cannot find that on lore atm.
>>>
>>> The reason why I'm here is because I want to add Zicbop in QEMU riscv,isa.
>>> I'm pushing a rva22u64 profile implementation there and Zicbop is mandatory
>>> for it. In the process I added a riscv,cbop-block-size DT because, well,
>>> if both Zicboz and Zicbom have their respective block-size DTs, then it's
>>> expected that Zicbop also has one. Or so I thought.
>>>
>>> Drew then replied in the QEMU ML [1] that riscv,cbop-block-size isn't
>>> documented and we can't add it as it is. So here we are.
>>
>> Yeah, I did read that.
>>
>>> If riscv,cbop-block-size isn't needed because Zicbop will use the cache
>>> block size of Zicboz or Zicbom, that works for me too - I'll add a note
>>> in QEMU explaining why there's no riscv,cbop-block-size and everything
>>> is fine.
>>
>> I just wanted to remind Drew why we didn't add this in the first place,
>> given I had seen that he suggested that you add it in the QEMU thread.
>> And in the hopes that he would be able to dig the link back up to
>> Andrei's comments, given I wasn't able to find it/couldnt remember
>> recall where it had come from.
> 
> Hi Conor,
> 
> Thanks for the reminder. I had forgotten my own opinion on this :-)
> 
> I found the messages. In [1], I advocate for the block size DT property,
> but then, in [2], I reply to myself saying we could probably wait until
> we have a prefetch block size that differs from the management block
> size, due to the "reasonable" interpretation of the spec that management
> and prefetch block sizes are the same.
> 
> I think I could go either way. The nice thing about adding the node is
> that it's self-documenting. While we could document that Zicbop will use
> cbom's block size (and if we ever added a cbop-block-size, then we'd
> change the documentation to state that cbom's block size is Zicbop's
> fallback block size), it might be better for things like hwprobe to just
> have them separate from the start. FWIW, ACPI already has a separate table
> entry for Zicbop's block size.
> 
> I guess after letting this ping-pong back and forth in my brain a few
> times the ball is currently resting on the "let's add cbop-block-size"
> side.

I'll go ahead and understand that it is ok for QEMU to add a riscv,cbop-block-size DT
then.

If Linux wants to handle cbop-block-size as an alias of cbom-block-size that's
Linux prerrogative and it's perfectly fine. QEMU and other emulators/VMMs deals
with non-Linux OSes that uses the devicetree bindings though (like FreeBSD), so
we'd rather error to the side of having redundant info than baking in Linux
assumptions in the DT.


Thanks,

Daniel

> 
> [1] https://lore.kernel.org/all/20230914-892327a75b4b86badac5de02@orel/
> [2] https://lore.kernel.org/all/20230914-74d0cf00633c199758ee3450@orel/
> 
> Thanks,
> drew
> 
>>
>>> What we can't do is add stuff in the QEMU DT that's neither
>>> documented nor acked in the DT bindings.
>>
>> That's a welcome change.
>>
>> Cheers,
>> Conor.
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
