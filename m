Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BBFC4743F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 04:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBA9611AD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 04:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CBA9611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5s1jorZIoZ49Nh3dGxaArj+zj5Wi693Kzs4ks3p1T8=; b=iRKxkgjFJvBH0e
	XxvudAJ9qoEb7/cQ22U/kv0KWsOEfkCBfXLoRf0QLMfjy1w5UlkTi+kxG1PknHzu4Kg2tZlqMDxzJ
	4cqr/gPd7o1tLwCZtmw4x0GZKaID667kYqMeQ1zn2S/wVeIIJjlfWsPREGIpT/OK+3Ug+Vju1QwFd
	MYPNijZHTlLIoqrHVScK5O0vaDzUiiGfeLokbSXShpifsQgdprrM6akVa48+qQaDAO3osJ8JJlkbl
	2uUpEDfS0k5aibnzD44nzntWy2RN8mSipHK1jg1MNh9NvNlxJC9aN6uQPGWrZXNAbOniAc1UBfKZD
	bQ0BRlVkEzQUbDNhZnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq7Aw-001WJf-AF; Mon, 07 Jun 2021 04:47:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq7Aq-001WIr-Gr
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 04:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623041263; x=1654577263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YSooT9jUCrgJ0zNFeM/+jLo6lYrhE01ObunV79AM6Ao=;
 b=Hyb91BUPB0k86tMo5gbtR7g2PtInVx5O/MRpTMCBo96WXSQjaYqcK+0T
 CohcWqUeO4qOBu9B5ft7GX/ml3PyDTkFROSAXxBtcCKkaNf2FySkjImJ0
 ZNTsrP1nLoK+XPkcz96wu3R0sDwz2R+cOR9riZM5RptI+gclSFYjPJyby
 /pHZcg6U5U63G36BfnLXKiOPOw5Jfk1JpdLqvYMoR0GzI2PUm0QrYRODi
 nnZ3nvBbwGF87LKgtNB4rin/3qImDwBkWNlu1dFofTKx+5Q98txERlR34
 GiqVZjL9de7L+6M1HOiyU0tTyi8c1D3QRRcfPReYbP42h8JZ6Ws79ZsAM g==;
IronPort-SDR: cBc7qwOmjpuavwZC4fVFsjwOlVYEvJEzdwdjF1IUDoCYv9fPVm/xhk5Q2t/YumpTm8lagJdqR+
 fpA9G/H1QqO8s/3pn67GJRpBcN9rQqwLVF51jm/t8zNLMtuRQWZqLZ0bEljKsqn5GTAORx8qtR
 qgvLeCI+4doBwA2a1de+Xn4IFiP8RV/yvMR+inM5y1R52ZqHvJdpevU53hKfA8Iex1SIbXyQo6
 ve8fK6wuzPaf6yByJaS+eqJW1kR0OkhWZTqNuacmywTUP+be9hE1G7CT4sKZA7HdnL/BtbDlN7
 jNA=
