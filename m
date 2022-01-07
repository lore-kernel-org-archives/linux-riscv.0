Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3105FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NYw4xO/sPbtUjGXPh5dAh+eON1tTX9lnZAijEUYgNd0=; b=TY00XrMEyNMPNvwSfHbBmH04+i
	riVQhEkilznZ+0Mpr+VRcLGT8LzDUbb6CEKBqONiJUwChv1aDe7LpefO1CjESJ6KXohtxFUjeI5cd
	cUT8vI7047y/6sNui/p3qzidRz69uisI61B2DX2nBaJYKD67lGU8tXEHhh9aKjvIUQSvq5ISh32dP
	NPpmKCTDtN+W3UzA/AeBrkNrOcpwyBmtG3wj06Qu9Wfu2SOmc5mn5jzvp4apqBqq7k0eozPBA71Q5
	fND5KLi1GEoA4kZFZIbDhBxO2kOvRs5BbzqwwmLO+Ac1u7zXrQP0zGzKpLG1d5rexhc6x2wJke9Pj
	8ifX9Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5s7o-004e11-Aa; Fri, 07 Jan 2022 16:29:56 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5s7l-004e0Q-5h; Fri, 07 Jan 2022 16:29:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 207GTWdY126346;
 Fri, 7 Jan 2022 10:29:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641572972;
 bh=gSPa2SrN3YqB2RHUn1JNHASwQpxAuZUnLG52GBxt0Yg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MQOUv676jgbtfoWqniRW7KLxTX7A9n1bLd9Z69Xp6udLs91KhMVg1QG+avjqYHped
 0Ja1d7ORgD9PT6zqJiEEUMcDTCYDjP0WrPJBNR0eknL4hdQUPwdnCarQ63770u3c9K
 tUWddqEeuiK82jmgg4MTVDeLLjtXsmesyaqcWE4c=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 207GTVuI030190
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jan 2022 10:29:31 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 7
 Jan 2022 10:29:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 7 Jan 2022 10:29:30 -0600
Received: from [10.249.36.164] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 207GTU8O054945;
 Fri, 7 Jan 2022 10:29:30 -0600
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <michal.simek@xilinx.com>,
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, Kumar
 Gogada <bharat.kumar.gogada@xilinx.com>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 netdev <netdev@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Nagalla, Hari" <hnagalla@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 Vignesh R <vigneshr@ti.com>
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
 <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
Date: Fri, 7 Jan 2022 10:29:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_082953_342753_9A9A8D52 
X-CRM114-Status: GOOD (  27.26  )
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

Hi Rob,

On 1/7/22 9:20 AM, Rob Herring wrote:
> On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 1/6/22 9:19 PM, Rob Herring wrote:
>>> 'interrupt-parent' is never required as it can be in a parent node or a
>>> parent node itself can be an interrupt provider. Where exactly it lives is
>>> outside the scope of a binding schema.
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>>>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>>>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
>>>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>>>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>>>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>>>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>>>  7 files changed, 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> index 9ad470e01953..b085450b527f 100644
>>> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> @@ -43,7 +43,6 @@ required:
>>>    - gpio-controller
>>>    - interrupt-controller
>>>    - "#interrupt-cells"
>>> -  - interrupt-parent
>>>
>>>  additionalProperties: false
>>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> index e864d798168d..d433e496ec6e 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> @@ -175,15 +175,6 @@ required:
>>>    - ti,mbox-num-fifos
>>>
>>>  allOf:
>>> -  - if:
>>> -      properties:
>>> -        compatible:
>>> -          enum:
>>> -            - ti,am654-mailbox
>>> -    then:
>>> -      required:
>>> -        - interrupt-parent
>>> -
>>
>> There are multiple interrupt controllers on TI K3 devices, and we need this
>> property to be defined _specifically_ to point to the relevant interrupt router
>> parent node.
>>
>> While what you state in general is true, I cannot have a node not define this on
>> K3 devices, and end up using the wrong interrupt parent (GIC
>> interrupt-controller). That's why the conditional compatible check.
> 
> But you could.
> 
> The parent node can have a default interrupt-parent and child nodes
> can override that. It doesn't matter which one is the default though
> typically you would want the one used the most to be the default.
> Looking at your dts files, it looks like you all did the opposite. 

Hmm, I am not sure I understood your last comment. Can you point out the
specific usage?

All our K3 dts files have the interrupt-parent = <&gic500> defined at the
root-node, which is the default ARM GIC.

Let us know if we need to fix something in our dts files.

The
> only way that wouldn't work is if the parent node is if the parent
> node has its own 'interrupts' or you are just abusing
> 'interrupt-parent' where the standard parsing doesn't work.

All our K3 gic500 nodes does have an 'interrupts' property.

> 
> You are also free to use 'interrupts-extended' anywhere 'interrupts'
> is used and then interrupt-parent being present is an error. 

Yes, this is understood. The OMAP Mailbox binding is reused between multiple SoC
families, some of which do not use an Interrupt Router in between.

So, whats the best way to enforce this in the specific schema? I have used the
common 'interrupts' property that applies to all SoCs, and enforced the
conditional 'interrupt-parent' only on relevant compatibles.

regards
Suman

How you
> structure all this is outside the scope of binding schemas which only
> need to define how many interrupts and what are they. Ensuring parents
> and cell sizes are correct is mostly done by dtc.
> 
> Rob
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
