Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1AACD343E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg5c6mamGa6cazX2ZGOsQqTLlFQ7Rzs6q3mQ99oPqw0=; b=yE5O/f9uUM2NL1
	w6mXvLYIMFpc4ZjOASdXfRbRGBskpuWUQiXLz2kNSNUPmKzoADbnZJWSb1UNZhQhy5xD/jPpMCHZP
	0LBJSLW2uR+69C1IwF4wqmxrw/L52GH1oorGKCZ/hY6y5uNKT6uzHFcgjwIX6MUrD0J5n7x5scYqX
	UMWx0opSuX6v6QLp3j300f+/+caxYLHto+fi/UVfLyflOnNkK5+3VraMxJrn9NLTyQQT6lBoO8JCa
	NYRZ9aC0yK6ODY1d1skN0X7OSMTurYSAxEzzww4liFXyT0Yrdr0LwGehHnrVQ0Z++URzb5mf9Bazt
	aDQy3q3Vx/5ZfR0Qg0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCev-0000000FkTf-1nU6;
	Tue, 05 May 2026 10:05:45 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCeq-0000000FkQC-3sW6;
	Tue, 05 May 2026 10:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yjaj4QIImRPS+jmYPy115uiJoy0IwI9AosQSvi+2pA4eMrS2sw2sKgsInzsZZ+Y0WHW9PdJrntxHQEpmpa8ptb86KbmU3LuLjJxReG0H6Ft1nKR2OXE3uVDA9T/XbVwfJR9olz6ncpX6FKHizh9kRoI/Yt15QhyjX/AIJOAazuPEbDXkBqbpjHZZ2HJRJ0HsjvZdD7149XZmqn43TGJZEfJAl9RML9xmKw3RLdPcdqIlB51C/poIvVW4PzVNEkP7UrZIi9UP/0q5zc6963f5W5DugV+jpnEp1XBEYU3+hrF2cw3Qn//5Te5eNtb2jjCpmLGFcs+WuikV8z+7PqXXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgvdQDNjHvv/zsrLcjoCqZz5W4uogTGw4FSj0SzBEkY=;
 b=v88fmhrtW149Wx0IAJJB0BgC4eu1UyrjoIKK6oavX4RzfNASrBcksYmEk1NkkJ+lbPtIVfF6Jnpe69LftBFJN3rX2wfVgkDucHkoueva1z5Kr2JRQaKGdRpPPwCNrkRhUOY6ME/I+5/KNxQ+d4gwdYRJTtSelVM5sIu7q7VuSE5Dup9ca1uxcrW7zdSsBbQM9sXwqQxVeprcI7IrkBVQdzzfEqbRjVVS8EDsxTClFFRw83bBwcsKmNPc5mOKilyYqKasaOaMTS+6Miu18qnlutJssjlnz7nO1sRlX+MT86uWfjpYREjdjfx6IIPoDjRjDI+PkWMYXFZNUlVvTYUsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgvdQDNjHvv/zsrLcjoCqZz5W4uogTGw4FSj0SzBEkY=;
 b=BiDZx0QhBm+caMA4ybmL8pGn74os8MS2h0l3VgrZg2o63HmovDa5bz551wx4bfCT+Th/hJsNyKE/wPZaM6KY+YjiudhWH4mC9cztibPg1y18F9LTwbX/BOqa7f0yAyjiZK77FKUc0CO9JZdij/iqK6ndBflPFhqCDa85XeR3XISil5bGVwqb6sVaCh1MagiKXpR0wthCnEW8H4dH/mX2FL7cL6TedHASfcIoU0QI5Y633xDGX9dtUCGOvQh3WRsLss7Y2LM/bqaoUXQ2m2JltWeIggvN2JIzwUfdki/ZOhU4gHeesHfJ80vhYNYhQ5h21cU6BoTcr6X6sgV0URDjEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PA1PR04MB11083.eurprd04.prod.outlook.com (2603:10a6:102:484::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:05:33 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:05:33 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manikandan K Pillai <mpillai@cadence.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v8 phy-next 01/31] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
