Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996FFC07E98
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4K6h4Ijy5l3+SchyeRrL083r1/TaAR9IgKaCBHiO9k=; b=eV0nuR0iSD2vwM
	AxNiKOnrRSbMiTysc+p+FC6wLeSV2z0AHS/hvUWKq3k11HHsd0QPn0PZ1QWA2zHpjLWImo8Hr9ezD
	0ar/zpxEYBJd0Ls5zffbyxOO+ZAPu4lr2HJiNxmSwdJqcF4GOn4Uco66wcSENV2NqLRxEPwOAH3C4
	dreW+b38JdbMztEQ+VJpS0nrhvtq9pwvfTQPFcmwZVE2857mufJMNwBkDcRRU7sTHF5xhoOWGcCXt
	Li+mtTyXaDjEFnEBZ7BAxjKy6zZ2bkJXWw6qLRASbs5lln/dZztxMOlR6UGa8DtHSqNG/Lf5TTbbD
	KcHklCgQlJHQowjSLlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7sxg-004T2w-1a;
	Tue, 28 Nov 2023 07:56:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7sxc-004SyK-1H
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 07:56:50 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 42B7924E2A8;
	Tue, 28 Nov 2023 15:56:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 15:56:16 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 15:56:15 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Nov 2023 15:56:15 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor@kernel.org"
	<conor@kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "emil.renner.berthing@canonical.com"
	<emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH 3/7] dt-bindings: timer: Add StarFive JH8100 clint
Thread-Topic: [PATCH 3/7] dt-bindings: timer: Add StarFive JH8100 clint
Thread-Index: AQHaINIiROvFaqRrFUS69iv/KsB43rCNVRYAgAHfLRD//5qJgIAAj6gQ
Date: Tue, 28 Nov 2023 07:56:15 +0000
Message-ID: <79191eebdc7b46709bd253da252941a0@EXMBX066.cuchost.com>
References: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
 <20231127013602.253835-4-jeeheng.sia@starfivetech.com>
 <93526583-ab8f-4ddb-9846-41e4d1834847@kernel.org>
 <d72d6fa58309438385e14c3713918654@EXMBX066.cuchost.com>
 <5820442a-7819-488f-b389-8385531b510f@kernel.org>
In-Reply-To: <5820442a-7819-488f-b389-8385531b510f@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_235648_739142_CB930F00 
X-CRM114-Status: GOOD (  17.97  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, November 28, 2023 3:20 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> conor@kernel.org; kernel@esmil.dk; robh+dt@kernel.org; emil.renner.berthing@canonical.com
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH 3/7] dt-bindings: timer: Add StarFive JH8100 clint
> 
> On 28/11/2023 06:24, JeeHeng Sia wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Monday, November 27, 2023 4:48 PM
> >> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> >> conor@kernel.org; kernel@esmil.dk; robh+dt@kernel.org; emil.renner.berthing@canonical.com
> >> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> >> Subject: Re: [PATCH 3/7] dt-bindings: timer: Add StarFive JH8100 clint
> >>
> >> On 27/11/2023 02:35, Sia Jee Heng wrote:
> >>> Add compatible string for the StarFive JH8100 clint
> >>>
> >>> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >>> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >>> ---
> >>
> >> Please use scripts/get_maintainers.pl to get a list of necessary people
> >> and lists to CC. It might happen, that command when run on an older
> >> kernel, gives you outdated entries. Therefore please be sure you base
> >> your patches on recent Linux kernel.
> >>
> >> You missed at least devicetree list (maybe more), so this won't be
> >> tested by automated tooling. Performing review on untested code might be
> >> a waste of time, thus I will skip this patch entirely till you follow
> >> the process allowing the patch to be tested.
> >>
> >> Please kindly resend and include all necessary To/Cc entries.
> > Noted. Should I resend the patches with the V1 tag and with addressed comments?
> 
> This was v1. Next one is v2.
Noted with thanks.
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
