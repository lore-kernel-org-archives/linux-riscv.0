Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FF5CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8S/iJ9o4AdteV2E5Etht935TLC4Q09cuuMy74FMdhaQ=; b=IUE4TpY/By8xqD
	NsCGzUm28Dskk7dndzPcJKGAID5V/QcNEjC676h1JuJ2zvJK/LB3FZy/N/uMKCpgMlHIj4md1u6vl
	8UtcYMo6xXERDqjSqy5fiP+An9O9biGj9b4rIzN7ORkDdcnOyQ8XwewxE6NCK3T8CAqmMiXVcP6ud
	0JuWpP2KL+t0wmdlQfLWHNeuTA2BzkCaSo4tLFFxL6SCjxl2dRSQKgZX9NH+IiOI56ZzUe8tDcLhl
	V9ltIiFZZulwmXjbsUHTdy549lGt/GYsWERjJ0YAyMCmeMKlzQHc1pgs8SeCgOCdo+w1CNby9cL2n
	0SGZx+7hjocSYXfuOHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpe6-0000000Fb7j-1OUg;
	Wed, 03 Jun 2026 17:44:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpe5-0000000Fb7F-1yfM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 17:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A00B0600AE
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 17:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566B71F00898
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780508688;
	bh=FUParyONVI2Qj3PwFGzLdK26Nc4Lc+7LxeqmGfzlOkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XVmh5ADe07P1f9LqFCukv3auT/xdl4cJ45wk/gD5dFRsMpz5sCJ4B7u+9tu3rhoZr
	 EXPTc7jDaVUDZVie2L60Kjm9z+Et2iGuPB/8li6Yihuhm6C/vAgimQKCYm7I3iU9Ni
	 BAvD4RjcCj2uEjB0DPlu5xRwpj8sNtSMqh6Ys9dy01dbEly2l7JWXAUmkqCKqkzeRu
	 TOja3UUzgCCzYccSqtJ8e+7JHAIAY29bLR0W+6ngtd94yZnkXBu6WVcpOMVpyyyglD
	 TRhj0tCqeEQgsrH3txoTP5WOoxU1eCm2PH+w1gEMtJQdBcU/ccnxYYY1xY2vWFZgzn
	 ZM0drYjJBYo4w==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso5684680a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 10:44:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KfkFq6W2Ok5dwAWGd0DQSHcqjSnpjhg96zCzP6AfTzt9K8xYz0Br3I1qTdMdaOMzC7kQx6nrL5uU8Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVXC7EVFklOfFVID6DSbOBaBuE3l4KpkRT7lN2GJMgsqTjQjAr
	2umTRH0nlchaLZfm3PuukOZTJMAS+RPMKlOKq4X50r5Z2nd3LVjYqEhf3YOJbU2C76EgnpFuJAj
	qNSZfLGZ6BkadnTrWQIk6OCiBAHAphQ==
X-Received: by 2002:a05:6402:3224:b0:67f:9124:8815 with SMTP id
 4fb4d7f45d1cf-68e71e788c3mr2143257a12.17.1780508687065; Wed, 03 Jun 2026
 10:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com> <20260602162450.GA442759-robh@kernel.org>
 <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
