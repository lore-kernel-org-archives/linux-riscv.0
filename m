Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CFCCA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 03:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsKNrCD7NpzJSsqH5wTWx6hR1UxhB7/qYoOOXEbERNg=; b=xWwTuu2ToP2fMh
	yUCe7qhLohkXELwbhX66MQWV9qRhL+gh46IakTRr6W7MStHjrtQaLBh7g7et7xPJNdaMTmX1JJYtd
	J9sd1lzZXGu6f0nSRnqLde7iW9JAU4FjhQtrx0t7uhP4B+ub6Te4ZMitYBrXGGXjjz4KEbx0mGLvZ
	g8MiOMlisHMNWdOXZPkxTI0wn2K1ZuRZIuQjziIjq3N35/td1CXyMpfFgCc0jVzTk5Cj4K8zcRBNq
	OmzA6hnJnQaHfOLqMFlVbFB6nDc9DXaJKFlnatg0q+AAiEyzWadBwEq2x2axPKkOKvzj8UN0lKbAY
	VtDethG1Y8AoErSAdhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNl2-00000006nuG-3Gox;
	Mon, 25 Aug 2025 03:20:32 +0000
Received: from mail-sh0chn02on20710.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::710] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNky-00000006ntU-4AU5
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 03:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjUQmlFrWopADKSsZnhKsZOVdva48hv/u5QHv4iNJ38tHmh0y1RjjU1hpIcVjx7cZSTIzVaCNlzs8Ny/PC1eTxKeW0R8zckgxERZkjxDzMGDN7+iN1c0OBDvM0cWThERTAGXiIrFiaG/KtNcMlbiOAxmAiSgxflmT+XE+wW6mkQ1wBC1Zqbs37CK+go87F3MLHJoos/+KpDE0N+lUCRdC4iHOM7b6OCClLAdiQvC56p1Eyhu2ojE8lSL7SCSw67hpB8pvXtTQZUPNq2Hg245FjcIscehqkt7CBty+qToY5sq8UTylpUBA+CwsZwkDmarujEQ0L0srtrmza9h15D2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t8TscQ9BgjAq3Onh3vJEPk+4m/wmEl0uspN1c+aACc=;
 b=YPsZ7vIxo6Lo5qXziK4LhL99MdBwwE83yUn+LTulgkDo1ZcgOrNjLyMpln5zrYMzP+gbgIaq+zlg7HogKIDjIZP7GlO8z1DFL8xQ4Ryr1zmyrbKCEdFSfxHsw+wBws2dFsEmrAeD6AhNL9rThkVc7yv/flzTqV2hh88ONrYfP4dV+Ju0UIXju+5JYkmDpT0MWNnzFx4eGWA33mw3BZi0XdRJewO3OqTq5v/9/b0eivn16EdKvVJ6W0SO8fmVFdH+UNIIyRSHjqHgRXLDna3qEQDpU4A/Ll4Numitd4WWLgBxXBdk3tgle6P8UPDyRJMSTUst0RVgYot+fuXU1ZmCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1227.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 25 Aug
 2025 03:20:04 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9031.030; Mon, 25 Aug 2025
 03:20:04 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 3/3] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
Thread-Topic: [RFC 3/3] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
Thread-Index: AQHcEoPTVFgiZ2cNsUahDKGHWBxu8bRwpF0AgAH9drA=
Date: Mon, 25 Aug 2025 03:20:03 +0000
Message-ID: <ZQ2PR01MB130747BFF530B0EF64C5D833E63E2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-4-hal.feng@starfivetech.com>
 <fba0b49a-6906-46b8-92e4-d79e57b40d28@freeshell.de>
