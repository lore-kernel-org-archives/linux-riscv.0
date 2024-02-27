Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E46C48BF6
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 01:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV6ZTUcKQbQRXg0VGbGaSgDGQWZ1rX/7TwTS1C/w4kE=; b=1NZTbLcpl9YNHe
	kkuGckSIWNyiWoxdLxOq63ZM868bhip6Wx9hbWFpuBdZ3bmJuLrMctgIbO98WFpK9rrCZg+/2R9UI
	1xJC4x+AzMCRZU7r2klQLWUxllzo+xWIlxrd2uKf7EtzKtapSX7ZYF2MpT2IB2B7F1CD9hVXTwqEv
	AtptxQxKDbGCMCL/xC9ZMMoGHLIKpGei4Rod1lTBzcMtAEee8yGbocm5ZfbYlYhY6bECQlmmLHvNU
	brkoxPr4RT72fW/1+k7cCiJ7gKw8dDJNPamUdIXxx3sX+8e+ayFSRX4iQPHNHs4DesCgKe5mqFSbO
	7BFPl3bEtEHUNSqkUz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remjN-00000003OAZ-3Tco;
	Tue, 27 Feb 2024 01:58:05 +0000
Received: from mail-sh0chn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remjK-00000003O9Z-38xg
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 01:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz+XqeitBWIpwU+4QFnPtr8TBGyzytGF9vkHLWBYyAq3raFbPAzDWdYgHXFi0cx1VyeeuLTO9eNJAkxTNrM7o0PUpGl2XmTcL8OhuernYZTV8a29tLXlaZUhi/dKOcil+UhMPK8HItu2M14QS4nRmdxjMXHn1NEQEUHc+nyI2dJ+B2mqer1hJZHxOA3K5kC6w4O7+ovfOT3ZcjBwmnOhjIx9LTre073o9Ex+P42y4h5ue5t0o3mhURU0CwzcKYIa0EgMRnWkiaSK0/d6fMXTTRKaPuFuCu83NJia4Hsww8ifF+qlUSTApalnUv9OMX63ha/OfZTl8o32JM71h0VHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSdDbhhhKCLh3lDskC6oE5KeVufB76mcVS2ZEJIaMes=;
 b=XrlWAufEDZKf5t41QomOQrHfDSOX7ZpTrvfmfVIy7mlzaSw2a7cxFP75cxfJZ4kt2+PzA2J7N95UBCP7WPUUsd3Nln5oL529JHbvh9la5bwcjwBx39D4sjc0qC/4eflKWFOj2KK9kLcSADsec4TwnRZMmKDToJv829H64RZO9UvwORXqR3TwcK6pwyk1idcCks9EdTnsZte60iNFhOuIqbwivWzDlgTSWS8TU3cL9yL4YnUvRPaM765vdenI6Kw/cZbPWRrkBLTlO651GeoU1fcNOVpJ4zRj80B+ru2HvdeT0B/VuwviteWJV10sjP4Dn52J8Wmd5I0IUy5vuU05ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1000.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 27 Feb
 2024 01:57:43 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d0fb:daf7:3f8b:868c]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::d0fb:daf7:3f8b:868c%3])
 with mapi id 15.20.7270.047; Tue, 27 Feb 2024 01:57:43 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Thread-Topic: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Thread-Index: AQHaM+np7f+IGJ0kT0O4532Km3V6i7CztC2AgGoiq+A=
Date: Tue, 27 Feb 2024 01:57:43 +0000
Message-ID: <ZQ0PR01MB11603A15E27E344ADA11AC43EB59A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
 <20231221084358.3458713-2-jisheng.teoh@starfivetech.com>
 <170319257135.88357.1722653226891421278.robh@kernel.org>
