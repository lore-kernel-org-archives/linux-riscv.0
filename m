Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F1CA0ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 01:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH/6PuJBK/4K8FubMOUu09G2xmsIcifQWtRcvPqVlMk=; b=G3NXRxi9gK442F
	SuZQ0q0/P/Vz1H/J+SXLAp6yXX6riU6QKy0WCUc4v3we4v1T546TPAPf4C0dDYR0slALqjn6EhXXt
	jgnjdFs3TGc689xBKkwWfOAyzSfRnL6YVTtMqFx3JsF2lB8u5SQkZpebmEQ1He4gl9aQFZUgbEuQH
	7ji2xpycodNCRnU0cZko2lvVwnVxFbiFQFVGJ2VjdySHwQGv6zvLp0/fYUznQFK970udA1dmOKWbY
	IsJjXWr+T5tTAPbLED+KQPrXelv19DSaPiX8+WeDUHUlb+lnswBIKLtQuTA0Hi50wk3kfMC5q7KJQ
	oNqikfO4zFCRQ+WR3Viw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5iO-00000003rXS-2LEQ;
	Sat, 16 Aug 2025 01:28:12 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5iL-00000003rX0-3efa
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 01:28:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c3h7r48NhzdcBV;
	Sat, 16 Aug 2025 09:23:36 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 9918A1401E9;
	Sat, 16 Aug 2025 09:27:57 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 16 Aug 2025 09:27:56 +0800
Message-ID: <40d38745-a790-4f34-8eef-8038069b976d@huawei.com>
Date: Sat, 16 Aug 2025 09:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv, bpf: use lw when reading int cpu in
 BPF_MOV64_PERCPU_REG
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
 <20250812090256.757273-3-rkrcmar@ventanamicro.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20250812090256.757273-3-rkrcmar@ventanamicro.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_182810_068477_35C5E813 
X-CRM114-Status: GOOD (  10.23  )
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
bGUgZW5kaWFuIGFjY2Vzc2VzCj4gc2VlbWVkIGZpbmUuCj4gCj4gRml4ZXM6IDE5YzU2ZDRlNWJl
MSAoInJpc2N2LCBicGY6IGFkZCBpbnRlcm5hbC1vbmx5IE1PViBpbnN0cnVjdGlvbiB0byByZXNv
bHZlIHBlci1DUFUgYWRkcnMiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAt
LS0KPiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKPiBpbmRleCAxMGUwMWZmMDYzMTIuLjZlMTU1NGQ4OTY4MSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYwo+IEBAIC0xMzU2LDcgKzEzNTYsNyBAQCBpbnQgYnBmX2ppdF9lbWl0
X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQg
KmN0eCwKPiAgIAkJCQllbWl0X212KHJkLCBycywgY3R4KTsKPiAgICNpZmRlZiBDT05GSUdfU01Q
Cj4gICAJCQkvKiBMb2FkIGN1cnJlbnQgQ1BVIG51bWJlciBpbiBUMSAqLwo+IC0JCQllbWl0X2xk
KFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAo+ICsJCQllbWl0
X2x3KFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAo+ICAgCQkJ
CVJWX1JFR19UUCwgY3R4KTsKPiAgIAkJCS8qIExvYWQgYWRkcmVzcyBvZiBfX3Blcl9jcHVfb2Zm
c2V0IGFycmF5IGluIFQyICovCj4gICAJCQllbWl0X2FkZHIoUlZfUkVHX1QyLCAodTY0KSZfX3Bl
cl9jcHVfb2Zmc2V0LCBleHRyYV9wYXNzLCBjdHgpOwoKUmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
