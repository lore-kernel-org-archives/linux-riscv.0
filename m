Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DFEC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2wVX/Ym1gtYqqZVgOT7r7T7VFyDegTSU/MssEW6Hqo=; b=i5gANn/ocWTkq82/nH1lV5Znk7
	mLphRw5orHEy971/vznA4A9NG6xtiAsFr6CIu4LngVtpwYYS6juUioHJIR3g1beDheWQIcz+q8qLk
	DX/f0d/VBkg9vyrSAGNxm/0N2Vp1NBG2mIjvzuRnAoqWg4SF5WXxmmCAsFNeI9BouHDyjDhVAdU9W
	exa4rjofHHGjdCrr92sl6Wy8tljCCPdoqUXSvdgy1HBV8lCKmfSX8fDoIrRlEQyzSPAUylRVh4UB7
	IRud+cK0ljg/aPywfvbZ+p1DQx2PN4KywEJugao6UK6y1wr43Liq/4+4MC2duPEvkt7lJDZr0olQu
	CkBs/3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q19-00FtcP-3A; Thu, 07 Jul 2022 11:49:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q15-00FtZf-Mb
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 11:49:57 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LdvkZ41J6zTggP;
	Thu,  7 Jul 2022 19:46:14 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 19:49:51 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 19:49:51 +0800
Subject: Re: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting
 operation style
To: Daniel Borkmann <daniel@iogearbox.net>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau
	<kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20220530092815.1112406-1-pulehui@huawei.com>
 <20220530092815.1112406-5-pulehui@huawei.com>
 <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <62f154e1-5ffb-3f7b-adc6-766cb29a18b0@huawei.com>
Date: Thu, 7 Jul 2022 19:49:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_044955_955949_5C72FB2A 
X-CRM114-Status: GOOD (  13.74  )
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

T24gMjAyMi81LzMxIDU6MDMsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiA1LzMwLzIyIDEx
OjI4IEFNLCBQdSBMZWh1aSB3cm90ZToKPj4gVGhlIG1lbWJlcnMgb2YgYnBmX3Byb2dfaW5mbywg
d2hpY2ggYXJlIGxpbmVfaW5mbywgaml0ZWRfbGluZV9pbmZvLAo+PiBqaXRlZF9rc3ltcyBhbmQg
aml0ZWRfZnVuY19sZW5zLCBzdG9yZSB1NjQgYWRkcmVzcyBwb2ludGVkIHRvIHRoZQo+PiBjb3Jy
ZXNwb25kaW5nIG1lbW9yeSByZWdpb25zLiBNZW1vcnkgYWRkcmVzc2VzIGFyZSBjb25jZXB0dWFs
bHkKPj4gdW5zaWduZWQsICh1bnNpZ25lZCBsb25nKSBjYXN0aW5nIG1ha2VzIG1vcmUgc2Vuc2Us
IHNvIGxldCdzIG1ha2UKPj4gYSBjaGFuZ2UgZm9yIGNvbmNlcHR1YWwgdW5pZm9ybWl0eS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+
IMKgIHRvb2xzL2xpYi9icGYvYnBmX3Byb2dfbGluZm8uYyB8IDkgKysrKystLS0tCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS90b29scy9saWIvYnBmL2JwZl9wcm9nX2xpbmZvLmMgCj4+IGIvdG9vbHMvbGliL2Jw
Zi9icGZfcHJvZ19saW5mby5jCj4+IGluZGV4IDVjNTAzMDk2ZWY0My4uN2JlYjA2MGQwNjcxIDEw
MDY0NAo+PiAtLS0gYS90b29scy9saWIvYnBmL2JwZl9wcm9nX2xpbmZvLmMKPj4gKysrIGIvdG9v
bHMvbGliL2JwZi9icGZfcHJvZ19saW5mby5jCj4+IEBAIC0xMjcsNyArMTI3LDggQEAgc3RydWN0
IGJwZl9wcm9nX2xpbmZvICpicGZfcHJvZ19saW5mb19fbmV3KGNvbnN0IAo+PiBzdHJ1Y3QgYnBm
X3Byb2dfaW5mbyAqaW5mbykKPj4gwqDCoMKgwqDCoCBwcm9nX2xpbmZvLT5yYXdfbGluZm8gPSBt
YWxsb2MoZGF0YV9zeik7Cj4+IMKgwqDCoMKgwqAgaWYgKCFwcm9nX2xpbmZvLT5yYXdfbGluZm8p
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mcmVlOwo+PiAtwqDCoMKgIG1lbWNweShw
cm9nX2xpbmZvLT5yYXdfbGluZm8sICh2b2lkICopKGxvbmcpaW5mby0+bGluZV9pbmZvLCAKPj4g
ZGF0YV9zeik7Cj4+ICvCoMKgwqAgbWVtY3B5KHByb2dfbGluZm8tPnJhd19saW5mbywgKHZvaWQg
KikodW5zaWduZWQgCj4+IGxvbmcpaW5mby0+bGluZV9pbmZvLAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGF0YV9zeik7Cj4gCj4gVG9vayBpbiBwYXRjaCAxLTMsIGxndG0sIHRoYW5rcyEgTXkg
cXVlc3Rpb24gYXJvdW5kIHRoZSBjbGVhbnVwcyBpbiAKPiBwYXRjaCA0LTYgLi4uCj4gdGhlcmUg
YXJlIHZhcmlvdXMgb3RoZXIgc3VjaCBjYXNlcyBlLmcuIGluIGxpYmJwZiwgcGVyaGFwcyBtYWtl
cyBzZW5zZSAKPiB0byBjbGVhbiBhbGwKPiBvZiB0aGVtIHVwIGF0IG9uY2UgYW5kIG5vdCBqdXN0
IHRoZSA0IGxvY2F0aW9ucyBpbiBoZXJlLgo+IAoKc29ycnkgZm9yIHJlcGx5IHNvIGxhdGUsIEkg
d2lsbCB0YWtlIHRoaXMgc29vbi4KCj4gVGhhbmtzLAo+IERhbmllbAo+IC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
