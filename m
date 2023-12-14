Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC44C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 02:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bdMuumtCsRRkviw97JTa3wud6tlkbTLUSaOcH6aN/I=; b=h8Glvls7sXBqqJ
	RHf5siyQ7YICA75oBuftF3i+dcsZBJJVMxM/aOOG+n1r2N1rgVBcRiIPuI9VvrV3UkKmHZ29CGptv
	HZ4BFLxknC+9mtaHieBe3HGzLhYF5yRfGecjBNJ4tTHbCBfImYLf4lY1c35i56rgfwuBU4dH2ExT3
	YmMiOCiEcGXnVv8uPEd02Pj8eSaXfYvOWTopOWneWAh/nKnZJ/+X/ijHt3jQgk6mf+EFSHD/QTy6X
	s4zL+PltdLjMu2+yCXlZPHTgi7+pXnKmyvEEsVz4P8hGmB8NSaeGW6YKJv6pETweNis5hg69X8x3S
	afM2EoFJpV1mLzVzO3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDbeW-00GXdj-2o;
	Thu, 14 Dec 2023 02:40:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDbeU-00GXbf-0v
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 02:40:44 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50e18689828so61375e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 18:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702521637; x=1703126437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lhv/EzthGUPz9fqQRcFe5SdHzl9K/lJD8/NqlWP0FM=;
        b=W16col2ocUAUb69U94Z2F2X5eTjOrEaOcbct4mKEaVkgJG0pNK7sxGqI7ajd58oDhV
         reVlVjpKK5C36JhokiZnsYBTEYzdXVTVpvablP6r+KUPJBjJ8eBcCTmWvr3YbqIu1pvr
         u4KFreCELwXeXNhr7yRhi3C3Dm2eWLumjzGfKhbcwcFbNG0yX9pEv4JYWA/PPRCJrwYR
         5pToPBH/gJdGQdAWuMzNK4vwnjqV/9RyxGwEKcIr7TI1YyWPPQbnkp6F4kgODb1/Vl4A
         VtYxv4mLm+MjyRhpj8MucaQ38v71T1aQtzUp4Yud299iiQdPocSnQJllj3u2qFVLaNj/
         ijiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702521637; x=1703126437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lhv/EzthGUPz9fqQRcFe5SdHzl9K/lJD8/NqlWP0FM=;
        b=O998mGYyy7i9Pm+J3SXwpgvl9OF1wmK1DMewY27iGDMZocOZVva+Oz4D5yPl1ruQjn
         /loraegkYxxJ7zAUtuFq9nYHWytuJbHvj5GsazS2iVdyINKk5rOUzQ6Kc3adafcTe0ZZ
         iDl6W3dFagVqwEn2DxFwxTUDtWHjGZX+kaPmsIot+pXrHBU+75DX0SAUPaOHZyNO82Wn
         vXYrAw/ow+FQrKobkS/1+9Qnv7lqRJOhf+4hingkAc/ihvBZ5iupkSj7EL7/1YkMZFWw
         UCVPGloBeMh2mxBjmtlw0KTHs/vqnftYme8qcWhj4VSxM3R/vi9jhlZsjRmDn8T96TJX
         EPQA==
X-Gm-Message-State: AOJu0YyGgj+/bKM8jV066yJ82yxtPlIyNme7He/9nEIhLtR5gniEdxe+
	fcq1QD6XxmWjfEuCtTsQZw0p0y46OkqRj4YfxXEEG5CSJjpjI/oR
X-Google-Smtp-Source: AGHT+IFaTWyyugIpv61AAl/pUGwMUhupbJ8WUrcUi40AJsoJ9YreLQOIlUpA+q4ZaztosvIah2xHz6CAZ6lSwTnECFw=
X-Received: by 2002:a19:f70b:0:b0:50c:17d6:fff6 with SMTP id
 z11-20020a19f70b000000b0050c17d6fff6mr3644691lfe.1.1702521637486; Wed, 13 Dec
 2023 18:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20231213131321.12862-1-andy.chiu@sifive.com>
