Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01BACE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX4eXTRNt2pdli2pGfSIOePGrztllu+W47TZoZVahwo=; b=mKH+0BClP5mQn6
	/EocGBIi89XURWHuYF1mSL0v7/OGqmN4aWKMNaeLX5W00ffOAdztAMd/Qpekg+5qZIVoUwmim2e1n
	xAEAk4hEC9IpamvtAg8PI9lMYTupNNGVhxi7sPQNwquyUfNXZqKak4SBXC/tzV+j3ot3AhIU5vG6f
	nDvMcrRPyuCvRy7qvj04NWIzy7r3aOdziOHXJCjtbDX/JRBbQZKh4FyAvLhVxZVpP8YyIfSxYe3U5
	+JnRj23t3wnH9wLJjPuRupwBqf0FbHST5WMQ1tsE+ZGLY84f6rNcBobhtOC4bTJC7NcXxBVQH6oDX
	TDwhTn0zh/ypuqb86Vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKt94-0000000FYDK-3lS8;
	Mon, 17 Nov 2025 06:55:26 +0000
Received: from mail-sh0chn02on2133.outbound.protection.partner.outlook.cn ([139.219.146.133] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKt91-0000000FYC7-3HS9
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 06:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv+6BGClmr14FhXFZ9g0zJM8+LCEo+T4wSksuQDR175Ct/yxXsO73qwhMyloLrBm6ufomFjZ3GLeR64pcC+WULv1FRYSN0Xa4fdOR5VwbtuXA+WtCL7+aIADTPaDhLVeivE+p/Gm8U5oJ1k9z3BRgXMdI6qo6O7s4DcVcf9v6ZIuKzSQSiLaQ9Wcm0PxaN5h5HMGQeIS5YjTNsoC0Pp9yU8aHvZyPPtCtxkdBMnoAhfvOYtIrGoXreK0XJxBtgL/7OtJRWRmRp0tVGZlUtfR1ChXqur15iYDssvJ3G3avoPcPUm/4C1yiBGPIjNBRPnTbUFBFTZsSINxXPMf9c75rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7706XAoj4xGs78W5MMZnY07Zb/+0yghteDxkqt+Tm70=;
 b=czUpnsBxOJjtV8lXaDyABh+QJQ2mL44WN8dINeqNxkJTC3aZD51lz3Wtp9QOIhSflkPoOZARPFVO2iPyW0EMou6khJ6GfhGN34gSFnVDO66XmQgd6JsaoajDSAS51hNtBpc4VvMVCVuW73IYQsvqbE9R0NZrZWtCtT5bQFufHBg6nk1bD6QcWH1swrkpAkuvT+qdt4yWicPZfqq1XxXJJeIxf0/470EiYTbos2a9ZxqgaFsxIYBt5M5b9PMcEK9oTy2IVd60HrsIzPRS11rJj9shah1+eCkvZ+9/N7gf50AmaSipo8oJ7AEQtwRRpNMjohEZaZgVg+ih8l5hjw83XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1145.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:54:51 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 06:54:51 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley
	<conor+dt@kernel.org>, E Shattow <e@freeshell.de>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Topic: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Index: AQHcT8yr76WB0y2LYU6wjdN+ecXGd7TvGAmAgADiXSCAAHpnAIAATH0AgAM44ACAAnXysA==
Date: Mon, 17 Nov 2025 06:54:51 +0000
Message-ID: <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
In-Reply-To: <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1145:EE_
x-ms-office365-filtering-correlation-id: 7c3e553a-3110-4ade-f573-08de25a634c7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|41320700013|921020|38070700021;
x-microsoft-antispam-message-info: XC2zdamCrvsmZibk6FS8WMl1UNMj7/ghLnbFC9jJjOKPMKLoLychQIG3Yo8dtRtEYICobAICRS7iNyXMd8yCvfW6GeAb1SUtE0c6BU9DswbLGw6qKcoigdQYGlWAg6ooKR7pI39iGnSsqsNceBl5X994UhjwnA4kv6Jusyv9UY7p8A1cfTJBxtyftqNKqYqhQaoE9awMcNgriPHbYkDj//j8HdwZfheN6ICNYTYKP0UCW2n6A52fQ/N5h8PpcJH3enzxbNkg6bJCzTKeDgIiU4MKnRnhdfLTXid9nmik5POTdpaCwvraEVWMImejSnJgGeFHIRx6Xk7YoQMkpevQb4byfbpuVHONmrueTHDWJcmn+rADL56hhBOoVkYmxxMS5qnpVecgoSSiOHB1MBV73KsoQxI/NRyRpbD7OnyAid1k8NKrdpp0SKzhKscoq9lGCjzQS6akzQULJVCNcS0I2n3cX/cq9A76ae2EKpndUuhWJ8PaA2aFEFVip38bK5rmdrkLd5qEYsO1AMl5IRZ0nD2YYpiBILOndZBMBh8iTyySu05liu8eU4GOHGUIaN7qnSJjacZ343K6YUJ3I1FiLxfpTuqoh919CRfHEXqM5Wc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(41320700013)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm5MSnBYeFF0M1dLUkcrSUNKWngwWFdXWFpwdnF4R1ZNUGVhdGNVTVFUaUJj?=
 =?utf-8?B?eXUwdkJXM3RjNUROUENPOEZyOVI0RkZ0bENtT2NFYW84RFpzNlpGdVJKUVlO?=
 =?utf-8?B?U1VVNGVuNmNFUTRiSnpIKzJlWFJVYzh5aEJjZEZZS3JiS2xkV1pTU0lXbm82?=
 =?utf-8?B?OEFQMUVRQ1FpWWJmZlgwR1ltdXg5TWw5UW9NOWFQSVlNanZBekJNSzhhSFpt?=
 =?utf-8?B?SFZZL3lCRUlaUko5aWJZR0IwZit6YzdTSFMyT3JlQnlTNXp5dTNpd0RRTXZT?=
 =?utf-8?B?MTZaTDBPS093TG9hVmR2YmhFeXA5alNOQ3g5bWFVc21TVlp6eUJycmd4ZVFH?=
 =?utf-8?B?RW5XOTNZTmpOMUZSbDIwcTkyWjBnZ21wTXM0OEdQYkt3Qy9ObVBaekFwMTNz?=
 =?utf-8?B?aHVndnZOQTIyUFhZdEZ5S2V1b3Z3NHd6NjQ4QWROUUNYUjc5dGlBcE5iZGV2?=
 =?utf-8?B?Mm9udWZ6bnVuVHNrZWNMODhOYjNLc21YaGx3aHYrQzlEREUyN1YwTFVLMFo0?=
 =?utf-8?B?c3RIMXJiREdiOG9ydFE4Q1VQMlNTNUpHTU51VGtuUkMwVE8zcmZQcytoYVRl?=
 =?utf-8?B?dFpETHVQR21uMHpJdFBDeGhlMEs5dkxEeHBaTzhOOThLTWZIQklCazMybllm?=
 =?utf-8?B?OTN1SkVUb3l2enRQeDFTcitCalFZNy9TYkcyUWNZQmdUZVdhdWJnb05SbjFD?=
 =?utf-8?B?K0JEVXpJTlYybW1nUUNqUVh3Q0VRWXNGYStEcHJzLzdjNkdkYk1uK0l1QXVP?=
 =?utf-8?B?MFhJNE9FZXM3cllsQ1N2MmpiUTFKdHM3eTZEYXFUaldsNUdxL2pEMW01Wk92?=
 =?utf-8?B?M1lGd2NOMVVJY1ZYN0RHNXg0SlFGZVVuOHpVMnhiQVY3NFd5QXBTS2FKUHhu?=
 =?utf-8?B?N1hCNnZaVFgzV0V0cHczOXBPSDdOVFh5eWIrUTk5TDM1OXM1RmhrRTJHb2tS?=
 =?utf-8?B?aWRMTEdyV002WUZ1aUVtbjNuc3p2K3ViN3BBdlVySC9yZ09xYU1MdEZNTUtY?=
 =?utf-8?B?UkVZMXY3QjMrMEp4SFY5QzdPemZORk9Ta2R4ZjFlZmxwYW5nd2k5Zmpidm9G?=
 =?utf-8?B?YWZqa0JWZHRQa0xMajNPYzBpM004STVyZE9WSGNrNUozSWNHdUxoanUveWxy?=
 =?utf-8?B?WjBVQi8rSkJ1UGQ3eC9mRWVHUVMrK1Q2TVE1aWR3WDVpQXpTUCtmSUx3MDhx?=
 =?utf-8?B?UGpsc3ZvTTM1SkpQaXE2R0NBbTd5WGZacjRyVk54U1h6WXgrdWtoRHgxVmJO?=
 =?utf-8?B?bXRNZ0cxcU5IaFRoL0VpdDY2dWkrTVBkYVM3bkpaem5LcExCUlBFUUN6YytK?=
 =?utf-8?B?TVhZT25mMm82YUVzTmIwaTMzTnFzcWZoMDFDMkM3ayttYVZJYzl4VWlINDV6?=
 =?utf-8?B?M3VVWmcrbjMwQTlCTDdySlJwRDFjT1BrVy9qZHdza0xtZE1lYUp2OGRYTmJj?=
 =?utf-8?B?cE5SaWQ2Z3Z3elZmdXFFWlZXNmk4aXYvd0o2cEFHNU52Zmd5VWo5ZkNkOGdp?=
 =?utf-8?B?cEcwQWQyc2NrT3YyRkI5ZGhDRVFCYWI5RnhsSzc0QWF2b0lHVlZrN3JjdWJE?=
 =?utf-8?B?WXJhVE9Sa2ordjV0aE5mWGdoZXRxbWYydGV3SUUzRjU0SXI5ZStRTTc4NnFv?=
 =?utf-8?B?d01DR3haeUlQM1BsME0vV0F4VHppSnorZUdDaGErZEUwV0ZHWUMwMGFrVnJy?=
 =?utf-8?B?MWJDQlVRc0pKNnV0NGppM2ZhKzcwZnNUcGNuNEh3bzUzOVR6T3ljY3JHQ2pO?=
 =?utf-8?B?ZkxiV0hOdmhBR1FrcEJZNWJSMDRGcEZtd2NoVmFYUFdsS254bHRaS0Y5dzNI?=
 =?utf-8?B?OHR0Nk51VUlFQjRzUW40ZkZudW1sZUEzRVM0R2N3eitvamRSeE5HODRHeW9C?=
 =?utf-8?B?SFZncEZCeDZzS1RZWFM2ZitqclA2MWZNRWN2c09VOXVpenFEQWlReEFhMmU3?=
 =?utf-8?B?dEZCWDRVSGpzUXhKeWFHUytwWDZ4SGNVbmNhUmpWN2RKQWgxS1FFQnVYWWha?=
 =?utf-8?B?MmlaVjgrNFMvWGhjQS8vRzJLRUsxWXBEeWlRUFlBY1RqMVVZM3M2RFpGeGY5?=
 =?utf-8?B?YkNDTlR4S0ZzQmpRNXhMKzZCNnZVMkNBZG5PdUswMmp6STByUElXVXNwRm5j?=
 =?utf-8?Q?JpUZAD8xx9GkPs0cFLGaD0bZh?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3e553a-3110-4ade-f573-08de25a634c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:54:51.3245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JL8Z3dQmKcPFHc3KgmwGXPJMlYAWBKiHSsl0HnKfZpherZXQov/izULyJIeZjooXmoO5SGaLKVAFt0r1C6UtUszMGwfZPPzz2DKTiFiLjv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_225524_004108_7521A777 
X-CRM114-Status: GOOD (  31.01  )
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

> On 16.11.25 00:29, Emil Renner Berthing wrote:
> Quoting E Shattow (2025-11-13 16:16:12)
> >
> >
> > On 11/13/25 02:42, Emil Renner Berthing wrote:
> > > Quoting Hal Feng (2025-11-13 04:42:05)
> > >>> On 12.11.25 21:54, Emil Renner Berthing wrote:
> > >>> Quoting Hal Feng (2025-11-07 10:55:22)
> > >>>> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
> > >>>> industrial SoC which can run at -40~85 degrees centigrade and up
> > >>>> to 1.25GHz.
> > > [...]
> > >>> Currently the JH7110 device trees are layed out like this, with a
> > >>> nice separation between the SoC description and board descriptions:
> > >>>
> > >>> jh7110.dtsi               # JH7110 SoC description
> > >>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> > >>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2
> boards
> > >>>    |  |- <VF2 boards>     # Final VF2 board descriptions
> > >>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
> boards
> > >>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> > >>>    |- <other boards>      # Other JH7110 board descriptions
> > >>>
> > >>> With this series it moves to
> > >>>
> > >>> jh711x.dtsi
> > >>> |- jh711x-common.dtsi
> > >>>    |- jh7110-common.dtsi
> > >>>    |  |- <jh7110 boards>
> > >>>    |- jh7110s-common.dtsi
> > >>>       |- <jh7110s boards>
> > >>>
> > >>> ..which I can't even give clear labels like above. In other words
> > >>> when new patches are sent in it would not be easy to explain
> > >>> exactly where each change should go and why.
> > >>> I'm also worried that you'll find that more of the peripherals on
> > >>> the JH7110S need special handling and a new jh7110s-... compatible
> > >>> string. Then I guess they'll need to jump from jh7110x.dtsi two
> > >>> levels down to jh7110{,s}- common.dtsi which then both describe SoC
> and board properties.
> > >>>
> > >>> If you're serious about calling this a new SoC then I'd expect
> > >>> something more like this:
> > >>>
> > >>> jh711x.dtsi                  # Peripherals common to both SoCs
> > >>> |- jh7110.dtsi               # JH7110 SoC description
> > >>> |  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> > >>> |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2
> boards
> > >>> |     |  |- <VF2 boards>     # Final VF2 board descriptions
> > >>> |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
> boards
> > >>> |     |  |- <Mars CM boards> # Final Mars CM board descriptions
> > >>> |     |- <other boards>      # Other JH7110 board descriptions
> > >>> |- jh7110s.dtsi              # JH7110S SoC description
> > >>>    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S
> boards
> > >>>       |- <JH7110S boards>    # Final JH7110S board descriptions
> > >>>
> > >>> I know this will mean some duplication in jh7110{,s}-common.dtsi,
> > >>> but I would prefer that to not having a clear explanation of what each file
> describes.
> > >>>
> > >>> Do you think this layout could work for you?
> > >>
> > >> Yeah, it is clearer for developers and maintainers.
> > >>
> > >> Considering Conor's suggestion, what about:
> > >>
> > >> jh7110.dtsi               # JH7110 SoC description
> > >> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> > >>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> > >>    |  |- <VF2 boards>     # Final VF2 board descriptions
> > >>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> > >>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> > >>    |- <other boards>      # Other JH7110 board descriptions
> > >> |- <JH7110S boards>
> > >>
> >
> > JH-7110 and JH-7110I reference docs are listed (not any JH-7110S) at:
> > https://doc-en.rvspace.org/Doc_Center/datasheet_0.html
> >
> > Does the JH-7110I use the OPP table for JH-7110 or JH-7110S?
> >
> > >> Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
> > >> Remove jh7110s-common.dtsi, because only one board uses JH7110S
> now.
> > >
> > > This patchset adds 2 different boards. Has this changed?
> > >
> > > Also this would mean that you're not using the starfive,jh7110s
> > > compatible or any other starfive,jh7110s-.. compatible strings, so
> > > effectively you're not treating it as a new chip, but just a board that needs a
> different opp table.
> > >
> > > I see now that the opp table is effectively the only difference
> > > between the two chips in this patchset, so if that's closer to
> > > reality then what you suggest is fine with me.
> > >
> > > /Emil
> >
> > Are we now re-visiting Hal's suggestion then (during code review for
> > Milk-V Mars CM and Mars CM Lite) to split out the OPP tables and make
> > them per-board, as before introduction of the StarFive VisionFive 2
> > Lite
> > board(s) ?
> >
> > Can we then do as from where we are now before this series:
> >
> > - Move "the JH-7110" OPP table into jh7110-common-opp-1500.dtsi
> >
> > - Each board jh7110-{deepcomputing,milkv,pine64,starfive}*.dts
> > includes said OPP dtsi file.
> >
> > and for this series:
> >
> > - Drop the adding of a new compatible
> >
> > - Add "the JH-7110S" OPP table into jh7110-common-opp-1250.dtsi
> >
> > - Use existing jh7110-* prefix for "JH-7110S" board dtsi and dts,
> > include jh7110-common.dtsi as usual, and include
> > jh7110-common-opp-1250.dtsi
> >
> > The exact filename pattern for the OPP tables I suggest here are
> > approximations, however that idea is my suggestion if we're just doing
> > a breakout of the tables and not a new compatible.
> >
> > I am positive on having the 1250MHz OPP tables split out into dtsi
> > instead of stuffing them into the VisionFive 2 Lite common dtsi.
> > That's all it is?
> 
> I think this suggestion makes sense if we're 100% sure the JH7110 and
> JH7110S will only ever differ by the opp table. If there is any chance we'll need
> to add different compatible string for some peripheral then I think Hal's
> suggestion will be easier untangle. We'll even be able to do it without touching
> all the board dts files once again.
> 
> I'm interested to hear Hal's opinion on this. Hopefully they'll have more details
> on the two version of the JH7110.

Here are the differences between JH7110 and JH7110S: 
JH7110 supports 0~70 degrees centigrade and up to 1.5GHz.
JH7110S supports -40~85 degrees centigrade and up to 1.25GHz.

I prefer to keep "starfive,jh7110s" compatible, because "JH7110S" is the chip name
in StarFive documents and the name printed on the chip. It is easier for the users to
know which chip they are using and select the correct device tree.

And patch [1] and [2] had accepted the "starfive,jh7110s" compatible.
[1] https://lore.kernel.org/all/jurnfpufll4twv2hfp2dv6qk6d3gr7gfmek5czigb5bcon636q@opb6hrdb424p/
[2] https://lore.kernel.org/all/CAAhSdy2Jr+EoW9AZooRDa12Kx9MSSaBaDXbJUoVym1qTt3r0-Q@mail.gmail.com/

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
