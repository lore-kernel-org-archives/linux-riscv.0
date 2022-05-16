Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CBAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3RosJgJVYXcDqbgh4EvoECk/51rkx2UT7d87v5cCdw=; b=M5jdyT1Rj8jMTF
	O4Qbp/S6C0qC39yrwOEhNtrPiPI82g3UbPLf3Qg6clf8nAjMtR3UMrd/m0+Ig4KsXdinlR3LX9UAU
	sz9MtH7KdhlW5Cm8XK0J9a+dKKzkpPSaR7L1JOqE+8C7oZBM5+/GMbEzwHVaLjBmSmMvavHw3SpVc
	J0+uGHMTtQoYy6vOM/CK7F1CZSPWdjKY5CEdDoAI57ZARMGR3YBhoWEyG0Yo4vkPHG3xvagsUGP7f
	DDzE6YaufnZrLPtk9aIa51UipdirzhMwU/sThj2AvPvaDL4+yCRhgxtAbo/PRBq/6pEByKjAxKyX6
	4HTz+RUz6qO1YMEs5Jog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVAY-006Std-HH; Mon, 16 May 2022 07:29:30 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVAV-006Sqi-Ko
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 07:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652686167; x=1684222167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/y4rs9k9nqNpweM8O3PJxUZRpWd1JTgsveR3TfRd2ic=;
 b=Or+tKXrgf4NWvJhu8rE5pLxHFBVmh2WJDPSLQ4DSBsVmQCiWnVE+cc6v
 gjCsPUsESPttlMtprGo4HaMvNQcnsGNAB8YHjnUmurEtRmkhicLzsmEHp
 aDzoRZMjHhyL1J4Tcl0RlaFDc82dyyaaLbrDVyfe9dmroUWRercapYA+S
 +VWl7iszKrVyR3mF+O9oaDnDY61JzWiqOLkFaq1UEFEMgl+HG/7jwZFqj
 d0dRKVIIapsBnYd0jQvQ3v10PK//2pc4x0mfOP6LlZpBeqgE241Neax1e
 TVUGRvehBNnYL1dH1dcmtl9jm7VAiMiMl+00E3ClEAbtk6xuN8DYbZiA5 Q==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647273600"; d="scan'208";a="312393113"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 16 May 2022 15:29:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvn/Y5opgaVrrtbFQepOiXqIW+wRMxvp8I4JBwLIPrFbfjXQGEEG9ldtpSgSeKzdoyXGI4Y5mGPYfdYdzUcWeCivfso3Nu9Zuu06LPug74gc3/VO2qXlIw2oWkalhs6TJQP3lh7dZoONrx1pvWxpZiqety574jFygu4HkjlalDqYLgz9f7HI9brIGmE5QfWqkfpgjLs0NxHnOowB8Luubias9tyiEG4quW11To4iUeBJOvHc5Hy4CIMQL+DWJHXhxXG+GZFmCSVPwe8Tyy8oqQy3UF9EsNtMPcs/tyOKaD3OxVIZH/ILR1u5POsuVXyiwsaMxMtse5f7rVrBKrL1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swXYfeQqs5sUVXo02diPDvPxKmqWlR4zRLwxDbXce70=;
 b=AjLiayfgQz33dH6q6E89R/kP2dd4EWkTBFxwy67EQW/FC4pxr2LM1TqRpiqfvWrlzqza9qW3um6F3Uh6n18c33tNTXolVl+irUbpVEYCAp+LNggmNnQZ5R8HpSpSu/FENZCsoidDd7btilF0b24MjRE6zurlN0AK7ppvBOF8MCWAcNyrUQbbDvcrFHMGsajMz99+BscVlOSZ6/lrUgdiclEjDIrubRikC9VgSCgOCY3akEsKwgaiXIUiBPkWUO17C0ILCRVFaAnlcaaLVxPNK5ricEHOa4vCOMh9XDn2n0Cgp8u9Xyyy7JBn8RtuMwvg8F7JGh+3BHs09n6tzIcI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swXYfeQqs5sUVXo02diPDvPxKmqWlR4zRLwxDbXce70=;
 b=XtbviR0LpOyPrqxzifGS8vuBJ7V7nwCpggBGdr4zadYm1PYzj/ROXE02pGp3AMmyKCOlVnAP/N1sIIkly4KKqPZIyU5Sqky1Qu/SF1YCKReluo7mzH5RCW7QOQve5QRgIfNf9eso4+ggu3dX0rhJvE6TQuyNagy+pWzPBR3g53c=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by MN2PR04MB6447.namprd04.prod.outlook.com (2603:10b6:208:1b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 07:29:18 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::3cff:7ee8:c1b5:b4e7]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::3cff:7ee8:c1b5:b4e7%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 07:29:18 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Albert
 Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] riscv mmu-type minor fixes
