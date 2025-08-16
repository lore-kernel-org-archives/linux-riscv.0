Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 01:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ehe27fr/vVywbZUGezVQQgBPm44t1JDlDPqkKkb87lg=; b=aZRGbJ0dRw5UMt
	XhLFOArVcl1oQTiT+SEDBPYYhb0XZpGCKOWkJfRanmRnjlpOPTC5dYH2Akl3+j30B0IBeAVZcXO8F
	MunxMzaLChvJ16ZoHLGrPWDllV5SJ0NClDhMj6g088ItmS6uQw8e0LKml4X8QvZ5qO1AHIljMlb6M
	zTZC0NOH3X5tzz+2kXaFJ7fWzlCixPWU/Nz768h/MzOYypSFYFsceoKk81J7g9+TIn2+RgEszxqPQ
	t1WWjGr37IPVBu/WBOEUuTPQOd6g5OUlrF6HUI3NDndnAlxtmzbA6sA1hK1ivA5WDML+XXyviUeR9
	lX0AYBjkA43SX1q6b7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5mJ-00000003rxi-3wdI;
	Sat, 16 Aug 2025 01:32:15 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5l8-00000003rt4-1qAJ
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 01:31:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c3hKT5bsCz2dMMZ;
	Sat, 16 Aug 2025 09:31:57 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E357140145;
	Sat, 16 Aug 2025 09:30:53 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 16 Aug 2025 09:30:52 +0800
Message-ID: <deec25f9-9e58-4650-8920-eddd9995c28b@huawei.com>
Date: Sat, 16 Aug 2025 09:30:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv, bpf: use lw when reading int cpu in
 bpf_get_smp_processor_id
Content-Language: en-US
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	<bpf@vger.kernel.org>
CC: <stable@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John
 Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
	<jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
 <20250812090256.757273-4-rkrcmar@ventanamicro.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20250812090256.757273-4-rkrcmar@ventanamicro.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_183102_639934_686D6BBA 
X-CRM114-Status: GOOD (  10.73  )
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

CgpPbiAyMDI1LzgvMTIgMTc6MDIsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiBlbWl0X2xkIGlz
IHdyb25nLCBiZWNhdXNlIHRocmVhZF9pbmZvLmNwdSBpcyAzMi1iaXQsIG5vdCB4bGVuLWJpdCB3
aWRlLgo+IFRoZSBzdHJ1Y3QgY3VycmVudGx5IGhhcyBhIGhvbGUgYWZ0ZXIgY3B1LCBzbyBsaXR0
bGUgZW5kaWFuIGFjY2Vzc2VzCj4gc2VlbWVkIGZpbmUuCj4gCj4gRml4ZXM6IDJkZGVjMmM4MGI0
NCAoInJpc2N2LCBicGY6IGlubGluZSBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWQoKSIpCj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HF
mSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDZlMTU1NGQ4
OTY4MS4uOTg4M2E1NWQ2MWI1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTE3
NjMsNyArMTc2Myw3IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2lu
c24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgCQkgKi8KPiAgIAkJaWYg
KGluc24tPnNyY19yZWcgPT0gMCAmJiBpbnNuLT5pbW0gPT0gQlBGX0ZVTkNfZ2V0X3NtcF9wcm9j
ZXNzb3JfaWQpIHsKPiAgIAkJCS8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGluIFIwICovCj4g
LQkJCWVtaXRfbGQoYnBmX3RvX3J2X3JlZyhCUEZfUkVHXzAsIGN0eCksIG9mZnNldG9mKHN0cnVj
dCB0aHJlYWRfaW5mbywgY3B1KSwKPiArCQkJZW1pdF9sdyhicGZfdG9fcnZfcmVnKEJQRl9SRUdf
MCwgY3R4KSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAo+ICAgCQkJCVJWX1JF
R19UUCwgY3R4KTsKPiAgIAkJCWJyZWFrOwo+ICAgCQl9CgpSZXZpZXdlZC1ieTogUHUgTGVodWkg
PHB1bGVodWlAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