X-IronPort-AV: E=Sophos;i="5.83,254,1616428800"; d="scan'208";a="274812957"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jun 2021 12:47:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvEv3TvJz0Gmy8jc5G0iqeFgsnNospYJKPsxwXowyMcl1leEM5giDqCGTBI8u0x1HFGyRd1RLOd7LvY3ZK8UKbRvKXpQ5i52Y7m4Ld6vzCDilIRRA7gPu44LhIOnnJqVq/Sd57yGkMbNWrGacZ7Vd6iii2r/OX/QFocKzteKKo8i4eha8S1Tb+b3F4O1u+CwNPWTubUDNxBHNjH2kGUjpFE1Znl8x1mXV2SU9QUslwzy5WFzrJ01Vkb5PwqfsTTBiuEkj/TtZ+ud0nsxXKxhJAmLPZpUqSba6+VcJwrbYd7/KaSTv31uMYNHZg+wI3QO6xOOqVaE+BAyTqQqWGIJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSooT9jUCrgJ0zNFeM/+jLo6lYrhE01ObunV79AM6Ao=;
 b=BhjGIdhHxOrmD4fIVz+XeasP2p8XfyFvA2qcGuDmiZe9jXAqA1z1EyIogVsAjX2Fp8d0Vn9sZ6VvVjTwd+fwrVStTF3Ygk0SnaCxc+VZMoz1H8ZJs2NcydvrjS4/D3/OTzAM3pdpmbw5ZBRWgr8nsLfF+U6/SowJ31NHSVf4YFofnGxVPFes+OdRXCVoUM8wHKu8yFUKLLUV7A35S+0m8PW2YZaqJ2LRZm7tM5BDGK6zcBxFU7DizfVhLljXDqUxxuNeRP4cKI8Xbo9hTcrZqdyVoYZUecItGM8btJbP67Wgc+b3mEyL5CakOEtFePfX9/UmpgVccyOuqsW7y5I2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSooT9jUCrgJ0zNFeM/+jLo6lYrhE01ObunV79AM6Ao=;
 b=woBcPveiSy4soSqBtTnFuB6QeTB6qFh1fJdkgxA8F2Hes87l2poSvJTYOT+Ka5OzmpXFJHmSQZBz2PFTYYy7ruhbUrEae23Nt4UFojTMwFR9XxWZ+whN90p3iod0k2rOTkdrBKk4djkSIGnYg/nNmCYabWw0a8PibKxIHa4oLQU=
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 04:47:34 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 04:47:34 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Guo Ren <guoren@kernel.org>
CC: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "anup@brainfault.org" <anup@brainfault.org>, "drew@beagleboard.org"
 <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>, "wefu@redhat.com"
 <wefu@redhat.com>, "lazyparser@gmail.com" <lazyparser@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "guoren@linux.alibaba.com" <guoren@linux.alibaba.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Subject: RE: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXTGyTk+HLcFgtPEChsdrUswIwKarqRJuAgAAMWQCAAABbgIAADXqAgAAFs4CABEeUAIAMkQUAgAaHrgCAABm6QIAFdrYAgACrsNCAAA+ngIAABCAA
Date: Mon, 7 Jun 2021 04:47:34 +0000
Message-ID: <CO6PR04MB7812D075519BCFBAF744DE7D8D389@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <mhng-a5f8374f-350b-4c13-86e8-c6aa5e697454@palmerdabbelt-glaptop>
 <mhng-c0406cea-776b-49d2-a223-13a83d3a7433@palmerdabbelt-glaptop>
 <CO6PR04MB7812D8905C6EEBDE8513866F8D3C9@CO6PR04MB7812.namprd04.prod.outlook.com>
 <CAJF2gTRH6OVB1RrOyp88LDvX3fV0doJxNTM61trWxJsLaX0X0g@mail.gmail.com>
 <CO6PR04MB7812614750AE3CA78D49C0AD8D389@CO6PR04MB7812.namprd04.prod.outlook.com>
 <CAJF2gTSgC2+ULpfSQKvan7phPf8VT+nxUiekfpHELNjsQYo=CA@mail.gmail.com>
