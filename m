Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F329AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 11:07:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7509461985
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 11:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7509461985
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ofe5ZpjjtEZG7ODL75qkgaKqYLKibn3uK4jyDrKhsE=; b=o7x+yHAgoaLgHQBMFdkonxVMR
	AOiTCGN1XmUl/D2tKVvokxZogMLL6r3lf/2mbGFz9L3VqeBUv/nF65tnXe/CTIfjqfXXXwtFnW9Pp
	BxaAtJ+PFBK1R0452LnMfg/xOUtZ8/dr/SEYq/IP0c4mnCcN+e1RK0UAXnQ+9KK+HQql4AAG7fPJ0
	oVbCDbCA41YCQOh3bAFQ/VWgbPzCuyvXwQTlna9YYKKOGAeFuCviFRCCFW3BEz7dwu5PwzeVL1lqg
	R6upk3s5GVd3BqX/NRN6WwnQGEdMJGQvzToeR4PR3kwGgtrZmGYLeynad9kveozYdiPmHTjGvn4AR
	Jt4hD5F+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRCDH-003WA0-6M; Tue, 30 Mar 2021 11:07:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRCD7-003W6c-F9
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 11:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617102421; x=1648638421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rS6m1U7K5tTvxd05SoD3qyrCwmEGxofiBViE2oVMh8w=;
 b=kqlxn/aynnHVoyaMeY7HinljwG7rqrZTbZ9GFNMjJ3cE0PjmyyVRVu5N
 8/BNfYZmk6ohHZH6LTsd35qWI9fOOGHIIBRiU6nlzG7d508Po+t2ZI0tw
 veOycL0L+4vBz5Om5prq693n2OTW5sXLbqmRLxFO6hJMvT9B4/mO10TkB
 0Ktx45E2332XnA+sO/thiMpvYfvxbUIXYHEBlKSKTmASl0rre3qyJ2shP
 xWQYi/wKvnxv49ZuogACIPKq06XuzmRfV5wmeaMEu2MMG+KHj+Q89r3TV
 BQuPglIK0+QO11XluLU9sXCpYaDp5GlCkXqHAXHxM4rfb2C0nSJ+b82zd Q==;
IronPort-SDR: nxdQRevb9OKJ8nuJ57c8oUYGM0ayQQABwqdBy65zrc/ReaFxLI8KaXGFctfqZDm34wZpPopSYj
 31krC54hhEoP6hRDSkSEX6vr2SOhKQPlwu5UWjyhIeADWz5vZK9baBKv1cUJwvdQaZzYeBSQ6n
 TnZ1nZ9EEVsMWpEoFF9oJZ37hHuuICIT0ugJMLg9LUsdoJ7Fy5ENWCj4vsXE0Y8WjuG2Rb8Vbr
 linV/BaHsII5SzofklFmcXGguR7eyP+hxC6LjuJMWg0/1f5S1q9hVnprzbcHD2+urMWhX29MKg
 dEY=