In-Reply-To: <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jun 2026 12:44:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
X-Gm-Features: AVHnY4Jg1TFYCpbsJd3VXxxqiBkj66MRmp2Oem1kgjUPEYvvmBJ9wL6Wox9sVrg
Message-ID: <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Wandun <chenwandun1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, iommu@lists.linux.dev, 
	zhaomeijing@lixiang.com, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, saravanak@kernel.org, 
	akpm@linux-foundation.org, bhe@redhat.com, rppt@kernel.org, 
	pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, quic_obabatun@quicinc.com
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjQ04oCvQU0gV2FuZHVuIDxjaGVud2FuZHVuMUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDYvMy8yNiAwMDoyNCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4gPiBPbiBXZWQsIE1heSAyNywgMjAyNiBhdCAxMToyOTowOUFNICswODAwLCBXYW5kdW4gQ2hl
biB3cm90ZToKPiA+PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4K
PiA+Pgo+ID4+IFRoZSBnbG9iYWwgcG9pbnRlciAncmVzZXJ2ZWRfbWVtJyBjb250aW51ZXMgdG8g
cmVmZXJlbmNlIHRoZQo+ID4+IHJlc2VydmVkX21lbV9hcnJheSB3aGljaCBsaXZlcyBpbiBfX2lu
aXRkYXRhIGlmCj4gPj4gYWxsb2NfcmVzZXJ2ZWRfbWVtX2FycmF5KCkgZmFpbHMuIG9mX3Jlc2Vy
dmVkX21lbV9sb29rdXAoKSBpcwo+ID4+IGV4cG9ydGVkIGZvciBwb3N0LWluaXQgdXNlLCB0aGF0
IHdvdWxkIGRlcmVmZXJlbmNlIGZyZWVkIG1lbW9yeQo+ID4+IGFuZCB0cmlnZ2VyIGEgdXNlLWFm
dGVyLWZyZWUuCj4gPj4KPiA+PiBTbyByZXNldCByZXNlcnZlZF9tZW1fY291bnQgdG8gMCB3aGVu
IGFsbG9jX3Jlc2VydmVkX21lbV9hcnJheSgpCj4gPj4gZmFpbHMuCj4gPj4KPiA+PiBGaXhlczog
MDBjOWE0NTJhMjM1ICgib2Y6IHJlc2VydmVkX21lbTogQWRkIGNvZGUgdG8gZHluYW1pY2FsbHkg
YWxsb2NhdGUgcmVzZXJ2ZWRfbWVtIGFycmF5IikKPiA+IEZpeGVzIHNob3VsZCBjb21lIGZpcnN0
IGluIGEgc2VyaWVzLgo+IFVuZGVyc3Rvb2QsIHdpbGwgZG8gaW4gZnV0dXJlIHN1Ym1pc3Npb25z
Lgo+ID4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5n
LmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgfCAyMCAr
KysrKysrKysrKysrKy0tLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9y
ZXNlcnZlZF9tZW0uYyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiA+PiBpbmRleCAz
MTNjYmM1N2FhNDUuLjZkNDc5MzgxZmYxZiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL29mL29m
X3Jlc2VydmVkX21lbS5jCj4gPj4gKysrIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwo+
ID4+IEBAIC02OSwyOSArNjksMzEgQEAgc3RhdGljIGludCBfX2luaXQgZWFybHlfaW5pdF9kdF9h
bGxvY19yZXNlcnZlZF9tZW1vcnlfYXJjaChwaHlzX2FkZHJfdCBzaXplLAo+ID4+ICAgICogdGhl
IGluaXRpYWwgc3RhdGljIGFycmF5IGlzIGNvcGllZCBvdmVyIHRvIHRoaXMgbmV3IGFycmF5IGFu
ZAo+ID4+ICAgICogdGhlIG5ldyBhcnJheSBpcyB1c2VkIGZyb20gdGhpcyBwb2ludCBvbi4KPiA+
PiAgICAqLwo+ID4+IC1zdGF0aWMgdm9pZCBfX2luaXQgYWxsb2NfcmVzZXJ2ZWRfbWVtX2FycmF5
KHZvaWQpCj4gPj4gK3N0YXRpYyBib29sIF9faW5pdCBhbGxvY19yZXNlcnZlZF9tZW1fYXJyYXko
dm9pZCkKPiA+PiAgIHsKPiA+PiAgICAgIHN0cnVjdCByZXNlcnZlZF9tZW0gKm5ld19hcnJheTsK
PiA+PiAgICAgIHNpemVfdCBhbGxvY19zaXplLCBjb3B5X3NpemUsIG1lbXNldF9zaXplOwo+ID4+
Cj4gPj4gKyAgICBpZiAoIXRvdGFsX3Jlc2VydmVkX21lbV9jbnQpCj4gPj4gKyAgICAgICAgICAg
IHJldHVybiB0cnVlOwo+ID4+ICsKPiA+PiAgICAgIGFsbG9jX3NpemUgPSBhcnJheV9zaXplKHRv
dGFsX3Jlc2VydmVkX21lbV9jbnQsIHNpemVvZigqbmV3X2FycmF5KSk7Cj4gPj4gICAgICBpZiAo
YWxsb2Nfc2l6ZSA9PSBTSVpFX01BWCkgewo+ID4+ICAgICAgICAgICAgICBwcl9lcnIoIkZhaWxl
ZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHJlc2VydmVkX21lbSBhcnJheSB3aXRoIGVycjogJWQi
LCAtRU9WRVJGTE9XKTsKPiA+PiAtICAgICAgICAgICAgcmV0dXJuOwo+ID4+ICsgICAgICAgICAg
ICBnb3RvIGZhaWw7Cj4gPj4gICAgICB9Cj4gPj4KPiA+PiAgICAgIG5ld19hcnJheSA9IG1lbWJs
b2NrX2FsbG9jKGFsbG9jX3NpemUsIFNNUF9DQUNIRV9CWVRFUyk7Cj4gPj4gICAgICBpZiAoIW5l
d19hcnJheSkgewo+ID4+ICAgICAgICAgICAgICBwcl9lcnIoIkZhaWxlZCB0byBhbGxvY2F0ZSBt
ZW1vcnkgZm9yIHJlc2VydmVkX21lbSBhcnJheSB3aXRoIGVycjogJWQiLCAtRU5PTUVNKTsKPiA+
PiAtICAgICAgICAgICAgcmV0dXJuOwo+ID4+ICsgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPj4g
ICAgICB9Cj4gPj4KPiA+PiAgICAgIGNvcHlfc2l6ZSA9IGFycmF5X3NpemUocmVzZXJ2ZWRfbWVt
X2NvdW50LCBzaXplb2YoKm5ld19hcnJheSkpOwo+ID4+ICAgICAgaWYgKGNvcHlfc2l6ZSA9PSBT
SVpFX01BWCkgewo+ID4+ICAgICAgICAgICAgICBtZW1ibG9ja19mcmVlKG5ld19hcnJheSwgYWxs
b2Nfc2l6ZSk7Cj4gPj4gLSAgICAgICAgICAgIHRvdGFsX3Jlc2VydmVkX21lbV9jbnQgPSBNQVhf
UkVTRVJWRURfUkVHSU9OUzsKPiA+PiAgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQgdG8gYWxs
b2NhdGUgbWVtb3J5IGZvciByZXNlcnZlZF9tZW0gYXJyYXkgd2l0aCBlcnI6ICVkIiwgLUVPVkVS
RkxPVyk7Cj4gPiBUaGVzZSBwcmludHMgY291bGQgYmUgbW92ZWQgdG8gJ2ZhaWwnLiBQZXJoYXBz
IGluc3RlYWQgb2YganVzdCBwcmludGluZwo+ID4gYW4gZXJyb3IgdmFsdWUsIHlvdSBjYW4gcmV0
dXJuIHRoZSBlcnJvciB2YWx1ZSBpbnN0ZWFkIG9mIGJvb2xlYW4uCj4gV2lsbCBkbywgY29uc29s
aWRhdGluZyBwcl9lcnIoKSB1bmRlciAnZmFpbCcgYW5kIGNoYW5naW5nIHRoZSByZXR1cm4gdHlw
ZQo+IHRvIGludC4KPiA+Cj4gPiBJZiB5b3UgcmVzcGluIGp1c3QgdGhpcyBwYXRjaCwgSSBjYW4g
cGljayBpdCB1cCBmb3IgNy4yLgo+IEJlZm9yZSBJIHJlc3BpbiwgSSdkIGxpa2UgdG8gZmxhZyBh
IGRlcGVuZGVuY3k6Cj4gcGF0Y2ggMDUvMDcgaW4gdGhpcyBzZXJpZXMgYnVpbGQgb24gdGhlIHNp
Z25hdHVyZSBjaGFuZ2UgaW50cm9kdWNlZCBieSB0aGlzCj4gcGF0Y2ggKCJ0aGUgdm9pZCAtPiBi
b29sIHJldHVybiB0eXBlIGNoYW5nZSBvZiBhbGxvY19yZXNlcnZlZF9tZW1fYXJyYXkoKSIpCj4K
PiBDb3VsZCB5b3UgbGV0IG1lIGtub3cgd2hpY2ggb2YgdGhlIGZvbGxvd2luZyB5b3UnZCBwcmVm
ZXI6Cj4gYSkgVGFrZSBwYXRjaCAwMyBhbG9uZSB2aWEgeW91ciB0cmVlIGFzIHlvdSBzdWdnZXN0
ZWQsIGFmdGVyIGl0IGxhbmRzLCBJJ2xsCj4gICAgIHJlc3BpbiB0aGUgcmVtYWluaW5nIHBhdGNo
ZXMgb2YgdGhpcyBzZXJpZXMuCgpJIHdvdWxkIGdvIHdpdGggdGhpcyBvcHRpb24uIEFJVUksIHRo
aXMgc2VyaWVzIGlzbid0IGdvaW5nIHRvIGxhbmQgaW4KNy4yLCBzbyB1bHRpbWF0ZWx5IHlvdSB3
aWxsIHJlYmFzZSBvbiB2Ny4yLXJjMSB3aGljaCB3aWxsIGhhdmUgdGhlCmZpeC4KCj4KPiBiKSBL
ZWVwIHBhdGNoIDAzIGluIHRoZSB2NCByZXNwaW4gb2YgdGhlIGZ1bGwgc2VyaWVzLCByZW9yZGVy
ZWQgdG8gdGhlIGZyb250Cj4gICAgIHBlciB5b3VyIGVhcmxpZXIgY29tbWVudC4KCgpSb2IKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