Date: Tue,  5 May 2026 13:04:53 +0300
Message-Id: <20260505100523.1922388-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AS4P189CA0054.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::18) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PA1PR04MB11083:EE_
X-MS-Office365-Filtering-Correlation-Id: 450bf4aa-a2a4-4339-4d3b-08deaa8dd88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 105wNgbdpicT4f2b89LnMCTcdnd1q3oavkS1xKQO9VaEZzAi2cRP5Q9ftUvmmoJhebuOnPsLvS/m0j/zblucoE1bq+tZGWU3X0u/gqm9nzrUD/GEdtykY45GxR2x+qtk4H6J4BIusB4BgA9esr1z+nwqCdooL1VHCe1uL0nFldcTURUpt3yHXIQ5B9Rj4nqpiP/1xY3GMb8XeBfkg/gBNhqkbNDhFZkBxpQgM1KzIFBhfWyOMqkeHGHGu541mN7z/ZNszkvqgR64o+a1czK782ld8qO4S2qWznt1S6WGKxjgcPZIc51Z7ftQojPvfTlFQyBk1um3M8W6+lmw/bSEd4UPNz12dwkOOmZgenuxMu+6bMZbbNYgOjYRoigo04D2A4yog73uCa7qnmnhd5GEQUMxul5ePtGCBvreldRdF/dvydGWJ73ljQyTVPfA4b35FLjeSZbvIoffeuCDOmz/rbKYa7l3H0sZoO9Y5p9xPpRDxK4UYPUR+z+VyyZEm1YGb0npn1Hd6V/dLQjoPRzL4M6XD0/7xRnai+RQs1JJHZhlVse0eyGpPqSPPZddEKzH5bPQ4lvDIQHdnCp6jt5S2iDJQ5cSvAfoAF4cDak4rq051dOhNsW7Cpi2TEoEC19m3k5JqZLCmhEZ64S9J3CCkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhWbndWR2J6WVpKdnA1cUI5TnpMSEdLOCswbCsxMFZraisySURqVUNKY0tK?=
 =?utf-8?B?T1kzdE1tR2JhcTkxYk4ySzFTQUV4eVpyM2xmQm1adm1VTkt6SklDK1RXSTNl?=
 =?utf-8?B?QUdVeURIZmxCcDRCSitJY05OV2lkbEcyZUVSbzBUTDVzV21jSHdFbEhVdFF0?=
 =?utf-8?B?eGQ0MFQ2dzlUL2tobllPVDZWVjVhOUtyc1dUYWZqcmdHMm1KMEswOVgvcmRM?=
 =?utf-8?B?L3F1TjRCQnlIZmJKNytaMzFYdEVrT1ZZeEVnemNMMzBGY1l5R0RjWGVtenly?=
 =?utf-8?B?VHRyQkVuODZudGV6M2RockdsdUdiRWtvWVNDOTlxa09sbXlIT3l4SXRjMWsv?=
 =?utf-8?B?ZWwrK1dpTUhyZEdsNm1wRWZUTmpBVHI0V00xeDVudDFQK2EyWHlCU1lVZDBK?=
 =?utf-8?B?eG1KanlrY21hWnJDZWZKZE1jOWdHbUZ2c1RlMWZVU0pxeHhzN1Fnblc1TlJl?=
 =?utf-8?B?STlYWVVuLzlITzZ3Vm12UkJSUy9EVzFhUEVzdm81Wjg0YTJVK2RnTUlabTU1?=
 =?utf-8?B?d0I2OUpRMjYxbzRjVFlSdVJFUmEzd1oxaFU0WVhlWTZndzVSbTJqaXNtVXNQ?=
 =?utf-8?B?ckNwL2pDalhLNUhQK1Q4TXpaUG1yUVlZMW5xYjI5bzJDS1ZGeEoraC91WXRK?=
 =?utf-8?B?L3FpbE1UTEhuVEhRckdaelI5cnZCSFRhYXA4Z0VGZmhKV2I1RXNkM2tHUUJY?=
 =?utf-8?B?aG5BVXltRERlRjFKZGJRVEM3R1RSYTdaTC9QMkFSYmlONHNUNGQ0VW83MmFG?=
 =?utf-8?B?d2lBZkpacW5BWW9JR3lwczdrdmFuYTE4Vmp4YTdUZ0tnVnlkcFhDL0U2dHpJ?=
 =?utf-8?B?T2dPdVhCeTlTZEYzNENWL0NwWmt3bjFHOFZxNEtJN0tEaGtpUEIzbmFrVVYw?=
 =?utf-8?B?cFdYR3ZjdFlJUkJDbDJPaHNkcDU0R1dPeDc3cHZHYUUweXM2TG1sUzBqWUtz?=
 =?utf-8?B?d0RWMVRJUWpQK0dQTEw5M3FvbzBVdDBOb0luVDM1eHNOY1RuelIzTGlEN1Y5?=
 =?utf-8?B?WktUbDcvUWtmUDlya2x3OVR5a3RHNUZjY3R1NlRQcEJmQlJtcXNocUZIdVBt?=
 =?utf-8?B?Ty81VXExTnpIWk1aK1NmTm4zSnM2TlJSQk5HeXV2T0FkVldFdE95TWRMaXd0?=
 =?utf-8?B?T1hCZHE3R3ZnM0JLMnVMZWpRLzhkTlN1ZjZiaDVTbzRJTHhUVTVncGQySUNn?=
 =?utf-8?B?eFZuTWZmSVA1ZldINWlDT0ZwNW4rbUdUN1VpS0hzSTMzRzNTejdQL0UwTEFp?=
 =?utf-8?B?T05KMXNoRHZFcmd4SU5PdHB4eW5FVUduMTJQc1FoOEtHdUYwaHZ6MDVNOThu?=
 =?utf-8?B?dWh0T2RZcHpBbG9uU2JCYXlMd1lTL016V0dZT0tGZDlRbGRPUVlwWUkvUWZH?=
 =?utf-8?B?ZTdVQTZaOVYxZG02SUlIM2VHTmhuT3RiRFhLVTFGc0NiSW9nOWdlTnNvcmVO?=
 =?utf-8?B?WWNKSXQrOVZDM0NtQklyaWVoSmFPV2h1NlFhVitxczIxZGVTY3N0eWlOaWpC?=
 =?utf-8?B?a1B6RVMweWp2RWE4RDVFTXFpZDIrYTJtY1ZiMTBFNWUvL2hxQnNBME9iKy9Q?=
 =?utf-8?B?d05pczBXWGZzZGZIdlovSDJuRldoNjdNUTZSb0dRaytJRGw3TzBlZHpGU0lU?=
 =?utf-8?B?aEJDRnFwdnFoMVA4Vi9PTjE2TjZ2OWdRTGZzRWRRVkdpbEwwSTZ2MXg1U09v?=
 =?utf-8?B?ZXRrWnlGQ1RMODViakMwOStTejdsMFVoNGFnWHE3U2FTUmpROCtWZGxjRVIy?=
 =?utf-8?B?UVJmR2pEQXNlOWh0N1psM05zR2xvSjJPT0tHS3NNUmZPVjdRalNnbGErWjJy?=
 =?utf-8?B?ZVJub0FSTjV5STM0T0svZStBTmh6VXdUNmV4UDFvMnpsTTZUSXk2Nk8wY1Zh?=
 =?utf-8?B?OTVkQzB5eEh5MitGWVZnbkgxUGJVSFRFNXhtMzlaTnN2Q2huYThFVFFOWm9P?=
 =?utf-8?B?SW1TNStPNE9JQzhSSjJVcDh0YW80YWE1ajNkd0ZHMUpGSHJBNkV5WkpFbERv?=
 =?utf-8?B?K2FzMEZQUDB1bFlDRkxRVkExSURLVnNnWVZUZ1JXcTJTMjNta0s0NHBqZzZD?=
 =?utf-8?B?c0t6VzRjaUEvQXZqaUkwQUw3VzRCR1JDR2NDUVJjSTRkb0FKYjJuY0VlcE02?=
 =?utf-8?B?Z3lkUlFiYVp5bEdWNGxvUExkY0UxQmtKb2Nkd0Z2aFBKQ0JQKzlYVmcvNVBJ?=
 =?utf-8?B?Y2tMWXVMNDR1ak5lS3g0TlhhOEw2NVNDYUZpT3gxdzhaVEpzQk1QK0FwMnMr?=
 =?utf-8?B?MnBEYUxoeFFjZ0ovM3gyRlg3UDNYWVUvWDZodmMrNEtmTGJScXdtRW5wZGNZ?=
 =?utf-8?B?UlBreXpOdlBaa2FCZnZURDFGWGJab3lGclE1d3ppKzh1TW1MQ2UzZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450bf4aa-a2a4-4339-4d3b-08deaa8dd88b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:05:33.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7I834rn8G2VHkN2OXvP0Zt86b/FZ12h8ktzk+GjOyLVyl5+rBES8wnBDLiT3tpYQOyM99O4pGAtLBy6qUsqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_030540_969977_BD561678 
