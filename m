Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D6EC10F1E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPdsIvAV/NTVZf6Z9YRKGsQ7c3ZtZX1BhpyK4dnoOjY=; b=F0/CAPGC3oguZL
	dPuV6k3zRq7jmx0bLMFa6Oz+o+w9wUPlQ3j9MivnXuMl8fq4xnzQoRD9O2yagj1zUH3PrAc834oiO
	MS1AzHRnWPZmT+Ec9onH0GICmX8+kvFMMz2S+OrX54YY23p0iJjCxjyUCAe5CWGc/Y/NX+C1TCXmM
	chfDdeHgpWj+FYdHLVIDrlmEShoRdbST7FQft6DaElIcuvRnnE5ZpRVcg4ITbZ/qNaoH7gslS40Fh
	GaN51rPfpyBd5+IsecC0wl7ocA4/OJubmXmUbqjlPPVRQE58z7PHu66GjQ/7tl5fD1iLgdnVHIbCl
	94o9I5NU79AfatF7PUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7WZv-00AZms-Rs; Tue, 20 Dec 2022 06:58:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7WZs-00AZcg-Bx
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 06:58:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4C36D24E023;
	Tue, 20 Dec 2022 14:57:53 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 20 Dec
 2022 14:57:53 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 20 Dec
 2022 14:57:51 +0800
Message-ID: <55c5d310-f3cd-3cff-8846-f5c242a4d6c6@starfivetech.com>
Date: Tue, 20 Dec 2022 14:57:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/9] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-5-yanhong.wang@starfivetech.com>
 <a8e09f78-704f-13f0-15ad-6c6dca6997f3@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <a8e09f78-704f-13f0-15ad-6c6dca6997f3@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_225816_818778_2C4F01B1 
X-CRM114-Status: UNSURE (   4.91  )
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



On 2022/12/16 19:06, Krzysztof Kozlowski wrote:
> On 16/12/2022 08:06, Yanhong Wang wrote:
>> Add documentation to describe StarFive dwmac driver(GMAC).
>> 
> 
> Subject: drop second, redundant "bindings for".
> 

Thanks,  i will fix.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
