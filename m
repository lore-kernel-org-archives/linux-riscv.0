Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7635C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4Ll+RMTls0424FXyhli6rMRmCisBm5XI0ZT9Q7Ytoc=; b=KZ7+tQj6BMoei4
	APtNdRSFCDQEjXp/gEOjvqaCdonxu3byZ4Nc/gBKaXaJy1JPPQtV6r864qZQWWp320o36CdwWiLXP
	/ojspyaY8qHGwNF55OijYOrVfitWV4KJYvEjDLZCtqovUYjghIQOoGTTknGb4U69ZVq0nThKd51Y3
	cTOK0xeT1F0iyGKGgCmkxwgvzRwGNqcI6smB7SaVtdY0LR6Ze8xKqD0GmRAowRFm6EaUFs+tXDSIg
	Zkh6orMYK0XE124neS+KoFwXnG1MhE03ilUmwbNCYIHRn8AmmyJHe0gHpzFktLMYOr+Lp2fPuXDFw
	B23rzapflVarBIOEi7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJh-00HXKC-Lb; Thu, 08 Sep 2022 06:47:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJd-00HXHU-WA
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619630; x=1694155630;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZjqtsF450Qdg9iGW/mqEISK33RhzoHVIR8+aRiid/iE=;
  b=RW38c+nrhUYr8gfROSpMdjnnp+SbImSwHXB3hdCz3hSQEaMgu0d2W/Lf
   RF8zuly8581AXOsmCyxJpZ/BsYRnm2h3j5XGzRCnZtJpwvdedujlhKjHq
   Cjb+AGL5o0a25ja26GQRuivM640Ux3AGSGdsMagcr8IA+6xuVEH+8sjWe
   diLxxGWNiaJqDIclUfy6NFlJm/IpBvwSQlAG2a7fHI/xE6KIzMpMdLcoW
   toNCjKI4pQTvTSozigK2jixsuxSSKZcPeS6hRmnFnA7p8zGkZw1EY5yxl
   f1UVwy9VaOJmoaqOzZjpjmnhPoHoD3AO2Hj6eoQHZ8txhPdgbQbT6TOzT
   g==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="179519178"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:47:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:47:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7Q7c6HimiwUQ2215V3pyk6U3ixQqA6A2ylgyCePB21JfiGgqFqnzzms6yrVPd5A3snxWZBJx8zi4cWdtg/8SzgHBiOpp0q3p14zDDI1XW82x1hq7H0otMDclZ/DG0T/0zUrCWZqEtQ37AfpNK4zXXErlsZ/aXFe8PrMEmNZtaTpgRDszu3VfvTzd8pX7w7seZvshg9FfILThXABrcY/j+Z+c0Pf6M43bktEinbi6np1bHToNK/ig3h0Nv5PbhH7VaRqUah27JAas237bJFyNFA09/Q5eQfqwzj2Rn9q2nPCzije/24MxZ9L/0vBmez+wECvXPfkLavOwOhV8ai28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjqtsF450Qdg9iGW/mqEISK33RhzoHVIR8+aRiid/iE=;
 b=foSIx1PyWlHXIiDQy5jD/WWS2YdAPogHK9RTcRitIww/HHXRPB16AwUc4MTuvDyfjkAhZ7g1s4SfpraAdY+o4yOdhieHWdhaZXJd10/XVwPJUU6qDX4FAGBQ0b/BVTKnpOstVFdrdZoRqLnIOmyVmzKelfo62mh56CAQ5AmdYBEd1fIvKGbKAZPC2CwUW3d6dXeL9cyM7YOVOsupRsXtgJibRnGc7/cb5HNkUlwgEc/j90WILvyMPvRUHVGrq5McV2Y01vwTzOSQAzt8RJoa4FwjSVlDu6JLtYfqCQBvWFfQm8Qv2+NlJGgQBIXEumn5aidcN6apYae4Yfhk04XjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjqtsF450Qdg9iGW/mqEISK33RhzoHVIR8+aRiid/iE=;
 b=O6DU3pUIjYW7scwFevmrG1t7xJ2H9FUO6n8wq3+nL5iW4TvMOZvbkORAqvQQMPqJJeza1fpP5WaRC/egJ/MHq8ZcO0dtQmvwi3sEogFAXkdpq7UsiJziwPzDAXIXuSIC5QQGVQVEBH9nO4yWg629C1Ltk885vi8bbd8N73gyWzk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:47:04 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:47:04 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 10/13] clk: microchip: mpfs: delete 2 line
 mpfs_clk_register_foo()
