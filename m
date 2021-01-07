Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BCCC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E2C23142
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9E2C23142
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o12g63Knt0P5cpXprhY/LjZRnuPROLfgklNmwavBINw=; b=Natd819ktT/Xp8FSmZ4tfE2PG
	tnTPYrfj6avxbJGcsdC9Fb0TyrbDDUzcEuFWOw7fqT0mTquvqa6xWssSL9sZXURReE7Hbj0S7H6CF
	RRGubY26oN5TvUGHBs4XJ+Dc/7FdoclAssnxBIVRTNcfXSIXtDAXNfAFIHCueql8GkXdP+jK+zrVA
	PvQXw77yHSxsyyqZZ3W8RMq61rm/jeUCiwajbvhJy4DqkeMuVoCKJuU+dBfygbEKZwFnD5Kj1olvH
	40akrdyjqno8IGmXH/1g8oGbLF9v5vPK5PIe5g+bOqtybOOMHQEzP/kukV3R9+GYmNbIk/z8/Wvv5
	qc3Wkg+Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxThu-00063X-C3; Thu, 07 Jan 2021 11:43:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxThq-000632-Q4
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 11:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1610019834; x=1641555834;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HFHo9RLD9y+a2WKUQ416LjgfIfVkZwmwCE9opCa3DOo=;
 b=b75o63pjyh8fLk9YiqFWaa1IH7eZppUOj1YtfyR/e8hkq197O0K/cT3n
 3QiF/u2d3GSdDA3ZFIx/owLLqgeWCM3USCMYBSoNWHX2ZGEWc61RYAhHS
 DcE1PIT/8NHriRh/F3whe5nAHNvVREQFprHIRUpZOZQ9HzDbUoRLi1RUr
 13WN2D2z7sBT7AbS5YEUMWE0Fm+qYUgugAX5e/36ad5tRSDY7hkmzG+pD
 vJSPb3XCXYjR60n9wxcOgNFR2gGaynaRph6PI5e3TSNdXjinK4MaUMh+r
 YwCxuHj5vPaBdh/DR04FK0S0tNs+Ei1/Zf194VK9anJDZ2PiLuACXOehl A==;
IronPort-SDR: qjjtzv3B9dJ+ME1u1SCjp/DIRtkUDpnYXxVXYvgerGEZBBdM7eeCyg0oHr8oYz40A9XUxCeC/F
 edNZ1VY9eCquY6sCZqj1fGN0smsK4MRK3a9rC9buzJTjM8mjrsbu1t7OcxYMtdQ8lJ0BgnUnRT
 9/rALHhbVtNwVOBmjTAKUmNSegQj5pF2v+PvTMIpkbqsSCEavmahep36PL5Nps4Ox32VSNG+Gn
 Z49YJAgBGps75G5xwSSKUgVZjDn1ensLn7cWsmrBN654N4mtLdK1ZzGloZa2xXw6nzTgUtMhVO
 2BE=
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="39640668"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jan 2021 04:43:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 7 Jan 2021 04:43:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 7 Jan 2021 04:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiCZSFLFDLLg+IZ5QU5QqEQePb2ozCv/NqdrEoQ55DxZ/wOF1Ub9l5dlqXEAFJJ/+JqjQFTcVe0o59CRJ5XTzZ5XwWWj8OYQ/0rQXLWU9+qktBo3TCMr1SlDKKSBXmkWAqz7nSso4Y9sg/XlrzD4431Q5TflIcjf6qVjVTL8QAkGBivntDgghUKxzmGL1MTTVfiuP4+b8vJIxrZ1NXC/rSoAOReX4nDmz3El2M2EksEHHc1RpxqE2b6zMVrlgRUnGu12x1Wqf79vCfoSbsS7/OrBtmMB+2fy5YYNd1PXv5By8Be5H4ONOR+B1qZq2fPshUBb0p3TrRkf0UsZYmtGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFHo9RLD9y+a2WKUQ416LjgfIfVkZwmwCE9opCa3DOo=;
 b=n2xeHRgmSF3wwhgigmRK9TK0i6JEsDOA34C35WT9Bupu+N16/snBTyOWw0O7ylYOrOmUyrtq5PjmfUENw/GAfa2K41HC8UQ/O0JpPZ7t6XSlX9r4uc0pqA+102eplFu5UdtnzxiH8YNtYS0AP8WU4c7YvFpjr8r1Oa7+RsthjI63KOp7tQAJf47qwG+6vQL0YyxHDPu9IzPqUQ+MyA5x2ykopaDyyOaRwn+juH+A7RCRf4UUpMAULlJo0DxJc+oMEbrNvgyfD84gWNZAYAq8khqUFVO2RQm3SgIQII2IEeL43mSnlCtzHNmQDnpdTNsyFtwXRkvFNKfoPMAZDM6SpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFHo9RLD9y+a2WKUQ416LjgfIfVkZwmwCE9opCa3DOo=;
 b=RybOhUDM5OKh9hSuXqzwLuHxEkJKt5k33a4UNFnq6JBrYsZVNOvFMa8yX24F1JRXe5xlvbyGrtK0dVAbIb7kqJs26az+aFprQf7QWWZUg14TYkVkpMX7C4uLC6FgWUzJO8L7Yg+HB3mNEFTcG0MqJw0D19NX31ZA9Qr/bq14cBw=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM6PR11MB3227.namprd11.prod.outlook.com (2603:10b6:5:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 7 Jan
 2021 11:43:50 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5%6]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 11:43:50 +0000
