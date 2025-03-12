Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BCDC28B30
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJGvulOp88S2EEZogXCiestIaTU80CjO/VZ4DnhIhoM=; b=DdsAs7ZlMvgfEc
	t8WmQXZmBWzpAC7LLd09JeIEtsnCzACObQmtcxHwyPc3tFssFo0e5h/TByXBbfD+qUv9jVvB6OYFO
	hZaNXEOys6/AxSj231Wz1fDx8PnzDY4Jec1n58l5HZS+JIDSV3DO0VlMLHeSqgB+VPPhDhazUkwD8
	MsqB/inPORa7j3EXUL6V4+npjzPmsawg09krEMCKuuCPDeW2C+3QxKT9Fdsel50QdhNmZEpByqgjF
	sQlg/fJt6A9bToz5tWlu9TcHPhVged3+f/5q/jTjA9t2w0+H4PO90OmL8Bh4nLVVpsoVUw3czbscN
	xZmAkaIt2a2G6/nrHmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMao-00000008dSt-35gh;
	Wed, 12 Mar 2025 13:57:54 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMUT-00000008cXR-24am
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:51:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO1Cx8srWzeYqZ5PdYYM/xyt9ql8TpfsHyh5pmCxKN3/rc+YjgiyDnI0lX4xd3Zf4pqT1MbLPZUwSOBHiaWT8gkyszCTm+7cIaHvmb1+yCXfCVC2xcfGbXlTud8qXagn1IBaEX/gNT1vAPYkBMcp+xSDVcEg9MXfaaKQpPPL5agjzMsy5c7xZl7euipfRqcB3S8/0vAVKB6UVeamDi4uRdWLbr5bRlUE5HdJL6FeFsYB8a+RFXCZjLXA1pIqBWqaJjyHFZhfnJYRFpWTYzyP0Tco2mYSfL1tUvsibOqp2eiVjM8OyfJRS/hj5VZbOyjkhyAt5Hc9lyJaCxT8kYG+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZDXHa588REJYZZ0etWgTVzel/Qcgm/mi7cwdpnFzig=;
 b=rZ1cncbKqbjK+M6WoIGYHRYP7nPnkRbsgxouZmP65W+7zfjTtnK6si2UIIDKeHi3R0kbg4Y3GHyXxsPmPVh9lgRJwu8caD4dQD7EEnJLIcZ/OE5X0WtQ2qwvt0Yb41ZPruHaUygnZ8XCrFZdZL5Y3vQThB/kKKtbEPdPq5WtlwN0Z3cpcjvBoDgogoJgI9TL/nqs/wtE2G1mGWW19nOdysOUgw0PvX2PX63KiMCH0iGNEAyGL9YAkG64DUIZiZNUaD7heZvRZsRvJ27JuVfXvFLYiBA7p+c/e8+T0j8FcGQ6p9s/1qusOCvvghSTEW3+yRwD1d1SD0Dp+NzVr9XqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZDXHa588REJYZZ0etWgTVzel/Qcgm/mi7cwdpnFzig=;
 b=VAoj/0yJAoDWQEg9jxJKligyawbCoNgLFz2hHmKtF9BXauC/NMeY//+GKTamkW/dsfuTwBYXftQ96k/fenwyh3K5e6RmJcT34xDyec1xRgQ5ZETmOLkKAecTMnV0OP9qoJ/XoP9eyTRmMYuM5GLtKa/FXnIrvqE6DVPL17npaD0=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by SJ0PR04MB7264.namprd04.prod.outlook.com (2603:10b6:a03:29f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 13:51:16 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:51:16 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
	<linmin@eswincomputing.com>, Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin
	<peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel
	<anup@brainfault.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [External] Re: [PATCH 05/10] dt-bindings: cache: sifive,ccache0:
 Add ESWIN EIC7700 SoC compatibility
Thread-Topic: [External] Re: [PATCH 05/10] dt-bindings: cache: sifive,ccache0:
 Add ESWIN EIC7700 SoC compatibility
