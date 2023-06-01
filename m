Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934DFC77B73
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 01:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EeO4pccYXh/rXKljxjrbmFKibR3aYGJ3UknwBRE8Eg=; b=MiQZezj/iRM4k6
	gg4n4IMfklYhPCA1RTsxkN/bB1J711672txWJx5DAioxce3TdElZjnMF9peBHqQrBZHjC5pFt4lhb
	jHu5l4ynoryUYaR0KsvIigM+ZlK3gkzdGV/pxwXG+XjleezAP+O6jjfsLnjmp+oudzgfqUfthNSS5
	0AL/MYL0ue3BLCO5zOvYMdqENTq5kF/nKuIVGHW/ObxT9i8VWYrSmjxpQu6rYGl03VUCUWo8vJoJX
	rXiZAXBj5R21oPqZiP6ZL63ZfYjXHOppdeBwYXOgKx974KzV5b9ZXA/LBJNlLBTWtIHMZ5HdwYTAj
	hIb8AS8CQa8qJyehyC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4XVA-001fhf-2z;
	Thu, 01 Jun 2023 01:53:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4XV6-001ffg-3B
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 01:53:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 30F6F24DB86;
	Thu,  1 Jun 2023 09:52:41 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Jun
 2023 09:52:41 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Jun
 2023 09:52:39 +0800
Message-ID: <9d24d50e-f5d1-f08c-1318-46497cec293d@starfivetech.com>
Date: Thu, 1 Jun 2023 09:52:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
To: Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-3-william.qiu@starfivetech.com>
 <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
 <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
 <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
 <eb68722b-bcab-4aa1-aa4e-54bfe95ef414@sirena.org.uk>
 <93ba0b97-45aa-e59d-1454-80c4f245acc0@starfivetech.com>
 <075db1ba-e15c-4c3c-9430-99c866eca24d@sirena.org.uk>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <075db1ba-e15c-4c3c-9430-99c866eca24d@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_185317_200487_8CB2A6EC 
X-CRM114-Status: GOOD (  14.04  )
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



On 2023/5/31 21:20, Mark Brown wrote:
> On Wed, May 31, 2023 at 02:19:16PM +0800, William Qiu wrote:
>> On 2023/5/30 18:33, Mark Brown wrote:
> 
>> > You could always specify a different array of clocks depending on which
>> > compatible the driver sees, just like you'd conditionally request clocks
>> > individually.
> 
>> 	If specify a different array of clocks depending on which compatible
>> the driver sees, since there will also be clock operations in the suspend
>> and resume interfaces, this can make the code look complicated.
> 
> If you store the clock count and array in the driver data that should be
> fairly simple I think.
> 
>> 	as following:
> 
>> 	/* Obtain QSPI clock. */
>> 	cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
>> 	if (cqspi->num_clks < 0) {
>> 		dev_err(dev, "Cannot claim QSPI clock: %u\n", cqspi->num_clks);
>> 		return -EINVAL;
>> 	}
> 
>> 	This way, the code will look simpler and clearer. How do you think
>> about it.
> 
> I'm not clear how enable and disable would then work?

enable use this API:
clk_bulk_prepare_enable(dev->num_clks, dev->clks);

then disable:
clk_bulk_disable_unprepare(dev->num_clks, dev->clks);

But I'll first try specify a different array of clocks depending on which
compatible the driver sees first.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
