Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA69FC76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 01:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlyJeZt2Ta1QR3Uan0eKRaiHfmj98AfecPKHHdaSeYk=; b=t+3igFSzAIvNft
	5IhcXoheBa9XhCBiefT/7j2jBfobTtKUtv+J8bVnjZaTegOxTsKme9XF2mNQbcCNePZAGymKGX6km
	lQS56SjNKIMfLBvPK0SR/T8a9Fj7WXz0HVyziZTo8Rgs76DDiScNalFQmbmcId2q/FX5ln02ujzhy
	cFAhQ8MdITIYcqyeGO+phpxeCSKo7IUjpTSSJ7/D6yVZu16WMxvM+oK++0YJbfvxEbfjpqwwsUwZP
	oiAB3oP/xgsd7NnmLIsP9X3HXJEkXUQ0OvYTg0xEPMhYRGmA8zW2ixSS+S5ya8gNCa5F+kL2y0CV+
	8kK9euQJa5sp7Y7QSWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgy9J-00CmiK-1z;
	Tue, 28 Mar 2023 01:29:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgy9F-00Cmh3-1R
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 01:29:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 565F824E28D;
	Tue, 28 Mar 2023 09:28:50 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 09:28:50 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 09:28:49 +0800
Message-ID: <19c7497a-d98f-d46f-2912-8ff69276d7d6@starfivetech.com>
Date: Tue, 28 Mar 2023 09:28:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
 <20230324022819.2324-5-samin.guo@starfivetech.com>
 <20230324192419.758388e4@kernel.org>
 <b20de6ba-3087-2214-eea2-bdd111d9dcbc@starfivetech.com>
 <20230327173802.0ceb89df@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230327173802.0ceb89df@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_182917_632045_B64894C4 
X-CRM114-Status: UNSURE (   7.59  )
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


Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
From: Jakub Kicinski <kuba@kernel.org>
to: Guo Samin <samin.guo@starfivetech.com>
data: 2023/3/28

> On Mon, 27 Mar 2023 09:53:22 +0800 Guo Samin wrote:
>> Thanks,  I will resent with [PATCH net-next v9].
>> My series of patches will depend on Hal's minimal system[1] and william's syscon patch[2], and this context comes from their patch.
>>
>> [1]: https://patchwork.kernel.org/project/linux-riscv/cover/20230320103750.60295-1-hal.feng@starfivetech.com
>> [2]: https://patchwork.kernel.org/project/linux-riscv/cover/20230315055813.94740-1-william.qiu@starfivetech.com
>>
>> Do I need to remove their context?
> 
> If the conflict is just on MAINTAINERS it should be safe to ignore.
> Resend your patches on top of net-next as if their patches didn't
> exist. Stephen/Linus will have not trouble resolving the conflict.

I see, I'll send net-next as you suggest.

Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
