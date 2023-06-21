Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6798FEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 06:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTjLJ1gOK6EmQXSNs98tv4QZHV3crbzekSukAXQS8uY=; b=EHaHx2tSUcgfe9
	y7Y/SQ3ZuIJ97+lsbxMIaFtGOLhOjMIU4O2HjGu4G19ZKymZ2IGL9hwipEARU4I4RU5+T9D+s/bim
	0xwxxG96pyJxc87uPMterdFK9+7LM+o+bHnvBwPGiCcCI6gUddRABRH7j4RWG4xdGm8gSGS/zwt1c
	3yQI/DpgBcogCjYpwqHxLiHHLCl7CDvKH0XF5qZu9tkpJoN8ePQbNBcbR56K4lyZwzti6vg5xkzbD
	wXCLu+bVCUmv4FDYwGa1OmxveacFd31D/nsGYisdPZ3zhSv/f8Nfc+RmSlNuej9hEEhsCMWniTaWt
	FCbomIyvdNnaiJE7Lvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBr82-00DO5E-1Z;
	Wed, 21 Jun 2023 06:15:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBr7z-00DO3m-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 06:15:41 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QmCqY4CnszLmsC;
	Wed, 21 Jun 2023 14:13:29 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 21 Jun 2023 14:15:26 +0800
Message-ID: <aba31303-e992-9ad7-995f-d159f79a55f7@huawei.com>
Date: Wed, 21 Jun 2023 14:15:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling first
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Suren
 Baghdasaryan <surenb@google.com>
References: <20230523165942.2630-1-jszhang@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230523165942.2630-1-jszhang@kernel.org>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_231539_506409_522FD49A 
X-CRM114-Status: GOOD (  15.46  )
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

