Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07726C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX9IwiG63YKlSP2rY6rd9kRn5rXjg3lnZpdULF3fvac=; b=JDVdzvDt9UBdgF
	Liyzt2JUry10fjRZcQiYvPWWFpnOsaUHideC5ahZgEMdwyNQrvrg6BRroscMDOPoOqUnZRY97orai
	b4D1Ijf/zmVdsEdFiVQ6WBajznkIXPDeQRFbH08ElgiNLn28Hpxxk937UtGh+D75EChFzHVKKeJPf
	xO1qM2aIN9eKEJHMpSjuUhpHh53sH71LjIGhrFKpSXXrEROUZKgOPp5XTtTzVNNnqPkpJ3MKVV5jj
	NBoc5+JHrQT727SHe2fIDXMf6y8098HujOgLmb3WTlRAl3zsG9fM+U2E8s1E+UVVLUE7XspvUM8iE
	SDBFMtH7W4rKH0g0uMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcIO-00B4vo-Og; Wed, 27 Jul 2022 08:21:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcIL-00B4rC-9Y
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658910089; x=1690446089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fcEdx7SDSmlzMiusxJuVLk1TnRR610lzQxaLemWdBPo=;
  b=Ip5b4/A+D2LtdtOov1/04K0JIiQ0NUDkkjMXnC2hfjX6ZBOyob73CvQc
   MFtN38Q5+fU6CL8osCL2VWVnZ1B7tRTopJ7/HNAXCo0B/hQbubeC5Gla7
   lhcQvajw0sRgB5Nu9YRa4/Rfsr9Bjek1aG6VAbkEUktSiyie+blEMQ7Cy
   waewgWPvHY8yWHPBi2eGo0V1FlpQqE7mRxlREuZYbkDhHQKJER4obVM0T
   Gz+Ii8Bz24wlBqz/In99CLVup+uG2Mnr95q4w212ZLwQJxU1UXVFVdU4O
   Xe7xlSE4ZMSrnno+tDq5qhx40orDAB/A8G01+sLC2PbdF1GaHCURwUaq+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="106319316"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 01:21:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 01:21:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 27 Jul 2022 01:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwnOpOj1+6PWbaW72TfhmwZNCL9g128JSPI4w9klyqhUxTj65isW0Yso7DU4P1EsB8GsWbBq0RerpgxwnddFbAMtcAvOGCLAjOd4lM0AqrAdLUtfXFNN/qluP/+09qIXfBTcjbkZYfVlKBb7aTJxcUig02BceCV0TitBqlaF22ot4gCklYsbpxEHC/lHYJhdPyboep/bpmmcW7JLw6zc1bg1eurffQCJ5NxoRt+2ESdseTbq3FqF6PiI23yp/gyWt2MGT1Ujc9NWAmTxdQxlgHPblPvkVA2+4kmKBROTGn69QzmShsukQHkkz3JHDf6b7b8M9b8GB8nWDmJqo8+LTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcEdx7SDSmlzMiusxJuVLk1TnRR610lzQxaLemWdBPo=;
 b=B2fvIiHy00TtJ+5Dc3NZBuRnuOorZAv/j4DIW95tzvJyYK4BiGCPK8n48Pu2Vj3+bdOk9BYhJ1Jrs47FzA9dMx11amZZGcUzz1fYRZJ61bzgcEHV0SVO3lkyvy7XaKzs4EjQvh9O11XORJMQPQ/s1r+hVoGFSJU4X9+eg82YhFpvKu2ejCmMjZr5Q0WwC97cDLap4ryJc5GKxcvvPx3Cl9FohvtQIRlGF7/Z7bLD47fZndtByvOk+7Ar82kBXkzMGgJXkkiYmbfKAnL6Mea7vIUulhOQHJypd15y0pMMYsLIklMhqWhRu/56DRGSNFQ6Be7yKp3ugOzUCsLaam23iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcEdx7SDSmlzMiusxJuVLk1TnRR610lzQxaLemWdBPo=;
 b=NjMhs5kGOBGbo6hvZ7CPP9/khEIFIlYMhJ1qLvQSLoCzEyZiqn2LEJfzvij05JLls4ovjARpq/x53X3p+/ZWmNdNotD/d8XpT0Le36kJFXsOB62BF9AW3O5UKGDoIAquXEu0n3FoXpLpms1Nx0QH1bh7dbkJMckcldbrBUCFbK8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5701.namprd11.prod.outlook.com (2603:10b6:8:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 08:21:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:21:15 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <Conor.Dooley@microchip.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
	<magnus.damm@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <anup@brainfault.org>,
	<linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Topic: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Index: AQHYoRqPxI/VCgWJ706uhVm84f5gp62Q992AgADmcICAAANLAA==
Date: Wed, 27 Jul 2022 08:21:15 +0000
Message-ID: <bcc1dbc9-37a2-157a-1da2-7e51d3edb6f7@microchip.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
 <CA+V-a8vwhsa2S2UX+hi0MPnrjpfRYLzo1Ca1vffx-5A9jr6Hpg@mail.gmail.com>
In-Reply-To: <CA+V-a8vwhsa2S2UX+hi0MPnrjpfRYLzo1Ca1vffx-5A9jr6Hpg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 587c0504-7dd3-4552-23b6-08da6fa8f953
x-ms-traffictypediagnostic: DM8PR11MB5701:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hY1It+XRfcXriIMnvai73sTKKSRs2MhjsPQJUNh8eNidHcgWNJ37onetqh25dcEcozDuxaYr3rntQNf2lMR4jIivb4cw2/VGe8D+KdiAEChnoHDvh63DCzmuLwlCF3wq6S4zCNAQx9cq8YenEHiaPmDZ4aIH1/76mB+esnsWB3z5CQUeL0gbEMOPLqed+rz/3DRIrRl6wDuri4dwVAiuV4K6KJeRrIBfRgcPn+zivyPV/OjfSVt02Qe2pgReMx5OlABgJDd+SsNzvOPh6xFrkfUfe5InLEVKtAqK3eEPI6TWKoL7wqA66qHFv0U/qYb4myW4BkkcVC2/8VOOWbN1MRyeu/+24ez+TibW//Nw1arDg4+LHSw5Uo24dP6Bx1n1ZMmCJa48WNFA87SDQ8b+4CeoRaKOx3jAh6vQOHTr7WxGDiv53rpkR6bNpT7Kkz3jqujS4cNEVmymOFlYxQddOU1mDROAS0Rp2KbFxZXWMF5Jj7N86JvlQTY9GLIDTzVqd1io1jB7Xc7/lg4O0m5WUhz8zBmluChp0pZUp9wHZfFURQd7J0iYqkf9fbvlp7rdJ0Q/RYuUT046NdBMKWVOJWMdqamdhm4YV+6YYNXrCqBOV4mcpK40vm0fYVtnn2AZlblRxpXmz2W3mh3Y2UuU4JcgjnoliS07fms7wtZV+DqGoqxO4jCV8MSMWbpPDYe6zgsivC49PrissPjzA7y0xe0kMosasNyyTBrhCek9ui48F79vi1rH7eFs8EzGWWiXqc7ZabsuSb7V35zR7r3bIPKU/y8GKnzqmSDejsQVhKYloGdPpa4mzvvyMNrUPbDdfCcDHztIYq4T+2LurapfmdFNhnH+G4Mz/gxw9/2YgrlPrTChl8xprYTfK1ujQnXs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(376002)(396003)(346002)(26005)(53546011)(38070700005)(66446008)(2906002)(71200400001)(8676002)(66946007)(122000001)(66476007)(4326008)(66556008)(41300700001)(64756008)(54906003)(76116006)(91956017)(6512007)(6506007)(5660300002)(6486002)(4744005)(7416002)(186003)(478600001)(31696002)(86362001)(38100700002)(8936002)(2616005)(36756003)(31686004)(110136005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2V4bE5xY1g3NDYyMG91YnU4SzZQelpaVWhGNGc2YkZrdUhWMFFMWTRINWdJ?=
 =?utf-8?B?Qlo2dWUyWEZ5Q0c1aGlNa0d0UkhYU2lmS2JBNGp2Vms5UDEzV0R1eVZycVFn?=
 =?utf-8?B?Q3o4SVVCV2RCeG51ajM1d1d6UmQxQm55NTFTSFluZEMyL1h0NDRXTG5uM2Jj?=
 =?utf-8?B?VitwZHdDZ0p1bUhmY2hwbU5BNjN1VzNiRW90N3lrTncvWEZ0QWlSdDJ4ak8v?=
 =?utf-8?B?cFBkVXhoVzhaSWtFdHZpNDR4Wm5TeXc0MWt2eEQ3Q2U5MVZtYjdzaG10cW40?=
 =?utf-8?B?UVNaR0NBU0t6M2dIMnBRbTBBTWpUVmgwN2pTeTdoNDR1NEhqUkl6UW52dU53?=
 =?utf-8?B?aGFmbXFwQis1M0RjRDJkSnN5YWUwbmg3aGpZdTBrd0o2NzdaY1ZpVTdzcWVT?=
 =?utf-8?B?dkY3b1lxeTRoL1JPVzU4a3dxQmlCeExDNGk4YktDUnBwOHJGczFqVUllOERu?=
 =?utf-8?B?clFXalFRbCtxVGxMY25RZVVFN2RXc0NvK042TkVVZ2hpNXpnMDJTMlFkQVBI?=
 =?utf-8?B?c2dheTZ4R0FkYzVXbGlLZnFMUEpzMzMrUmpiNlVLbG5hU1cvZWsyQ1dRTjhC?=
 =?utf-8?B?b1JYaWtZWWVyRTBWemlRTTV5NmRDbE5Jby9sK2NROVhudDh0c3daK0NiVTJo?=
 =?utf-8?B?WEtvQkhDWTE3VkNXcGpLaFNKSEdtOTE2dGNITjVhaDBxNmF6T1lCQlRuOURN?=
 =?utf-8?B?L1NLSTZka3lkSEV5dmFaUlNUWGFMY1ZFeWFuMm01bWNNVmdDUDRHZmZBRkpR?=
 =?utf-8?B?RG9aTUJ2VTR0a290eTNvUjQxZnBmWUNOcGs3aHVwWnY1Mi9qVEtKdHc1Rkgz?=
 =?utf-8?B?QjBudUxLbTlOTDN2dGwvVXVuaEQxVk9CN3VTcUc4aCt1OENGRC9Qc09ReEdE?=
 =?utf-8?B?WUhzSjFjMXI5QXRGazVsVW1QeW5KTkltemJmVlJFNXJTQ2xWMTZ4ZHRYLzFU?=
 =?utf-8?B?c1FOOWxDbStnWHNPcHp1MndLMHRPVVk3R1lQc1NPcktaaXNEVjV0VGUyR1VB?=
 =?utf-8?B?VHQ1S04wajg1YU1iNHpWcWg2SGhLcWgrQkMyVFJ3UUZVTnBoMFdxUGZ1cC9I?=
 =?utf-8?B?RE9OM1NWMllVdU5yZmZOejg5NUc1SFR3TTlVdEFlbjVZcEh3emNXUitPTjJG?=
 =?utf-8?B?TW5DYWNYb0h2dGRWdU1vVU1nSDdJV0RkOENlOHVpR1lSVGtiWTdZcUJzMEc3?=
 =?utf-8?B?RjVKckRkN2g4eENCOGxyd0lOcXo4KzRGK0JIbVRHWTFEUGlveW5pQmlRZkJs?=
 =?utf-8?B?TksrSGZUNVI2NzlMQitmbEE0MDdJc3VmRW1MMnRXRHlqNzE2K3pkakFBTnFO?=
 =?utf-8?B?MW5XTXBNVHdVMGpiNmdCeTlHbHFEOWZrcXNTZFhMWCtKZ1pPTkRvUnBwWVlU?=
 =?utf-8?B?OTBOQ01HODBwam1qeWp3a2NMRXlZQ1QrdFR1anlTWTdQU2NhSWRwR2NCQk5M?=
 =?utf-8?B?OEFLVDZYOTZsTWp2SDB0Y3VrREo1WHdlNFpqNXJmeStEZlYrQlFyamF3SVhw?=
 =?utf-8?B?L1dKYVl5ZjlySE0xVWVWRXhGcDFwb0FXS3pyZllrZFJnL1hybmtZY0dqL29D?=
 =?utf-8?B?RndOK3pCLytyK1NidmwvanFxOFl4R2dWWnBwUW1aWTNmQ3FkVWR4ZTlEUW1W?=
 =?utf-8?B?RFgxR3B5YUlyKzY0eG51aU5tRXJpMk92YW1LSDhDdXRLaG1iR3ZaY1NET1hB?=
 =?utf-8?B?dDFpWTZrRWx0Y1QzTXhzekh2Tk53OVJieDdsNG5DdkwrTVoyWk5reUM4elpH?=
 =?utf-8?B?V21nd0p5Ri96Vk9UTXJJZ2t3d0xqRERCR3hjMkJXNVNTRFFBVTZiOEJJR0dJ?=
 =?utf-8?B?L1dvTkIrR1hTZFJhbk1vRnpwUm1FQTRrM3pRWnlFVCtZWUp1VjZQRTJPMmFO?=
 =?utf-8?B?U01GMmx1SDBORTNKT3JQb2FuMlpUcVRqZ0hlSGZvMG01NGRFb0Y0LzRSNDFL?=
 =?utf-8?B?QURwUWhOczk0SWd0a3pXMGNmK3ZiNHpJL3piRTlHMkFZZ1p6VFBSdWJtR3dm?=
 =?utf-8?B?MTIzRmFVOHJIVFp6N3AwUEFiUDNObFk4dGpEV2xkU1daUVpLRDVnV3VMeURG?=
 =?utf-8?B?YlZFZEVjZnZZREs3VStrTURBK1Y3aTJSaWFaR2hRSFN0L2REVmIyQUVUUUY3?=
 =?utf-8?Q?xdh02gLtpQcgk5q1jhJAv6/Ph?=
Content-ID: <D0040C6391D01B43BCA0C23035774483@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c0504-7dd3-4552-23b6-08da6fa8f953
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:21:15.4042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIr13MiJ6vvoxFBUzdguGju3dYaLHxUusAqvkO2ArS/mVss7Wnxog6XStVkQUAUvWqW770mP4NfBOOxpD1oEHTOB7CIsByvUMWgkFeKAryg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_012129_676524_2E1C0BB4 
X-CRM114-Status: GOOD (  11.50  )
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


On 27/07/2022 09:09, Lad, Prabhakar wrote:
> Hi Conor,
> 
>>
>> Missing files? Where is your Makefile for this directory?
>> Or the board dts?
>>
> My plan was to get the initial minimal SoC DTSi and then later
> gradually add the board DTS, but it looks like I'll have to include it
> along with this series.
> 

You could still add a minimal dts & add more things to it over time I
guess?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
