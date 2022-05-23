Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGsrIV5fOeqR8nUiu8ZpLtpmS80cGVXfbA3nUIlo6AM=; b=r2qNB7zUHzp03E
	+67GwbUPnnGJauL6k+sk3Tthka7RnvJfLRHu2RZ2eTBu8yO1m+ovTJk/FJOOVLmRRJ2LNmMV9pDIW
	oSmR+wcpMr89dJb38RM55c+pKXlzuuh+mKKpJmu75kl89NFkS/TfoG+xlp45T0RTmKkNmR9RQOmIS
	5q/S0ukwtWq/6+rAwxNsX+1w6kV8qScQJm8avjVgdZbD4kAlvM4cCxrMVpht2N3Mrjb4c3/0xuI/M
	CwkXYqxA1hmwta/yHWAsDHZNlv8ZbFvJPk+XY0JgZgpWSGzksqxe3sla0h04T9sgOpCf6mw/acNNe
	Yewo1pb4euFeQ6u11Xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt74W-0045HR-AU; Mon, 23 May 2022 12:22:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6Sh-003nrK-FY
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 11:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1653306179; x=1684842179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0S8XKkl8UKs6bV6MLDDHiaQHn08mvaQRk2cUNjApeFA=;
 b=q/fyynVAP6LoMqm2ikZnBuJhiaZIOc6reiETNp/1QMVl7q5M/lwBAIs+
 3dtMfoPDx2oSlBMrvUqIJSnUlNE+v+RoDhhCdxdTIqD5c43+o1CyO6ruu
 Vlm2abu3teDw5nozdyMT4hwQuaVAwENwLMSdroIHL21pF9EozwVpBnWO4
 DgwWDtMyJ6b7wez+H3KMFkXDgYKtfNDBI8C8XCUp99VrN9PBnrDkR7O6C
 uyHWAZxbxcuA9G0qdc4MHRFZ5punNhqitIC69tTxvxD3dj1Ea9h70u7A1
 5ryJUsiT1ohPKoGcNwdBJD/eY3GMc5sqH7oxVCbuCVv7RNsXOL/eY36sy Q==;
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="174617515"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 May 2022 04:42:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 23 May 2022 04:42:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 23 May 2022 04:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYeeQ6kZT2X4nUG6tYt/mwku4o4aZbbc4l5bW/Pz9DHEfDBDs3Q00TWUjx6Vprn4TcVgOXgfTBU/lRi04Nl3z5kegsAnZg7kynn6NDCpe90ndKXRlEh42YIw11o82UiJo7P7yJ3cjcJIcecPqPaK7/0it5QT/r3gwmot63dUW+cvRk7biuDgBLPTxDzWQtcHnFiXbm+CI7nD8jIs2oWPlgXAtWHw6cFsHlSybsKnigh8lNDLfANvjYXkAb3noqVP/xUsMJyzZT4257od0hT6T+JIe10AiWJFQjsCBSIaghw8RkUD36KDQ4jZwZ7HddpehY1InWb9obX8BJPlvBPrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S8XKkl8UKs6bV6MLDDHiaQHn08mvaQRk2cUNjApeFA=;
 b=EzgaKtSuU1PsNcg/FA6qYGEtZ1VV9bD0NageRie2C48rOy6A465lqfML/mYyMWqtgmiXeVmiffoad/7hpRwdZpeG+um/0Jg+yGd+o+cX9QUstHy1Q7JSerOg51g4K6DZEDFRa1D7DZSwLISPDKHU/FkCmGd0FNZg+yr7tXWad7pOHWrC5FTXJFbGoZYVCLh4DtMUNtTDpVVNYY3gWmMmEQUTWOmP+yZIw3UDIpwLphKUbJ/4Po776KowtdS4aVYU0+/CPFBDaHZ8ufr1+Hv6JIhZv/BlnLt9PPJoAcvEUyC9DFAmF6XSfRyOxjgC9LlBPC0BKYD/rhBTAYB1uLXvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8XKkl8UKs6bV6MLDDHiaQHn08mvaQRk2cUNjApeFA=;
 b=Rm65FP0YV5CHtumKBNEhOb2L7UNuXRBgf2h0i7ao18VdpnWJpYUNEfmvidLXR+4USjzyp22qSD9QcqMQ4Tmut/miWVNPkD2dwJE1Xx1it4/rdvaxkrXKCP7ZVV6KMAxjsk458+B7osmZhFtrrNTAQFx4FHAuuEJtV4G6Zg2NZdg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1889.namprd11.prod.outlook.com (2603:10b6:404:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Mon, 23 May
 2022 11:42:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 11:42:54 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
 <Cyril.Jean@microchip.com>
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Topic: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Index: AQHYYG7KcHM3Zb8ggE+yYwRhcaPSb60sczEA
Date: Mon, 23 May 2022 11:42:53 +0000
Message-ID: <875112a6-7328-a40d-bc78-bff4e7d14aa0@microchip.com>
References: <20220505105525.3881259-1-conor.dooley@microchip.com>
 <20220505105525.3881259-2-conor.dooley@microchip.com>
In-Reply-To: <20220505105525.3881259-2-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e43b9813-010e-49a5-36ab-08da3cb15fce
x-ms-traffictypediagnostic: BN6PR11MB1889:EE_
x-microsoft-antispam-prvs: <BN6PR11MB188975AAAAE6060649B842AD98D49@BN6PR11MB1889.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xLup5+vZfPp0GQ8wVC/wN3RitFJYh+rNPRcUWKbRhEKRphyMDMnBTfkhpa69i80j+xiTggiCCR0aSO1zkzm2YhEoSPWWam5NMfrxng7FLkgF0SDb5emmpPbRml+Qk5WiqikDlOO47WNvD7P2MqcvCaOzdpIGgfyoF+6RzDUHJ1YC2Fpoj4Fs5NYwPNMTr90UY2C2K++EZlAFxVF7M5rE4S7BQ0St5O+9ogzGUtK+IEQrOxUDpRPMhBnLGaqE/QKlS8PNrKopvfQvXljoEkIB3qSFpC9fskjn0Xy7INfF2HMYqtM7M9kGrvepD+VcGEUkkR/bwVi1wIPqUJcv2I9Yyy5srQkloCM0g7vdEAPRhdDXrbzrsddHJFQZMjtlImgB84Rwnw6gQMP2y9T8KN0PMacguwymlsXjUrvF6/oTwpGN2uuVu0LTUuYtaRcC/RNAIxgE0t8Kb6FXdEJUaHOW8DYRcgQ1AuC5LTenDAD6IIfD9HaVrxEaM6XmsicfX/yUYNJBFfgKwSCRauksmnvzksOcBrHjS4Mb6aUaeo4PlWp22cw0YedraMqAn6CXTBiXOcXx9eSYo4D6B6paYLmFrPbNvWL2PjYcHrnpnJ54E3bWukP0L+e8KIBDJ1MJhZavVv79P830xZ0Afe7IpHSv3Xz4VkGwBSqJCVvjcKTJI6cAci3nmTUHxy7GDSs39/XpEU04pXuS6awq+rbPcZXHOQbeH3WgZMdTFFi+TughmjHcxD6dzE8FcG5Y+0k9KYRALOtZB902vadtMBU8exhHag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(64756008)(54906003)(6512007)(2616005)(26005)(66946007)(66446008)(76116006)(66476007)(91956017)(66556008)(186003)(107886003)(8676002)(4326008)(31686004)(53546011)(36756003)(71200400001)(38100700002)(83380400001)(86362001)(5660300002)(38070700005)(6506007)(8936002)(316002)(508600001)(122000001)(2906002)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1gyRDdNOENubkZqT1Fvek02TmI0WEtleGNZYkhQaFR0S1JFVWFPMDhQQVRE?=
 =?utf-8?B?YUJJdFFuVmpRTEVBYjNiNHBmeUlsZW11Y2lodnJzbnY5ckRqODczVVNpVTBZ?=
 =?utf-8?B?TWNweFA3OVdZUkRIWnJSZm1XRW1LVVF3Z3JFM2JWMnRFNTZseW5vZHcrUmdF?=
 =?utf-8?B?SHQzTldtNWsyK3JlZmExRjk4VzhUMXg2eWhnSWUraHAwRTl0Y1NqcWtVVHpH?=
 =?utf-8?B?L2pnMFBuV0NWaTZIQWQ0cU4wNDc0ZTIyS2FUZ20ySGNvYzdvVWRrRENwNTNJ?=
 =?utf-8?B?aURMQUZGZi9mdHZTWm9BbnJHZnZHWngxMmxFRU9mTGpBa21MWG1kZUVrOFJS?=
 =?utf-8?B?UWV6YzBIZlRYZjMyWDAzdVN3Z0ovYmtvRnhKcmRtbWlkOWNkZWRuZUhWbkE2?=
 =?utf-8?B?L2FRc3VPQnVObE40NGtOVWlXWFNidURrMU5hazZ5c1R4MU9MTWFSNW05bDFp?=
 =?utf-8?B?ZTlvbEhtZGlFSmF5dXpLblc5eTV0aWZpK3EzR1NlVW00RVh2NG4zWnczVytn?=
 =?utf-8?B?ZFZhSjE4bzc5bWtvcm9sNlMwUlZGaUFBcjFxU3g3eVlIMXlpRjY0b0QzWFd2?=
 =?utf-8?B?bGJqRjhPTm1GWlQ5WFcxUEdlM21mY25GT0ZlVVZkejM2NVluby9hR2pVWnFl?=
 =?utf-8?B?Z0RyaEJXSHg3b2R2RUJuRDBUUFR6OFMraUVNVEc3SUtqY3N6dFovYmlIcGFv?=
 =?utf-8?B?RGRrc2NDQXFLQWR5U1Q4NVZPYkNzVHIzM3QzOCtmYmU5QzJBWFBySXRiTFVs?=
 =?utf-8?B?TWVEWWtKNXhGcFNUcHlDc28zZ3FOMU5mZHgvT1MyTFdFNkxjbzRvNVgxbzFG?=
 =?utf-8?B?WTIrc2Rua010blZZOTREcjRUMUMvQ1N5TnpyT0FEWWFlUjg5d3ZwVzVRTlFq?=
 =?utf-8?B?OU1oeWtuQ0RjdzRSVlVteXQvSHM3TzlsWFdpRU5rRkZBMzRMY3NzNFpoemhJ?=
 =?utf-8?B?VlRZdXdDcm5lNGpYMUNQNDhvNkZrVzZOeDg5Q2o4Y1cxbk9oV2hqRFoyS1RR?=
 =?utf-8?B?c0lCYnpIUUNtZGQxN1JuNFBVNTJrTVlubmYrdTV4bzIxY2paeDExSEo3WFp3?=
 =?utf-8?B?SWRvZmlPaG55c1BuS2FVbXF2cjQrOTN5Zk1ZRUF3UkVPUFJqQ21FdnpZdlU2?=
 =?utf-8?B?QUFGWjVBNVc5cXdNaTU0Z2xpSGVrOGFaVW1rMjdFK0xVODJjTnUzOGZCV3RS?=
 =?utf-8?B?Z25kcCtlZVZFd2ZyeTU2bzZiQ1BVdkppdGRRTXpjZjJKclh2Y3IyUHVFWS9J?=
 =?utf-8?B?WnI3NXFUMVpUdXlaeDJxKzA0dVgzZWo5NElFaXBESUM2ZXA1MHF1OGhSWCtt?=
 =?utf-8?B?M0dneVo0QmtUcEVKMk5WRlJ0WnFRYlNmSmdwNXAyRVJBcVpsNmkvaDF2eU5z?=
 =?utf-8?B?dE4zUy9Rbnh3cVE0bXJGMVEwRmFMZWhudVRWUmlNNW5VcEFjVEhpZjlpeHZ0?=
 =?utf-8?B?cEd3TWhiU1hRU2MvSkJzTzdJaTEzd1VHcnljaUIyeG1iZjFRajg5OGdISmFm?=
 =?utf-8?B?N0pTM3NwQmZDc1duYjhmNWF5aGgyTEVDdy9XSGFLTXl6WERBMXJMMUhraDhN?=
 =?utf-8?B?SmFQRGloNHJnMFo5UDBEUzl1UUtUWktKNy9YbnYzckdlSGpOZk1kSGpkbXhH?=
 =?utf-8?B?Ujk0VTh4YTd6OFRQcjVJY1NuUlhoeHlFKzRtSkF5cEJldzVPelpnMzJ0eFQv?=
 =?utf-8?B?UTV4TFFTMldqSzhCY0ZqNHpuRGZpZThKbkNYU3hHclFncmc2NjhjQ2pUY3Rr?=
 =?utf-8?B?Ny9meElEYjhTUWdMM09IdnQrMHlacmE5YllEQjNwMHFiUjlPZmZVd1ZBdWRj?=
 =?utf-8?B?eUtHVFJNK3A4eWtlVkR4UzlOWXg5SUptRHFVNjNnZlJVWWdCbXN6TUZFaE9O?=
 =?utf-8?B?NnV2UWJtQzYyeUo1SE0yV1FSZ05kNXlzYTRPMDM5dEQrRStrY3pPQXVTL3hL?=
 =?utf-8?B?UGFocm9KY0ZIdzc5cE5CSDFHRTE1endrWVdtMmpMMEVEN1JkQUxhcmNkaGNt?=
 =?utf-8?B?KzhURUV5QWV1b2szKzJIWlNOUUkveDl2UmdTT2NOdWtFdEpoOWNzVFMxa3hD?=
 =?utf-8?B?TEQwYmRabTlvdVpkbUN3ck8zT0gwY3Q1Tkkxd1Y0Qjc0SWw3dnZZNS9GOW1C?=
 =?utf-8?B?U2NVMnR3MTRQRzJsM0RVSklpNkRqelpGbWJiYkZXV1Nac2dxcDZyQUlZSzJB?=
 =?utf-8?B?VG4xcGJsb04zTnN0amE1R2xPOTJBY211ZTh5dEs0L1BzYTVIQ0lBM1J4ZURo?=
 =?utf-8?B?Q09LeGZxSFp5N215Mkc4WlVVM3NleVBjS2pKQXEzSjNPV2JPSlMxM2JIWkx4?=
 =?utf-8?B?eXBOU3ZNRmY4c3ZMUXhaWkNyUUFzcHpZTUFxamlZajFvN1VMY2NHQT09?=
Content-ID: <AC7CA62591647B41934F4FA5DC7D997F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43b9813-010e-49a5-36ab-08da3cb15fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 11:42:54.0105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljicaw0lbIr4y8fw57gSxBukH8kUvmalPZbAINKlQXtRppKV2eH/iZbmGh2a+TeFv8UlDUe4oUDJMwMAihA/7G+7tLDQje/Bm60fnmWPnTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_044259_849910_7842EF98 
X-CRM114-Status: GOOD (  16.85  )
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

On 05/05/2022 11:55, Conor Dooley wrote:
> Hardware random, PCI and clock drivers for the PolarFire SoC have been
> upstreamed but are not covered by the MAINTAINERS entry, so add them.
> Daire is the author of the clock & PCI drivers, so add him as a
> maintainer in place of Lewis.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Hey Palmer,
I know youre busy etc but just a reminder :)
Thanks,
Conor.

> ---
>   MAINTAINERS | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..d7602658b0a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16939,12 +16939,15 @@ N:	riscv
>   K:	riscv
>   
>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
> -M:	Lewis Hanly <lewis.hanly@microchip.com>
>   M:	Conor Dooley <conor.dooley@microchip.com>
> +M:	Daire McNamara <daire.mcnamara@microchip.com>
>   L:	linux-riscv@lists.infradead.org
>   S:	Supported
>   F:	arch/riscv/boot/dts/microchip/
> +F:	drivers/char/hw_random/mpfs-rng.c
> +F:	drivers/clk/microchip/clk-mpfs.c
>   F:	drivers/mailbox/mailbox-mpfs.c
> +F:	drivers/pci/controller/pcie-microchip-host.c
>   F:	drivers/soc/microchip/
>   F:	include/soc/microchip/mpfs.h
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
