Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFFECC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WADxSQRxeAwrqzGL+DpahBTToXLcQld+nyuavf6qV8s=; b=Y1NWDuIiqd9djYMCGKGV8YO9fz
	PWRe/m9y5kx+QiUnX35Vo4x7xN4z7stnqP9gIBVEjI31kNwzhjB7dXx9/prM2nzdBsaNZDUIWa7Ku
	cNOQflW2XA0bYLhBJQZ6R5UKZbjIWNFrrVrA1HQYSe0CAnddfw0GHa42gHGWHGRJzHWonhV61prxg
	KhS/INbjuwAi3/P9nz1zyIqFtTWR5oWRfirMGWX9Q7scPLwxBJuOzsVR/4WXVsEL3fMwbQ8hdvTQQ
	Ce5bugJpuYmM/BH5YGhWd/RSEhgLKWsupjzqsvoL4iiPX3abVeVF4X8DPGJYWMPQHYtW9VcAdczOK
	29Fc+9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEoW-0000000GvJI-2hZE;
	Thu, 15 Oct 2026 06:19:40 +0000
Received: from mail-northeuropeazon11011039.outbound.protection.outlook.com ([52.101.65.39] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEoT-0000000GvHz-3Z8Y
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 06:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwEbgQbxT7+bZ6w9qwOfV8dmdDLK+N5z60h2vYqpcuYoEaG3uoc0OGiPMdP2WtfZ0jq43/vJy/WluKrby3N37Rdz0tTTkuiIYHq6FdreRC51JHsg0X2/QvP674XEByD/B6yNNev0XFtsJObJxfUzMmX5ykk31sV5UUmdw/Z320z6Ig+GYS2X9SGe7rP8Sbk4vRXupyFRINanQtUgpd3+VHoDSpEYQFlTGke3+n6EcvPCcvT+ipheIKG+OTFfqIJ/WESB7tXuLRbBLRogb4eAIiVXvPS+dOn5fVYcUtc+5N7anyO7/jL086ajMjiah1SOzUNL/Vm6/Cw8OOI+5nCKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kypIIY0Pf/NvXii8gjjYAnkU9fmco5no7kyNCLCb4c0=;
 b=RUobxUyvr1rl/lib3lfqPeU922Q4gebLIR9CH9yK8LvRaTISs+ThRMZOUdEAd3/J9d5GfoKQEppamItIf4cb3Reob6RmASqLZsVn96wFsqpIRSHeC2EIrTCfZxh6Sn4+Ssftw5aS8oVvOJMLoZsxeOW3HU78lEdS0KHX7kukiUI/ik/DiRiL/vwH/Wtujk3AYI1v81MmKLh0AzMx1QvwwnFreywThaozItbeyZcck0ppVAN78ugDO4zylEfcyMOQRirgUTv7trCAlyGy1LsOxGIg8BJryU1ws+RX2qCH7dRnUerVt6fWT+V9ksGqzYNOadAsXXlMeoHGE0TXJpmP5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kypIIY0Pf/NvXii8gjjYAnkU9fmco5no7kyNCLCb4c0=;
 b=Rdk4dcteSpZ18j25MV3vyb+vPZojcYLOLFNNG7z6TyD0A5iKNbKp64+4x+vf+z9WZdiDITtqTOGKIB6il/1YAK5pASF6ugCNEFHC/66ZZADutmzQY2eVbpvVqX/nCenPZzJr9WLxXw00LXgbBU2t/vZ8e7vIxFEbDy4EixKUrYE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by PA1PR09MB7405.eurprd09.prod.outlook.com
 (2603:10a6:102:466::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 06:19:29 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 06:19:29 +0000
Message-ID: <46eaa0f0-ff72-4a72-91c8-b610be2d893a@mobileye.com>
Date: Thu, 15 Oct 2026 09:19:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] irqchip/riscv-aplic: fix asynchronous probing
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jessica Liu <liu.xuemei1@zte.com.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20261012-aplic-async-probe-v3-1-5cf52dc28690@mobileye.com>
 <20261013152727.2cUDX3l0@linutronix.de>
 <5a8048ef-a241-4486-adc1-440721d3606a@mobileye.com>
 <20261014105312.xNkvgkGg@linutronix.de>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261014105312.xNkvgkGg@linutronix.de>
X-ClientProxiedBy: TL2P290CA0027.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::11) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|PA1PR09MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e721e96-fd1f-44da-439e-08df2a8444fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|11063799006|5023799004|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: lIWrgO8OHdZe2TprQMgyzBECC6pNvM5tQHwWz4Tp4R8kqPRZtwZHiI1o7XTZp9K+Eom5gqDdHWRIlNHvKTeIPv5gifyVb/PD5nItFp0/xa6kS7x9jKeIJh774vFPMD54sx4SByn1uxnFAaEDXR+c6vpB398Y9/MWmeujvZk42dCz8CGDoA/CAYdjzTuonwEZNNRb8ft8RFbggPe4OOpGvyg04E98lR4PGO3rASz4lDYDajf/Kig+9MzkBP45sba8OmwYb892wLKysZqsFvVSAJ+fb6oO+zqN9J2/cWRrVx1I9L+H0M0SkPh9GYWEDU6tLUf1wuFSFx00holZRRJTng1ya0fxhRLDLNFQIJOjWFCC0JW2Ink2nXEMNEMUQGre8xk5Z7kufHk/S2L36IuuG6/d1i+UDkEa+5FmZ7NXGxkVl1rIrLEu18SZi5YyFNMd+H4GZh+L1tBNHM7wkh03nZa+RPUPkUXf1CfWTBB9lYd9JnlwjSOt9soi7AHzg4nKl+rfvo8jKadslhHAn1vBTPtsVnbalBJvYk3qo4L/54T/Wk9CfTxsdlELGu3nm1h3+/qTZi92gJ/kNimVtqhrtS9LsMwAgjo0cqn3S/7WfnFcY19qUr4kOWYU0SrNRm+3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(5023799004)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0FvUytjdlRXeG9iQjJPZm1SelYyZU1SZHE2VU42ZDRRNTRYZEJ1YlpJMGpK?=
 =?utf-8?B?eUFBQXlyR0I4aWYyS2NNL3FSQVhYWDFJTnExTXhYelkvV0t4QmNFd2VHeS9F?=
 =?utf-8?B?NFZad3pWUnp0bXk1ekZqR0kvL2RHQU81b3hXT2hteXVTek5lczlvWEo1bWtp?=
 =?utf-8?B?Q01PTnhIYlkzQ0QwOEZHMDJuQWk4eVYrai9xcmRPQ1RoMmhXWjZTazFCSVgx?=
 =?utf-8?B?VUJ1Ty8rNXp0cHNNa0JEYXVCUFlxenFJK09lRDB0TVRlVnNnNXZEWFdWMXVJ?=
 =?utf-8?B?MVZUbWdkVWxJcllBa0RyK2RwbnBjUlBZZGk5dVZEblJuVWw1WmtPK3dXUWhI?=
 =?utf-8?B?M0REZlppMStqQUx1R2VyU0pCS0wveWVVd2hVS1pNWTlld0tJcktwM3lRbFVV?=
 =?utf-8?B?WklKelZVSHZrVnJqaE1McGxGWEVvZ3pGUjVuTklrL2JNeXYrdXJZZlpZY29X?=
 =?utf-8?B?bGVxUVYvdHdyQzhtRTUrWmRlNVR1bDhnVmM4Z1pPVklkeFFzOXJVMGxzb2RM?=
 =?utf-8?B?aHR5TkpEbjRaYjJkdTBXakpvd0x3dkQvczFuK2dhK1l5dVFndXAwdlFDNDBZ?=
 =?utf-8?B?OTFiY0xCdWx3S0MwakZlaGtKOEhoclBGV3NPMkNaeWdxM3Rrc2RjZ2JkREIz?=
 =?utf-8?B?WHBJVndyeldESmtnWU1JTFlKNmdzTzdWZ0NSbXFwcnBXSHBIZmVONERtekMy?=
 =?utf-8?B?SllCWWZWeGIzMzl4bnYwTlRhZnZZckcyTTBtLzBpSmp4YVFPdVdYbEdxd1kv?=
 =?utf-8?B?UE9pbnUyMHMwQjUrYXpSSW11cHAramhOMmdDUDdQbW5lakhwMFZqMlo4VlZN?=
 =?utf-8?B?cXYwNytKcWpnTTF6dVlxWTVTdUFQbkxkR0svMERtZUcvSjFuMnVFblVkZ0Q5?=
 =?utf-8?B?Mng5NFRlS0k5UWR0MnhIbVkxK3RGTW81SmhJZ3V4QmJqeG50SHpFL3R2Ulkx?=
 =?utf-8?B?bnloK2JrQ2NZdWgrcjZsVktpODBTTFQ3TnR0Tk16Zmt3c3JjT3NvWVRDTmds?=
 =?utf-8?B?Wlg2dWcxN2tGSXRUdVRkOVZkeWlxM0FPTWw4QTNGZ256VGZUdlk2ajF5U1hG?=
 =?utf-8?B?MTZVVnUrLzBaK0xMNDlWbkJGS0dSdmdxbHhpdUJHWUFRY2ZUQVV6RVp0N256?=
 =?utf-8?B?cHExV2JkQ3RXOFpnTk1Rc1dmWFlRSmdxR3JNQWpLQmxyb2N4UnFlZFI4azZw?=
 =?utf-8?B?dWdhQjhLVGI5VC96UWpkZkpnV0pLaVBLaXVWTjBkdDVDUTdJbTFpWklGL3Ez?=
 =?utf-8?B?Sy9qN2p2Q1JPdWU4cmpSR1hGZW5CekF6S0pNby9UWkxYOGNuSU1IVnEwSW1P?=
 =?utf-8?B?VCt1L0V3eUUrOVBsSkhhSGJoSWpKY1g3Mm4zYmM5MVJnY0dwMk9rVU5VVVFl?=
 =?utf-8?B?UUwvV0JndHVaYUoxZndQVTR3RGI2THNwV1dtM2ZsTzJXdFh0b2J4NGo0MXRh?=
 =?utf-8?B?L2NDT093eFllMmVnOFNzUVhMaEQwS2V0aERUcUJpcWlEcEVhdFV1V3JLaTZk?=
 =?utf-8?B?R0RYMGEyd2wzd21rTmI1RkxiR1pPVDR4UkN6bzZTRXh5MmxDNWtleDViY1ZE?=
 =?utf-8?B?NWEyUEM3NVkwalpzSmxaQmN0RXo3VFZ4dlRneWoyNGRIcTE0SFJ5aXgrcWJs?=
 =?utf-8?B?aFRHemt3NWhkSlEzb29FaCtkOHVxUFJjYTkweVlCdjBCY01kUzV4RmFsM2dM?=
 =?utf-8?B?cEVGRXdNdTNQKzV0cnE4eDNVVitGbzVpUms3U2ZBaEJOMVpvTjE4SnVCdXI1?=
 =?utf-8?B?eDFFT0JlWVVHZGxXRGJ5NjNLTHZIcjRTRm92Sndab1lscnFXWXZZckRaQ1pK?=
 =?utf-8?B?RUNkcGtSTjBnelVvaEQ1Ukp0RytGTFlmdm53VHZkTCt4b3ZJck9HTjN1Yjly?=
 =?utf-8?B?RFI4QldabUpnK1IrZ1lXbk5IQkJ1UUw2MTc4NXlLN1I0cGZnbnkraVhicHBN?=
 =?utf-8?B?clZGZEJFeDF1UUpNY1l2NHZiZEllZTRvbDlFYWVNRUVZWCtjcU5FdjJndWVr?=
 =?utf-8?B?Q29aZFM1dElFUHBrRXJ4aEpLY2ZMT3cyRXNlUEQvMENSbTdaR2JGOWhNR2Ev?=
 =?utf-8?B?c1FORDZHanJ5NkNDa25vS2RtWlJ6dlUwWEpHNThUMnFDcXR6WUloNzlCTWZR?=
 =?utf-8?B?OUF4ZUxhTU5GdVhjakdmdGV4SFRPYk5nQVhkblFSS3RnL0pQeEZqTTEwRmc2?=
 =?utf-8?B?bS93T0xZZWtLNWMycEZydkZVSlNMRWI0VWxkdzkvQ29JMmJteWRUV080aWU0?=
 =?utf-8?B?RDhXTWUwc0NscXVVU3hrSTc0ZmFTU2w0M1dtUmc5VDZiTW40UEtrYmxQV1B6?=
 =?utf-8?B?aVlWWDNDR0h1d2JiOEo3K2NmOHZ3RU13ZjByQXlvcW9uNU51SHljdz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e721e96-fd1f-44da-439e-08df2a8444fd
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 06:19:29.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZHVI4H4xa6iuukmfncv2YWOPULNN88dhYmbkVDSVoYEaoEtPV3YR6EykRJcsHpnE7yFkKWGERwr4JIfdv50yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR09MB7405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_231938_094478_A153548F 
X-CRM114-Status: GOOD (  29.56  )
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