In-Reply-To: <20231213131321.12862-1-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 14 Dec 2023 10:40:25 +0800
Message-ID: <CABgGipWCnJPoKgAv=U_VKuj0u5ZsqzMSEXAYJ+FQQ4Nkkp==Ag@mail.gmail.com>
Subject: Re: [v4, 0/6] riscv: support kernel-mode Vector
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_184042_373855_EDE50D25 
X-CRM114-Status: GOOD (  23.62  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgOToxM+KAr1BNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVu
bmluZyBWZWN0b3IgY29kZSBpbiBrZXJuZWwgbW9kZS4KPiBBbG9uZyB3aXRoIHRoZSBzdXBvcnQs
IHdlIGFkZCBzb21lIFZlY3RvciBvcHRpbWl6ZWQgcm91dGluZXMuIEFuZAo+IHByb3ZpZGUgYSBz
aW1wbGUgdGhyZXNob2xkIHRvIGRlY2lkZSB3aGVuIHRvIHJ1biB0aGUgdmVjdG9yaXplZAo+IGZ1
bmN0aW9ucy4KPgo+IFdlIGRlY2lkZWQgdG8gc3BsaXQgdGhlIHBhdGNoIHNlcmllcyBpbnRvIDIg
cGFydHMuIFRoZSBmaXJzdCBwYXJ0Cj4gY29udGFpbnMgcnVubmluZyBrZXJuZWwtbW9kZSBWZWN0
b3Igd2l0aCBwcmVlbXB0aW9uIGRpc2FibGVkLiBUaGUgc2Vjb25kCj4gcGFydCB3aWxsIGFkZCBz
dXBwb3J0IGZvciBydW5uaW5nIFZlY3RvciB3aXRoIHByZWVtcHRpb24uCj4KPiBUaGlzIHBhdGNo
IGlzIHRlc3RlZCBvbiBhIFFFTVUgd2l0aCBWIGFuZCB2ZXJpZmllZCB0aGF0IGJvb3RpbmcsIG5v
cm1hbAo+IHVzZXJzcGFjZSBvcGVyYXRpb25zIGFsbCB3b3JrIGFzIHVzdWFsIHdpdGggdGhyZXNo
b2xkcyBzZXQgdG8gMC4KPgo+IHYzIG9mIHRoaXMgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdCBbMV0K
Pgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAxOTE1NDU1Mi4yMzM1
MS0xLWFuZHkuY2hpdUBzaWZpdmUuY29tLwo+Cj4gUGF0Y2ggc3VtbWFyeSAob24gY3VycmVudCBv
cmRlcik6Cj4gIC0gVXBkYXRlZCBwYXRjaGVzOiAxLCA0Cj4gIC0gTmV3IHBhdGNoOiAyLCA1LCA2
Cj4gIC0gVW5jaGFuZ2VkIHBhdGNoOiAzCj4gIC0gRGVsZXRlZCBwYXRjaDogUGF0Y2hlcyByZWxh
dGVkIHRvIHByZWVtcHRfdiB3aWxsIGJlIHNlbnQgc2VwYXJhdGVseQo+Cj4gQ2hhbmdlbG9nIHY0
Ogo+ICAtIFJlYmFzZSBvbiB0b3Agb2YgcmlzY3YgZm9yLW5leHQgKDYuNy1yYzEpCgpTb3JyeSwg
aXQncyB0b28gYmFkIHRoYXQgSSBtaXNzZWQgdGhpcy4gSSBmb3VuZCB0aGF0IHRoaXMgcGF0Y2gg
aXMKYWN0dWFsbHkgYmFzZWQgb24gdG9wIG9mIDYuNi1yYzEuIEkgd2lsbCBzZW5kIG91dCBhIHY1
IGxhdGVyIHRvZGF5LAp3aGljaCB3aWxsIGJlIHRlc3RlZCBhbmQgYmFzZWQgb24gdG9wIG9mIHRo
ZSB0aXAuIFNvcnJ5IGZvciBkaXN0dXJiaW5nCnRoZSBsaXN0LgoKPiAgLSBVc2Uga2VybmVsX3Zf
ZmxhZ3MgYW5kIGhlbHBlcnMgdG8gdHJhY2sgdmVjdG9yIGNvbnRleHQuCj4gIC0gUHJldmVudCBz
b2Z0aXJxIGZyb20gbmVzdGluZyBWIGNvbnRleHQgZm9yIG5vbi1wcmVlbXB0IFYKPiAgLSBBZGQg
dXNlciBjb3B5IGFuZCBtZW0qIHJvdXRpbmVzCj4KPiBDaGFuZ2Vsb2cgdjM6Cj4gIC0gUmViYXNl
IG9uIHRvcCBvZiByaXNjdiBmb3ItbmV4dCAoNi42LXJjMSkKPiAgLSBGaXggYSBidWlsZCBpc3N1
ZSAoQ29ub3IpCj4gIC0gR3VhcmQgdnN0YXRlX3NhdmUsIHZzdGF0ZV9yZXN0b3JlIHdpdGgge2dl
dCxwdXR9X2NwdV92ZWN0b3JfY29udGV4dC4KPiAgLSBTYXZlIFYgY29udGV4dCBhZnRlciBkaXNh
YmxpbmcgcHJlZW1wdGlvbi4gKEd1bykKPiAgLSBSZW1vdmUgaXJxc19kaXNhYmxlZCgpIGNoZWNr
IGZyb20gbWF5X3VzZV9zaW1kKCkuIChCasO2cm4pCj4gIC0gQ29tbWVudCBhYm91dCBuZXN0aW5n
IFYgY29udGV4dC4KPgo+IENoYW5nZWxvZyB2MjoKPiAgLSBmaXggYnVpbGQgaXNzdWVzCj4gIC0g
Rm9sbG93IGFybSdzIHdheSBvZiBzdGFydGluZyBrZXJuZWwtbW9kZSBzaW1kIGNvZGU6Cj4gICAg
LSBhZGQgaW5jbHVkZS9hc20vc2ltZC5oIGFuZCByZW5hbWUgbWF5X3VzZV92ZWN0b3IoKSAtPgo+
ICAgICAgbWF5X3VzZV9zaW1kKCkKPiAgICAtIHJldHVybiB2b2lkIGluIGtlcm5lbF92ZWN0b3Jf
YmVnaW4oKSwgYW5kIEJVR19PTiBpZiBtYXlfdXNlX3NpbWQoKQo+ICAgICAgZmFpbHMKPiAgLSBD
aGFuZ2UgbmFtaW5nIHNjaGVtZSBmb3IgZnVuY3Rpb25zL21hY3JvcyAoQ29ub3IpOgo+ICAgIC0g
cmVtb3ZlIEtNVgo+ICAgIC0gJ3MvcnZ2L3ZlY3Rvci8nCj4gICAgLSAncy9SSVNDVl9JU0FfVl9Q
UkVFTVBUSVZFX0tNVi9SSVNDVl9JU0FfVl9QUkVFTVBUSVZFLycKPiAgICAtICdzL1RJRl9SSVND
Vl9WX0tNVi9USUZfUklTQ1ZfVl9LRVJORUxfTU9ERS8nCj4KPiBBbmR5IENoaXUgKDQpOgo+ICAg
cmlzY3Y6IHZlY3RvcjogbWFrZSBWZWN0b3IgYWx3YXlzIGF2YWlsYWJsZSBmb3Igc29mdGlycSBj
b250ZXh0Cj4gICByaXNjdjogc2NoZWQ6IGRlZmVyIHJlc3RvcmluZyBWZWN0b3IgY29udGV4dCBm
b3IgdXNlcgo+ICAgcmlzY3Y6IGxpYjogdmVjdG9yaXplIGNvcHlfdG9fdXNlci9jb3B5X2Zyb21f
dXNlcgo+ICAgcmlzY3Y6IGxpYjogYWRkIHZlY3Rvcml6ZWQgbWVtKiByb3V0aW5lcwo+Cj4gR3Jl
ZW50aW1lIEh1ICgyKToKPiAgIHJpc2N2OiBBZGQgc3VwcG9ydCBmb3Iga2VybmVsIG1vZGUgdmVj
dG9yCj4gICByaXNjdjogQWRkIHZlY3RvciBleHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9uCj4K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaCAgfCAgMTcgKysrKysKPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgfCAgMTUgKysrLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaCAgICAgICAgICB8ICA0NiArKysrKysrKysrKwo+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICB8ICAgMiArCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAgICAgIHwgIDMyICsrKysrKystCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20veG9yLmggICAgICAgICAgIHwgIDgyICsrKysrKysrKysrKysrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKPiAgYXJj
aC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMgfCAxMDEgKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgICB8ICAg
NCArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgICAgICAgICB8ICAgNSArLQo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgICB8ICAgNSArLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2
L2xpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgNiArKwo+ICBhcmNoL3Jpc2N2L2xpYi9t
ZW1jcHlfdmVjdG9yLlMgICAgICAgICB8ICAyOSArKysrKysrCj4gIGFyY2gvcmlzY3YvbGliL21l
bW1vdmVfdmVjdG9yLlMgICAgICAgIHwgIDQ5ICsrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2xp
Yi9tZW1zZXQuUyAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2xpYi9tZW1z
ZXRfdmVjdG9yLlMgICAgICAgICB8ICAzMyArKysrKysrKwo+ICBhcmNoL3Jpc2N2L2xpYi9yaXNj
dl92X2hlbHBlcnMuYyAgICAgICB8ICA1OSArKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9s
aWIvdWFjY2Vzcy5TICAgICAgICAgICAgICAgfCAgMTEgKysrCj4gIGFyY2gvcmlzY3YvbGliL3Vh
Y2Nlc3NfdmVjdG9yLlMgICAgICAgIHwgIDU1ICsrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yv
bGliL3hvci5TICAgICAgICAgICAgICAgICAgIHwgIDgxICsrKysrKysrKysrKysrKysrKysrCj4g
IDIxIGZpbGVzIGNoYW5nZWQsIDYzMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmgKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi9tZW1jcHlfdmVjdG9yLlMKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbW1vdmVfdmVjdG9yLlMKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvbGliL21lbXNldF92ZWN0b3IuUwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3YvbGliL3hvci5TCj4KPiAtLQo+IDIuMTcuMQo+CgpSZWdhcmRzLApBbmR5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
