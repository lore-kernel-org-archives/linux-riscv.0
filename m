Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7302C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 01:12:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E222023435
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 01:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E222023435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1DUXbYr5s6PjCfIws1d2v7iyJPMInrfxAVFPTSUIoQw=; b=z0eHuYyMhda8gs5dZAguG67Gt
	DPCXnRoEU4FSDK2Ika5au+JqCrQEfkcN8bydG+5mJwg6eFIcwVhbcangWfe1Kcc/Wykc62DNAJr2q
	8kjSiwI0mRKAkV8+7/0VhVS7TAtQKHvFXfJNVrZaXg9+0vqYo5HDnNB91guyI4Hc/2NPaDtZDgfN+
	2HeXrV45r9RWDrvl87Jc+sC0DXwQc1bWwvRJKYQkJEox0OzItjUxe5g0UcE5kvgyF3HiJySaoHNGn
	FaklSPOv0Gi8ZxXTHSfwQ7t5Si29PCxHFbVENffQPWJwGoVxReMRRn9gdtGL6KUbSKkwOZNPi4QF1
	Ho1hlCwPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzrBN-0005BA-I0; Thu, 14 Jan 2021 01:12:13 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzrBL-0005Ab-Hu
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 01:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610586731; x=1642122731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v4LPmu1Y3WVlCEMkUr7ZCjWEBP6MaUpmUeblTA3F1/8=;
 b=Qdfso9M84N6L9BmjLeXC+eQI+i337fiD92qqeMSAHX0NrpXI9PKu1tL5
 QAt12fjae9Wel0YbcT/10nl4F8JgxTWAWYEVn8Ho6XlAUgEMv3sFFp/+6
 DsNgZV1onIS+skufvySWcWtPQVn+/OQyWGnTexaZuy2P5rskNn4bqqiIH
 rhPPvC8tx9rRn9hh0OLFHVo5+N/ekkcVL6/t/wrulQb3n3k8OF1NoZpxE
 fld1zUpuIVlL8T0DK/7UnFUjXR02xJetUuJzQQRWGn83shxCu5EhV6ltK
 QJXRogzt30XhiFyF7feAV0edsN+eCjN9YAH+bU3dZZ241jKvTcT5xEvDd g==;
IronPort-SDR: t800LgA7sVt679LwwsmJVjUqKUrYebXrgAF9S1vtOre9FblguosIKRXIaYp1+T6zEILLjfloF8
 m/h0PF2AMWCnU9kB2tqXOy6/86MQT31xLMLkMnLgYJKFNA+7HVmM8NfgnV4vKebqDKYvs1wIx6
 8EUxc+JV8D5nlBOY12M7oE0MLZP+wsvYdFzAPVK9yP/s11j5T+SiM42NAJxVljtmnH9ZC03bJ0
 FlMn9gWiS7zWNAjm874VRxBUBSaBF/8RV2Ft4CN6PPVHMSbt3VGkZQVGZlHtmBXcz6GR88kFzv
 w6U=