Thread-Topic: [PATCH v4 10/13] clk: microchip: mpfs: delete 2 line
 mpfs_clk_register_foo()
Thread-Index: AQHYw07OWw/as+GhH0+GX4/bCdS+hg==
Date: Thu, 8 Sep 2022 06:47:04 +0000
Message-ID: <ac348009-97bd-919c-3b1a-b12c4d7d5153@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-10-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-10-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edbd3699-bfb6-4280-67f6-08da9165f0e7
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: in80HUn4Xwx9Gbag5MpHrxACBv0WQeH45vxemAH7GIkKOfo9mRzjTIfZnvFHjLMg4Oy0Oe2lpBG/C/IugPsc+jafvQkOg488YIX28wtgNJuXYsJsv0Zv8Mr1ciJjt7B3OKzq2S0blKVoMhi7feM/LAXVqt6La1QLLqp/bRkP5+J0d2kGYGo1S39ocgviT8u1/L128feJbvchLOvJh99dK9v9x9wqCCb0Mxlq+gYv8fpsKV8f26BtDmQNZ4/E14T4X2JoW0NscMIy3OJ9UHbxGV5+warKB43VY71wSvg/ENinlakFeDmH17KAKEsqd+nMITWHvRMfEuhyclr5hZhEgnUoPhSfgUsE/qEugSqyfd7TWXrEBR4P8VMxVzDsQzErFkD7/huVxvYGJ12vUIdpWZqcB/Y6KNqwP5DtT5p60MTCcptzqFSZO1zVnsEiwubM5/5bDzfUdE15HSv8rOR9X0k4J51vAzsO+EK7vJ9O006U+ezCsnYF/oi/saWQqAnwh8Hq5IINtmZBwk2MupUi3RKoYx8+pQpwK2nJI84ZsTaSUXERa/iDvtf1j/UVNJQN5F+DPbJIubCl4v3x/gkHuE3zE5c8yhsjYwbIadr3PLlqRrARUs9nJBomp9J7sOx0Du6a9/I9r8hQ45k535Qg/7u8qD4f8tAnVMuBXx0wZzfN+KZlKmaFC8NSJw+P3VATq5j+kFrZ2YaoMYwJobg5IDoJrKaxLt/nRiaq1mBhUpulfnl3FMZ04ZL+uOvE2x939NnNCHvnw5jJ4poLSUF5Mu50tdumLh8HR28dGrzhb2Ye2ZFe8TnvqhHIoFK9K4vW4lqlMpcgmMCrXArQn5+WEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z21wZXZDdDFUL2ZpWnh3MkJDZzJnTDhWcVp1eEVlM04vSnpod283Q0FCbjRV?=
 =?utf-8?B?bXRvQWV3aVZ3bmQ3Ym1YNVRLdWpVdFEzTzFvRnVtOHVCSVlQcFZxOGNwVjBW?=
 =?utf-8?B?dnk4YXN5ZXhuTWN2ZFVkUVhlN3JVZ3Myd21sSXpDelcydXBldWd2L0hscnR0?=
 =?utf-8?B?RFZleFk3QVR1UVlKYUdxSzZwUGF2VTh6ZWwrUWFFcWRKWjdlbFF1ZjgyUU9p?=
 =?utf-8?B?VDN0SmpJaGlGZHBqM3NaeWlCUkYvRy9sYWFwbnM3endPeUpGMzV4TWh6aDdS?=
 =?utf-8?B?NGFqdWtvYmFyZzU1M0pmbVFsak5nQkFpZ1FpZEx6MTlYQTZldm94RGVZQ2J0?=
 =?utf-8?B?RExvSTNZZm8xb0pmVVhmVnZUTklsYzZMODZMc1A3bkR4MWN1YUwyODBYZksx?=
 =?utf-8?B?QW5CN0FVeWFXMHIraERCeFlsZTM4ZjNtT1lpUlIwY2xZcUMrNHlFdWFrK3Na?=
 =?utf-8?B?UjlUcVdSellNeWxOOGRWSmVvSHY4KzBSdjNkVi9odDJNUjA1dkJnNTJwS2Nn?=
 =?utf-8?B?eXZuVTd3VmkxOVFHQWptM2Z3TEY0blVoSkd3WjFhRTdjYXUzSlN2QWpEU014?=
 =?utf-8?B?Wmo4NksvWXk3NVd2ZWxvODQzSFJwaXNJWnhRdElNaTFCeWFXOWwwc21GSFFG?=
 =?utf-8?B?aW1uNEdMSXoxSXAra1hBd2M3eWVldFdwR3BYNzJCNm1nS3FrOFVoZ0lRRlZm?=
 =?utf-8?B?NXRnNU8wSnRPM3pWeDY2S1F6NmtKR2c0VW5WblAwaVI2OXJWMTRpbGZGMWlx?=
 =?utf-8?B?ZjZheTV5UkJHcUE1djh3eWJuNHhpN0pQbk5SbXczWFlCNDE3R0J1SzBTWUdE?=
 =?utf-8?B?ZSt0eStQYWE4ZnJ6ckpyZGNUQmt4V2tNZUhRazBmOS9TZVpLSWhNODQ2eUk4?=
 =?utf-8?B?elB6dUlLY1krUmc4T0hmSXNIV0J3eXBKd3NuZFBWNFJCYkJlZHpLL3RiTWU2?=
 =?utf-8?B?eHQ4WFViN1AxcWVEUnBXVGJCMkNuT0Y3L0Ntd0JaeEtWajNiQ0pjeTRDT243?=
 =?utf-8?B?Y2VlZGUyb1JiTmlESnZaS3BJWDhjd3VKOXZva3dXVWkycFhkYTFSQTBCZlEx?=
 =?utf-8?B?SDY0bUxvd0dkbHptNGhWT212QWlwYnVsZGdleFZ2VWdDNUZmRzdNN1pVZmJG?=
 =?utf-8?B?bSszTGcva3JGZUFZajU1NzRvcWJnY2s0T2dIQ1RaazJXbEFMcVg1bUIrYk1V?=
 =?utf-8?B?YjByN0dOa1YwMDZ5OVVKZzNseVA1SHd0eUNZdUZmRHExa1UzT1E4NFFGNmFk?=
 =?utf-8?B?QTlENlFzQTEvNC9ZbVpReGdJSzFXb3RhYlovZmpvVmdrdzJZQk9BMjZOdTVk?=
 =?utf-8?B?TklOSDdHQUtuNDQ0eUVuVmRsdlEyejFVVStxWWh0Q2JwaE1sWjE5SUlySkZB?=
 =?utf-8?B?ZHNnMVhYVTlYODJGMENob1VtVmQ0OCtoR2pXWTVXTEw5RkRDcUhkUVk3T3pL?=
 =?utf-8?B?bmVKeFREcnE3TFFOb2dRZVpRSUpnQUp1WU5QaS8wUml1ZW00bSt2WDVBbUlH?=
 =?utf-8?B?ZUJRYTBCaTJQVDFxY05jY2ZlRlFFRk1JMHk3VjVoQnFkUkZIclRHQ1JPaTNP?=
 =?utf-8?B?SU1NRVJBSlF5Y2p2cmtQVGFIa2xkU2JzVTZlSDQyWEFkcE5QZEdBOWk5QlZL?=
 =?utf-8?B?N1dvdGFJejlIUVFTQWNrOWRmNVVvek1UOXdWcmRlUEVzYlpzY2tCVFBVT0I3?=
 =?utf-8?B?ZnRRWDZYb1dWWkYzS2dFejN4RkZEODJ4b1JQRW43MkR0TkwyRWJmSlNYMWVB?=
 =?utf-8?B?RjhaK0xuMnhGcmFLUldsV0xCcEU0S0w5RUVvWU84S3VudXo2bVJMaG40M05Z?=
 =?utf-8?B?OWhZdDFvZVVMNUhSUFN4K0htbXU2TVU3Y29VLzN4OEtwQ2lCcCsxYkM5SWYy?=
 =?utf-8?B?R1dLY29VSXMycWhlK2o4dkZILy95cGNMYUx2YTVQN0xnRUdXK3I1NUo2T29o?=
 =?utf-8?B?VjFvQ1NTWlZCb2dnR0NqTFVSY0hoT0orcWs2MVpFTVE1WWJaZXlXR2hldlRy?=
 =?utf-8?B?djRaa0Rld1cvWGRod0dZZ0R2RTZvZXRHOFB2cFdwcmxVOXBKRWZqTHpJdFJM?=
 =?utf-8?B?UWdaSithWWdhcXJWTlg2M1o3c3RRbDRvSEJzY0p0VWNtRWhYc3ZWRXYvUWtR?=
 =?utf-8?B?TkNrcUZ0LzRZYUs0WVV3cnFPVTRDZ2x3dHBmTnFrNmJqVGxMYTBhcGZkaXRr?=
 =?utf-8?B?eVE9PQ==?=
