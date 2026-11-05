Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB22606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tBx/lwMP;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=PTo/a0zS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=2yT0z61ramV8lfDOyK0DMUu8oyZvJ3NavTwtyjjqfMA=; b=tBx/lwMPCIox1Qw+y0c889efxR
	gizqAbUCrogS6kPGZ81UI1hB20DILIASD6wQWxAvggWSzwlBCuV9OznHwbDKZH0OpioXFRC6o+ZrH
	/iwxdYghZApBBGdubFJSnaDKOKOzylgZ8ba93SxcHx8/13VYXY7yDns8ZmJeGKmQ+wsIqqG2o7wG+
	b+WPG0gaex4SUqrV13Dqgb10Jars21RANSJtG1w92/eXmJwH279vH8/d2zzqutlKb+e3yOszTz1cb
	hAIo9zC+iIZxZssWSxamhjtd3C5RWfDSx925+lLkgcThYflJjVjaskeCV29uLzD/YtX2kMgPbCCEr
	MWf9T7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0hv-00000009i44-0ziT;
	Thu, 05 Nov 2026 16:52:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0hj-00000009i0r-17Fe
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzwMZ02xn8bMJOwywd9/xcYLmmGZ8LrMO54nRSGXgIIFMJ6nlYRhslmTqJJLhOCrE/F62SXnUDv2WdNZAjCcNwxKDtI/w8yO5lZrFKBUpT1QXtQViBiER9EfLZSrjYlDR3GGWniO8v3GuKDXMkGOVd9QQFWm4J44RoTNUCaOsspC05PzVf89CxG3PbxJlcdHfYCv0jwSj1olICk7zN0FbdfN94WAjlgtg/thsk76+3YwJLFj9Pg0gCkeE5nDIOKCB1W30O9rVlFdRMQDwUlw0dvrGxL6/Ws8Vnb0NF9Z1skhsWJlvb1KpArqjB33TUMWHC/TyUYs2hiAXkrZE9H0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyWLrXpzq0Q8zj8va2M5NfXGrUPlMop9TMbDquVSRgE=;
 b=vYGws17ZwyIN1y9EZMID/OOs1AdXw6UPNTCBT90on+O283cfsHHuIVXmt6ifGCwq4knb31t3vGjq1ynHc3mV+7z6qeAT+DxMXFvJrBxzNJfZBzDth3xzvVShO7s16sVGcA92vVCjYzn8iOYZke0z4A4jXKe/Zag9qQk59Ufy0ttoKZdDpgAAoohX51xApHP0E6QSaOpfblwVG7SS/MczzlpCDVkPhWDSASFGnNJte2Es8JbABiUMhaZ9MwyM1JbE9HmrpwIdzL3oigNSHThAcPXydhIdWNoddabtZDe6bVwloJoKLoT659A5XJR89BRuFzCrt4tyisyfpq9z4cv4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyWLrXpzq0Q8zj8va2M5NfXGrUPlMop9TMbDquVSRgE=;
 b=PTo/a0zSMJd0foELlH0dEBfIMuejA3xDzXbN19HLKoWvUtNIAP2S8u4QcZELgs5Ree6PaHsg6JPbuA0m77v5xlbzR3lkBu2Z3k18DiQiQb0cixZha76siWQ2mqQ9by2GI3DBU2BW7SUjI4i9Jqg/icyvZEFbvGfS2ql8q+jvizc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by AS4PR09MB6520.eurprd09.prod.outlook.com
 (2603:10a6:20b:4f8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 16:52:42 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 16:52:41 +0000
Message-ID: <fe79cf85-4346-4e7c-920c-0614a8809dbe@mobileye.com>
Date: Thu, 5 Nov 2026 18:52:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] riscv: support CPUs with Zalrsc but not Zaamo
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: pjw@kernel.org, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, peterz@infradead.org,
 Mark Rutland <mark.rutland@arm.com>, gary@garyguo.net, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, cfu@wavecomp.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Olof Johansson <olof@lixom.net>, aleksa.paunovic@htecgroup.com,
 arikalo@gmail.com, boqun@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|AS4PR09MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: a2486a9f-78c6-49a2-0ee4-08df3b5d34aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|261021121427099003|261026140227099003|261026121527099003|261102124527099003|261009223027099003|261028144727099003|261022075727099003|261102123227099003|261022105027099003|56012099006|261022115727099003;
