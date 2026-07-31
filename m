Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB00C55167
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 03:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unm1s69azuFGi3rCtagMTvwu5HxgvbM4gZ6+E32v2WY=; b=nJX/JLF+9Mhr5QjTJZ8gNw5vzu
	ea3EoAOWCYD+RMujbammrypKTe/1yoo/fo/47E3fi6epASFOLjlyJjv/gsHqgIfEFuEeoDkNpvSQ8
	WBH1teQ1BKn8zylVSDd5OBd5mf/H+hGpStITEAQ0N0xtwDuCP6DhS7gMYBjDcULZzuFzRV859uhHb
	9xM4Sk8qX9DcOqhT7raLfHxkgHjlETcme2B3vDjyRgajhf4I8G7hvi/+1VY+GjpRN4HHnM1qxuMaE
	9dF4kPFxBlDclLL0ECq2dMIkpr2vUXmZId1sQi79w1s2j/HpIOc0NSNJt88DLv3yDZsO59DoRlQZP
	gJQ+LaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdxo-0000000Bh9S-1hou;
	Fri, 31 Jul 2026 03:31:12 +0000
Received: from mail-japaneastazolkn19012051.outbound.protection.outlook.com ([52.103.43.51] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdxk-0000000Bh8s-1sgr
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 03:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/3551/Cb+vPX35DWYj58GH6UvIYujXqNX4pwUuME+hXFn0udnpXcPCbNeeBviUxcdG8k3qRtJCJZFVzF/zdziM/D1mvY+YuJsdcLhnH5Vjb3I2QQvtoWzGolPsoqUjahmSeAsFeBzWZLVxgJx8jms+eOXFda3LJKhBzxJKg/QmsAoA+g9l+A+ECt4Pg4DbXAzwM/PwJOID546ArBQnt8bHd/or9A0K0XOks77/AWWpgm8HJDvU3quXb/Ds0EGSqLs7bRvQv1UuXNEjJ1bwA2JaWiPKsK6CE+ZAg65aa2FjWinLGk38sOwUyIasEcAdFQBnAWDPTI1T1VF00CdTUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5jUN/wLKidRbC0jNtZd+bAnZ615O1LEcsRV4phsCeQ=;
 b=kt+FK2lY43xPDPGdbhqiUMZNf8Hkt7E1VPIga54qHPKV2vymCjhMm0ZO4A8xDoBflIsUH+paP/Z1YgmKwQwrXV015WBG821+XcUx7d041jw8XZxihzD507hWvQKfW83B3B0+ME+LYLFUSDO9I/FSYPbxhea6uw0si16yoaCeqOQ8dPLd52Ay2m+WGlsGH3mW8tXSlPzaBxZqVeYQ0vq4XUpLtOCUi+N0sLZ4zFynfjP821ZTFmpf/ZWMSvBTBRevu+OY7fkHpWDKqzVAKl3ebCB0SqziDDfb9tc8NEhMibg+CDd7K5wM4fJ9jCshT14dghRevjntOR2hfQPj+m+UbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5jUN/wLKidRbC0jNtZd+bAnZ615O1LEcsRV4phsCeQ=;
 b=fYpbhAAuxTgG2g6yKUQHy6Okv/qdY1K+YvRMU4cQDtrbdyU3q+fO6HkXBFDm4AqWnZ8/c/8QGZl9nJPnI8Mfu4I6hBEf5U2jtCSXU/AR6vAHuEVa6rHmhloRMOAmVGFWKSEB5JvMEWbbt3nEbTAYp5HxQsTG7hdxuanFVzizMOf+Lk6OyN4eNSY5KoSNR/pTqbJuvPjZx99KEok4kMc2jOVMa+a/gGCkoYsuKIgZP9r5i975t0XSU7mxRY9kNIJkcd4AfoZMMZkyvleQZXGh1hwylckEdRYyfmlqmSft4kq3k7wkcK+65D9BK8emuvtPniLutpLreY/X5z+3TDLwew==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by SEYPR04MB7599.apcprd04.prod.outlook.com (2603:1096:101:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 03:30:48 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%5]) with mapi id 15.21.0292.009; Fri, 31 Jul 2026
 03:30:48 +0000
