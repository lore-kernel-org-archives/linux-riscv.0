Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5053C5475B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 02:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqduRMW2qXR2Czdqt+nuC0RBkV1e2da7qSqNXCiVx8s=; b=5FsAIeeFTbTvCr
	3DxQMepVYbL3nlDOXHzjjaalszSX4e8yOXOrLe+qtSwtCqAk6WPwmZHCOc/SWYrc49iZW1shyjRZJ
	st4AV3wtY+jj4lEk2b2nNk+vBv4QhfvYCb5YTs0a5uclW4AG9yN5yQjlysEDlgHkAEmc/uSFlOwEp
	eNn8hhPn5UlaPi87/3qZxVMIxKatvafPwfBhV23YvjNJ0uwbuohyhpxeYpAiMin3n9e3YTPreyqVV
	5b4Fy4p4DnmjWaT5I9MY+PpuoWNxZFlSgm5B7v6ONKou7sEdtWY84YaCGnkL3PLUYB1f9S7vmm6Tk
	R+/nMFTBgCAgwgSxA+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxlh-00000007H6e-3Bpw;
	Mon, 04 Mar 2024 02:09:29 +0000
Received: from mail-bjschn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::715] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxle-00000007H5c-2F0z
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 02:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG/IT2VugIx4j2FjyF7DXI9iYzPlDuoXKlnGbNmk7dwNEfoG7ZIU8UyeserEnQ0wqgA3grpZgeg2jDPDTmDQHDeP0udmSR5+CgqafEnVcHZWNFpLkUaUCOSedu39k6L+WTSVblsbCMEBIZatX5Rfy3VconuUnLnIqjKdMfcppq67EYoLKqyOlAGGGoBtVvLcL7vZWZZnCWie89NiEKzOmx0qisbqRBr5BzYtiHQFYXYC98QcehVQgMzj7TwpoTcmY6wy/w0JByELDqrqZL991IpWyB0vEylVHEX/RCULVQry/8kGtIN20M4QxPvgA+XvIC2VvrINhTnrxIyJmVPJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPZ6FaH92mlgjEZLIlZs5CM1RjDR9z8yE5cVea7V2zI=;
 b=kCoI8L9EivxkJqcXAKcs3e/KY3tE3NaiuEyqIoOq0Jwqd73pViu18DbAv52I1pAvMBYjpXNT2K0eiRiEqt2Vs9JeUqomNJSu9uaq+ObrnYLxyVrqo2DsV99/CqEuuxBm1J0QZJMQ1byZohKbnS1EDgjwN7dgavac69cJSkCLAgEFJBXGaYSHkIV0VgG15G8RxlhLafLT7KMjR5MOstKgJLTCX5aVuYW7NOQ3dZUyjL///Ct0rQSyvQZKEzE3nicGMa7v1zwTJObSO7v38O95eREDaxfKtwaGQNPNj2KnjlQZ3bcCuMVn7ePb68D1Bc6j+6RGbwUYIhrLkSB2S5429A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1032.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Mon, 4 Mar
 2024 02:09:10 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::2f41:68f:6f07:6c8b]) by ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::2f41:68f:6f07:6c8b%4]) with mapi id 15.20.7316.046; Mon, 4 Mar 2024
 02:09:10 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor+dt@kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley
	<paul.walmsley@sifive.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Guenter
 Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Thread-Topic: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Thread-Index: AQHaM+np7f+IGJ0kT0O4532Km3V6i7CztC2AgGoiq+CAAHZYgIAI+hNA
Date: Mon, 4 Mar 2024 02:09:10 +0000
Message-ID: <ZQ0PR01MB1160B71B7A13C9DDAD8C0DFEEB23A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
 <20231221084358.3458713-2-jisheng.teoh@starfivetech.com>
 <170319257135.88357.1722653226891421278.robh@kernel.org>
 <ZQ0PR01MB11603A15E27E344ADA11AC43EB59A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
 <20240227-arrange-theft-021133800c24@wendy>
