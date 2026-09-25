Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AC3C9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNU87xd3tz/5OL0GEp5dkBPvBBReY6DoyYr2Z+v+GqM=; b=ExJOzMmzBfAxW9
	YwVZr2k0aaF8DD2qGYxN3F5mMgTcPZTlix6+UAnjaqMpVWftvr6BX90eaaWh/TtxT2xEfW+Mj8pKR
	z+ZaKd4UFZuA16mdTCqsmHdpgwpqpKWV8dkfZ+UH8PFIdhkFnQLBq3hJrSG+fYLyv5nC+eJ0z/9/O
	7cx3c18/QQX45A2u9ZFRuUsW1lvpQiiRYrfIR/ygvBnzYyfsehhPbBKvbTpMDD6yECyfc+PQVFwlJ
	W3F8zUplbN8U2JJEg9de1S2jfQJdnJGPUHve86X+L9EDfsuqkuasqctFMkLwm1cw7537EpWBo6fdx
	P4fcU4+L5cwn7uyP5/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA08y-0000000CnFd-1jlu;
	Fri, 25 Sep 2026 07:14:52 +0000
Received: from mail-bjschn02on20723.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::723] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA08t-0000000CnFE-1O2S
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egKH9sWd3NMl4e/8MHSGQ0zVqFgsg4g8yideeVJ5ABgQh+tqXfnku8MazPR3vy5PkCtcPQg5Ls8eaWIMy0hjDTK6nFsTOvxK7nn7kR5hQF1FOzX9abh0QMnGD2WCscq0NcHriI8TYrGGoHLai8izUob/3lG3RM1o1LzTpV9QvUk9MGpOnKpeittaONpQZf1RQ0Tyouqx4r6lQcy9Odhq2gKtN8LUG16cG3vZN2v+3zNGwLJhu52J6qUjWm/6OXyr1P7ENq2Ul5XJ0em2Igkkdx/0C+HsuYLN2g4/FEnyzFX1kmDv75cS7IiG+7T6k3ZcNxRK09u6mzihY/5dDyCsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf/PTFTlOdkUKnHcZAhfpkbgu8UuAaf0pPEDI1zKRw0=;
 b=WEUoCs3QJ66xxHZElgkggLxketFlns7nkA+ugAjp8fLNhOgnTsUQuNZ2BNRBBaFe75qmO/YdYE9cOzMjlzGxUHnpEWLndjqn3VqOU/Y4/JwT9kI7+pdTo0RslcksU2q8MdbPJ0XzmMrANIGF1nUsMAQ6RHzMRI1KVwhSDkDETrJRX+v3jrwpLrlWFTBb1w8zoMpsrBtorCCbBRybmI4nDRT6pF5KyHbacv/1PFyTW8ev1CBTKe8wWr8unUxjdpgSFLyYWRdNmXxbQKhQDhNEnMkQZR041RWoW+FDiduB7edaO3zCAG1eI3GE2T5Dcq/t2MWh9aaq3kB4gKZPfbyJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0890.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Fri, 25 Sep
 2026 07:14:15 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0451.014; Fri, 25 Sep 2026 07:14:15 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rahul@summations.net"
	<rahul@summations.net>, "anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Topic: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Index: AQHdSylV/+AHvSJ/TkisWFCqzwhgHrbcn7gAgAGZTwCAAFYf0IAAQt4AgAAPfqA=
