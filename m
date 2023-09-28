Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FB0CE7B1A
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxIXsNyvNSKQ3wl4vjfDYplo8iemF0j5RVCi/OkVjCs=; b=tZziseB+MFMwva
	SFeC7LsIMqglooElLfvR0dDwfIZH4ePOiyJwja42sdBDwQxkniRbciz2baJvSE2C7ZNDSw7PWPmwX
	nf/84X0xojItAEZFJ9JJnWzoIQKh58mTzuqKfeujBCjKnCsdprvhv2JCcDL6r1lGAiqDpr9RxRHU4
	FlC+K3a9u+sCjxJP1wEdZNRIVLzL9uSsKtb4DvooTh8dMETHmvPXTpu1F1tDkxArE/3QnVGf+VLd4
	JMJFjO33vzGPjcun2l0kiN5gUdYdEZG7qkq8hErMs9IXz/idvFOB0MZBwALWpqDMws0w8hHwc7vzf
	ILmUb/4dulDRrSiORI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlogf-002z9i-0J;
	Thu, 28 Sep 2023 10:56:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloga-002z6N-05
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 00F0EB81BA2;
	Thu, 28 Sep 2023 10:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E99C433C7;
	Thu, 28 Sep 2023 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695898556;
	bh=uF8k+xv/J7MQvU+3y3VuDDEpWfL25l0yWZxOxN+yBMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PwKmrtS+RNkpL/btIngYXZtvsPYyF8HxJNu/OKq3SWXSVGgbQE/CYQTqNzlf7u/Vj
	 860MkYo7ecMK7nGr/lIQKGKpNHYNmqPRHzKTHoDnvqlGDxhazpUdq3M2wj5pHtD+um
	 Pa7GpWMPs98PsJt2ezlyuxFZpjBXRbPwIVq7ukDObKPwOtUirEODI67c+wyfNhMYtz
	 FsRjHd0FP3x79Ln43pj+3V3/NWCEzmC9rwCErZJGkd7FIGFaI5gEGZxuU/zV8H0f35
	 JFx1xDX0W1EfRMo7kcvHpCUqHjQrHohweznGM/NfH1hQlBpVnNca9rR3JNSxac13FA
	 Ng3jIO3xxu5KQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 3/6] riscv, bpf: Simplify sext and zext
 logics in branch instructions