In-Reply-To: <CAJF2gTSgC2+ULpfSQKvan7phPf8VT+nxUiekfpHELNjsQYo=CA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.167.153.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c9ffae4-cd5a-4642-d8c9-08d9296f5e2b
x-ms-traffictypediagnostic: CO6PR04MB7810:
x-microsoft-antispam-prvs: <CO6PR04MB7810850D40CBDD5B3280AF048D389@CO6PR04MB7810.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJJqDczAWEH7yGPoKryw6N4iR89JqAl33vt4rHx3qI3LfSmHyM6w7uI6rHSqonf/9SLfOM/jCTN/v9KPYvdbKSxBRr4dyUOLbETXOMIV0t5n8Zd1PoZ+gr00Q8ZfmNsxJpWXbLjBUplgDcbzNXIXygc9jhPUPQvP5HsRVi+2dwFSy+KocvjPqfAjmUzVQR5zNtuYfeTiH6Mzf1vlQHMDEouWxyimyg01NcMReK0liJC1ZuI66zPgNLLKz0CuCBAsV/Zz/pSGlem2PLLnN5ZjVRkmO5XZKduAu40a/fi0E+HVy3+XG2Qs6Ug8Yc33TYLrW+FMfc9aledOd6M76F0ehDtpgJVnNnI25S0ltw0qVNJLOz2u2U2Ej4GCHYlOWUYDwXUsv25hfb389S6Zmew6Q5eHkC6VVYIk1M6+UnfUJyZRox6NjxrTXUT1nWOS2cvp4daAT7rWW2IQI+1OJcBI/MpT5kBjBqcVmwWMknAvpzLqDR5WQARfx1Eyr9bbXY/w3A/qDeYIEOLJntxNF3o/qC4oK9zGvQz/0BvgUqXhkVbzYYE3ImTIEGi5XFLpcQjAem0Tq/yRB+DuR3eWF79wvx33ji00bw4ilp6zQtHA2pW7uigbmN10kB3PvzV3PydS9lquuGb4l9Qs13FECsuEnKBmJ8SWYsw0k9DiFyKwffq0RfS95y3unIg6LoWaKZkktml10zGulXmtPVOsRUVZ52p+8MasGtnLcdpj8JPNt7jj4jxijWtbSlrGD99ALqMqKB3mJBvlMeZKJyrf5FZ/Og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(7696005)(86362001)(186003)(122000001)(38100700002)(4326008)(8936002)(26005)(9686003)(316002)(33656002)(7416002)(55016002)(8676002)(6916009)(966005)(478600001)(52536014)(30864003)(53546011)(2906002)(5660300002)(71200400001)(83380400001)(6506007)(76116006)(64756008)(66476007)(66556008)(66946007)(54906003)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WExOQzhmSHJqRFVQWnY5SGtzTXArU2hpdEV1a0J6allDQUVQcWM1Yk9ENlgz?=
 =?utf-8?B?UERIM2tUN01uWTFMZTVmcVZXUVd6MkJsOU1MRHg1aHpiMFlueVdNeFduWmNn?=
 =?utf-8?B?TGpERDV0YlB2bDhwcy82TnZ0UkxFbFNVQVZ4QllmczZ4VVpWT0NrNVEzS2Fs?=
 =?utf-8?B?d2Vqd0JscjJGcDczZzBYUytSVFM1bTBRVllzRGFxcEVhWGdsQ1VGMDI5ZDk5?=
 =?utf-8?B?NHhGeWFYNG1FV2V5TmhJeHFVMGprS3R2eFdlOUN6YjRkSG56YjVTOEp6NG1q?=
 =?utf-8?B?TE40NEVPVHJ0UmpYdzFCV2ZIV0ZObitZdllNNDIxNForakxWaVg2b0prc2hT?=
 =?utf-8?B?RXZmV0U4TEFFVUF4eTl3TUc5bWR6MGdDMzdjUXRhQ0VGOGpZd3BQRUcrY3ds?=
 =?utf-8?B?d3lzTnU0SGQvRWh5OFpRY2QrbW9hb3JoaFhFeVVQNVpQYWZ0emIvbDhNZXNi?=
 =?utf-8?B?VmlPczdnaUZOT3JBTEFoQW5GbUJUTmh4VjZPcnZSOTRPcVRLUmcwdmNOUlZJ?=
 =?utf-8?B?SzZQc3YxcklmY3NoTExhRVEwZ1BneEFOdmR1bUpKR1cySHZjajBOQmFHUlh0?=
 =?utf-8?B?bnBWem5kNllTZWRhNS84TDlNNFBQRS9MeWZlQnR5ei90Vm9QcWRkUmxWKzFB?=
 =?utf-8?B?TmpDMXZUdXUrQmI5RUN0dVlVcWpBM1F5Y3lIdml1QVhxSDBWeFh2YzBUQ3A2?=
 =?utf-8?B?aXl4S24zWkNVcGc0aXpVNTVGT081WEZ3WVM5Sm1FYU41RTJibGlJME1nWHdt?=
 =?utf-8?B?MEg5bUZERXFsZHMrN1MzckFKTWlEL256TWptbHFXdkJmcUFocGFGbmYxYStT?=
 =?utf-8?B?MGtHZ094WVhEb2IwdG9OV05TMGtZV01zNVhEOFNZOXJpV1Y4ZDd0dTNFSHVS?=
 =?utf-8?B?L1l3ZG9SZVVuc25uMDY4SVgvRDFTT3IxM05nRlIvR2JnaG9yOW05Y0RqT09n?=
 =?utf-8?B?YWo4dUxwQWxwZHBEUU1WaERwOU5mR1cvbU9nZXk2eVlTSTZPVHY3b2hibUFs?=
 =?utf-8?B?TFRZajRVV1RuZzY5VmZ6N1VDK1k2UVpDMWNzbmgwa2tQRktiUThOV3NyTEZH?=
 =?utf-8?B?Q0g0cXMwWW9xaHQ3L0lhTzBRckZvNDZMeXRUY2VKRVZZUnp2UnBZV0VpQmNI?=
 =?utf-8?B?dUtad3V4S2JoNTMyWDdyVDU3cUREcEJqZVE1OERXbXl6d0dFRWdJYTQyMFdu?=
 =?utf-8?B?TXdjT2dWY2ZUK1J4LzBvNmxyK0wrTkVsSFZWVm81QUFvYkVNTElzcFVrSVVB?=
 =?utf-8?B?UzJrYStiZjc3bUs4YURqKzVTVzJUSGxIaWtlcHIwZU1yMkRHL3ZQVWNZeTdm?=
 =?utf-8?B?RVlpQ1ArZXZCVXQzdit6RkFIV0ZuUE9iRW1hUDY4K1pDVkV6V0g3Y3laNm9n?=
 =?utf-8?B?R1dtcllHMEVtTkNyQ0hBNS9BUTdxS1hoeWNYZ1MxODB6V0tkWVlvWnV5WEM3?=
 =?utf-8?B?dlpBeVMxczJ2aXRiNG03M0JSL0tHbjNKUmhxL3hhaU5LUlZFTEc2NHZXR29k?=
 =?utf-8?B?VG51eU5qdmxYekpiT2p6RjFIbnlPRlZZN0xyLzUvK1BRc3RyYXZoazkra3oz?=
 =?utf-8?B?azVjTzRxNEwrMlRVVDhXVVFDNTVCY0tJNTBMdkUyeTh0eCswekk2Ym5lbEZ0?=
 =?utf-8?B?MlluYWNiNFg1dzNZL01sR1pEbEhVU1dWTU4wTnV0aUtDcVl3K1ZQMDdWYllI?=
 =?utf-8?B?STJOTFpvSC9IWDhiWktQUGcwVGs2ZmVMNjQrQ29vS2pCdG5NYW1IZnhNWmQ0?=
 =?utf-8?Q?hgo3FiJOMfASDi22X8G4WYsMawn3HUYGbYe2u+j?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9ffae4-cd5a-4642-d8c9-08d9296f5e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 04:47:34.5197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKCFVLFQXpBE0mEe3dZSHnpknpsSAiW2+2L8Vs9V7jtC2s8jikJkV42aW/P2dGFhlbM78aFJjkSKnD8KqffMGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_214740_694122_EAF60905 