In-Reply-To: <170319257135.88357.1722653226891421278.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1000:EE_
x-ms-office365-filtering-correlation-id: 6092c1c5-4f71-41c8-1e31-08dc37377ca5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tDAWj58Lb9pr8K9UFccyiUdSRPF99JVFP+80kKEAjuQFvipKtCa8/ztWgNTiK6bpi5wMwJhbgscsMjr/iJ8YRLzTjdoi2/Dv4DiryrLAFu9YoCDNHNpe4QBgcpQPlkSO2JEIGK1y7DpTz+FWPiPCDQMlxtWuRTEZSZOQOBVGwMDtWhsHm6Zt90yudNPDwKPMYQQdTYLk5///VX4hPpLYQ7JOgXVGDlFae2r7dCQu51Pfu9KAB4fMS2XNAGw+wZyt73PMErhXSNFKK7RMHwDSVXFOdyvcrJox7UsGYzvtAtmI2aCEhhqk+6daI8ts4luVUzn8zKjPz+7omfkM+Bk77DhSqcEhAHh01Pib8z3KGxdfxC7Wi7NXFG+uAm17OYsyqad0OKEdVyaeOqOgzfSRGXfEVH64W5GWOvoRoDJENe3grM4OM0sCNugO6lrq9PQx9R48IagOrFKoe+T4ztuZWjrkSI1aupNQfQnIGGdxg93B8jHdoft0HgdxOXPV5jsaJQTst2IhmldER9mTcUir+GIfFUbk0BZUmy8rEq3sYnGI9/jVoCXLbHgYv5nt3pASIOsaWgKUETbUtNXjsXwSiLicPvg/xIewkrBneJNciR5AX6kTMk6p7MjylE59sBpP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fXfLQzEPCgA5B6zUbqlEHpEpYDYU36N5h8pkX294K/0YD3+R45I34A8vcQVz?=
 =?us-ascii?Q?e8JjhZSIqwsRr30g0TtWetXN1lru+smyVcTDViX9V17pqj4SNSKXSceGcfp/?=
 =?us-ascii?Q?1VuhUILJl69LWKyjrxr1dR0whIZaF1CMMhkgVHOI5S5gmkabGXgpZ7/QRr9M?=
 =?us-ascii?Q?jNpD+OSmtkDaOL+8blIXKWHVOAdkA5dL6DNEqYAVzrpNBgQmBuYiTTvRn8j/?=
 =?us-ascii?Q?4zE+4yhAmwjKgolExAgH3HETQZe2iF9ChqyrQg3SLdqB+IT/pJk42SbGr6pa?=
 =?us-ascii?Q?pt/ZXQ+D4csySX+4ERUDjaah6zH8PWS7k4qozVQHyhb9Kw6fSrKAtsbTwow/?=
 =?us-ascii?Q?8Lne8+gTiJTNlaZoMGyEd6mnb6qLgRbPH1Aa82XfEHC2YfVc5/9HshyaivAf?=
 =?us-ascii?Q?SITYLKoE48EweFDN+L0/jOFE5lYmkv4TYNARqDrGuELXcuQ2V61iRoU+2imc?=
 =?us-ascii?Q?hZJXnFso/EywfZ2UF1C2KFGu9IWuohXFTkPJG/2I4Qs8T6X11JZ8Jw2u+OJH?=
 =?us-ascii?Q?Ia+PjPW3m9pYUJFj67G5myRWhjeVyQeIO5wtD8caoHpqXKITRYBfdj8v2sBS?=
 =?us-ascii?Q?a8K2iJRgDiUTjsOZpaWkbvnRQ4lk0PxkVsWphQ3R1guiBAWC6mww4RhJvmmm?=
 =?us-ascii?Q?RNSN5XxjL3YWrmsGQSSB+QC+nZ/eVFDJEoXaEuDSZt9uGP5yJSElKF+92eqZ?=
 =?us-ascii?Q?IForDgv90/+ZfcEmLi5O8ufScJwGm7X3u78r/SzHYO25s1irfA8HaO25zsar?=
 =?us-ascii?Q?Pc4lhA+BCmyLZY4WDldNaqlBI2cf0lzfkO2Xd4vW2QGgii4QjKz+d3KCfDiZ?=
 =?us-ascii?Q?Fw/kSnHD42IZ9irGghR21XjU2Si4MhZh999fTZtbiFm/hGG/EafX0qOw4vCb?=
 =?us-ascii?Q?ZxVjj6QteE8U2+nCBZP8uUG2NePThyQ8LNboXUr3+9+v2A+tGecagyNRSv86?=
 =?us-ascii?Q?bbGBeNjLjYUTNAoMzwF73/+0ZxsKa8n/7hexfoHyVn9xrv1RNUZcXL9JBkpG?=
 =?us-ascii?Q?4VMb4ODgIHaaWgCuJNzgeWvd29htl0a+ttKibu0wTXQVzEe0ywjSloghtiYQ?=
 =?us-ascii?Q?mjOwY8eFBtvB/n5i2JHRrFHH2Wo/iS+pkG91X2MplNwU8t6ELKjdOB3Mdh87?=
 =?us-ascii?Q?foGbH9MuV0kej54ITuojbw8EVwm4jaJ1St8h4mj7E1F0pHCUYa0wj+skemUU?=
 =?us-ascii?Q?wL3PysQY9IJ93o0qo2mon3MvaTKmrJYuEimE78fiEVC4vJBTezHpjC9w3K1T?=
 =?us-ascii?Q?jNfL0msmKC6fFZUEI9ou2bxRe8DZSUbdJ4FvTDfQluk7w8Z4fnMtfO9NqFmG?=
 =?us-ascii?Q?ae+2hc7Hg3Ca8gASFnNd5vGE2knC7apLRZbeGhNc+sQqzLLcsLE11M6h0PYM?=
 =?us-ascii?Q?tPhlkTLTVloTeidEdwcbva96jRF26AgRKKeF02QI+MftHaWPkDNLSOS5eNKF?=
 =?us-ascii?Q?DylywEFI8zogdIFEs2CpVe0cE0zklzBfapyp9YKuBRbTsmhqbAWHxlaYAKtj?=
 =?us-ascii?Q?qqPbZXRvoiiw1E5OEC5ZUowJbKZRBSpdFMAPWZPOjlTzlDUJUE61utviLdgO?=
 =?us-ascii?Q?pjPBHOgffwYs/tSR5F+korbG7lBC3dVHsxScJUCvU+jVHIzgeH+Dm4UUQb4L?=
 =?us-ascii?Q?Pg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6092c1c5-4f71-41c8-1e31-08dc37377ca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 01:57:43.3548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VEBT0iRhUgi85TmIJWJEKfWckaP9GTNNTdjaKVjKxUbVdSqZS57dysOcQALkGsI+xEzFiBS9tA00ZJ/xS1oiNpSai0qoPl5yletAiNpNZdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_175802_811291_113687C0 
X-CRM114-Status: UNSURE (   9.80  )
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

> On Thu, 21 Dec 2023 16:43:57 +0800, Ji Sheng Teoh wrote:
> > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > watchdog.
> > Since JH8100 watchdog only has 1 reset signal, update binding document
> > to support one reset for "starfive,jh8100-wdt" compatible.
> >
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > ---
> >  .../watchdog/starfive,jh7100-wdt.yaml         | 40 ++++++++++++++-----
> >  1 file changed, 31 insertions(+), 9 deletions(-)
> >
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Conor, since this patch is reviewed, could you help to pick this dt-bindings patch for riscv-dt-for-next branch?

Thanks,
Ji Sheng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
