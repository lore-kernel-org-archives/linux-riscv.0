Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEAFEE20AB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXTTSk4hiUBMnca43HQ10cgBCIzuoIAhktN3PZLcV74=; b=ipXVhJGmd3y6DW
	LyuxBuABmBm7pbCNVknbyEmNygBkccoj7OChSA71AtuiMWs/jtokCcH3skz7QMCu/nTH3nrgxgWiV
	MFbDbQ9eJGttWtWbLmX410x+zTtqmjuFoVAD2m3UwwGGTt1F6K1HJpN5MywT/Cd59ftJPXQJJb0Ij
	xuAI1OrcVpt9pM+R8t0InKNebYRyHIAc5LBe687OKt9m2NZB2Y9YE2k/M7HYlxsIRELPJ45/NFzkv
	qHnpmmvdElx8ATseJWfMgthmSgLajoJkmzW+ds24JwFUqfqSShFwozYq99bb/yRNYnN6UVUFj+SZD
	WgR8PJJ9I6TK7zFqFYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMoT-0000000BRVX-05bk;
	Fri, 06 Feb 2026 14:28:01 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMoP-0000000BRV2-0s0a
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 14:27:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770388072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDTQrVkhNMhRGCiK8BUkruN/7ThIMVtkU5IFQtE1kMM=;
	b=ArIbMtIfzGo7vEj2gGrJ4K/X5CEPzLjOjGP4hNAfUqjrAE6EVKgxCipBYF/gj+qY8GjM6+
	pRRDU+IK7A6cUpiQQ5xtk/IRe2wA3YBLCZMn9a9TGpMKmnvpU4k8jguuhNxx7gyOsmuc0w
	Ik1CzZArMWPVg/9cn9D3GqCiLb5n9UU=
From: Menglong Dong <menglong.dong@linux.dev>
To: menglong8.dong@gmail.com,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiang.biao@linux.dev, martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v3 2/3] bpf,
 riscv: add fsession support for trampolines
Date: Fri, 06 Feb 2026 22:27:22 +0800
Message-ID: <5059733.GXAFRqVoOG@7950hx>
In-Reply-To: <CAJ+HfNj5JZJ-k5bJibSgLPD5xnTzf7kfvma4kJOBKoNTnSLLDg@mail.gmail.com>
References: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
 <444267200b59241e9da104eab8af2d7189aa401005887a2cd0128cd6aeda98e2@mail.kernel.org>
 <CAJ+HfNj5JZJ-k5bJibSgLPD5xnTzf7kfvma4kJOBKoNTnSLLDg@mail.gmail.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_062757_453576_4C47A6A7 
X-CRM114-Status: GOOD (  17.35  )
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