Thread-Topic: [PATCH v2 0/2] riscv mmu-type minor fixes
Thread-Index: AQHYXiM05KwtCdrd8EKoEoHTNUoNU60hMQUA
Date: Mon, 16 May 2022 07:29:18 +0000
Message-ID: <YoH9TE/4ruFQw3fV@x1-carbon>
References: <20220502125015.1345312-1-niklas.cassel@wdc.com>
In-Reply-To: <20220502125015.1345312-1-niklas.cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2acd5f8b-8345-4dde-2ec3-08da370dc991
x-ms-traffictypediagnostic: MN2PR04MB6447:EE_
x-microsoft-antispam-prvs: <MN2PR04MB644711611F4D6CF23EE7BAB2F2CF9@MN2PR04MB6447.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /VrNf22RLsXyim2jQ5AqgBtEuztgxG4ChkupTFQFPi9tSmdfoaiRt37TyVrxLPaBkkqTbRbAa38T5AYipq/yy+3515Ej0XdEH4QGoaXjQxSxAgJ06VlUuyUKgndvxvTGLenUNtyWw3phaQsVJQuBz660V0oiFXaA78gjjL8iWn5q93PrNNPc4GPVIcV+4JRx+Wr/tbUCXXrdktwAIE2aCoM82FF7JZWYMw6bd+u6MIJzaACorQMuHbApJyAq8wsv6iVlXXOwRAb6zKF/ElJa/+rEBnUzRKDfH3isCfE3Oggjt25Vb2heuiAAjfRkE4TFPc63vns2Klx3452KzjH5SwagbZUrcsqu1PNaXkhJUjEFd/rBawKRzujwvkV6UbsgWFS8SNZXy/yajgARkez/KMC6OgKF9GE8nFT8urPUm4N/hgvZrmptmnCl1FmuY4A23eAdUx2pky7GPNBHKURs+tOcbkhjRaPuMEd2Nd5YMgMmCx1G8aCd3Bk6xbYfzi5gJmwQsXK6slGIyKzW/aRztDsgJAxpwTzcdqjXt3hz94qzZRBPpiNyKLrkIkN2eu04gFAbk6hJfXyp+4y2kneeehBAgGNjHQBUCbmRMEjuRjSjdcsdRTCLhDVWCVir47ZQRmwNVHuveXxyXnmWPmPE/JITiDwIL+Th8/rB1udoIuKpRmMyy54+AK60JaFBw68wwsFC+Hg8yeDC1bXRQ+bsVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(86362001)(26005)(33716001)(8936002)(186003)(508600001)(6916009)(5660300002)(71200400001)(316002)(76116006)(66556008)(66446008)(8676002)(91956017)(38100700002)(38070700005)(54906003)(4326008)(6486002)(6506007)(82960400001)(122000001)(4744005)(66476007)(64756008)(66946007)(9686003)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gyoalVN1XesH4VTzQtk06XgaLm+jcCHHXzSwEVQ90QX8bGw/cmN5MrfCpVno?=
 =?us-ascii?Q?igGGYn/oiHl7a3XAXK4K1NHPpiOY/P5LaH5DyVWDNHnxvw99Nw2F7gJ/BWcl?=
 =?us-ascii?Q?AqYtpzVreeB5+iFFn9kUf8S+94NDeVyXV/aVLMyifshx1hydkzK90nQjQDwX?=
 =?us-ascii?Q?PgcOeiQpgXhrmxm6lVuuBIa8QL4Rjw36vZMLeVwT+vspcQ0PDc5y64Zv3V9W?=
 =?us-ascii?Q?JgqwIJdlBrIrB9Tg8ECHA1rvbgNfowydspItR5xIiqMrC8/twHkFZ5x4ImBt?=
 =?us-ascii?Q?HVc/7wBnNZYp6hiQ8YO8Y3u9m5W/PftHernjMVLhY/pNxCrPZknfgOV264wG?=
 =?us-ascii?Q?moUe7i4Z84H53EuJBa6BZpVMlaaHbE0+K1HNw0VAh2COtvGdZcgCBdli6jkN?=
 =?us-ascii?Q?OWrkQBv4Adbnzit4T0rSQRFkNeDSn2D7ptcjJjG8mkvIssyk7TYL1hkZrb4n?=
 =?us-ascii?Q?b6fHM/VjY7pTrKsCne1x383Ay0GL2mDlYbLCrSxPMyg/ldLd0uz1OH8ltflo?=
 =?us-ascii?Q?+Hy0cT6d1XiydmZGVeI5QUHptZwXQyTuhSu1WBCxiJRy3AR0IQpkqYqqQkd7?=
 =?us-ascii?Q?5vYZCK+F23RiXn3hcgvalMqjHMnwO+aUelhJUPugEsJYCuR0b6aq/dVCXVlX?=
 =?us-ascii?Q?kjCIksaDwsY6s/eGlMfeeEvGHXMis6dZuGA0iGf/5qPs3hDKRvoC2x4BY4yq?=
 =?us-ascii?Q?gQcMxpMFhtkpsN7Cuk34x8i7zCrgY4mOuhJp7WeOR0/m381Y2NMhqZCgsPTP?=
 =?us-ascii?Q?zNzjlexm3ItUveLSl5I78dCVw5cF4f2NklWdiyNgTjUox1O1k61hc8M89qtF?=
 =?us-ascii?Q?EmBFTz4MjrmZ5tGfO8ClVO1s/E7JpwreUsLs3r6FGFuKQbKkpkp0J7Q8cI/Z?=
 =?us-ascii?Q?s/WFHR34GPzlbvsUpC4tZe0qe5LrsZl3Hd6Cvb1FbLUfF35EikC03xPI2mcD?=
 =?us-ascii?Q?T9DoXCHjczV+d7AC+EVGIUia0y7MtU0N7gkuXV1NSMaxOA/wSRNbnAk8R7kX?=
 =?us-ascii?Q?s5K/qVAc1VKnHHGu8eZsFL8zmL6yCmSK5E2iXYg1O4Qnu4seSD26+249K98N?=
 =?us-ascii?Q?BjLc9ZOqxWJDWZd04SoVX7kQsieDTFNAtnvQp1it2GBAuvy4K6TzluPpzNfX?=
 =?us-ascii?Q?oERWasj9hQIyRmEjh/C8o66xVPF6ww8aFXgmB+SWqDFVfuHlSncJvjd7Uj/6?=
 =?us-ascii?Q?nnFtUyeAGPBfGCYCrJ6hLlHZn7V3ZwN7UVxqSLv0lkl0D4re6FA+Ey/g9bb+?=
 =?us-ascii?Q?bHItNuhamt9qzW0R1GnBF/i+rGmth/laYn6mw0bTP/satsbPpAWBrMie1oAY?=
 =?us-ascii?Q?S7yv+CMXvCM4tjiNzlbNs8oyNeXe4QQkPxdCV10cD9wR0V3e6wKKnhmvuqpe?=
 =?us-ascii?Q?o5R/g7ERfFmR1V82/P7GQukkiD0D5Kswc+a6Jz0Bvly4ZSOM/UG+y6rMqhEl?=
 =?us-ascii?Q?ya8AptacAURjpbfA6F+oXXJIOavCA6mZnpYw4vyV+OJL+SgyvsVBw7QKTSOK?=
 =?us-ascii?Q?3RAwUDxyKjzBFkNgLmNX817pNyOJOdH5eJ6Y1Q+ievBHlPcgfwsCgeLrOeM/?=
 =?us-ascii?Q?AZw3JwZdX8PUNhWwXSQkSmpg/b+nz4QgeLzehj44j6ZLw6UEG7wW9PQKipE1?=
 =?us-ascii?Q?zBNHgfty3n5Gi/9NGlMeGV41QlpfiVVKTLAioI6NmnajJMpnDCmAQHUAC1Nn?=
 =?us-ascii?Q?Y+H7VgybMTze4OiDRW/EV6i8JLTPOWIGY8CbBDpGwah7STDXy+qBGfD9Qk5a?=
 =?us-ascii?Q?VjGUk9UlP+YZjbhiMYc9iCr8LtKDgMU=3D?=
