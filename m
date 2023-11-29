Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AE1C07CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wA0xuA0X9F/dErpMw+/uMZNWrYoP77qbiIMLmpVqBQ=; b=1wru9fFjYs5ZXK
	m2RhN1c3qPqgcyW583etuWLxCCwAYgRqdxmYpDxEd+Y/oa42ovk7xvk+Ng4JIEfCvnxdMWWCLQDWF
	53svOt21sw8IOJ4oKCpbHlUd/qgDEL4N5hZ1m5XeQ9xKQsYsnTROKaz0BrjCdKVEHjBpEMS7eUAGD
	U8v1KbaMmgl04WvK8tWAu30QlUjrKm4J4QBREYT//X9J40JjDvNweWkBGRNQcUUKZshzlrtP5wBpT
	YRe58eb4lzdssViAr1paVnda1Axq7msFDQIuOb1QKO3He/m4xBi2V7SBs4nb8rtuF48QZNSfLfwm0
	VtvkDSfZkG12YC07jRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ndz-008vWa-36;
	Wed, 29 Nov 2023 16:42:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ndy-008vWG-0s
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Nov 2023 16:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6LwqeNsD2oceyytAy3I4imVZszpmeJBapevX8WZgCjA=; b=K6UA1w4TdtWDsoJYQF1vJh2yEh
	L7g8BN72mQ95wwbgdtnMzbjbjs0zZx6Pkp8QJlFq7f/GUpN4yu2rt9CSCV4f+rly3SptIAEiHIues
	7mk9mi+ZiEoFg6gLIWnHnOV/1Uiy/Jx/NwbZ8H1PySG4wc5mck7EGnt2k3tDPkNTRxSVRAaRnrqzq
	5IEesCJORfOHf1w6RGBG9fn/s6smLjuhbdIRTQ9fvPi3iwusnk0THLH80+MOfiysiC5m7Z6R9UujB
	MwGRAclFhhD/sz69o2I+s8xmSRU4t9+1FDFtI8+SCIqOKz3y4X/9lguQX5v+rUqrTOKo3jqif6DJn
	6C5QbrYA==;
Received: from xry111.site ([89.208.246.23])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ndr-000QLE-0n
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 16:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1701276134;
	bh=VzR4EoUUwocqvWHOsW2iuWo50a/tDaBPTdKdJ2I6t2g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nizf3tKADXY9gw8RTUwRGlwn3bF+kVHzcfAVVoQy23ftGQWm2aMZcuj6CBws7tvwq
	 WMFFy81wFg7j3jQUfMh7fvPY1jOvXITNjXdb5dkmIXHJgd90hJjS7roCLSq93WMdzb
	 tYBpVV0GAKvvq8IUWSqB2agdkt/YRZcNtRZaba+A=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 7382166AB8;
	Wed, 29 Nov 2023 11:42:11 -0500 (EST)
Message-ID: <5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
From: Xi Ruoyao <xry111@xry111.site>
To: Conor Dooley <conor@kernel.org>, Kwanghoon Son <k.son@samsung.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
  guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com,  aou@eecs.berkeley.edu, inki.dae@samsung.com,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 30 Nov 2023 00:42:09 +0800
In-Reply-To: <20230919-42333064be342f6ab125dd75@fedora>
References: <20230918045125.4000083-1-k.son@samsung.com>
	 <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
	 <20230918045125.4000083-2-k.son@samsung.com>
	 <20230918-4ef7f52da269f3a7e4023bb3@fedora>
	 <005301d9eab7$5688c920$039a5b60$@samsung.com>
	 <20230919-42333064be342f6ab125dd75@fedora>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_164229_256350_6D323C1C 
X-CRM114-Status: GOOD (  16.80  )
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

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDA5OjQ3ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
R3VvLAo+IAo+IE9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDAyOjA4OjMyUE0gKzA5MDAsIEt3YW5n
aG9vbiBTb24gd3JvdGU6Cj4gPiA+ID4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVhZCx0aDE1
MjAtcmVzZXQKPiA+ID4gPiA+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHN5c2Nvbgo+ID4gPiA+IAo+
ID4gPiA+IGlEdW1iIHF1ZXN0aW9uIHBlcmhhcHMsIGJ1dCB3aHkgaXMgdGhpcyBhIHN5c2Nvbj8K
PiA+ID4gCj4gPiA+IFRoaXMgaXMgZ29vZCBwb2ludC4KPiA+ID4gSW4gZmFjdCwgSSB0b29rIGl0
IGZyb20gdGhlIHZlbmRvciBrZXJuZWwsIGFuZCBJIHRyaWVkIHRvIGtlZXAgaXQgYXMgc2FtZSBh
cyBJIGNvdWxkLgo+ID4gPiBWZW5kb3IgYWxzbyBmb2xsb3dlZCBkcml2ZXJzL3Jlc2V0L3Jlc2V0
LWlteDcuYwo+ID4gPiBBcyBSb2Igc2FpZCwgaWYgZG9uJ3QgbmVlZCBpdCwgSSdsbCBjaGFuZ2Ug
aXQuCj4gCj4gPiBJIGhhdmUgaW52ZXN0aWdhdGVkIHZlbmRvciBrZXJuZWxzLCBidXQgaXQgaXMg
c3RpbGwgbm90IHN1cmUgcmVzZXQgaW5mb3JtYXRpb24uCj4gPiBJIHRob3VnaHQgdGhpcyBpcyBh
Ym91dCBzeXNfcmVnLCBidXQgd2l0aG91dCBkYXRhc2hlZXQsIGNhbid0IHRlbGwuCj4gPiBUaGVy
ZWZvcmUsIHNob3VsZCBiZSBzdG9wcGVkIHBhdGNoIGZvciBhIHdoaWxlIHVudGlsIGtub3dzIGJl
dHRlciBjb21lcyBvdXQuCj4gCj4gSXMgdGhlcmUgZG9jdW1lbnRhdGlvbiBpbiBFbmdsaXNoIHlv
dSBjYW4gcHJvdmlkZSB0byB0aGVzZSBwZW9wbGUgdGhhdAo+IGFyZSB0cnlpbmcgdG8gYWRkIHN1
cHBvcnQgZm9yIHlvdXIgcHJvZHVjdD8KCkl0IGNhbiBiZSBkb3dubG9hZGVkIGZyb20KaHR0cHM6
Ly9kbC5zaXBlZWQuY29tL3NoYXJlVVJML0xJQ0hFRS9saWNoZWVwaTRhLzA5X0RvYyBub3cuICBD
bGljayBvbgoiVEgxNTIwIFVzZXIgTWFudWFsLnppcCIgYW5kIGVudGVyIGEgY2FwdGNoYS4gIFRo
ZSBkb2MgYWJvdXQgcmVzZXR0aW5nCmlzIGluIGNoYXB0ZXIgNSBvZiAiVEgxNTIwIFN5c3RlbSBV
c2VyIE1hbnVhbC5wZGYiLgoKCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2No
b29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
