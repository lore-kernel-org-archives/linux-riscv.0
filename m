Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB677C3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsiNkh25ndsCLXuQ0QTEcb1qGGzZ+Ye7HAtatiBv0Vw=; b=xkzGKvi9ojopnqdY+AMEPYvbv+
	R7cFmlGfj3mOoAS4BAYE72Lbcf1Y/jMAC5Sy+Mz9FhGML8rxNRfMwagI5Y/3jq44ABcbyn8IwYHG6
	oWDYvQRquy8MWWOdKTDXuF5+u+wdxYNhQmsXSjRJVPauS2WKFXoBdofaIhlRvMytPVbchFJc2MWDa
	3S/4j8yUnUAVTuKonrBJpAPk4NoL0kMeTG1IzyoZIWLg7rUmyS7jYZP1cO+Zk8kSDBhHU0BK+bfUv
	DgzwlBtt/yPyjKIYTrP2qy518LTbcBeFPyXnwrSwrlJutLZQdKkXL8L/z6PK3Y/A2kjJZUPqpVsQ7
	GTYe30Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWnPS-0000000H0sp-1JSl;
	Thu, 25 Jul 2024 01:36:46 +0000
Received: from mail-bmxind01olkn2082a.outbound.protection.outlook.com ([2a01:111:f403:281c::82a] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWnPO-0000000H0pL-2gZ8
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 01:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0andETyCfF9DbI/CUvfwRkgAx6rTLvsa4OTt0++5Tc0K8WQoajxvHdaqJOb3fr3mB+Ihb3rhW+vjcN37C4S8OkNYvwtghlJG/nDQ/oXqfijESOl5opSmf4dLNpVGN7eVjB7lOHZyJaZYN4ut/fEN3ShPQaokHPBICyw9qK0D16aV9jhpNJZMP1+lEoQVbZ3FwBJ2B1K3MJTP6LTG6H33vbHlLUVXqp/GMwPOLgeOY9PkPM0s90svumDhkmRabbTickEzSFBigt8xaj2PPiPnOXwEWIsOOMioQ0JEaiCJVsw1RwZg0wIldF3q/aIrD+3hfEQN1AGp3+O5Cwn/JQOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWBmIMvfSBptJwrZshjGIiQHwknJvw1TZAruUiKWRFU=;
 b=xxFSsK5/wdlTt7i4g2rCEb0Zlf/OEfglGL7ADiIY0zWkAGZonw6zso7XM5NKhyCRUdB50eb2sWA6rrGQ7hOiwtBFIp2AqQ90F39Tq0IU6hWZQ7BzNte4Q0CMg8jY/L7MBcceSrb//DvRY3JWw1mSEcb4gPuYb2mcpKdVqCUcQBs058xmL3Tj4YMHfc0eIxCX0yM+JjyRO1FDIXRl3vfJRcxeDbXI8hxZ5zLNlqV9wR12bf/i57Pos57NTc7stqaDihXtshU6INYifXku8IMmMKdCNH28CzSEJYCwoiGqCN4aki62Cv/5/yWHbev4fIW6RTnBTY2BefzryFPc+VeIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWBmIMvfSBptJwrZshjGIiQHwknJvw1TZAruUiKWRFU=;
 b=X0y962t93Akf881DCFFBLJdwmDzUctsglHJbov7dsUIw+XO1rlYWTGIiC59tc2oDi3MkYGeC8o8sICBsrQeiLDQ4ZplnJLIMSMJOXJztVLeodZh5uVJnq2Dzycg/5nPhWeG/iNwiqN32uGuII4VWgxCNSOpk6eQHGFUlrXoey4fOD9RDA8r3WasxDEFO1IlohHZBtxlOmcUbpilHbBDqSujWg/+wpu/AK75geRynDRJn6FNUBgALw0dXFL0g0ItgorcuWiZuk6ubftxrCYUrf0beIIpm9PNqK4y9IsZKm7fi48jFpgRU5Z0ZR/qNyTUffljJ+YWQbxFMkDVPx87CIA==
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
 by PN3P287MB1446.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 01:36:18 +0000
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d]) by PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d%3]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 01:36:18 +0000
Message-ID: <PN1P287MB281813D2CE721D2D8E697A52FEAB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 25 Jul 2024 09:36:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
To: Drew Fustini <drew@pdp7.com>, Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1721377374.git.unicorn_wang@outlook.com>
 <ZqFtjpxXv7pRpZHV@x1>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ZqFtjpxXv7pRpZHV@x1>
