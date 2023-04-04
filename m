Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C68CC76196
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE5uePc2Z5V8tUtBPAnnhyauBlqm2PyPZEhoau1s2XU=; b=kVrpm0oROsGpB7
	yj6AqZkUm97SwzLOwx6iqCGtghCSoGQGjbPB8iLeEE2IDXrngGkjX8PdVxJStUtJ0qyZiY1s6QoHD
	EqlEuf5H7SHVzJJnWH1rObHnyC6Hf8RO972+69P0L9+oWJZASoznpLnKEsdAe6ME6Po1BO97m2+Fq
	5vzErYVcb4JWzoDSko2MfHrS8X0Me9OCTMl1FSns2S3w72eSfyeb84c4x7PNwZNLrkbyd07bYaiGP
	ok0IOW91tquFeSiKzv2bYbCBOuLKGYApodEfnZQH17Uzf4eYblakAb29ph+vGKZHCHXJJ6N9UftEW
	lnfDU44oW8oOfZLHaUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjWGy-00HQew-04;
	Tue, 04 Apr 2023 02:19:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjWGu-00HQdi-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 02:19:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0494C24E251;
	Tue,  4 Apr 2023 10:19:08 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Apr
 2023 10:19:08 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Apr
 2023 10:19:06 +0800
Message-ID: <d7f698cb-5371-25a7-2f44-0132b4d3f63a@starfivetech.com>
Date: Tue, 4 Apr 2023 10:19:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [-net-next v10 5/6] net: stmmac: Add glue layer for StarFive
 JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
	<pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>, "Tommaso
 Merciai" <tomm.merciai@gmail.com>
References: <20230403065932.7187-1-samin.guo@starfivetech.com>
 <20230403065932.7187-6-samin.guo@starfivetech.com>
 <20230403-data-dawdler-afaaaf6fa87c@spud>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230403-data-dawdler-afaaaf6fa87c@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_191944_407687_2AAD3C2C 
X-CRM114-Status: UNSURE (   6.97  )
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


Re: [-net-next v10 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
From: Conor Dooley <conor@kernel.org>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/4/4

> On Mon, Apr 03, 2023 at 02:59:31PM +0800, Samin Guo wrote:
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6b6b67468b8f..a9684b3c24f9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19909,6 +19909,7 @@ STARFIVE DWMAC GLUE LAYER
>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>  M:	Samin Guo <samin.guo@starfivetech.com>
>>  S:	Maintained
> 
>> +F:	Documentation/devicetree/bindings/net/dwmac-starfive.c
> 
> Funny name you got for a binding there mate!

Oh, can't believe I made this mistake, will Fix  :)
Also, are there any other comments?

Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
