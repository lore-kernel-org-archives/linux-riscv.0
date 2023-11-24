Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143B6C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYgN5+KQYjx0CGnk4TRyjCCfr1Ye4HMFVqMlIPp7Xxw=; b=3KYFdzabbmBHdx
	E6cK01o4bSdqWFfL7OUM73ac/3oAJlkKeyVnU9An3PzCPW41U1Yna06gf2N2Ef0gl7WdRVBkjM+fS
	EYIDWxCGmKA/E3BgeKh1eGG0zL/IvWo2nuQpnU7NiDx+OZQfbT5zQWJ1apw2CA1NP1thHLwdVJdL8
	mNVWyWm3fGeZTjnd4jOp2rK+UbX11ZXcvBl32QgxsfdDUqoJfNwT2SWN8WtqtygwqNxN9ik4tIat3
	VXLKG6zWs5UV0QOm6IoDGcXoPxEMHlwVKtDGYOdIL2S1GD5Gqu9F3sQrCjqEQcWpruQiQXUgHX4SC
	v/uNKPAgV6VUIKRMQFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QmW-006PHF-02;
	Fri, 24 Nov 2023 07:39:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QmT-006PFZ-08
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:39:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C8E1B24E309;
	Fri, 24 Nov 2023 15:38:44 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Nov
 2023 15:38:44 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Nov
 2023 15:38:43 +0800
Message-ID: <701877bd-313f-4604-a398-76a143f009d6@starfivetech.com>
Date: Fri, 24 Nov 2023 15:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: Add OpenCores PWM module
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Hal Feng <hal.feng@starfivetech.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-2-william.qiu@starfivetech.com>
 <afce202d-6234-4c5f-9018-facd9a56b5eb@linaro.org>
 <f4551a7a-61e6-4d97-94c2-da2e4e9e8cb3@starfivetech.com>
 <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
 <20231113-sprung-tantrum-94659009b9d4@squawk>
 <1ba3e8d1-ed89-4aab-ae27-d8d31ee2f150@starfivetech.com>
 <20231122-jokester-reapply-eb000d976d56@spud>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231122-jokester-reapply-eb000d976d56@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_233917_400538_CB175D10 
X-CRM114-Status: GOOD (  26.60  )
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



On 2023/11/23 1:36, Conor Dooley wrote:
> On Wed, Nov 22, 2023 at 03:03:36PM +0800, William Qiu wrote:
>> 
>> 
>> On 2023/11/14 4:17, Conor Dooley wrote:
>> > On Mon, Nov 13, 2023 at 09:07:15PM +0100, Krzysztof Kozlowski wrote:
>> >> On 13/11/2023 10:42, William Qiu wrote:
>> >> > Will update.
>> >> >>> +
>> >> >>> +allOf:
>> >> >>> +  - $ref: pwm.yaml#
>> >> >>> +
>> >> >>> +properties:
>> >> >>> +  compatible:
>> >> >>> +    oneOf:
>> >> >>> +      - items:
>> >> >>> +          - enum:
>> >> >>> +              - starfive,jh7100-pwm
>> >> >>> +              - starfive,jh7110-pwm
>> >> >>> +          - const: opencores,pwm
>> >> >>
>> >> >> That's a very, very generic compatible. Are you sure, 100% sure, that
>> >> >> all designs from OpenCores from now till next 100 years will be 100%
>> >> >> compatible?
>> >> >>
>> >> > My description is not accurate enough, this is OpenCores PTC IP, and PWM
>> >> > is one of those modes, so it might be better to replace compatible with
>> >> > "opencores, ptc-pwm"
>> >> > 
>> >> > What do you think?
>> >> 
>> >> Sorry, maybe this answers maybe doesn't. What is "PTC"?
>> > 
>> > "pwm timer counter". AFAIU, the IP can be configured to provide all 3.
>> > I think that William pointed out on an earlier revision that they have
>> > only implemented the pwm on their hardware.
>> > I don't think putting in "ptc" is a sufficient differentiator though, as
>> > clearly there could be several different versions of "ptc-pwm" that have
>> > the same concern about "all designs from OpenCores for now till the next
>> > 100 years" being compatible.
> 
> Perhaps noting what "ptc" stands for in the description field would be a
> good idea.
> 
I will add.
>> After discussion and review of materials, we plan to use "opencores,ptc-pwm-v1"
>> as this version of compatible, so that it can also be compatible in the future.
>> 
>> What do you think?
> 
> Do we know that it is actually "v1" of the IP? I would suggest using the
> version that actually matches the version of the IP that you are using
> in your SoC.
> 
> Thanks,
> Conor.

There is no version list on their official website, so it is not certain whether
it is v1, but at least the driver is the first version.

What do you think is the best way?

Thanks,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
