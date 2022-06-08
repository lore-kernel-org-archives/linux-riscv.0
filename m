Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3C7C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lo8dERomSmDoCniOFNfMsQ/U+o858UcC3IlEgiT0cpU=; b=Flu5PSx2r+ofx+
	IbM7mzDVT3D5TBFjpPge5ZDxCm0Pl1xkKIDUukHn9Y1XGM/c1Ur09PLtjZyaaOmGNzY2i1G0fRL5A
	8tlWcOhDE5MbSTTWPgSVuPYCfGjMLJ3zbQcc7OxPR/GmXM/j8yqVyHcVnkoQVUed8M+E07e/bWoKU
	h7mPIsADGX50RzXd5J3QlbhMn4uWAMF+V7kkOpk2VBAZpo3/DgNEBcmcOGEhIJORL6enJZpQPusU5
	mjDNqJlEE4OPZe5CCr7l/8Sq4URMyEC6jIhFjrxXpdMUtAaj8rS5OBkIOBuQ/oDdDyegcZTLx0DBT
	ohTor1ZHRR/oMKLP8lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv7g-00D5tS-1K; Wed, 08 Jun 2022 12:49:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv7b-00D5sM-SS
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 12:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654692555; x=1686228555;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5dqpPZgUfcN1jpgLclxvBPx2sP1KjS23qo8/ulw/9v4=;
  b=ntU7iFSSf10uXUU6A/E7pYBZCEuG1WLWu6xR++peCHnfyVFDQV6BfDgi
   q6ptrt2MfAJXUowIJOGJsgLW42usiRzPPhXVLNMnLpFmxuGZrWTYMYvX9
   W5nQvo1AXRlP8VL38IppNuQOylapynPJX3TC1+b/0CGMWubMfiZkQJdHd
   sz4CFC6aSHkCc8teOAaNidLzViZtNNAXFwcbZFNOcN4xuMFCvVo4L7btS
   D9iP2QmpYbRrKOCjesYRkGib7HLGtLRzDJjszSF0f650jT7KTxxgWthG0
   gbFG1IniWszonpKfVjRAr3hq659Ky/hb7ljVa9utB2lw6a2AxQUKuaErs
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="162424726"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2022 05:49:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Jun 2022 05:49:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 8 Jun 2022 05:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agF8F+14q+xq1OwIFUR7UJj8B6xgwO4rsJZZ8PBQqTJgeNz2coThhakEFkfScqGFBVj2DbXqUbmyRHOpiEhPcRKAmgIBh/mqs2x+88hn1Lj8Ma628btJrlvTkvzib4O39FQvHHbT665kd4eB6yQKPJBPfxmUjQKfxqB56IcN0F2+fTjt3/1wTTQUrfpc6+WRjoTQiIsgW6zAoiYxfYYvb/ugCOdM9P84t7Bs5HQLldTpiKIVAZFMNLRY2GNAPFUZn5AmRXF38p9wiiaJ5zAp+sJmb6K3i0/2hPa0YKHfRNka0tQd7WiRPfFYRgezxzMNC8WbaascmTHf9/U8s6bYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dqpPZgUfcN1jpgLclxvBPx2sP1KjS23qo8/ulw/9v4=;
 b=Hkf7eY7soeGrIKgqgCXve7RnuuLK9q2xBTEMm35U4X71ipjUQ0mEnP5acPHma/WGUU7vY4Ck12DoANMKpC+LVyYaRib6C6KhLACavCFHE5JjJg6LmFh4um87zzq+Q0pfgupHQQUQ63jniqQI90MSD/+IoyUy8EOEonCX7OiUaSVlHNMKjCUNH6zPagQHM03g2OI8kacs13JPw4dAZFnCT4K9hBRMCgxvVBAVSdtTBaLsjEOmLiBORDJopkGnG2Nd8FTRe/c7xxzdRrwVrj4sNs2x1T3C6OfqqYT9lNhHRK/mAYUZgevRPw/PZ3xA2h4D+KOeE39spE74i9SBSNmG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dqpPZgUfcN1jpgLclxvBPx2sP1KjS23qo8/ulw/9v4=;
 b=FTwxBfhqTMOVzizQVBqq/RV2RajF0FNX9bgfLZ87S5KdpER5Mnv4OWiuBWnPvuYOkqX765dJWEL4mPqDFnlSyE/29+dgTsOspsebAubgXWjhnmH0mzrPb4mAtPhMcpWg5mQhsQz6zAMO3jI3qcyxv1RG77M/Q50NKxAFjOufgnQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1463.namprd11.prod.outlook.com (2603:10b6:910:3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Wed, 8 Jun
 2022 12:49:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 12:49:06 +0000
From: <Conor.Dooley@microchip.com>
To: <heinrich.schuchardt@canonical.com>
CC: <Daire.McNamara@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <gregkh@linuxfoundation.org>,
	<b-liu@ti.com>
Subject: Re: [PATCH 3/3] riscv: dts: microchip: fix icicle kit's dr_mode
Thread-Topic: [PATCH 3/3] riscv: dts: microchip: fix icicle kit's dr_mode
Thread-Index: AQHYenID/JCqnhUo2k6UHJwb6MNxwK1Fb7YAgAAHPwA=
Date: Wed, 8 Jun 2022 12:49:06 +0000
Message-ID: <9ec92e13-2af1-e65a-b24f-7acf895a40ee@microchip.com>
References: <20220607132204.746180-1-conor.dooley@microchip.com>
 <20220607132204.746180-4-conor.dooley@microchip.com>
 <244df608-ef96-d3f2-2463-1cc82728e70f@canonical.com>
In-Reply-To: <244df608-ef96-d3f2-2463-1cc82728e70f@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16162dc5-f8a9-4398-b5fc-08da494d45fe
x-ms-traffictypediagnostic: CY4PR11MB1463:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1463E7BB0814FE6B44AAAB0798A49@CY4PR11MB1463.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mny1GxcpIHfavJSiQtfRt6QBGZzXZthO/wa2uGc2OwXarfOxrvzd/aD2mYxa7S8l/PpxMfMyH3rU81ExVQr3KGRKh0uY/EDhydTIRMMqrszQHjUX4pKM+7p6qE7Y2nns4Jo6fLBXi3tiOnHW0qxar4pv/IAQyH1lw5KaYKG91VNTQUQBAStLELAWoIk3CaAa+kOc6oAfAD0r4TLC33/RTWEeCMDmrShYuI6Jjge0LM1pM2hJjnMjn9OBt1bPtla2bqsdumzyyk4wh+/Mz/AU5QLohyIyPYm5g9CIAMvpua760pE0c3RNXBEVk8mQ8SdeR4Gqd4a8svfVRfME4EX9xOYcDUhDh9ziy6SWCPT/gk+Xpx6ML8MVWFCEO61+7h6EN5WeNbPgNUO4kgrLBsVuJlG5KHsP+WuuG/TzaVwuClkTo9q/XKJPYcsGWmTdMLB+d5yzVI+bTxt+d3Y0LcTTaGCa53ncmNwilRegn53zJme444zZFDmsKT2gLGWi9mnqaiFfVyDfM2/arvv0S4M0gDeHShwuWXftPevosXhvksyPkFpYpey+4dkMtwJpSGKoopVt0U4XUu0L/GQ0Vxjk+3Qg39ACJ3RcX2cay9DBm2x1EyuZk1O+nn/1Tn+VdoQ+MAoySoW7TC0O/5M4tFO/zYzaPIpa4F9wXLNT9HJyE6YhI2xo7Fb5fDPzu0ZoWjR0I9lD4KtN/mJBcrGr104NwRMhc0/cwv15b62sbm76qBD8cg6iCjneqZ2HApszz5qfrNKQo9VWVBQOTu8h2eWBtoyAvKm87i4edKdlCA8lfWVOwolV2j8ROB8a8Bl6bAXuGe9pW5/1DLLQSkM6IubCu1tajm+KSjpMhi5VufqXs9/BsZoENZB9ODLOb1QG4BM4wN4830VYCrfjEkZIJhZYRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(91956017)(66446008)(66946007)(66556008)(64756008)(76116006)(66476007)(86362001)(5660300002)(8676002)(31696002)(31686004)(6486002)(186003)(6512007)(53546011)(6506007)(2616005)(2906002)(6916009)(54906003)(26005)(316002)(508600001)(38100700002)(36756003)(83380400001)(966005)(71200400001)(122000001)(8936002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2E5ZFV6bkROQmxobUgrV2F0WkJTaTliSWx2NUZOaThqN0pmcE05SUFpK1lG?=
 =?utf-8?B?cEQrNEZUYnhjTVpwMmgwVzg4OGFsTFdTVEQwejd1cGs3aFpKWW1idkdORjdP?=
 =?utf-8?B?dGVaNG9ST0J4S25sdlJkT05ZamY2S0s1TWgyT3lkUGYyYWNBTU9aRVBjMUdT?=
 =?utf-8?B?TkpYaVVJUXJjUndxS3VEMGdYdlFvazRLUDNwWlVlbjZWd2xET1cwUEJFYXIx?=
 =?utf-8?B?dE5yOWxXOHVwMElIT1duVHk1S1k2UGEzVHVmY2JsZitNNWZNbHhNZ29IbEhw?=
 =?utf-8?B?MjNVZmo2NGwrZE41cTEzUzR4ejRmaVBvUE0wbUJUb0pSRDlPdndweWFrRW1z?=
 =?utf-8?B?WHArbi95d202N1dtT0J1R1lBamtsOTAvYW44TXFUYmtaMGRpQnlzQVNEUlZ2?=
 =?utf-8?B?dDMwVTJ0cVlTeUx3bzN2dytjVXpmWU9JeVpXVVBwVVhpQ3hsVlNSekRVZTBr?=
 =?utf-8?B?TFJPYUcvRUNvWmhzS3A3TzliZ0pUWDBtWGxhdEIrdGhQVWg1NVRiRFVKemto?=
 =?utf-8?B?L2syOGRJZTlraVlqd3BUSy9JL3pCZ1lsNWtqSVhCK2xwdDNpMnAxNWJ2Mko5?=
 =?utf-8?B?cTlzZEN0dTVudUxDb2VObkp4a0FncStEWHdZbW9aYTExRis3c0tGNmtMZWFG?=
 =?utf-8?B?MkM3dWtHa055YWRPZGViQTE2VHhpeWFKcXlwV1dDeUdMVm1Rd3lFS3BVWDYx?=
 =?utf-8?B?Z2JHNW00Qi93d3p4OFBDb2pXaldBUFVPcURBU3gwbjdtekY0aFZiUmxEREdY?=
 =?utf-8?B?WkJpOVFnT05tTVVTSU85YnlheXRuZFkwQWh2RTFrRU8rU2w3TGpUMkt2T09X?=
 =?utf-8?B?cVF4Vk56SUlzcXlTS2F3UTM2eEZ0ZWxHdE1DM1JmdjdNWFcrVnZGZzVKY0s2?=
 =?utf-8?B?dXhwMDc0N3EzTmNnVnM5M3QxRHZrZnBocGwxeVVITVhJM0lwcmdSZGRUbVFq?=
 =?utf-8?B?SUZvNU1CUThlL0dMWWRLTmcrdGJRdkduaFREM2NDVjRoV3UreVBQdlg3dVlX?=
 =?utf-8?B?eDNEUXJOb0R1VUZTYmkvRG85cHVrRHpWOENSR0czOXdMTTVuSklPUHMxUnRa?=
 =?utf-8?B?WmtXUy9rZWErYXJFd1Q5Q1AvQ0tYWEN3RnY1U3FEdHVKdzhBK2dNMHk4UVdF?=
 =?utf-8?B?NmVkV3pVWXFtMEFPcVNSazlnd1hRVmNGRGlGYWpmZ0VoVkV6MSt5eGFhdlV4?=
 =?utf-8?B?UjlqRkdIbTBZYVlabG16T0ZPcmk0bFJKcVVaQXl6cXhBaHJwc05XaE9tYzFl?=
 =?utf-8?B?eWdXT1JYQkZxTGVJZm9jNkhueDFIcUJZcTNBUXlQVXhpblRRWEUyRDh6dm5G?=
 =?utf-8?B?ZFkwNmRqS0x2djlzamM0cGVtRGUwS2xnL1M5SkxyRktKZ1JsaXZOZ2ZocWpv?=
 =?utf-8?B?dE9CREhueWFwVGR5WUZuTndVY3p4c1BkOGY4YzhxMGdEUGVCV0pGQWtWa2hM?=
 =?utf-8?B?RDhhSktNeTBnWGcwanFPK01HdkRJanFyU3hTOHB0SWlocFZoOWdDaWFkUU05?=
 =?utf-8?B?TzdFSFlpZ3hIWG9VTlIrYnppZjh4VHM5WEdFMjJsa2ZoaDFtRHF6bEtGemt0?=
 =?utf-8?B?eVBZSDQvZUR4WTRjWkEwYjF0cE1xQllubzlaNW5UQlljbmlBK292Y0szUVNY?=
 =?utf-8?B?bVFRdEtQRTcwWHhsQTZybExHVjJ1N1llYXpwd09uZTRGcnBaZ0JKWWZYRVdp?=
 =?utf-8?B?clNmV01ET2pmY094bW9xOXRqdVV3SlZPRnZld210K25DTTRRYTJxNkF0UzFU?=
 =?utf-8?B?bUI4WUhienFEYS9qeFcyRmxoWlFNNVBmeUdIMlRXZ2dYT0RnY1ZLV0hPRXhj?=
 =?utf-8?B?ZFh5ZmdCTmxXcHB0eE1ucUlrbTZZQmkvYTVxbHVHNTdsbGxlb3c4b01OSXZx?=
 =?utf-8?B?Qmw2Z1B4NitiN0NJRWQ2N2dRbW4wbmVxdk9HRXppc0FMYVM0SGdhRjhlQ2Y3?=
 =?utf-8?B?VTZYN21PMjVqNTZlVnpBbjBMVUhrM2dPWE1sTFlhTUNLdUJOV0cxcFVGZkdu?=
 =?utf-8?B?N2F6bThaaUdmaWJWQ2dDbUF3VHNPbFlRUWt1UkRaeTdQZVB3MmhXL1VMcFFp?=
 =?utf-8?B?NFlWRm4yNVdrblp4Rk9mODhnbkFtUHdVMEowa3dqUUppOGdRdi9LbDhkMlJX?=
 =?utf-8?B?dzlrejlBMTVCWDM2YVM3K1JFaVBZbENGRjRYejdpanlWWUJXU1ppczl3Rklh?=
 =?utf-8?B?K01QTVNYbzc1K2JUeDAwdlhhaHBJZHlmRzU4YjFQa1NIaDlaL0ErUGQrRFVj?=
 =?utf-8?B?SE9lbkNaVUk5NXpCK3V4bFVKMGtqN3dZY3hxRFpwYWorOXM3dzM3SlJYMEhk?=
 =?utf-8?B?c2swamQxcXRMZTAvN3hUaXY3alFFSTJkMlk3RWx0YXRiODVxZ3FGUT09?=
Content-ID: <C0A55B251E875A419220D60ED80858DE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16162dc5-f8a9-4398-b5fc-08da494d45fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 12:49:06.1507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOj1cxy7CmJPtmc+gsP0zpBkXgHO9htZ+AYkHfkZANkzBZyLuUVkQQI926wJ23nWLlGEEZO0/VkkHi9RpIRtSGlBLZwt8ATVgdL6TeiVSJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_054916_257574_9C2E77CD 
X-CRM114-Status: GOOD (  20.90  )
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

T24gMDgvMDYvMjAyMiAxMzoyMSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiA2LzcvMjIgMTU6MjIsIENvbm9y
IERvb2xleSB3cm90ZToNCj4+IFRoZSB1c2Igb24gaWNpY2xlIGtpdCBpcyBhY3R1YWxseSBjb25m
aWd1cmVkIGZvciBvdGcsIG5vdCBob3N0IG1vZGUuDQo+PiBTd2FwIGl0IG92ZXIuDQo+IA0KPiBU
byBteSB1bmRlcnN0YW5kaW5nIGJvdGggaG9zdCBtb2RlIGFuZCBPVEcgbW9kZSBjb3VsZMKgIGJl
IHN1cHBvcnRlZCBieQ0KPiB0aGUgaGFyZHdhcmUuDQo+IA0KPiBKdW1wZXIgSjE3IG9uDQo+IGh0
dHBzOi8vd3d3Lm1pY3Jvc2VtaS5jb20vaW1hZ2VzLzEwL01pY3Jvc29mdFRlYW1zLWltYWdlJTIw
MS5wbmcuDQo+IFVTQiBkZXZpY2UgbW9kZSBzZWxlY3Rpb24gLSBPcGVuOiBVU0IgY2xpZW50LiBD
bG9zZWQ6IFVTQiBob3N0DQo+IA0KPiBJcyBPVEcgcmVhbGx5IHRoZSBtb3N0IGltcG9ydGFudCBz
Y2VuYXJpbyBmb3IgcnVubmluZyB0aGUgYm9hcmQ/IEkNCj4gcGVyc29uYWxseSB3b3VsZCBwcmVm
ZXIgdG8gcnVuIGl0IGluIGhvc3QgbW9kZSB0byBhZGQgbW9yZSBwZXJpcGhlcmFscy4NCj4gV2hh
dCBpcyBtaXNzaW5nIG9uIHRoZSBkcml2ZXIgc2lkZSB0byBlbmFibGUgaG9zdCBtb2RlPw0KDQpO
b3RoaW5nLiBJJ2xsIGRyb3AgdGhlIHRoZSBwYXRjaCBmb3IgdjIgOikNCg0KPiBDYW4gd2UgZGV0
ZWN0IHRoZSA1IFZvbHQganVtcGVyIHNldHRpbmcgdmlhIEdQSU8/DQoNCkkgaGF2ZSB0byBjaGVj
ayBpZiBhIEdQSU8gY2FuIGJlIHJvdXRlZCB0aGF0IHdheSAmIEknbGwgZ2V0IGJhY2sgdG8geW91
Lg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiANCj4gSGVpbnJpY2gN
Cj4gDQo+Pg0KPj4gRml4ZXM6IDUyOGE1YjFmMjU1NiAoInJpc2N2OiBkdHM6IG1pY3JvY2hpcDog
YWRkIG5ldyBwZXJpcGhlcmFscyB0byBpY2ljbGUga2l0IGRldmljZSB0cmVlIikNCj4+IFNpZ25l
ZC1vZmYtYnk6IENvbm9yIERvb2xleTxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0t
LQ0KPj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbXBmcy1pY2ljbGUta2l0LmR0
cyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9t
cGZzLWljaWNsZS1raXQuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbXBmcy1p
Y2ljbGUta2l0LmR0cw0KPj4gaW5kZXggMDQ0OTgyYTExZGY1Li4xMjFiMDFjODc4NGYgMTAwNjQ0
DQo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWljaWNsZS1raXQu
ZHRzDQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWljaWNsZS1r
aXQuZHRzDQo+PiBAQCAtMTU4LDUgKzE1OCw1IEBAICZzeXNjb250cm9sbGVyIHsNCj4+DQo+PiDC
oCAmdXNiIHsNCj4+IMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOw0KPj4gLcKgwqDCoMKgIGRy
X21vZGUgPSAiaG9zdCI7DQo+PiArwqDCoMKgwqAgZHJfbW9kZSA9ICJvdGciOw0KPj4gwqAgfTsN
Cj4+IC0tIDIuMzYuMQ0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