X-TMN: [3nD3x9RLGdE9FTv8MBdkQqQWN0wWl3Kq]
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:214::7)
X-Microsoft-Original-Message-ID: <c8364838-598a-4fe9-a8d4-711cf0b9a5bd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB2818:EE_|PN3P287MB1446:EE_
X-MS-Office365-Filtering-Correlation-Id: 06904d1b-3e1b-4ca2-168e-08dcac4a2d39
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: h2U3y7jt8jMWABEVOJRfFd4yAAkd9qqV+2vW1Eu1jV4X7mDANp9sSwee3sk/5kekLViWoiU+V+UrWt5QCzj0EMAAyWc/nP+vauHaFjN0jKSKCnKDhEIv6XTjuT2UyVkyJxzHLOq9yWewz4fUooyDl3Nc7u7RYrfrBDmyVZknaqmNu1tw9txRhD6l7mpaZzBCyFnPDuqkFSHsDrDABUk1Xq1MEupsy2XMNK2J/IpvguGLWt15/qMzTapNa+sB8e42rYEuFPcqT1emATNk5QwzzqHlk5opi+6Jdxa8GLzJp+az2iHwvQyIoQu0ZkKcODAR1rGqxm9LD5PEkPAvQxwt29j6sdn7mbcTFTwajW6IZjqsF8nZy9M51Rk3Zb9bww1KRz6jXeqMbYFGWlEnP2gPoIuVxnphK7VO8I+OMq05dJHL+vYN4CnLNNsGozGEf0225uCtPFbkroLl0lz31YEv1TFzmjgob8imewfUNEYVFOVBeYTu5pBOf1yRQBktNKGe/EoBIncuT89jk3v/moBpqhhqz83NsjvLCZhJZ3k8tBHZ/cvME0D24CkC/4GKAwVkk51O2gWFazk9uw/FvBnSvO3CQV5RhVFBPNR6b14Wtb94vxoiv1I6V62v8Gs+d25A+zCdhHUXChY/EKw3/Wnxnw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9Yby9Ec0V4cnVpTXZHY3VZSVc5aFYzbVBxMVBYZklTMlBxNjY1a1VpSU1m?=
 =?utf-8?B?YzZGZ3BYcFp5Q3V1UGQwc08zbGNob28yOVNFSU9PV3poSE1NMStwN0tlTTJl?=
 =?utf-8?B?bUtYRXRxRnJEYmVFQXNCWlA5d0Y0RzRueGhKTjN6bFBBR1BhZkZpM2hvTTVD?=
 =?utf-8?B?QlpSY3ZEY3E1UWpydVlwTWJWZmNIZzhRTHNhWDFKWGc4dGdtdTBDR245ZUpU?=
 =?utf-8?B?YjdrNTZqZ3lDWTkrSVZIQ0dZZDdybTV6WDl1bDhjcTNRandkOUlmTHltZVhy?=
 =?utf-8?B?RGVXaUt6eXRwZUtlVzFHV1NuUE9VWTJOMmwreHI4RE1TVVAyOUtMa3YrS1NT?=
 =?utf-8?B?cjFVTWRKOUpSNXJTZ2JuSVFiZDI2N1V5UXY2bGtQTEhHQWJzZEduTEsyT1pk?=
 =?utf-8?B?TWJlYXBoTUJNM3BSNHE2aWdpdmFiRUNhUjNMRnphRWVXaVFtNldlbjJva2N0?=
 =?utf-8?B?ZkcrRzVBeFlOdGdYRHVnMGVVanR5ZzRiamZBb1hGQXhnK3NhMjQxdG92ZWR5?=
 =?utf-8?B?bHkrVVVBdUF1L3QxeDIvYkFDLzFQNEZ5UElSUVFlVElVVTJSdEZtWERXeHRZ?=
 =?utf-8?B?R3RWejNzaEVnUjg5LzNJVTd3RUZqRU0vNlRtem02T3pIOFZ0eTY4Zm1NNXdQ?=
 =?utf-8?B?QVBaMDNhNWJEZVpSSEpxbytnWDJhU3NLeEJ6dFJMeVdDMnBLUmxUK2pVMjZh?=
 =?utf-8?B?anJlQkswT1BhL1haWXdSOWV3YUtKb1ZvUXAyVkpyS0xmWGg4WWRveDljYXZL?=
 =?utf-8?B?VGpGcit2WUw5VHB4Mmt2ZFRSdzVCYW9KWDFKb2dqL09qVkVDOWlrMnVKOFV3?=
 =?utf-8?B?aEpyaFMya2w3SlV5V3BlcVBFazdnTnZ3N3lmbUFwNkdMclc0RDVvQzB6blpr?=
 =?utf-8?B?MkZEbEsyN01sMkJjckhVcXA0dHFzdUdGcTBHMzB6TGRZVnkvejVtbW9LaEh2?=
 =?utf-8?B?b2VLVEhZVHFuUExqZ210a3lTVzBhaFFUYzdScXVsZlNlTDNKRll4UlhxVFE3?=
 =?utf-8?B?Y0tJaTBULzg0d3Jma0V6UXNMdk9CQ2JyMlNlLzRybTVGejNLbW50MHZOT29y?=
 =?utf-8?B?MElXeFZDc2JTbXJiTjU5TmY4ZUhsc2ttY0JjZnQ1bk05YmZQN3FRa0hsSE84?=
 =?utf-8?B?QWUrVVpnbFFkRU1SWW4wZmVhU0xUZ25NSzB1dmtyUkdkWURSVzJwa2RHSWZk?=
 =?utf-8?B?clU5RndESXlPUUNKMWdFQ1Y2ZlZhaWM0emJVeGVLdzJROGVrWFBUZmZSZk4x?=
 =?utf-8?B?T3lkQi8yV3FSa0VoT1Fla2FWOU9hWW9UNlREblYzY1RqL3hEbkMvZDdlY3Vh?=
 =?utf-8?B?K3NiTk0xVkZ0aXlsRUdxcHdGdlAwblpCY3IwdDJBSFhmQW05cjVaNlRqQ0Vk?=
 =?utf-8?B?N1NHZFFiSFp3YkxBaGpzQjVSYmMyTTJ5K1hzbTE2UFFEY2luVEJlNVpRanph?=
 =?utf-8?B?VmF6Mnp6TkgxOS80Qm84a1RRejJobGRsK2o0bXdETWl1ajlhR000OStRY0dR?=
 =?utf-8?B?TUFFMUZIa3pHZFlKeXhMaGN2YUlvc3FmWUJRVExxclJpdC9BY1FSa2UwZDZ0?=
 =?utf-8?B?L3JKQWZjaW5EdlRhKzVYcmdWSnhaU3hBNTVDRU4wZ0taK1pYUVJjQzNzcnBU?=
 =?utf-8?B?MVRBdGpNcHkyMDNjeGIrbmRJdDNnVE4wSHpXeFpWUVY0ejFacE9la2xucVA4?=
 =?utf-8?Q?P5XuT3afC20U1W2wb4Rq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06904d1b-3e1b-4ca2-168e-08dcac4a2d39
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 01:36:18.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_183642_698471_03D81C9B 
X-CRM114-Status: GOOD (  15.20  )
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

