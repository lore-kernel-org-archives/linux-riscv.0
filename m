Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04DC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQ8GvxdZ8plQS2QZCAgD5dcMglRmbAUd+qSWZpth28A=; b=s7K9YpWvsPGFnh
	H48mBCPYURGUZXd5pNYuoi+ojQppJzVwK/w7Q7LUBpzXbXYjU47Jh5Bo48umQGI/082uzYl2PTW+g
	OjW5hQkeJHMvnzptrDODgcXw3HiPoA1g3W1Sxxy7PfVk882WJFWtv3GjV8rTukDgwCfCSeGQHQNQH
	PqZv89A+/vIYiOvLbUWxxcLsfyJmf6fm5Q5LHIUvoTuu4G+XWlg+o8dsSmkffyWAWkiAOW00gwAO1
	acOfvUlsFKE9HxI1Vl/ngpNX9EgL4BY35V0e7HdNUq0vEb/IGS6r8fRw63gF9HQcU7u8pwA5mc/VO
	NYPX0zytr34GqoxpHUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRZi-004ZCF-NN; Fri, 12 Aug 2022 10:07:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRZf-004YXo-BS
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 10:07:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id a9so670709lfm.12
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pGicgmrkVGpAXVpWBOOwVqoHRpuAuKtD+Wqhn/gpirk=;
        b=MN1hOu0MvGFfVSNI3SZCMYZgGjhChvjodGSJYoVCvE2Vlkb/G85d1rwBzHEKFU7BoE
         HNrF5VHtjbtSbVBlPWmrHGCzPLPHjYt5HXG7uLbVxTyFZwP0AzOHLXjZFICp8YmJprtC
         gX30SbRsIPIu632N0gevqC3jhBV22xnq7p5vafKxI8sgjHiquWCcPgq61ao8BCM1ZRLy
         fvl11FVIenCL2nYausoYZ3BTaXnAxZX5ZEy3RgIbsRCcA6U2BI3JgqfEKFq/6OYBXH2P
         5IFQbe3/FiF9ph2qjFSK3Nc7prxcUEQrUR7BsYX/1ybOnFr7KYWEB/B3O4KvuP/4zQSt
         qtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pGicgmrkVGpAXVpWBOOwVqoHRpuAuKtD+Wqhn/gpirk=;
        b=f8ytfmUKMBQZGFX1c45JigV4AE9WdyGOzr3BdTMJU18O+3zR8Z8BDJGMd6rMAh2g0y
         bDLgbQwRKZ1Z4q/s8zUibKNEI8RoyXP5Kyxsoc+cTL4s/kSaHXAJlabFEaA9y43rZhmd
         ZaMLn7LfROdOghW6GfZvnzceTHfRTGXJB8uOuDpxj40x6nRlOCl1Z41s1Q5E7eGEJlQF
         44ZiTGvP8tqy/zOug4OBEerQEYiAN6vhn7EOJloPaIyQsF4w2ONB7FIE7bp/THCB49AU
         mGXrQvGT93nIBLtrIQQj8piTWn/IzDILA0kJPWvRGrk0m2/M6TTlTc+RA+c/tX1+y609
         sNXw==
X-Gm-Message-State: ACgBeo0D+ed72OGAV9SVAM9BNWR/OsQFy0JRyW8DFflx2vWFVr8DfCAc
	cbbFGORkVhh6qVEacYUxGidiEg==
X-Google-Smtp-Source: AA6agR7MhLzXhxFMHxvkBaYUjtFOzy1aQfTD91gtSyNkxDgILHvzPNc3FZ2NiCEPl+DJXfmXSUF4vg==
X-Received: by 2002:ac2:44bc:0:b0:48a:eb48:6b78 with SMTP id c28-20020ac244bc000000b0048aeb486b78mr1152514lfm.326.1660298842630;
        Fri, 12 Aug 2022 03:07:22 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id u28-20020ac251dc000000b0048a7c162bbesm155510lfm.279.2022.08.12.03.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:07:22 -0700 (PDT)
Message-ID: <a21c4d34-81b2-cdc5-133e-7c7d2c0657f6@linaro.org>
Date: Fri, 12 Aug 2022 13:07:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] dt-bindings: PCI: microchip,pcie-host: fix incorrect
 child node name
Content-Language: en-US
To: Conor.Dooley@microchip.com, mail@conchuod.ie,
 Daire.McNamara@microchip.com, bhelgaas@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 greentime.hu@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 lpieralisi@kernel.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-4-mail@conchuod.ie>
 <721ccb76-c162-30ee-68cc-3316a2d62554@linaro.org>
 <272557c5-3e30-a873-40af-16a65c3043b2@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <272557c5-3e30-a873-40af-16a65c3043b2@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_030727_469375_F9951C84 
X-CRM114-Status: GOOD (  18.17  )
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

On 12/08/2022 10:55, Conor.Dooley@microchip.com wrote:
> On 12/08/2022 08:42, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 11/08/2022 23:33, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> v2022.08 of dt-schema improved checking of unevaluatedProperties, and
>>> exposed a previously unseen warning for the PCIe controller's interrupt
>>> controller node name:
>>>
>>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>>>          From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>>
>>> Make the property in the binding match the node name actually used in
>>> the dts.
>>>
>>> Fixes: dcd49679fb3a ("dt-bindings: PCI: Fix 'unevaluatedProperties' warnings")
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> This is another one Rob where I feel like I'm doing the wrong thing.
>>> The Linux driver gets the child node without using the name, but
>>> another OS etc could in theory (or reality), right?
>>
>> Yes and we had such cases when renaming device nodes caused regression.
>> My interpretation is that node name is not part of ABI, so anyone
>> depending on it made a mistake and they need to fix their stuff. I think
>> actually that is really poor coding and poor solution to parse device
>> node names and expect specific name.
>>
>> Other folks interpretation is that we never break the users of kernel,
>> regardless what is documented in the ABI... so it depends. :)
>>
>> Here however it is not a device node name, but a property name (although
>> still a node). Bindings require these to be specific, thus such name is
>> a part of ABI.
> 
> Yup, pretty much aligned to my thoughts on this.
> 
>> For your case, I wonder why it was called "legacy-interrupt-controller"
>> in the first place? Node names - also for properties - should be
>> generic, so generic name is just "interrupt-controller".
> 
> I don't know. It's what we had in our internal tree prior to upstreaming.
> "We" don't rely on the name for the Linux driver, so I am not really that
> bothered if we change the binding or the dts.

Then I propose to change the name in DTS.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