Content-ID: <4FDC4AD7E39E464A90E61EE827992972@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acd5f8b-8345-4dde-2ec3-08da370dc991
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 07:29:18.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk5X+yY1IWzVcKwsGeckc0ul4iLbw2Vc1sgsGsLJTGBF/7jX4+g9+2W/XNh0quyJV+jH0JjowIhKntluSOzGIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_002927_732169_03573EE5 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, May 02, 2022 at 02:50:12PM +0200, Niklas Cassel wrote:
> Hello there,
> 
> 
> Here are some minor riscv mmu-type related fixes.
> 
> The first patch simply adds "riscv,sv57" to the list of valid mmu-type
> values.
> 
> The second patch fixes the "mmu:" print in /proc/cpuinfo on nommu systems.
> 
> Please review.
> 
> 
> Kind regards,
> Niklas
> 
> Changes since v1:
> -Picked up tag from Rob Herring on patch 1/1.
> -Send both patches as a series, since they are relate to mmu-type.
> 
> Niklas Cassel (2):
>   dt-bindings: riscv: Add mmu-type riscv,sv57
>   riscv: Don't output a bogus mmu-type on a no MMU kernel
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  arch/riscv/kernel/cpu.c                           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> -- 
> 2.35.1
> 

Hello Palmer,

A gentle ping.
Any chance of this getting picked up?


Kind regards,
Niklas
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
