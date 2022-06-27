Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE3C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpjpyBAqHOjPfZkmKwEsIaLnosEHpc53plvEGszYTm0=; b=lnCPfm6rqQi/Bo
	jaVnkMjNA4/lmaxqTVBVoMfrfsk9pLajjYwWJhf3a1Jl9f9BT9K9gzrFp/BjJX/Z2MgcKZRmraS11
	x15JTHVVzsxdYqzbSehC503vtaO0JrUm5MnIQQ4Jk4mf4zTmy+Q1pvllJovqZfyzjMuHZtkhrrO1c
	f8e1Xv85epq+JzOwSdI0ZJkdKZZIBv1Z8QLAQDiLqOCZMjQ+VgyWTpWl/Xf0WE0Vi7zineNUkyQ30
	al2svc8EwKbKvUZtI3fgfzG2H6UaiwWoXkbqbnqRP4QNv3DSt/oRTTs+XFWUlpJBPJKNcqyfiLeTk
	Oo/9ZpTdpRexg9RwA2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ifT-00GF6q-1W; Mon, 27 Jun 2022 06:56:19 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iec-00GEfB-He
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 06:55:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id cw10so17076285ejb.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l8DLyJeTvw1xggLYIHIAs8lG/FP9YwAC/H3QcrJQQbM=;
        b=lfgBG6BcegbTxn3oISBf4RsaDUKM1nhVWAfcGq0zhvN4IJqH7WSK7JFr5tCQyT4LhR
         d3gzqK1269FOcBTTQRj6VW3qzmmFI2wXSc64Nt2UxGUePVjixulD3AFbREgmAsN+lFeL
         HwiLI3JD9ln4Ucm/7OFwUSa0edTyKBYwXARd8flIWAl5vo19z4kdrlu7947/py5QeJYl
         5geBx1o7hjeEa6/y+BjqBlLbb00NtPWXQVfDgYXenyBSH+m2KPcW22e8FAmdWrrzn1Kk
         jK5n1XfVEc+py+OgSpy6lqVFDccn0L+WAbGo6nrf6yeJtVi6tgZY/qojyRLDyAWyox7c
         /g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l8DLyJeTvw1xggLYIHIAs8lG/FP9YwAC/H3QcrJQQbM=;
        b=dNTV746jqQhMvQw0nbJ5aXGCTyi2CCK41iNV4+jAH/fKZxueuyIl/FLMPiuVQMz9/a
         TtwLqzqF+nlxPhy9qvvkRgrGiRVJSnhIz4ZDnPTA3MPlVgDy7N2rANmvl2u6t/YeAJRU
         G+Y6uBfNo1YgdRb3ug46vVNvLMSa/L0oQJoWa/wybLVqMLHsgOc8arBJj8z4d4snf9ZD
         0Mpkvj93w0AYYFBiZlEMoqQNIab2nedKqBurFSwUu3D/b6M/CRrOkbvSFcWs/LO89rZn
         azpwkZCuc9ghwx8DHyKlR1IZT8SMBvjoiCOcCAeR4Y7FAca8iK7qNR6QI03K3+IsVS85
         RAJA==
X-Gm-Message-State: AJIora8cAv3f4l1Aj/Mob5D4l9ssknWE6SI6FTGK/zTPHzKdPi7SW2CO
	JMxxnVHLx5U40KpcEm3wooAjcQ==
X-Google-Smtp-Source: AGRyM1uOrGGFKIKFwX1OUL+TaKzbf/DR/DTxjj1a56xgid+qPv5S8NCnwy6OhwV1/zW1L8jkeok5qg==
X-Received: by 2002:a17:907:60d2:b0:725:5611:cea6 with SMTP id hv18-20020a17090760d200b007255611cea6mr11136755ejc.60.1656312922947;
        Sun, 26 Jun 2022 23:55:22 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e17-20020a170906505100b006fece722508sm4615390ejk.135.2022.06.26.23.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:55:22 -0700 (PDT)
Message-ID: <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
Date: Mon, 27 Jun 2022 08:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor.Dooley@microchip.com, damien.lemoal@opensource.wdc.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: fancer.lancer@gmail.com, tglx@linutronix.de, sam@ravnborg.org,
 mail@conchuod.ie, Eugeniy.Paltsev@synopsys.com, daniel.lezcano@linaro.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 geert@linux-m68k.org, lgirdwood@gmail.com, niklas.cassel@wdc.com,
 dillon.minfei@gmail.com, jee.heng.sia@intel.com, thierry.reding@gmail.com,
 joabreu@synopsys.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, palmer@dabbelt.com, broonie@kernel.org,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@rivosinc.com, daniel@ffwll.ch
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_235526_705048_FBEC59B1 
X-CRM114-Status: GOOD (  15.65  )
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

On 21/06/2022 11:49, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 01:25, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
>>> On 20/06/2022 00:38, Damien Le Moal wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 6/18/22 21:30, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> The k210 memory node has a compatible string that does not match with
>>>>> any driver or dt-binding & has several non standard properties.
>>>>> Replace the reg names with a comment and delete the rest.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>> ---
>>>>>   arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>>>   1 file changed, 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> index 44d338514761..287ea6eebe47 100644
>>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>>>
>>>>>        sram: memory@80000000 {
>>>>>                device_type = "memory";
>>>>> -             compatible = "canaan,k210-sram";
>>>>>                reg = <0x80000000 0x400000>,
>>>>>                      <0x80400000 0x200000>,
>>>>>                      <0x80600000 0x200000>;
>>>>> -             reg-names = "sram0", "sram1", "aisram";
>>>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>>>> -                      <&sysclk K210_CLK_SRAM1>,
>>>>> -                      <&sysclk K210_CLK_AI>;
>>>>> -             clock-names = "sram0", "sram1", "aisram";
>>>>>        };
>>>>
>>>> These are used by u-boot to setup the memory clocks and initialize the
>>>> aisram. Sure the kernel actually does not use this, but to be in sync with
>>>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>>>> kernel work fine with both u-boot internal DT and the kernel DT.
>>>
>>> Right, but unfortunately that desire alone doesn't do anything about
>>> the dtbs_check complaints.
>>>
>>> I guess the alternative approach of actually documenting the compatible
>>> would be more palatable?
>>
>> Yes, I think so. That would allow keeping the fields without the DTB build
>> warnings.
> 
> Hmm looks like that approach contradicts the dt-schema;
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/memory.yaml
> 
> @Rob,Krzysztof what is one meant to do here?

Why do you think it contradict bindings? Bindings for memory allow
additional properties, so you just need to create binding for this one.
And make it a correct binding, IOW, be sure that these clocks are real etc.

Although usually we had separate bindings (and device drivers) for
memory controllers, instead of including them in the "memory" node.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
