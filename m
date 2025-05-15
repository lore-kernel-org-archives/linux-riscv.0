Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5CBC3ABD8
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 00:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4CV2f/b1Y7uXoc3E15J10X2fQYDR35cHSZD3qTViro=; b=2Y3Q4vLTfEklDSszc+o87J6DVM
	M7oix4Q0YOUfUYWFZU4vmJvafay5hZr1uGrXHEr7eZ2Cnls+IrhV3sIHg8TiKPvns486SHAiB6MNp
	Xa8k7DeMTrooVAV9N8j6vqGjlRhjikt44s4qZEEWtxAcAwLT8uVD8yI4N9hx1nG428PF8QTzEe/x5
	23j1o0oiLmNRVLx8GQ7IAGnAciKnOiihZPLuA0lSCXIpwNXTPY/np/AqP71zJlkaKAwugQ7ylUrhm
	MgLABSVFLq8U19YBL+AJkir5jCyj1jyoXnioAL+o/oGJi6iAgRzYXVHLuvsbr72qOIXfiDy7pHUgZ
	Z3vVH1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFM4l-0000000GgM1-26lc;
	Thu, 15 May 2025 00:03:51 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFM4g-0000000GgL6-1MzS
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 00:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAMlKBZ1KwVilGHAR9/XZGX6qLkE+y33RnTwACcozdWwNLYqRTPmIC+KY1VTO3L44FKqgGJABOvgmIG/A1pczxaCnjbVACKhU4O/8XgYr8o8MazGtuh03gDIVZoKzNuit09DZHwfCuwqKDCyXIYGuBVojsbfq5tjWUTM0/UqLc4PMJ/0/bLLUU3biu8HLZ+rmGZP3QX4ipi6OriyUujuKMPEk0K7MFuJe4cRaTminlAphSqD0RPIv9eXqJGtcBd6bVYxuBLWfj+uT9fvV2uNudoCeSAoAhjVQipCy7AjWaV0EYdbGlkGEMUww2eah6qjDNFnwb6G/BEPg1rH3VDSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1kXJLed8108yXDUW+d0MIhE8HONk53CeM8yQyJ4dZc=;
 b=N8WxSpvXC6vLI0cKRFtQMGlPAFsJtJkqLugXw1DplA3mrN9ByOwCLreDsf+90S9PoXUJ5KngSTLa99ebQWHYybHF7b9Bnd0oQmlMyGFkPB0GnJ52t7xt++QisppTf7T+v/h+aIESGtbt1a2spdjCgpLgrU2l5kHp8nKrvSgp2sOgqm8VbB6gEb2i6Q4WjC9h4IQLeXzFCY418oFxTzSxoNIldiNo5+VlZzshoBkCnwrlVRODa/7fjMIb2Zgafdjes4D30V27j5/nelBdtvSQidhnfUjyWxM/kiSVvj6bdcb0ROuiHlNT4kH8VgW/DHTnWv6KhHuD5nrjnZJXX4CskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1kXJLed8108yXDUW+d0MIhE8HONk53CeM8yQyJ4dZc=;
 b=baCfs1Tfh/ioDXobK1yH3QoROMysac59Mxcq/jRckOsXR4FtynVLhzLYrWeIYt6gsehrFAjnzuQCJwmGStcJVBjScC0zJ24DhkkzwY9YizEwSnlcSB27EwzP5plD37u6RsUHo9zTPjxFSteCsrBPhhHWE+9TlqJKvSlUwTQ0qPJW3Gu0T0nPEfECs7/lxmTmMx8TvBi6gNieKhQwUixKfY26wswjOIsTElmuotZw9BOFxhFgAIfZmwxoe3p2YpiTGcInYXMER47JtDdSDW9w/l3tPyLCg8Lw2plf1Dn7hQqI+SPnoQh4l0lqlBVUdfAfk2uWueR0ycfpYkB3C4lZuw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB2154.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 00:03:25 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 00:03:25 +0000