T24gMTAvMTQvMjYgMTM6NTMsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Igd3JvdGU6Cj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBhbnkgbGlua3Mgb3Igb3BlbiBhbnkgYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuCj4gCj4gT24gMjAyNi0xMC0xNCAxMToxNTowNSBbKzAzMDBdLCBWbGFkaW1pciBLb25kcmF0
aWV2IHdyb3RlOgo+PiBPbiAxMC8xMy8yNiAxODoyNywgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lv
ciB3cm90ZToKPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgYW55IGxpbmtzIG9yIG9w
ZW4gYW55IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciBhbmQga25vdyB0
aGUgY29udGVudCBpcyBzYWZlLgo+Pj4KPj4+IE9uIDIwMjYtMTAtMTIgMTI6MTI6NTkgWyswMzAw
XSwgVmxhZGltaXIgS29uZHJhdGlldiB3cm90ZToKPj4+PiBib29sZWFuIGZsYWcgZG9uJ3QgcHJv
dGVjdCBmcm9tIHJhY2Ugd2hlbiBwcm9iaW5nIHNldmVyYWwgaW5zdGFuY2VzCj4+Pj4gYXN5bmNo
cm9ub3VzbHkuIE9uIHN5c3RlbSB3aXRoIG11bHRpcGxlIEFQTElDcywgaWYgcHJvYmVkIGFzeW5j
aHJvbm91c2x5LAo+Pj4+IHdhcm5pbmcgdHJpZ2dlcmVkIGFzIGJlbG93Lgo+Pj4KPj4+IFdoeSBp
cyB0aGlzIGFzeW5jPyBEb2Vzbid0IF9fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkgc2V0IGl0IHRv
IHN5bmM/Cj4+Cj4+IFllcyBpdCBkb2VzIGJ1dCBhcGxpYyBkcml2ZXIgdXNlcwo+Pgo+PiBidWls
dGluX3BsYXRmb3JtX2RyaXZlcihhcGxpY19kcml2ZXIpOwo+Pgo+PiB0aGF0IHRha2VzIGRpZmZl
cmVudCByb3V0ZS4gRWFzeSB3YXkgdG8gZGlyZWN0bHkgcHJvb2YgaXQ6IEkgYm9vdCB3aXRoCj4+
Cj4+IGRyaXZlcl9hc3luY19wcm9iZT0qIGR5bmRiZz1cImZ1bmMgX19kcml2ZXJfYXR0YWNoICtw
XCIKPj4KPj4gdG8gcmVxdWVzdCBhc3luY2hyb25vdXMgcHJvYmUgYW5kIGRlYnVnIHByaW50cyBp
biB0aGUgX19kcml2ZXJfYXR0YWNoCj4+IHNob3dzOgo+PiBbICAgIDAuMjM2NDgzXSBwbGF0Zm9y
bSA0ODc2MDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlcjogcHJvYmluZyBkcml2ZXIgcmlzY3YtYXBs
aWMgYXN5bmNocm9ub3VzbHkKPj4gWyAgICAwLjIzNjUxM10gcGxhdGZvcm0gNjc0ZTAwMDAuaW50
ZXJydXB0LWNvbnRyb2xsZXI6IHByb2JpbmcgZHJpdmVyIHJpc2N2LWFwbGljIGFzeW5jaHJvbm91
c2x5Cj4+IFsgICAgMC4yMzY1MzldIHBsYXRmb3JtIDY3NTYwMDAwLmludGVycnVwdC1jb250cm9s
bGVyOiBwcm9iaW5nIGRyaXZlciByaXNjdi1hcGxpYyBhc3luY2hyb25vdXNseQo+IAo+IERvZXMg
ImRyaXZlcl9hc3luY19wcm9iZT0qIiBtYXJrIF9hbGxfIGRyaXZlcnMgYXMgc2FmZSBhbmQgeW91
IHJ1biBpbnRvCj4gYSBwcm9ibGVtIHdoZXJlIGEgZHJpdmVyIGlzbid0IHNhZmU/IERvZXMgdGhl
ICJkeW5kYmc9IiBhcmd1bWVudCBzaG93Cj4gdGhlIGRyaXZlciBpcyBwcm9iZWQgYXN5bmNocm9u
b3VzbHkgaWYgeW91IG9taXQgdGhlICJkcml2ZXJfYXN5bmNfcHJvYmUiCj4gYXJndW1lbnQ/CgpO
b3QgZXhhY3RseSwgImRyaXZlcl9hc3luY19wcm9iZT0qIiBpbiBib290YXJncyByZXF1ZXN0IG9u
bHkgZHJpdmVycyB0aGF0IGhhcwpQUk9CRV9ERUZBVUxUX1NUUkFURUdZIHRvIGJlIHByb2JlZCBh
c3luY2hyb25vdXNseS4KCmFwbGljX2RyaXZlciBkb24ndCBzZXQgcHJvYmVfdHlwZSB0aHVzIGl0
IGRlZmF1bHRzIHRvIFBST0JFX0RFRkFVTFRfU1RSQVRFR1ksCnF1b3RlIGV4YWN0IGRlZmluaXRp
b24gZnJvbSBrZG9jOgogKiBAUFJPQkVfREVGQVVMVF9TVFJBVEVHWTogVXNlZCBieSBkcml2ZXJz
IHRoYXQgd29yayBlcXVhbGx5IHdlbGwKICoJd2hldGhlciBwcm9iZWQgc3luY2hyb25vdXNseSBv
ciBhc3luY2hyb25vdXNseS4KCklmIGRyaXZlciBpcyBubyBjYXBhYmxlIG9mIGFzeW5jIHByb2Jp
bmcgaXQgc2hvdWxkIHVzZSBQUk9CRV9GT1JDRV9TWU5DSFJPTk9VUy4KMy1yZCBvcHRpb24gZm9y
IHByb2JlX3R5cGUgaXMgUFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUwoKRGlyZWN0IHRlc3Qgc2hv
d3MgZXhhY3RseSB0aGlzOiB0aGF0ICJkeW5kYmc9IiBhcmd1bWVudCBwcmludHMKInByb2Jpbmcg
ZHJpdmVyIHJpc2N2LWFwbGljIGFzeW5jaHJvbm91c2x5IiBpZiBJIHNldCAiZHJpdmVyX2FzeW5j
X3Byb2JlPSoiCmFuZCBwcmludHMgbm90aGluZywgbWVhbmluZyBkcml2ZXIgcHJvYmVkIHN5bmNo
cm9ub3VzbHksCndpdGhvdXQgImRyaXZlcl9hc3luY19wcm9iZT0qIgoKPiBTbyB0aGUgcXVlc3Rp
b24gaXMgZG8gd2Ugd2FudCB0byBsZXQgaXQgcHJvYmUgYXN5bmNocm9ub3VzbHkgb3Igc2hvdWxk
Cj4gd2UgZm9yY2UgaXQgdG8gc3luYy4KCkkgc2VlIG5vIHJlYXNvbiBmb3IgUFJPQkVfRk9SQ0Vf
U1lOQ0hST05PVVMgdG8gcHJvaGliaXQgYXN5bmNocm9ub3VzIHByb2JpbmcuCmNvZGUgaXRzZWxm
IGlzIGNhcGFibGUgb2YgYXN5bmNocm9ub3VzIHByb2JpbmcuIFByZWZlcmVuY2UgZm9yIHBhcnRp
Y3VsYXIKcGxhdGZvcm0gY2FuIGJlIHNwZWNpZmllZCBpbiB0aGUgYm9vdGFyZ3MuCj4gCj4+PiBX
b3VsZCB5b3UgbWluZCBwcm92aWRpbmcgYSBjb2hlcmVudCBkZXNjcmlwdGlvbiBvZiB0aGUgcHJv
YmxlbSBhbmQKPj4+IGltcGxlbWVudGVkIHNvbHV0aW9uIGluc3RlYWQgb2Ygc2xhcHBpbmcgY29u
c29sZSBvdXRwdXQ/Cj4+Cj4+IFNvcnJ5IGlmIGl0IHdhcyBub3QgY2xlYXI7IHNoYWxsIEkgZXhw
bGFpbiBpbiBkZXRhaWxzIHdoeSBwYXR0ZXJuCj4+Cj4+IGlmICghZG9uZSkgewo+PiAJZG9fc29t
ZXRoaW5nKCk7Cj4+IAlkb25lID0gdHJ1ZTsKPj4gfQo+Pgo+PiBpcyBub3QgU01QIHNhZmU/IEFk
ZCBkZXRhaWxlZCBleHBsYW5hdGlvbiB0byBjb21taXQgbWVzc2FnZSBhbmQgc2hvcnRlbiBjb25z
b2xlIG91dHB1dD8KPiAKPiBObyBjb25zb2xlIG91dHB1dCBhdCBhbGwuIFlvdSBuZWVkIHRvIGNv
aGVyZW50bHkgZXhwbGFpbiB0aGUgcHJvYmxlbQo+IHdpdGhvdXQgYWRkaW5nIGNvbnNvbGUgb3V0
cHV0LiBUaGlzIGlzIGEgc2ltcGxlIHByb2JsZW0sIHRoZXJlIGlzIG5vCj4gbmVlZCB0byBmb3Ig
YSBodWdlIGNvbW1pdCBtZXNzYWdlIGhlcmUuIEFsc28gdGhlcmUgaXMgbm8gbmVlZCBmb3IgU01Q
Cj4gaGVyZSBhcyB3ZSBkbyBoYXZlIGtlcm5lbCBwcmVlbXB0aW9uLgoKR290IGl0LiBXaWxsIGRv
LiAKCj4gCj4+IFJlYXNvbiBmb3IgYXN5bmNocm9ub3VzIHByb2JpbmcgaXMgc2ltcGxlIC0gdG8g
cmVkdWNlIGJvb3QgdGltZSwgaXQgaXMgY3JpdGljYWwgZm9yIGVtYmVkZGVkCj4+IHN5c3RlbXMu
IFRoaW5rIG9mIHN5c3RlbSBtYW5hZ2luZyBjYXIgcmVhciBjYW1lcmEgYW5kIHByb3hpbWl0eSBz
ZW5zb3JzLCBpdCBzaG91bGQgYmUgcmVhZHkgd2hlbiB5b3UKPj4gc3RhcnQgZHJpdmluZywgdGhp
cyBsZWZ0cyB2ZXJ5IHNob3J0IHRpbWUgZm9yIHRoZSBrZXJuZWwgdG8gYm9vdC4KPiAKPiBTbyB0
aGUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgYXN5bmMgcHJvYmluZyBhbmQgeW91IGFkZCBpdCBh
bmQgY2FsbCBpdAo+IGEgZml4PyBJIGRvbid0IG1pbmQgYXN5bmMgcHJvYmluZyBidXQgaXQgc2hv
dWxkIGJlIGRlY2xhcmVkIHdoYXQgdGhlCj4gYWN0dWFsIGludGVudGlvbiBpcy4gQW5kIG1heWJl
IHRoZSBkcml2ZXIgc2hvdWxkIGJlIG1hcmtlZCBhc3luYyBpbiB0aGUKPiBlbmQuCgpBcyBhYm92
ZSwgZHJpdmUgZGVjbGFyZXMgaXQgaXMgYWdub3N0aWMgdG8gcHJvYmUgdHlwZSwgc3VwcG9ydGlu
ZyBib3RoLiBTbwpJIGRvIHRoaW5rIGl0IGlzIGEgZml4LgoKPj4+PiAtLS0KPj4+PiBDaGFuZ2Vz
IGluIHYzOgo+Pj4+IC0gZHJvcCBfX3JvX2FmdGVyX2luaXQgYXR0cmlidXRlIGR1ZSB0byB3cml0
ZSB0byByZWFkLW9ubHkgcGFnZSBjb25jZXJuCj4+Pgo+Pj4gV2hhdCBjb25jZXJuPyBUaGF0IF9f
cm9fYWZ0ZXJfaW5pdCBjYW4gc3RheS4gSXQgaXMgYnVpbHQtaW4gb25seS4KPj4gU2VlIGNvbW1l
bnQgdG8gdjIgYnkgc2FjaGlrby1ib3Qka2VybmVsLm9yZyBoZXJlCj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9zYXNoaWtvLW91dGJveC0xNjc4NTZAa2VybmVsLm9yZy8KPj4gcXVvdGU6
Cj4+IC0tLWN1dC0tLQo+PiBbU2V2ZXJpdHk6IEhpZ2hdCj4+Cj4+IFdpbGwgdGhpcyB0cmlnZ2Vy
IGEgZmF0YWwgcGFnZSBmYXVsdCBpZiB0aGUgcHJvYmUgaXMgZGVmZXJyZWQ/Cj4+Cj4g4oCmCj4+
IFBsYXRmb3JtIGRyaXZlciBwcm9iZXMgY2FuIGJlIGRlZmVycmVkIChmb3IgaW5zdGFuY2UsIHdh
aXRpbmcgZm9yIGFuIE1TSQo+Pgo+PiBkb21haW4pIGFuZCBydW4gaW4gYSB3b3JrcXVldWUgYWZ0
ZXIgdGhlIGluaXQgcGhhc2UgaXMgZG9uZS4KPiDigKYKPj4gYW5kIGluZGVlZCwgYXBsaWNfbXNp
X3NldHVwKCkgY2FuIHJldHVybiAtRVBST0JFX0RFRkVSIHNvIGNvbmNlcm4gaXMgdmFsaWQgYW5k
Cj4+IGV4aXN0ZWQgaW4gb3JpZ2luYWwgY29kZSwgaXQgaXMgbm90IHJlbGF0ZWQgdG8gYXN5bmNo
cm9ub3VzIHByb2JpbmcKPiAKPiBJIHdvdWxkIG5vdCBleHBlY3QgdGhlIE1TSSBkb21haW4gdG8g
YmUgcHJvYmVkIGFmdGVyIGtlcm5lbCBib290aW5nIHZpYQo+IGEgbW9kdWxlLiBUaGlzIGlzIHRo
ZSBzY2VuYXJpbyB3aGVyZSB0aGlzIHdvdWxkIGV4cGxvZGUuCj4gQW5kIGlmIHlvdSBjb25zaWRl
ciB0aGlzIGEgcHJvYmxlbSB5b3Ugc2hvdWxkIGFkZHJlc3MgaXQgYW5kIGRlbm90ZSBpdAo+IGlu
IHRoZSBjb21taXQgZGVzY3JpcHRpb24gYXMgc3VjaCBhbmQgbm90IHNpbGVudGx5IGNoYW5naW5n
IGl0IGFzIHBhcnQKPiBvZiBhbm90aGVyIGNoYW5nZSB3aXRob3V0IGFueSBleHBsYW5hdGlvbi4K
Ck9LLCB3aWxsIGFkZCBleHBsYW5hdGlvbiBmb3IgdGhpcy4KVGhpcyBkcml2ZXIgY2FuJ3QgYmUg
YSBtb2R1bGUsIGl0IGlzICJidWlsdGluX3BsYXRmb3JtX2RyaXZlcihhcGxpY19kcml2ZXIpOyIK
YnV0IHN0aWxsIHByb2JlIG1heSBiZSBkZWZlcnJlZCBpZiBvZiBub2RlIGhhcyAibXNpLXBhcmVu
dCIsIHNlZQphcGxpY19tc2lfc2V0dXAoKSAtIGl0IGNhbiByZXR1cm4gLUVQUk9CRV9ERUZFUjsK
ClRoYW5rcywgVmxhZGltaXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