In-Reply-To: <fba0b49a-6906-46b8-92e4-d79e57b40d28@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1227:EE_
x-ms-office365-filtering-correlation-id: e03e8aa4-3ecf-44d1-b651-08dde386489c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info: v9rJS5ajv6zxO3isR3A1Q7cFJoGl1H86+uWBenzNWoBgLnaKY94vej2o1XyjhIasz3HcL8eTPu6KMt/rxcELmzSiAWgzI89ki0nAUWpF+hnCibogD/Txu8zMzOGYq48S9ZcP2Ga6aWW5RLarQOj4VucHau+Ns9WrDyyKs+yMMoNASZL6HXAS7SYMuEnjSKPfGjDs1E8S0MQ2aPGaPmnBEK5VagFzbmTmg1HuFgt2cWuiFoTFIfubSHHzW01YtZuXimllLqPaovrrVEwPXTAjoVJCrj1910IVzACR3Y074q0SJDjWBfwOXV/yqILBXhwmqrjIz6Sv+qogljsa1BeYbEdSwCceujdh6VevOwmrk5fUYbGsn5atS0fuU93m4B3crGorEHMBm39sti3+jVWQ77/Bq/V52jRsMfBC1tsuK3nOd6kecRMJtSCpD8hOcjdPM3Sgmw4mgj8sOJqxq1YqztanDRXBinvioxnudSIBZJbl54/UUpMnl4oJEFOIml8qPB1NBWnmYlV3SHjoO12AYvQPKyTIBoPF4nNfwURe6zIClAH88Q5EhXAHHJkZ1sJN+uIhX6cGHxrQpwuxc/4WMJgUMVfFukE4wQyWd673t7k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpGYVUyVnd1bW9sUzVNSjRqTENFc2ZEZ09OZDB6Q2JYS2tIcjR0TkZkK3pQ?=
 =?utf-8?B?dnFxS1RiS2NLbUphWmZaR0w2d3NIenVZQUQzVjRXZXB1dXFLUENjVDNJMkEz?=
 =?utf-8?B?VDcwY3p1a3hGTG9RNk9uTjJaUDhqRmF6Y2w0eWUwTTBBbVMxbE1uTkVQNkNz?=
 =?utf-8?B?L21XUSt2Q1c0VnY2LzFWQjVKR3psWC9pTG1zd0ZsVXV0bVRuZnlhRjV1cFBO?=
 =?utf-8?B?WVpjSlIwNGpCNklIWDlObzcyN1k0TEpKREszQWdKNnFnS3Fndi9obTloa1FB?=
 =?utf-8?B?eUMvaU9GakR4a05MZnpnYTAzYVFtdWM5cE5QVWJvWWxPeUJSdXk1SDBnNTBv?=
 =?utf-8?B?eFNTemFhT0xIZUF4dysvQU9EWldkYllZM0ZWdTRRbXZIMDdIRHhqS04zdjU4?=
 =?utf-8?B?ek0rSnorbWE1bnE3cSt0aVhMQ01KRmd1SXJQdmVzeTRvOFBqMDUzUWcyWkc2?=
 =?utf-8?B?bFRhYjRnRFNRaHVNOFJQNjc3QngzaWVKUzVkU3pLb1hYMlAzME5OUHphcU53?=
 =?utf-8?B?ZWEyaUVkSytMY2g0YXFZK0N6ZlR0cDNEcDNpMHVVaUlSUDNHdTNrMm1wR2lC?=
 =?utf-8?B?YW9iUFhVMVA4bVFzOENNSWRtWFZkME5pem5ERDNYZEQzTVkvVzNLd3l2MTVD?=
 =?utf-8?B?WDRoNXZwT0lrWTRsMjlJUThyTTFkc2FnM0xlclpMNnV1VTA0OUpsWEFVYzRX?=
 =?utf-8?B?bTFWaXFkUzVkZGpiVWRMNFdJektCMytPcFVZSjRTazczN2FYdXNaSlNNZ29M?=
 =?utf-8?B?b0RXQUNzTDg1SzM5VlNBUDl3YTFwVnlxTVNMd3V5WHBQdlVsSUd0YXRGeDdm?=
 =?utf-8?B?UzNYd1hFTjFGWXRLbGNJbW9Lc3hXUkFmNXRpZDlIeDMzakNQK1YzWDdVd0l1?=
 =?utf-8?B?eTRoSllseVdLMTljcGxXRUh5cmZZYm1NU2VBaXQ0KzZrRmpzVkFUVkZla2Vm?=
 =?utf-8?B?S3NLM2xBME1QSENrRjR5WVZ6eVBGdGxIcW41d1FyUXcvL2dUVFkrNzRqZXcr?=
 =?utf-8?B?VmgzMzJPRERYWDc3RmRuZllIL1haZXlxV0Npb1pmQ2NMSDRGSTdZWkllTGN2?=
 =?utf-8?B?ZkpNcFhhUlc5eXh1ZjFEczBtZ0Y4Lzhsc0xoNWVqajJwcWRVNWpGSHc5UmRz?=
 =?utf-8?B?eC83dDhPVmNISEcvdW1LQnRBVndvZ2RvYXd6MkNaR0U2Q3pKUGRRRCtzQWd6?=
 =?utf-8?B?cU5pOGUxVkhRK09GdXUxMU5odDNhdUhzcy9UUTJFYmVUTEdJYVhIWkRoYjBo?=
 =?utf-8?B?YjBOd3h5Q0FHOU1mNnlKRWNBL3dnaGYyWitpSDY3MDYvTUdUUzZPUW1oVEp0?=
 =?utf-8?B?MGR6SC9FNDZ1RHJKbzEzVjJkMjBFa1dUQ1hGUENNS3FaMnJidi92dFNPMVNu?=
 =?utf-8?B?VnlPNk40TFN2VVhRb0xHSXlqOHNLcVlEQUVzaHpYSVphQzJnNDNSbjdPYXBX?=
 =?utf-8?B?bGlJWVhvWWMycEJOcDE0SG1xU2p3Qit6cDJEMEozQlBZOXFZbGh3VXB4S3pZ?=
 =?utf-8?B?UDVLTDUrVXFVK1VUdDR3SWp3VFNRN3ZKK0xsUFhxTDRST1ZsbmcyTVVYT1F4?=
 =?utf-8?B?aUV2WE5wL2tpb0VkRkt5S3hBbXVQY0Nnei9NeVBvMFQyNEE0bGZWOUJRZjdU?=
 =?utf-8?B?VTRQY2JGUnNJOStvanF5aGhxR3JZcjU5NWh3bis3TFdZRXdMdmRRNHQ5Rmt0?=
 =?utf-8?B?OVVqcTlLTDY0aTY1SnBlV3VxOWk2bW12c1JxSVl1YWt2UWtEbzQxS1Q1VWNw?=
 =?utf-8?B?UFNjSDZXVndLNnFPMXFEbkZEM21oZTlFSWw1cTFQNjFmdXdtM0hlWXRkOFFG?=
 =?utf-8?B?V2I3ZURlSFdvL09nemhBZXdmSlpFd1dkVElXdFR6cVk2dDBIWUtRNm50bzFB?=
 =?utf-8?B?ckM3TW1SQ0RxVVplaXRyRXl3d04zb3FnN1hDZ2oxa0ltM1NEUVBiN05xekJk?=
 =?utf-8?B?VmpOOW5ZZGlUZ3RLMHJSclBZY1FpMWlnbnpmOVgyYVdlRHRFKzZxb0hPb2FE?=
 =?utf-8?B?bnFuKzFuczQwekFNRXB0NkdCTEhqRkZBeEx4Vzd2dnZvbks0WmZ0Yk5sOFl2?=
 =?utf-8?B?MnIrc2tHelZrVUduNjRlWEVGSDhLRG5Uenl0NllPSk9XNWR4MCtibDBxYWUz?=
 =?utf-8?Q?WBmCxOFkXm1szCZ1+aM557SUf?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e03e8aa4-3ecf-44d1-b651-08dde386489c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 03:20:03.9405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2eYvr/ixycj1vwVJMQvliYIum+Jp18FY0ww+LNbcLxQjP2ORs/NZeFztVtWJ3NVecCuSh5cJxC9WLXoqTZiicKll2q2EmgyLEWRxKNHIMmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_202029_166866_0448EBD2 
