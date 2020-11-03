Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338A3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:40:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB5420757
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocbPs7zp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GPsOvxc0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VT7YiK0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB5420757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FmvAcbTjPlLjvQVAoR/Ykb0RZjg8GZW8bEcz6flkAwA=; b=ocbPs7zpdZDCG70DGAXuK2BLj
	plQBfJOxhmMzT+rwKrksKRqjDGSXZh/e20mic0BD2UWCAtEEIrBCoe2RccIROpOLOwjhGHp0z9Lim
	phrZ0on8ARxbmHMoWQFfXq20Tk84qemqJ824Sr+WVz61o+NBzqeY7hTY1nisDG+ZiWeHDzeHvISA3
	Ic20NkEgIHf3dSHrkiHel7Jp/8QsWxF4a2b5Tp2YiWOg7LcRVWm5qkQmcuSXMijld+r3JABgBFJrj
	LDZKIGwyMo8TUcHMBYPbaAgv7wWOVigcRW8Igiqh6xzgUvc8p5bK1bDvOmZ9Jf6nFTTMb5HsYbmWf
	vgyPt53QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1E3-0007oL-6w; Tue, 03 Nov 2020 18:40:11 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1E0-0007nF-LV
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604428808; x=1635964808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uZUNn1sf5G/dOV4Dx4fF6HoMps20/a9pFJimrZd47r8=;
 b=GPsOvxc0g1OjakQ79qh9l+ejNQW5/I+LnGFNAWySX8Ktj9u4dlclqS0s
 QDxlL5aMieuT9I6FGRQ+HCB9kvxv7d8FVJ88vW/o9G18ajKUyMIZMkO5I
 RQLzMghSDJ3sy0ornDilmpRMUuIoo86czy9A7yaD4jhl263EVQMBZFvj9
 DPgr99cbt0G55ZWMhlBZZ0iTaZBnCZnjkvDELANnsYdK0rm1vBr914Ssy
 OH9Uh2Re/3vp0XG4y6c9z2DsiEmCIlDu0IwJBn0j24M4q0uRsu/zG+Bmj
 nUmCYSsaTrNgtdZqB5rLw8ct7Hmm7FACtzcpgGz5npzqnaoZjaaNP/iqb Q==;
