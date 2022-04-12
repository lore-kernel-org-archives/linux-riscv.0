Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E88C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+lLTFkW7qY+T34krKhO50lP+qmbrd4Du2aNJNratTQ=; b=HS54e01/e5IO37
	mpA6Cb84cQXJRUio+RdLXBvqF4VvK8wUD/MgT/9Nn4dmqyStIJcJG/NCtjllGkPOAOyYi9qRmiIBr
	lAf+wCtI5lUvZMeVCzMHOMAlf0LIS6rh7wmHY4j7ruQvny8d6V7nMfHBsCaPUXkXmugv5AGMAoRh/
	iLPbWs+5ZN5Is+2DFWRRbHDSiC1QqmrxuyDNGdYhZh3TeHyP97i1Rcm9efr8+Wi/XUz9QqnlGvXnO
	wHcKdg7W7LP85XCvIHlOcFfSoa1GZNRWe1JsgjykP25vtYq9DhD3rH/G0Qv3SkapdqDR2kgQ/zucr
	dhoXb585yyog/QDVc7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFGi-00DxCs-3K; Tue, 12 Apr 2022 12:05:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFGe-00Dx9z-Vr
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 12:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649765108; x=1681301108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
 b=uZLpdS/f4yajFBH5RRgDF0/PvFjn1Og+ikdqJXqd8IKpygD4LQ5/RIhL
 9iktmtmE0hlklw8kBPOxO1hbbx77dhmZmSj3rn0Auufdfu/sZ/83wpzch
 jch1PMNN2Zlj5bn0xKD18YFjBNBhWA4qlYpordxui1p5g4IxvRwap7lCU
 oGiebd2TeBpf1vxTvnG1HCnHKWEfhl2tuQ8fx/I03IrU9n2YboVfq5aas
 sxsxtWAD64/c+k1gRF+kHcWEUUOIuZ6p1HzjZX3BWX/gQjSmD/Re+J4jU
 Q6Tg4yPKg19Y0C8riWoLccXH5+L5FFEXDWJJJa+Rzm8VQG72iv0EvIiYN A==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; d="scan'208";a="155273944"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2022 05:05:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 05:05:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 05:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtmdXjSaP0ipMb4zFb+l6ZM2PrT6prWZaVpsKxp9DPdGI/cC25k4gvp2K/84W3pjfP2BSSDqOADMpBnza6OFul7Kt+5LZJUb+j7zR45i9o0u2chSrEZ346DtSefHusE+vQz7ZF9o4b1OvgbDcZPaX+oC8h+QQlxiYPaXfyKNL0q/bFM6+09OAvcmIR3MDDFIyPwO7X+WGWaQTTLDLPMDMZGaxgxuI/+JdwieNqfnzpHQqQkEPT+CjJQBcT6WVkG9ExRmirvc5+ZsvshH+/witH9gIS+OJu18ouAJphPAQdzCvGVa8AVUn00Nz5Asd9tKZSo8T47ZDM01uFS3aTKAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
 b=AlstpWTLOsDy3h4xAH/JcLajkZM6bni/O2UrUbEMPvL2aEUEQg43VL/U3kaXmkDyvaOPqM7AFEAidZMIpWi4X0bEVatZLnNQExVLQn/bydSdmAXbafHRDFjRIfURN8dCEodS2/zbdk4UkHeW+CnyHzx31UOr4qMKOPoXFLnDCS/Ch3qQ9xw9hk3m67uJS21J622vOCoV2togdPQYzY+VNODlg0GG9jDzdg1vhptcANXzfTXaVNGsE+MQe9Z+lAzvlTMhhOfOW+Ahltt0Hc4TPtT087P/8ROhOHdcxdf2nZpfeFiatnzu37677kPEd6Ioh+atw53pD9e31+ameOER0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
 b=tRyNDmYPbAgojSOxMIX3srEekmcTErkSh4qYb/Zyg9jY2VBE7ZrbquonQW84ehfJgu43IYPcLPv9nfzb3jYKs9F1BLshdBXqX+PqP+D+GvAuSC2dJViN2NcZgvnmXPZo9Sw6tp/qYrzyUkCwDsZ+PSEDUc4cSNL5g568fFupGRY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BY5PR11MB4038.namprd11.prod.outlook.com (2603:10b6:a03:18c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 12:04:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:04:55 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
 <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <Daire.McNamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Thread-Topic: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Thread-Index: AQHYTYKslABeLE5gO0q5nkv48GN1+azsKxIAgAAE2YA=
Date: Tue, 12 Apr 2022 12:04:55 +0000
Message-ID: <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
In-Reply-To: <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c817f0e9-fb2b-4301-76ef-08da1c7ca881
x-ms-traffictypediagnostic: BY5PR11MB4038:EE_
x-microsoft-antispam-prvs: <BY5PR11MB40388EB1850C30B70236E39398ED9@BY5PR11MB4038.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4mPbrlGEb5otdd9wEfDjXsxjBs2nq85p7zyTYDDkJ/hqhQFW9Vkaz5k2yNISthZg21sVQU7vOSy0ji/nB2Fr2pABmzs2ebr2hmgolAH6woUQ62DvMbRwAvukPP80/kx73kZQWGxSiH6cdpKoYWKmX1KPWwG1W64KCx44BAjdqgAyHz3TmB34HHfe1o5phB57mwxwPQNQdO6DhF78XpPdeVK209w9PnioZOzJRGr/tISLFkNhe6QThIuIw8moTpz1kUd7l0nz3vCbHIy0MOqIbz7JIeHGJjRLx1aAamL+AF2ogmLkZnZYI/kWZp5QwDAwXCIF5927m9+iUaM3O2TOQhE8yM0cAsVB3bUB6dBFR+9QqzV37pC6EBAjYhmM+F6kJae31S6FqVtRHs0RtMAqVGfWNhUrkNWKAhf3cOKd/Y7x/nsRqeoIThQA0S2DRdXto/PAGYyaALaJXs2QNjsfzse0XycuyHNQBtukG5NISlO68Z65KugnwHExStA9NMEyXr5zKLiGsaIc+E9Ly3R9BRQNHF1cUyFRYBlOh3E9L7RTczfsX+iSKCcioJUZj6Xt5haPTKfU8ulFxFi56HjgZOY2NnF//O7khBpSwoAOYL3M7ywBS7GCV5HW1mZ7pTFpYX5vMUcsH67+xkm64OvBr/Fr4g7IaSJal993l4nbYLjkA9pvRSKP7qbblBfwwmoxjrvGRxSHMgcRsyvCg7uNBXdV0Cv49QvH2+8EzrPmXA4rvTlRH//sdKhRZSlcoBioxdBVv0CBBE70em0j0++FnuXiddeLDGUdvOiNz9/vx9jtdG3oSC4M6FNnP4qNpY/y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(508600001)(91956017)(6486002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(71200400001)(110136005)(4326008)(26005)(2906002)(2616005)(186003)(53546011)(6506007)(54906003)(6512007)(36756003)(38070700005)(7416002)(316002)(31686004)(86362001)(31696002)(8936002)(5660300002)(38100700002)(122000001)(921005)(87944003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1Y2Vk1wRWM5ektFNVZERXNNRFppM014SUVVamRLNitjWFNGd25PNnhPRFBF?=
 =?utf-8?B?dEE2YW1BRWtQb1JvNlk2cmc3RWkzenlFREp1ZFlrMGE4V2tqSUR1cEltSnVZ?=
 =?utf-8?B?MFYydFFJTTQvVThvU3k3QVdocFZ4alUwZnpNTkRBR01OZ2JFWVVDaDhhRVp2?=
 =?utf-8?B?VWROTThqUDZ2UWJmdVhKclduSmNtU1NOWk5GeUpIa1ZXQ2d6WXVYVUgya0k3?=
 =?utf-8?B?ekwyY3dJNGQrS1ROZGNtK2w4OTNyWGlObXZDdUZuTnZJc3dDcy95RUR1SmNr?=
 =?utf-8?B?WVBwQmtKZ1pHdE5KUXl1VzlZVHBra3IxckxLZk5IVURwR3A2L09WQXczemx1?=
 =?utf-8?B?aXJsVENnMlFOL0xRU09acFhzc3J1ZU1ud0hCa0ZrTnRZQVB0SnlKL0dka1k4?=
 =?utf-8?B?N0xTY3Ewb21rYjR5cXVRQlA5cFMvZ3dOc0hPNnQxazdKWUZraGFqeGVMY2dD?=
 =?utf-8?B?blhBUXJTZDVKaEV1R3pXeFdVWFd3dm5wZmFIaVNCdnU2ZDB6TmRDSi9IUHVC?=
 =?utf-8?B?dzhBY1djNFhIZkgwN0ZjRkpVZ29VRVNJRlYrQ2J2YVFwdEZNZ0hBZnIxdTRB?=
 =?utf-8?B?RWUyQXVRbmc0NWduTUpNcmx1WS9Kb2IxaUdyWEhISDZTOC9hNjBXRjJFWFRU?=
 =?utf-8?B?MXhMS1A2Q2dKRXBMbEJBL2piblhldm50OUVSMzlyd3ZPMGlmSXNjU3FBVVRH?=
 =?utf-8?B?UWF2bkhTNFdZS0FqODJFWjM5czJyTlAvbG9ZYmk3WHEwOVJJOWE3a05QcWRZ?=
 =?utf-8?B?THZMQU1LRXJrYitZUUc5UkVpN1JPTm00L1RBekx0RENBUkRyZWFrU0NGV3Jv?=
 =?utf-8?B?WmFzRitVYmNhRmQ2ajQ5TmFhRjRkbEM3WG9zelBBRU9QN2NmdEJZZSthbGZI?=
 =?utf-8?B?TjYzNFdtaE1pT2xDYlVDRVhGeTVKK3N0STlKRXhrWmN3ZlNTZzk2Yk1wVmxp?=
 =?utf-8?B?TFdoWGhlN2I1TUZWb01MdjhJY2Z5Z0RZYkI2ejFUeGFHS3dBcUZWc1lYZ3M2?=
 =?utf-8?B?UFNZV045MUE4eDlCbnNaUW1mRy9xci9oM3RoRzVieVFtL041QlN4S0h2Mjd6?=
 =?utf-8?B?SzNQRnE3ck1FVjdkaGk0UEJoT1BxTW16SmpSV0NkUFFPT0dDeEE2ZWl5eHVu?=
 =?utf-8?B?eUJkdjRHemg1QjZxa1JiOEVKR1FkczFHb0hGc0dxRnc1cHQwekcxNWh5eENM?=
 =?utf-8?B?czBQMEtDaXJNdFhDQ3VNYW1zRWMxZjlsdjU1dUlxYTc3QU1ETkkvZlZhVHhJ?=
 =?utf-8?B?RFFJUnJrb1J5SVgxd04reDFlTWM4M0o3VTMvTk5hR0VuclZGY0dIdi9qQkU1?=
 =?utf-8?B?LzhCa3lldEFsTy9PdWUxblJMSk9iNFJBMUVPUHJTMFZpcW9GNytjUitqQ0pY?=
 =?utf-8?B?dUdBWWl3ai8renIycXl5YTVuME4rT09wemMwSVJKYUc2TTFRb0xVTjlqTzd3?=
 =?utf-8?B?T1Z0WnJHZ0J4SHJEbFRXc2w4dy9pVUxpYVVraWpGZzByZDFadURyNVR1NEhK?=
 =?utf-8?B?ZHNOMVZrMWlRZ3JxYW91SWNYaXBGcDZ6RVA5dDZPRG0vVFVKQ29SS2dZRnBu?=
 =?utf-8?B?RitmMTQ3QTR4NVp5Ris5b2hrNVlhU2Vvd1pOdmpNLzA5SkhIeDV2U2RpaVpq?=
 =?utf-8?B?OFB4L0E5bDVET2h3ZldQMi9oVnhaUDZwUnVacTAyekJ1N2FSaDlSUFQrNnRX?=
 =?utf-8?B?OXB2TUwxYlhHcGxFbjRKMnRKNzcveTFnMU94cERGaXhHOFZlbEtaRjh1TnRq?=
 =?utf-8?B?K1A5MXJ5WFNFQ1U1enpLNDdXRlV1MldtMW1zYjBWMFkwL3Y0Szg0NndjSTdr?=
 =?utf-8?B?c2NFSXI3Q2R0Nkh6emV6ancyQkFEK0llbEl2UG0rME5YbmVncTM4MmcybGJT?=
 =?utf-8?B?NkRvbTlCQU5DTjBhUi9RUUtENnh3cWFtWTM5VHZOTytselhIZFZsS0FWZTJ2?=
 =?utf-8?B?VkpDUThoR2JsNks4dHd1QlVMYWpURGVKaVBZVjl1RmlnbS9KalNENzMrMEJQ?=
 =?utf-8?B?NlRwbENUZDRxSksxenl1b2RuZTBCdXNQQ21uc0U2bUFpcDkrQTI5OW5lQytM?=
 =?utf-8?B?YTVZMnRKdkxZblVHZk5NWXdKcWYyeXJLOGtqMUdib0NkbW1Kb0RqcEIvbmxr?=
 =?utf-8?B?dUdZSkRQbnByR3hQa3gzRWxKSDl6aHlqTEpnTytxejVQbjdWU3JWcEJkNGxx?=
 =?utf-8?B?dFJ6cUpXSWxEQUwzZFBPcnFjeFJzK2hpTEQ1cmw0QmxPWjZvQ1lTZlBtdG5h?=
 =?utf-8?B?VE1kY2tFamsxd1FpZmgzeDZGRFZqb0t2S3E2UGY3WitYWnRxdGhwSkh5RE5Y?=
 =?utf-8?B?OUROaG9yejAyTEFqZHpmNnpYRXRuaFZ2dVM0cjZscWNZK2ZmVkQ3UT09?=
Content-ID: <C2DC91599728FC4E923C260C3BE23FA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c817f0e9-fb2b-4301-76ef-08da1c7ca881
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:04:55.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6PZp2y2myQnlyx2CprAYgCRQ9O4YlYIz2C1xChwLvgqqk2jSBdRhM8PyCs/ztY7Tiil/7DSuMrjb7sNhTAYtfiQHt413B+0XQJ0gRu+SDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_050509_128008_97B50E24 
X-CRM114-Status: GOOD (  21.08  )
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

On 12/04/2022 11:47, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/04/2022 10:59, Conor Dooley wrote:
>> The RTC reference and MSSPLL were previously not documented or defined,
>> as they were unused. Add their defines to the PolarFire SoC header.
>>
>> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
>> index 73f2a9324857..3cba46b9191f 100644
>> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
>> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
>> @@ -1,15 +1,18 @@
>>   /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>   /*
>>    * Daire McNamara,<daire.mcnamara@microchip.com>
>> - * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
>> + * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
>>    */
>>
>>   #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>   #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>
>> +#define CLK_MSSPLL   34
> 
> You have some weird order here. Shouldn't it be under CLK_RTCREF?

Yeah numerically weirdly ordered - I grouped the clocks by type:
MSSPLL is a pll, CPU/AXI/AHB/RTC are all dividers & the rest are on/off
toggles. I'd've prefered to have renumbered the whole list, but that
didn't feel like a good idea.

Additionally MSSPLL is the source for CLK_{CPI,AXI,AHB} so I put it at
the top. I have no particular preference, so if you want them reordered
so that MSSPLL is under RTCREF just say the word :)

Thanks,
Conor.

> 
>> +
>>   #define CLK_CPU              0
>>   #define CLK_AXI              1
>>   #define CLK_AHB              2
>> +#define CLK_RTCREF   33
>>
>>   #define CLK_ENVM     3
>>   #define CLK_MAC0     4
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