X-CRM114-Status: GOOD (  22.40  )
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

> On 24.08.25 03:33, E Shattow wrote: 
> On 8/21/25 03:09, Hal Feng wrote:
> > VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S SoC.
> >
> > Board features:
> > - JH7110S SoC
> > - 2/4/8 GiB LPDDR4 DRAM
> > - AXP15060 PMIC
> > - 40 pin GPIO header
> > - 1x USB 3.0 host port
> > - 3x USB 2.0 host port
> > - 1x M.2 M-Key (size: 2242)
> > - 1x MicroSD slot (optional non-removable eMMC)
> > - 1x QSPI Flash
> > - 1x I2C EEPROM
> > - 1x 1Gbps Ethernet port
> > - SDIO-based Wi-Fi & UART-based Bluetooth
> > - 1x HDMI port
> > - 1x 2-lane DSI
> > - 1x 2-lane CSI
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/Makefile         |   2 +
> >  .../jh7110s-starfive-visionfive-2-lite.dts    | 152 ++++++++++++++++++
> >  2 files changed, 154 insertions(+)
> >  create mode 100644
> > arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
> >
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile
> > b/arch/riscv/boot/dts/starfive/Makefile
> > index b3bb12f78e7d..7265c363e2a9 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -13,3 +13,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-
> mars.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> > +
> > +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110s-starfive-visionfive-2-lite.dtb
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
> > b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
> > new file mode 100644
> > index 000000000000..a0cb9912eb80
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.
> > +++ dts
> > @@ -0,0 +1,152 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>  */
> > +
> > +/dts-v1/;
> > +#include "jh7110-common.dtsi"
> > +
> > +/ {
> > +	model = "StarFive VisionFive 2 Lite";
> > +	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s"; };
> > +
> > +&cpu_opp {
> > +	opp-312500000 {
> > +		opp-hz = /bits/ 64 <312500000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-417000000 {
> > +		opp-hz = /bits/ 64 <417000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-625000000 {
> > +		opp-hz = /bits/ 64 <625000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1250000000 {
> > +		opp-hz = /bits/ 64 <1250000000>;
> > +		opp-microvolt = <1000000>;
> > +	};
> > +};
> > +
> > +&gmac0 {
> > +	starfive,tx-use-rgmii-clk;
> > +	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> > +	assigned-clock-parents = <&aoncrg
> JH7110_AONCLK_GMAC0_RMII_RTX>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +	bus-width = <4>;
> > +	no-sdio;
> > +	no-mmc;
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_HIGH>;
> > +	disable-wp;
> > +	cap-sd-highspeed;
> > +};
> > +
> > +&mmc1 {
> > +	max-frequency = <50000000>;
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +};
> > +
> > +&pcie1 {
> > +	enable-gpios = <&sysgpio 27 GPIO_ACTIVE_HIGH>;
> > +	status = "okay";
> > +};
> > +
> > +&phy0 {
> > +	motorcomm,tx-clk-adj-enabled;
> > +	motorcomm,tx-clk-100-inverted;
> > +	motorcomm,tx-clk-1000-inverted;
> > +	motorcomm,rx-clk-drv-microamp = <3970>;
> > +	motorcomm,rx-data-drv-microamp = <2910>;
> > +	rx-internal-delay-ps = <1500>;
> > +	tx-internal-delay-ps = <1500>;
> > +};
> > +
> > +&pwm {
> > +	status = "okay";
> > +};
> > +
> > +&spi0 {
> > +	status = "okay";
> > +};
> > +
> > +&syscrg {
> > +	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>,
> > +<1250000000>; };
> 
> Circling back to a topic where I don't understand CPU clocks in hardware
> design, but I have questions, I would want to see 8 divisions instead of
> 4 divisions (for both JH7110S and for JH7110). Similar for JH7110S here as:
> 
> &syscrg {
> 	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>,
> <2500000000>; };
> 
> and then in above &cpu_opp as:
> 
> &cpu_opp {
> 	opp-312500000 {
> 		opp-hz = /bits/ 64 <312500000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-357000000 {
> 		opp-hz = /bits/ 64 <357000000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-417000000 {
> 		opp-hz = /bits/ 64 <417000000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-500000000 {
> 		opp-hz = /bits/ 64 <500000000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-625000000 {
> 		opp-hz = /bits/ 64 <625000000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-833000000 {
> 		opp-hz = /bits/ 64 <833000000>;
> 		opp-microvolt = <800000>;
> 	};
> 	opp-1250000000 {
> 		opp-hz = /bits/ 64 <1250000000>;
> 		opp-microvolt = <1000000>;
> 	};
> 
> 	/* avoid division=1 2.5GHz omitted here, not supported by CPU */ };
> 
> What prevents this functionality I am asking about?  Specifically on
> JH7110 the promotional block diagrams show 3.0GHz maximum (?  I think?
> not sure but what else could this be?) so if that is true why do we not divide
> down from that, avoiding divisions that are problematic?

It is a good idea and I tested your code successfully on VF2 Lite.
But we have not done stress tests for this and I am not sure whether it will break the chip stability.
Anyway, it is a good suggestion and more tests should be run later.

Best regards,
Hal

> > +
> > +&sysgpio {
> > +	uart1_pins: uart1-0 {
> > +		tx-pins {
> > +			pinmux = <GPIOMUX(22, GPOUT_SYS_UART1_TX,
> > +					      GPOEN_ENABLE,
> > +					      GPI_NONE)>;
> > +			bias-disable;
> > +			drive-strength = <12>;
> > +			input-disable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +
> > +		rx-pins {
> > +			pinmux = <GPIOMUX(23, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_UART1_RX)>;
> > +			bias-pull-up;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +			input-schmitt-enable;
> > +			slew-rate = <0>;
> > +		};
> > +
> > +		cts-pins {
> > +			pinmux = <GPIOMUX(24, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_UART1_CTS)>;
> > +			input-enable;
> > +		};
> > +
> > +		rts-pins {
> > +			pinmux = <GPIOMUX(25, GPOUT_SYS_UART1_RTS,
> > +					      GPOEN_ENABLE,
> > +					      GPI_NONE)>;
> > +			input-enable;
> > +		};
> > +	};
> > +
> > +	usb0_pins: usb0-0 {
> > +		power-pins {
> > +			pinmux = <GPIOMUX(26, GPOUT_HIGH,
> > +					      GPOEN_ENABLE,
> > +					      GPI_NONE)>;
> > +			input-disable;
> > +		};
> > +	};
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart1_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&usb0 {
> > +	dr_mode = "host";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&usb0_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&usb_cdns3 {
> > +	phys = <&usbphy0>, <&pciephy0>;
> > +	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy"; };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
