Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCEAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry+94+OR3ma1MNXyy8n09gABWBElni3TL+n3GPxYoA8=; b=iAlovEz6iAZZtB
	XLUwzoq9M0lfPK/gCOtML8+b1C0exOeBN0kAOzZq+cf4u1bZMVRY39PX9s5CNfq6D5jJ7wQ2SBgDZ
	uUz2pA1y8bzwOe9I6WS8fJzQcmzbkk1bAXBXERqs5syAG1sOMQwmtBB/yuEsbaj5ze9aswNz7qO5Q
	BUkdbu6A8pigWi0/uYRQP6n5FkHXyabFqzjorDncay1fYDaNq7MonokK4ZUwGD3zekwpUsQiwdq2t
	Xgr2liK9QsSh5kB84+VajDfEtKtzIFx00QeN9zDit9rp+Tl7Ha0Flt4j0j+d6MmdWL44EiNUccOaW
	XQ5sQu8vSvHXZKI4OqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neF2p-00DqfT-NM; Tue, 12 Apr 2022 11:50:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neF2X-00DqWN-CN
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 11:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649764233; x=1681300233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=N8EiaU9oi7fBPrWoROZH0dC9C7AVidao+iLs23umZsA=;
 b=hSE+nHtHlzOne1qfyqa4K1s2yQlr7H8wH5GZnwDxeTgwRPcm+xYHmQXD
 meemZcjUJlBfUMwlBVLh0NVPZAm/+65u9pIQjaKOddz+vQ5WqGnuYqZJd
 byHGlHhBuPhWO0Oij2Gw7MbDHCvV++zY6eoISoRykVcoqTtH9gnR8YStP
 c5otDWdGfehhM3ZYQTqWg0Thu3sLA2hr2oQ7DrrHrt+lYjy0slHNzmH3A
 kCEmi41H0u0ja/N1cSz1HBNBQBvgbpYwS1WixBRiPhhVM0H41wgeEJ08A
 BUEShYJYeZ02avipUlht8a9EM0a+x33FWalZbRuvF91lBoYjil6zbYwJR g==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; d="scan'208";a="159808187"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2022 04:50:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 04:50:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 04:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC2YLRbtgenX5CKjyz9v/kCTNJaHcBKPXZv9mTaORNP7RfEQvvyoHxSLVTT2pgdHXW0G2CXuX9ZiDpf+ZnwI7YzouixcuebKjHlHMp9TbYz3Gs5bkVR4p17pFK3DbqArmtjDrhNE4imw8cg631fb3sb8rjNrcYttFqzY2GnEDoKId+OhK+qA+gEyLtyzjwhz/FdK5vsS8VC5jJ+/Cz8lh3EUdXcO7OBiEM7QT7flnqK3fPD9KwJsDwbpHH4539zDQ+CGGAcF5PuwIhaaQxBFlKbut0Gx1izGaUWBkeXgtWHqs4WI1HDxUZgflMugm61G6LHQSlRTnB33SxDNsghCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8EiaU9oi7fBPrWoROZH0dC9C7AVidao+iLs23umZsA=;
 b=N22rjMy7VbR92vAFN5vUEwL5y66LjNfezd6xt6IJ2anaKYBvGvtYP4we9sWnJrb9OrprhON7mIV5L9njJ67SDeFsWJ59nU1SvSYXtORC2yqrggIBImRD91T6pUCxa/z/uebSZEp2HJf+X/xJB/qWwui9yCVxpMgAdWzdDiwvYPxikBiKbRKSG4xihJSHM/SHRoPn68fs7+eCe5AIWbQOSruKxUEObpD4decTx8v5vJ2IB0j8/An6Tc0uK4SIDMtZRXl3f8XXR0QWOQOfIYoxww0fTd8p/yJRPUb/zDfxPHBQd5niAt+JXxwaKTiGg9tanBb1cpu7blTPcmcOhpHAvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8EiaU9oi7fBPrWoROZH0dC9C7AVidao+iLs23umZsA=;
 b=Mebi6DVQNYXETQc8aNJFht+zGLXn1TD8mmkKfhLjnyyYA/LATb4Ei4knZRsD1YjuoeY9DZukpJXFgM2NRaLva3bR8iluI4OErrBNk9CAObJV3ZacZUTV6rf+rX00gaUb6ZVrHCB6HTLHgW5I4phHMSq/PiPhLJjcps8My1Z9BUo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN7PR11MB2594.namprd11.prod.outlook.com (2603:10b6:406:b5::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 11:50:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 11:50:24 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
 <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <Daire.McNamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Thread-Topic: [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Thread-Index: AQHYTYKzu5IZP6E2Tki2EtKyznI9lazsK1gAgAAAhIA=
Date: Tue, 12 Apr 2022 11:50:23 +0000
Message-ID: <332be90a-af75-6f75-490c-93398161a8de@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-7-conor.dooley@microchip.com>
 <e202a170-5d94-7484-897a-51718c97eb35@linaro.org>
In-Reply-To: <e202a170-5d94-7484-897a-51718c97eb35@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b0d8ca9-ab81-4851-f693-08da1c7aa111
x-ms-traffictypediagnostic: BN7PR11MB2594:EE_
x-microsoft-antispam-prvs: <BN7PR11MB25945679075DCA67A13AD0A898ED9@BN7PR11MB2594.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lBxCcg3soo8DpfMaSMupsdBcOqYskOIEBW0PEnYRr7SaDEC/C+8vCZ2sfoNqW8bnXT24l9YELVxiV0khOdrQwbx3d7ohgkX9B5ofRpQODmykCb9ZAQGDauYFrFTKKHqF8q7FCqQWRVkRNnSTtX4MY7JQyWiXbc2uF1d+q/xBV+1XMsYSaSvTy7rncBxQmiaz+w73RUoOkhUQ6aTbn2PGNZugbYEWXd8I99eMvfiMPsm/o2R3S2PIaYhRdfq73mhNR5eLuhY7e4LTnh4QqW/YAvKvK5GiaKf2rEcQQflGlNmHpzZHpAkflVzeHkstq6ICPGoZD4M2OEH4Lz/khnmz5I6i5u2HgJ3VlFuSiTGSmE1xWw8NGBajBnJWPsZZTYn17lKT3hhPPbwjGFBibET9kO00VCzNY35+rTu3UqAyKlZVpaRxf7GhYdNBsL0zAhnaruowT2Ncpxk6ULTM+YgOV6oOv+E0V0KkKsxluX0+xnWk/2fUlXfsN7ZZtoae1u0Au0ikElZp3Ghan+5lU5AxE7DyZdxPovAXhqZYqbj3buFS6JO7JpRTmPaRYFLkbK+tuKQ6U8glKex83iroD2pO3zf/MiiZkdUDFk98/Ntsx5A1igejCwGo6OzBbP3cKiHmC8/HesCQCcAQBMralQ2P17Iu52q2Jm6cpJ0Ng8Z/GnjVud4WREjI0tb2TodySoWL4BKiM40YFxYASaB5uqXdCohA9Yd8L8j7mSi3xztRqQRpUNYbuMD3FAlYvCMsRyckgsEOSq3j8ru6EkFwhLFXNb21Dkn6SsXF4Zbo3HC11Cs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31696002)(66556008)(64756008)(66476007)(8676002)(66946007)(8936002)(186003)(7416002)(5660300002)(38070700005)(921005)(122000001)(2906002)(6506007)(83380400001)(6512007)(4326008)(76116006)(38100700002)(2616005)(66446008)(53546011)(91956017)(26005)(6486002)(316002)(110136005)(54906003)(71200400001)(508600001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjBXd3ptRXljVlJ3U2YwZFIwcVd3ZWhkQ3Z3aVgrQlNvTitXSngxREhwYnBD?=
 =?utf-8?B?akRFZTRvMmhxaUExVGREanZXdk1TZ1g4aXFnWEtzNHZoNmNVQTZiQjJycWYr?=
 =?utf-8?B?ZVhlanJjTmJ6d0ZsQ0ptQm9iVEE0czEzQ0RxN0ZMcE9GbWRER3JHOWdMS21i?=
 =?utf-8?B?ZWgyUUhzZzBZenFVQ1dIZ0Z2bWhpTTBvQlNnUEREWDRhR2FsUWNjVnY0L2dp?=
 =?utf-8?B?NmdkOUVvaFl3T0pUQnNKWDFTQlZxeFFnSzROTWJYRVM2bHUzT1FvTk5GbHpX?=
 =?utf-8?B?SXFZdjk5YTFOUit1SHNoRFpiUkRzZkVPeDhqcVlTS29saVZVWGpJMWE1aG1k?=
 =?utf-8?B?UWU2UkFjT3VLWDNPdmZlaG5LdHloYnRKWXlyK2JaNXRZUlRSa1dyamlxa012?=
 =?utf-8?B?Y1ZtejB6R3gyZjJ1dUJvaDBLaGJxSGs4eVg2V29VWGxUMU1idUVBNWlSaThC?=
 =?utf-8?B?T1J5SmtkNzYyZXpZNjNUdU5kbHFPOGxBclVORlh6SUx1b0ljRUFFeHk2OUZ6?=
 =?utf-8?B?d1BRSTdMWFMxb0s1ait0WlAwenc2QkNwaDA3NGNaNWw1Z0lPcFNqRzFJdllG?=
 =?utf-8?B?aVRZRzZReEJEaFE2SGsrcThONGxwVndtRnJKQ1ZnVjNySTV1UjV0dWMrblYv?=
 =?utf-8?B?alo4dUprMi81QnZSUlpZSGFrV2Vzck44QmVmYTFkY2VhZjN1bWxtMTM1dWxE?=
 =?utf-8?B?T2JqSTMzSWdwTFMvVW5jOXNjMmhkNnkrVDUycFFYK2pjUk93U2FFSG5aVHQv?=
 =?utf-8?B?KzY3WXFCNkNLaTdJNGdZTjhXR1N1bkJ1ZE5DQVYzRkRxU0JZbmJVNzFmQW9W?=
 =?utf-8?B?aitRcmJMYkxmbXR2bytTeldrM0dUTmh4d2UrK245ZlJBNWMwN040dTBKMTBM?=
 =?utf-8?B?VjhFRzJHT2dkM0pBNEFvZWJQWGlWOUZUTEc0dzRLRmZUSWRKeWR4U1JPcVQw?=
 =?utf-8?B?L1hpRFdra09OcHVoSVkvV1A4OXllL29UaFB2NWxOMFpCVUJQN2xtVXdOZDJ6?=
 =?utf-8?B?Vy8wd1BhZzF5Z0IyZHhGK2tKd1Z0K2l0V0JLRHpsUllzNmJOUmMvZFIvUjhy?=
 =?utf-8?B?ZXllYjZQeENtcGxsY2t0UFB5dk84aUZPTDB6U0pIMXlkc1R4UWo2TTF6TXg1?=
 =?utf-8?B?UUJjbFZkUndOR2F0cEt0cEYwNk9sTW1MS0svK1hmeTNtTHo5akRmbHRhZmlr?=
 =?utf-8?B?UFU4cXZHMDlxR3V1ejJ4NEZ0WHB4SHlzRE5RRkRsbzUzYlI0VWoxV2psWTJu?=
 =?utf-8?B?SzNTOWR2L2R3dFJqWkpXSGZIb1ZocG9za3Q4YUhlNTF1cFhuanhrMmtJYVVV?=
 =?utf-8?B?NUJFMVZ6dGRidWhkK3NCQUlsR0V0RDV5NEY4QVdkMjJmMVBQY1c1T0ZBMnJh?=
 =?utf-8?B?VC9LeDNpVVMzdW9CeEoxbGYzL3lFdksvaVcvb3VKQlZjMkNKR0lvM0YveEdl?=
 =?utf-8?B?YitWYnV0d2xEU2ZFOS8zUTJCYlJNU2lyaDcwUGhDWVF6R011cCtlbzFxcUcz?=
 =?utf-8?B?VUZqTjBabkRzaFJFNnVZKzVMbFZmVXlnWE9hZVJndkRjdXlsRlJOMGd2S0Rl?=
 =?utf-8?B?NG1UeE9mRGNsYmVKVXVLYVprNGo4UldlVStvSGNkaWJVTUJPcmhMM1N4c0lY?=
 =?utf-8?B?RFM0QjErYk92d3ZxWVRuMWlNam1MU3RBMW5JZGhKZUJGRWpMU3VGM3hiMnQr?=
 =?utf-8?B?SWQ5clVuTDZJdjBlUGxucWtpYSt2aWhIMHdmWXhteTJLNk9WK2llWXN5bzFj?=
 =?utf-8?B?VjVURVJLS2ZkeGxlOFVVc29hTGRUeGJXcysyM2k4TnhzOUQwdkVPUXhMbDFZ?=
 =?utf-8?B?WjMzRndzeGxmYTlkQUNPYUdGMXFJV1VHb0R5Q1I4M0IyMzlIeHU4ekR3TGVJ?=
 =?utf-8?B?Y2NkMDZIUFhFUGtWdUlTTzBXanJRc3U5TXRXTk9TS1d5ZTdER0dWNU5iY2wx?=
 =?utf-8?B?Z01FV0JaRGVSZktsN2R2Ymo5MDlMcTVRdHdzZzBQQkVhY21uZGE1bmV0Yi9r?=
 =?utf-8?B?a0FuZU5tTTIzUC9aUkl5Mkl3QjdjTTVCV1kxN05PNEoyZ1pwSDh3NTdTeXo3?=
 =?utf-8?B?NUVmL2dxK1pRSm1xZk82MFljQ2RLYUpyNUZzZTVsbjc2SEpFNGY3K1JpNUFL?=
 =?utf-8?B?ek1JY0FINVB4Ri9sL1Qva2R1dU9XY2FhVTdpNnNYdDVWVmdlejJ4QVQ2OWJ3?=
 =?utf-8?B?MXg5TVZlNnNZcGZSS0JxUWNnM0w3YWtLRXd5OVdhU3hkMlc2OVZaaWVmc1lN?=
 =?utf-8?B?RFVFT1JQLzFWTmxOMlJZTVhlMEN1SThLZmZUeW4wOGhhUkZ2THFxMktiK0I1?=
 =?utf-8?B?Y3FzSXNYcnB3bnRCY3IzZjVuemFxeEtwaTdQZXZPZ1RJbGx0eG9tUT09?=
Content-ID: <32A2FAD1ED8BA14AAF718E5CF26A732F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0d8ca9-ab81-4851-f693-08da1c7aa111
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 11:50:23.8837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vWpaz7Sc1lnppEhJAyBARin+bvUaZVggnxVvy8XhFccO4mSKrqNrsrmlZGdegBZVcpIhpX2OAXxotVXau9/gdCnpxkRpWFo2t1APTeE5yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_045033_694242_F074D87A 
X-CRM114-Status: GOOD (  17.45  )
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

On 12/04/2022 11:48, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/04/2022 10:59, Conor Dooley wrote:
>> The rtc on PolarFire SoC does not use the AHB clock as its reference
>> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
>> this second clock to the binding as a required property.
>>
>> Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs rtc")
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>> index a2e984ea3553..1ffd97dbe6b9 100644
>> --- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>> @@ -31,11 +31,18 @@ properties:
>>             to that of the RTC's count register.
>>
>>     clocks:
>> -    maxItems: 1
>> +    items:
>> +      - description: |
>> +          AHB clock
>> +      - description: |
>> +          Reference clock: divided by the prescaler to create a time-based strobe (typically 1 Hz)
>> +          for the calendar counter. By default, the rtc on the PolarFire SoC shares it's reference
>> +          with MTIMER so this will be a 1 MHz clock.
> 
> Please wrap it at 80-column, it is still preferred coding style. The
> same in your patch 4/9.

Sure, will do :)

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
