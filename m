Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDDFC5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ljm/bHsRtwCfxNpyAAxgIrxhCKjyyhiNeQkqc37oQo=; b=xeICggvFfqPZ9Y
	V3GuE1vf4Cmy6AReICB6Abapuw4eLIi+OU+miFcNkWXY4SeirZNziRplKn/rw+CgpBRS6CW7tU88w
	ygsN4lBF1UJTM8Cr9f14qvURaJ2StEmvtB6ztDTMVYZwDD+OP/7H9U03G6VrqlBHQoBCH88x0eqad
	FhX2mvpplJlUaKO/dnSKsNREDl11zgOul+jIMqyF8XgnoAkbmfXdE8WcsccyRKzQpGjD4EZIjTyWn
	HyufjKk7pLCxVw+jX0jzfRChS5p3D1o+4ADs1ZZwa/aVHOUjbItqS0TTeYK4oNw44/VhsfznIVw+K
	62K2zguktmy4qrsf6MAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPLv-0000000Bnr9-40QZ;
	Mon, 10 Aug 2026 12:43:39 +0000
Received: from mail-westeuropeazon11013009.outbound.protection.outlook.com ([52.101.72.9] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPLr-0000000BnlL-0WD3;
	Mon, 10 Aug 2026 12:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEtJIQ7yae4QdzOFhBzpTzjbpES/zEGiWf9izm1sEpBj1SbMqu5FYRrF5SU1kUQfw1e5HB8lM+E0QbUm1JqAtfaNWj0ATy0hpNvFpKCic5ZzWqsqSTT4z1P+auCPcsAWKsqpSPuU6kKqN8hrF/p5pbPEJBs9Bq0PqrUkrqeyuNd4avZnjldR2gc/bH3iPAPTcOY9aP541OyqswPx724gliqlwYRZk9ekoYgobpiJ3YS8i0x9wqp8zIkpcjzQjoji3nF5BCupB4FZePkcymGHeGku+Awe6WzWDIrTxISbsnA24Lm9Uz/3F2AdCybgUs2nQS3v6uwOyyq0XsmP7yD+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KLYefPFNJ+gFax5WtPRbZORPEl4NRPDSKQKNix9jiA=;
 b=kqUc4nmkc19lXNc+BoPy8WZ4we4YJj8U/wnvR3DjhMV4EHsq4cAFV7cbpeppOCKfm2+WIPctdw/yYzwzq0xl/Ue/pMaHtMLAoLJLP5i2LbpCmPtFD45AVIbXp4d71B0BfSlqNF98K/FDggnXlVngKpYl75ljQ7S6octNcEohoTcpT9PKf64//NsKDVGeIWJGnCrZxZuqi7i5W/iCNCso9uLFW97oaHCuwryldp++1C9dW9RLUhYX4m5ibDXCpHPn0oU4DXsKdSXb4zm0bbs4lnZYx+4RMFpBEfIVlXFhN6XRPnMhO0wCgwEKbrWmxPuZKy89kc4isSXmnFzdwN8WrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KLYefPFNJ+gFax5WtPRbZORPEl4NRPDSKQKNix9jiA=;
 b=YHoQJfy5DOVAKNRtxszrNSEhpEnRXY/deGZzmOYGtakidBOMX/TLTZM/WrMoZWqDo5+QJInT4Cu5xXJBwPAk4cpPsXNg/fwo62DoM5VZ19Hqxbv+OyaTd5iWgbT8srlhF3ZWkHxhANAQ8yTe+t+pxUFh0G6vifcF3CZcDtlKIgG9vdJBrP1dJP/904Wb8W7mn4041Y6Wp/ZgUlcZojktW4LVLBJAygCWQ488p5DqE3klVdXxkblNbSThmVm/HVZV5QXOcBQQ/pNjp0FbX1jGTOQeKZKeuWnn5eaH+icbRxwnafva5I7UGYpITQdPj5azNa+TB+EPv6O0mN0SfXW67Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:43:27 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:43:27 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manikandan K Pillai <mpillai@cadence.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>
Subject: [PATCH v9 1/3] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
Date: Mon, 10 Aug 2026 15:43:13 +0300
Message-Id: <20260810124315.433448-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810124315.433448-1-vladimir.oltean@nxp.com>
References: <20260810124315.433448-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AS4P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::6) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI1PR04MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 026d44b2-4521-441d-7405-08def6dcf960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AKHJnxq2kYDsCihXUZDF3u5R3OgJcbldVFvUUoJUD4e2W3pJRGZy8ZWyFJeCcmCN5HNRPi997wD/FdchUC6/rqQ5IMTFp1SUigjNi+2RldkDBy+nsq6RkCr+vsyNdKQn12+lXvr2nMD1wyttvEdR3iZy/7oB26kbJ2WtCmCjaGDzu0SCwtaMVNZ1ksDeArO2tJoW+QiF4NFwUTadJaO4mcy57MBOrsHr+XqlkZfvkDFQoanHa3UN1S7lvm7FyV6roO40ittIypTjMzu3CM8BgB27AOLhLfZ8BtUbV1ZRKrXZVgvd5HB7pT7qv4idkNHnUlWjAjjVAeSBQ8GXsqSpWVcT9QSExL/a+yMs+xEj/AP6Qo61RZMypgGUO97b+aKNQorW6s3UI2J18LurUFMaTme9kIcw/iTFdH03DmzakqS9X2zomQy6dGowWDOhoB/o+hB4dYY8b2k411MmzdC2BHtGegI+0bXb5CivHApbK5tzZprzrBSuKp7CvERpeZBSGFJC9u9Vlb8afeUQkkPpsuiU2EOdGcVCYdox8uVIUYjglkRgxhAG/2ZLbszfg5nCnxItM7VG5G8cbLqYcvIFfa3plI827IWeusMQFdbRiA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0ZleTRrY1hYMnFXZnBlMWd2cWNCS1BxRDdyWVVsd08wSTdzMnhGRkJsV29T?=
 =?utf-8?B?RmxlaHdPdGt4UmNFZ2ZpSVY1aUdmNW1mcC9GcTE4WnVkSDRreW9SbnpGM1Jw?=
 =?utf-8?B?Q1ZxWXppSno2MjhIVWZ0NzZZVHNjM2dieTFFbkx6T0NhaU5qRzdBRWNNaHFE?=
 =?utf-8?B?N3hCcjJvb05aMkdSVElLazFDNkhnc2xUNU5RODdKTG5OSkpEaEJIL1IxRmtU?=
 =?utf-8?B?OVJjdlRVRjZldlVoQk9xQUExYlgwdjc1RGRoK0dKV0toZHowQmptb1NoK0NP?=
 =?utf-8?B?UzhXU0l4elNvK1hwa04xcHlxMGRYTFFKNnVpQlVSZm5uQnJYS1JVTFIrY0lN?=
 =?utf-8?B?UUVMdzlqUzR2QjJCSmFyMmZWcEhEamt4RzhES3l3VzN2NVNKYXpESXNTVnMy?=
 =?utf-8?B?RE9lR2g4NG5vYys0UFlickxqeXdEWUVwaUtqa1QwRzFqandhR1VqVisvdmxY?=
 =?utf-8?B?RTZzOFFnTWpKODhnNzVLbVIxQlZjK2w0Rk1xMklvTjVWTUVOTzcyQW1Oak16?=
 =?utf-8?B?TnZZVVdPRllmcjlwVTd1UXVpdEEraXhUM1lFdE85cXRIaW9jNmsrNDlyQWpn?=
 =?utf-8?B?aUxCblhjWndMM2F4YUM4MTdvTU8yVERMZk45YWJadjJSOGRXeGpFTHp6bzV0?=
 =?utf-8?B?dFZ1eU12Z296Vmo2d3lwdXZUUndmalZRc3RnK0hmb0N0QjFHNy85Ky9aUVlv?=
 =?utf-8?B?SFd3QmYxanp1ZUpNWHAvS2xrUk9Qa2xqWGhmVXJBbXIwdDhKdzlwV2dnUTk2?=
 =?utf-8?B?VnpnMlhyRDNkQkpOOG1hLzNlcHN1ejZ4d0JzSndNMHptNkZGbHJBMUFxY0R1?=
 =?utf-8?B?eWxwT25SUDZyMzgrK2E3RExLc1ZLMnZRaU44MVFCSlRyUHI0emVuN0xTSDRG?=
 =?utf-8?B?QzNBY25IaGJ2ZVFsU3FNcU5Ga0dBNFNFQ3AvQzMxZ0RWekJXZ1VOSXRnbDZP?=
 =?utf-8?B?YWZMd3JtdEJMNWhqOXlNaTRNb3JQNGdFT3RQTm53dUM5b3RaSjdZWlRQcStM?=
 =?utf-8?B?NWNwTk5sVFplcFNtMHdIaWcwSm5yeGJZbXVIcWZGeENWSUZQRDJnMVNSK1NC?=
 =?utf-8?B?Rkw5WkxFQk5GWGdQZnNXTkt5bHZVMEpWR0lpc1I2NmppWEZ4b3hzZ0NYeEtu?=
 =?utf-8?B?WXgyVW1TUWVkQnJJM3ZVZjRXRGkyeXNERHBEeG9kUHpHRnNKRE9FbE9NL0NW?=
 =?utf-8?B?dEx3SW1DamhKSGlxbmxBSDh3eWJibUJGaktoeVhudWpYUERZRDRmaDBBUExm?=
 =?utf-8?B?WEd5bU1PdnRYUzd5ZXVNWTRLRk1CbGRkN0xWOXlWemFId2p4VjRIZFFKRVJN?=
 =?utf-8?B?R3ZJVk1jT1A4cDdNQy9tc083M1lOWXhWS0RmM3QvaXdqWnh0eVlRbkl2eEtn?=
 =?utf-8?B?Y3RPY2F0QUpuVVh4K3dTaVlWbjRKUWR3QUV5NXpzaE1ISVFiM0F2cUtmQ2I0?=
 =?utf-8?B?NmlIOEJSdmkxQ0dKT21oWldXRWRQNUhvMkxnNzJldkhtUDQ3cmdyWHVFekho?=
 =?utf-8?B?ZmhaNEtsQlUrcVhtZlVERnpTTXhIUXFES3hTMHk5Rkw3Skh6RUZrTUFYK2h1?=
 =?utf-8?B?Q0hEQkk4U08rM1dVdlpna1I5Q3VmZldWWlNmRWRKcUx4d2xIclRSVVp0UHds?=
 =?utf-8?B?RHkyWTk0ckF4WWE3UXE0dVFiQk5yZ1FxcURzaHIxNXNXUFhEUy9SNzVkbkJr?=
 =?utf-8?B?YmoveEw1ZDBvWml2N3J6WUJKR0ZSSmNmREhBMThyVWQ0UHp1ODVlOC9sYlZw?=
 =?utf-8?B?OHVQR3lZVENadFNpcGhwcGZMMlU2U0pqRXE1c1VqemdJelR0ZklzMUxFcVlx?=
 =?utf-8?B?djZpdWR5a2luQ2ZLU3NNbnN1UGNMZW45RFp2NjZNdlRnYkNUU0ZhZTFkMnpP?=
 =?utf-8?B?VDlxUGhCNi9SN2c0MG40enZiZjdBUkd5b1VIUnVnR3dkTit1eHV0aVhwdHdZ?=
 =?utf-8?B?eEJ2Nk1SRDhwOTk3NjhXWE9sWFNGemViZnJpSnU5cTFkSEpFQ2t6QndYYjY3?=
 =?utf-8?B?eWRPUDMzZnN4cm1sb08wd09HazNQKy80K256MlFrbzY0cFdNemdMcGNSQVJv?=
 =?utf-8?B?YWtUYlYrOUUyMDJ4bUl4Y1A1UEowNjhHRGYrN1lRNHNVVWlseUF5djZjMm5I?=
 =?utf-8?B?Z09kN0k2VGhocmY3RHlLUElqTGZnUW5mYTFPNW9MTTJVMkJoVWYxL3BsZ3Yw?=
 =?utf-8?B?djJTdVFyS1FCSkhsWkdBUks4R1B5MkhUWG1DVEJMR2ZXcHpHaGZySU1acWtw?=
 =?utf-8?B?ekxIWEZLMG9pU1V6cDE1TTl1SnJPNXVFTzY4UFk1MWtEOWEwMkM2R05UMTd3?=
 =?utf-8?B?Q0U1ZnowNkRGNENUZkxBYTZ1bGtVNlZkY3RRYXc5TEVwWmVZdFB3UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026d44b2-4521-441d-7405-08def6dcf960
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:43:27.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk0F6j8LHKtylw71kmAc1h9tTquA3EyvBUwxO1GkfOBj8MH17fpxk9asvQdZD9a9HYenvRFa6uoMc0BMj3OUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054335_164336_C2B251C9 
X-CRM114-Status: GOOD (  13.56  )
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
bGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgpBY2tlZC1ieTogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KLS0tCkNjOiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPgpDYzogIktyenlzenRvZiBXaWxjennFhHNraSIgPGt3aWxjenluc2tp
QGtlcm5lbC5vcmc+CkNjOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3Jn
PgpDYzogTWFuaWthbmRhbiBLIFBpbGxhaSA8bXBpbGxhaUBjYWRlbmNlLmNvbT4KQ2M6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KQ2M6IFRvbSBKb3NlcGggPHRqb3NlcGhAY2FkZW5jZS5jb20+Cgp2OC0+djk6
IGFkZCBCam9ybidzIEFja2VkLWJ5LCBleHBhbmQgQ0MgbGlzdAp2Ny0+djg6IHBhdGNoIGlzIG5l
dywgaXNzdWUgd2FzIGZsYWdnZWQgYnkgU2FzaGlrbwpodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA0MzAxMTA2NTIuNTU4NjIyLTEtdmxhZGltaXIub2x0ZWFuQG54cC5jb20KLS0t
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLXBsYXQuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtcGxhdC5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1wbGF0LmMKaW5k
ZXggYTFlYTI0ZmMzYjYzLi44YWVkOGI0YzNlMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtcGxhdC5jCisrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtcGxhdC5jCkBAIC0xMjYsNyArMTI2LDcgQEAg
c3RhdGljIGludCBjZG5zX3BsYXRfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXdoaWxlIChwaHlfY291bnQtLSkKIAkJZGV2aWNlX2xpbmtfZGVsKGNkbnNfcGxhdF9w
Y2llLT5wY2llLT5saW5rW3BoeV9jb3VudF0pOwogCi0JcmV0dXJuIDA7CisJcmV0dXJuIHJldDsK
IH0KIAogc3RhdGljIHZvaWQgY2Ruc19wbGF0X3BjaWVfc2h1dGRvd24oc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