Thread-Index: AQHbklgUI52WuiKVD0qXhSjQZAnMI7NuPWWAgAFJjRA=
Date: Wed, 12 Mar 2025 13:51:15 +0000
Message-ID: <SA3PR04MB8931F7B7CFE0642F3C71692B83D02@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-6-pinkesh.vaghela@einfochips.com>
 <20250311-exposure-relive-f33873964914@spud>
In-Reply-To: <20250311-exposure-relive-f33873964914@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=6c719647-5c2b-4a29-90b9-a0194eeef59e;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-03-12T13:40:36Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|SJ0PR04MB7264:EE_
x-ms-office365-filtering-correlation-id: 9e52bd12-d6b7-4592-ee18-08dd616cf586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?RS/a0zRX0e4P/wfaDRPBR9E2fTiYkd/oJVG0Av99ZbzBjyZUlGjFMcJs15CY?=
 =?us-ascii?Q?BCXETXkcnWFZTwdMxmsuxC0rRtJtJPTzlpNunnYl7DZUUujf8uX9x4e0f4AT?=
 =?us-ascii?Q?Hic2PQUYgCYlVtqCO6DsSwLWiT/mh/6ampAWlntEbmOcEc0xZ2oUYwV6f9cv?=
 =?us-ascii?Q?jEc+Xu4IkU05vbubvqWc6krRV+ZcM9N5AXGehtw1ELM1tb6du0dw0irC7LR1?=
 =?us-ascii?Q?dsJGht3rn0EJb6rlkNYpveX1fHhQ/WihA/M0hiZjzKy4noRMSPYmonStEBkq?=
 =?us-ascii?Q?tGHfOknePd/lUMJ4q6GZogURRCcs5+vaXeu1h+xEhz0swYZqiazdBt0z02hl?=
 =?us-ascii?Q?dzKYcK/37pjo+gogugpdwBxGPVQoMkS2kjgDwIOPa9PkSDaEpVZ3/sBQN/E6?=
 =?us-ascii?Q?trSm7Hc6gBCxGoqvXx6XsvirMyC58ySjQzxmKgKqC6nn7z98Y7r46dUgZ/R2?=
 =?us-ascii?Q?T+6FaBTkgkPADW3OjOebH/nRofJwKabgs0rPPl1z7qAteXeabufSFokTEqtr?=
 =?us-ascii?Q?IZIZFLz27FSc/VIXv3oIebkuh/d57Y8RcLB3it/S+JYWGQAfXQUkF0fKpTCh?=
 =?us-ascii?Q?SDz0hETOzwXycA27GQt6RiHiKTzqJaz5hu2Msv1PDCSZ6q5D+BckrrpmulWT?=
 =?us-ascii?Q?ZIhPL1voBx8SXHSu/VEa/ImHsSji6Mz2M2fGUKWTfyBsKxQKH1VQNax3jJ5/?=
 =?us-ascii?Q?0JrmHjSrpgAhHn94pTaWGTsQM1FFz17RCXBnVDmAARnKLE1dlSQQGOIbAej1?=
 =?us-ascii?Q?Ci7lqZK/bpoJkxMEE1IsW4FTkvOYFxaT+hNL+PtJQj+5viVFEkcFczdOFn/B?=
 =?us-ascii?Q?vi18kMATy/AvLDDWJwM4yAQRysdXknx2nhvIH/yGqnrkXBZR/mGl9+qz4p8E?=
 =?us-ascii?Q?dthS5nywuNQ07CajjQnbRvfnDUJqsjh4WKC/ekx6ndZApDZbbvXjeRdR/Xb6?=
 =?us-ascii?Q?+Z3qdjixpMf7l6huk0AxbZnxuwNEvrH4lm0xzSdJl6GzFLcfg7DXrnze0MnL?=
 =?us-ascii?Q?XwD96Ijw0Fg8muOkN1KfIDt+a60VEuZkVALY+mZ8hn5xdRDApUqs37p0NSvn?=
 =?us-ascii?Q?kW5odV2fnZDhNoZPFJ7/yrzs23kZeXwxKnGH9+2CxvhRPMO8T6imtmuJC2qj?=
 =?us-ascii?Q?ZpgZ98vbHMlwzL+EC8Z4SOc1SrQT+I9PJvMXWpeRFQvl/G0sgfOg3JuHNGPy?=
 =?us-ascii?Q?LtZcc7sFdAOSxSBMnJ/H8NraXjkwtt78zybhBq64SLl9OshYxhJ3UVnkUzPb?=
 =?us-ascii?Q?LBpNBkxQKLypMBnod7RQDMbsAQVt70b5cn/lnY9Q01qSBLc3JiV9J9WuBrAK?=
 =?us-ascii?Q?raQi0ZDFH57ZthLb+QxFnejCnO1+bxWbTqoPR5w3yIhX4vWkTk2YQ7p5qmga?=
 =?us-ascii?Q?NaRKb0flKl5tywVYweY3/EpVMcs1PSPwLeY4FR6l2hAjKK3Faao1DDd6aD4i?=
 =?us-ascii?Q?FbaP52rUR3k1XJUQiX1NPKx3mI8vSgdR?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bpDvmkHEpiBPsCmbwm47RQXKOgMziaBAw0tjF5+IgYGhdb19bZHmLPgK6lbh?=
 =?us-ascii?Q?AykVwzTyw5Ystvgk+Hxp3+vWHMWeqwnJEwBRU3jqD4Lupz4TkkJ2KRfMzCZX?=
 =?us-ascii?Q?ZQ+cuH5D24kr1V1JfzBaJE+kx0Y2iOsFdPv6EpqfM1W8Eu41odAo3J+pOskP?=
 =?us-ascii?Q?5fy3Z9CfQiV8v4OFSyQugegDbEIBfGK/AaNGmUHfIHNL6zonDsd43yXvm1kn?=
 =?us-ascii?Q?gtHH6uQw5OSHPlGlyfgxGAKwGakM2x0t6jisN7OuuSL+RAltppSUAp7LzulW?=
 =?us-ascii?Q?WUzRhAoOZyzSq7frIjjQF4jh2zl5lJGKX+QXYpHtuuuZojSnR9bJV6Nnepw2?=
 =?us-ascii?Q?DdoAWugLwpU8ImTymsPQQEOiKmRBx/eXSELUemdxP9cpRqnIbApAGnw6VwY0?=
 =?us-ascii?Q?mH0oKe8xtXFoVd9x/3Mue5/xWzZnmTMCdjMcK/G8xpz+07s2BSe2jyIg+2+H?=
 =?us-ascii?Q?ruDvcuIUWK286+A45D1DoRQMA5MTYjFDqIFSvNU5WTyc8JDMJ54rzMrOCIbD?=
 =?us-ascii?Q?A0FTzZY5Q6HsGd90Urvz9tFC7FL+eEbuUW89ZjIQbgOzo6rJQR/rnSoKRZhM?=
 =?us-ascii?Q?ZuGj2SYNZTp625yEFEbsKVJwjuPVUCtxP0BLobEdMBs8SAkSITwkuiI4XRFA?=
 =?us-ascii?Q?1v5v059Mc7D79Z6mrNVYjhOu67XFStOYS/TlGU5pyXDykhrWOxNWRTTEBryT?=
 =?us-ascii?Q?1TBAQLVlrRy9iEau38NMGDq4knrMe8vXHJr8spQ8APnW1uc5PA6m+wXhHPHr?=
 =?us-ascii?Q?Muo9309hwW1yREXtRnzwf1ywo7EOQ6Bhvjnb3zXTRDd2Q8YLM88ENcpZpwS6?=
 =?us-ascii?Q?UgrTnBc8WJl+pAnB+5IrBxU+zRmVHUe3+rgKy6j3tVFYpqMHgXrvOtbTARsE?=
 =?us-ascii?Q?k4NRuipR6MnpONmOhKceGoLfUrCgmzFVNBAmxxz7gaVaSyZXQXMt0bsZskZD?=
 =?us-ascii?Q?zM31N954+kIl0CtnnK8QG959hzIrQenfHSesU9IiHmjSl6gxx1Dxf9rT2aPi?=
 =?us-ascii?Q?WNshcxz21R4JhsMMCAXMGhBZnIHa2lnw0ADMg7r76rafSK0IlE2NlMHawYRS?=
 =?us-ascii?Q?fMsvW1vqcZNBKQni+mlL4+uy+wZv4VpuzZQBzk9PdNdwZFdKb2afAyQNLdpe?=
 =?us-ascii?Q?XckxwBVbIc58CGpmKJo2OBPe+PdI9QDvX/ZAFnDHs4d7EHyd312X/nvBwUu4?=
 =?us-ascii?Q?zZ59JdtphA3IAkfq126Kn4Jj+HTPyrb0n7mlpHlwK87tWCiB8ZdNkn65nxYH?=
 =?us-ascii?Q?OhYuRumO9eADWNAwluNCcyFTxSW+5fpPBBliL3K75O/uh9YU0zb7LKk97yev?=
 =?us-ascii?Q?0VFtWBGB+qSIMthVoAbgvYihq7sUNubRfBDS744u4yjF/HS9c5OccrNqIE3D?=
 =?us-ascii?Q?2hqd3M+boeSJsMsAPeJDJrz1QY00rHI14iTQ+c9evgLpSZ8+A8973KtmY0Me?=
 =?us-ascii?Q?2O1gHZtYcCZL9nEC9NP0yyV+O9EPgw1778EH36ET9FKfHs/7EIO1RQYJARYP?=
 =?us-ascii?Q?o+HOoSTkvKOiylnV0D0pJCOuQvET2E19eOdFW8092aFawoXPNZcYRi/9BoT2?=
 =?us-ascii?Q?wvlrkfvypyNG8+jygTCLiq7SgkcENpPiBYcJ6oXkp00FWtUfQTWKaQ+vUh2r?=
 =?us-ascii?Q?Cg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e52bd12-d6b7-4592-ee18-08dd616cf586
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 13:51:15.9583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0dzzTCNPeyKKm+2cnRmmRdQAr7t8/F5pNAhI5PPBhv+GbSXitI2LyjzD4RioqHA9u58RLhqfirB/uOjBBygLzhGnD3CLxW/0iq7IMc1IaJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_065121_556729_9D47FBDD 
X-CRM114-Status: GOOD (  19.25  )
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


