Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1371C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvSYLPy2/5KGUlsAdVviyGxgWZtufD8ohCTE48y9mY4=; b=l95lE3sKmxDCNn
	IyC5WwU3BqW4HGAHN4Tf0UHtkBBt6UyMXl6VO8JmmVniSvh1WXK76jDD7+S5HSgjEFFMH5ariSoF1
	MWVWUKhKGDZFvS/XIUsYe2wJyZsUu1HPs65846gBUxPSGpO2lANmsgw3U3UVRYeGy8tZdjxAYwnev
	t5jevNgYh10S+W91D4hXOBT8HdA18wS04IZKThL7oigdR6zoSLupNHDGY8nl0BhmNXy5LOI05IVQy
	PmjcMwVV0QpMkGzvZZVnEIAybvcL4/xtui0l97CiwQ9K20RZ5q3nYFOQC4mBTqOGzuDB4x5/fpxcf
	0zOEmhBjtzLgWsTjlQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDT4-00000008RGG-39AZ;
	Wed, 13 Mar 2024 01:31:42 +0000
Received: from mail-bn8nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c14::800] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDT1-00000008REA-1AdE;
	Wed, 13 Mar 2024 01:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNnjWp+o2xhUbZjGF0/nXQleXUPOOEnJzZ8Heolcnk8O+63ULVr9K/VNy/Tv3/ubCUoyIAShUd+PRsQx8EJDCfxL4z/pQ4ytJAeL7QhTnqt/S7Q/5iZFWdEfG8lEsjf75lkjZVAobnh9KDnjxV5Mm1ztJr/bcW02VkU1MjMQCLV/wcB+LOGL5v+Mv87GPW6/dapxYPeDguzP3EPV2jvWJL1uoKp/w5jBoYCuw+GRhyYtlz2ysZJAWXPT3blK082mCgU+PNMAxFKnO6LxnOBTERw1WBBDdZBh7I9PpM75hFWRbPEvKiAgomvt5iU5eP1gsyAnCPuAWD1NFNKPJyfUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0zow8KuzXqLlvnEcM+VIftmu6uL2nyrOYS1y2MeQrg=;
 b=JeFt0xkjJ9CUEtwN96IuXsEG/fYW+cVh93Vkiymgychb8gjOYg1KBeqMgpBhx7YNzHFNG5SQfV+vhkVOGQDVbefHXpcQXoQbNLo2QkPApMlXAuIZbMlqDdo4PCSE9JHpP42F754d+k4P0tQ2uj80I6e155wOskOOS2tcH1W4CZPMfKmJHlKwBVmW+0GevydjNAXakadRpo8jTL0trA9OZ7O2c+/fToGV14ZARHjmHANHycxbAgGRuMKVjLQ2icqcZ0Q6Bj1qzICZmFEuP8hBiH6evRodZ8hA9CovJoiXvRuejid64krgRJDF2Spmz4Z3MKvBRLxFehqopwvxqJ2IJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0zow8KuzXqLlvnEcM+VIftmu6uL2nyrOYS1y2MeQrg=;
 b=tgx/4Eq4za1V7M7aSIwvgCOi7VfR4Inbe/a5AFoOBEFizePyv3B5oN2N9kInd+ctJCrRuT1PNVqcWCZVRTt6gqeaBbm6BVL/eofNxztTb2n5G6DDD6W87qLDYJbBYmSiHpSKNfdKO0EGzWuFXbX67JOBpZXGW8f2m58vaCMf9gABLYKyTqY7nCrq4GysZ4ZjHhCrIURGEOoc9Nz+bGZcSCRDNPeNrrUvSuZy+0eTMxpJdOrTAUPSGAVJYsWTLs/6oslGtPkdR+AGpnLMq1EuQAaWnT87XhDGK9C8ljO3peSNz2om/2iF0cNU8d+jTWSlvxROLmpfJLhTWtI2j+Ro9w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ2PR20MB7106.namprd20.prod.outlook.com (2603:10b6:a03:568::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Wed, 13 Mar
 2024 01:31:30 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 01:31:30 +0000
Date: Wed, 13 Mar 2024 09:31:26 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>, Qingfang Deng <dqfext@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
Content-Disposition: inline
In-Reply-To: <20240312-evil-resource-66370b68b9b4@spud>
X-TMN: [yWv0OWS+qTG8uo/F0w6RH25Y1Zy0APfpFJPvRVwAk4U=]
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <jpjlpmzdkpox47kvcamih23wxanhmhn3ipipgkjyn6bztddwdu@xqjmi52u54jv>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ2PR20MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: ee56a212-f62f-461e-cd5b-08dc42fd4f2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+u23r1FuESHF/tT+udd2XXS2/jsvJjiZmGq3k5h88J1LhLxfkYMjYX54VX65gBGjBkYnjHYPrvjt/l6b4rwwR547QSx1XVv+kRfX5yE8zLP0zKnZxAm2Wrob7I0nRZQeawuIQ90ljIwlYJ3rV3iHEIpgPl4ybFYkAD5jyBTZWJt/UyAY4AD2uoJ1LIHreGsxj+vnH82NH7zntJF98KDLrqou1nsKfkIZ3kjrUdU01RmZIC+fBdJQxnExxRWQEGLS4BW5vLlkCjKZPPpb5+SEAYhEkkyMERqcSrHzYPTmNNZn+C3Itz6YBrQsX6sLMfDKKfSHsCFfNH1P6uG8STAI2U524ndmJv6BmiIVuW1KFPjVMsMcH7aN81Iwwm8yqZd6l6IR/DNGLWAEnd9N50Ywt4Xml3s9yHviZElvqvoP/tkgdiX3iOCZRmxm9vfqqoLPllBPittijSso3D7Gpb9uwQjMjNXqEmdXffNkQgeJxJBbmiNI6LZETDrsKeK1hW71BQZojQIOQl8hDiHi+m0Y16mQQErBVl6VLE+Yi4Ea+lwwqhYkrIGRcyjs2JRM8/M+CN4YR5L067Fz9Zb9BoWvzVZPLp1WAnAET1RClNXq6zTD9/lGXTJM6qV5O3rbBGEAInnJDwHb3TUsJdaXWqJ5I36/7we24SNzV4QGOS7zcecc009VNTgIHqQ/QH2JxVX
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndhY04rYU5UTC9WY3F4UzlxSFIwZXdXcnptVlZEN05KNHZBOUNURUMyTUYx?=
 =?utf-8?B?Ym5NcG56b0wxNGl1OEVvQlhUaU8zalowaEFnMVNXOW1kNGdTSUdVVWgzb0I1?=
 =?utf-8?B?RlVXN09pWVpiZ1dIT3lTY1RSVmQ1TFBiVmRRdnpoYjZlMHgwTUcxZUtDU3dC?=
 =?utf-8?B?MW9FMzVNekhjYkJZdi9UblY4OE44SmJ2TGhjTTJ5SHVOb3NqcGEzUHpZRHlh?=
 =?utf-8?B?SW1lZlA5NHFXa2dzU3l4R3VHY3pydzRubmI0MzM2WkJiN0l4SCs0eHZiR2lT?=
 =?utf-8?B?WFhHOTJXMVhVcVB4bmhjQ3BwaEJ2OENQSFMzMWs2ci9SdjNjV0Z3dzl6R3FZ?=
 =?utf-8?B?ZmdXM21peXF4Q0VrNEk5UzRiYm1SdmFEb1ZJYUkvdDIyeTh3eUNDMkFpbHY4?=
 =?utf-8?B?VnRyMWdEc2ZlejgxTG4wRVczRVV3dngvRFRvTk1WUUk0QTFTOXBMVytKMVBE?=
 =?utf-8?B?MlNCcG1aaU9xak1NOEhuV2pvVzJSd1ZQTllla0V4UE9ra2hvdktnRjBqRzVv?=
 =?utf-8?B?K2YvZ0J6VHFRUjh5eisveWwxeTJycW9qL1ZSbzVhUUhQcDVQenNVLzB2Z05V?=
 =?utf-8?B?U1hGVmVCZ2EwMEtLVGg4N2JCcXZUVDBDY09xWjF3S3NCNmRtajI2bUd3bjQ2?=
 =?utf-8?B?Yno4dHlyQTFwSFBHTGpTUVF2UHIwQUl6cFdkOWozaXBnakg3WTdJVnNkRWFP?=
 =?utf-8?B?eklLbUt4VmllVzl6MGNmMDZoclMyRC85WTNDTUdvYXltMVVJdXJ4L3VqbExU?=
 =?utf-8?B?ZWRtMW8rdTB0ZmFPaGgraEtzUk5FL1pTcStid1F0UVJOc0dkb1NSZ0FadFVJ?=
 =?utf-8?B?K0sxcjlxOVloL2JkZFZrOG0xOU5kRXVuYmh6RnY3YXAwZ0E0TTZQTmtaL1A2?=
 =?utf-8?B?U29mdHgrZldlYkluWmFPQWtTb3htNkRnK2lkNmpIMFZuL1BnVVkyWCtGblhE?=
 =?utf-8?B?T0habVFBaG9vS1pNcWdBSnNrRDVRWUNOUWljakR6S2J3WFlDZXFuVy9xVmpE?=
 =?utf-8?B?YzFwb2RnUDVaTlNFMzVXT3JBK2Z1bk51eThTZy9TUFBFbThRNk1FZUxxRHRI?=
 =?utf-8?B?WW81b0VpWWZCSG8wallKQk1wKzNkLzB0bU03dnlBbWNlcURQR2s1ZDhWUE85?=
 =?utf-8?B?MEtMbEFSQWl0YmcvakxVV3MrQkVQOGY4ZC92NCs2emFvNWdQM3RQL042ZDkw?=
 =?utf-8?B?c0NKa1lWRU1YSUEwNDNjQmRmdVJlMXhOL3B5cFowa2VkTCtVcTFZZEV2SVlQ?=
 =?utf-8?B?TmVoU3lMSlp2VWdxRHBOSHJFVndGbmJSc0lHT0RpK1VyQlRNalB4eGk2anN6?=
 =?utf-8?B?MmREUjE5MU5ZQW5naVFDR1J0aWRXcDRGOVJRdnlML0FoOTNVeGF5dkhwMDVD?=
 =?utf-8?B?MjRQdXJuZVdjT25QM0ZjTjFSOS9Yb3oyRjltSmNwWE53Nkw1WTNkbzlHRjd0?=
 =?utf-8?B?Zm1rN3FUNUhiQXlQamF5MS92ZGZFWWNNWXMrVllFMWkyVEZudVBzSE14MUFK?=
 =?utf-8?B?K3IxekVuZ2tPYTVJdk1ub2M5TzJCK3pXNW5mbHZHTW50RVEvNmNmSzAycEY2?=
 =?utf-8?B?cVpNRGhxM0ZXSEcvcUZCbjZCZ3J1SWdRYnRWdXFiMEJRT3A5VEdBWUhPeWV3?=
 =?utf-8?B?WlpSRElCT3dFM0x5VGhOMXdYOURFT1ZBUU1reFhTTElZdDJHQmV6TThZVlk2?=
 =?utf-8?Q?Aw80rm1VPdJqCogMB34l?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee56a212-f62f-461e-cd5b-08dc42fd4f2a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 01:31:30.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB7106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_183139_574396_7A01D2E2 
X-CRM114-Status: GOOD (  34.08  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMDI6MDc6MzFQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDAzOjU2OjI5UE0gKzA4MDAsIFFpbmdmYW5n
IERlbmcgd3JvdGU6Cj4gPiBIaSBJbm9jaGksCj4gPiAKPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0
IGF0IDM6MTPigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCAwMjozMDoxOFBNICswODAwLCBR
aW5nZmFuZyBEZW5nIHdyb3RlOgo+ID4gPiA+IFQtSGVhZCBDOTA4IGhhcyB0aGUgc2FtZSBJUlEg
bnVtIGFuZCBDU1IgYXMgcHJldmlvdXMgQzl4eCBjb3JlcywgYnV0Cj4gPiA+ID4gcmVwb3J0cyBu
b24temVybyBtYXJjaGlkIGFuZCBtaW1waWQuIFJlbW92ZSB0aGUgSUQgY2hlY2tzLgo+ID4gPiA+
Cj4gPiA+Cj4gPiA+IEhpLCBRaW5nZmFuZywKPiA+ID4KPiA+ID4gSUlSQywgdGhlIGV4aXN0ZWQg
QzkwOCBTb0MgKHN1Y2ggYXMgSzIzMCkgaGF2ZSBhbiBlYXJseSB2ZXJzaW9uCj4gPiA+IG9mIEM5
MDggY29yZS4gQnV0IEM5MDggY29yZSBpdHNlbGYgbWF5IHN1cHBvcnQgU3Njb2ZwbWYuCj4gPiA+
IFNvIEkgZG8gbm90IHRoaW5rIHJlbW92aW5nIHRoZSBJRCBjaGVja3MgaXMgYSBnb29kIGlkZWEu
IEluc3RlYWQsCj4gPiA+IEkgc3VnZ2VzdCBhZGRpbmcgQ1BVSUQgb2YgeW91ciBTb0MgdG8gdGhp
cyBjaGVjay4KPiA+IAo+ID4gQXMgb2YgRmViIDIwMjQsIHRoZSBsYXRlc3QgQzkwOCByZXZpc2lv
biBkb2VzIG5vdCBzdXBwb3J0IFNzY29mcG1mLgo+ID4gWW91IG1heSBHb29nbGUgIkM5MDhSMVMw
IiB0byBzZWUgaXRzIHVzZXIgbWFudWFsLgo+ID4gQnV0IEkgdGhpbmsgeW91J3JlIHJpZ2h0LiBF
dmVuIHRob3VnaCBDOTA4IGRvZXMgbm90IGhhdmUgU3Njb2ZwbWYsCj4gPiBULUhlYWQgbWF5IHJl
bGVhc2UgbmV3IFNvQ3Mgd2hpY2ggZG8gaGF2ZSBTc2NvZnBtZiwgYW5kIHRoZSBjaGVjayB3aWxs
Cj4gPiBicmVhay4gSSB3aWxsIHN1Ym1pdCBhIG5ldyBwYXRjaCB3aXRoIHlvdXIgc3VnZ2VzdGVk
IGNoYW5nZXMuCj4gCj4gSWYgb24gYW4gU29DIHdoZXJlIHRoZXkgaGF2ZSB1cGRhdGVkIHZlY3Rv
ciB0byAxLjAgYW5kIGltcGxlbWVudGVkIGJvdGgKPiBaaWNib20gYW5kIFN2cGJtdCBpbnN0ZWFk
IG9mIHRoZWlyIGN1c3RvbSBzdHVmZiB0aGV5IGRpZCBub3QgaW1wbGVtZW50Cj4gU3Njb2ZwbWYg
SSB0aGluayB3ZSBjYW4gZXhwZWN0IHRoZXkgd29uJ3QgbW92ZSBhd2F5IGZyb20gdGhlaXIgY3Vz
dG9tCj4gaW1wbGVtZW50YXRpb24gc29vbi4KPiBJIGRvIGFncmVlIHRoYXQgd2Ugc2hvdWxkIG5v
dCByZW1vdmUgdGhlIElEIGNoZWNrcyBlbnRpcmVseSwgYnV0IEkgYWxzbwo+IGRvIG5vdCB3YW50
IHRvIGJlIGFkZGluZyBhbiBJRCBmb3IgZXZlcnkgU29DIHRoYXQgbmVlZHMgdGhpcy4gSSB0aGlu
ayB3ZQo+IHNob3VsZCBiZSBnZXR0aW5nIHRoaXMgaW5mb3JtYXRpb24gZnJvbSBEVCBnb2luZyBm
b3J3YXJkLgo+IFRoZSBEVCBwYXJzaW5nIGlzIGRvbmUgcHJpb3IgdG8gdGhlIGFwcGxpY2F0aW9u
IG9mIGJvb3QgdGltZQo+IGFsdGVybmF0aXZlcywgc28gSSB0aGluayB3ZSBjb3VsZCBhcHBseSB0
aGUgImVycmF0dW0iIGJhc2VkIG9uIHRoZSBEVC4KPiAKPiBJJ20gYWxzbyBwcmV0dHkgc3VyZSB0
aGF0IHdlIGNhbiBhbHNvIG1vZGlmeSB0aGUgZXhpc3RpbmcgY29kZSBmb3IgdGhlCj4gYXJjaGlk
ID09IGltcGlkID09IDB4MCBjYXNlIHRvIHNldCBhIHBzZXVkbyBpc2EgZXh0ZW5zaW9uIHNvIHRo
YXQgdGhlCj4gcGVyZiBkcml2ZXIgY291bGQgZG8gY2FsbCByaXNjdl9pc2FfZWV4dGVuc2lvbl9h
dmFpbGFibGUoKSBhbmQgbm90IHdvcnJ5Cj4gYWJvdXQgdGhlIHNwZWNmaWMgY29uZGl0aW9ucyBp
biB3aGljaCB0aGF0IGlzIHRydWUuIEl0J2QgYmUgc29tZXRoaW5nCj4gbGlrZSB0aGlzIHBhdGNo
Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMTEwMDczOTE3LjIz
OTg4MjYtOC1wZXRlcmxpbkBhbmRlc3RlY2guY29tLwo+IEp1c3Qgd2l0aG91dCByZW1vdmluZyB0
aGUgYXJjaGlkID09IGltcGlkID09IDB4MCBjYXNlIGZyb20gdGhlIGVycmF0YQo+IGNvZGUuIElm
IHlvdSdyZSBsb3N0IGFmdGVyIHJlYWRpbmcgdGhhdCwgSSBjYW4gcHJvYmFibHkgdGhyb3cgdG9n
ZXRoZXIKPiBzb21lIHVudGVzdGVkIGNvZGUgZm9yIGl0Lgo+IAo+IFRoYW5rcywKPiBDb25vci4K
CkkgYWdyZWUgdG8gdXNlIHNvbWV0aGluZyB0byByZXBsYWNlIHRoZSBleGlzdGluZyBjaGVjaywg
YnV0IHVzaW5nIGEgcHNldWRvCmlzYSBleHRlbnNpb24gaXMgbm90IGEgZ29vZCBpZGVhLiBUaGVy
ZSBhcmUgdHdvIHJlYXNvbnM6IAoKMS4gUHNldWRvIGlzYSBpcyBtaXNsZWFkaW5nLiBBcyBpdCBp
cyBub3QgdGhlIHJlYWwgaXNhLCBzZXR0aW5nIHRoaXMgaW4gaXNhCmxpc3QgbWF5IG1ha2UgdXNl
cnNwYWNlIHRoaW5rIGVycmF0YSBhIGZlYXRoZXIuCjIuIFVzaW5nIHBzZXVkbyBpc2EgaXMgbW9y
ZSBsaWtlIGFuIGFidXNlIG9mIHJlc2VydmVkIGlzYSBiaXRzLCB3aGljaCBtZWFucwprZXJuZWwg
bWF5IG5lZWQgaW5maW5pdGUgYml0cyB0byBoYW5kbGUgdGhlIGVycmF0YS4gCgpJTUhPLCBpdCBt
YXkgYmUgYmV0dGVyIHRvIHVzZSBhIG5ldyBEVCBwcm9wZXJ0eSBsaWtlICJyaXNjdixjcHUtZXJy
YXRhIiBvcgoiPHZlbmRvcj4sY3B1LWVycmF0YSIuIEl0IGNhbiBhY2hpZXZlIGFsbW9zdCBldmVy
eXRoaW5nIGxpa2UgdXNpbmcgcHNldWRvCmlzYS4gQW5kIHRoZSBvbmx5IGNvc3QgSSB0aGluayBp
cyBhIHNtYWxsIGFtb3VudCBjb2RlIHRvIHBhcnNlIHRoaXMuCgpSZWdhcmRzLApJbm9jaGkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
