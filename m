Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F3C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OL3I/BZWVoKQfraMZ8Z60K1Q5fg/PLZIhV8ZJFJ7dY=; b=QlmSR6pjcoIAXT
	7q+spw2JMuVmUMHBsSbDNqwVK+K7OPTeinI2B3tqJ8bUh049gdDvRRP7oxCHVliekco4vAAhkduxq
	dizLYyAQTpWN6yEzIrp8s3akJ2vxRXv2IZH9GyazE3kPh79B+GG8X6gmZM5Mo2I5DniGpuDXcJqNe
	tdturcTyIDrtdz4gqHD6uHhygAhNk6K+gyrqRU7YbLNWLbPHRchWAqJJfWQfPmWfcczbHbU7hIcw6
	wMmn0OcVlZj7N+d/xpZOXONHSq01oKKNm4UrshVIuLtqJcf45jwSxNh8/DDHl6OwkF29zbceoPlpf
	ZoA3AzVJQxsYAEAQD14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peA03-008JQc-1G;
	Mon, 20 Mar 2023 07:32:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peA00-008JNw-1M
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 07:32:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 027A824E227;
	Mon, 20 Mar 2023 15:31:39 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:31:38 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:31:38 +0800
Message-ID: <8ee9b662-9e3e-45f7-4074-fc4f84bb2584@starfivetech.com>
Date: Mon, 20 Mar 2023 15:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <9dfc752b-7ae9-5e45-e9e2-50b87dabbca6@linaro.org>
 <adcbc5a7-23e7-9396-a67b-776653e14b8d@starfivetech.com>
 <ccebb1c9-bbf3-8998-6611-8c0046a6e3d6@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <ccebb1c9-bbf3-8998-6611-8c0046a6e3d6@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_003208_625211_D2E9AD4B 
X-CRM114-Status: UNSURE (   7.52  )
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



On 2023/3/20 14:38, Krzysztof Kozlowski wrote:
> On 20/03/2023 07:00, William Qiu wrote:
>>>
>> Originally, I only wanted to add a base module, and the binding of other modules
>> was added as incremental updates by other related colleagues. So now I need to
>> add the complete binding, right?
> 
> Binding should be complete.
> 
> Best regards,
> Krzysztof
> 

I'll add it then.

Best regards
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