X-IronPort-AV: E=Sophos;i="5.81,290,1610434800"; d="scan'208";a="111851356"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Mar 2021 04:06:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 30 Mar 2021 04:06:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 30 Mar 2021 04:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYOJf6JKn3Riv3TaTtXiD6tCRqkFovw128Qif7rGjoeXlR9V9B7YeijxrqT9D4fTsi0to9WtcECKi7v+oI9rQheRvwv5orNp1C/dbZmKVW+NTsZ0Fp/9vzedTNEIXfEpKQ1ET1OZcktpTHoLGUN/e80u9vYJ4wW/fS4Z6SR5irrVF2/BsOgge6gyJUMgtQ/cdAUNFn4lofJGpYROvuJXhu5XLSLXN6LNPVPwKnE+95tP47fcpWX2IN/FlWGmGKKhGo/BP8RKn883dlcAwbq0WAF+v3OfU0ovyVb5g07jUAMDlLEHtzXdlhcTfDP9Wx5BUB943AhVuEMY6GnV7isLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS6m1U7K5tTvxd05SoD3qyrCwmEGxofiBViE2oVMh8w=;
 b=XTvnDCDvXseldtsP4tokjH7d72ygRWn8edBUII/1MT2BzjvXHHZv/2mhkeXausureaswAkX+HhKMdi3NU3etASkesiS5W9Hpy5tT53eLjLS1SwDth/eOatY6siJ8bJQhdIs+DqXw2QSchPIhN+bvGtq3x3QzzDIcG3doSYPqJcDWXcFyhuokdVTiXZelWGXn5wYKHbMSo27JJewFo75FXuXjHKbDd7Wl24Udog/xxZZz4BusEmfWqHz2ClGDK9kzpib1KspW1xl5CFyclpaz59G5sZvd49TxuKw3oCuXQiYvpslzNe3wNa+XTq17Bsukj030blfjLXe1TondcrT2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS6m1U7K5tTvxd05SoD3qyrCwmEGxofiBViE2oVMh8w=;
 b=aV6T6vsWAGtwZ76LMXSb840zY86tL0RLpnM8yd8kyykEgeareZesCw5SeN+0uz1hFmThmEV0RHoo61lh7WNBut/pdORmKJvZvnKSq790R+O/SbUCbG1QDv0Fis31M+83wJVfreZ7eLmOd7/b98zPi9tMR77PDgsTS6PTOOXEmyk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 11:06:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 11:06:45 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <robh+dt@kernel.org>, <Damien.LeMoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <Lewis.Hanly@microchip.com>,
 <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <Atish.Patra@wdc.com>, <Anup.Patel@wdc.com>, <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for the PolarFire SoC system controller
Thread-Topic: [PATCH v4 0/5] Add support for the PolarFire SoC system
 controller