X-IronPort-AV: E=Sophos;i="5.79,345,1602518400"; d="scan'208";a="267686098"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jan 2021 09:12:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHpDSOROYLCSOgt9SxgaFoksGPLN7B4KGtbYd74eTp836ZPZllewLiYJjwQ7ZmH1GsMD20tLHpHjItPC6isuVrj+U4T1g1fJtFy24Mc5UnNKXggjIIMuQ4RBvgEamkyO5PcCoIlB9HGHaRHk1JRniPFtt+0rRlLtRwScnEeKmttUZyclVt9i1MgYy0XrQTZiFRcgFttEXWtvlIL2Y2/N6FYlrGtRS6hD9S8kHOzcU7w2vlp96FN8qoFwRw7H3NpxroCKYBvwANS7T9b8iMfW1+BeOPyfFtO2nCC0pGoiLgWiGakr657s1ji5YNtCn92SNw9t01EPTf+SGEtIMU/ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4LPmu1Y3WVlCEMkUr7ZCjWEBP6MaUpmUeblTA3F1/8=;
 b=YIky7eqPuvg2evM2p3Unhtoz/XvoQyMhFMvPWPKLGXTEfcHx74u/DVqGQnCKiqOCSu5zQvScommWkjziJ/v/XOzBG9hvCaqvLztJMLkTRWQdXW/gf4T4AOxhPQdXtZ0ooaQiikMdKIYWpzzTr3voJ288SlZyX6SCIYdySHmYDXHtGgsu5a0ELMzBilnUq5dg1T5VtOIcsGH2oaefPffO8HM3I0Lm5kHI5RmLwcc+NsfRwqqbvrXtqkFvhjrn0u6CfkVKnYoQCBH6PJOfkCuc/39kJPA/2yb7a65X8klYdi7X8eZnsEc+Ell+7IkpDkKZJTzZYdTbcVaAqeiZKhPpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4LPmu1Y3WVlCEMkUr7ZCjWEBP6MaUpmUeblTA3F1/8=;
 b=GAvJkWhEYvpRzAVn+01NT5rWIacd8Zn+ndRX4POcQYixZp64Ou2IcS5athBTOlUTbui3IweJQ1+gYAiL75vMn/nJ+b7Jpa6r3XgHk5Qg3sDMk0Gf6UQNkLiJFuzQCUefezXpFj3PL7WTaQgqu28gV181OnRhC5Gp9RFHs1/GJog=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7078.namprd04.prod.outlook.com (2603:10b6:610:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 01:12:07 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%8]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 01:12:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d056olOk4AgAAzcACAAJ1mgIAASGmA
Date: Thu, 14 Jan 2021 01:12:06 +0000
Message-ID: <be5eabd7ae8cd86c467b08dc5e457248551e5372.camel@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
 <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
 <14eb3ad4c736b30a790169854878aeec019f9004.camel@wdc.com>
 <161057117528.3661239.31662832878817559@swboyd.mtv.corp.google.com>
