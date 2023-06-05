Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E1C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvhWa+ZoN54dTRwEaE2WANA9ubw6LTRuzIBeSQFGN4Y=; b=flrLTNAdETqQFm
	+uhxzYRl2BNms0UvlK6eCGBhTdxU3AZShJ4hxA4lCXS93Xraw8yc1YV+vsBUTXZbjL2f2FDxqiaRp
	FuyQmakQqVd48pOw5LNTSFWEBL0JVPASg4752Y1Yp+KgtPo3E64CuTXzh3HK1duJJy7ihe/S2CqTG
	AWidqhVJ8oMNn4LZzYwp/bosKr4Zwh+5kgePcCmk/wfpGiBVHx7cHIRtO6H+48rif9+Rbv5FAX2I8
	MD5K5ZnI/vKsBEiy9ri9bTqBSKhlBP17i7UvsKyZ8gLDhyQzOJAMmpAVE2iE/66dek+CxrAryRYcu
	g470lDNYkWTx9s7G+/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66ee-00EsTh-29;
	Mon, 05 Jun 2023 09:37:36 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66eY-00EsRq-38
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 09:37:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2E89C80C4;
	Mon,  5 Jun 2023 17:36:52 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Jun
 2023 17:36:52 +0800
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Jun
 2023 17:36:52 +0800
Received: from EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8]) by
 EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8%16]) with mapi id
 15.00.1497.044; Mon, 5 Jun 2023 17:36:51 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add JH7110 cpufreq support
Thread-Topic: [PATCH v3 0/3] Add JH7110 cpufreq support
Thread-Index: AdmXkDPLZg25EWWrSjqYc22BpOYTbg==
Date: Mon, 5 Jun 2023 09:36:51 +0000
Message-ID: <c5bde0d92d514250a21120ed33e0f6b2@EXMBX067.cuchost.com>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
 <457c35b5-aec4-1147-673f-947052b5f944@starfivetech.com>
 <20230505-gusty-corset-e451d947c10d@wendy>
In-Reply-To: <20230505-gusty-corset-e451d947c10d@wendy>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [183.27.98.75]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_023733_616468_6BA51B17 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Conor,

> On Fri, May 05, 2023 at 09:38:38AM +0800, Mason Huo wrote:
>> Hi Conor & Shengyu,
>> 
>> Thanks for your review, and is there any comments about these v3 patches?

> Firstly there appears to have been some mess-up with the driver/bindings for 1/3, so I am waiting to see if the binding gets reverted before doing anything and secondly it's the merge window so I can't do anything about 3/3 until next week.
> 
> Cheers,
> Conor.

Could you help to check if this patch can be moved on?

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