X-CRM114-Status: GOOD (  31.86  )
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
> From: Guo Ren <guoren@kernel.org>
> Sent: 07 June 2021 09:52
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <atishp@atishpatra.org>; Palmer Dabbelt
> <palmer@dabbelt.com>; anup@brainfault.org; drew@beagleboard.org;
> Christoph Hellwig <hch@lst.de>; wefu@redhat.com; lazyparser@gmail.com;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org; linux-sunxi@lists.linux.dev; guoren@linux.alibaba.com;
> Paul Walmsley <paul.walmsley@sifive.com>
> Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
> 
> Hi Anup,
> 
> On Mon, Jun 7, 2021 at 11:38 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Guo Ren <guoren@kernel.org>
> > > Sent: 06 June 2021 22:42
> > > To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
> > > <atishp@atishpatra.org>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>; anup@brainfault.org;
> > > drew@beagleboard.org; Christoph Hellwig <hch@lst.de>;
> > > wefu@redhat.com; lazyparser@gmail.com;
> > > linux-riscv@lists.infradead.org; linux- kernel@vger.kernel.org;
> > > linux-arch@vger.kernel.org; linux- sunxi@lists.linux.dev;
> > > guoren@linux.alibaba.com; Paul Walmsley <paul.walmsley@sifive.com>
> > > Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
> > >
> > > Hi Anup and Atish,
> > >
> > > On Thu, Jun 3, 2021 at 2:00 PM Anup Patel <Anup.Patel@wdc.com>
> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Palmer Dabbelt <palmer@dabbelt.com>
> > > > > Sent: 03 June 2021 09:43
> > > > > To: guoren@kernel.org
> > > > > Cc: anup@brainfault.org; drew@beagleboard.org; Christoph Hellwig
> > > > > <hch@lst.de>; Anup Patel <Anup.Patel@wdc.com>;
> wefu@redhat.com;
> > > > > lazyparser@gmail.com; linux-riscv@lists.infradead.org; linux-
> > > > > kernel@vger.kernel.org; linux-arch@vger.kernel.org; linux-
> > > > > sunxi@lists.linux.dev; guoren@linux.alibaba.com; Paul Walmsley
> > > > > <paul.walmsley@sifive.com>
> > > > > Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
> > > > >
> > > > > On Sat, 29 May 2021 17:30:18 PDT (-0700), Palmer Dabbelt wrote:
> > > > > > On Fri, 21 May 2021 17:36:08 PDT (-0700), guoren@kernel.org
> wrote:
> > > > > >> On Wed, May 19, 2021 at 3:15 PM Anup Patel
> > > > > >> <anup@brainfault.org>
> > > > > wrote:
> > > > > >>>
> > > > > >>> On Wed, May 19, 2021 at 12:24 PM Drew Fustini
> > > > > <drew@beagleboard.org> wrote:
> > > > > >>> >
> > > > > >>> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph
> > > > > >>> > Hellwig
> > > > > wrote:
> > > > > >>> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren
> wrote:
> > > > > >>> > > > Since the existing RISC-V ISA cannot solve this
> > > > > >>> > > > problem, it is better to provide some configuration
> > > > > >>> > > > for the SOC vendor to
> > > > > customize.
> > > > > >>> > >
> > > > > >>> > > We've been talking about this problem for close to five years.
> > > > > >>> > > So no, if you don't manage to get the feature into the
> > > > > >>> > > ISA it can't be supported.
> > > > > >>> >
> > > > > >>> > Isn't it a good goal for Linux to support the capabilities
> > > > > >>> > present in the SoC that a currently being fab'd?
> > > > > >>> >
> > > > > >>> > I believe the CMO group only started last year [1] so the
> > > > > >>> > RV64GC SoCs that are going into mass production this year
> > > > > >>> > would not have had the opporuntiy of utilizing any RISC-V
> > > > > >>> > ISA extension for handling cache management.
> > > > > >>>
> > > > > >>> The current Linux RISC-V policy is to only accept patches
> > > > > >>> for frozen or ratified ISA specs.
> > > > > >>> (Refer, Documentation/riscv/patch-acceptance.rst)
> > > > > >>>
> > > > > >>> This means even if emulate CMO instructions in OpenSBI, the
> > > > > >>> Linux patches won't be taken by Palmer because CMO
> > > > > >>> specification is still in draft stage.
> > > > > >> Before CMO specification release, could we use a sbi_ecall to
> > > > > >> solve the current problem? This is not against the
> > > > > >> specification, when CMO is ready we could let users choose to
> > > > > >> use the new CMO in
> > > Linux.
> > > > > >>
> > > > > >> From a tech view, CMO trap emulation is the same as sbi_ecall.
> > > > > >>
> > > > > >>>
> > > > > >>> Also, we all know how much time it takes for RISCV
> > > > > >>> international to freeze some spec. Judging by that we are
> > > > > >>> looking at another
> > > > > >>> 3-4 years at minimum.
> > > > > >
> > > > > > Sorry for being slow here, this thread got buried.
> > > > > >
> > > > > > I've been trying to work with a handful of folks at the RISC-V
> > > > > > foundation to try and get a subset of the various
> > > > > > in-development specifications (some simple CMOs, something
> > > > > > about non-caching in the page tables, and some way to prevent
> > > > > > speculative accesse from generating coherence traffic that will break
> non-coherent systems).
> > > > > > I'm not sure we can get this together quickly, but I'd prefer
> > > > > > to at least try before we jump to taking vendor-specificed behavior
> here.
> > > > > > It's obviously an up-hill battle to try and get specifications
> > > > > > through the process and I'm certainly not going to promise it
> > > > > > will work, but I'm hoping that the impending need to avoid
> > > > > > forking the ISA will be sufficient to get people behind
> > > > > > producing some specifications in a timely
> > > > > fashion.
> > > > > >
> > > > > > I wasn't aware than this chip had non-coherent devices until I
> > > > > > saw this thread, so we'd been mostly focused on the Beagle V chip.
> > > > > > That was in a sense an easier problem because the SiFive IP in
> > > > > > it was never designed to have non-coherent devices so we'd
> > > > > > have to make anything work via a series of slow workarounds,
> > > > > > which would make emulating the eventually standardized
> > > > > > behavior reasonable in terms of performance (ie, everything
> > > > > > would be super slow so who really
> > > cares).
> > > > > >
> > > > > > I don't think relying on some sort of SBI call for the CMOs
> > > > > > whould be such a performance hit that it would prevent these
> > > > > > systems from being viable, but assuming you have reasonable
> > > > > > performance on your non-cached accesses then that's probably
> > > > > > not going to be viable to trap and emulate.  At that point it
> > > > > > really just becomes silly to pretend that we're still making
> > > > > > things work by emulating the eventually ratified behavior, as
> > > > > > anyone who actually tries to use this thing to do IO would
> > > > > > need out of tree patches.  I'm not sure exactly what the plan
> > > > > > is for the page table bits in the specification right now, but
> > > > > > if you can give me a pointer to some documentation then I'm
> > > > > > happy to try and push for something
> > > compatible.
> > > > > >
> > > > > > If we can't make the process work at the foundation then I'd
> > > > > > be strongly in favor of just biting the bullet and starting to
> > > > > > take vendor-specific code that's been implemented in hardware
> > > > > > and is necessarry to make things work acceptably.  That's
> > > > > > obviously a sub-optimal solution as it'll lead to a bunch of
> > > > > > ISA fragmentation, but at least we'll be able to keep the
> > > > > > software stack
> > > together.
> > > > > >
> > > > > > Can you tell us when these will be in the hands of users?
> > > > > > That's pretty important here, as I don't want to be blocking
> > > > > > real users from having their hardware work.  IIRC there were
> > > > > > some plans to distribute early boards, but it looks like the
> > > > > > foundation got involved and I guess I lost the thread at that point.
> > > > > >
> > > > > > Sorry this is all such a headache, but hopefully we can get
> > > > > > things sorted out.
> > > > >
> > > > > I talked with some of the RISC-V foundation folks, we're not
> > > > > going to have an ISA specification for the non-coherent stuff
> > > > > any time soon.  I took a look at this code and I definately
> > > > > don't want to take it as is, but I'm not opposed to taking
> > > > > something that makes the
> > > hardware work as long as it's a lot cleaner.
> > > > > We've already got two of these non-coherent chips, I'm sure more
> > > > > will come, and I'd rather have the extra headaches than make
> > > > > everyone fork the software stack.
> > > >
> > > > Thanks for confirming. The CMO extension is still in early stages
> > > > so it will certainly take more time for them. After CMO extension
> > > > is finalized, it will take some more time to have actual RISC-V
> > > > platforms with
> > > CMO implemented.
> > > >
> > > > >
> > > > > After talking to Atish it looks like there's likely to be an SBI
> > > > > extension to handle the CMOs, which should let us avoid the bulk
> > > > > of the vendor-specific behavior in the kernel.  I know some
> > > > > people are worried about adding to the SBI surface.  I'm worried
> > > > > about that too, but that's way better than sticking a bunch of
> > > > > vendor-specific instructions into the kernel.  The SBI extension
> > > > > should make for a straight-forward cache flush implementation in
> > > > > Linux, so let's just plan on
> > > that getting through quickly (as has been done before).
> > > >
> > > > Yes, I agree. We can have just a single SBI call which is meant
> > > > for DMA sync purpose only which means it will flush/invalidate
> > > > pages from all cache levels irrespective of the cache hierarchy (i.e.
> > > > flush/invalidate to RAM). The CMO extension might more generic
> > > > cache operations which can target any cache level.
> > > >
> > > > I am already preparing a write-up for SBI DMA sync call in SBI
> > > > spec. I will share it with you separately as well.
> > > >
> > > > >
> > > > > Unfortunately we've yet to come up with a way to handle the
> > > > > non-cacheable mappings without introducing a degree of
> > > > > vendor-specific behavior or seriously impacting performance
> > > > > (mark them as not valid and deal with them in the trap handler).
> > > > > I'm not really sure it counts as supporting the hardware if it's
> > > > > massively slow, so that really leaves us with vendor-specific
> > > > > mappings as the only
> > > option to make these chips work.
> > > >
> > > > A RISC-V platform can have non-cacheable mappings is following
> > > > possible
> > > > ways:
> > > > 1) Fixed physical address range as non-cacheable using PMAs
> > > > 2) Custom page table attributes
> > > > 3) Svpmbt extension being defined by RVI
> > > >
> > > > Atish and me both think it is possible to have RISC-V specific DMA
> > > > ops implementation which can handle all above case. Atish is
> > > > already working on DMA ops implementation for RISC-V.
> > > Not only DMA ops, but also icache_sync & __vdso_icache_sync. Please
> > > have a look at:
> > > https://lore.kernel.org/linux-riscv/1622970249-50770-12-git-send-ema
> > > il-
> > > guoren@kernel.org/T/#u
> >
> > The icache_sync and __vdso_icache_sync will have to be addressed
> > differently. The SBI DMA sync extension cannot address this.
> Agree
> 
> >
> > It seems Allwinner D1 have more non-standard stuff:
> > 1) Custom PTE bits for IO-coherent access
> > 2) Custom data cache flush/invalidate for DMA sync
> > 3) Custom icache flush/invalidate
> Yes, but 3) is a performance optimization, not critical for running.
> 
> >
> > Other hand, BeagleV has only two problems:
> > 1) Custom physical address range for IO-coherent access
> > 2) Custom L2 cache flush/invalidate for DMA sync
> https://github.com/starfive-
> tech/linux/commit/d4c4044c08134dca8e5eaaeb6d3faf97dc453b6d
> 
> Currently, they still use DMA sync with DMA descriptor, are you sure they
> have minor memory physical address.
> 
> >
> > From above #2, can be solved by SBI DMA sync call and Linux DMA ops
> > for both BeagleV and Allwinner D1
> >
> > On BeagleV, issue #1 can be solved using "dma-ranges".
> >
> > On Allwinner D1, issues #1 and #3 need to be addressed separately.
> >
> > I think supporting BeagleV in upstream Linux is relatively easy
> > compared to Allwinner D1.
> >
> > @Guo, please check if you can reserve dedicated physical address range
> > for IO-coherent access (just like BeagleV). If yes, then we can tackle
> > issue #1 for Allwinner
> > D1 using "dma-ranges" DT property.
> There is no dedicated physical address range for IO-coherent access in D1. But
> the solution you mentioned couldn't solve all requirements.
> Only one mirror physical address range is not enough, we need at least three
> (Normal, DMA desc, frame buffer).