From: <Cyril.Jean@microchip.com>
To: <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWyhutfKJ2vY3B80Kg6w6FH7XM0qocQIKA
Date: Thu, 7 Jan 2021 11:43:50 +0000
Message-ID: <3d13a678-f804-245b-696e-400f128658c5@microchip.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-4-atish.patra@wdc.com>
In-Reply-To: <20201204085835.2406541-4-atish.patra@wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7ca5ed7-43bf-42f5-5c93-08d8b3018044
x-ms-traffictypediagnostic: DM6PR11MB3227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB32277423AAD4C9C319B6C0F49EAF0@DM6PR11MB3227.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFDYjrOLesS+HIbL7Qc4s0V2KiyVx39fq8q+T1zOBFEopAX2eYbDc8vlOw0linAT/stFpngFR37RKfCnVuPVhClY+bW49amcueeWhUFaf1pOljD3mudFe14ulELGJQ1ZvqOMztjhtYvk3El1MT3Bwuv33308tOsUrOrsHKGKrEqV2Uf+ta5G3O8nFrTBRjttp2JVivI1NNK2bDow1UY/vEBbF+u21dVBepEt8vzi6YxxNi8QWNT874IEuHOQI/OKusHRKWIBH7Ls9Tz9uRj1SDPPBXkCMQuazllUINCzt6HE9UEGZe9ZkrXiLYbhkOpO5y5DoteNdpP88Ed9DrJE8T5sCo2c19oKLMytXv69PCA40aD8ncDKujVKk9bWXqWfK7vCnbdwA/3PTEhlJVjkKSb33aFYzNsQ0Qclvd14TmBaiDx3KR5kJJTj4Cm7hWfhbdu0k25w6hHHHn1ur4cThq7LmdtaSQblgEMJdYqOOqebLoDbvdk0GEB8/ULAJcD+1eoetGMYAgHO0KweC7LdIhbTEi2RMk8ihC693ssIkfHXlmPkt8NPgE7vtZI+XBf6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(2616005)(8936002)(966005)(107886003)(7416002)(6506007)(53546011)(71200400001)(316002)(6486002)(31686004)(31696002)(30864003)(36756003)(66946007)(2906002)(83380400001)(5660300002)(66476007)(6512007)(8676002)(66556008)(26005)(110136005)(66446008)(478600001)(64756008)(76116006)(86362001)(54906003)(4326008)(91956017)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bThoeHZ1U0J1cU1hbkJ5UnVEcWNsaUJJc3l2VVR4OEpuQ0ErNU9qaEordWNY?=
 =?utf-8?B?MDl6L3ZJYjV0TjgzTUNGWEVBOFUzVlY3MVpTa3IvQmlvdjVQblJsMFhUemhB?=
 =?utf-8?B?cGFMUzZNc1kwVFBZTEI2dFdvdnNtVXJINjlHQVV1N3VIS2dpU3FWam1VMkUz?=
 =?utf-8?B?UVZ1SjNZN2c2QjRRU01kYjV4UHJqbmNka2ZWUzRsWmRMVndZcHgwTGpmeWpv?=
 =?utf-8?B?TjluM3FSSG1NZEk3TjNwNHJwdWlOTUVmNGFvSFZLRE9LOHNwWFJzRDRVK2Va?=
 =?utf-8?B?TVdiUzIzZnlXYXlScnY1Mncvc2hQYWo0MFFScDNWM2s1dFVLbTlNUUxJRXJU?=
 =?utf-8?B?L3kvUCtPcHM1NDFXQXBxR2w3VzV1ZE5nNGFTNVBGamlLeUxPeXVyVE5tdlkv?=
 =?utf-8?B?c2JwbVR6VGxCamZsWmVISlllVXJTVTBCdmFGL0MzVGcvbnJkOUxObkMwaHFp?=
 =?utf-8?B?SFNDTTRCUkJ4di9CNjZPS214eERNTTJGWFBBOUhqMURYWWRvaUY3YllMSHR5?=
 =?utf-8?B?MkF1MUVQbDBHSU5PV3VQaGlLdkFPRW5tUkJSekNRNnJ1b0UyUnY3cTZrOWZh?=
 =?utf-8?B?YjJ1aHpydzhXSi84Y0tkamhudEtLY0dwaGhXVUhPcVAyTFVYdmV1c3BlNElX?=
 =?utf-8?B?N04yVGpaekx4U250bk1hRWFDU2NOWDFZVi9rSXIyUVg5Uml6R0NnQ3NHUFpr?=
 =?utf-8?B?N0lyZC9BR2orWnltbkl1dUJDYzJ1MHdWcG1tM21NTUo4Z0JDaVEzSVpBcDUw?=
 =?utf-8?B?MVA2Vm5oblNLTlRGYnVFWnZZbVd2d2lBbDFtaW84VFZLWGJtMUFETzdkTTRX?=
 =?utf-8?B?VDRlOHJrTkZCbEFqQ0hkdUhXRTY0NWFTa3h6a1lsejVhTnlsMWx1RklpSTdS?=
 =?utf-8?B?MjV5NXR1cGw0b0JYV2N6QitXOEpta05MRkRRMU9Oa3ljQ1ZBeWU0V201dzFT?=
 =?utf-8?B?UWErZE9EZ21VT1NHc0hDY3JhdTVVVE44SkFDUUwxL0UyS01aa3lDdzFHcm9m?=
 =?utf-8?B?dEExajhQa1REcG8xQ3BwMUt4Y0piY09lZENPWU16MDMzQW5aSjNkNzBxdmtQ?=
 =?utf-8?B?QUV5ZkljTVpjUlJ3SU1LaW5pd3gvMHBCV2R4TVdLWmVyNldSYXkrbTlZVUsz?=
 =?utf-8?B?bnJVa1hTUGs4NmFEWFFwQVVyU1YycW0zcXUreTZBMFZIZUlFOFd4RVNzRzVj?=
 =?utf-8?B?azYrRSs1a0JTVFl6OWhOaDY5NnJyTWlCYVo4aXUrb21ONVVoclBYWXFyeEhG?=
 =?utf-8?B?d05jQU1oZEplMDJIOGNsZWt5N0t2TmxUUmJvdXZrQVBwTjlja0JTaWpCa1Fl?=
 =?utf-8?Q?ysLdSbEZF86LQ=3D?=