Hi Conor,

On Tue, Mar 11, 2025 at 06:11:43PM +0530, Conor Dooley wrote: 
> On Tue, Mar 11, 2025 at 01:04:27PM +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > This cache controller is also used on the ESWIN EIC7700 SoC.
> > However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
> > So add dedicated compatible string for it.
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../bindings/cache/sifive,ccache0.yaml        | 28 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > index 7e8cebe21584..11e9df2cd153 100644
> > --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > @@ -39,6 +39,7 @@ properties:
> >            - const: cache
> >        - items:
> >            - enum:
> > +              - eswin,eic7700-l3-cache
> >                - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache
> >            - const: sifive,ccache0
> > @@ -55,10 +56,10 @@ properties:
> >      enum: [2, 3]
> >
> >    cache-sets:
> > -    enum: [1024, 2048]
> > +    enum: [1024, 2048, 4096]
> >
> >    cache-size:
> > -    const: 2097152
> > +    enum: [2097152, 4194304]
> 
> Making this an enum makes either value permitted on each SoC. Can you add
> cache-size restrictions to the if statements below to keep it restricted to the
> correct value please?
> 
> Cheers,
> Conor.

Thanks for the feedback. I will address this in v2.

Regards,
Pinkesh

> 
> >
> >    cache-unified: true
> >
> > @@ -89,6 +90,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - eswin,eic7700-l3-cache
> >                - sifive,fu740-c000-ccache
> >                - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache @@ -122,11 +124,31 @@ allOf:
> >          cache-sets:
> >            const: 2048
> >
> > -    else:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,mpfs-ccache
> > +              - sifive,fu540-c000-ccache
> > +
> > +    then:
> >        properties:
> >          cache-sets:
> >            const: 1024
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - eswin,eic7700-l3-cache
> > +
> > +    then:
> > +      properties:
> > +        cache-sets:
> > +          const: 4096
> > +
> >    - if:
> >        properties:
> >          compatible:
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