Message-ID: <SE3PR04MB89221703FADAD3267E603C27F3C82@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Fri, 31 Jul 2026 11:30:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: unaligned: Fix check_vector_unaligned_access()
 stub name
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20260730131931.2066821-1-namcao@linutronix.de>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260730131931.2066821-1-namcao@linutronix.de>
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <f4af8dde-44bf-4f06-826a-8235eee17b27@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|SEYPR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 6650c7cf-6987-4b4f-d968-08deeeb41cb9
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|19101099003|55001999006|15080799012|22121099003|5072599009|6090799003|25010399006|4140399003|8060799015|19110799012|39105399006|22091999003|12121999013|24121999003|440099028|3412199025|4302099013|10035399007|53005399003|40105399003|26121999007|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2pCaTZvamh6bFhaYzIyMy9rUmlZdFd0cjM1amZheFVpUjZhckpWSmZqSnVQ?=
 =?utf-8?B?U3NhRzlPTEpaUU9jb2ZSVWkrc3lFQ3dWaWduREhkcng1K21TY3RSRlJvMzM3?=
 =?utf-8?B?emt5UVgwNG9KYzA4d01vbmQ4L0F6OTZBWEVRUTg2czNudnRkWGhKRUtBT2dY?=
 =?utf-8?B?ejdOYmxjdmRRMlhxWmo0Kzd3TldBUmtZRzA2bnNaL0N1RFpIdXlCMEdjZkE4?=
 =?utf-8?B?SUkrR2xDRVo4bVNMc0ZBcnpvZmM3NmQrRmdTVzI5N2pDZkhQTEN0UTFFU3NF?=
 =?utf-8?B?TlpwN3grWTFPMVNEdkQ2cXBRVTZ5by9lTnhxSWgvUzNMMzZZQXpHdGRIbnRk?=
 =?utf-8?B?dHF3T1R3S2JBQnRXdE1QNWd2VkRiQStGZ1Vlc09xaWxjdVorQzhMQXlJL2o3?=
 =?utf-8?B?TU5KUkRyUjJVVW5ydldxS0pEOE0vQjhJRVBlaXRZV21NL29NczdrTWtRcHYx?=
 =?utf-8?B?RVhsclQrdnQ3RmFYQi9IT0U0TWhWQUZQTVBVaFB6NzdxYnNKbE1VYkFQU0Fh?=
 =?utf-8?B?akpBUzFqRU9YNEZGWGtJT2M5Nk1PTFhYRTdma1ZjYUhhSG9XYWFyb212Vit5?=
 =?utf-8?B?RkVXR2hWbzBYcmpYV0REbXluYzlpNlV2YUdNRlFNQXNRV2dKZ2crUGYwdzNC?=
 =?utf-8?B?MmJ4UTdmWm8xNmV1SzRYeTl5ZWwwMmFDSkh0dlhJV3JxbWI5Q0VpMFhiVWJJ?=
 =?utf-8?B?MVc5SjYyUDkzbEx6dHVsZWxSTFBrbCtHZFFVUEJGcE13TzB6cWZTOWJNTXNu?=
 =?utf-8?B?ODFwYXk4TGIvNjh0TXNIYjBLWlhRUk5VZGFqZm9lWUFONkZrdDFwdFNIK24w?=
 =?utf-8?B?T1NPWHJWbEZaL3FpUFp3bHB5d1pyejZPL3BUMVN3Y3dGWVFQcUFoRjNySmJZ?=
 =?utf-8?B?WTBwbFBmN2h4cTFtUnlFTkdnbjNOTHBKM1VWTERrYjkwaVlHN3MyS1ZGK09E?=
 =?utf-8?B?NjVrS0t0VjAyeTM0dGkvZ29CSXBpNkxQUFZZcFlFRXRjZHFPZHdsYTZ4SHZm?=
 =?utf-8?B?RkJzeFJKOENUa29nT0ZQQTduU3pUQlRwVSsrNTVtcXRrcERkOXlJLzdOcjFa?=
 =?utf-8?B?eUhGR2t6T1hJSk41SHJTZWs0enJuMlZHbkJTbnBhTXdjdDdRdkpFeHBFN3hn?=
 =?utf-8?B?M0d1cmp1QVVpMkhoQVU5dnRReU51RmhhRTBPRE9mblZDZDVxU0J1UGdHeDRQ?=
 =?utf-8?B?c2ZMTEY4d1NDYzNHUVFwNTlGRURmWnYrNUdYSWtvMVhlUkt3bVdGRG04REdT?=
 =?utf-8?B?Si96RTU0T1ZTdnZFMDYvOW5id016YmFwbkpMUVFrVmtUcjhpNHJEbExiMWM1?=
 =?utf-8?B?OHhmTmZiZ3NaRFk4azVPM3pCM0cvZXRxR0pBWENVeHJlMmQrTTBJMlIyWHJB?=
 =?utf-8?B?NnlDZFRLTGdnVk9EamNIMFBLYVNkOHUrTVNYaDBWN2JwUUlNYk95RFFxTGtO?=
 =?utf-8?B?MDhnY3VkTVRFeWhyK0RaNWMyUGpQREdIL1d0KytXcjQ2ejh1d1FBSW9Nd0N3?=
 =?utf-8?B?aXZpNEtRcHN1U2tYenRsak0zRUlnQ2c4ZEVQc0p5Z1U1cEY4alVONVJZcjl0?=
 =?utf-8?B?YlI5VFZ1Sm16UHZQQ1hSVkltNkZQY1R4cDRpcms0MEZYb2xNMzhERGxaL0lN?=
 =?utf-8?B?RTVxZmt4MzJYbHRWeWF5UWRrNjhnVERXd3M1bFo2QVVEK240YUdmWGo4aWFu?=
 =?utf-8?B?YWt3dUFGbmxMTm95NlpObURpbys5d3VpTGFsVGhQa0JKeVNVbGxGZDFjWjQr?=
 =?utf-8?Q?0DAMkotmaN1GuvnIwM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0luMUJ6WUlqMjVYTzhLZk0wUERSS0lDMFRoNWtMdUtud0JpMzMvVmhrMEhy?=
 =?utf-8?B?ZzBLL1hjQjdyR05UZ2VQaklrUHJVSURGd2trcWpNa1pnVTBiWllWemh1T3Fv?=
 =?utf-8?B?UjhTRmtkMnpuQ2RxVFRpdGdmMGd2TkF2VmkrclF5UndqWFF0SEllTWNWZ0Ni?=
 =?utf-8?B?R0t0UkdxU0RPNE1hYVZqUU90T0FBb0hGRmcwcC9sVzltOTk0L3BiTUR0SlZv?=
 =?utf-8?B?bUM2dWMxQ0JzTDdIaTI5UCtwRzJsWngyK25wYXhvNVRYTW1BTlB3enBvYU40?=
 =?utf-8?B?dmJiTXhyMUp1ekluUmp0Sk4rMnJRVlFWeitqMW0ra0xaenZnNGF6anNCanNE?=
 =?utf-8?B?ZUVFeHNsbC9BTlVLcGlXTTZJTjllZmFwUW9nR3p3ZU9LOHJxOXRWMkFEU2R6?=
 =?utf-8?B?VmphWG1CMEx0YkpDMzJKK2ZNWStIVkR3U01wanhGMEpEbzF5d0xESHZkcjJt?=
 =?utf-8?B?czdmRlJ1Tm5wZFNtWTRpWkhWT0pOOVBTYmFxRnpkeXhhdG92MVRPS0NuUkZh?=
 =?utf-8?B?VUk5UFNRc1llb2xkakQyMFFOdWpXclFOV3ZRYmlKWXgzTGhGQVpqdlhwaXZB?=
 =?utf-8?B?ZVBrZEllLzgxK0t2WWdwWk5MR01rM0o1NEw0M2xWQk4vcFB6WDFUNnp4V0tJ?=
 =?utf-8?B?Tzl0NFpZVHZRVi9NVk9tck9qNXVtc3JhcVNNV1F6d2ptL2JxQWJWaFgwUDNm?=
 =?utf-8?B?bmw0c2ZzcTNjNU94U1RFdTJORlc0bjNWVjdGZW1TZjhHVFpDVVdJQTVHTEth?=
 =?utf-8?B?N0ZURmdKNkpVTmFBQVNERFY1UnAyNFFMNUprTlNDb2VyMG9FZ1VyMTVLZy9F?=
 =?utf-8?B?Y242cHN4ZWVXRlVnWG9UTGwxbDJEZWpnbDVKeGpXODg5eGZPQ285bEttNEZu?=
 =?utf-8?B?Wnd1VUdPcCtmZ1d1RHZLcDduM01HN0tqQTh5K2pEN3FDRHhiNGJRS1c3NTVr?=
 =?utf-8?B?OEx4aDRPN2ROTEk1MDJacDNJYUE4aVRLVFJ6Y2RGcjVnTU8xaDZ5WlhZZHBW?=
 =?utf-8?B?NXlRaTdIUVN6dHJFRkw1RW91eTczYVFYYWJPRXorOWZaZjF0TmVTc0Q1dHEv?=
 =?utf-8?B?ODcwcjVPQmhvSy9JK1BuSTRwRjVkY0hja0JUSUxYSEVnbUk2bWNRUnJJU3FT?=
 =?utf-8?B?Smk0cGdNMXVEazR3MU1KTTJOSU9DNUloZVNvMDEwZlpNKzdSSWcwbm5hTVUw?=
 =?utf-8?B?RWgrVGxMNVhpaGNWSVJMRjRxWFRWR3kwQW1YOExkMHFXTzRSL3A3cERYeTRY?=
 =?utf-8?B?WStndGRzZldtMDJTL0RiQWV0dEVnU2JXQ1MwNGNyUXI1d2JjS0NQdm5lUDVD?=
 =?utf-8?B?N0pMSHVienR5eDc5djZrcU1EVGVWMU9XWTRIR054eTltOHo0NVNWd0ovbkJm?=
 =?utf-8?B?aXZUY3A4T1ZyRlozTTZxUWNSUHdjYS9VSEFHTlF4d09UdUtzdXFPdkpCekpp?=
 =?utf-8?B?N2J3UHF3TmxQU1phdFJUSnkxRW94L3V2em9aOXg0OWFvcE1WREU5TWQzdklz?=
 =?utf-8?B?SjZLSU5XeVBFSUphck5lMGNHQS82Zk90aXU1YVdSTktRQmVHVHRCaDV0TVVG?=
 =?utf-8?B?OElmcXlhc01LNXArdVEvWnFjb3VERXgyZEhWNFRzUkoyak5ZeTFkd3pJbHgw?=
 =?utf-8?B?aTNNL0NwUkRrVDRScEErWklkQll6OUNNNklOb0twaTZZNm5HbzNsNUpQSCtQ?=
 =?utf-8?B?ZnFIcGI1U3RSWG5OWGJVQkNrVkpJTEVONnRONUJIMFhsUUVhZC8rTzZwdjl5?=
 =?utf-8?B?NERpWUwrUXd4MHpMYm9KSDRvMDdHVWpiSkxodTc0ekcwQWlCdXdDY2cwbW9T?=
 =?utf-8?B?OHpzelR3b3Q5Tm1uTjBDQ0w2cGJIWFZBeUR2YVd2Mk1iRHlwbk5LQU4vY1lE?=
 =?utf-8?Q?iNN8Sxy9dBtAM?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6650c7cf-6987-4b4f-d968-08deeeb41cb9
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:30:48.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_203109_815593_0F5DC739 
X-CRM114-Status: GOOD (  14.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 7/30/2026 9:19 PM, Nam Cao wrote:
> When CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS=n, the no-op stub for
> check_vector_unaligned_access() has the wrong name and causes compile
> failure.
>
> Correct the name.
>
> Fixes: f54d193db5da ("riscv: unaligned: stop using kthread for check_vector_unaligned_access()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607301618.yrE3EKfS-lkp@intel.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
> This patch can also be squashed to f54d193db5da.
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 5212aa99771e..6e35bca568de 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -288,7 +288,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>   }
>   
>   #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> -static void check_unaligned_access_speed(struct work_struct *work __always_unused)
> +static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>   {
>   }
>   #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