Date: Fri, 25 Sep 2026 07:14:14 +0000
Message-ID: <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
In-Reply-To: <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0890:EE_
x-ms-office365-filtering-correlation-id: d1bda444-99d4-4e9e-b43c-08df1ad49b3d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|4143699003|56012099006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: vYsVSQSDo8v6rqb0VWMlI29Jj06H1aazMsTkypisoQu4g1T40zVkFWaBULprTTeqUQBdtX2OXu9ENSY7wFTZPdoCvZ+Zsh+MHfgk8jEvJQ+MUZ9dfKh5XNLa34g/kMd7bE3pu9HBiNL7hJFk5xyD0Q/wo0DYjXrPv5J3VZuqfR2xBjF0xm1ShICmsW+nKPymTEidtQYiShrVWIi8yjfrbOgnXME1Q0YUO7lqrrpXp7liC6UyDxl9p3MOGgWXbcrRHsQY5cQXie7BoAbNWyu+goPzm0HBqcBNzXuK34pOd18nWeTQCitoV79ZPpGFkt9OoDWb+DBPNKW7GtjJI4eJepJKgVB9wE3dgzBAtSVfmRWHno1la5nXnNMr0wUGlGid6qfaPlKXuGf30NRAazmRm6ym3NrCxT455U14/43yzWb8PJ0tk4FZVXHx1lUTb9qN3g4AZfaXcyAsu1EDpBRCWmFwljM7EUbTbIPsYJSMTg2VrHVXdcFelJsvMWXCBjHZ65hp80ZYJsSBDLop9vRZbzdAQuOky6ztKxrK9fY5bvXYPQlEDt/qJSHOJCKvsqC1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk1rNW1pMWxESnRIN0Y4OWFtVzVQU0k2TlVDdGdpcFUzNDdLRDJFNEc3OWc5?=
 =?utf-8?B?YThiSUJBNkpUbVpEeHBFaEZHZXlRMW9hcUhGWW1TbTBEY3l6QW5lanAxRVMz?=
 =?utf-8?B?VnpnYUg4TTBmaXM0NGFZS0dydnNIcWhtY1hiU2ZSeDgrRVJwMHZEajZXWEFQ?=
 =?utf-8?B?d2RPVkZGQ3Z1bnVOajlER3k0R1VpNjNlYW5iMGZaSlo3c0xOVGxEeG5ab2dL?=
 =?utf-8?B?MlZMWXphSjMzVktFRzd2Nmp2SzFvdUFVemlua0dhMlZicEtvOVVkd2hLekZK?=
 =?utf-8?B?cklqTUdNQzdUUUtxWU1aZExNVW1KdTBFQXo2ZWZGYjhaR0cycVVkT1lhMlp1?=
 =?utf-8?B?VlBZUmdodjF4ZVRySEUzNXFUcXNGdTRKejFiTHNCM3lKbTZiOWhrWHdwWE9p?=
 =?utf-8?B?Tk1FM3RIYW1kNDV6cFFxbE9oNGRHdGRNUWFyQjQvTkxLS3N2a2dCNWovQ3RL?=
 =?utf-8?B?dGxPNElhZHFqN1ZYSnNOUVkzTzZDU0l0ZGx5WEk3dVJZcjVzTVVURURYaWxi?=
 =?utf-8?B?eVdvcGNyZkwzandyb2QvQUd1ay9ZWWY4RytOT0twSjQ1alFVWEo4dG9FSXRS?=
 =?utf-8?B?NiticTRCSDNheFE1d0ZGN014aUtBME8vWVlCcjc3Q1l4QlBOU3ZBamIzTWdV?=
 =?utf-8?B?YUJjN0FDTTJySHRSMGMvZjJJNzVIN2pPd094SkNhNHFreXdnMzVaMzRvU2hT?=
 =?utf-8?B?TU90S2Vabk40VXdWYWtTc1lqRG5MN01yeCtTbXV0RlgxZ21wRkNyV2lOam1Z?=
 =?utf-8?B?OCsrTDkvN1ZTUWN4TytaUHVKUGtob1VkMS95eC85K3ZaRU9hUlhSeGVmdzhL?=
 =?utf-8?B?SzJmK2FtRjJVL0s5YWFldlRIbUE4MHZOOW0yVUV0SS9FOEpUNnRKY1JzZkQ1?=
 =?utf-8?B?MVZYNzNOQUVMVUp5alI4b0VLNCt2cEZOd0p6WmMxVHVvRGVpYis1a2lGemtN?=
 =?utf-8?B?TUtibFZUbW9uZ1g5eTFHZ2NUc1NqTmFvRnI3M2hFWG5nSFNNRFcySHhvcG1l?=
 =?utf-8?B?WXNYcEhrbXBLZXVFNDFUNWNlQ3l0Z0lkWlUzMXNkZ09NcXNBRDV2TXZQNEZs?=
 =?utf-8?B?S1Y5ZFRua21Lb21OWW1VWC9qclNmMGNtZFlFcGlJWDFmbmJsYkFSUHg3aWNa?=
 =?utf-8?B?VWYrNVp6eURsVVpaNVlseUE3SXNibDkwdCt6TTBKbm1SdmdEMFBKbHlJTnBD?=
 =?utf-8?B?OVVPeXhLYkZPMEkxbWdtWDBTa20rbDNhbmh3T2l6MDNMeVpUWlIyRWZxOGc1?=
 =?utf-8?B?WDVkZCsyTlFXaklQdklRZ3JjZkNhbW1zZFdydUVaWXF6a3l0OUJiK2ZIdE4y?=
 =?utf-8?B?SFR0VnVET3p5MUNQa1pqQktnYllUQ3M5d0Rsd2RxNEljclQrYkgxTE5YQlVQ?=
 =?utf-8?B?dmdDNEhxeXZ6Wkg0Y2xSd0ZFc2JWLzRPYlRNbE1icjh1eU5oaGtzVXFESDVk?=
 =?utf-8?B?VUtySytZYkZmWmFCd2F2QVNQNkU1QnV5VzhBRFA4NE5MeE9lMGlrdkgzaisx?=
 =?utf-8?B?RGNhUXR3RnRFNG1TMUhtT1M4bEZaR0I2aTZJdDdPT0UwT1BKSW9VR2hsWGQy?=
 =?utf-8?B?ZlpIRmtQek1DdzFzT2dpNE5UYkNEUTJOMjZsTkozQkhLOWNIcDAySi9TMS9C?=
 =?utf-8?B?RlI4K0ZvSGtubEtJMFdpdDlsUjdGcHFlMCtUem82RU5TcHRzT0J1TWc3b01p?=
 =?utf-8?B?WDluemZIelRUYTQvWGFOZ2R3WEIyaGExN2VlZ0Z4aFdnNjNpNjQzaHR5WDBE?=
 =?utf-8?B?MUR1MHlVR25CQmkrUmViQldiQmhKc0VTUGV0NGFNOW9MaVJTcFBjbWhvL0JP?=
 =?utf-8?B?SWVLN3d1U0ZXZ212aE1MNmxjdm5OcmhnYXRiKzdRa203MGdtMjFIbkVRbmw5?=
 =?utf-8?B?SkpWTmNRZVBRcUNhcGFReEdGYWJVV0dKUVZiRk9MVjdRMWpxbnpudWFvQ0Vk?=
 =?utf-8?B?Q096eSt5bWVIUHQ1dit0U2hsTzBFK2ZCakRRMy9seGQzR0pGRWRRUENWVkVn?=
 =?utf-8?B?THp1WEw1MmFGK0NYRlRnZ2N4Zk5nUGMyZjhLWCtFbUN2M29wdEtsNjkxVGNn?=
 =?utf-8?B?RW9GUUtabHltdW0zb3NLd2ZxVkw0cHBBb0pQSUx5dVlKQUZTcHZCWk15Y2Yw?=
 =?utf-8?B?TG1UYk1YZVh0bVhIRklBQ0RMN2JjZ0hyRGIrTGhVSW90M3QxNlB5VFkvRVJq?=
 =?utf-8?B?MGxpMVFQUXdZRHJIL3pZNWhUWG1NWkFRWkZndFVyT3lTd3BTdVdYd3daRnM1?=
 =?utf-8?B?ZHdVY0tYUkdlWHV1SmhsdU83VG5KQyt4M3EyU0ViMHNzK3Y0aCtWYTlXUm5Y?=
 =?utf-8?B?N0RtVGdrR1N0S1JIeXBFaSs5bzJqVTFrc2JLVmtjcWo5VjBCYStabU9uR3VR?=
 =?utf-8?Q?qfIw/Sg30kwZIeb4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bda444-99d4-4e9e-b43c-08df1ad49b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 07:14:14.9047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGNasuGTdpQbkj0xonOJ+OdvZUKEyuUXaJhVI+CxsAr23HQ5W0BVdFM33yBlKS5PMyu7ne65UVLTI2YauWtkDJ+bzkGE7MSvGFLVsVnsbVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_001448_203350_0890B100 