T24gMjAyNi8yLzYgMjE6NDIsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gTWVuZ2xvbmchCj4gCj4g
T24gRnJpLCA2IEZlYiAyMDI2IGF0IDEzOjUxLCA8Ym90K2JwZi1jaUBrZXJuZWwub3JnPiB3cm90
ZToKPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKPiA+Cj4gPiBbIC4uLiBdCj4gPgo+ID4gPiArc3RhdGljIGludCBpbnZva2VfYnBm
KHN0cnVjdCBicGZfdHJhbXBfbGlua3MgKnRsLCBpbnQgYXJnc19vZmYsIGludCByZXR2YWxfb2Zm
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgIGludCBydW5fY3R4X29mZiwgaW50IGZ1bmNfbWV0
YV9vZmYsIGJvb2wgc2F2ZV9yZXQsIHU2NCBmdW5jX21ldGEsCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgaW50IGNvb2tpZV9vZmYsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ID4gPiAr
ewo+ID4gPiArICAgICBpbnQgaSwgY3VyX2Nvb2tpZSA9IChjb29raWVfb2ZmIC0gYXJnc19vZmYp
IC8gODsKPiA+ID4gKwo+ID4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgdGwtPm5yX2xpbmtzOyBp
KyspIHsKPiA+ID4gKyAgICAgICAgICAgICBpbnQgZXJyOwo+ID4gPiArCj4gPiA+ICsgICAgICAg
ICAgICAgaWYgKGJwZl9wcm9nX2NhbGxzX3Nlc3Npb25fY29va2llKCZ0bC0+bGlua3NbaV0pKSB7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5e
Xl5eXl5eXl5eXgo+ID4KPiA+IFNob3VsZCB0aGlzIGJlIHRsLT5saW5rc1tpXSBpbnN0ZWFkIG9m
ICZ0bC0+bGlua3NbaV0/Cj4gPgo+ID4gVGhlIGZ1bmN0aW9uIGJwZl9wcm9nX2NhbGxzX3Nlc3Np
b25fY29va2llKCkgZXhwZWN0cyBhIHN0cnVjdCBicGZfdHJhbXBfbGluawo+ID4gcG9pbnRlciwg
YnV0IHRsLT5saW5rcyBpcyBhbiBhcnJheSBvZiBwb2ludGVycywgc28gdGwtPmxpbmtzW2ldIGlz
IGFscmVhZHkKPiA+IGEgc3RydWN0IGJwZl90cmFtcF9saW5rIHBvaW50ZXIuIFRoZSBleHRyYSAm
IHBhc3NlcyBhIHBvaW50ZXItdG8tcG9pbnRlci4KPiA+Cj4gPiBGb3IgY29tcGFyaXNvbiwgYXJt
NjQgdXNlczoKPiA+Cj4gPiAgICAgaWYgKGJwZl9wcm9nX2NhbGxzX3Nlc3Npb25fY29va2llKGZl
bnRyeS0+bGlua3NbaV0pKQo+ID4KPiA+IEFuZCBpbmNsdWRlL2xpbnV4L2JwZi5oIHVzZXM6Cj4g
Pgo+ID4gICAgIGlmIChicGZfcHJvZ19jYWxsc19zZXNzaW9uX2Nvb2tpZShmZW50cmllcy5saW5r
c1tpXSkpCj4gPgo+ID4gQm90aCB3aXRob3V0IHRoZSAmLgo+ID4KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHU2NCBtZXRhID0gZnVuY19tZXRhIHwgKCh1NjQpY3VyX2Nvb2tpZSA8PCBCUEZf
VFJBTVBfQ09PS0lFX0lOREVYX1NISUZUKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1mdW5jX21ldGFfb2ZmLCBt
ZXRhLCBjdHgpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY3VyX2Nvb2tpZS0tOwo+ID4g
PiArICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICBlcnIgPSBpbnZva2VfYnBmX3By
b2codGwtPmxpbmtzW2ldLCBhcmdzX29mZiwgcmV0dmFsX29mZiwgcnVuX2N0eF9vZmYsCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNhdmVfcmV0LCBjdHgpOwo+ID4K
PiA+IE5vdGUgdGhhdCBpbnZva2VfYnBmX3Byb2coKSBjb3JyZWN0bHkgdXNlcyB0bC0+bGlua3Nb
aV0gd2l0aG91dCB0aGUgJi4KPiAKPiBNZW5nbG9uZywgdGhlIHYzIGRvZXNuJ3QgYnVpbGQuIFBs
ZWFzZSByZWZyYWluIGZyb20ganVzdCBzdHJlc3NpbmcKPiB2ZXJzaW9ucyBvdXQuIEZvciB2NCwg
bWFrZSBzdXJlIHlvdSBwcm9wZXJseSBidWlsZC90ZXN0LiBPbiB0aGF0IG5vdGU7Cj4gb24gd2hh
dCBoYXJkd2FyZS9zaW11bGF0b3IgZGlkIHlvdSBwZXJmb3JtIHRoZSB0ZXN0cyBvbj8KCkFoLCBz
b3JyeSB0aGF0IHRoZSBDT05GSUdfQlBGX0pJVCBpcyBub3QgZW5hYmxlZCBpbiBteSBjb25maWcs
IHdoaWNoCm1ha2VzIG1lIGRpZG4ndCBmaW5kIHRoaXMgY29tcGlsZSBlcnJvci4KCkkgdXNlZCB0
byB0ZXN0IGl0IGluIHFlbXUuIEFzIHRoaXMgaXMgYSB0aW55IGNoYW5nZSwgc28gSSBkaWRuJ3Qg
cnVuIHRoZQp0ZXN0IGFnYWluIDovCgpJJ2xsIG1ha2Ugc3VyZSB0aGUgYnVpbGQgYW5kIHRlc3Qg
cGFzcyBpbiB0aGUgVjQuCgpUaGFua3MhCk1lbmdsb25nIERvbmcKCj4gCj4gCgoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