In-Reply-To: <20240227-arrange-theft-021133800c24@wendy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1032:EE_
x-ms-office365-filtering-correlation-id: 623edd69-ae4c-4769-e5e0-08dc3bf014a3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mmlkko2goNTUbmBzJRz2ymgJUhhoWAGOwaWLIzHtjJpL31e9G84ma89ivuyRP3E64HKGNHAxnqWY5tnBoaLLg+yzgj+xTuvInAcUeT4OWtmCj7cTTm7Ht/wkV3hkaRphShYEvtJFhaNJxnHSsEA8VbLsg3PSBCbpgpSjHLQP6m19YxZA6Uyfrwjnz0ZfM7gvdIjOzCRw4Ou9tBOqBIwPEwqepkKuNXn/qCVDb1ITj7U6hMSjh7uK3x25LL10cFUgwT2tfrEs6bS9AsaIiHlWBFJrRU2vyTWc/cmN8YiM9/Ozc85KNRWf7ptKnbsxndq/5//rFFL4Oa3qcNpPzzOmuEtpQ5AWOFpxuv7L6wmicAKeq4M5SvLpeqFmRyrrPXThZDsQEUbluAQOnfaZDhA5kCsCenscifL1V1zA9nZK3qma9xumtbYKFrI3eJu1aAchcyaDKdPHtPzzWOe0Qr/1xLkcqaouHww3Q775r8Zlja4bPFjwARIiiT0PbZdlhFFzSLDkOdMTatHltDO3XnoHDR9CqgqUMzx+Wqrsvw99qSHzWQOywWUOJT9Ki6FpuOaVK8ZvSuooRnzj7HaRMwY0D51xkHHtHql/yQNaSDIf4AZwwbqG4nReu1kHThUyzfdv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pFYP/GCLI/nDwEqchd8AFEwZNydVQFQwiPff8pBYzcYFw8HpBLmltVisBWtD?=
 =?us-ascii?Q?60TyRMxYTfd8Xfxc/ztFqkL2TvCGc56KpET1Ti96KB6SbCofrqdduqARskKq?=
 =?us-ascii?Q?EOYXAVv71FBMP8ZqZrlPxPJLJbAr/jfwZ/k2JHWTSMuwbWROUpsCeys5SyqQ?=
 =?us-ascii?Q?4q8q5oViFSju/Wfzfjjxer4SFMC4CDVp++VnRugiNZz8tB4b52Ylz8hIOhFf?=
 =?us-ascii?Q?/EvScJeXG6/eLcYtZr9Y5DZzmxD7Jm4n+krhzfROt4znr5UVujSA8lnnzv+H?=
 =?us-ascii?Q?5UtQHw9mq34E5LP78W8qmKBY5Jbd8c2jHG/3USqkx/2vtSiBRwrv21s5X8ft?=
 =?us-ascii?Q?2e9mn2wpu3v89/aFkMe7PVPAajW2XhYi07s6Zz5SUjO2C8PRXRF2VLdmDlob?=
 =?us-ascii?Q?FvYm3kD79MgXxhuyWNYsv1VNtIurNzR8y6F3Z4f6wNQqWIC3DTGjhIkzAHfa?=
 =?us-ascii?Q?+keyJGxfP00tHYcSulX7t+bK5pfUjolMLXEKQe7jwPWLByGEmmLNu5zBcBIT?=
 =?us-ascii?Q?JQVio//MFFitXroxVveGimJzAwdC11kjPtzPgDGpp2fA32GDIK6qYt1NsiAt?=
 =?us-ascii?Q?M+mb5NCgvQw+liRLskbTESD0+cZsKlLkecepWa54tZEAUsj0gn/nPuLOGNgs?=
 =?us-ascii?Q?rgK6Q4oxxQGuKp4tlZ+Y19ujVsir26yNoyXJaiE7j8YF4CLx87rT6llzIdF0?=
 =?us-ascii?Q?ZDN72Z+l95RXcQNNxkEBCV9kSVt2x/e0HbhhRKVZsXfNSRYYXOm2MZmvqGQN?=
 =?us-ascii?Q?CJ5IdCpxGNhUy1qziNRrHJvobziLmuB0O+W5Fa9qs3ZJrsddqDw1+I53/9UA?=
 =?us-ascii?Q?QFe6LtglWp960RccqYh3wyXBQUG1FH81aAOCrD3PzNC9/fyjgvyPceiUBKjK?=
 =?us-ascii?Q?I4Y7kXt0toFAzKM2fzD1RWJHxjwd0akldgbRVOnSVsF7eKsJcLajPOWHZKSN?=
 =?us-ascii?Q?R19WB4aTIoNPNNShf1RP6wi9ygKUbU0TL+X+DMvPZwiPXtR02K0I6r8jVje8?=
 =?us-ascii?Q?R2Lwy8ifb10YkJEHn+ta/ob9pwO04F/2DpCRNcSgAQPvLT2Yhb444B/YznJT?=
 =?us-ascii?Q?HvNORyWUA/ejFUUt6kZY5IndJXxxdhwglSITAApb2NwltDZK7YJA+dtNXUBI?=
 =?us-ascii?Q?GlJ9aMNs8fY2UvDFoVsY3wXoez6UQq4WIB74jYnhurOuUAdhjGW3PjQam7pc?=
 =?us-ascii?Q?RqbJiFBw28RRkiqUAF5u/Mal28Ibgkj3h/Geehwk+Z5B4Hs734PzXJxAoYze?=
 =?us-ascii?Q?Z8bH1YrsWiEM6Ttd2TTcgqeNjn1UwQovFVcjMFeQEiMA6h1H0R1vqTZ9+RHA?=
 =?us-ascii?Q?KGmUIREBRzbjrhbFN1dkMIALq8rIUNRwNU8gOlO1SumaDYBbRC5Yyutq385M?=
 =?us-ascii?Q?PSV5cXMNngff7An8p5xAiN75agDtlHk54woaWMA3kMPnZAjpiiB4pSKRUlkp?=
 =?us-ascii?Q?qxlA8gGjzFKcyj/gygf+hi3bhCkadvFMtlAED5GaVilMl2bDo2Glvfe6jVer?=
 =?us-ascii?Q?bfeHVJ0ZU/Dawq4t14q4QddhthzGj4AIDTqokzHhD0R69LgF9lhvYzSasw5j?=
 =?us-ascii?Q?rUlB1j4KPVFCXp7/4IikCzNdzhzhstL/gikVdlr24dqBk4zz2l3bN0L/xyw3?=
 =?us-ascii?Q?KQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 623edd69-ae4c-4769-e5e0-08dc3bf014a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 02:09:10.3605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bo2NSehdyj+yDAA4orLTK2hCo5xVpn3nwVn+v6MtvfmQum97mce6WoyDkW8qi7VZV/KqftF8Tz4pXkXml877jwTSIixGTloxDyl2yhG+MPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_180926_601264_5002E533 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Rob,
> On Tue, Feb 27, 2024 at 01:57:43AM +0000, JiSheng Teoh wrote:
> > > On Thu, 21 Dec 2023 16:43:57 +0800, Ji Sheng Teoh wrote:
> > > > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > > > watchdog.
> > > > Since JH8100 watchdog only has 1 reset signal, update binding
> > > > document to support one reset for "starfive,jh8100-wdt" compatible.
> > > >
> > > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > > > ---
> > > >  .../watchdog/starfive,jh7100-wdt.yaml         | 40 ++++++++++++++-----
> > > >  1 file changed, 31 insertions(+), 9 deletions(-)
> > > >
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Hi Conor, since this patch is reviewed, could you help to pick this
> > dt-bindings patch for riscv-dt-for-next branch?
> 
> Ideally I would not and it would go via the watchdog tree.
> 
> Failing that, I'd rather Rob take it.

Could you help to pick this dt-bindings patch for dt/next branch?

Thanks,
JiSheng

> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
