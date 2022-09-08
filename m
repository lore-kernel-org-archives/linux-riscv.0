Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EDFC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OTXw3Azfy8QwcHSmtqZ/e5jgFQkGmM8yy9YQoFFFBI=; b=moItzKT6C1ycBm
	QBp7NYWzMIvApYl/aOUyOu/6P7+42wB7r3a7OJPt5Oqn0YuFdAgRLwaQcWBCf6HnQxCoCCXfLstnV
	LsMQCMX6EpunVkPnsUJFzSXgycqTKTltE/QeXhMzu0uYzhPn/DxEevQ0qwUig4nfFrYnx6uRY3tFy
	E/nHR+nwkNjiwZjsA0zbyc5BPKLh4oUfIax0RgK3K2A4BiiX3/u4ryTem1rpG8hZkyvbnPXC3eaiM
	u0I98XsSFRn1Oe5AH3pCaGxUMw5NAcR8inQs98fIfmIr4w5sqK0Dmd4djiEi0sAaXdtrQJZBlQVuN
	atf9pAFXzl7GoHhVM+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHyv-004CDK-A1; Thu, 08 Sep 2022 13:54:13 +0000
Received: from mail-tycjpn01on2108.outbound.protection.outlook.com ([40.107.114.108] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHys-004CAr-92
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 13:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfe6nFcPGwLpIGSUxGd6zbrWXJobJmjirTej9y16Ls9h+X3mQ4ZkPExaNxr4wCiroWp/G092ptxMosASGhmArA3iwKaLPgAJgThPJ4r3A4JH1OyMcAxEU5Ux5wmgJJHk389PiUZW/DOS9C/hMB+08niiinpOAx+ZFo4eWFsamZ9M210LXTCc6MoiluEqlTxXPPqoKoVlX4ugtm/T1VzHmAbfOhveypRq2zImn2GgF8QCnb2YILy0kYthDhxgEQyk2FCHjiihEPq7YHl+w8wgy1n40SV9GRZId9BCgrpJ859wXTj5puXxccSyPsdgxWCZsRH6lMo9pXYpJIvU8euWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdyUD+/PvFrW5lmefP2kvAnJs4ey3ghnGmZLsP+Ekfs=;
 b=WAHyCCNS9WXL4rkl+tvgJbZj63N009tAyqa0g4ktRGsXVl7lZpPdf6VN2/Ghml/Ahdfgj2jyL14ofmgFJ0ciTM8pt8vLm1l3wikiVd3hb2iQ4tiYm5JxfLQY2ClCbxyE9kYFd1QGHCCk8GySSCZxUmOlUNqHX9OMzMQAl4Wo6bQVJCWd9noxcLQMkuKZR3XQgm9kfgglKInFXUH61VHd68va/Ao+mDIrZ18KC9GeX+qMkR9S44S38sohFxFN/xad+/jCWWWFBjgR3jsmLJ1FECqtpCjZguCwPG4HPJ7Q6tGIDJ17ivDP4rqelVUMrSswybk9vcWi1mg82DSHSHaN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdyUD+/PvFrW5lmefP2kvAnJs4ey3ghnGmZLsP+Ekfs=;
 b=KGvRIilGpcAzYtCBa313TpBZCyHVGKrw168R3oKeMPgs61Zmye7Y3xSqUTQo+V2SlEaIkMEpcAEuJp1AwYk73p6jRnaQ7Uj2HZqGHXjJEmSrG+WW6jk3U68v+/vFHS5ipeaBcNNu1QkFzm/kMKOQXGTpr308RmwHMlqeo+e4EYE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9413.jpnprd01.prod.outlook.com (2603:1096:604:1ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 13:54:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 13:54:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "guoheyi@linux.alibaba.com"
	<guoheyi@linux.alibaba.com>, "guoren@linux.alibaba.com"
	<guoren@linux.alibaba.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"atishp@rivosinc.com" <atishp@rivosinc.com>, "apatel@ventanamicro.com"
	<apatel@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "prabhakar.csengg@gmail.com"
	<prabhakar.csengg@gmail.com>
Subject: RE: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Topic: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Index:  AQHYwdqJJqv+SV7oQUWARHgAT75zHa3SNg6AgAJOjgCAAB1VgIAAlHqggABG7gCAAACJQIAACduAgAAIE3A=
Date: Thu, 8 Sep 2022 13:54:04 +0000
Message-ID:  <OS0PR01MB59220F722262A76983D6CEFD86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
 <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com>
 <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <5e894d87-8abb-540d-fbd6-8a1d6f9d0e91@microchip.com>
 <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXyvVas51e1ozxyYG4_NnVYAMZ1B30raGgaj=FDPeOL2Q@mail.gmail.com>
In-Reply-To:  <CAMuHMdXyvVas51e1ozxyYG4_NnVYAMZ1B30raGgaj=FDPeOL2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9413:EE_
x-ms-office365-filtering-correlation-id: a9f0c84c-e435-43ed-1a3a-08da91a1976b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  GGUpwhz7qNgiyccqdu+ILJQqVsRcnqWqRpYItrFXe3UEE/pnkP+2L/7rCKkbTcT94KQH0JysVUxzRyMA8P4jm5uzSY4PF/Qf0Xb82ywSvg15wU012g5BesJJMs10dXJW0VG8zb0V8EUBrdQGVBmWihhW3TYlmXAIAL0u5L1bb9ga51BXF5zCeHUFYdpEm6YM6/q4ZS+Zi/vsonBczeiGl1B4hWrvg0WT4dfH6QI8ac6EC00EhA9tLcLWzF/O03vXfwVV2RPz0vljpYI6FiEigDxvfMBb+vJ5YtnSKg+3jjuSUn7mNd92N2EkAOHdDAOr+SpNXKFoY9PX5Uj+Ze7e9AmTZ7FX4gv0q532drrlZrCaLnFo3JzVUljo9fdj2jr7t6SQ/8WnJfhDtfniIZRDLy4LBXWnrXXu2O9w/vMIklERouaFUCwv4T29WxD3oTxDKO/gt8jvg13krtcBKjRzJ6tV9FcgXx+WtrR5JuhNvj/DBI8qs5HlLZojBVI28QK9r4mT2dsU0seeT3YmGUbwwmHS4WeSJOePF7IaV0yyxdHVcL9VrmlO7mAZpJGP5wstDaGTX3I9qvE3LFShM4G6TdUmk50zKp6LBQ2G7DBy0yvEtwXHMGjkXxa3akGxcXqfSCJSoEKeLroifDC+siVmZnhbqMQIFcb4swiQAK67HO+YweoOXRfSa+NdlfGwVYk8ETyCMbB18SOR6kzIuSiuL8LGnFKcAdmeIKVMT511jFH6XhyViOOXPGGTcIlIe8CGHDnTJQjrHkdzzhK1AQ8oZvzOQp7IGlKjJDkiR9xfEtw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(38100700002)(122000001)(55016003)(38070700005)(86362001)(66556008)(478600001)(66446008)(64756008)(4326008)(8676002)(66946007)(76116006)(66476007)(52536014)(41300700001)(8936002)(71200400001)(966005)(6916009)(54906003)(316002)(5660300002)(186003)(33656002)(83380400001)(9686003)(53546011)(7696005)(6506007)(26005)(2906002)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T1hsaXk0SzE0WDVTb1J6LzJBc3F2STNLVkJkTXdzVmJuZm5MbTFRT0VhTnFw?=
 =?utf-8?B?U2YrT3JBWWFZc1BscGtiN1poSDNSVm1xYllMY1ZTTy83TkdQNkRoTTFLbXY1?=
 =?utf-8?B?amhTWnZiV1NEYi9TWWJDYXdhY2VkZnRrMi9HazBzdDNZdDIxNEFxbDJtUHVp?=
 =?utf-8?B?YWxFTFA3SEVzQlk3THdrYVAzODlZNlJBYS96QXBtZjFCV29BVGJXOFZKbzFM?=
 =?utf-8?B?N01MNUNJbWNtTnY4dUdQbjlaY2lETm5vNWVSc2lzVmJnNzNhdFpHQ21VQmlz?=
 =?utf-8?B?YUsyUDBKL1VFT2ZoTmc2N2xpNkdDNVZKMERET25Lbmo5Rmk1Q0xVRTgzMnRW?=
 =?utf-8?B?b1VMMTFWdS9VMGFTUG9lVGVWODVVWHMxcUs5R1loaFFsTG1PTnFFL2hxN1Zy?=
 =?utf-8?B?QmZsMHNoTGlUMmRRb3M3Um9vNEVXNDF4SmdhRE9xSitIcmpCUHZydG1WaTBQ?=
 =?utf-8?B?c3FtbUtaQUx0Z3l1d2E5aGM0dmVJQ3BaNWZRdllVcXNsNXFadS9tZGdpTEg2?=
 =?utf-8?B?bTl3K3VDYnVmbEJiRysycjR5TXpjelRxendTbU1hcTluL0JWbUJjUFhLZFVu?=
 =?utf-8?B?TTBkU2ZIVnQ1V3VKK1dEUEtIdnYxY0NKZHVDZ044aDNuS0NOUG55QTBJZFRw?=
 =?utf-8?B?WUFFWnVCelZLamdjQVZVL21CcXlxejZTQmxJSGNXM2ZnUjB4RWJUYVp5Rjdr?=
 =?utf-8?B?RVNmVGE3dDRGVmRVeXVNMjZtMmlKdzJYMU0yN0dMRVk5OGJ4L2duMWhLWWpv?=
 =?utf-8?B?MFdvdEJLclJjNk1vcUN1MUtKNVNPakRUWVYrK3Mvck9yUzAyd1BrTEhvbDdI?=
 =?utf-8?B?U05wbTFGQjA0Y1hIZ0gwWDdwSjlWTktreFgvei9MYks4c0hMY2dpdUoyMGFR?=
 =?utf-8?B?empoandiWkx4bGhKYm1vL3ZNNlYxMk5rY1loYzA3SklXWVFNOVJ5T3RWNWN2?=
 =?utf-8?B?MDlGOUVYenI5QTlET2VoUysxWThpK2tJSkh4SGVrdFpTUy8rbFpyTXJSczRT?=
 =?utf-8?B?ei82OXVrQjVPenpZYStRZ3NKV0pkR0ZhSmJwOXc1SHd6SUpMcGM3WVozR0Fi?=
 =?utf-8?B?UzExMWc2NmlOYmM2VG81WjM4d1ExcjBsTmRidGFaWmdqcE9vNGlvQkovQ0No?=
 =?utf-8?B?c0RlbEx2blUveW51dmxlNmxkajVlS0IrS2FVNFphbmNMM0FkMGxVd0NHWmg3?=
 =?utf-8?B?R3Y3NTlnRDh0SXhCK2VPR010VHVSZjVFZWpLQnRlMlU2RWtWRGZjZURPbW5h?=
 =?utf-8?B?Q3NpY3RselR2TjVYV0I0ZVp2ODNPWVBGNHIrV2MwRjh1cndKTTdFZklQbith?=
 =?utf-8?B?K2tlVFlMSXMxa2JyNXNWMHgxRzRmMmdLR1pUNG50Y0lnZFRPQlNWZVRVY0lw?=
 =?utf-8?B?SVA5MUJHbm9KcWFkVW9uSkVwUWZWeHp4cHg0dXBvR3BqcFRlcCtWL2tSM0FI?=
 =?utf-8?B?NGx6QUYveis2ZWY5bXRNR0pLbTdxUTNLeGhsMlBGZFo4UEQvUHhOWWU4NVl5?=
 =?utf-8?B?anFLSldvVVplWTczbkhlTVBQc0JXSUg5OGF4MC80THE5UG44N1VKMFFTa3Fr?=
 =?utf-8?B?NjFqM2xkTjFiQXVPd2NRNHB2emMrSHE0ZlN6QWR0cy96ZWNNTjRLM1BwbjRY?=
 =?utf-8?B?N3NaKzA2VitaZ2lkSVljWGpzeG1rRnNjd093WmNNalp4WFA5SjNkQmZQVEtB?=
 =?utf-8?B?RG16SVV3czdvbExGTm5xZWg4b0hvSlpiV21zMXZuYmlTUDhFUEJxbjNDT2kv?=
 =?utf-8?B?dEVDRnlQYjVGN0N4RTI4WHB3YnNBL0FRbS9RZEVsc0RweEY4bW1NM2l6THdt?=
 =?utf-8?B?L0xLS3hvbWR2UzZYczVpai9IR09CUGlxMkdRYzR3QVpRYjVjQmc4TFZFRlRo?=
 =?utf-8?B?eHNYc0hEQXYzSVNGQllMenE2Q0JSbFMwa0xWa2VFdmhjcDI2L0h2ZXE2dktF?=
 =?utf-8?B?cm9EYWpraTg1R0c3WWlVSjNLbHRpRGdDK0JSbjdjQ1J5N0pGWVEzQVNoblVP?=
 =?utf-8?B?L2ZZQWxkZmM0dnZ0dzVjaDJQSFgxWkliaUpkR1lhU010SmdNZUtKaFMxcHlK?=
 =?utf-8?B?Ym9RRnI5RHBiNUdxVVBXMkEyVHFpZkxjcE5WNklJM0hRdzB2SzRTN1BjMi8z?=
 =?utf-8?B?ZGR6SVNDcHpkVDVsMmQydEt6V1UwN1hqYnplM2tqQ1lhRG1Ma01iT2l2Z1Jp?=
 =?utf-8?B?elE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f0c84c-e435-43ed-1a3a-08da91a1976b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 13:54:04.1862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bpf7L9/RYDHs3RcaMmmzxB1ID7y3+5XfiLH0QXZ71ohNd1vn+p4DDA4YTMXXnyFqOlTaU65EdeCsBYbbG8Ajn6yVMZp1m2DJ/axdNAaBwLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9413
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_065410_677981_806A5ECC 
X-CRM114-Status: GOOD (  18.64  )
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


Hi Geert,


> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> configure the PMA regions
> 
> Hi Biju,
> 
> On Thu, Sep 8, 2022 at 3:01 PM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> > > configure the PMA regions
> > >
> > > On 08/09/2022 09:39, Biju Das wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > > know the content is safe
> > > >
> > > > Hi Conor, Atish,
> > > >
> > > > What RISC-V devices you have?
> > >
> > > A bunch ;)
> > >
> > > A __couple__ PolarFire SoC boards, HiFive Unleashed, D1 Nezha,
> > > Canaan
> > > k210 MAIX something & the VisionFive.
> >
> > If standard DMA api works without any issue means, on these platforms
> > IO Coherence port is enabled in the hardware. So all peripherals
> > involving DMA work as expected.
> >
> > > > Ours is RISC-V uniprocessor without IO Coherence Port.
> > >
> > > What does "IO Coherence Port" mean? Zicbo*?
> >
> > The HW will provide coherency between CPU and peripheral.
> >
> > If Zibco* is uniprocessor, then highly it may not have IO coherence
> > Port enabled in their design.
> 
> Zicbo* is a set of extensions for the instructions.
> These cannot be retrofitted to existing silicon, but perhaps they can be
> trapped and emulated?

Thanks for clarifying this. I just gone through RISC-V CMOs.
https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
