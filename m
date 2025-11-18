Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14AECEBF61
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeztwB8Ok208A1QSLfxempjchaFcEeHdlL6Echg3f5o=; b=pja9/LWJp4SKrw
	9QWLrxd2Caisv4WkMRKivDqF3S3CuLDjt6w8dipK5HiDdzD98vS73dD/VhzNwqJQQkH7I4SJMh9nJ
	+OyP9RGUuLnN6ciNo39DZlbUcvLmjKmRGdWCHreqRsUrY9hoO/u1A2+4N+5p71xYrfQKOIChudJYw
	1Sq9mCw9h2MD9PQLaROxaItiVR5XM3kp1Ob/rl5PbYAlRopxhsUTwol0NR8YOIGI8c9FSdfenTHkz
	Bzeu30jmX3UwVs1M3hBveHj0HUB/Z6kZRUjNKNqT5v0yyeBRzr5OQA2e9+y8+N/15TdzJ4LSZIgb+
	j+Mi3+IftNCqdZqPuRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBDW-0000000HCth-3tAk;
	Tue, 18 Nov 2025 02:13:14 +0000
Received: from mail-bjschn02on2138.outbound.protection.partner.outlook.cn ([139.219.17.138] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBDT-0000000HCt0-0O1Z
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhJfQXP+uRcJ8ZpQuqljRG0nm9mbwrKnYGKRyJcdHgUfmOxAn/7hZ+g8512kyAxKLdWz9Z/rEuOaWU+JP8lezEVNEz2yV6AovvdJj6ww3Q6vWRecRg9g1CWyfYguyXHgeHBv6IdSGaJki+P3aaQh8mOz4XMkH+ch+oRcpkXqrSO5RRGrCo2IlDQ+ykGo3oYwXl8sMD1SVjvt5maYiIj/lTThzg1UlCiCoCUMKk1vduX+WmbbUoWL7Ev92wGZNisPYIoIZ65f1de1o/lmv7IZikCtYf0khLgLtdwjJUXIVCaYqXZQ/TFJdriZ+eMvTQmuXlv769HWT77iMK/r6h3SqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ1BbK4AXCrOkOpm3WpAtNdV4OEjPDvIz4Sz8PCC7LQ=;
 b=L869s5RirJMCNsVoGYBCsXhfeqV7LwrCBpwEcnDDqpiDboZA1ZlhczViYlTlwv7/A1soQVOQMgfXTJgC7jFdUZu+Vp8z5v+aPnKK8UMeeKIR5+lQ+OV38ivszUzMKoPABkprMGryuMd6WKe2sbQufcX7C6UyrY8EL8say45xpgiORPrW/S5BWKKPqhvjvVrL2IRh5cn+Nw+I4ptXHBK9WAQNg3CYjfe2/c+LXmcQQKGEG+3YdPetBzLC6a/vacOXRquz+mbI0ncjIZVhdk3h+XlM0DPlJKZFgG5FeOLruvZlhkvJ2c/Fg/4ZC90FiKrIOFqJjFDZA2ejJYQuKa1gzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1321.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.18; Tue, 18 Nov
 2025 02:12:58 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 02:12:58 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Krzysztof Kozlowski
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
Thread-Index: AQHcT8yr76WB0y2LYU6wjdN+ecXGd7TvGAmAgADiXSCAAHpnAIAATH0AgAM44ACAAnXysIABCekAgABDeoA=
Date: Tue, 18 Nov 2025 02:12:58 +0000
Message-ID: <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
In-Reply-To: <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1321:EE_
x-ms-office365-filtering-correlation-id: e1875e15-d007-4b99-2ec8-08de2647fe43
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|7416014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: TA6BLyTFUoZcnqjz6tbeP8lxyv03mP2QMcoO0+LeZJp2yR/dJyifvub88GPQDqkfYyfgWrBmUriaM7CrpNtADpLEQAPidmA8xTXS/4bDf9YGi1y0ca8DXzMXxx5Vejx5uxLYqjEWaVTYHCbzNkVWAF+5I25FHmmouMRRUWFR5u3iW2kuKjBrxhKF4W5tl0Grl4nfe8T2nAXNbsL+pQ2GPUjhDjYvoRWpbGL94gRJ5/dYKcnTph1bX6nACfYHLMZJWMMi0+KRbG4wvh4S38Zhe3gcPQLm1/f8Azzm7Nw7zAkNKuyJDOr+Yf1LAWzYrCmfe47EhsgAIbUbDG+2fRTKflmmjqeluGoHSw1/s+8rA6LLzRee9vt0jrul81hQVtr61OMgDOjDaVRK3Zp2AqDWTyCrX+hOIoIJff/56KwQoIyE8oX/kPMSluDJUOodokmrSvUWXIGKlcAGAFVMB+s8tXIXBl0T37KBYwu3qRwRKMgC7aHOm5FpvJERkYdn8KfljqDkhseU1awlRhrlk/8NneSPeY4Lu1rnK77930jjNrODNL9wdXlcJPUYoleHiSlGE+OxH1u10jM43/4O2jnKskc0/ZY8zgfPNjTTGl2b+eI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(7416014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWhKSFd4Uk13RkZCRVZaTXphZVRqVk1RZHFhS0RzclJHUUpsWEhtOVFnazRv?=
 =?utf-8?B?S0tkc0lNdE9TWi9NQUNsMldFZk1aTktWN1p2U2crS1JqdHIxUmtaMkdyT284?=
 =?utf-8?B?VzNlVktOcjYyNlpyWnN2VWJzS1llNzVpMk5pNG9yQzBiT2p3NnhTWkxlTExw?=
 =?utf-8?B?bmFROFNTVUJiVHdnOWdua2NkTm05UlFGSm9MRG9qV0JQdnpoaGZVMGtsRDlM?=
 =?utf-8?B?RDJmS0VpNllVN1owVjl5OFM2R0JxUFd0TTZVMDNWLzJVK0l0d0FVd3doK2Iy?=
 =?utf-8?B?dzlzQnhYT3ZGUmtXRDQ4MjJ6dkNMVDNCSkdQVjFxYXdIbkovWUkxZy9hU0NS?=
 =?utf-8?B?YVlYdVM2WlZsdGRNZTVEK0x0NWNNemlzK0FlUG5IOTUvclU0ZUNOL2FWL3NG?=
 =?utf-8?B?c29BU2JQeEE3czJsVFhHaWtMelM2ajNZQkRWaHBxOXozVGc3Q1VybHJBSml0?=
 =?utf-8?B?UUNYOGlMSzJHdFVsMi9mbExiaWNKeDZBOG1xSVErQVNPQjhDaW1nOEpBb21Q?=
 =?utf-8?B?RlRPN0xnbXVENmhVNUFSaGtDdTJXMVVXWDl5YTRoQ0tZZE16UmI4Vm5STlpz?=
 =?utf-8?B?TE1ZTFZNRTBsSW84ZTZ4c1g1NWU4ME9RNnlmZUZFZFpVanFYVGVrMGFPeEpy?=
 =?utf-8?B?Qk1JazM2T3J1ZldSNWNrT20wdi9VajhISWg2VmplUnF5R2ZZZlBMc1ZTZ3J5?=
 =?utf-8?B?R2Fvck5CaUxWZHBSenNrUC9GOU5nMTBnVlg0ZllDRWx0NjAxaUtSZUFoNk4z?=
 =?utf-8?B?azA5Y0d4WEpHQkVxUXorakQyTU9YZjN2TTFmR0RxbWw4YXgwV0Fpd21lT0J2?=
 =?utf-8?B?THBTK1N6MEtlYmE3UFNtZ0Y1WjJBRTVrSGlRWlk4Tk9ueHJrVktIN0lWQy8z?=
 =?utf-8?B?c2JXcC9iR0V1clVxek1GOW5hTjZuam5mbGpnbTBMN1AyeG90YlRFdXVCR0dT?=
 =?utf-8?B?MTRCT3hPSjRTdWZMQ2ZjN0paaXV3VHNBd1BmZVZmdWhtd1pqem84VlU3d2kv?=
 =?utf-8?B?TDZYZGNXL3AzWUlDdjV2YVJUUTR6TnNidFk1K2xoYTNYNWZYeWlwemZvRFRo?=
 =?utf-8?B?YTRKWHYvQnpqKy9KTzdLWE0xOWYrbFFDdllhZTh6WmRIMlpHMmJLOExuVTlo?=
 =?utf-8?B?SUJzMEphQStkVXQvSTZyd243NkZ6YXZVa0FrTnpBZDBMcS9BMFhUc1VPMWNu?=
 =?utf-8?B?K1EzTVEwRVhpektiak13K2VUTlhJL1R5WGpBYVJ6R09QaUM1UGJaUEhjS211?=
 =?utf-8?B?cUxFeVpNR250bXZxR3p2c1JiQkl4MVdyczByc1Z1YUEwRWd3Vk9nTHI0dDZO?=
 =?utf-8?B?d0RqSlpCa2lWMnBGMWNyMHlVWEdONWlYcHppczJDWHkvUW1hMFc4bFZKR1pB?=
 =?utf-8?B?em03ZTFVV3g3cTdvOGJMVERoWlNDZHYwQmZKS29CVWZGZzlXWHIvR1lZQVlq?=
 =?utf-8?B?MUxDMTRkTkhndHRZUDAvei9yZUpKT3dQS2dmUGFVQUlkMXpaeDJNc1ZLQjZK?=
 =?utf-8?B?UEJDUWRxRW84MW9FQ0E2L0dxWTFJcitLM1V2QXg3M3FyUy9PVXFoOTZKTnRP?=
 =?utf-8?B?SlhNM0NHNWR4eXo5TGFublR4MDNvVldldElSYmh4TE1Fd2t3eVcwNU5Pdk1u?=
 =?utf-8?B?MnpuUUlIYWZxYStmWktta3NrWHc1Y3BUZENBNFdscVpHamRUYXNya1NVcWFi?=
 =?utf-8?B?eWVzOThrMGM0d2lyVzgrYjluWFhiOUdDNHZOY0Ewdk95TDlYSFJKMjdYc3p1?=
 =?utf-8?B?NDk4R2JVN2c0Zk1sVzQyQVJLZlhxSXkyYXFVSlNDZFh4aTRzNW5KZy84UXNN?=
 =?utf-8?B?NmVmcGh0RzJmdGVBZzVOMmJmU2FyWDdDaU94UURhbmI5aCtDWTNaL3JVbHlR?=
 =?utf-8?B?Q1dlTkVpTUxsRWZVNlRDN21pN3lwZFBhYjJHd2JQSDBSWVhJeSsrZkZCUHBE?=
 =?utf-8?B?Vm9Lb2h3Ym92bGpqREpxWVh5ZmFOYU12UGFGR3AzRU04cjlNaDQzRldDcHVO?=
 =?utf-8?B?VC9pLzIyYlU2b2hBeXI2TlloRjNyMWswbnFhLzBKYmoxZ1Fucm9Wenp1bEJi?=
 =?utf-8?B?OHhZUHk2UWNYc2VDSDVRMzJFNDJZZnBhQlIwOVBDZVZ1L3VmckFTWWdvSHhR?=
 =?utf-8?B?Zzd6T3Fud21NQjFlaE5VSysrT1RBQ0NHaUVmV21WRFltRStpajI3WnFiS1d3?=
 =?utf-8?B?aXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e1875e15-d007-4b99-2ec8-08de2647fe43
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 02:12:58.3263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mtr1K6MRyKTnR5Cl6lv584lrEleYQePJ+0zgeWg+WFV3RB6nx8sNL/VfiZN+igvd+nHsx1uwnBVjGbwLklbBKZhkqsSV32XGEGkOEceQLl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_181311_732176_6B25C7CD 
X-CRM114-Status: GOOD (  24.25  )
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

> On 18.11.25 05:55, E Shattow wrote:
> On 11/16/25 22:54, Hal Feng wrote:
> >> On 16.11.25 00:29, Emil Renner Berthing wrote:
> >> Quoting E Shattow (2025-11-13 16:16:12)
> >>>
> >>>
> >>> On 11/13/25 02:42, Emil Renner Berthing wrote:
> >>>> Quoting Hal Feng (2025-11-13 04:42:05)
> >>>>>> On 12.11.25 21:54, Emil Renner Berthing wrote:
> >>>>>> Quoting Hal Feng (2025-11-07 10:55:22)
> >>>>>>> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
> >>>>>>> industrial SoC which can run at -40~85 degrees centigrade and up
> >>>>>>> to 1.25GHz.
> >>>> [...]
> >>>>>> Currently the JH7110 device trees are layed out like this, with a
> >>>>>> nice separation between the SoC description and board descriptions:
> >>>>>>
> >>>>>> jh7110.dtsi               # JH7110 SoC description
> >>>>>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >>>>>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to
> >>>>>> VF2
> >> boards
> >>>>>>    |  |- <VF2 boards>     # Final VF2 board descriptions
> >>>>>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
> >> boards
> >>>>>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>>>>>    |- <other boards>      # Other JH7110 board descriptions
> >>>>>>
> >>>>>> With this series it moves to
> >>>>>>
> >>>>>> jh711x.dtsi
> >>>>>> |- jh711x-common.dtsi
> >>>>>>    |- jh7110-common.dtsi
> >>>>>>    |  |- <jh7110 boards>
> >>>>>>    |- jh7110s-common.dtsi
> >>>>>>       |- <jh7110s boards>
> >>>>>>
> >>>>>> ..which I can't even give clear labels like above. In other words
> >>>>>> when new patches are sent in it would not be easy to explain
> >>>>>> exactly where each change should go and why.
> >>>>>> I'm also worried that you'll find that more of the peripherals on
> >>>>>> the JH7110S need special handling and a new jh7110s-...
> >>>>>> compatible string. Then I guess they'll need to jump from
> >>>>>> jh7110x.dtsi two levels down to jh7110{,s}- common.dtsi which
> >>>>>> then both describe SoC
> >> and board properties.
> >>>>>>
> >>>>>> If you're serious about calling this a new SoC then I'd expect
> >>>>>> something more like this:
> >>>>>>
> >>>>>> jh711x.dtsi                  # Peripherals common to both SoCs
> >>>>>> |- jh7110.dtsi               # JH7110 SoC description
> >>>>>> |  |- jh7110-common.dtsi     # Peripherals common to all JH7110
> boards
> >>>>>> |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common
> >>>>>> |to VF2
> >> boards
> >>>>>> |     |  |- <VF2 boards>     # Final VF2 board descriptions
> >>>>>> |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
> >> boards
> >>>>>> |     |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>>>>> |     |- <other boards>      # Other JH7110 board descriptions
> >>>>>> |- jh7110s.dtsi              # JH7110S SoC description
> >>>>>>    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S
> >> boards
> >>>>>>       |- <JH7110S boards>    # Final JH7110S board descriptions
> >>>>>>
> >>>>>> I know this will mean some duplication in jh7110{,s}-common.dtsi,
> >>>>>> but I would prefer that to not having a clear explanation of what
> >>>>>> each file
> >> describes.
> >>>>>>
> >>>>>> Do you think this layout could work for you?
> >>>>>
> >>>>> Yeah, it is clearer for developers and maintainers.
> >>>>>
> >>>>> Considering Conor's suggestion, what about:
> >>>>>
> >>>>> jh7110.dtsi               # JH7110 SoC description
> >>>>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >>>>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2
> boards
> >>>>>    |  |- <VF2 boards>     # Final VF2 board descriptions
> >>>>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
> boards
> >>>>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>>>>    |- <other boards>      # Other JH7110 board descriptions
> >>>>> |- <JH7110S boards>
> >>>>>
> >>>
> >>> JH-7110 and JH-7110I reference docs are listed (not any JH-7110S) at:
> >>> https://doc-en.rvspace.org/Doc_Center/datasheet_0.html
> >>>
> >>> Does the JH-7110I use the OPP table for JH-7110 or JH-7110S?
> >>>
> >>>>> Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
> >>>>> Remove jh7110s-common.dtsi, because only one board uses JH7110S
> >> now.
> >>>>
> >>>> This patchset adds 2 different boards. Has this changed?
> >>>>
> >>>> Also this would mean that you're not using the starfive,jh7110s
> >>>> compatible or any other starfive,jh7110s-.. compatible strings, so
> >>>> effectively you're not treating it as a new chip, but just a board
> >>>> that needs a
> >> different opp table.
> >>>>
> >>>> I see now that the opp table is effectively the only difference
> >>>> between the two chips in this patchset, so if that's closer to
> >>>> reality then what you suggest is fine with me.
> >>>>
> >>>> /Emil
> >>>
> >>> Are we now re-visiting Hal's suggestion then (during code review for
> >>> Milk-V Mars CM and Mars CM Lite) to split out the OPP tables and
> >>> make them per-board, as before introduction of the StarFive
> >>> VisionFive 2 Lite
> >>> board(s) ?
> >>>
> >>> Can we then do as from where we are now before this series:
> >>>
> >>> - Move "the JH-7110" OPP table into jh7110-common-opp-1500.dtsi
> >>>
> >>> - Each board jh7110-{deepcomputing,milkv,pine64,starfive}*.dts
> >>> includes said OPP dtsi file.
> >>>
> >>> and for this series:
> >>>
> >>> - Drop the adding of a new compatible
> >>>
> >>> - Add "the JH-7110S" OPP table into jh7110-common-opp-1250.dtsi
> >>>
> >>> - Use existing jh7110-* prefix for "JH-7110S" board dtsi and dts,
> >>> include jh7110-common.dtsi as usual, and include
> >>> jh7110-common-opp-1250.dtsi
> >>>
> >>> The exact filename pattern for the OPP tables I suggest here are
> >>> approximations, however that idea is my suggestion if we're just
> >>> doing a breakout of the tables and not a new compatible.
> >>>
> >>> I am positive on having the 1250MHz OPP tables split out into dtsi
> >>> instead of stuffing them into the VisionFive 2 Lite common dtsi.
> >>> That's all it is?
> >>
> >> I think this suggestion makes sense if we're 100% sure the JH7110 and
> >> JH7110S will only ever differ by the opp table. If there is any
> >> chance we'll need to add different compatible string for some
> >> peripheral then I think Hal's suggestion will be easier untangle.
> >> We'll even be able to do it without touching all the board dts files once
> again.
> >>
> >> I'm interested to hear Hal's opinion on this. Hopefully they'll have
> >> more details on the two version of the JH7110.
> >
> > Here are the differences between JH7110 and JH7110S:
> > JH7110 supports 0~70 degrees centigrade and up to 1.5GHz.
> > JH7110S supports -40~85 degrees centigrade and up to 1.25GHz.
> >
> > I prefer to keep "starfive,jh7110s" compatible, because "JH7110S" is
> > the chip name in StarFive documents and the name printed on the chip.
> > It is easier for the users to know which chip they are using and select the
> correct device tree.
> >
> > And patch [1] and [2] had accepted the "starfive,jh7110s" compatible.
> > [1]
> > https://lore.kernel.org/all/jurnfpufll4twv2hfp2dv6qk6d3gr7gfmek5czigb5
> > bcon636q@opb6hrdb424p/ [2]
> >
> https://lore.kernel.org/all/CAAhSdy2Jr+EoW9AZooRDa12Kx9MSSaBaDXbJUo
> Vym
> > 1qTt3r0-Q@mail.gmail.com/
> >
> > Best regards,
> > Hal
> 
> Hal,
> 
> OpenSBI development can accept a revert for that 1-liner of code if needed,
> and anyways that new compatible was not tagged in any release yet while also
> being moot because if you do use it somewhere else and OpenSBI keeps this
> around it has no effect on upstream Linux using the compatible for JH7110.
> 
> Devicetree in Linux describes hardware not related to the feelings of customers
> so that should not be a concern here.
> 
> The data given for JH7110 and JH7110S does not make sense from what can
> be found in published technical documentation. The technical documentation
> is however lacking a chart for JH7110 from which to derive any useful
> comment here.
> 
> All,
> 
> I repeat that the suggestion was made months ago (by Hal) to split out the
> OPP tables per-board from the period of time when I was complaining about
> 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal limit
> on Milk-V Mars CM SoM.
> 
> Whether or not JH7110S is a new compatible should follow precedence in
> Linux development. JH-7110S is evidently the same tape-out as JH-7110 and
> however you deal with that in Linux is the appropriate way to deal with that
> here. Selection of OPP table for correct operation will be determined by
> bootloader, where, it is demonstrated by patch series sent to U-Boot
> upstream to be selected ** per-board ** based on EEPROM content as if it
> was any other JH-7110 board deciding dts based on EEPROM content. Given
> that it is the same tape-out I do not find a valid justification for a new
> compatible in the stack of adjacent software besides going along with some
> kind of marketing-driven answer about whether or not this is a new SoC.
> 
> What I care about now is that the VisionFive 2 Lite series is in good enough
> shape and there's a possibility to act on this months-old suggestion to split out
> the OPP tables which as we have confirmed the JH7110S is the same SoC as
> JH7110 it makes a lot of sense to do.
> 
> How is it supposed to work for binned silicon in Linux?

Hi, Conor,  Emil, 

What do you think about this? Hope to hear from you.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
