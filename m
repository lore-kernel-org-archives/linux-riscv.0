Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB11C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGVQnDbtQKZa1ncG8TEbzAddk/5r1Sq8bIyIO48wqw4=; b=2dl1wIF/fGH1/8
	90zMLqA2rmJCp0xTswyl24xvQc+vxCCrQTvxXCTWJGVM5AOCS0XnGCEPIm2B4JKV4EM6Hkdgb6438
	iTDtgpGq8iQuyAYrXDkOx00UwUIFsCopQplpXREFb05m3wHGgoHzWC17ToxpCMZ8KvYmZrmUd51rA
	8KUwBFeklROPnnsRU70mEKLRbAwKFguvXL0d5TLAd26SXYTTMpNSrg9h1FfbrztlApM+a80fxx5+6
	iDyDGzMmoqnTN6ZgNB3PYFyALJmdKsA6lgsbzsLcFqq5zySXe3x0UybrDRLDTfdNLMDKYCSSXiXBH
	LB1pNZE48B8HSdFjRCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox70C-00E1Tj-1h; Mon, 21 Nov 2022 13:38:24 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox707-00E1PN-Ic; Mon, 21 Nov 2022 13:38:21 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NG7fq46ZczFqPg;
	Mon, 21 Nov 2022 21:34:59 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 21:38:13 +0800
Received: from [10.67.111.195] (10.67.111.195) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 21:38:13 +0800
Message-ID: <bb1c22ef-8cdb-2fc8-5ff7-f6cd92bf935d@huawei.com>
Date: Mon, 21 Nov 2022 21:38:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] RISC-V: KVM: optimize kvm_arch_hardware_enable()
To: Andrew Jones <ajones@ventanamicro.com>
CC: <anup@brainfault.org>, <atishp@atishpatra.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221121003915.2817102-1-chenlifu@huawei.com>
 <20221121105333.rap67cpmst3odiid@kamzik>
From: chenlifu <chenlifu@huawei.com>
In-Reply-To: <20221121105333.rap67cpmst3odiid@kamzik>
X-Originating-IP: [10.67.111.195]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053819_994050_26D56B67 
X-CRM114-Status: GOOD (  12.81  )
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