CgpPbiAyMDIzLzUvMjQgMDo1OSwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBBdHRlbXB0IFZNQSBs
b2NrLWJhc2VkIHBhZ2UgZmF1bHQgaGFuZGxpbmcgZmlyc3QsIGFuZCBmYWxsIGJhY2sgdG8gdGhl
Cj4gZXhpc3RpbmcgbW1hcF9sb2NrLWJhc2VkIGhhbmRsaW5nIGlmIHRoYXQgZmFpbHMuCj4gCj4g
QSBzaW1wbGUgcnVubmluZyB0aGUgZWJpenp5IGJlbmNobWFyayBvbiBMaWNoZWUgUGkgNEEgc2hv
d3MgdGhhdAo+IFBFUl9WTUFfTE9DSyBjYW4gaW1wcm92ZSB0aGUgZWJpenp5IGJlbmNobWFyayBi
eSBhYm91dCAzMi42OCUuIEluCj4gdGhlb3J5LCB0aGUgbW9yZSBDUFVzLCB0aGUgYmlnZ2VyIGlt
cHJvdmVtZW50LCBidXQgSSBkb24ndCBoYXZlIGFueQo+IEhXIHBsYXRmb3JtIHdoaWNoIGhhcyBt
b3JlIHRoYW4gNCBDUFVzLgo+IAo+IFRoaXMgaXMgdGhlIHJpc2N2IHZhcmlhbnQgb2YgIng4Ni9t
bTogdHJ5IFZNQSBsb2NrLWJhc2VkIHBhZ2UgZmF1bHQKPiBoYW5kbGluZyBmaXJzdCIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+
IEFueSBwZXJmb3JtYW5jZSBudW1iZXJzIGFyZSB3ZWxjb21lISBFc3BlY2lhbGx5IHRoZSBudW1i
ZXJzIG9uIEhXCj4gcGxhdGZvcm1zIHdpdGggOCBvciBtb3JlIENQVXMuCj4gCj4gICBhcmNoL3Jp
c2N2L0tjb25maWcgICAgfCAgMSArCj4gICBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMgfCAzMyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiBpbmRleCA2MmU4NGZlZTJjZmQuLmI5NThmNjdmOWExMiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAt
NDIsNiArNDIsNyBAQCBjb25maWcgUklTQ1YKPiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19ERUJV
R19QQUdFQUxMT0MgaWYgTU1VCj4gICAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSFVHRVRMQkZTIGlm
IE1NVQo+ICAgCXNlbGVjdCBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0sgaWYgTU1VCj4g
KwlzZWxlY3QgQVJDSF9TVVBQT1JUU19QRVJfVk1BX0xPQ0sgaWYgTU1VCgpubyBuZWVkIGlmIG1t
de+8jCAgc2VlIFBFUl9WTUFfTE9DSwoKCmNvbmZpZyBQRVJfVk1BX0xPQ0sKICAgICAgICAgYm9v
bCAiYWxsb3cgVk1BIGxvY2stYmFzZWQgcGFnZSBmYXVsdCIKICAgICAgICAgZGVmX2Jvb2wgeQog
ICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLICYmIE1NVSAmJiBT
TVAKClJldmlld2VkLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+
Cgo+ICAgCXNlbGVjdCBBUkNIX1VTRV9NRU1URVNUCj4gICAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVF
RF9SV0xPQ0tTCj4gICAJc2VsZWN0IEFSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlP
VVQgaWYgTU1VCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlz
Y3YvbW0vZmF1bHQuYwo+IGluZGV4IDg2ODVmODVhNzQ3NC4uZWNjZGRkZjI2ZjRiIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+IEBAIC0yODYsNiArMjg2LDM2IEBAIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gICAJCWZsYWdzIHw9IEZBVUxUX0ZMQUdfV1JJVEU7Cj4gICAJZWxzZSBp
ZiAoY2F1c2UgPT0gRVhDX0lOU1RfUEFHRV9GQVVMVCkKPiAgIAkJZmxhZ3MgfD0gRkFVTFRfRkxB
R19JTlNUUlVDVElPTjsKPiArI2lmZGVmIENPTkZJR19QRVJfVk1BX0xPQ0sKPiArCWlmICghKGZs
YWdzICYgRkFVTFRfRkxBR19VU0VSKSkKPiArCQlnb3RvIGxvY2tfbW1hcDsKPiArCj4gKwl2bWEg
PSBsb2NrX3ZtYV91bmRlcl9yY3UobW0sIGFkZHIpOwo+ICsJaWYgKCF2bWEpCj4gKwkJZ290byBs
b2NrX21tYXA7Cj4gKwo+ICsJaWYgKHVubGlrZWx5KGFjY2Vzc19lcnJvcihjYXVzZSwgdm1hKSkp
IHsKPiArCQl2bWFfZW5kX3JlYWQodm1hKTsKPiArCQlnb3RvIGxvY2tfbW1hcDsKPiArCX0KPiAr
Cj4gKwlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHIsIGZsYWdzIHwgRkFVTFRfRkxB
R19WTUFfTE9DSywgcmVncyk7Cj4gKwl2bWFfZW5kX3JlYWQodm1hKTsKPiArCj4gKwlpZiAoIShm
YXVsdCAmIFZNX0ZBVUxUX1JFVFJZKSkgewo+ICsJCWNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZN
QV9MT0NLX1NVQ0NFU1MpOwo+ICsJCWdvdG8gZG9uZTsKPiArCX0KPiArCWNvdW50X3ZtX3ZtYV9s
b2NrX2V2ZW50KFZNQV9MT0NLX1JFVFJZKTsKPiArCj4gKwlpZiAoZmF1bHRfc2lnbmFsX3BlbmRp
bmcoZmF1bHQsIHJlZ3MpKSB7Cj4gKwkJaWYgKCF1c2VyX21vZGUocmVncykpCj4gKwkJCW5vX2Nv
bnRleHQocmVncywgYWRkcik7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICtsb2NrX21tYXA6Cj4gKyNl
bmRpZiAvKiBDT05GSUdfUEVSX1ZNQV9MT0NLICovCj4gKwo+ICAgcmV0cnk6Cj4gICAJbW1hcF9y
ZWFkX2xvY2sobW0pOwo+ICAgCXZtYSA9IGZpbmRfdm1hKG1tLCBhZGRyKTsKPiBAQCAtMzU1LDYg
KzM4NSw5IEBAIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
ICAKPiAgIAltbWFwX3JlYWRfdW5sb2NrKG1tKTsKPiAgIAo+ICsjaWZkZWYgQ09ORklHX1BFUl9W
TUFfTE9DSwo+ICtkb25lOgo+ICsjZW5kaWYKPiAgIAlpZiAodW5saWtlbHkoZmF1bHQgJiBWTV9G
QVVMVF9FUlJPUikpIHsKPiAgIAkJdHNrLT50aHJlYWQuYmFkX2NhdXNlID0gY2F1c2U7Cj4gICAJ
CW1tX2ZhdWx0X2Vycm9yKHJlZ3MsIGFkZHIsIGZhdWx0KTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