Thread-Index: AQHXJVTFPyo0SISS3U2ehOcAXtKWog==
Date: Tue, 30 Mar 2021 11:06:44 +0000
Message-ID: <1afc3d35-55ff-eefd-3fc9-6342f85fa887@microchip.com>
References: <mhng-1b7b4cb7-2f9a-4bdb-b00c-14ec1d7008b0@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1b7b4cb7-2f9a-4bdb-b00c-14ec1d7008b0@palmerdabbelt-glaptop>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9b5e05d-2611-48f5-fd22-08d8f36be7e5
x-ms-traffictypediagnostic: CO1PR11MB4851:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4851DCF7994BA827C88A1DC6987D9@CO1PR11MB4851.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fwt06rqMmh+f0CTk2aIG1badD4mXULLxYeNW1mMCqWycvLxlTmLknynD/1NB9oTWWByv8SKEo4/fUkjk81Azc+L9CLmjTp6l0GkGzK4KAUas0P73seBHJANl/cLZJZoxxBflQvJjqh1DsF5OAAK5YBJBlPGHGF+P9wVFUM0puhJNnRx8BkQICPDR57e6TqKfxcfhfQiFf0+lGDLbzesqCwfK2y43iLhYUxUVAjFDaiikRPjQRVobVOcZsrIzOqWQ+wN8CrTzPAYmwNQu8CW+P9CLAlv+MMhmOepDmdyjK7BNnq239gbfgDY+C0Ok3SxTep3cHFwOB6VIZlbN15aTD9ncDWhdNyP//V/vUDtCGx95oTYXJUlhpn7HMOcUQq+J44DEENqb/6HPxe+WXtQz0ssOOcFHixUGydTGhafL7IgMtbXOcWvW3068U/V1fVDzo74ZoiKoatqJ2rpUvIjTD7gT4g+lFgkMPDiUNlqxeFTa4dzR1kIAAoyyn/kTZqk9Z5FdW4SZWPH7FQPe46oXBjdVrHQ9X1h/RAuG8taTz4AjRMwq5QWFyvszx9fXUPZIM15dVoNsjSsNzDLPO+kwK34ZQTR/Pw3xQh5JrhWTO7l5ZPT5mVIhITmwhbZ954d5hOHjgzLpL+R3ihg/ZEHeHHkd/yU9WVOKeSBLaJYDHrddytHVkbepANHyTH3hSa8lq0K7srNKAY8HvoOqLRf5zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(136003)(396003)(366004)(76116006)(64756008)(91956017)(83380400001)(8936002)(66476007)(66446008)(66556008)(6916009)(31686004)(54906003)(53546011)(6506007)(38100700001)(6486002)(478600001)(7416002)(6512007)(86362001)(66946007)(4326008)(2906002)(2616005)(36756003)(8676002)(316002)(26005)(71200400001)(31696002)(186003)(5660300002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M29QS0kreTN1RllMbEpqSVVLOTUzRk9BYi9OQTVTUGNYSmFCM214Tng3Ui83?=
 =?utf-8?B?MjE1ZU1sejJDOWt0djJGMHdaMk1VNmF2cHZSWGJHaktLSkpENDZqTzFvdTQy?=
 =?utf-8?B?bGNiek81NjU0Mmp6VXBPeHAxckVyaGQ2R0NOVmFKWG5NTkZUWXJiVjZlUGZV?=
 =?utf-8?B?QVI5ZTRZdUFmbFpoN1kyeGlTL0Z4TnAwcm5LRGt2cStsZWxWbmNacWV6ZER4?=
 =?utf-8?B?a3ZFN0g5YVpuVzgrV25BS3BaazU4b3NYcmNJZXlTUEVWWkh4QlR5bTBabWFM?=
 =?utf-8?B?RmhIVDRmM0U5SXJGTjYrckpjOE91WUZkQjVLK1Znd1pJZFdaNzFCT2g4RHZt?=
 =?utf-8?B?Um1XMk80MWlmWi9mY1lCVkV5K1E1Ujg1UG9ReWI3eTNiOHJ1VXZKNC8zdXQ5?=
 =?utf-8?B?aGxCUG1BSVUvMklvR3c0Ylk1WUVUNDVoM2NDNllWN2xxQlFoSi9TeURiMmdK?=
 =?utf-8?B?emNSQWV4WE9ncjN6bElZQVBXUHc0azRHaXd0N004S0ltcy84VmtNRG5Ybndk?=
 =?utf-8?B?KzhJUzdEdm5GeUVXSU9uRmNsOERMaDZ1cFlyNUZEVVN6aVhHSlZJRHVNMFhG?=
 =?utf-8?B?VzFUOEcrSTJKRElUNW8wOFBQQUFJR3Naby9vTGVIOU0vc0hwWmNGNnZsMmNQ?=
 =?utf-8?B?aUdUZ0V2T3BvemEyZnU4ajQwWFM3cHNvRVpjSnRCQmhkbnZveHZ0R1RDR1RP?=
 =?utf-8?B?dWd4dVlJZ2FId0lDL3gya0FDLzk1TmdZUHlFK2RPTlhHcmg4QllmV2NyRDhX?=
 =?utf-8?B?UElya05oV0d0VHltMk04SWVlS0lLTFFENnZKOWVQRDRKZllkKzVPMkxUN3By?=
 =?utf-8?B?OWR6eXE5RWZDV1F2eC8walEvTkc5V1EyRUpOdHVNYUkraDJ3YXRtcm4yMlJo?=
 =?utf-8?B?QTkxK1ZVRGg1cUYrY2NDRXEzM0tFV0QvTEZ0VnVvWmNuYjk5Z2pkUzI1Qlln?=
 =?utf-8?B?dGEvcFJvZjkrR05sYmJuU1lYc3JWUm9yaUlOS3pLZlFGNUJLbHdVOElsMlE3?=
 =?utf-8?B?cU43cERGeXpOM2NGOWdkOVliTXRuUUNEaUZ5TmZQU2pHUSt5R1JVbVg5N2w5?=
 =?utf-8?B?T2FzTWRtcUNEN3BRL3F4b3AwQjc2QWN2Rit1a3VoSTRGdlhIUzBjelhYZHR3?=
 =?utf-8?B?S1pjb0JWYkEwUzR1S0luNE9vZFIvdmpUcUwwbGF1K2ZkdHprZ1llV3R1VWN0?=
 =?utf-8?B?bDRoWng5VTFLUWxLWUo5eE55VzRuMnlxRVI4Q0dydkc2S2xac2FUTndCQXI2?=
 =?utf-8?B?aXNzTW1GeC9rLzE1QTJUd2RWbjNkZ2EzVERLbXcwakF5aGYwUU5MU3pPcHNi?=
 =?utf-8?B?TnVnaE05eWVWa3ptcFNJUDhlamtEOUN3eEtjamR6dUJzRm1zb0ErekR0T1dR?=
 =?utf-8?B?OXdiR1p5TFhhNGRGMEd2QnZMbnVnZjhVSFZWYXAxU0hTSFcxVXNETHU0TkNU?=
 =?utf-8?B?dW85VUdSb1BtZkZZSWg1VGw3YjhUbFhuc2hGR0dMY3FXMjNpdkM2QnIrMkpD?=
 =?utf-8?B?RTNDVWo5WW41TVNHT3NSbUR4S2EyMm1TNlVuaUwzSUc2WVJRbnZ6b3BNTmQv?=
 =?utf-8?B?ZGdwY1JnTG5oVjZtRHN0ZVRzY1FJWXo5cDZ2NmQ4OEEzUW1adWxqbjUrS0F0?=
 =?utf-8?B?Mi9RY0VXU2djUzQ3T2dyVXIzaDB6YUNJdVBCNFZ3SWhzN3VPT2RFOStOeGdV?=
 =?utf-8?B?akJiTVNJRlExRnNOK2YzakZHUCtraTJERG9SZjQ0V3EwSkJ4ck9zYWE3MDgx?=
 =?utf-8?Q?Nb2XYv/5K48SecghjM=3D?=
