Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61627C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNmurm5KosWhMI6yMzQ/2d4ccF3jwjd3hLQmNxftvPk=; b=W4VBjUD06jH/m2
	N+dd1rWA8KRhBvYpnNrw+fce3JqO22Tyc/uF7Jpn98+PUnxbNQsd3/CsoHc1HMRN6y3ysFP9Gz1v9
	o7JXTDvIvk/k2Zka87eVFGaJXZTCCNdMXwC37RJ9GvZb7pe2oedxHwmq96Imj1YI57IJQeMcqq5qe
	KkpDhv+7RaUEsbRi1ErAXQxEx7gb+N513iB+xL3hZ48ki8nyklsQueshW2esj/i43FE+ekWbxJwTV
	keJ3EVehhtpTNvyein39RrWSY9y6U/oy9ElRFubHmuhm4kFCenOH8/yIRHkIC5ESd1SnHm0MVJ9tS
	zIW5J1zmcN4mlu3STGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFFc-0067xY-0y;
	Thu, 06 Apr 2023 02:21:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFFY-0067vT-0H
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 02:21:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C69C124E25E;
	Thu,  6 Apr 2023 10:20:53 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 10:20:53 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 10:20:53 +0800
Message-ID: <42bdb4e2-bb18-5e4d-f6fb-68564c89efee@starfivetech.com>
Date: Thu, 6 Apr 2023 10:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
 <e38efd81-9c79-553b-7556-7aff30f6ec50@starfivetech.com>
 <f25cc55e-3405-4b17-fb45-5ae5eb36a404@linaro.org>
 <d0b1d44e-6d6e-536c-046e-be6a53f1d240@starfivetech.com>
 <20230405-bullseye-handsaw-5c2e4dab772f@spud>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230405-bullseye-handsaw-5c2e4dab772f@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_192120_445191_7CF4FA69 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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



On 2023/4/6 0:38, Conor Dooley wrote:
> On Mon, Mar 20, 2023 at 03:32:14PM +0800, William Qiu wrote:
> 
>> >>> Does not look like you tested the bindings. Please run `make
>> >>> dt_binding_check` (see
>> >>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> >>>
>> >>> ... or your PLL clock controller was not tested.
>> >>>
>> >>> Best regards,
>> >>> Krzysztof
>> >>>
>> >> Hi Krzysztof,
>> >> 
>> >> I've already done`make dt_binding_check`, and get no error. So maybe PLL clock controller
>> >> was not tested which I didn't add in this patch series. And PLL clock controller belongs
>> >> to Xingyu Wu, I would tell him.
>> > 
>> > What's confusing you do not allow here clock controller.
> 
>> I'll add it then.
> 
> What's the plan here William?
> Can you sort something out with Xingyu Wu so that the dt-binding is
> added in a complete manner?
> In the meantime, gonna drop this series as "Changes Requested" from
> patchwork.
> 
> Cheers,
> Conor.

Hi Conor,

After discussing with Xingyu, I will sort all of it and send a complete
dt-binding today.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
