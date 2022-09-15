Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577A7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 21:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWvD+ROYdHZ9yfOF83879j7gJPEeI/JwXD7coIRscXg=; b=S0xQOnBK9PwPbJ
	LI/8MFffYLNNFl0WempbCT9GWJsM2C1VceyFNLR9q4M7DsJ6GSsyq82wz7SutLlA+rrp88BqafAFu
	ekXiw3vPo5+zIH+cOUUfeySPlsKr6OUs4LAw3y04SV6xFCNnpuXagzfWMFr7yglCPtCQeMZKaN8XF
	o7iWxk4CLkEzPIOeLcrX4cRAlgPygiRR1zcRPaFXTZk66qojoxVzbj4MLvEs7F3neeIfkAWZjFS2Y
	zsO+RYqZd2hsiQF6FWAEWw093dr7ezvWvm5FwQpHXiIp7HeKVIUZ3r4vCF19Xf1EfI335lBRWK7Dc
	xjhoPoz3e8MoN+7s5unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwqx-000Z9c-Id; Thu, 15 Sep 2022 21:56:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwqu-000Z5b-Gk
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 21:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663279016; x=1694815016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KnUFgZSjAsCsvnLpCcCQ1eJWCsyfI/CVfOufUY86Rpc=;
  b=OjYrd3vF/boT3cWerIR7T4obfbf5EEauoZH2RQru6oTlLa+ZgekpOMde
   rZjjbHAhOlQfr98qQ9WeKWIw9QMA+myB8vs6nozMjRapjf1F+YTJZoeXO
   qt9tXxqOLazkzSXn567yYNHuFdj6/WXs4nRUK6J/49K4QB+RO+r9+R3T5
   y70/vkv/EHqjeyh6lI1N2ZfxU9sPEnsPNqEzqDWBpKiUFmyW1Lil7z5kq
   iZIXz3KWfKfy2ai9Bw5JWj5t68Mp3PbY9pGSi6RhbcAH60OnHrrDdHQ/t
   E3EZGzAcW/MhqZg2HWQOvRgaimoeX4RdSHn4K3hNYsFX6qZtYrhThw2Ps
   w==;
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="191071851"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 14:56:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 14:56:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 14:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5gVHt/TK1wfDN4HhT8jP4+AGSjqbnwdmC2bjr10kYUabr7PiQP0L5GA1y6qqoKHzvlsXdOBfwNZyvxPMlRUHJecHaZ0pe+aNk6wCI0A+4lTTPO+UziQTyEFY6N6i8dG5OnQdQYdT++LVv6Xu40yAmQF+aCDEDlLTkTdRiLXSrbh3kqNQGoZhkpstsGfrkDxoDXzjeCzziebNqqZg6fRviOVRj7ngoitJpIFHgR+6X5UXF/FmxYl89tpeCRoEAmqBezly5aHkAJ2Rz4MFbN253jsTHl5oxbZzCXDWstLk8wnLFCYEr5/MCqW2G9ZjpGbBB9D19vTb5jXhxs0gZ+1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnUFgZSjAsCsvnLpCcCQ1eJWCsyfI/CVfOufUY86Rpc=;
 b=FstZ03gbiz2uqbAu2lWpX3RrmusCd3zcGKfb02Kln0Gfk77D0ahIxjsXIVofdAcOoe19ISm+8aApXKFPh30PD9xZV6GK3o946osJrP9IkVUkEkYoRg7f6iFeSSyIzpuu4ndw7Y9l+fl1FelVJlPBZpjl6o4C2SwmwfkpkO20ysWGFwTluXIzwUi16DxpPjsJZKMkVX5fl7P4XhhnHEDo7VUuJS1us28IZa3mJ5YE5dLegGOmxoFSH14uyQClsZN0RqDWxUjIjwAzhRGOEQ6btH6n4nHn/+AXpQuZYbAJFFAKHtI49OTQBUsoB/JXuHza/a5Xwl2HtfPxMkECIRAtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnUFgZSjAsCsvnLpCcCQ1eJWCsyfI/CVfOufUY86Rpc=;
 b=lDMZUslBNdEjLeLaxgo+MBmDugmMnFpA8vnzIT3IVuO8BkS8xm4IAqaAUiz+0yhlyW+UZ6Bp/C8HfWSv0qv6qVsVFVCpUJt3Hl0OSNmesIJqnCwY/OqUMc+mAcCq93xUrqRnGyt+3lsd2meXIfmXVvme2yTyHVU0N9urLimRtOk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 21:56:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 21:56:51 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <geert+renesas@glider.be>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <heiko@sntech.de>, <atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
Thread-Topic: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for
 Renesas RZ/Five SMARC EVK