X-CRM114-Status: GOOD (  12.85  )
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

VGhlIGJsYW1lZCBjb21taXQgZnVuY3Rpb25hbGx5IGNoYW5nZWQgdGhlIGVycm9yIHBhdGggb2YK
Y2Ruc19wY2llX2hvc3RfcHJvYmUoKSwgbm93IGNkbnNfcGxhdF9wY2llX3Byb2JlKCkuCgpXaGVu
IHRoZSBvbGQgY29kZSBwYXRoIGV4ZWN1dGVkICJnb3RvIGVycl9nZXRfc3luYyIsIHRoZSBQQ0ll
IGNvbnRyb2xsZXIKcHJvYmUgZnVuY3Rpb24gcHJvcGFnYXRlZCB0aGUgcG1fcnVudGltZV9nZXRf
c3luYygpIGVycm9yIGNvZGUuIFRoZSBuZXcKY29kZSBkb2Vzbid0LCBhbmQgcmV0dXJucyAwLgoK
U2ltaWxhcmx5IGZvciB0aGUgImdvdG8gZXJyX2luaXQiIHByZXZpb3VzbHkgdHJpZ2dlcmVkIGJ5
CmNkbnNfcGNpZV9ob3N0X2luaXQoKSBlcnJvcnMsIGFuZCBub3cgdHJpZ2dlcmVkIGJ5CmNkbnNf
cGNpZV9ob3N0X3NldHVwKCkgYW5kIGNkbnNfcGNpZV9lcF9zZXR1cCgpIGVycm9ycy4gVGhlc2Ug
YXJlIG5vdApwcm9wYWdhdGVkIGFuZCB3aWxsIHJlc3VsdCBpbiBwcm9iaW5nIHN1Y2Nlc3MsIHdo
aWNoIGlzIGluY29ycmVjdC4KCkZpeGVzOiBiZDIyODg1YWExODggKCJQQ0k6IGNhZGVuY2U6IFJl
ZmFjdG9yIGRyaXZlciB0byB1c2UgYXMgYSBjb3JlIGxpYnJhcnkiKQpTaWduZWQtb2ZmLWJ5OiBW
bGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgotLS0KQ2M6IEJqb3JuIEhl
bGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkNjOiAiS3J6eXN6dG9mIFdpbGN6ecWEc2tpIiA8
a3dpbGN6eW5za2lAa2VybmVsLm9yZz4KQ2M6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNp
QGtlcm5lbC5vcmc+CkNjOiBNYW5pa2FuZGFuIEsgUGlsbGFpIDxtcGlsbGFpQGNhZGVuY2UuY29t
PgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKdjctPnY4OiBwYXRjaCBpcyBuZXcsIGlzc3VlIHdhcyBm
bGFnZ2VkIGJ5IFNhc2hpa28KaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNDMw
MTEwNjUyLjU1ODYyMi0xLXZsYWRpbWlyLm9sdGVhbkBueHAuY29tCi0tLQogZHJpdmVycy9wY2kv
Y29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1wbGF0LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLXBsYXQuYyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtcGxhdC5jCmluZGV4IGIwNjdhMzI5NmRk
My4uOGIxMmE0NmI1NjAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVu
Y2UvcGNpZS1jYWRlbmNlLXBsYXQuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVu
Y2UvcGNpZS1jYWRlbmNlLXBsYXQuYwpAQCAtMTI2LDcgKzEyNiw3IEBAIHN0YXRpYyBpbnQgY2Ru
c19wbGF0X3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl3aGlsZSAo
cGh5X2NvdW50LS0pCiAJCWRldmljZV9saW5rX2RlbChjZG5zX3BsYXRfcGNpZS0+cGNpZS0+bGlu
a1twaHlfY291bnRdKTsKIAotCXJldHVybiAwOworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyB2
b2lkIGNkbnNfcGxhdF9wY2llX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