Content-ID: <2DDFAAEBA456EF4E938E4224C97CD54B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b5e05d-2611-48f5-fd22-08d8f36be7e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 11:06:44.9848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37/XPoorauOrFYG/S4iEoFMxVlv7HkkbRSxd7ALfEWg/Yj35Gbxjn1duFCpV0y+xEwyPc8bv6ooCTHPzGYC2teJHlm+iuNnkGcb3M7zlSZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_120702_381903_148A5058 
X-CRM114-Status: GOOD (  26.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMzAvMDMvMjAyMSAwNToxNywgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4NCj4gT24gVGh1LCAxMSBNYXIgMjAyMSAwMzoz
NDozMSBQU1QgKC0wODAwKSwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gDQo+IHdyb3RlOg0K
Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+
PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBzeXN0ZW0gY29udHJvbGxl
ciBvbg0KPj4gdGhlIFBvbGFyRmlyZSBTb0MsIHVzaW5nIHRoZSBtYWlsYm94IGZyYW1ld29yay4g
QSBNaWNyb2NoaXAgZGlyZWN0b3J5DQo+PiBpbiB0aGUgU29DIHN1YnN5c3RlbSBoYXMgYmVlbiBj
cmVhdGVkIHRvIGhvbGQgdGhlIG1haWxib3ggY2xpZW50DQo+PiBkcml2ZXIgYW5kIHdpbGwgYmUg
dXNlZCBmb3IgZnV0dXJlIHNlcnZpY2UgZHJpdmVycy4NCj4+DQo+PiBUaGVzZSBkcml2ZXJzIGFy
ZSBnYXRlZCBieSB0aGUga2NvbmZpZyBvcHRpb246DQo+PiBDT05GSUdfU09DX01JQ1JPQ0hJUF9Q
T0xBUkZJUkUsIHNvIHRoaXMgcGF0Y2ggc2VyaWVzIGRlcGVuZHMgb24gQXRpc2gNCj4+IFBhdHJh
J3MgUG9sYXJGaXJlIFNvQyBzdXBwb3J0IHBhdGNoZXMgd2hpY2ggaW50cm9kdWNlIGl0Lg0KPj4N
Cj4+IEl0IGZ1cnRoZXIgZGVwZW5kcyBvbiB0aGUgTUFJTlRBSU5FUlMgZW50cnkgY3JlYXRlZCBp
biB0aGUgc2FtZSBzZXJpZXMuDQo+Pg0KPj4gQ2hhbmdlcyBmcm9tIHYzOg0KPj4gKiBGaXhlZCBt
Ym94ZXMgcmVmZXJlbmNlIGluIGR0IGJpbmRpbmcgZm9yIG1haWxib3ggY2xpZW50DQo+PiAqIEJ1
ZyBmaXhlcyBhbmQgY2xlYW51cCBmcm9tIEpvbmF0aGFuIE5ldXNjaMOkZmVyJ3MgZmVlZGJhY2sg
b24NCj4+IMKgIG1haWxib3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jDQo+PiAqIFJl
bmFtZWQgZHQgYmluZGluZyBmaWxlcyB0byBtYXRjaCBjb21wYXRpYmxlIHN0cmluZ3MNCj4+ICog
UmVtb3ZlZCBQRlNvQyBnYXRpbmcgY29uZGl0aW9uIG9uIGRyaXZlcnMvc29jL21pY3JvY2hpcCBz
dWJkaXJlY3RvcnkNCj4+ICogQ29udmVydGVkIGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8g
Ynl0ZXMgZm9yIGNvbnNpc3RlbmN5DQo+PiAqIENvbnZlcnRlZCByZXNwb25zZSBhcnJheSB0byBh
IHN0cnVjdHVyZSwgZW5hYmxpbmcgc3VwcG9ydCBmb3IgbW9yZQ0KPj4gwqAgY29tcGxleCBzZXJ2
aWNlcyB0aGF0IHJldHVybiBhIHN0YXR1cyBpbnN0ZWFkIG9mL2Fsb25nc2lkZSBhIHBheWxvYWQu
DQo+Pg0KPj4gQ2hhbmdlcyBmcm9tIHYyOg0KPj4gKiBGdXJ0aGVyIHJld29ya2VkIGR0IGJpbmRp
bmdzIHRvIHNhdGlzZnkgZXJyb3JzIGFuZCBmZWVkYmFjaw0KPj4gwqAgKGhvcGVmdWxseSBwaGFu
ZGxlIGFycmF5IGlzIHRoZSBjb3JyZWN0IHR5cGUgZm9yIHRoZSBtYm94ZXMpDQo+PiAqIEZ1bGwg
bWFpbnRhaW5lcnMgZW50cnkgbW92ZWQgdG8gQXRpc2gncyBQRlNvQyBzdXBwb3J0IHNlcmllcywg
dGhpcyANCj4+IHNlcmllcyBub3cgb25seSBhZGRzIG1haWxib3ggZHJpdmVyDQo+PiAqIENvbnZl
cnRlZCBjb25maWcgb3B0aW9ucyBmcm9tIE1QRlMgdG8gUE9MQVJGSVJFX1NPQyBzbyB0aGV5IGFy
ZSANCj4+IG1vcmUgcmVjb2duaXNhYmxlDQo+PiAqIEZ1cnRoZXIgc2ltcGxpZmllZCBkcml2ZXIg
Y29kZSBmcm9tIGZlZWRiYWNrDQo+Pg0KPj4gQ2hhbmdlcyBmcm9tIHYxOg0KPj4gKiBTcXVhc2hl
ZCBoZWFkZXIgaW50byBmaXJzdCBwYXRjaA0KPj4gKiBGaXhlZCBEVCBiaW5kaW5nIHdhcm5pbmdz
ICYgc21hbGwgZml4ZXMNCj4+ICogQ2xlYW5lZCB1cCBkcml2ZXJzIGZyb20gZmVlZGJhY2sNCj4+
DQo+PiBDb25vciBEb29sZXkgKDUpOg0KPj4gwqAgbWJveDogYWRkIHBvbGFyZmlyZSBzb2Mgc3lz
dGVtIGNvbnRyb2xsZXIgbWFpbGJveA0KPj4gwqAgZHQtYmluZGluZ3M6IGFkZCBiaW5kaW5ncyBm
b3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94DQo+PiDCoCBzb2M6IGFkZCBwb2xhcmZpcmUgc29jIHN5
c3RlbSBjb250cm9sbGVyDQo+PiDCoCBkdC1iaW5kaW5nczogYWRkIGJpbmRpbmdzIGZvciBwb2xh
cmZpcmUgc29jIHN5c3RlbSBjb250cm9sbGVyDQo+PiDCoCBNQUlOVEFJTkVSUzogYWRkIGVudHJ5
IGZvciBwb2xhcmZpcmUgc29jIG1haWxib3ggZHJpdmVyDQo+Pg0KPj4gwqAuLi4vbWljcm9jaGlw
LHBvbGFyZmlyZS1zb2MtbWFpbGJveC55YW1swqDCoMKgwqDCoCB8wqAgNDcgKysrDQo+PiDCoC4u
Lmljcm9jaGlwLHBvbGFyZmlyZS1zb2Mtc3lzLWNvbnRyb2xsZXIueWFtbCB8wqAgMzYgKysrDQo+
PiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+PiDCoGRyaXZlcnMvbWFpbGJv
eC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDEyICsNCj4+IMKgZHJpdmVycy9tYWlsYm94L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPj4gwqBkcml2ZXJzL21haWxib3gvbWFp
bGJveC1tcGZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNzcgKysrKysrKysr
KysrKysrKysrDQo+PiDCoGRyaXZlcnMvc29jL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPj4gwqBkcml2ZXJzL3Nv
Yy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDEgKw0KPj4gwqBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArDQo+PiDCoGRyaXZlcnMvc29jL21pY3Jv
Y2hpcC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4+
IMKgZHJpdmVycy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuY8KgwqAgfCAxMjcg
KysrKysrKysNCj4+IMKgaW5jbHVkZS9zb2MvbWljcm9jaGlwL21wZnMuaMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDU3ICsrKysNCj4+IMKgMTIgZmlsZXMgY2hhbmdlZCwg
NTcyIGluc2VydGlvbnMoKykNCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHBvbGFyZmlyZS1zb2Mt
bWFpbGJveC55YW1sDQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29j
LXN5cy1jb250cm9sbGVyLnlhbWwNCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFp
bGJveC9tYWlsYm94LW1wZnMuYw0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2Mv
bWljcm9jaGlwL0tjb25maWcNCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21p
Y3JvY2hpcC9NYWtlZmlsZQ0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWlj
cm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYw0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9zb2MvbWljcm9jaGlwL21wZnMuaA0KPg0KPiBUaGUgb25seSBwcm9ibGVtIEkgc2VlIGhl
cmUgaXMgdGhhdCBwYXRjaCAjMyAodGhlIGRyaXZlciBmb3IgdGhlIHN5c3RlbQ0KPiBjb250cm9s
bGVyKSBjb21lcyBiZWZvcmUgcGF0Y2ggIzQgKHRoZSBEVCBiaW5kaW5ncyBmb3IgdGhhdCBkcml2
ZXIpLsKgIA0KPiBUaGF0DQo+IHRyaWdnZXJzIGEgY2hlY2twYXRjaCB3YXJuaW5nLsKgIEkgY2Fu
IGp1c3QgcmVvcmRlciBpdCwgYnV0IGl0IHdvdWxkIGJlIA0KPiBncmVhdCB0bw0KPiBoYXZlIHNv
bWUgcmV2aWV3cyBmcm9tIHRoZSBEVCBhbmQgbWFpbGJveCBwZW9wbGUuwqAgSWYgbm90IEknbGwg
dHJ5IGFuZCANCj4gZmluZA0KPiBzb21lIHRpbWUgdG8gdGFrZSBhIGNsb3NlciBsb29rLg0KDQpJ
J3ZlIGhhZCBhIGZhaXIgYml0IG9mIGJhY2sgYW5kIGZvcnRoIHdpdGggUm9iIGFib3V0IHRoZSBk
dCBiaW5kaW5ncywgDQpob3BlZnVsbHkgdGhpcyB2ZXJzaW9uIGhlIGhhcHB5IHdpdGggLSB0aGlu
ayBhbGwgb2YgaGlzIGNvbmNlcm5zIGhhdmUgDQpub3cgYmVlbiBhZGRyZXNzZWQuIEhhdmVuJ3Qg
aGVhcmQgYW55dGhpbmcgZnJvbSBKYXNzaSBCcmFyIG9uIHRoZSBkZXZpY2UgDQp0cmVlIHNpZGUg
aG93ZXZlcg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