Ck9uIDIwMjQvNy8yNSA1OjA5LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gT24gRnJpLCBKdWwgMTks
IDIwMjQgYXQgMDQ6NDQ6MzhQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBGcm9tOiBDaGVu
IFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4KPj4gVGhpcyBwYXRjaHNldCBpcyBj
b21wb3NlZCBvZiB0d28gcGFydHM6Cj4+IC0gb25lIGlzIHRoZSBpbXByb3ZlbWVudCBvZiB0aGUg
c2RoY2ktb2YtZHdjbXNoYyBmcmFtZXdvcmssCj4+IC0gdGhlIG90aGVyIGlzIHRoZSBzdXBwb3J0
IGZvciBzZzIwNDIgYmFzZWQgb24gdGhlIGltcHJvdmVtZW50IG9mIHRoZQo+PiAgICBmcmFtZXdv
cmsuCj4+IFRoZSByZWFzb24gZm9yIG1lcmdpbmcgdGhlIHR3byBwYXJ0cyBpbnRvIG9uZSBwYXRj
aHNldCBpcyBtYWlubHkgdG8KPj4gZmFjaWxpdGF0ZSByZXZpZXcsIGVzcGVjaWFsbHkgdG8gZmFj
aWxpdGF0ZSB2aWV3aW5nIHdoeSB3ZSBuZWVkIHRvCj4+IGltcHJvdmUgdGhlIGZyYW1ld29yayBh
bmQgd2hhdCBiZW5lZml0cyBpdCB3aWxsIGJyaW5nIHRvIHVzLgo+Pgo+PiBXaGVuIEkgdHJpZWQg
dG8gYWRkIGEgbmV3IHNvYyhTRzIwNDIpIHRvIHNkaGNpLW9mLWR3Y21zaGMsIEkgZm91bmQKPj4g
dGhhdCB0aGUgZXhpc3RpbmcgZHJpdmVyIGNvZGUgY291bGQgYmUgb3B0aW1pemVkIHRvIGZhY2ls
aXRhdGUgZXhwYW5zaW9uCj4+IGZvciB0aGUgbmV3IHNvYy4gUGF0Y2ggMSB+IFBhdGNoIDUgaXMg
Zm9yIHRoaXMuCj4+Cj4+IFBhdGNoIDYgfiA3IGFyZSBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlIG1t
YyBjb250cm9sbGVyIGZvciBTb3BoZ28gU0cyMDQyLgo+PiBBZGRpbmcgY29ycmVzcG9uZGluZyBu
ZXcgY29tcGF0aWJsZSBzdHJpbmdzLCBhbmQgaW1wbGVtZW50Cj4+IGN1c3RvbSBjYWxsYmFja3Mg
Zm9yIFNHMjA0MiBiYXNlZCBvbiBuZXcgZnJhbWV3b3JrLgo+Pgo+PiBQYXRjaCA4IGlzIHRoZSBj
aGFuZ2UgZm9yIERUUy4KPj4KPj4gQnkgdGhlIHdheSwgYWx0aG91Z2ggSSBiZWxpZXZlIHRoaXMg
cGF0Y2ggb25seSBvcHRpbWl6ZXMgdGhlIGZyYW1ld29yawo+PiBvZiB0aGUgY29kZSBhbmQgZG9l
cyBub3QgY2hhbmdlIHRoZSBzcGVjaWZpYyBsb2dpYywgc2ltcGxlIHZlcmlmaWNhdGlvbgo+PiBp
cyBjZXJ0YWlubHkgYmV0dGVyLiBTaW5jZSBJIGRvbid0IGhhdmUgcmszNXh4L3RoMTUyMCByZWxh
dGVkIGhhcmR3YXJlLAo+PiBpdCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIGlmIHNvbWVv
bmUgY291bGQgaGVscCB2ZXJpZnkgaXQuCj4+IE5vdGUsIHRoZSBEVFMgY2hhbmdlIGhhcyBkZXBl
bmRlbmN5IG9uIGNsb2NrIGNoYW5nZXMgZm9yIFNHMjA0Miwgd2hpY2gKPj4gaGFzIG5vdCBiZWVu
IG1lcmdlZCBpbiBtYXN0ZXIvdXBzdHJlYW0sIHNvIGlmIHlvdSB3YW50IHRvIHRlc3QgdGhpcwo+
PiBuZXcgc2RoY2ktb2YtZHdjbXNoYyBkcml2ZXIgZm9yIG90aGVyIGhhcmR3YXJlIGV4Y2VwdCBT
RzIwNDIsIGRvbid0Cj4+IHBpY2sgcGF0Y2ggOC4KPiBJIGhhdmUgdGVzdGVkIHRoaXMgb24gdGhl
IExpY2hlZVBpIDRhIGFuZCBmb3VuZCBubyBpc3N1ZXMuCj4KPiBUZXN0ZWQtYnk6IERyZXcgRnVz
dGluaSA8ZHJld0BwZHA3LmNvbT4gIyBUSDE1MjAKPgo+IC1EcmV3CgpUaGFuayB5b3UgRHJld++8
jHlvdSBhcmUgYWx3YXlzIHRoZSBiZXN0ISA6KQoKUmVnYXJkcywKCkNoZW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