Content-ID: <DD67DC43F3F9C145865EA0C61C6B1D74@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ca5ed7-43bf-42f5-5c93-08d8b3018044
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 11:43:50.0128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKCCkYdebHWYM4Xw3THUXY1Lq0FjYaTgHE5D8+IqSILcs6tCmcUKU0k7PfOtt1gEu5SH2/mKDi3kKqHRhdOmTpKb2nLKilz04XhyY8MiPzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_064355_158368_1D89DFA2 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: devicetree@vger.kernel.org, anup.patel@wdc.com,
 Daire.McNamara@microchip.com, bin.meng@windriver.com,
 Conor.Dooley@microchip.com, robh+dt@kernel.org, Ivan.Griffin@microchip.com,
 aou@eecs.berkeley.edu, alistair.francis@wdc.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On 12/4/20 8:58 AM, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/boot/dts/Makefile                  |   1 +
>   arch/riscv/boot/dts/microchip/Makefile        |   2 +
>   .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
>   4 files changed, 406 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ca1f8cbd78c0..3ea94ea0a18a 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-y += sifive
>   subdir-y += kendryte
> +subdir-y += microchip
>
>   obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> new file mode 100644
> index 000000000000..622b12771fd3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> new file mode 100644
> index 000000000000..5b51dad13c72
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "microchip-mpfs.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ            1000000
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC Icicle Kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,polarfire-soc";
> +
> +       chosen {
> +               stdout-path = &serial0;
> +       };
> +
> +       cpus {
> +               timebase-frequency = <RTCCLK_FREQ>;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x40000000>;
> +               clocks = <&clkcfg 26>;
> +       };
> +
> +       soc {
> +       };
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> +
> +&sdcard {
> +       status = "okay";
> +};
> +
> +&emac0 {
> +       phy-mode = "sgmii";
> +       phy-handle = <&phy0>;
> +       phy0: ethernet-phy@8 {
> +               reg = <8>;
> +               ti,fifo-depth = <0x01>;
> +       };
> +};
> +
> +&emac1 {
> +       status = "okay";
> +       phy-mode = "sgmii";
> +       phy-handle = <&phy1>;
> +       phy1: ethernet-phy@9 {
> +               reg = <9>;
> +               ti,fifo-depth = <0x01>;
> +       };
> +};
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> new file mode 100644
> index 000000000000..7a076aa4c78d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC";
> +       compatible = "microchip,polarfire-soc";
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       reg = <0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "disabled";
> +
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@1 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <1>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@2 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <2>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@3 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <3>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@4 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <4>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +                       cpu4_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               cache-controller@2010000 {
> +                       compatible = "sifive,fu540-c000-ccache", "cache";
> +                       cache-block-size = <64>;
> +                       cache-level = <2>;
> +                       cache-sets = <1024>;
> +                       cache-size = <2097152>;
> +                       cache-unified;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <1 2 3>;
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +               };
> +
> +               clint@2000000 {
> +                       compatible = "riscv,clint0";
> +                       reg = <0x0 0x2000000 0x0 0xC000>;
> +                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> +                                               &cpu1_intc 3 &cpu1_intc 7
> +                                               &cpu2_intc 3 &cpu2_intc 7
> +                                               &cpu3_intc 3 &cpu3_intc 7
> +                                               &cpu4_intc 3 &cpu4_intc 7>;
> +               };
> +
> +               plic: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       compatible = "sifive,plic-1.0.0";
> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       riscv,ndev = <186>;
> +                       interrupt-controller;
> +                       interrupts-extended = <&cpu0_intc 11
> +                                       &cpu1_intc 11 &cpu1_intc 9
> +                                       &cpu2_intc 11 &cpu2_intc 9
> +                                       &cpu3_intc 11 &cpu3_intc 9
> +                                       &cpu4_intc 11 &cpu4_intc 9>;
> +               };
> +
> +               dma@3000000 {
> +                       compatible = "sifive,fu540-c000-pdma";
> +                       reg = <0x0 0x3000000 0x0 0x8000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       #dma-cells = <1>;
> +               };
> +
> +               refclk: refclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <600000000>;
> +                       clock-output-names = "msspllclk";
> +               };
> +
> +               clkcfg: clkcfg@20002000 {
> +                       compatible = "microchip,pfsoc-clkcfg";

Can you please change "microchip,pfsoc-clkcfg" to 
"microchip,mpfs-clkcfg" to align with the v2 clock driver?


> +                       reg = <0x0 0x20002000 0x0 0x1000>;
> +                       reg-names = "mss_sysreg";
> +                       clocks = <&refclk>;
> +                       #clock-cells = <1>;
> +                       clock-output-names = "cpu", "axi", "ahb", "envm",       /* 0-3   */
> +                                "mac0", "mac1", "mmc", "timer",                /* 4-7   */
> +                               "mmuart0", "mmuart1", "mmuart2", "mmuart3",     /* 8-11  */
> +                               "mmuart4", "spi0", "spi1", "i2c0",              /* 12-15 */
> +                               "i2c1", "can0", "can1", "usb",                  /* 16-19 */
> +                               "rsvd", "rtc", "qspi", "gpio0",                 /* 20-23 */
> +                               "gpio1", "gpio2", "ddrc", "fic0",               /* 24-27 */
> +                               "fic1", "fic2", "fic3", "athena", "cfm";        /* 28-32 */
> +               };
> +
> +               serial0: serial@20000000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20000000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <90>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 8>;
> +                       status = "disabled";
> +               };
> +
> +               serial1: serial@20100000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20100000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <91>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 9>;
> +                       status = "disabled";
> +               };
> +
> +               serial2: serial@20102000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20102000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <92>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 10>;
> +                       status = "disabled";
> +               };
> +
> +               serial3: serial@20104000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20104000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <93>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 11>;
> +                       status = "disabled";
> +               };
> +
> +               emmc: mmc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88 89>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       cap-mmc-highspeed;
> +                       mmc-ddr-3_3v;
> +                       max-frequency = <200000000>;
> +                       non-removable;
> +                       no-sd;
> +                       no-sdio;
> +                       voltage-ranges = <3300 3300>;
> +                       status = "disabled";
> +               };
> +
> +               sdcard: sdhc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       disable-wp;
> +                       no-1-8-v;
> +                       cap-mmc-highspeed;
> +                       cap-sd-highspeed;
> +                       card-detect-delay = <200>;
> +                       sd-uhs-sdr12;
> +                       sd-uhs-sdr25;
> +                       sd-uhs-sdr50;
> +                       sd-uhs-sdr104;
> +                       max-frequency = <200000000>;
> +                       status = "disabled";
> +               };
> +
> +               emac0: ethernet@20110000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <64 65 66 67>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       clock-names = "pclk", "hclk";
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               emac1: ethernet@20112000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <70 71 72 73>;
> +                       mac-address = [00 00 00 00 00 00];
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       status = "disabled";
> +                       clock-names = "pclk", "hclk";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +       };
> +};
> --
> 2.25.1
>
Regards,

Cyril


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
