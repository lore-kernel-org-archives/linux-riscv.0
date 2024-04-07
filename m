Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3A9C67861
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSWBm3VcLCBFA8nagbYF5kpsg5BuY5Y8WrxlHsBHkqg=; b=Q3SU24k4/YHPQb
	9RpZlgL9gGgIXDEFoP37g4NKM6ARQcRIvvsLHkAiOs6cSReGal7qJJwoTJ4G/vYktcvfR5zzJ6HnS
	nBEJbrNEPTgRI8cbDg03DBaPCTUqWl/PtfdpJ18doMk3+kFPBFcCfqLLUApWsrX1ze167GHk0Y1W6
	XSgKsXZHSCE2TcDm4n9KFZ3GFSqwbBUHJWuuygQvXSsu1sGt1icflbR25BHOaEZuj1wxYGPX3IGyg
	B3+cgrLXUH1uGABx9/IHZODd7klRaB51H/ltdN87dyP19tdYaOh81ytnY0RUv7q4I+XrC+VHedF7Q
	fAgy5Wc19OjEDiD8lX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHdS-0000000BQLH-2bpa;
	Sun, 07 Apr 2024 01:47:54 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHdO-0000000BQJv-3Xi8
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:47:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VBw5C23hLz1RBSv;
	Sun,  7 Apr 2024 09:44:47 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 8630E14011F;
	Sun,  7 Apr 2024 09:47:36 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 7 Apr 2024 09:47:35 +0800
Message-ID: <959db176-a79e-4074-a4bb-d9ee5ce19f79@huawei.com>
Date: Sun, 7 Apr 2024 09:47:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] MAINTAINERS: bpf: Add Lehui and Puranjay as riscv64
 reviewers
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
References: <20240405123352.2852393-1-bjorn@kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240405123352.2852393-1-bjorn@kernel.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_184751_155207_90C51A55 
X-CRM114-Status: GOOD (  10.49  )
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

Ck9uIDIwMjQvNC81IDIwOjMzLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZyb206IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBMZWh1aSBhbmQgUHVyYW5qYXkgaGF2ZSBi
ZWVuIGFjdGl2ZSBSSVNDLVYgNjQtYml0IEJQRiBKSVQKPiBjb250cmlidXRvcnMvcmV2aWV3ZXJz
IGZvciBhIGxvbmcgdGltZSEKPiAKPiBMZXQncyBtYWtlIGl0IG1vcmUgb2ZmaWNpYWwgYnkgYWRk
aW5nIHRoZW0gYXMgcmV2aWV3ZXJzIGluCj4gTUFJTlRBSU5FUlMuCgpJdCdzIG15IGhvbm9yIHRv
IHRha2Ugb24gdGhpcyByZXNwb25zaWJpbGl0eSwgYW5kIGRlbGlnaHRlZCB0byBiZSAKcGFydG5l
cmVkIHdpdGggeW91IEJqw7ZybiBhbmQgUHVyYW5qYXku8J+YgAoKTGVodWkKCj4gCj4gVGhhbmsg
eW91IGZvciB5b3VyIGhhcmQgd29yayEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPgo+IC0tLQo+ICAgTUFJTlRBSU5FUlMgfCAyICsrCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiBpbmRleCA3NTM4MTM4NmZlNGMuLjU4YWIwMzJhZDMzZCAxMDA2NDQK
PiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTM3NjQsNiArMzc2
NCw4IEBAIFg6CWFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiAgIAo+ICAgQlBGIEpJ
VCBmb3IgUklTQy1WICg2NC1iaXQpCj4gICBNOglCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPgo+ICtSOglQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+ICtSOglQdXJhbmpheSBN
b2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4KPiAgIEw6CWJwZkB2Z2VyLmtlcm5lbC5vcmcKPiAg
IFM6CU1haW50YWluZWQKPiAgIEY6CWFyY2gvcmlzY3YvbmV0Lwo+IAo+IGJhc2UtY29tbWl0OiBj
ODhiOWI0Y2RlMTdhZWMzNGZiOWJmYWY2OWY5ZjcyYTFjNDRmNTExCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