Thread-Index: AQHYyS+CXmAo8qhj2U6alOFiZ8SwGK3hCb+A
Date: Thu, 15 Sep 2022 21:56:51 +0000
Message-ID: <ce1bb9c5-c1e3-b6ff-ec8f-c9ae1f0bf3b4@microchip.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|IA1PR11MB6147:EE_
x-ms-office365-filtering-correlation-id: e44c2180-59de-49ae-2574-08da97653253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ym5kAgzaqBzMVE5aD/0ut+7e4Am9EwcVeKeB18HOW/Dknz923EqnXsE7qmha5Rqd5OxdDCSBmWMLSg3kOhTaWuSBkSpFYJMRZtFBWxTfD379V7+2JWb37vgfifvf0jmVfo24UbT0KiJcWxBqyJM7LUz1owWpqFEEifGPX+M6iRb3mhYxL++MM2K2t+MwJWK+t1GSfMTb71WzqENkxMTlRn0zCbSE90pa7DuVxvDpnaZRegGknSzGzHb8AolxcYpHMq7BBUzJm7tPzqbzA4Yuxyk1VBBBUTJ12M7tYOGvVlE9nr8CmGZwKyJMZ+Jq+lcrCR2gvmvNbx0pqAUqm/liSuDypS6RWOZ/ln8VQTgis3QrMSTWzRMgc+d09VEc3eKHnCBjybx9PunBQLR7A/jJ8JzOpDc/6k/PiMk9EpF3JkahpNwmqKj+64SUjsjrgmsSgeJdCHa9KHFkoe5p1RvxA3GpY+fOkWHk/H8sPLhKuOBO+kAMdbxoNuIO/fTx1oobCI9iGddmwqfuojw17pY+O81nEBEj5FFgeYuij/mssKIaNeaXvxq9Uo8S2u5/CgKXoFX6gbwlxsf521o2/oKYwTLMhVsAXmPIiwqrMzoDzODG11FWqXtcir6KEYHe2N3EQdaau7UOvLeNugIZdB25avnoOL5tgSoaUKf0tRuTN+zvq20Tt5vqSGXlxpFWd3bpgAX+8Oq5mtrL2ECFCUKnqBUBYLsHFuHLe2drwKomvLXvtf6rjwM3Z6/6LqV5Czp6t1Pcm4TrOC3Pt0SeW5jy7HeGU2q8GHdQba4FMLDytXUCDaWm4piIh81qTLP4I0uc6MUu0QgQBav79euRpRclJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199015)(71200400001)(122000001)(41300700001)(66556008)(31696002)(4326008)(38100700002)(66446008)(38070700005)(64756008)(91956017)(8936002)(110136005)(8676002)(26005)(31686004)(6506007)(53546011)(86362001)(5660300002)(316002)(83380400001)(6486002)(2906002)(76116006)(66946007)(186003)(478600001)(54906003)(2616005)(6512007)(66476007)(36756003)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUFJS2dyTEd1Y05hVFNUc2trWFg0NFZjbmVxM1Q1MVdsMUlZSDFwUTNTLzJt?=
 =?utf-8?B?NmxIRkladFZXay9kbzdsaXpUeGlHUnY4VjhoaDBiVXphN2xPWGVibnc5RTI4?=
 =?utf-8?B?WWhUUysrV1pHSG1TcDF0NUlheCt6L045R29jcFJGZ2VMamJER2xwdERJaGNp?=
 =?utf-8?B?UUhLRG9QcUx6QVdac05wYWVMWDROaTlEYWlyTWU4TjUvb2ZGVzd2Tnd2WkF0?=
 =?utf-8?B?LzBNODI5OG1palBrMzZyd1FUQit0YlJVSnBLUTQwb28rczFURFg4WHhUZTNL?=
 =?utf-8?B?MGVmOG1tbkkzT1VQQW96VUtJZXpKRVB1akdod2JXbkFiQ2pZaGw0TGc2L2N4?=
 =?utf-8?B?SUtQVXMydDB3Um1WejdUMlNUSFBTSGY4dnY0NDdZYW5ZOTl0Q2N5eGZkMVkv?=
 =?utf-8?B?NXl1ZUhFNlBsTVFwUmUyYXRmUldUWEZEdkxHTlhRWlhvekorZ0RjU3p3OWJa?=
 =?utf-8?B?bG9VN2tUa3g5NjRFcDVGRWtZMXpZS09QOGxuZUlaMC85OUtZUll1NjZCTi9k?=
 =?utf-8?B?MWVJdUhJSTl6NDc1aGNCaFVDUnA5bGM1TjBEWm84MG11elJ2VExnUmFza0dq?=
 =?utf-8?B?aXJMMktFUjZTMWcxYUV3ZTZsNm5HY3VJTEozWjZtNW9URFNDRHhVbzF1S2xF?=
 =?utf-8?B?SXhFSXpEWEFXcnFEOXRjTWdiTlFUN0JyNTExaThRT2p1dHQzVEg2eUFtRWl6?=
 =?utf-8?B?YjAzcEJtRkg2bnZBS0xIT0g3Q2Z5TlhZRldYdGtxQlBZaEJxSHZoT2UySktw?=
 =?utf-8?B?MXgvU2N2K0pjT01kMTNqRGE5MHRKTE81dDZMQ3RpeG01Y0tSMEhoSnFNanVE?=
 =?utf-8?B?RVJGSzB2UFpmdllKQ0FSY0pDQUVMY0hkdjVuZEt6dWg1UWpWYmtxcmlha2U4?=
 =?utf-8?B?dHBsMFBkTlBMcVJRY3pxbE45UUN2M0hkSWlJTFQ2TWdoOGVWdFZ2RHY1VTUw?=
 =?utf-8?B?bkZCWHY1anVYN054MW5ZNnNjUTdkUUhZSHRsUWtJd1luK3VRVGVyMExGNlRu?=
 =?utf-8?B?SitHQUtuV2VBbHNzOHZKR0tlWTZGWFJvdEJYRDgvSWVVTFpraTJuU2liSTJo?=
 =?utf-8?B?aXg5dGxnTnR5Z08yeHlra3FoU3kvT0dNYlhRT1ppQ29xOUFtNnVnL2EvWXBK?=
 =?utf-8?B?SmpLeHB6ZnNjMFV0RkdYNnJEc3E3RVM4SjVrT0NHZzF4TmI1VThCUzh6VDgx?=
 =?utf-8?B?U2hhcFpnRVNHTW8zSE5rTHp3KzFGQnRkZDA4aW1aNldUMkMwZmpZZzB0Tkxy?=
 =?utf-8?B?djA3V2wwZmhMTjFZZTBETjJyUFZMRnN3Q0VPVCtwSlp0N2dvMjN3YUZSdXc4?=
 =?utf-8?B?QzIweEIvWjl1aHFzemdjdnlMdllTUDlQSkpSOEt6MkU1Sml1bWpDZjgzaDRw?=
 =?utf-8?B?b29PMU9SVnFWWlovWUZhTFVDVGdJWitLSHc5UzRVcGFnQ3ExQVBMeFU1bzFN?=
 =?utf-8?B?TWhoMFZUK3BtcE5BRWhOaVM3enhOQTVHMW8vdU9XVDRZWTlLWFhUaTd5UnNi?=
 =?utf-8?B?VXBZMUhuR0pnOGVSYTRnOWN3bjhScE1ob2MxMW1Zc2lJUmJ6Ky8wL0UvU2ha?=
 =?utf-8?B?YVRjd3JvalUybVgzckw4Z3JwcWxmM1JvZEdOSXdCRzBRUysraEpOZGNabmRN?=
 =?utf-8?B?akMvZWY1TjhDcEVlSVhhZXJmKzRrQUNoN1g0a01GNDd5QzU3Y1kyd3ZmL3dh?=
 =?utf-8?B?eWZPRDc4ZzFjdUVTaUpFVUNLcmdmTHBkaER2Zzc5WjJzQ1h6a3dOV2pkbGg0?=
 =?utf-8?B?ZnlIQTMvSlVtYmFNL3BGeFN3MUNyWVg5c0wxZXRrTnpNVGFyS281bEJyeGRT?=
 =?utf-8?B?ekhYY2dWM0FSbWRka1B3VnlXYXNudnRCeVc2ZzdPd2dKdmpSOTlVQnVIRGhW?=
 =?utf-8?B?bk0vbGlENHRKYmpZZlVGU3cxNkx5VUZyTGJjUDJaRml1aVA0bElMcVI2eDU5?=
 =?utf-8?B?eTl0L3VsSWIwaytXWkp1UGlkOXk5eTJzR2xVRkZvUnJ3ZElwWlFCYm5TaXRy?=
 =?utf-8?B?SGR6MVVuMnFReGRiQlVIUTlva0R4ZmdONjdlM2pwWjY1UmhnMzVKRjU5akM2?=
 =?utf-8?B?bXZwYkY1b0hrcXZ3Z3BTR3FRQ2YvR1lXMkdFYm5oSnFTK3ZpT21xSkdGTits?=
 =?utf-8?B?S2hXOElhVVR3aWRobWpYVC9qaVlxWWJ0UEZUYUlUeVZJVEtheXplMmExNDdM?=
 =?utf-8?B?M2c9PQ==?=
