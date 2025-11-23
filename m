Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E1DCFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbSu9iREQMNJSJsUQYPI4Irmdi6L97HUJd1QX/pJKYg=; b=Y2YLcYIMyNuGoU
	Vo/znLDa1kQQWb9Z9JKiwJTDtOHjPGYDw5kea+M86IB6vUtQ6nSJ9Nb3nDOF06MaEf4hqdaaI0HXx
	ho2mdLk7D4h9Q/zHzPlPtWF3b5MC3W8WDu1tdhf9y4xqeWe+RCUgq1wEWs0qgVnoiSO+9dugoyM8x
	C4vGErgjTlXPqxjxPUdYcQkamStFyymoaPzI9AgQzyyq0aObobJD6cJEsMBCuY3GfniytjGNZhC6K
	ROEOKfo3+grxp6pfjNfcb0wKbIn0Cxv1JLgOkeLYbcmdlAFhZoqJWlkMdXE1tW9hIkHkFl6044z5z
	9kgjn6PHlZXJdrnziOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNBA9-0000000AUCG-2FBw;
	Sun, 23 Nov 2025 14:34:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNBA8-0000000AUC8-22k1
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 14:34:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D2260197;
	Sun, 23 Nov 2025 14:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E5AC113D0;
	Sun, 23 Nov 2025 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763908438;
	bh=rPIHMk5IxdwCxWHJw0zdrEvCa5CvnaA+RTp2fmmGm2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c2QfqaDN3R6GFo/jC7Kn7Eb2apHnuMtzy9qU3IkOQtsaTySQ9JW0q36ga6HxmoaFg
	 /g0TwkXufsiyOaUMvt4OME0LnSja5Cez3VDEme9en8LQhOQI+z8PLx6vAds6GZvH/G
	 LjrPWOYNrW6XBQY+zBv2Sa0ujteFZ3z/1K2tt5Tf1HG8VBBlYng/8n2Ue54WpI8ood
	 avgIv9L1HCgCUm1ak5g4cV4uN4N09DwP/5kIPyFLaPtyFzI/F9wCq278K+5MnjlvTe
	 lmegrQcUSw0Xkl2iZ9QuqjTGuxdy2nIy/cocUhqZoa8I7lOE0Dces70WNQw1BhBKwC
	 iWB1JT1EUMUvg==
Message-ID: <83ba64bf-ce77-4a3f-a6df-ff80c5efbc99@kernel.org>
Date: Sun, 23 Nov 2025 15:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
To: Hal Feng <hal.feng@starfivetech.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 E Shattow <e@freeshell.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-2-hal.feng@starfivetech.com>
 <xxswzi4v6gpuqbe3cczj2yjmprhvln26fl5ligsp5vkiogrnwk@hpifxivaps6j>
 <ZQ2PR01MB1307A802B916620235B87518E6D52@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ZQ2PR01MB1307A802B916620235B87518E6D52@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
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

On 21/11/2025 05:23, Hal Feng wrote:
>> On 12.11.25 21:54, Manivannan Sadhasivam wrote:
>> On Thu, Nov 20, 2025 at 04:29:42PM +0800, Hal Feng wrote:
>>> Add enable-gpios property for controlling the PCI bus device power.
>>> This property had been supported in the driver but not added in the
>>> dt-bindings.
>>>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> Fixes: 22fe32239770 ("dt-bindings: PCI: Add StarFive JH7110 PCIe
>>> controller")
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml         | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>>> b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>>> index 33c80626e8ec..1e36f92ec852 100644
>>> --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>>> +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>>> @@ -59,6 +59,10 @@ properties:
>>>      description:
>>>        The phandle to System Register Controller syscon node.
>>>
>>> +  enable-gpios:
>>> +    description: GPIO used to enable the PCI bus device power
>>
>> This feels wrong to me. Is this GPIO associated with the PCIe controller? I bet
>> this is just controlling some regulator that powers the VDD of the PCIe
>> device/slot. If so, this should be added as a part of the regulator node and
>> referenced in the PCIe node using the existing -supply properties.
> 
> This GPIO just controls the power of PCIe devices, not PCIe controller.
> I think there may be no design adding power control GPIOs for the PCIe controller,
> because usually we don't need to control the PCIe controller power but the PCIe
> device power.

So this is not PCIe controller enable gpios...

> 
> I find a similar "pwren-gpios" in
> Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml .
> It uses the GPIO to control the power of PCIe devices too.
> 
> Could I continue to do so? Thanks.

No. You already got response what you are supposed to do. Please read it.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
