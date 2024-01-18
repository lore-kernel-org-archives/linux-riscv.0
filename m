Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDD9C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3sLsNmOLcBjnsABvXdXpU8yPtD0a3XU8ppaL0Gu0y4=; b=DChWtjfRP3etWW+VwRoeGke76p
	IbN62gc01Va4GvEenPohbyMCtQ9J1jK6l0Hp9mDoH2GlhXfG0vNB4jy+p8xxPGsE7uU7I4A0+wRzO
	DKo+uHnUS+BD38nwHoIuYmMaadTVxvFNDPyVrtUwzOLHoOC7Q5bcRHJbXD1nTU7xnsedpQHMPJjBL
	lcgrwAi+Bi4Bd9wZd1D+NMQlTiIlgJElx6q9lpzn7E9gbYANXJ31u0itxa70QaESQTNGS5uD4ES79
	+6gmrfJ6YUHD3Xk6HbF2JGKInayz0lAg0rjRkc0o7yeiUbQeg6FXo5nQ93EoS3AQGHL2J0V0Ea8PD
	Jxg2K+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPAg-002LbX-2E;
	Thu, 18 Jan 2024 09:58:50 +0000
Received: from mail-dm6nam10on2097.outbound.protection.outlook.com ([40.107.93.97] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPAb-002LZ1-0q;
	Thu, 18 Jan 2024 09:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQIGEtWootoUXey9ZzcMd+launavz0klPqSWIYNE3l6Q06VgjkKcFZhVZ7T9SB2Bj0TxEoq5iooJgKrf7CKh9TvX2iQBZ9UWwDwwLfYy+u+uarII15VN2rbeeMbzi84u0dc6UeWEn0r/JvFelQp1SSPatb1S3ireSyJx0IgGnOax4qPrN51oz5MZRxqF6Yhr9AmDTXtF1Umgor47POCNs7SiC2xhYdDNqs/s/Wob6DQJlUnXLP2IcZ/Wc9La7r1OgkV9GFVdULy6OZLbOFBxaRi/UDXJOY2160dCgtYqftBAdDNs6/ZLt9tq751RwaC1axjT4r3564ia0Z5q4fE7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge6lr17kU3oUFaV/jyv+EtN3EYLB8BzBl/9CAG63juA=;
 b=KRK0kiIRvrCeXiinoTIalbdXgFY4uvxVHMKt1DCAqK9CMZqVuZSYjDhWUowVhLqq8i2DOUmuVrYRB4i8RuetW3wJuOfAgWjYRvzkL3IqiFU55+mS0Yt4FsoTFZJJfT3qwFJjUJk75b8Hq5/T4V/xEeOEtley4KtQL1zK8iSVAe3mB1IZbTZPH8woazhauLcTcsKMbEksc3CXL++Q4qHkqWji4QJNXSKr/GyTsYkp4flB96kY+rFfDUz5Jwss3w/vY6PXbuwuCAEPh4e0r5Oj2fgmWmZ/FVlF+zAJ5wcF9heL0//sYpA7Lyd7aCibKAgIqI8Ytubi0auh5SwCt/P4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge6lr17kU3oUFaV/jyv+EtN3EYLB8BzBl/9CAG63juA=;
 b=lGGCFvddQL5/UNUdunC+S1VfH55GIsOiqTaju5/b6j1isVr7QkYUymKHO8MUaY4A/NPKzEYRs3+TvCUBryKRIO/DAK30mLyvc4ubkubtDgOlgKU/5R+CuhhG5nGA6vGY8IdpJ8Jl78BOwATT21QFfkBG3+yyg7IAq3X8yFETye0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BY3PR01MB6690.prod.exchangelabs.com (2603:10b6:a03:363::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Thu, 18 Jan 2024 09:43:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7159.020; Thu, 18 Jan 2024 09:43:45 +0000
Message-ID: <b5d793c6-2951-474c-8439-8f541e65a538@amperemail.onmicrosoft.com>
Date: Thu, 18 Jan 2024 17:43:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
To: Greg KH <gregkh@linuxfoundation.org>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: patches@amperecomputing.com, rafael@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, yury.norov@gmail.com,
 kuba@kernel.org, vschneid@redhat.com, mingo@kernel.org,
 akpm@linux-foundation.org, vbabka@suse.cz, rppt@kernel.org,
 tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
 mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 cl@os.amperecomputing.com
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
 <2024011820-path-throat-b7c8@gregkh>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <2024011820-path-throat-b7c8@gregkh>
X-ClientProxiedBy: CH5P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1f2::7) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BY3PR01MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e947797-4c3c-4723-03d4-08dc1809f6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdZniYWrIC5GGNy6Y5Nx+uFe/EeEFGaJMxT4FLkpYoq9jFk/Zh78+NlUrvmCOyamvFXClpqF8wiUp2GeWQfT9sFYwNUO43VkLG6+EG8rMms5+q7CpAA3eOCBnYgAItmvJb+B6A3Ot+E11WqHbOcpa1eYMciBpX5QGyj650S1kq6dVxn7r9D6KNj44S2rmifNqM0I1dTMSV50kSW4qTDxjIjymbUFwVLlXXGUg2KWvGEoI9NTC7MjFeKe4X2CsmmDcZ1m8PQBBXaM1AHMuOmAQGKBbr71EyytL59AShmiAnnWXeX0HKd/LHjatSm8IuQPH8uGQdN/jPa8sfF0eVwg+Ur2x5Aa190l//SZEMkv335Q/KZXpHJbxrPVRRPKladiZ+42A6KW2IzUf65W2T/6Yv8uoqwgPFg3e92btpZwcFIhGxMGV/qnFAJr7z24d9anN+UgFCCNWnzVgJgay21RNluVqNa4c87K1UIeTfMwMMWjV30kfI7OYEthIjDhMTcqlmMGmo/ElDj57UeCWqvYPdJl3910TkViJdZJllC8HNKwHP4Xkd+3WAFmINdUD905GkKomxIetrDlR/7Tmqadm1EhcJtu+RIfNvcZjV68iYCLaCx11zsWIHMkkOkOWiQvSgyCfuskESIt96i49xEjwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39850400004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(6506007)(38100700002)(6666004)(42882007)(2616005)(6512007)(107886003)(7416002)(5660300002)(4326008)(8936002)(2906002)(41300700001)(6486002)(4744005)(8676002)(478600001)(66946007)(66476007)(110136005)(66556008)(316002)(83170400001)(31696002)(31686004)(41533002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ZTb2w3Rmx1SFNCTEs2RkR6WUludUtrNkkrUFRDVFBoMlM4UUI2blpNRU9i?=
 =?utf-8?B?Sk8wVHdMYVN4M1VEc1dZeDRGam1BY1M4VGRwV2N0MW1tSmhybjRFTVJHa0Fx?=
 =?utf-8?B?NGE4d01jUDVITmlwUTUyYjUwTkNJWUZsNnNzOUxxTkVyRXczWWVHOTg4cS9r?=
 =?utf-8?B?UTNVcHFMMjBBbCt6Wkl3NHFCcENOVEIvb1RBcnlmSjVuRWRZNkZxWkl3NnpC?=
 =?utf-8?B?TnNTemR5NXVFd0dya1VTNmVrUUxLMFovbHpGYVhpZHlKdnlDL2o1dFlZeTNX?=
 =?utf-8?B?ZFBSVjZTanBvQ0xRS2RlYURrc0V6aCt6UDhqMXZ5OU5TTW9RQmVsL2hkQytV?=
 =?utf-8?B?RUFIcWxJNE9qeTlGbTNKWHRpME1RekorUnRxT3RQOEJiaHFwWVFtVExkWVYx?=
 =?utf-8?B?NG1hZFhRTURqc2xWTHdMdnhubkRFOEZua0o3bmliOEVsNjUwT1JrUjhISHc3?=
 =?utf-8?B?SFF2NVViMnYvSkNaZGNmYW1qWVQxSXVnOE4rVXdqOWpIZ0hPY2xURFNqWlZm?=
 =?utf-8?B?c1dvdHhnT2U1dnFpT3d3eUVkOXd3TGFiUnNHaVhBY1lrVnZqVm9NQWNBOXdU?=
 =?utf-8?B?U0RCZlNzOFJVaWJRVGNhbGVDb2hWeFdWQlpGc3hlTkZXeGhiWU5ZQkt6ZW42?=
 =?utf-8?B?MDFiMitKWElJYjNCWThxUWhDT1JPM0JSZVlpT3ZvUGZPMXE1bUJuTVZKeHNl?=
 =?utf-8?B?c0pKRzZUak9pbEhMNkNZQVdTalNXZnJxa3k0R0Jxb1NRK3IzMnBseVhqRWRJ?=
 =?utf-8?B?UnJDYUZqUzFqUlFrZjhGKzRYNXVTVlRvMzVRNmZQWVN5NXBRMnJhbUJNNy9a?=
 =?utf-8?B?aXVQZHBDbjBydllCM1hoR0JIaldUQTB5VWtzNkY0bENLWkNSOVUyeEdxbi9i?=
 =?utf-8?B?VEJZb3BHMWZybEQ4S2FuTU9LWHhEWTV5V3VSbjRGUlpkTlp0Nlg5VCtvNFBG?=
 =?utf-8?B?aGtrQkNCN0RMQ1lDY1lldWpTeDE3a1o2UGpGcjhYNEovSUVVaXRHQmpLMWhn?=
 =?utf-8?B?c3l3RXBHZWxSSmk4R2d0TzdPREsxS3cwQlJwZUVSVjJyQmhEeS9wTUx0b0pl?=
 =?utf-8?B?d1Vtc29wSGVIOEVjY2JCT3VuZmV1MFdoc2hidjNxRkNSOVJWblJYS3lKNFF2?=
 =?utf-8?B?d2piTWduQXRxRUUyTEYwRUgxcWl0UjhPb3hXMFFqVWFvZ2E1ZDJCb1ZTbksw?=
 =?utf-8?B?NFNFdHRHN3RUVldnZlRHOERDSlV4MVVvdVp6ajRhdVpFdUh5MWRRMm1tazBZ?=
 =?utf-8?B?UUpqYkxHc2RRaGdMejI2OVdWODJaS3ZzTEh3MW82bGVhWW4zRTdoTlVHYWRI?=
 =?utf-8?B?cHlmdUZ0SXR6bnBwZUxMQWFJN29hOGxYYnNybm5DVmtJWlpSTFkzM1ZqODBH?=
 =?utf-8?B?eEx0c2dvamROeXZGV3YxSndad2tnaUJkVmhTaWVSWnVzcDlPMERXaHVvcnlk?=
 =?utf-8?B?ZlIyNUs3amd5UDQ0WXR6OHhacWR3UHRpcmc0a0ZSc2dGbndrdDU3UVBDS0hu?=
 =?utf-8?B?Z2hPK2NUNGNoNDAvcmF6cERxUjBmWGNyVmZoeDFYNWg4dkxZL2FzWGdUc2hs?=
 =?utf-8?B?VXBHZHdvRnpOMHhwamM1ZFZBd25JTVMyeUVJcG1XQ1lhcjMyZktSZFlCS05C?=
 =?utf-8?B?NStEc0hiaDVqSjNhNlNEaFJuUnpKampnclc4Rlc4RlRFOHVrUGhnYkJJVlpt?=
 =?utf-8?B?OHBUSjU2RlVaM2pyUHBTWWxxam8vbkVVZnltMElvUm56QVlxMVNrVjZTeFFS?=
 =?utf-8?B?WUY4QlgySEtBZXFJa1JwRGxSQi9GV3l1UWNyWVJJaytGUVVJNWQ2dUc5a3Fj?=
 =?utf-8?B?UUp2bDY1RFM5ZVk5bHU1dVBUTzJ6SXEvR3pCcUFDc2J3Y0FhZEdEMUpFallB?=
 =?utf-8?B?cmhiOEdqU2x0REtYbXlSSmEvVzVKRkorUk9aajhDL0JBREtjQWViZ0FLNVA2?=
 =?utf-8?B?UC9HM002YXROZUtBV1lFeEpSOEtPb0RjblN4SkZraTBPaHJETURpczFRY0tq?=
 =?utf-8?B?T250d21nU1A1ekZucjFrSTRZdjU3ajBwTlIvSHA1VlhaeTg5VEErT20xZXNm?=
 =?utf-8?B?MmpZSjBaRG8rdkJnNlRlYUVXMXBnUmUrcVNsV2luRExGd2F3Sk0zZVJVL0Qy?=
 =?utf-8?B?OG1BelBxZHJIYUg1eUpFTDhuNXIxM1ozQVdGVlN2c3VYSzllaXFQY0tJNzls?=
 =?utf-8?Q?bf/LcA/Ft4kE5Pe0rCf1Md4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e947797-4c3c-4723-03d4-08dc1809f6c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 09:43:45.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q3TpdTXa7ZTHeqzxbkBIx32wdM03n3dQGMoyZ6K6JvjU77V364stTIgahzhdrnk+G1IdSlnDaEXONK6XuS8UpLoHZAans7qDBI9sWMh/AOgONjkTxrX+r/Jpm34urEI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_015845_310623_D33ED81C 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgR3JlZywKCuWcqCAyMDI0LzEvMTggMTc6MjcsIEdyZWcgS0gg5YaZ6YGTOgo+IE9uIFRodSwg
SmFuIDE4LCAyMDI0IGF0IDExOjE0OjEyQU0gKzA4MDAsIEh1YW5nIFNoaWppZSB3cm90ZToKPj4g
KDApIFdlIGxpc3QgdGhlIEFSQ0hzIHdoaWNoIHN1cHBvcnQgdGhlIE5VTUE6Cj4+ICAgICAgICAg
YXJtNjQsIGxvb25nYXJjaCwgcG93ZXJwYywgcmlzY3YsCj4+ICAgICAgICAgc3BhcmMsIG1pcHMs
IHMzOTAsIHg4NiwKPiBJIGRvIG5vdCB1bmRlcnN0YW5kIHRoaXMgZm9ybWF0LCB3aGF0IGFyZSB5
b3Ugc2F5aW5nIGhlcmU/CgpTb3JyeSBmb3IgdGhlIGNvbmZ1c2luZy4KCgpJIHNob3VsZCBwdXQg
dGhlIGNvbmNsdXNpb24gYXQgdGhlIGJlZ2lubmluZzoKCiDCoCBUaGUgZ2VuZXJpYyBjcHVfdG9f
bm9kZSgpIGhhcyBidWcgaW4gc29tZSBzaXR1YXRpb25zLgoKIMKgIFRoZSBnZW5lcmljIGNwdV90
b19ub2RlKCnCoCBkb2VzIG5vdCB3b3JrIGluIGFybTY0LCBwb3dlcnBjLCByaXNjdiAKd2hlbiB0
aGUgQ09ORklHX05VTUEgaXMgZW5hYmxlZDoKCiDCoMKgwqDCoCBUaGUgY3B1X3RvX25vZGUoKSBp
cyBjYWxsZWQgYmVmb3JlIGl0IGlzIGluaXRpYWxpemVkLgoKIMKgU28gYWxsIHRoZSBmb3VyIHBs
YWNlcyBhcmUgc2V0IHdpdGggdGhlIHdyb25nIG5vZGUgaWQgKGdldCBieSAKY3B1X3RvX25vZGUo
KSk6CgogICAgICAgICAgICBhLikgZWFybHlfdHJhY2VfaW5pdCgpICAgICAgICAgaW4ga2VybmVs
L3RyYWNlL3RyYWNlLmMKCSAgIGIuKSBzY2hlZF9pbml0KCkgICAgICAgICAgICAgICBpbiBrZXJu
ZWwvc2NoZWQvY29yZS5jCgkgICBjLikgaW5pdF9zY2hlZF9mYWlyX2NsYXNzKCkgICAgaW4ga2Vy
bmVsL3NjaGVkL2ZhaXIuYwoJICAgZC4pIHdvcmtxdWV1ZV9pbml0X2Vhcmx5KCkgICAgIGluIGtl
cm5lbC93b3JrcXVldWUuYwoKClRoYW5rcwoKSHVhbmcgU2hpamllCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