Content-ID: <49F9DEE055515D4CB6820817E651CBD9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44c2180-59de-49ae-2574-08da97653253
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 21:56:51.7522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uq9YU3TZBbsiPc/4Nv+6OacNo17dRBxSjH9xy58kIRMSChfLJ26DPWdWAJAKIl9PUmM6vP1dFzCD4iYMkIZriR1RtalOHXa/2Fuc6fO+ydI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_145656_588659_A4651493 
X-CRM114-Status: GOOD (  22.97  )
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

On 15/09/2022 19:15, Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
> 
> Below are the blocks enabled:
> - CPG
> - CPU0
> - DDR (memory regions)
> - PINCTRL
> - PLIC
> - SCIF0
> 
> Note we have deleted the nodes from the DT for which support needs to be
> added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> board DTS/I.

idk, I am not sure what to think of this approach.

What do you mean by "for which support needs to be added"? If the support
does not exist yet, then is surely you can just add the nodes and it will
be fine?

Confused,
Conor.


> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> * Dropped RB tags from Conor and Geert
> * Now re-using the SoM and carrier board DTS/I from RZ/G2UL
> 
> v1->v2
> * New patch
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 +++++++++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 42 ++++++++++++++
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 56 +++++++++++++++++++
>  5 files changed, 128 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas
> 
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/renesas/Makefile b/arch/riscv/boot/dts/renesas/Makefile
> new file mode 100644
> index 000000000000..2d3f5751a649
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043f01-smarc.dtb
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> new file mode 100644
> index 000000000000..9747f30c5db5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +/*
> + * DIP-Switch SW1 setting
> + * 1 : High; 0: Low
> + * SW1-2 : SW_SD0_DEV_SEL      (0: uSD; 1: eMMC)
> + * SW1-3 : SW_ET0_EN_N         (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
> + * Please change below macros according to SW1 setting on SoM
> + */
> +#define SW_SW0_DEV_SEL 1
> +#define SW_ET0_EN_N    1
> +
> +#include "r9a07g043.dtsi"
> +#include "rzfive-smarc-som.dtsi"
> +#include "rzfive-smarc.dtsi"
> +
> +/ {
> +       model = "Renesas SMARC EVK based on r9a07g043f01";
> +       compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
> +};
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> new file mode 100644
> index 000000000000..8547c273f140
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK SOM
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> +
> +/ {
> +       aliases {
> +               /delete-property/ ethernet0;
> +               /delete-property/ ethernet1;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel";
> +       };
> +};
> +
> +#if (SW_SW0_DEV_SEL)
> +/delete-node/ &adc;
> +#endif
> +
> +#if (!SW_ET0_EN_N)
> +/delete-node/ &eth0;
> +#endif
> +/delete-node/ &eth1;
> +
> +/delete-node/ &ostm1;
> +/delete-node/ &ostm2;
> +
> +/delete-node/ &reg_1p8v;
> +/delete-node/ &reg_3p3v;
> +
> +/delete-node/ &sdhi0;
> +
> +#if !(SW_SW0_DEV_SEL)
> +/delete-node/ &vccq_sdhi0;
> +#endif
> +
> +/delete-node/ &wdt0;
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> new file mode 100644
> index 000000000000..3fde7192241e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK carrier board
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <arm64/renesas/rzg2ul-smarc.dtsi>
> +
> +/ {
> +       aliases {
> +               /delete-property/ i2c0;
> +               /delete-property/ i2c1;
> +       };
> +};
> +
> +/delete-node/ &audio_clk1;
> +/delete-node/ &audio_clk2;
> +/delete-node/ &audio_mclock;
> +
> +/delete-node/ &canfd;
> +
> +/delete-node/ &cpu_dai;
> +
> +/delete-node/ &ehci0;
> +/delete-node/ &ehci1;
> +
> +/delete-node/ &hsusb;
> +
> +/delete-node/ &i2c0;
> +/delete-node/ &i2c1;
> +
> +/delete-node/ &ohci0;
> +/delete-node/ &ohci1;
> +
> +&pinctrl {
> +       /delete-property/ pinctrl-0;
> +       /delete-property/ pinctrl-names;
> +};
> +
> +/delete-node/ &phyrst;
> +
> +/delete-node/ &sdhi1;
> +
> +/delete-node/ &snd_rzg2l;
> +
> +/delete-node/ &spi1;
> +
> +/delete-node/ &ssi1;
> +
> +/delete-node/ &usb0_vbus_otg;
> +
> +/delete-node/ &usb2_phy0;
> +/delete-node/ &usb2_phy1;
> +
> +/delete-node/ &vccq_sdhi1;
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