5ZyoIDIwMjIvMTEvMjEgMTg6NTMsIEFuZHJldyBKb25lcyDlhpnpgZM6Cj4gT24gTW9uLCBOb3Yg
MjEsIDIwMjIgYXQgMDg6Mzk6MTVBTSArMDgwMCwgQ2hlbiBMaWZ1IHdyb3RlOgo+PiBUaGUgdmFs
dWVzIG9mIENTUl9IRURFTEVHIGFuZCBDU1JfSElERUxFRyByZWdpc3RlcnMgYXJlIGNvbnN0YW50
cywKPj4gc28gY2hhbmdlIHRoZW0gZnJvbSB2YXJpYWJsZXMgdG8gbWFjcm9zLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaGVuIExpZnUgPGNoZW5saWZ1QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGFy
Y2gvcmlzY3Yva3ZtL21haW4uYyB8IDMxICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9t
YWluLmMKPj4gaW5kZXggZGYyZDg3MTY4NTFmLi43MDE5NmIwM2I2ZjkgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPj4g
QEAgLTEyLDEwICsxMiwyMSBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+PiAg
ICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4+ICAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+PiAgICNp
bmNsdWRlIDxhc20vc2JpLmg+Cj4+ICAgCj4+ICsjZGVmaW5lIEVYQ19IRURFTEVHICgoMVVMIDw8
IEVYQ19JTlNUX01JU0FMSUdORUQpIHwgXAo+PiArCQkgICAgICgxVUwgPDwgRVhDX0JSRUFLUE9J
TlQpICAgICAgfCBcCj4+ICsJCSAgICAgKDFVTCA8PCBFWENfU1lTQ0FMTCkgICAgICAgICB8IFwK
Pj4gKwkJICAgICAoMVVMIDw8IEVYQ19JTlNUX1BBR0VfRkFVTFQpIHwgXAo+PiArCQkgICAgICgx
VUwgPDwgRVhDX0xPQURfUEFHRV9GQVVMVCkgfCBcCj4+ICsJCSAgICAgKDFVTCA8PCBFWENfU1RP
UkVfUEFHRV9GQVVMVCkpCj4+ICsKPj4gKyNkZWZpbmUgSVJRX0hJREVMRUcgKCgxVUwgPDwgSVJR
X1ZTX1NPRlQpICB8IFwKPj4gKwkJICAgICAoMVVMIDw8IElSUV9WU19USU1FUikgfCBcCj4+ICsJ
CSAgICAgKDFVTCA8PCBJUlFfVlNfRVhUKSkKPj4gKwo+PiAgIGxvbmcga3ZtX2FyY2hfZGV2X2lv
Y3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+PiAgIAkJCXVuc2lnbmVkIGludCBpb2N0bCwgdW5zaWdu
ZWQgbG9uZyBhcmcpCj4+ICAgewo+PiAgIAlyZXR1cm4gLUVJTlZBTDsKPj4gICB9Cj4+IEBAIC0z
MCwyOSArNDEsMTMgQEAgaW50IGt2bV9hcmNoX2hhcmR3YXJlX3NldHVwKHZvaWQgKm9wYXF1ZSkK
Pj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiAgIGludCBrdm1fYXJjaF9oYXJkd2FyZV9l
bmFibGUodm9pZCkKPj4gICB7Cj4+IC0JdW5zaWduZWQgbG9uZyBoaWRlbGVnLCBoZWRlbGVnOwo+
PiAtCj4+IC0JaGVkZWxlZyA9IDA7Cj4+IC0JaGVkZWxlZyB8PSAoMVVMIDw8IEVYQ19JTlNUX01J
U0FMSUdORUQpOwo+PiAtCWhlZGVsZWcgfD0gKDFVTCA8PCBFWENfQlJFQUtQT0lOVCk7Cj4+IC0J
aGVkZWxlZyB8PSAoMVVMIDw8IEVYQ19TWVNDQUxMKTsKPj4gLQloZWRlbGVnIHw9ICgxVUwgPDwg
RVhDX0lOU1RfUEFHRV9GQVVMVCk7Cj4+IC0JaGVkZWxlZyB8PSAoMVVMIDw8IEVYQ19MT0FEX1BB
R0VfRkFVTFQpOwo+PiAtCWhlZGVsZWcgfD0gKDFVTCA8PCBFWENfU1RPUkVfUEFHRV9GQVVMVCk7
Cj4+IC0JY3NyX3dyaXRlKENTUl9IRURFTEVHLCBoZWRlbGVnKTsKPj4gLQo+PiAtCWhpZGVsZWcg
PSAwOwo+PiAtCWhpZGVsZWcgfD0gKDFVTCA8PCBJUlFfVlNfU09GVCk7Cj4+IC0JaGlkZWxlZyB8
PSAoMVVMIDw8IElSUV9WU19USU1FUik7Cj4+IC0JaGlkZWxlZyB8PSAoMVVMIDw8IElSUV9WU19F
WFQpOwo+PiAtCWNzcl93cml0ZShDU1JfSElERUxFRywgaGlkZWxlZyk7Cj4+IC0KPj4gKwljc3Jf
d3JpdGUoQ1NSX0hFREVMRUcsIEVYQ19IRURFTEVHKTsKPj4gKwljc3Jfd3JpdGUoQ1NSX0hJREVM
RUcsIElSUV9ISURFTEVHKTsKPj4gICAJY3NyX3dyaXRlKENTUl9IQ09VTlRFUkVOLCAtMVVMKTsK
Pj4gLQo+PiAgIAljc3Jfd3JpdGUoQ1NSX0hWSVAsIDApOwo+PiAgIAo+PiAgIAlyZXR1cm4gMDsK
Pj4gICB9Cj4+ICAgCj4+IC0tIAo+PiAyLjM3LjEKPj4KPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMg
b3B0aW1pemVzIGFueXRoaW5nLiBJJ20gcHJldHR5IHN1cmUgdGhlIGNvbXBpbGVyIHdpbGwKPiBs
b2FkIHRoZSBpbnB1dCB0byBjc3Jfd3JpdGUoKSBpbiB0aGUgbW9zdCBlZmZpY2llbnQgd2F5IGl0
IGNhbiwgcmVnYXJkbGVzcwo+IG9mIHVzaW5nIGEgY29uc3RhbnQgb3IgYnVpbGRpbmcgdGhlIGlu
cHV0IG91dCBvZiBjb25zdGFudHMuIFRoaXMgY291bGQKPiBtYXliZSBiZSBjb25zaWRlcmVkIGEg
Y29kZSBjbGVhbnVwLCBidXQsIGluIHRoaXMgY2FzZSwgaXQncyByZWFsbHkgaW4gdGhlCj4gZXll
IG9mIHRoZSBiZWhvbGRlci4KPiAKPiBUaGFua3MsCj4gZHJldwoKVGhhbmtzIGRyZXfvvIx5b3Un
cmUgcmlnaHQuCkkgY29tcGFyZWQgdHdvIHZlcnNpb24gYXJjaC9yaXNjdi9rdm0vbWFpbi5vIGZp
bGVzLCB0aGV5IGFyZSBzYW1lLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
