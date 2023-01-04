Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E290C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgkA1yp8Bizgua57LRwR+Ai7CXIRdkY18bpO9/4tjb8=; b=LVe8pWgyr45hN3
	eQdNaaLSBVY2sfL2mLspzvX/9m6cWDVa3oBp3Kx4sW1KMiv80+ClCEmlXPUvNEcCBzS0uhaKEkP4F
	vt3KtJyC0IBlBPIQCjSsF2wE/VsiV8QwP0UrMc58itmHPk4kqI8glbQM3Le51pFky0b3AldyWrWLH
	mdNSbNR941x6CtOFRFxrQFTKX0Y0i0AaF/HvQnmwQFZDLIg9cps+avNNRohZmcfBFmXgm8y/ZVZUT
	jBx5jkH8kMfEaaPoYnRpCP6+vaeLhDtDVejfMYn9h0BR85ZT1xoH4GUsiubBsx08qTG/kkrMBgxX/
	J2wSHmVd91qqEQ1LQvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzHp-007gxP-Fq; Wed, 04 Jan 2023 08:38:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzF7-007fw8-Dt
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:35:27 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Nn2tx0qM5zRqny;
	Wed,  4 Jan 2023 16:33:45 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:35:16 +0800
Message-ID: <a00f788b-3799-4dcd-0401-846159e151c4@huawei.com>
Date: Wed, 4 Jan 2023 16:35:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 6/9] riscv/kprobe: Add code to check if kprobe can be
 optimized
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-7-chenguokai17@mails.ucas.ac.cn>
 <87sfgsvmnj.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87sfgsvmnj.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003525_754550_D624199D 