How many non-coherent devices you really have?

I am guess lot of critical devices on Allwinner D1 are not coherent with CPU.
The problem for Allwinner D1 is even worst than I thought. If such critical
high through-put devices are not cache coherent with CPU then I am
speechless about Allwinner D1 situation.

> And that will triple the memory physical address which can't be accepted by
> our users from the hardware design cost view.
> 
>  "dma-ranges" DT property is a big early MIPS smell. ARM SOC users can't
> accept it. (They just say replace the CPU, but don't touch anything other.)
> 
> PTE attributes are the non-coherent solution for many years. MIPS also
> follows that now:
> ref arch/mips/include/asm/pgtable-bits.h &
> arch/mips/include/asm/pgtable.h

RISC-V is in the process of standardizing Svpmbt extension.

Unfortunately, the higher order bits which your implementation uses is
not for SoC vendor use as-per the RISC-V privilege spec.

> 
> #ifndef _CACHE_CACHABLE_NO_WA
> #define _CACHE_CACHABLE_NO_WA           (0<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_CACHABLE_WA
> #define _CACHE_CACHABLE_WA              (1<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_UNCACHED
> #define _CACHE_UNCACHED                 (2<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_CACHABLE_NONCOHERENT
> #define _CACHE_CACHABLE_NONCOHERENT     (3<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_CACHABLE_CE
> #define _CACHE_CACHABLE_CE              (4<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_CACHABLE_COW
> #define _CACHE_CACHABLE_COW             (5<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_CACHABLE_CUW
> #define _CACHE_CACHABLE_CUW             (6<<_CACHE_SHIFT)
> #endif
> #ifndef _CACHE_UNCACHED_ACCELERATED
> #define _CACHE_UNCACHED_ACCELERATED     (7<<_CACHE_SHIFT)
> 
> We can't force our users to double/triplicate their physical memory regions.

We are trying to find a workable solution here so that we don't have
to deal with custom PTE attributes which are reserved for RISC-V priv
specification only.

Regards,
Anup

> 
> >
> > Regards,
> > Anup
> >
> > >
> > >
> > > >
> > > > >
> > > > > This implementation, which adds some Kconfig entries that
> > > > > control page table bits, definately isn't suitable for upstream.
> > > > > Allowing users to set arbitrary page table bits will eventually
> > > > > conflict with the standard, and is just going to be a mess.
> > > > > It'll also lead to kernels that are only compatible with
> > > > > specific designs, which we're trying very hard to avoid.  At a
> > > > > bare minimum we'll need some way to detect systems with these
> > > > > page table bits before setting them, and some description of
> > > > > what the bits actually do so we can reason about
> > > them.
> > > >
> > > > Yes, vendor specific Kconfig options are strict NO NO. We can't
> > > > give-up the goal of unified kernel image for all platforms.
> > > >
> > > > Regards,
> > > > Anup
> > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
> 
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