X-Microsoft-Antispam-Message-Info: wnXo/8VDyEXjixPZy2Rdg4e9+oxrBBBvApEOU5kk+d4qlwq6kBlcyTPgMBJSTwvmrEeAi8lBbruueANyD18Y6oRH//aeC6QKlH/0ZZLqsjRzcDIyxe0Fn/FT/ka26bJOyPflylsrGyX5/BtbFwOVnh08L1e/koNTZptjhDseCqq/+Gnd93nk5cd050m98bhUaud0HkdF3xVuDaUTpwmnUAV9XqZpLSVHKkwvtWryXUX4JIe7ZJEVxTvu1LHzLFJ/F1rvkuYuS5c7WFP+11E9RvCeeEeNheZeuk1btzQRq//TVqIW0jhMcEHQ2BC//zSjww70ajK3B0JWaDmtvhmCJjgV9FOR3zRa9i93CTYNBZsHOI7OKmF20tSgc4OqtPWOxJKkbfu+b2wsHNebpLWY/bkmwoY9ltMDyGulNyz4DJhVFEGg4sadbexQaCc+6p4JSh8YVjdkpqkcJyyBQUTB5aKk+GPRO9aITT60hlsKQClkzu+yIYdPxHguPad+tDGUBJghk78Hft4qFx0CridBaHR3CxTLmExUANMxQTBSSV7h0j2ckC40/O1nvPhCbX9K1/zpg1wzT7ol4ANhYw4FZYqrkBkjUdO970yqhvGXaKfotBlkgPpmEhZi4DXI1Zms
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(261021121427099003)(261026140227099003)(261026121527099003)(261102124527099003)(261009223027099003)(261028144727099003)(261022075727099003)(261102123227099003)(261022105027099003)(56012099006)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVB4NVNoaWd6TWNQQkpVUzBtR01TdDAydU1qam0rdTZ2UThzME9yWmt6d0Jj?=
 =?utf-8?B?OGZTeDlxdHdETTlnemxsYUUrUzdkUEkybnpVcmFzSy8yNFZpRkYweHRxREJv?=
 =?utf-8?B?ampGcktaeWtYaDcvYmFZK1ZqbjR1VXlFZFVyeGVPdythRENVczZQWEMzdWNY?=
 =?utf-8?B?RWtZTThzNlZOZlM3Ulp0TmU5SkZ2S1V4OXZ2NmJqQjBsQnVIYUV1ODRYbndK?=
 =?utf-8?B?LzFuRDErYUJFVk1IeUlzcDdoejMxK2NwMkEzN25CbFVJT0lrRzdXQnI1TmdV?=
 =?utf-8?B?RldqVUdtRUFMVWtlcWZuVnF5dStZdjh1emZVcHRBVm9UbXpWMlFyTjBKay9H?=
 =?utf-8?B?dm1LZ0Zid2ZtWUlZUFlpRkgzT2FScGZEKzFUSXRHc3NTbGtNaDM1N1ZsVFJD?=
 =?utf-8?B?d3p6NEVIQ1IzclM4WmhLU1ZGbDMxWEV4cjlYWEkyWVlGWlhVOGRWQzJuL0Nr?=
 =?utf-8?B?ZE9hU01TakpJS255bWxGbTRWUkJMYXhEd2ZhYXp0alpEWG9yL29ucDAraWhk?=
 =?utf-8?B?S2UvbDVYOWRZS0RpTWNCbThpQmhlTFQ2M3RiMXUzRzFlNWhJVkhNYkEyWTlU?=
 =?utf-8?B?QlNscG9WWDl2Ump3T0dFOGo0SEJOTDhocVdtSy9mWEhocTIvVERGa0ZGK29J?=
 =?utf-8?B?RDRpWTRDMTJvUktKWkFYOFI1TnhyMlhzWjZzMnQxODl5RW5yVVRFOWdYZ3Zk?=
 =?utf-8?B?amc1UHFFeFVKSk90ZU5LRmg1dEhReXljUmdiVUdVMzJNRFkva0JFL0wrby9C?=
 =?utf-8?B?a2V0d1k3RFRiQS9SU2hIcXVsNktXZGdEOVFXQWREbVJOR1greVoxajZJV3FN?=
 =?utf-8?B?UHVybVRUZ2ppckYzN1JvMzUxN1h5MG54aXFIMFBBK09wbEFoNHl3dG0vcmhW?=
 =?utf-8?B?eWxxR0JPdkNiY2ZZZEV5ZHVBZ3d4RVVlelo2bXhtbzE1SngrRm83STJvSVIy?=
 =?utf-8?B?Y1JBRHlvR1IvamRRWitpV2FsYk45ZEw3VWQ5Q3k1UW5YTDJBb1dGbm5BdlM2?=
 =?utf-8?B?cGxQRW1QekdnZXdiODZzMyt2TG5GUyt0NEFHaUZ6WG51aDcvQi9IdWFTbHNa?=
 =?utf-8?B?cXFRY2dZZzdpdmhWZklEc2RhNmRMNUxpdVdWREREcXlNK0RFa1hEdlJ5ZkRH?=
 =?utf-8?B?bC9FbEMvek04eE8vbnFORU4yQ1pqVkMwRG1UeG1OUytHSUExYkRzMzNYRFB2?=
 =?utf-8?B?U0d5UGRpRHBOU3ZkNmZuUFdkUU9zblVjRDNMc3QvWXlONkU0NExNcHExM21n?=
 =?utf-8?B?TGZyZDBUL29paGtCKzhqMmgzY0k0TGtDT0hJQlVIV3dWSzdObzBmdy85cG1x?=
 =?utf-8?B?Ui9KOG1GZjVSSkVNVi9hbUtKV0laeHN3KytCTnNCSi8wRUFWK3doeGJUMllM?=
 =?utf-8?B?dUpTTVJHNUFrVHY0d20zcDlrMG9VaGZ2L3VqbEpLeWNLNXg4dnFKZ0puMHA3?=
 =?utf-8?B?Sjg5N1dyd2ZiRXpSWEtQeXQ0WWpGTFBGemh5WTRKR3F4S0RnVWZtNThxSUg1?=
 =?utf-8?B?UU8xSURoZlF1ZVVRa3dnbmZiSFRwUDhGZUo5RDZOQk5zeENxU2xIdGp3MGdm?=
 =?utf-8?B?NkFYakF1bnlQYW5mNlRvM21RRlFGREdjUTljUGN3TGdBMG5pQm93Umd6UFVl?=
 =?utf-8?B?ZUlpSkZRRXB3YVhMVEl3bEdZclNXMlVSTGZaVldYbjhtSytoNEtmdkVVdmxU?=
 =?utf-8?B?cWc0bnkvYTNQVEJRaktJTmdLN2wxSGNBOHk3N1BicWpNSXBNWittamFjTlJn?=
 =?utf-8?B?SW1zb2VudDVwZ0kxQno2Q1lxNXllaXlSeW5oeTFRcllObTZYVkRHQitYVTZI?=
 =?utf-8?B?LzZobmNYTlU4alc5RnlrTnV0LzRHaEhFRU9teDMrMEtIbDJ1VmV4bHIrTm1P?=
 =?utf-8?B?enVLT2xUQ0pUdjNqNHlBQnRkMjJLVmZJM2xxRXloRXJzVUlCU1dHZE80VHQ4?=
 =?utf-8?B?bWc3bnhGdDQvd2xIUmlaSFVodkNLZXo3QTN2WGFIQURmT0R3WUdSZGZlNmU0?=
 =?utf-8?B?ZjVhWERUSDFjbm0zbFl1a05JS0V0Qlh4dk9wcDJlNHkvSXpsWk5pVkZ2SEx2?=
 =?utf-8?B?SStrUUQ2cUNYNDgzOU4wTkxDb0Y0cmVOSWVnREtxd0ZzLzZ0Nzl5Um1SUUV3?=
 =?utf-8?B?Zmd2b01VeDFtYlZKeldsVkxaWkJwZXZ0dVpOMEtscUdtUVRYN1ZRMFQrOVdC?=
 =?utf-8?B?WG5zRHlsYlZmZEE1ZUQwdStMVVBwZjZ3RnpPTElUb0FQM0hRclc0SFprOUpH?=
 =?utf-8?B?eklFM3pURElVYXNKemtXOHRjT24wSmx0N2pHVldjZEpTZWhUZTFDdGtYSnhR?=
 =?utf-8?B?Skt0N2lZb0pySC9RMmV0clJwN1duckg0VjZzTmNPeGVUd05vbkZodz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2486a9f-78c6-49a2-0ee4-08df3b5d34aa
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:52:41.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHvZmsipfDiMmbFG/at7eMfqwsvLu/yPz91cbbGfYoc5vFx4IHvQQuW2j7F/RuPNdMTBORyCnkrm6eIzmaHf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB6520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_085247_592157_FB38CCDB 
X-CRM114-Status: GOOD (  41.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4gUklTQy1WIHNwbGl0IHRoZSBBIGV4dGVuc2lvbiBpbnRvIFphYW1vIChBTU8qLncvQU1PKi5k
KSBhbmQgWmFscnNjCj4+IChMUi9TQykuIExpbnV4IGhhcyBzbyBmYXIgcmVxdWlyZWQgdGhlIHdo
b2xlIEEgZXh0ZW5zaW9uLgo+Pgo+PiBNSVBTIFA4NzAwIFsxXSBpbXBsZW1lbnRzIG9ubHkgWmFs
cnNjLiBBTU8gaW5zdHJ1Y3Rpb25zIGFyZSBlbXVsYXRlZCBieSBhCj4+IHRyYXAgaW50byBTQkku
IEkgbWVhc3VyZWQgdHlwaWNhbCB1c2Vyc3BhY2UgYXRvbWljcyBvbiB0aGlzIENQVTogYW4KPj4g
TFIvU0MgYXRvbWljIHRha2VzIGFib3V0IDQwIGN5Y2xlcywgYW4gQU1PIGF0b21pYyBhYm91dCA2
MDAuIFRoZSBzYW1lCj4+IHJhdGlvIGFwcGxpZXMgdG8ga2VybmVsIHJlZmNvdW50cywgYml0b3Bz
LCB4Y2hnIGFuZCBmdXRleGVzLCBzbyB0aGUKPj4ga2VybmVsIG5lZWRzIHRvIGVtaXQgTFIvU0Mg
d2hlbiBaYWFtbyBpcyBub3QgaW1wbGVtZW50ZWQuCj4gCj4gSW4gUklTQy1WIGxhbmQsIHRoaW5n
cyB0aGF0IGFyZSBpbXBsZW1lbnRlZCBieSBNLW1vZGUgdHJhcHMgYXJlCj4gZ2VuZXJhbGx5IGNv
bnNpZGVyZWQgImltcGxlbWVudGVkIiBpbiB0aGUgY29udGV4dCBvZiBzdXBlcnZpc29yIG1vZGUs
Cj4ganVzdCBpbXBsZW1lbnRlZCB0byBoYXZlIGxvdyBwZXJmb3JtYW5jZS7CoCBJIGRvbid0IGFn
cmVlIHdpdGggdGhhdAo+IGRlY2lzaW9uLCBidXQgdGhhdCdzIHJlYWxseSBhbiBJU0EgdGhpbmcg
YW5kIG5vdCBzb21ldGhpbmcgd2UgY2FuIGRvCj4gdGhhdCBtdWNoIGFib3V0IGl0IExpbnV4Lgo+
IAo+IFNvIEkgdGhpbmsgdGhlIGZpcnN0IHRoaW5nIHlvdSBuZWVkIHRvIGRlY2lkZSBoZXJlIGlz
IGhvdyB5b3UncmUgZ29pbmcKPiB0byBiZSB0cmVhdGluZyB0aGUgYXRvbWljczogYXJlIHRoZXkg
cmVhbGx5IHVuaW1wbGVtZW50ZWQsIG9yIGFyZSB0aGV5Cj4gaW1wbGVtZW50ZWQgYnV0IHNsb3c/
wqAgUmlnaHQgbm93IHRoaXMgaXMga2luZCBvZiBhIG1peGVkIGJhZzogeW91J3JlCj4gc29ydCBv
ZiB0cmVhdGVkIHRoZW0gYXMgdW5pbXBsZW1lbnRlZCBpbiB0aGUga2VybmVsIChvciBhdCBsZWFz
dCBwYXJ0cwo+IG9mIHRoZSBrZXJuZWwpLCBidXQgdGhlbiBpbXBsZW1lbnRlZCBpbiB1c2Vyc3Bh
Y2UuCj4gCj4gSWYgeW91J3JlIGdvaW5nIHRvIHRyZWF0IHRoZSBBTU9zIGFzICJpbXBsZW1lbnRl
ZCBidXQgc2xvdyIsIHRoZW4gSQo+IHRoaW5rIGl0J3MgYmVzdCB0byBzZWUgc29tZSBhY3R1YWwg
cGVyZm9ybWFuY2UgbnVtYmVycyBmb3IgYSByZWFsCj4gYXBwbGljYXRpb24uwqAgU3VyZSA2MDAg
Y3ljbGVzIGlzIHNsb3cgZm9yIGFuIGF0b21pYywgYnV0IEkgd2FzIHJlY2VudGx5Cj4gcGxheWlu
ZyBhcm91bmQgd2l0aCBzb21lIG11Y2ggbGFyZ2VyIHN5c3RlbXMgd2l0aCB+MzAwIGN5Y2xlIEFN
T3MgYW5kCj4gY291bGRuJ3QgZ2V0IGFueSBtZWFuaW5nZnVsIGJlbmNobWFya3MgdG8gc2hvdyB1
cCBvdmVyIHRoZXJlIC0tIHRob3NlCj4gd2VyZSBPT08gY29yZXMgYmxvY2tlZCBvbiBidXMgcmVz
b3VyY2VzLCBzbyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50Cj4gcHJvYmxlbSwgYnV0IGp1c3Qgc2F5
aW5nIHRoZXkncmUgNjAwIGN5Y2xlcyBzbyB3ZSBjYW4ndCB1c2UgdGhlbSBpc24ndAo+IHJlYWxs
eSBnb29kIGVub3VnaCAtLSBwYXJ0aWN1bGFybHkgd2hlbiB0aGUgYWx0ZXJuYXRpdmUgaXMgNDAg
Y3ljbGVzLAo+IHdoaWNoIGlzIGFsc28gc3VwZXIgc2xvdywgc28gaXQncyBub3QgbGlrZSB5b3Ug
Y2FuIGJlIGRvaW5nIGFsbCB0aGF0Cj4gbXVjaCB3aXRoIGF0b21pY3Mgb24gdGhlc2UgY29yZXMg
ZXZlbiB3aXRoIHRoZSAiZmFzdCIgc2VxdWVuY2VzLsKgIFlvdSdyZQo+IHByb2JhYmx5IGFsc28g
Z29pbmcgdG8gbmVlZCBzb21lIHdheSB0byB0ZWxsIHVzZXJzcGFjZSBhYm91dCB0aGlzCj4gImlt
cGxlbWVudGVkIGJ1dCBzbG93IiBiZWhhdmlvciwgc2ltaWxhciB0byBob3cgd2UgZGVzY3JpYmUg
bWlzYWxpZ25lZAo+IGFjY2Vzc2VzICh3aGljaCBpcyBhbGwgYSBiaXQgb2YgYSBtZXNzeSByZXRy
b2ZpdCwgc28gbWF5YmUgZG9uJ3QgY29weSBpdAo+IGV4YWN0bHkpLgo+IAo+IElmIHlvdSdyZSBn
b2luZyB0byB0cmVhdCB0aGUgQU1PcyBhcyAidW5pbXBsZW1lbnRlZCIsIHRoZW4gd2UgbmVlZCBz
b21lCj4gd2F5IHRvIGRlYWwgd2l0aCB1c2Vyc3BhY2UuwqAgUmlnaHQgbm93IHdlIGhhdmUgQSBh
cyBwYXJ0IG9mIGFsbCB0aGUgYmFzZQo+IGJlaGF2aW9ycyB3ZSBleHBvc2UgdG8gdXNlcnNwYWNl
LsKgIFdlIHVzZWQgdG8gaGF2ZSB0aGUgbm9uLUEgdXNlcnNwYWNlCj4gc3VwcG9ydCwgYnV0IHdl
IGRlY2lkZWQgdG8gZHJvcCBpdCB3aGVuIHVwc3RyZWFtaW5nIHRoZSBwb3J0IGJlY2F1c2UgaXQK
PiBkaWRuJ3Qgc2VlbSB1c2VmdWwgdG8gYW55b25lLsKgIFRoZXJlIHdhcyBhIGRlc2lnbiBza2V0
Y2hlZCBvdXQgaGVyZSB3aXRoCj4gYSBWRFNPIGNhbGwgZm9yIGNtcHhjaGcoKSB0aGF0IGxvb2tl
ZCBzaW1pbGFyIHRvIHNvbWUgb2YgdGhlIG5vbi1BIEFybQo+IHN5c3RlbXMsIGJ1dCBhcyBmYXIg
YXMgSSBrbm93IG5vYm9keSdzIGltcGxlbWVudGVkIHRoYXQgaW4gdGhlIGtlcm5lbCBvcgo+IHVz
ZXJzcGFjZSBzbyBpdCdkIG5lZWQgdG8gYmUgcHJvdmVkIG91dC4KClRoYW5rcyBmb3IgdmVyeSBj
bGVhciBkZXNjcmlwdGlvbi4KClJpc2MtdiBzcGVjIHNheXMgIk0tbW9kZSBjYW4gYWxzbyBiZSB1
c2VkIHRvIGltcGxlbWVudCBmZWF0dXJlcyB0aGF0IGFyZQp0b28gZGlmZmljdWx0IG9yIGV4cGVu
c2l2ZSB0byBpbXBsZW1lbnQgaW4gaGFyZHdhcmUgZGlyZWN0bHkuIgpoZXJlOiBodHRwczovL2Rv
Y3MucmlzY3Yub3JnL3JlZmVyZW5jZS9pc2EvdjIwMjYwMTIwL3ByaXYvbWFjaGluZS5odG1sClRo
aXMgbWVhbnMgSSBzaG91bGQgdHJlYXQgdGhlIEFNT3MgYXMgImltcGxlbWVudGVkIGJ1dCBzbG93
Ii4gU28gSSB3aWxsCmtlZXAgYWR2ZXJ0aXNpbmcgImEiIHRvIHRoZSB1c2VyIHNwYWNlIGFuZCBy
ZXBocmFzZSBjb21tZW50cy4KPj4gTW9iaWxleWUgaXMgZ29pbmcgdG8gdXNlIHRoZSAiZXllcTdo
IiBwbGF0Zm9ybSwgYnVpbHQgb24gdGhpcyBDUFUsIGZvcgo+PiBBREFTIGFuZCBhdXRvbm9tb3Vz
IGRyaXZpbmcuIEtlcm5lbCBhdG9taWNzIGFyZSBvbiB0aGUgc2NoZWR1bGluZywKPj4gbWVtb3J5
LW1hbmFnZW1lbnQgYW5kIGRyaXZlciBwYXRocyBvZiB0aGF0IHByb2R1Y3QsIHNvIHRoZSBlbXVs
YXRlZAo+PiBBTU8gY29zdCBpcyBub3QgYWNjZXB0YWJsZSB0aGVyZS4KPiAKPiBJcyB0aGF0IGFu
bm91bmNlZCBhbnl3aGVyZT/CoCBBbGwgSSBjYW4gZmluZCBpcyBhbiBFeWVRIDYgb24gdGhlIHdl
YnNpdGUuCgpOb3QgeWV0LCBpdCBpcyBzdGlsbCBpbiBkZXZlbG9wbWVudC4gV2l0aCB0aGUgZXll
cTdoLCB3ZSdyZSB0cnlpbmcgdG8KdXBzdHJlYW0gZWFybHkuIFRoaXMgaXMgd2h5IHBhdGNoZXMg
YXBwZWFycyBiZWZvcmUgb2ZmaWNpYWwgcGxhdGZvcm0KYW5ub3VuY2VtZW50Lgo+IEFsc286IGFy
ZSB5b3UgcGxhbm5pbmcgb24gY29udGludWluZyB3aXRoIHRoZXNlIG5vbi1BIHN5c3RlbXM/wqAg
VGhvc2UKPiA0MC1jeWNsZSBhdG9taWNzIGFyZSBnb2luZyB0byBidXJuIHlvdSBhdCBzb21lIHBv
aW50LCBpZiB0aGUgcGxhbiBmb3IKPiB0aGUgbmV4dC1nZW5lcmF0aW9uIHN5c3RlbXMgaXMganVz
dCB0byBnbyBpbXBsZW1lbnQgQSB0aGVuIG1heWJlIGl0J3MKPiBiZXN0IHRvIGtlZXAgdGhpcyBv
dXQgb2YgdHJlZS7CoCBXZSBhbHJlYWR5IGhhdmUgd2F5IHRvbyBtdWNoCj4gZnJhZ21lbnRhdGlv
biBpbiBSSVNDLVYgbGFuZCBhcyBpdCBpcywgd2UgZG9uJ3QgbmVlZCBhbnkgbW9yZS4KClRoYXQn
cyB0aGUgaGFyZHdhcmUgSSBoYXZlLiBJbiB0aGUgYXV0b21vdGl2ZSBpbmR1c3RyeSBwcm9qZWN0
cyBhcmUKbW92aW5nIHNsb3dseSBhbmQgc3RheXMgZm9yIGEgbG9uZyB0aW1lLiBUaGlzIFNvQyBn
b2luZyB0byBiZSB1c2VkIGluCnNhZmV0eSBjcml0aWNhbCBhcHBsaWNhdGlvbnMgc28gSSdkIGJl
dHRlciBoYXZlIGl0IGluLXRyZWUuCgpUaGF0IDQwIGN5Y2xlcyB0aW1pbmcgZm9yIExSL1NDIGlz
IGJlY2F1c2UgcmVzZXJ2YXRpb24gbW9uaXRvcnMKaW1wbGVtZW50ZWQgaW4gdGhlIHBvaW50IG9m
IGNvaGVyZW5jeSwgaS5lLiBMMgoKQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIEkgdGhpbmsgdGhl
cmUncyAzIG9wdGlvbnMgdGhhdCBjYW4gYmUgdXNlZApyZWdhcmRpbmcgYXRvbWljczoKCjEpIGZ1
bGwgIkEiIHN1cHBvcnQgKHN0cmljdGx5IHNheSwgKyB6aWNjcnNlIGJ1dCBpdCBpcyBub3QgZm9y
bWFsbHkKcmVxdWlyZWQgYnkgdG9kYXkncyBrZXJuZWwsIGtpbmQgb2Ygc3VwZXItc2V0IG9mIDIp
CjIpIHphbHJzYyArIHppY2Nyc2UKMykgemFhbW8gKyB6YWNhcwoKMSkgaXMgd2hhdCBpcyBzdXBw
b3J0ZWQgbm93OyBJIGFtIGFkZGluZyBzdXBwb3J0IGZvciAyKSB3aGlsZSBsZWF2aW5nCm9wdGlv
biBmb3IgMykKCj4+IFRoaXMgc2VyaWVzIGtlZXBzIHRvZGF5J3MgZGVmYXVsdDogYm90aCBleHRl
bnNpb25zIG9uLCAtbWFyY2ggc3RpbGwKPj4gY29udGFpbnMgImEiLCBnZW5lcmF0ZWQgY29kZSBp
cyB1bmNoYW5nZWQuIFR1cm5pbmcgWmFhbW8gb2ZmIGlzIGEKPj4gTk9OUE9SVEFCTEUgY2hvaWNl
LiBUaGUgcmVzdWx0aW5nIGtlcm5lbCBtYXRjaGVzIG9uZSAtbWFyY2gsIHdoaWNoCj4+IHVzZXJz
cGFjZSBoYXMgdG8gdXNlIGFzIHdlbGwsIHNvIGEgcnVudGltZSBhbHRlcm5hdGl2ZSB3b3VsZCBu
b3QKPj4gcHJvZHVjZSBhIHBvcnRhYmxlIGltYWdlLgo+IAo+IEl0J3MgcmVhbGx5IG5vdCBub24t
cG9ydGFibGUsIHRob3VnaDogdGhlIFphbHJzYyBjb2RlIHJ1bnMgZmluZSBvbgo+IHN5c3RlbXMg
dGhhdCBzdXBwb3J0IFphYW1vLCBpdCBqdXN0IG1heSBiZSBhIHBlcmZvcm1hbmNlIGlzc3VlLsKg
IEknbSBub3QKPiBzdXJlIGFueW9uZSdzIGFjdHVhbGx5IG1lYXN1cmVkIHRoYXQsIGJ1dCBJIHRo
aW5rIGl0J3Mgc2FuZSB0byBqdXN0Cj4gYXNzdW1lIHRoYXQgbmF0aXZlIEFNT3MgYXJlIGdvaW5n
IHRvIG91dC1wZXJmb3JtYW5jZSBMUi9TQyBvbiBfc29tZV8KPiBzeXN0ZW1zLsKgIEl0J3Mgc3Rp
bGwganVzdCBhIHBlcmZvcm1hbmNlIHRoaW5nLCB0aG91Z2guLi4KClRoYXQncyBjb3JyZWN0LCBk
cm9wcGluZyBOT05QT1JUQUJMRQoKTmV4dCBzZXJpZXMgd2lsbCBhZGQgdGhlIEJQRiBKaXQgZml4
LCBhbmQgcGF0Y2ggdG8gcmVqZWN0IGtwcm9iZS91cHJvYmUKaW5zaWRlIHRoZSBMUi9TQyBibG9j
awoKVGhhbmtzLCBWbGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