X-CRM114-Status: UNSURE (   9.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy8xLzMgMjowNCwgQmrDtnJuIFTDtnBlbCDlhpnpgZM6Cj4gQ2hlbiBHdW9rYWkg
PGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4gCj4+IEZyb206IExpYW8g
Q2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9vcHQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+
PiBpbmRleCBhMGQyYWIzOWUzZmEuLjI1OGEyODNjOTA2ZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy9vcHQuYwo+PiBAQCAtMjcxLDE1ICsyNzEsMTAzIEBAIHN0YXRpYyB2b2lkIGZpbmRfZnJlZV9y
ZWdpc3RlcnMoc3RydWN0IGtwcm9iZSAqa3AsIHN0cnVjdCBvcHRpbWl6ZWRfa3Byb2JlICpvcCwK
Pj4gIAkqcmEgPSAoa3cgPT0gMVVMKSA/IDAgOiBfX2J1aWx0aW5fY3R6bChrdyAmIH4xVUwpOwo+
PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9vbCBpbnNuX2p1bXBfaW50b19yYW5nZSh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4+ICsJCQkJIHVuc2lnbmVkIGxvbmcgZW5k
KQo+PiArewo+PiArCWtwcm9iZV9vcGNvZGVfdCBpbnNuID0gKihrcHJvYmVfb3Bjb2RlX3QgKilh
ZGRyOwo+PiArCXVuc2lnbmVkIGxvbmcgdGFyZ2V0LCBvZmZzZXQgPSBHRVRfSU5TTl9MRU5HVEgo
aW5zbik7Cj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX0MKPj4gKwlpZiAob2Zmc2V0
ID09IFJWQ19JTlNOX0xFTikgewo+PiArCQlpZiAocmlzY3ZfaW5zbl9pc19jX2JlcXooaW5zbikg
fHwgcmlzY3ZfaW5zbl9pc19jX2JuZXooaW5zbikpCj4+ICsJCQl0YXJnZXQgPSBhZGRyICsgcnZj
X2JyYW5jaF9pbW1lKGluc24pOwo+PiArCQllbHNlIGlmIChyaXNjdl9pbnNuX2lzX2NfamFsKGlu
c24pIHx8IHJpc2N2X2luc25faXNfY19qKGluc24pKQo+PiArCQkJdGFyZ2V0ID0gYWRkciArIHJ2
Y19qYWxfaW1tZShpbnNuKTsKPj4gKwkJZWxzZQo+PiArCQkJdGFyZ2V0ID0gMDsKPj4gKwkJcmV0
dXJuICh0YXJnZXQgPj0gc3RhcnQpICYmICh0YXJnZXQgPCBlbmQpOwo+PiArCX0KPj4gKyNlbmRp
Zgo+PiArCj4+ICsJaWYgKHJpc2N2X2luc25faXNfYnJhbmNoKGluc24pKQo+PiArCQl0YXJnZXQg
PSBhZGRyICsgcnZpX2JyYW5jaF9pbW1lKGluc24pOwo+PiArCWVsc2UgaWYgKHJpc2N2X2luc25f
aXNfamFsKGluc24pKQo+PiArCQl0YXJnZXQgPSBhZGRyICsgcnZpX2phbF9pbW1lKGluc24pOwo+
PiArCWVsc2UKPj4gKwkJdGFyZ2V0ID0gMDsKPj4gKwlyZXR1cm4gKHRhcmdldCA+PSBzdGFydCkg
JiYgKHRhcmdldCA8IGVuZCk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgc2VhcmNoX2NvcGll
ZF9pbnNuKHVuc2lnbmVkIGxvbmcgcGFkZHIsIHN0cnVjdCBvcHRpbWl6ZWRfa3Byb2JlICpvcCkK
Pj4gK3sKPj4gKwlpbnQgaSA9ICAxOwo+PiArCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gR0VUX0lO
U05fTEVOR1RIKCooa3Byb2JlX29wY29kZV90ICopcGFkZHIpOwo+PiArCj4+ICsJd2hpbGUgKChp
KysgPCBNQVhfQ09QSUVEX0lOU04pICYmIChvZmZzZXQgPCAyICogUlZJX0lOU05fTEVOKSkgewo+
PiArCQlpZiAocmlzY3ZfcHJvYmVfZGVjb2RlX2luc24oKHByb2JlX29wY29kZV90ICopcGFkZHIg
KyBvZmZzZXQsCj4+ICsJCQkJCSAgICBOVUxMKSAhPSBJTlNOX0dPT0QpCj4gCj4gSWYgdGhlIHNl
Y29uZCBhcmd1bWVudCBpcyBOVUxMLCBhbmQgdGhlIGluc24gaXMgYXVpcGMsIHdlJ2xsIHNwbGF0
IHdpdGgKPiBOVUxMLXB0ciBleGNlcHRpb24uCgpHb29kIGNhdGNoLCBpdCBpcyBteSBmYXVsdCB0
byBpZ25vcmUgdGhlIGFjY2VzcyB0byBzZWNvbmQgYXJndW1lbnQgaW4gbWFjcm8gUklTQ1ZfSU5T
Tl9TRVRfU0lNVUxBVEUuCgo+IAo+IEhtbSwgcHJvYmVfb3Bjb2RlX3QgaXMgdTMyLCByaWdodD8g
QW5kIEdFVF9JTlNOX0xFTkdUSCgpIHJldHVybnMgNCBvciAyCj4gLi4udGhlbiB0aGUgcG9pbnRl
ciBhcml0aG1ldGljIHdpbGwgYmUgYSBtZXNzPwoKSG1tLCBUaGlzIHBvaW50ZXIgYXJpdGhlbXRp
YyBkb2VzIG1ha2Ugbm8gc2Vuc2UgaGVyZSwgaSBoYWQgZGVidWdnZWQgdGhpcyBmdW5jdGlvbiBv
biBRRU1VIHN0ZXAgYnkgc3RlcCwKYW5kIGl0IHdvcmsgd2VsbC4gQW55d2F5LCBpIHdpbGwgZ28g
dGhyb3VnaCB0aGlzIGZ1bmN0aW9uIGFnYWluLCB0aGFua3MuCgo+IAo+IAo+IEJqw7ZybgoKLS0g
CkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