In-Reply-To: <161057117528.3661239.31662832878817559@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e55486f7-9fd4-40db-c56a-08d8b829690d
x-ms-traffictypediagnostic: CH2PR04MB7078:
x-microsoft-antispam-prvs: <CH2PR04MB707805A110C5492B72CD98F4E7A80@CH2PR04MB7078.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lLArmiYw0Gc6e8yNRhr+gejbBZm1qXbsoriUDnkhoDJhbaIE9iAg4BPd2wnjHcm7YHd+CjFRiRMMxp7Ff4+D9aVXLmkeuEZmC62hCnJjTvoMNYSEOsjxK7EjHh6S2UCxP2c8lzn6WQIHUkImKOJuQ9yf9Jszlkn8tM4DNQXv2nM3L+KxrgtksBNzc9fSnw4DfxFKcw6+Tr3oQMUA6bsqW/NqfF58xno1rkzM0apBP7+ShgXqyqLaosJ7f747aBAwUlOoMlhhQo6fvFNyAQVyka7QgTZymSxa6Vm3GncsBcYe3OOTu96D3vobh2bl5VRccLIjY7QcL2053WdraIsXKoKacR/ov+DGnMm+CpmRNoKEE5VnVwEHbmU+IRQsR62LN9BuvgdFwj9tshqPNpeNuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(110136005)(316002)(2616005)(4326008)(8936002)(8676002)(6506007)(186003)(76116006)(83380400001)(91956017)(2906002)(71200400001)(86362001)(6512007)(36756003)(5660300002)(64756008)(6486002)(66556008)(66476007)(478600001)(66446008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?T1RYdFQyd1FHNktidUwrdkpRZFFGUTJtWUFrUytCc2E4L0FNK1oyV285TmNr?=
 =?utf-8?B?cFJCbzZ3aGMybHpsQVJlQ0lIa2czamJMVmRsekVtM011TDZ1cXVONDBQeU9F?=
 =?utf-8?B?MWwzQk1PSy9Vbzl5R1VZeE1zMlBsZ1lwd29HQ0VkejhsclpSc3Q4ZFF5MzZU?=
 =?utf-8?B?WTh0WEtaK0E4TWhhRHpWalJkQlhXN3FJazIxS0VCOERSTTV0dVc5eDdJM2d4?=
 =?utf-8?B?Ky93aGw0OGpwVnBpa1NJbkVhT0ZydGJ4aE9nTEorT0V3OFVFdlVYMUh0WlFE?=
 =?utf-8?B?eEFod0Z3eWkwRUxDdEorL2FMNEFsWEdMY0ZON3FrVzd4bjB5ZlV2TUJkN01U?=
 =?utf-8?B?UW5wZWVpODNOQkVrNExrUnBXM3hZSVVNTHpZRGxhU3daNlhSckVmd21jWGpl?=
 =?utf-8?B?RGhoUHhrbFZQZWduTGI3bUFhL0FpYTE2MmwzMC91aDNPZUgraVUxQzBlZUdK?=
 =?utf-8?B?d3NaMjZ2bTdyWjRhaWtqWVJuMXhOSE5TSmlyWiswN2k0ZXAwSDVjajhqMC9T?=
 =?utf-8?B?YU1hb2lpRWsvOEF6QTFDenVKSHZhSW5Lc3ZpdU4zZGluUk45bnJPNDQ0UlV5?=
 =?utf-8?B?Y1c5NDlGakpSMXUxQ0xBUWdpMzgxRDhHdjQvMHFTY1V1UmtheEJEN1lYTFdi?=
 =?utf-8?B?c3liRTJJTlo2bXIvcVZDV1hhSnh2SlBXWW1zdExvd2JQcHlkOTY2TEx6b0Jl?=
 =?utf-8?B?VlhkOUp6d3U2V2FQb25SMUNrNlM5L2VvSDZvRG9uMHZrY3ZpdXJ5bnUvNjJt?=
 =?utf-8?B?WWVJNUk1QnAyZWNDRXphTDRnTTc4ZXZvc1g5VEs5Ri9pcHdsdndtSm9HQXJn?=
 =?utf-8?B?SllSR1JpUHByRWVjMjRSczlEUm96d2dseldaUUwyRGxrTDRHV1pIUXBVOHR3?=
 =?utf-8?B?SmRQWlBVSVU3elU2Tk52VGpTamZDZmJ5dk5UM3ZuOEtKOUltcjEzcktyeUF1?=
 =?utf-8?B?N3JTcW1OblFHNC8rdzZHdDhSZE91Y0tySStDWm9Namo1M0U2ZlQwZ0l5Q1Z1?=
 =?utf-8?B?OFRsR2lxelV2R3J5U2o4R0wyRWxnZDN6TGFhdkFhVjg5NmdGZVhXNVNOaUJv?=
 =?utf-8?B?T3IraWhRcm9ZUjNzNEJGWlNFeWhwdUVnM1ZpZy8vSi8xd1U5aXVoeDlhRkRv?=
 =?utf-8?B?cWRBYmlVckJjeTB3VUg4Rnd2STVVNDlHMlVUQkN4MkdPY3N5Q2RORG5UdjM0?=
 =?utf-8?B?WVJyRGFvTGUwanRjc1U2WFBiZ3JhVW1ybnF6TXNpZERZMU1MaitWMGRYMm5U?=
 =?utf-8?B?QUhHNWRISzFkaHc5YXUwRE5kaktXMysvYXBMRFhVWS9RODdJV09qYnZVWXhY?=
 =?utf-8?B?VmoyOUkzSlZWNlhYK1NJb3REZlMwRU5kUDRGM1ZYM2M1Tmdaa1h4T3Brdmgx?=
 =?utf-8?B?aVNGZXVGQWVQVXZDM3hPMUV6dEJ2a3c4NkNTc1A2QXFoK3lEYUVzU0VOWDJu?=
 =?utf-8?Q?E90u2ITV?=
x-ms-exchange-transport-forked: True
Content-ID: <0E7CA37CB1588940B20F3C613DB41B7B@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55486f7-9fd4-40db-c56a-08d8b829690d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 01:12:06.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUfOQzjP4iLZfc3JgovYWXINHzvqSPGxLwnLL08mTxdWW26/ymM0Hc81TLbWAXq3Ja13W4DeeHB+ucf8jOJCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_201211_928171_EF182BE4 
X-CRM114-Status: GOOD (  20.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDEyOjUyIC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgRGFtaWVuIExlIE1vYWwgKDIwMjEtMDEtMTMgMDM6Mjk6MzYpDQo+ID4gT24gV2Vk
LCAyMDIxLTAxLTEzIGF0IDAwOjI1IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+ID4gPiBR
dW90aW5nIERhbWllbiBMZSBNb2FsICgyMDIxLTAxLTExIDE3OjAyOjM4KQ0KPiA+ID4gPiArDQo+
ID4gPiA+ICsgICAgICAgLyogR2V0IHRoZSBzeXN0ZW0gYmFzZSBmaXhlZC1yYXRlIDI2TUh6IG9z
Y2lsbGF0b3IgY2xvY2sgKi8NCj4gPiA+ID4gKyAgICAgICBpbjAgPSBvZl9jbGtfZ2V0KG5wLCAw
KTsNCj4gPiA+ID4gKyAgICAgICBpZiAoSVNfRVJSKGluMCkpIHsNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHByX2VycigiJXBPRlA6IGZhaWxlZCB0byBnZXQgYmFzZSBmaXhlZC1yYXRlIG9zY2ls
bGF0b3JcbiIsIG5wKTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+ID4g
KyAgICAgICB9DQo+ID4gPiA+ICsgICAgICAga2NsLT5wYXJlbnRzW0syMTBfUEFSRU5UX0lOMF0g
PSBfX2Nsa19nZXRfaHcoaW4wKTsNCj4gPiA+IA0KPiA+ID4gVGhpcyBzaG91bGRuJ3QgYmUgbmVj
ZXNzYXJ5LiBTcGVjaWZ5IHRoZSBEVCBub2RlIGluZGV4IGluIHRoZQ0KPiA+ID4gcGFyZW50X2Rh
dGEgc3RydWN0dXJlIGluc3RlYWQuDQo+ID4gDQo+ID4gT0suIEkgdW5kZXJzdG9vZCB3aGF0IHlv
dSBtZWFuIGhlcmUuIEhvd2V2ZXIsIElOMCBpcyBub3QgY3JlYXRlZCBieSB0aGlzDQo+ID4gZHJp
dmVyLiBJdCBoYXMgaXRzIG93biBmaXhlZC1vc2NpbGxhdG9yIERUIG5vZGUgdGhhdCBjcmVhdGVz
IHRoZSBjbG9jay4gU28gYQ0KPiA+IGRpZmZlcmVudCBwcm92aWRlci4gSGVuY2UgSSB0aGluayB3
ZSBjYW5ub3QgdXNlIGFuIGluZGV4IGludG8gY2xrX2RhdGEtPmh3cywNCj4gPiB1bmxlc3MgSSBh
bSBub3QgdW5kZXJzdGFuZGluZyBzb21ldGhpbmcuDQo+ID4gDQo+IA0KPiBDYW4geW91IHVzZSBj
bGtfcGFyZW50X2RhdGE6OmluZGV4Pw0KDQpOb3QgZm9yIHRoZSBiYXNlIG9zY2lsbGF0b3IgImlu
MCIgYXMgdGhhdCBjbG9jayBpcyBjcmVhdGVkIHRocm91Z2ggdGhlIGRldmljZQ0KdHJlZSAoaXQg
aGFzIGl0cyBvd24gZml4ZWQtY2xvY2sgbm9kZSkgYW5kIHNvIGlzIG5vdCBwcm92aWRlZCBieSB0
aGlzIGRyaXZlci7CoA0KDQpCdXQgSSBjYW4gdXNlIHBhcmVudF9kYXRhOjpody4gVGhhdCB3b3Jr
cy4NClNvIEkgZW5kZWQgdXAgcmV3cml0aW5nIGFsbCBwYXJlbnRzIHNldHVwIHVzaW5nIHRoZSBj
bGtfcGFyZW50X2RhdGEgc3RydWN0IHRvDQpkZWZpbmUgYWxsIGNsb2NrcyBwYXJlbnRzIHVzaW5n
IHRoZSBwYXJlbnRfZGF0YTo6aHcgZmllbGQuIFRoYXQgcmVtb3ZlcyB0aGUNCm5lZWQgZm9yIHRo
ZSBwYXJlbnRzIGFycmF5IHRoYXQgSSBoYWQuDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rl
cm4gRGlnaXRhbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