IronPort-SDR: 510GtdK6Vk/x5cGf5ltlLISAmA5q0vAh6qdmLXH2LBrvDQ7kxz4eCMIuYw1I78bJsf1jAiP0Df
 LPItiOOuEPdHsGogKPrOcIHO5PZpibkM2uVcGX7+AuKIbvJaXO6AXT0KxcDWXcPmk74/SVmchL
 8iFoUqMVAdCqQFNeU3CL6x7s/6j2ZOs0hCxh84qDr/OeokeS0RFccdDzv/I3TiX2qnZWprqXoq
 ze3xyTn2FVY6vMCvw9wK8V7qXjT1TsrHPFIfMsAAwG3bcGbKNiFy2RYBd0GLFANzd0FHVONqGz
 1VY=
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="94931708"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Nov 2020 11:40:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 3 Nov 2020 11:40:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 3 Nov 2020 11:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAE3qgdAMv5xZkRC/KP5B+eFyU4V/qjEh/ZHzavx1foHTlEOKwhanWAbIi1mOz/31tANFi/oW+Flx3AtOJOd9kWuN3h8bz3ecixpHqXNV3AfRlqCBdHTdOY4hNtb7Qlu7NtxTMJDYZwbOiea0cRDaSn6qMmN7RyctjZ/zO5vSR/XcI1vWGjZsR8xnQNkEkZ3WOwtLHP4w+vuGFTBToIllaoqD3MvtFKxmEayfO9EQN2TXc7jB/m/txYLU97qjMD3OvvRkwOckHexhZ7mHKWQwatd+5fd8QfIoBx8qxK7JOOnl4SptBYBplv8uLMNazkNu9E4jaZRAkU3TNB7mAHHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZUNn1sf5G/dOV4Dx4fF6HoMps20/a9pFJimrZd47r8=;
 b=hN9AUFqBvXyxK3BfWkdHRUDJXXqU8/TwsTL1SxiPtIVhWK3Urz02ibEiIQS7+6B3dyVRzKofsNfPrtKOzorQnQIxyEb+/TbPvinAUTAUDBu+1xShNNIrNO1P8oDxZi3D78xXpUy04WkJABzN9Vlq/MLjXFb+XpLipmvC5iCSadljkO/gpVL6YeXXBS/KINwYc0z5x0IoP7GXsFVdfR8e8qZdPo69HqYhFeSjCvQxrHmQX2cgAwmAQKHW1eHdoiBHum6Bk1GFRzmtEC1vTkjUfWL+PjsC3/MdkKhnsPOEaS59Kyj82AIeXNoV0zlUBKaH7NP4cQ21CWLa2H2uJo8dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZUNn1sf5G/dOV4Dx4fF6HoMps20/a9pFJimrZd47r8=;
 b=VT7YiK0xBSZr731Z0iYpx+6xwWf2EwzCKCXTSWN3vpIg7G/azqEAetkZ+gUdpkBPc3eBoYqL/x7awj/BdYpdWSKDK6E9uoSQ3eiGXjHhMr3HRJJEU8FwqaLK3kTm4bkqaMeBdxWNOuFpcM4FaOCilOa3UJKei51XBNHiX5ipvMU=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM6PR11MB2636.namprd11.prod.outlook.com (2603:10b6:5:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 3 Nov
 2020 18:40:05 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 18:40:05 +0000
From: <Cyril.Jean@microchip.com>
To: <ben.dooks@codethink.co.uk>, <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWrYIX44xaU0n+lU+FVu/TfSg/namuYDqAgAFcagCAAO0agIAF4V4AgAAzBwCAAAUDgIAAA1IA
Date: Tue, 3 Nov 2020 18:40:05 +0000
Message-ID: <21ded848-5dcb-ccbb-acd5-391bff667a53@microchip.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
 <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
 <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
In-Reply-To: <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: codethink.co.uk; dkim=none (message not signed)
 header.d=none;codethink.co.uk; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8f65465-5688-4a75-ea3c-08d88027e1d2
x-ms-traffictypediagnostic: DM6PR11MB2636:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB26364DDFA755825662BF41889E110@DM6PR11MB2636.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNxhGSXZ5lSob9170owXqR7akf3A2Wxlm2dFnWyQLNJF2DqEolUfqdvzOIZ0bX+BiG4dSPwCRp0tbCnF5U9o0dhETIB5GkAix7zEBGhRiNuR/zZd1pFQI2I1zS4U9dkpXAryTwNZiX0w59ngEFIsTwFP6GWjC+Fl56IRYr7oGIlVb8HCB9lxFwmOI5x10uDiwuQLO5GV59Pi6k5uDmMb56zaOaAGlz3fOepmjHQHkSFaaV1ukCzlCbgreRuWSVIV/IbI8298rl/zgA6h0q3n1lvqlmQos+AflB0u3kbKOrcrr6ytiBtyfghLqxeLG6Idco8VPtI+h/ucq+mUV38YJfYfeB9Q2OtiJ2mE5A1+bk6N4iWWneiuqmSS6iav/3w/mQ/rWh0AK6rV5D0CpDwdv9F8Y2PT+B2cCkyypr8j7fm+bXZwxHc09IR7UKyYw20xLsIN0Z3ARR/Xeeehk8wUVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(376002)(39860400002)(366004)(8676002)(31686004)(7416002)(31696002)(6486002)(8936002)(966005)(71200400001)(478600001)(316002)(5660300002)(66476007)(66556008)(91956017)(6512007)(64756008)(66446008)(76116006)(36756003)(54906003)(110136005)(26005)(4326008)(186003)(2616005)(6506007)(53546011)(66946007)(86362001)(107886003)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Hn/EH31bQkbx4pY2kFlUtXAOv/YzaaEBjn5MmDA/K6Nt7YIsL910/QCg7TkKIO+KR+SWex0VhgW5G9ELyolyYF44/EFWzsFpzl8pjerV6BQFYug5G2DRo4j8R/Q2D+U7nFt61x7JytrhFTLLvDhaHkINwGbEB813G2T5BfEH1Huk4ukWED6d9/mZaafIZYgWoZL+KeAM3XlLa1/DrqZiNl5ABBBlWDxIZq+1bGXn2+QMEK/A4bJNtLXgy7TRTs4seiY6X1jv+OlZ1X4RJCm+u44r9KcO1qQAaotUyzG+Ay3IpwSSx5kJWNk8VK6Qwde7G+k9O+qDawYatyFMbkc9AhvgKZpSf7/TTM5+VNEHHbRWw40kCmW+l6a7b3S7p9OWiEw3NTtazAxGPsEmmsh9sxMCSNECIwFV9bezWE6jMrQ5qSIlwaSQrKnRP6gZ3w1NG3syc/fwLa42ZW1QWAL8nSOxwzXivNI6mZjkY8myKZGfAmUG0c1eLQt+WhEK+3plog1ShLJcNyhSeMX1HVywHDC2PemiOb+GbQGIhbKMpCyOo9nsrFXT2fQgJKI2WkJJZb/qpJ9GarhvOz9TvRZJ+Jkb9BHPnycIy/ghOhQtYOtOwv+S+duc54qybZyXyIsUfGPFJhqGtw5d8WCg6jJtlw==
Content-ID: <606A4209A86AC54E8BBC62942DDB2439@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f65465-5688-4a75-ea3c-08d88027e1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 18:40:05.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55nygByUTUu44PpM5y8E58mtHJ/Ht152WML03b/ywa4r/awpKjWuWBERtQPkh3swa+fMxwAqN/u+pFZ25dKdhT6OODZ8f026WO/vFm52Dls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_134008_873990_9AB60F22 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Daire.McNamara@microchip.com, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, robh+dt@kernel.org, alistair.francis@wdc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 Padmarao.Begari@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMy8yMCA2OjI4IFBNLCBCZW4gRG9va3Mgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgDQo+
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4NCj4gT24gMDMvMTEvMjAyMCAxODoxMCwgQ3lyaWwuSmVh
bkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMTEvMy8yMCAzOjA3IFBNLCBBdGlzaCBQYXRy
YSB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSANCj4+PiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+
Pg0KPj4+IE9uIEZyaSwgT2N0IDMwLCAyMDIwIGF0IDI6MjAgUE0gQmVuIERvb2tzIA0KPj4+IDxi
ZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiB3cm90ZToNCj4NCj4gLHNuaXBbDQo+DQo+Pj4+PiBA
Q3lyaWwgOiBDYW4gd2UgZW5hYmxlIGJvdGggZU1NQyAmIHNkY2FyZCBhdCB0aGUgc2FtZSB0aW1l
ID8NCj4+Pj4gSSB3b3VsZCBwdXQgL2JvdGgvIGluIGJ1dCBvbmx5IGVuYWJsZSB0aGUgb25lIGlu
IHVzZSBmb3IgdGhlIG1vbWVudC4NCj4+Pj4gT3VyIGJvYXJkcyBhcmUgYm9vdGluZyBvZiBlTU1D
IGFzIHN1cHBsaWVkLCBzbyB0aGlzIGlzbid0IGdvaW5nIHRvIA0KPj4+PiB3b3JrDQo+Pj4+IGFz
IHdlbGwuIFRoZSBlTU1DIGlzIDhiaXQgd2lkZSwgYW5kIHRodXMgaXMgb25seSBkZWxpdmVyaW5n
IDExTUIvc2VjDQo+Pj4+IGluc3RlYWQgb2YgMjJNQi9zZWMuIFRoaXMgcGVyZm9ybWFuY2UgaXMg
c3RpbGwgbm90IGdyZWF0LCBidXQgbG9zaW5nDQo+Pj4+IGhhbGYgdGhlIGRhdGEtcmF0ZSBpcyBq
dXN0IG5vdCBnb29kLg0KPj4+Pg0KPj4+IEkgYW0gbm90IHN1cmUgd2hhdCBzaG91bGQgYmUgZW5h
YmxlZCBieSBkZWZhdWx0LiBVcGRhdGluZyBzZGNhcmQgaXMgDQo+Pj4gbXVjaA0KPj4+IGVhc2ll
ciB0aGFuIGVNTUMgY2FyZCBhbmQgd2UgdXNlIHRoYXQgYXBwcm9hY2guDQo+Pj4NCj4+PiBAQ3ly
aWw6IElzIHRoZXJlIGEgd2F5IHRoYXQgd2UgY2FuIGVuYWJsZSBib3RoID8NCj4+Pg0KPj4gWWVz
LCB3ZSBjYW4gZW5hYmxlIGJvdGggYnV0IHRoaXMgcmVxdWlyZXMgYSBtb2RpZmljYXRpb24gdG8g
dGhlIEZQR0ENCj4+IGRlc2lnbi4gT25lIG9mIHRoZSBndXlzIHByb3RvdHlwZWQgdGhpcyB3aGls
ZSBJIHdhcyBhd2F5LiBXZSB3aWxsIG1vdmUNCj4+IHRoaXMgYWxvbmcuIFRoaXMgd2lsbCByZXF1
aXJlIHJlcHJvZ3JhbW1pbmcgdGhlIEZQR0Egd2l0aCBhIG5ldyBkZXNpZ24NCj4+IGFuZCBIU1Mg
dmVyc2lvbi4NCj4+DQo+PiBSZWdhcmRzLA0KPj4NCj4+IEN5cmlsLg0KPg0KPiBJIGVpdGhlciBt
aXNzZWQgb3IgY291bGRuJ3QgZmluZCBhIHdheSBvZiBmb3JjaW5nIHRoZSBib290IG1vZGUgdG8g
YmUNCj4gZnJvbSB0aGUgU0Qgc2xvdC4gSGF2ZSBJIG1pc3NlZCBzb21ldGhpbmc/IEF0IHRoZSBt
b21lbnQgd2UnZCBsaWtlIHRvDQo+IGhhdmUgbW9yZSBzdG9yYWdlIGF2YWlsYWJsZSBhcyB0aGUg
fjdHIGZyZWUgb24gdGhlIGVNTUMgaXMgbm90IGVub3VnaC4NCj4NCkN1cnJlbnRseSwgeW91IG5l
ZWQgdG8gcHJvZ3JhbSBhIGRpZmZlcmVudCBGUEdBIGJpdHN0cmVhbSBvbsKgIHRoZSBib2FyZCAN
CnRvIGJvb3QgZnJvbSBTRC1jYXJkLiBUaGUgZGlmZmVyZW50IGJpdHN0cmVhbSBjb25maWd1cmVz
IG11eGVzIG9uIHRoZSANCmJvYXJkIHRvIGNvbm5lY3QgdGhlIFNEIHNsb3QgdG8gdGhlIEZQR0Eg
YW5kIHRoZSBIU1MgaW5jbHVkZWQgaW4gdGhlIGJpdCANCnN0cmVhbSBjb25maWd1cmVzIHRoZSBG
UEdBIElPcyBjb3JyZWN0bHkuDQoNCkxpbmtzIHRvIHRoZSBwcm9ncmFtbWluZyBmaWxlcyBhcmUg
Zm91bmQgaW4gdGhpcyBkb2N1bWVudDogDQpodHRwczovL2dpdGh1Yi5jb20vcG9sYXJmaXJlLXNv
Yy9wb2xhcmZpcmUtc29jLWRvY3VtZW50YXRpb24vYmxvYi9tYXN0ZXIvYm9hcmRzL21wZnMtaWNp
Y2xlLWtpdC1lcy91cGRhdGluZy1pY2ljbGUta2l0L3VwZGF0aW5nLWljaWNsZS1raXQtZGVzaWdu
LWFuZC1saW51eC5tZA0KDQoNClJlZ2FyZHMsDQoNCkN5cmlsLg0KDQoNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