Content-ID: <37BDF25920C0A34AA2FA4804A32B752D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbd3699-bfb6-4280-67f6-08da9165f0e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:47:04.5299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjdGMbBlE+k7yI/jJMf+wuTob01Od/m/Wuk5pqCGqGgBFDqz28OsXAaiVWrJJTBJoQ4hqcWg85ofedMAhujKM40j0k7H4vNwiTEdA2p3WTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234710_097667_F27C65A2 
X-CRM114-Status: GOOD (  18.50  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> The register functions are now comprised of only a single operation
> each and no longer add anything to the driver. Delete them.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 33 ++++++--------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 60e1e82912fe..538cb589d232 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -203,14 +203,6 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_clks[] = {
>  		MSSPLL_FBDIV_WIDTH, 0, REG_MSSPLL_SSCG_2_CR),
>  };
>  
> -static int mpfs_clk_register_msspll(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hw,
> -				    void __iomem *base)
> -{
> -	msspll_hw->base = base;
> -
> -	return devm_clk_hw_register(dev, &msspll_hw->hw);
> -}
> -
>  static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
>  				     unsigned int num_clks, struct mpfs_clock_data *data)
>  {
> @@ -220,7 +212,8 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
>  
> -		ret = mpfs_clk_register_msspll(dev, msspll_hw, data->msspll_base);
> +		msspll_hw->base = data->msspll_base;
> +		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
>  					     CLK_MSSPLL);
> @@ -314,14 +307,6 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  	}
>  };
>  
> -static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
> -				 void __iomem *base)
> -{
> -	cfg_hw->cfg.reg = base + cfg_hw->reg_offset;
> -
> -	return devm_clk_hw_register(dev, &cfg_hw->hw);
> -}
> -
>  static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
>  				  unsigned int num_clks, struct mpfs_clock_data *data)
>  {
> @@ -331,7 +316,8 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
>  
> -		ret = mpfs_clk_register_cfg(dev, cfg_hw, data->base);
> +		cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
> +		ret = devm_clk_hw_register(dev, &cfg_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     cfg_hw->id);
> @@ -454,14 +440,6 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>  	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
>  };
>  
> -static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_clock *periph_hw,
> -				    void __iomem *base)
> -{
> -	periph_hw->periph.reg = base + REG_SUBBLK_CLOCK_CR;
> -
> -	return devm_clk_hw_register(dev, &periph_hw->hw);
> -}
> -
>  static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
>  				     int num_clks, struct mpfs_clock_data *data)
>  {
> @@ -471,7 +449,8 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
>  
> -		ret = mpfs_clk_register_periph(dev, periph_hw, data->base);
> +		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
> +		ret = devm_clk_hw_register(dev, &periph_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     periph_hw->id);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
