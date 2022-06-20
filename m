Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69032C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 22:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AS/RG0Tb1Wr3ixfbA7u/b2oORUDI7RHxN54OS/qwRs=; b=mecqI1sAl0M1OJ
	7heQlRdcMqEYfeTVs23V+lY0idvO7fglcDAANj3MsFuRJxQQHSYxfWqS4lOg2e2SgkN0PcLlO4cz7
	XdZSXmNnzv4+Zej56XzGyAlg2dqq3ybiSnyqves+q5BRtwutPbqzl7y8eqkXWmwUyOZ26j+Xx+HmB
	cOJGOHzXYwVMq3qscEWZkIj+Ap6/OoNrKvSaUfdt0yf+HroSUIUHkfTtzv0rnEpa3ESTJnhlBCvgM
	Iit0QsT+sUD1uRTZqeTPcVShErJ4TqkjixMPGL9XaERywgTRLTeG9hc2sw7oHyiThY2q0qnxNoLzW
	ikWNtUoABNQtDYA9P/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QAQ-002ibJ-RI; Mon, 20 Jun 2022 22:46:46 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QAN-002iZS-Iv
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 22:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655765202; x=1687301202;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXTfHEicD2Q=;
  b=qZgOZM0sOmTVbXWtUcE7JA/shiLtS7x25yIY5cRVmiUhnBkZJKrm+3YH
   SRbI6zOrzLUSz8G2Koje38up8dA8jR9Ur3ydjeMb8mSRjLM03+3SF4UVc
   0XpVPB/zqYfaVUyU43QSkLEWdelyiTXZUDecqXHu8pm7AIlZyCN+lB2jB
   +Vg4c83lCqC6BJw5QRARX/tKcOaER4yI1Yi6TTXUWRLcFdDV+rrZayOc1
   6qxc6qWgI5CLyHolt3Wd4xZEijDmf2Nrw0uUnlXb2dumw8uAYCjw48AuA
   CRgZ6HAoOxopjjN9WsUGEpZg9NCoU0MAtt+Y45lTlZowbsDjvLzfvR1mE
   w==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650902400"; 
   d="scan'208";a="208520278"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2022 06:46:37 +0800
IronPort-SDR: bdHO+baln/wZeTBD/ibWMFgiQtvBPBZlkx2Op0cR3/hsconzFa6yHJYJw5Jv/A2HSz0lmFEOoV
 S6xQqwkpBbxrq9BBZTNPuvpm7WK+KimrofZHt3V9ta4CmWFiKa7l302/lPzwDOOYePJjaohAYY
 e58LUvy7LpefgrItRCivzESoYJjl+yTiRqmqSfDuyiKmta+qJrYjIlDj3PTzvILXF4edC76wdO
 HbHlIdu6wkstfcvF3zpVjIOoxJJuleaEzBaaq+lOOjImQSemmbqWJiEQKVozp2UfS7VmGh0go6
 pgZ6+CP48wfMePAmOIYC/1BU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 15:04:46 -0700
IronPort-SDR: CLGglBi6ShEqZJDV7sKnL14aJrboQcH6fL2fan7AOEnOhhungdh++4M59Wf1Y7wvm1EXNSFaQh
 C+wZmNWErJE729uh5tcSN2w9VxCa6PKU1lizQwHwWLY6xC2L11SSWIizHOyXa95nnBE+iTElNw
 DcVQMWxMwnzp5ibnupq3K7NqnYh2knrox1DwNTLhFCHTEXibsDJ/ZSQxdg9IK9yiuzQgLVzIHK
 QRwCrgguQuMXvNnoAGjNfcWN1nxxQL91WWmdu1YHuhF3ry9jcbvhkY4gjTO4Q7bVozQXWEU5If
 Rp0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 15:46:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRlBQ0Mlxz1SVny
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 15:46:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1655765196; x=1658357197; bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXT
	fHEicD2Q=; b=Lhr+G2WQqfFETrRVbPoA42VhoL4exbeW+icqCZ0jwVxJhg3CSZ/
	dUE6HVuOJ7MGXskvgzZI8kOSwDmY9bZb8zCPvhEsDQsYMkx1d/w+udifSdHRrPhW
	iqrZcUBxGY0AcruBv081/qgu8EdR07l0tTnt1WAVREfgI01BrJXxIJjRKaE3riKw
	qJeHgC3UvCHNiYfXgjSZyhxr47GErsONq7UojQm3JgrIqtzZmTCSOjMwrlNLScIV
	b0SFTbmO5VS9zAHLAv0xt4daAIYk2YJ1kFHMcHYR67uT3EC2qXpMKcKINJm6wv1S
	TNC/wKuUcCFxuQvsnrh1LA11vaJODLe2QoA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9hjs-Qyr7K6a for <linux-riscv@lists.infradead.org>;
	Mon, 20 Jun 2022 15:46:36 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRlBG25pSz1Rvlc;
	Mon, 20 Jun 2022 15:46:30 -0700 (PDT)
Message-ID: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
Date: Tue, 21 Jun 2022 07:46:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Conor.Dooley@microchip.com, fancer.lancer@gmail.com, mail@conchuod.ie
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
 sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, daniel.lezcano@linaro.org,
 palmer@dabbelt.com, palmer@rivosinc.com, tglx@linutronix.de,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 geert@linux-m68k.org, niklas.cassel@wdc.com, dillon.minfei@gmail.com,
 jee.heng.sia@intel.com, joabreu@synopsys.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_154643_685671_6B20A1FE 
X-CRM114-Status: GOOD (  22.13  )
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

On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 21:56, Serge Semin wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>> this.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> index e25d44c218f2..f2b9e3f062cd 100644
>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> @@ -135,19 +135,41 @@ properties:
>>>        of the designware controller, and the upper limit is also subject to
>>>        controller configuration.
>>>
>>> -patternProperties:
>>> -  "^.*@[0-9a-f]+$":
>>> -    type: object
>>> -    properties:
>>> -      reg:
>>> -        minimum: 0
>>> -        maximum: 3
>>> -
>>> -      spi-rx-bus-width:
>>> -        const: 1
>>> -
>>> -      spi-tx-bus-width:
>>> -        const: 1
>>> +if:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: snps,dwc-ssi-1.01a
>>> +
>>> +then:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 4
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 4
>>> +
>>> +else:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 1
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 1
>>
>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> 
> 8 too? sure.
> 
>> irrespective from the compatible string. The modern DW APB SSI
>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>> run-time there is no way to create a DT-schema correctly constraining
>> the Rx/Tx SPI bus widths. So let's keep the
>> compatible-string-independent "patternProperties" here but just extend
>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>> properties values.
> 
> SGTM!
> 
>>
>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>> activated by means of the corresponding CSR. So most likely the DW AHB
>> SSI controllers need some specific setups too.
> 
> hmm, well I'll leave that up to people that have Canaan hardware!

I will test this series.

> Thanks,
> Conor.
> 
>>
>> -Sergey
>>
>>>
>>>  unevaluatedProperties: false
>>>
>>> --
>>> 2.36.1
>>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