X-CRM114-Status: GOOD (  29.83  )
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

On Fri, Sep 25, 2026 at 08:07:40AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/09/2026 04:21, Joshua Yeong wrote:
> > On Thu, Sep 24, 2026 at 10:00:06PM +0100, Mark Brown <broonie@kernel.org> wrote:
> >> On Wed, Sep 23, 2026 at 10:35:08PM +0200, Krzysztof Kozlowski wrote:
> >>> On 23/09/2026 09:00, Joshua Yeong wrote:
> >>
> >>>> +    voltage-service {
> >>
> >>> There is no such service. Don't invent names. See DT spec.
> >>
> >> Looks like it comes from the RPMI spec:
> >>
> >>    
> >> https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-volta
> >> ge.adoc
> >>
> >>>> +  "#voltage-domain-cells" on the provider, a consumer lists  
> >>>> + "voltage-domains = <&provider DOMAIN_ID>" and names each entry 
> >>>> + in  "voltage-domain-names", the way it names a voltage power 
> >>>> + domain. Both  properties belong to the consumer, so a consumer 
> >>>> + binding describes them
> >>>> +  itself:
> >>
> >>> And where do you explain what is that "voltage domain" and why it is 
> >>> completely different than everything else we have?
> >>
> >>> No, don't come up with your own naming for standard things.
> >>
> >> That also looks like what the spec says (some of the description is 
> >> copied pretty closely from the spec).
> > 
> > The RPMI specification uses the word voltage instead of 'regulator' in the 
> > kernel here. We need something like power-domain-cells,
> > performance-domain-cells or clock-cells that isn't supported by regulator 
> > framework. While I have no prior history on the regulator framework but 
> > the RPMI voltage service drivers trying to upstream here need some 
> > mechanism to map just the domain id to the RPMI services.
> > 
> > The driver would still work with the existing voltage device tree structure.
> > I understand other drivers may not use voltage-domain like RPMI
> > voltage service, so I only add the support for this on the RPMI
> > voltage driver and not on the framework side.
>
>
> As discussed on IRC #devicetree, that's either power-domains or
> regulator supplies. If you need anything else, you need to explain. Not we.

This is the how the existing regulator would look like this.

user-app-a {
	compatible = "...";
	vdd-supply = <&volt1>;
};

rpmi-voltage {
	mboxes = <0x0c 0x1004 0x00>;
	compatible = "riscv,rpmi-voltage";

	regulators {
		#size-cells = <0x00>;
		#address-cells = <0x01>;

		volt1: regulator@1 {
			reg = <0x01>;
			...
		};
		...
	};
};

While the above method works but I'm trying to get the entire simplify to the following.

user-app-b {
	compatible = "...";
	voltage-domains = <&rpmi-voltage 0x01>;
};

rpmi-voltage: rpmi-voltage {
	mboxes = <0x0c 0x1004 0x00>;
	#voltage-domain-cells = <0x01>;
	compatible = "riscv,rpmi-voltage";
};

The user does not need to map any other information under /rpmi-voltage/regulators/volt1 , since the value are being decided by the platform microcontroller.
The fields like 'names', ' regulator-max-microvolt' and ' regulator-min-microvolt' are being discovered during runtime instead.


>
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