Message-ID: <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 15 May 2025 08:03:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Inochi Amaoto <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <aCSmNRTVXQ51xj0m@mai.linaro.org>
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <2f8587c7-ac55-46a3-b89f-a48dd6d23edd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB2154:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aab453-f537-4a42-65f3-08dd9343e9cd
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799006|6090799003|8060799009|7092599006|461199028|15080799009|5072599009|1602099012|440099028|4302099013|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXdRYzBMS0tYRkJmYXpBVGx6eTdEU0Rqd0h5MS82UTZqRUowUTQ2WVhlajRE?=
 =?utf-8?B?Ym0zbHFmYXg2WUp1QWp1VFVRQ1FQWDk5cXk3aXVEVENoMlArSzBkWm9pbzda?=
 =?utf-8?B?bmNQSWRjTE5pcEM3TE5TWW8ycEVDL0tPU2E4MlpWNEp1VW1yVE1sNXBsWUtv?=
 =?utf-8?B?dzBKWUo3c3hwZTRRb0NMZWhFSGxnd0JLT2xaNU10dHRBcnFLaFhaTGkwdDR2?=
 =?utf-8?B?SGEzN2ZVd00zc2lGK0ptV2R0ZEZPUTE5TS9TTkRPS0NTa3dkQW9PdmtxaSty?=
 =?utf-8?B?WU9JYVRuRU41dmpOSmlwYlhLQlR1cjdUV2JJZjU3Sks4cElrMy9NdWMvZ0dj?=
 =?utf-8?B?aEZxMDZvY3FDMU5mRFZtTEIxUElrdHRWKzdsTHZDYVRGTW5rVkJZRnl5aFlm?=
 =?utf-8?B?dFo3WnB4M3ozdGVHTnZoeGJKRXlnUmJSZXdUTmRFb3pxLy94enNCK0I4RGtz?=
 =?utf-8?B?bGV4WlBtZmxaN2V5enZNRXo4M1pYaFIzaTUwYVhqcmlHYnM2aWZpQS9NVXhk?=
 =?utf-8?B?VUUxTTFwRWhVSUlpQm96dkttVmM4TGJwcG9qNDF4OWd3OWE0blFiK3dNZjZ5?=
 =?utf-8?B?YzRxU0JGMDgzS1NRdTNOSXB1dDBuR3RncmlRd0xNTDJyaTRSMDdqRTFsOEdB?=
 =?utf-8?B?bkJtWFNjcFpjNzR0K1U2VEFDRTMxUzNVVkNBYkVPRzhvMTcvWjhHUlBwWHhT?=
 =?utf-8?B?S1VVamZBNm5hc3l1MXRVeSszU0cvaEtjdmlBam5nQ1JIcXMvd1dNU0lnWnlm?=
 =?utf-8?B?c21VMlFIcDB4ZWNVTXRPMGRTZ3lLbmppRk9FOVdLOXBwOXFpV2ZvbWhubEVE?=
 =?utf-8?B?L3BqOHdOWGZSOXcwZjB2TDRpTUd0TVhGcHJnYXU0UnJwRVgxNVVMVllhUXJa?=
 =?utf-8?B?VmhiY052cXowMXFEMmExclRmQlJydDhRVDE4MVRmc2ZIdS8rWGNyOEk1RXVn?=
 =?utf-8?B?R2NWbFBsbEJwZHVnaXFKZWtETHQ4R3V6MG96VUt6emM1SThkQ2hmQkxjWGJB?=
 =?utf-8?B?ZHp5SmVUM0taWHQxalpaN1JNSllpZkdqY1U5VU9Xb29jY0xZc0VzU3pwU09W?=
 =?utf-8?B?RnZFblF1bjBMaUxtbTV1NWtyZ2hnY296RWZQTUVSbmtHcnNhTU5wQy8zQzBD?=
 =?utf-8?B?REZPUTdZN0dUaHNxUWZuWVZxa3lnRU9WNUVhTzU5SDV5bGxhaXZoM3dmRFht?=
 =?utf-8?B?akxOVU56blk4TUp4TUd5UDVMcjFFNml6ZnBxcExyWnVmOXlsS3ozR2QxSnhI?=
 =?utf-8?B?b2U4MzNCMXBYMkpQVUNJcE9DK2hvWWdYOGY5NXU3QkJmU2ZUWmNubnI2bFFa?=
 =?utf-8?B?U2RVN3pHRWRhUm05aUJBSlhKdStTRTdPb2ZyYVRUKzY2T0l6d1VsMmxGZ1Zk?=
 =?utf-8?B?OC9JbWNkOFc5V2xlRlNDUWRtSDVzemJnVGhsYVRWTlAvYXFiR3NwR3Jtc2c2?=
 =?utf-8?B?bjZWS1ZKMGdmK3I5ZitEQTl5NmdFeTd1aGNRNFo3SFlpakoxOWZiQnhKbE9U?=
 =?utf-8?B?cDdZSEF2bHBxK1FqamdKNG51d3VSVjMvOGlyR0JOeUV4VXg2aGxpQm1NU05j?=
 =?utf-8?B?UjErem50elBpSjdUbU91NzlPc3Y4ZHRWQTlzV2RvSndPd0pqNS9tZ1JRWWxT?=
 =?utf-8?B?N2RweElETUJXZW9QeFhxN1ZheHpiK204cDZwSDJqL1lrclN1SCtBSy9Oc3ZS?=
 =?utf-8?B?K3NuWUpDSmZzUG0zNEhnMEl4RGZlTE12SGxIaDVjNnhNUmEybE93VjBnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFRSaDd3OXRNS2JENFQwUnZNZXZMMW1xVWErZFZYVldYQXAvM09hQmN2TXBZ?=
 =?utf-8?B?V21Wbkh4a3FKcy91dEdVMjgzZzVyZGRTUnMzNVVTMWp2ai9DRG1JQkgzOFZL?=
 =?utf-8?B?Qk9udlhYWm45RW9VbGRnaXZlT04vMnBRTzM4TGdmMWlYVDdXMDltMEVxWFNX?=
 =?utf-8?B?WlI5ZnZVbkZRSW5UVEZqUkpyOExGcGY3T01heXp1SU96SWxXdnp4UDFiNkti?=
 =?utf-8?B?U0psSHJrMldnMHc5MGkrbG5NQ1lxdG16RGozRUxSbjhKcWc1VktKeG9uUG1p?=
 =?utf-8?B?R1pFVE5YNm5FdnVsNllTZFhXbzk2bTJidWVUUE1OUk9vQVlDSEtPVmhST0Yz?=
 =?utf-8?B?ZkNicmVENjArRHV3NnhIK0hEQ3B5a05lTm9JT1docWlaakNaQ1VmeU5ucncz?=
 =?utf-8?B?Y3NxbzlHMVRtdmJXYWxnd3Y0a3ZoZlIrcVJ0RzRoOTVOS3JRWklkZWNxUzVo?=
 =?utf-8?B?cTFISjhMdzdoamhBbTNPYVBTdHdQUWxaMndRTUVWWHVMNDZQT0o4SFV2c1Vo?=
 =?utf-8?B?YlBJQld2WmJhdVhpVityZUVEenpvMWlWWitLL3JaUXFVTTR3aCt4NTM2RUcx?=
 =?utf-8?B?YzNkYit3R3RNK0hNK1lXK3VaaVJKSEU1VlBYdlpTYVM1S2dhbVMyL0JoZVV3?=
 =?utf-8?B?Nk0rUmJqZWZHQ2JneE1FTWFZYzhMNFpqZnJTdUkvWXVBUHRoTjhJVm5yUzNk?=
 =?utf-8?B?M3lWRVNDTzBhcEd2Vmh3MzlMRVpBVHJ5dDJQTndPV2hlQWVqdGFGdmpERzhY?=
 =?utf-8?B?eXRiNVB5Ry9tdUFQeTgyekQ2enpXc0U5WVVMVFdWVE9aWnhhTzFDZDNkcmlE?=
 =?utf-8?B?L0JweUJRYnVzSnNJS0VNdmNNdW9hMEIwUmNEaG1oaDJ0V0IreU5IYjNkUEdQ?=
 =?utf-8?B?di9IRUcvcE1aYUtLWWdHbVdSOThFNnVhdTJ4SkVDSThVN2VKTTJGcEtUeXVr?=
 =?utf-8?B?dmVOQnQrZXpnbmtIZytlWmFIUGRrRitQVStDL1BBeHpyTlVyY3hqTTVaNlJh?=
 =?utf-8?B?TEtQTGllS1dEVjErbWhpSlpiOFVFYUFGQ285MzBUWC9LQnZMMFh0OEtvN0d2?=
 =?utf-8?B?R3czeVdNODJzRE92Z05IeWd0bGoxNURDSWh4SDBSWFBVeHNaelRMYmNMamdH?=
 =?utf-8?B?OWpnL0tGNm5USWFXQ2FOVXl0VTNUN0xQcTFuTjBTdDJRa0VZYjZKVkJCVW9D?=
 =?utf-8?B?UUNqWjc2Qmo4ZDFPREY4dS9GYW91V0hpSFMwWStFTGwzWU9Oc09FdTYvTVNn?=
 =?utf-8?B?WkJSSE9NcUgrRTgwUU9YcFBJWlRNK0ZyYml1ajQzaGU3OEVaUDVxNnRqMzhB?=
 =?utf-8?B?cjZqMWhUYWo3Tk1sZHFTU2dHaXF0YlExTHB6VTdnMFZCR1V3cndLWEkvbVFB?=
 =?utf-8?B?dlZBelVsdXROQys3NFJzM0ZXdzhneVJ2MDJ2cUhRUXhYejc2cTZlUCtZMzVn?=
 =?utf-8?B?Q1ZvOXM4QmVTcU9JNHZZS2ZibEVOYTA3YmN1RGpMVWtzTnVTU3d6cGYvc3Js?=
 =?utf-8?B?dGFwYzB2T1cyMmdTdXhzTEc3MFdsSkRJNWFSQzZkWUdSSHEyV25UU29HQkJ2?=
 =?utf-8?B?UnhzRjNVWDRFN2h4Ym5tYk1Hd3JOL0l1dFlBdGg3dTdBTlhKQmFyQW1ML2JP?=
 =?utf-8?B?bk5QeWRzdnEwbDlZM3FTWWNEZHlMR3JxTXNYUVE0OHB6S3lJYzNBeFdocFJ6?=
 =?utf-8?B?bTl4d3c5OHBoTEFISUc2T1hDdW9BK0pmd0h5NVFNWEdYU0dhQlZkUjFBR1ZX?=
 =?utf-8?Q?hq1yFoopU7WTXCmhX3CL+cBlQynKVIlWkG+cGz0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aab453-f537-4a42-65f3-08dd9343e9cd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 00:03:25.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_170346_390513_466B0F86 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

Hi, Daniel,

Just a kindly reminder. There is a v2 of this patcheset [1], and I see 
[1/9] of v2 has been picked by Andi [2].

Please double check if anything wrong or conflicted.

Thanks,

Chen

Link: 
https://lore.kernel.org/linux-riscv/20250413223507.46480-1-inochiama@gmail.com/ 
[1]

Link: 
https://lore.kernel.org/linux-riscv/egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7/ 
[2]


On 2025/5/14 22:18, Daniel Lezcano wrote:
> On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
>> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
>> compatible string for SG2044 SoC.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> ---
> Applied, thanks
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