In-Reply-To: <20230919035839.3297328-4-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-4-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 12:55:53 +0200
Message-ID: <874jjeo9c6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_035600_375105_6F035691 
X-CRM114-Status: GOOD (  17.50  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGVyZSBhcmUgbWFueSBleHRlbnNpb24gaGVs
cGVycyBpbiB0aGUgY3VycmVudCBicmFuY2ggaW5zdHJ1Y3Rpb25zLCBhbmQKPiB0aGUgaW1wbGVt
ZW50YXRpb24gaXMgYSBiaXQgY29tcGxpY2F0ZWQuIFdlIHNpbXBsaWZ5IHRoaXMgbG9naWMgdGhy
b3VnaAo+IHR3byBzaW1wbGUgZXh0ZW5zaW9uIGhlbHBlcnMgd2l0aCBhbHRlcm5hdGUgcmVnaXN0
ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgODIgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA1
MSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDRhNjQ5ZTE5
NS4uMGM2ZmZlMTFhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTE0MSw2ICsx
NDEsMTkgQEAgc3RhdGljIGJvb2wgaW5fYXVpcGNfamFscl9yYW5nZShzNjQgdmFsKQo+ICAJCXZh
bCA8ICgoMUwgPDwgMzEpIC0gKDFMIDw8IDExKSk7Cj4gIH0KPiAgCj4gKy8qIE1vZGlmeSByZCBw
b2ludGVyIHRvIGFsdGVybmF0ZSByZWcgdG8gYXZvaWQgY29ycnVwdGluZyBvcmlnaW5hbCByZWcg
Ki8KPiArc3RhdGljIHZvaWQgZW1pdF9zZXh0d19hbHQodTggKnJkLCB1OCByYSwgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCj4gK3sKPiArCWVtaXRfc2V4dHcocmEsICpyZCwgY3R4KTsKPiAr
CSpyZCA9IHJhOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBlbWl0X3pleHR3X2FsdCh1OCAqcmQs
IHU4IHJhLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiArewo+ICsJZW1pdF96ZXh0dyhy
YSwgKnJkLCBjdHgpOwo+ICsJKnJkID0gcmE7Cj4gK30KPiArCj4gIC8qIEVtaXQgZml4ZWQtbGVu
Z3RoIGluc3RydWN0aW9ucyBmb3IgYWRkcmVzcyAqLwo+ICBzdGF0aWMgaW50IGVtaXRfYWRkcih1
OCByZCwgdTY0IGFkZHIsIGJvb2wgZXh0cmFfcGFzcywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpj
dHgpCj4gIHsKPiBAQCAtMzk1LDM4ICs0MDgsNiBAQCBzdGF0aWMgdm9pZCBpbml0X3JlZ3ModTgg
KnJkLCB1OCAqcnMsIGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwKPiAgCQkqcnMgPSBicGZf
dG9fcnZfcmVnKGluc24tPnNyY19yZWcsIGN0eCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGVt
aXRfemV4dF8zMl9yZF9ycyh1OCAqcmQsIHU4ICpycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpj
dHgpCj4gLXsKPiAtCWVtaXRfbXYoUlZfUkVHX1QyLCAqcmQsIGN0eCk7Cj4gLQllbWl0X3pleHR3
KFJWX1JFR19UMiwgUlZfUkVHX1QyLCBjdHgpOwo+IC0JZW1pdF9tdihSVl9SRUdfVDEsICpycywg
Y3R4KTsKPiAtCWVtaXRfemV4dHcoUlZfUkVHX1QxLCBSVl9SRUdfVDEsIGN0eCk7Cj4gLQkqcmQg
PSBSVl9SRUdfVDI7Cj4gLQkqcnMgPSBSVl9SRUdfVDE7Cj4gLX0KPiAtCj4gLXN0YXRpYyB2b2lk
IGVtaXRfc2V4dF8zMl9yZF9ycyh1OCAqcmQsIHU4ICpycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0
ICpjdHgpCj4gLXsKPiAtCWVtaXRfc2V4dHcoUlZfUkVHX1QyLCAqcmQsIGN0eCk7Cj4gLQllbWl0
X3NleHR3KFJWX1JFR19UMSwgKnJzLCBjdHgpOwo+IC0JKnJkID0gUlZfUkVHX1QyOwo+IC0JKnJz
ID0gUlZfUkVHX1QxOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBlbWl0X3pleHRfMzJfcmRfdDEo
dTggKnJkLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiAtewo+IC0JZW1pdF9tdihSVl9S
RUdfVDIsICpyZCwgY3R4KTsKPiAtCWVtaXRfemV4dHcoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIGN0
eCk7Cj4gLQllbWl0X3pleHR3KFJWX1JFR19UMSwgUlZfUkVHX1QyLCBjdHgpOwo+IC0JKnJkID0g
UlZfUkVHX1QyOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBlbWl0X3NleHRfMzJfcmQodTggKnJk
LCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiAtewo+IC0JZW1pdF9zZXh0dyhSVl9SRUdf
VDIsICpyZCwgY3R4KTsKPiAtCSpyZCA9IFJWX1JFR19UMjsKPiAtfQo+IC0KPiAgc3RhdGljIGlu
dCBlbWl0X2p1bXBfYW5kX2xpbmsodTggcmQsIHM2NCBydm9mZiwgYm9vbCBmaXhlZF9hZGRyLAo+
ICAJCQkgICAgICBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiAgewo+IEBAIC0xMzcyLDIy
ICsxMzUzLDIyIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24g
Kmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAJCXJ2b2ZmID0gcnZfb2Zmc2V0
KGksIG9mZiwgY3R4KTsKPiAgCQlpZiAoIWlzNjQpIHsKPiAgCQkJcyA9IGN0eC0+bmluc25zOwo+
IC0JCQlpZiAoaXNfc2lnbmVkX2JwZl9jb25kKEJQRl9PUChjb2RlKSkpCj4gLQkJCQllbWl0X3Nl
eHRfMzJfcmRfcnMoJnJkLCAmcnMsIGN0eCk7Cj4gLQkJCWVsc2UKPiAtCQkJCWVtaXRfemV4dF8z
Ml9yZF9ycygmcmQsICZycywgY3R4KTsKPiArCQkJaWYgKGlzX3NpZ25lZF9icGZfY29uZChCUEZf
T1AoY29kZSkpKSB7Cj4gKwkJCQllbWl0X3NleHR3X2FsdCgmcnMsIFJWX1JFR19UMSwgY3R4KTsK
PiArCQkJCWVtaXRfc2V4dHdfYWx0KCZyZCwgUlZfUkVHX1QyLCBjdHgpOwo+ICsJCQl9IGVsc2Ug
ewo+ICsJCQkJZW1pdF96ZXh0d19hbHQoJnJzLCBSVl9SRUdfVDEsIGN0eCk7Cj4gKwkJCQllbWl0
X3pleHR3X2FsdCgmcmQsIFJWX1JFR19UMiwgY3R4KTsKPiArCQkJfQo+ICAJCQllID0gY3R4LT5u
aW5zbnM7Cj4gLQoKUGxlYXNlIGF2b2lkIGNoYW5nZXMgbGlrZSB0aGlzLgoKCj4gIAkJCS8qIEFk
anVzdCBmb3IgZXh0cmEgaW5zbnMgKi8KPiAgCQkJcnZvZmYgLT0gbmluc25zX3J2b2ZmKGUgLSBz
KTsKPiAgCQl9Cj4gLQoKRGl0by4KCj4gIAkJaWYgKEJQRl9PUChjb2RlKSA9PSBCUEZfSlNFVCkg
ewo+ICAJCQkvKiBBZGp1c3QgZm9yIGFuZCAqLwo+ICAJCQlydm9mZiAtPSA0Owo+ICAJCQllbWl0
X2FuZChSVl9SRUdfVDEsIHJkLCBycywgY3R4KTsKPiAtCQkJZW1pdF9icmFuY2goQlBGX0pORSwg
UlZfUkVHX1QxLCBSVl9SRUdfWkVSTywgcnZvZmYsCj4gLQkJCQkgICAgY3R4KTsKPiArCQkJZW1p
dF9icmFuY2goQlBGX0pORSwgUlZfUkVHX1QxLCBSVl9SRUdfWkVSTywgcnZvZmYsIGN0eCk7Cj4g
IAkJfSBlbHNlIHsKPiAgCQkJZW1pdF9icmFuY2goQlBGX09QKGNvZGUpLCByZCwgcnMsIHJ2b2Zm
LCBjdHgpOwo+ICAJCX0KPiBAQCAtMTQxNiwyMSArMTM5NywyMCBAQCBpbnQgYnBmX2ppdF9lbWl0
X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQg
KmN0eCwKPiAgCWNhc2UgQlBGX0pNUDMyIHwgQlBGX0pTTEUgfCBCUEZfSzoKPiAgCQlydm9mZiA9
IHJ2X29mZnNldChpLCBvZmYsIGN0eCk7Cj4gIAkJcyA9IGN0eC0+bmluc25zOwo+IC0JCWlmIChp
bW0pIHsKPiArCQlpZiAoaW1tKQo+ICAJCQllbWl0X2ltbShSVl9SRUdfVDEsIGltbSwgY3R4KTsK
PiAtCQkJcnMgPSBSVl9SRUdfVDE7Cj4gLQkJfSBlbHNlIHsKPiAtCQkJLyogSWYgaW1tIGlzIDAs
IHNpbXBseSB1c2UgemVybyByZWdpc3Rlci4gKi8KPiAtCQkJcnMgPSBSVl9SRUdfWkVSTzsKPiAt
CQl9Cj4gKwkJcnMgPSBpbW0gPyBSVl9SRUdfVDEgOiBSVl9SRUdfWkVSTzsKPiAgCQlpZiAoIWlz
NjQpIHsKPiAtCQkJaWYgKGlzX3NpZ25lZF9icGZfY29uZChCUEZfT1AoY29kZSkpKQo+IC0JCQkJ
ZW1pdF9zZXh0XzMyX3JkKCZyZCwgY3R4KTsKPiAtCQkJZWxzZQo+IC0JCQkJZW1pdF96ZXh0XzMy
X3JkX3QxKCZyZCwgY3R4KTsKPiArCQkJaWYgKGlzX3NpZ25lZF9icGZfY29uZChCUEZfT1AoY29k
ZSkpKSB7Cj4gKwkJCQllbWl0X3NleHR3X2FsdCgmcmQsIFJWX1JFR19UMiwgY3R4KTsKPiArCQkJ
CS8qIHJzIGhhcyBiZWVuIHNpZ24gZXh0ZW5kZWQgKi8KPiArCQkJfSBlbHNlIHsKPiArCQkJCWVt
aXRfemV4dHdfYWx0KCZyZCwgUlZfUkVHX1QyLCBjdHgpOwo+ICsJCQkJaWYgKGltbSkKPiArCQkJ
CQllbWl0X3pleHR3KHJzLCBycywgY3R4KTsKPiArCQkJfQo+ICAJCX0KPiAgCQllID0gY3R4LT5u
aW5zbnM7Cj4gLQoKRGl0by4KCk90aGVyIHRoYW4gdGhlIGZvcm1hdHRpbmcgY2hhbmdlcywgaXQg
bG9va3MgZ29vZCEKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
