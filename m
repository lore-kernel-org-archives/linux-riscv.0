Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B32EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 10:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXzQ49uMMAukYQ6n6460/F+2wWaNh9Z3h+X0kzo4dMo=; b=vrqjMOvb2Wwy4T
	kGbOJfhaGwdx6qS7AQvqpDcjWNHsnCP+rGY9UlI9BCSgFxb6o274K8Da4af+JphvgK7VSgYd3QtzB
	a2I/C4vA3CC+nAhx2IFvnfSR0n6BmhiOSlaTyPRMBsDqbB4KMbX5VWCgaQQPk/OFXWtnbeouJ7bpk
	ZH1wJb7TqELhPPJks1VBcMOto1nA5lQZRmDT29VWd+XstRyTkCkQSr4/j2z7jC55lxg8hhX0hNGSY
	XBoQT8o4fDS1G3bFEKmwBAIeAV7zae/GT+gF2VuixQhM5OaqtjypKexdnG/AcPz4OZDCG7mwrHZ+e
	CXbmyoYHKlzU2DzgiIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATxb-004BfL-MI; Wed, 28 Dec 2022 10:46:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATxZ-004BYD-Bk
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 10:46:59 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B50BC24E133;
	Wed, 28 Dec 2022 18:46:26 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 18:46:27 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 18:46:25 +0800
Message-ID: <b828357c-81b3-870b-a658-02bf8cfad47c@starfivetech.com>
Date: Wed, 28 Dec 2022 18:46:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] StarFive's SDIO/eMMC driver support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@linux.starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20221227115856.460790-1-william.qiu@starfivetech.com>
 <02e8c75f-658f-320c-7c90-64ccf2beccbe@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <02e8c75f-658f-320c-7c90-64ccf2beccbe@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_024657_632196_DE1F356C 
X-CRM114-Status: UNSURE (   9.66  )
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



On 2022/12/27 21:07, Krzysztof Kozlowski wrote:
> On 27/12/2022 12:58, William Qiu wrote:
>> Hi,
>> 
>> This patchset adds initial rudimentary support for the StarFive
>> designware mobile storage host controller driver. And this driver will
>> be used in StarFive's VisionFive 2 board. The main purpose of adding
>> this driver is to accommodate the ultra-high speed mode of eMMC.
>> 
>> The last patch should be applied after the patchset [1]:
>> [1] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/
> 
> It's a duplicate? Why do I have two of them in mailbox? Isn't this v3 then?
> 

Hi Krzysztof,

Sorry about that. I usually use a script to send emails. The first email was 
sent to the wrong person, so I corrected it and sent the second one.

Best regards,
William Qiu

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
