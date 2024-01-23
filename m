Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3059FC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 17:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkMX+n+X8ZAEvhAEespdER1gbdEDJzpggBAcaRXtAnM=; b=PgtfWq9EjIKsin
	ck2f1zLGSTF5C9gYpJ8pdxA/HZq5Ix/lxYveXv63MoBLlRAf/jEk8/pL2r8lsA727ETztQgZEJ3op
	cnl7odvA08RruzEpMtVT2mDtkwvOvKzNFYrUThpNoqT4ABEBDjBFf0L3VtT9MPT9BQpzkpik8pPWH
	dutp00CGBnSKD9ow2gHrE1Z7dX5T+vvqcT4l9oaW1Udr6T1at46ZrwXkcD7V5jxHDEOllbT5y/8jb
	kPSwtKkib8AXyAtFCX+MpBeTjXJ6AtwuhgZl+Y51FRd+spuVduZfc0U4ZxGVJE/zz0OpLAQYQegfE
	om/3ukDuUAj18sESIIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKor-00HYTp-2t;
	Tue, 23 Jan 2024 17:44:17 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKoo-00HYSR-24;
	Tue, 23 Jan 2024 17:44:16 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6dde1badac8so223030a34.0;
        Tue, 23 Jan 2024 09:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031851; x=1706636651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kq6KcpPGxOZbbj6MD5pFvib4SOoS9hzSh6Dd/9DvrIs=;
        b=guf2JA9agtdU7uFSm6f180v5oLECT4Y8n5u/nw9OTmmyyFcRM1/UsYv77TxJVmjzHs
         mK76O8S1NBJM2y3DEulCMNRcvWetuuVCe0kZhnELuT+Ib0CJNNXt4F0OQpoVGHFcCqOq
         ZPixJZ4+KqAT/xcYx7y7aUQ0Hfr/TCajTR9yu9ZXO/TcwkgAd09DNS31w4r5zLpBpyCs
         MMFxropE1UeJ+a1p6o7hA10/mTnQl+psfKd0zJedgMF9Xg94lJNydGRwNpc4EzLMf8D+
         7PiwI7s814GP4eJ1tt4p54uMNVnuVvybLU/z9/Y+AFz8QLrf8UqSB5Tz0/QsuyERKwCi
         TgaA==
X-Gm-Message-State: AOJu0YxzNz+s6M1CrtRe5CksDK6v1AC7uagePEZ2uMsZWNM4ALBmA9xr
	eHeNzL+Z57xlQTjBLdygTjQEEciS3RWpHoxvQ0W5brdWpMs9glwKxriWhuBkoSTsorlPFWhLbgW
	kHKOI+5yAq+jSV16oLGpXPaTQYFA=
X-Google-Smtp-Source: AGHT+IEpP44JkahyRRncDJZ6FDB633whaZG3UM7wkrdtm7F6Y1fagxGT/g8CFvifyPleyOU2/X9qkHN1NII1GS6acpg=
X-Received: by 2002:a4a:d9c4:0:b0:599:6d16:353c with SMTP id
 l4-20020a4ad9c4000000b005996d16353cmr9505215oou.1.1706031851278; Tue, 23 Jan
 2024 09:44:11 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
 <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
 <20240122180013.000016d5@Huawei.com> <Za++/11n5KA1VS3p@shell.armlinux.org.uk>
 <CAJZ5v0h7wsLt8d3ZoLXsK1=crAx66T42WDKNoHcg8CiHpAjS8g@mail.gmail.com> <Za/q9jivG4OdZM0f@shell.armlinux.org.uk>
In-Reply-To: <Za/q9jivG4OdZM0f@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jan 2024 18:43:59 +0100
Message-ID: <CAJZ5v0gwe02uzAQoX0QDHo35OTEozpbnqC6vukjM3aE6HMq9WQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include 'present'
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_094414_679250_969975B4 
X-CRM114-Status: GOOD (  45.15  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgNTozNuKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0
IDA1OjE1OjU0UE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBK
YW4gMjMsIDIwMjQgYXQgMjoyOOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSmFuIDIyLCAyMDI0
IGF0IDA2OjAwOjEzUE0gKzAwMDAsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gPiA+ID4gT24g
TW9uLCAxOCBEZWMgMjAyMyAyMTozNToxNiArMDEwMAo+ID4gPiA+ICJSYWZhZWwgSi4gV3lzb2Nr
aSIgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBE
ZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51
eC5vcmcudWs+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGcm9tOiBKYW1lcyBNb3Jz
ZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIGNvZGUg
YmVoaW5kIEFDUElfSE9UUExVR19DUFUgYWxsb3dzIGEgbm90LXByZXNlbnQgQ1BVIHRvIGJlY29t
ZQo+ID4gPiA+ID4gPiBwcmVzZW50Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJpZ2h0Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gVGhpcyBpc24ndCB0aGUgb25seSB1c2Ugb2YgSE9UUExVR19DUFUuIE9u
IGFybTY0IGFuZCByaXNjdgo+ID4gPiA+ID4gPiBDUFVzIGNhbiBiZSB0YWtlbiBvZmZsaW5lIGFz
IGEgcG93ZXIgc2F2aW5nIG1lYXN1cmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQnV0IHN0aWxsIHRo
ZXJlIGlzIHRoZSBjYXNlIGluIHdoaWNoIGEgbm9uLXByZXNlbnQgQ1BVIGNhbiBiZWNvbWUKPiA+
ID4gPiA+IHByZXNlbnQsIGlzbid0IGl0IHRoZXJlPwo+ID4gPiA+Cj4gPiA+ID4gTm90IHlldCBk
ZWZpbmVkIGJ5IHRoZSBhcmNoaXRlY3R1cmVzIChhbmQgSSdtIGFzc3VtaW5nIGl0IHByb2JhYmx5
IG5ldmVyIHdpbGwgYmUpLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9yaWdpbmFsIHByb3Bvc2FsIHdl
IHRvb2sgdG8gQVJNIHdhcyB0byBkbyBleGFjdGx5IHRoYXQgLSB0aGV5IHB1c2hlZAo+ID4gPiA+
IGJhY2sgaGFyZCBvbiB0aGUgYmFzaXMgdGhlcmUgd2FzIG5vIGFyY2hpdGVjdHVyYWxseSBzYWZl
IHdheSB0byBpbXBsZW1lbnQgaXQuCj4gPiA+ID4gVG9vIG11Y2ggb2YgdGhlIEFSTSBhcmNoIGhh
cyB0byBleGlzdCBmcm9tIHRoZSBzdGFydCBvZiB0aW1lLgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC9jYmFhNmQ2OC02MTQzLWUwMTAtNWYz
Yy1lYzYyZjg3OWFkOTVAYXJtLmNvbS8KPiA+ID4gPiBpcyBvbmUgb2YgdGhlIHJlbGV2YW50IHRo
cmVhZHMgb2YgdGhlIGtlcm5lbCBzaWRlIG9mIHRoYXQgZGlzY3Vzc2lvbi4KPiA+ID4gPgo+ID4g
PiA+IE5vdCB0byBwdXQgc3BlY2lmaWMgd29yZHMgaW50byB0aGUgQVJNIGFyY2hpdGVjdHMgbW91
dGhzLCBidXQgdGhlCj4gPiA+ID4gc2hvcnQgZGVzY3JpcHRpb24gaXMgdGhhdCB0aGVyZSBpcyBj
dXJyZW50bHkgbm8gZGVtYW5kIGZvciB3b3JraW5nCj4gPiA+ID4gb3V0IGhvdyB0byBtYWtlIHBo
eXNpY2FsIENQVSBob3RwbHVnIHBvc3NpYmxlLCBhcyBzdWNoIHRoZXkgd2lsbCBub3QKPiA+ID4g
PiBwcm92aWRlIGFuIGFyY2hpdGVjdHVyYWxseSBjb21wbGlhbnQgd2F5IHRvIGRvIGl0IGZvciB2
aXJ0dWFsIENQVSBob3RwbHVnIGFuZAo+ID4gPiA+IGFub3RoZXIgbWVhbnMgaXMgbmVlZGVkICh3
aGljaCBpcyB3aHkgdGhpcyBzZXJpZXMgZG9lc24ndCB1c2UgdGhlIHByZXNlbnQgYml0Cj4gPiA+
ID4gZm9yIHRoYXQgcHVycG9zZSBhbmQgd2UgaGF2ZSB0aGUgT25saW5lIGNhcGFibGUgYml0IGlu
IE1BRFQvR0lDQykKPiA+ID4gPgo+ID4gPiA+IEl0IHdhcyBhICdmdW4nIGRhbmNlIG9mIHNldmVy
YWwgeWVhcnMgdG8gZ2V0IHRvIHRoYXQgY2xhcmlmaWNhdGlvbi4KPiA+ID4gPiBBcyBhbm90aGVy
IGZ1biBmYWN0LCB0aGUgc2FtZSBpcyBkZWZpbmVkIGZvciB4ODYsIGJ1dCBJIGRvbid0IHRoaW5r
Cj4gPiA+ID4gYW55b25lIGhhcyB1c2VkIGl0IHlldCAoR0lDQyBmb3IgQVJNIGhhcyBhbiBvbmxp
bmUgY2FwYWJsZSBiaXQgaW4gdGhlIGZsYWdzIHRvCj4gPiA+ID4gZW5hYmxlIHRoaXMsIHdoaWNo
IHdhcyByZW1hcmthYmx5IHNpbWlsYXIgdG8gdGhlIG9ubGluZSBjYXBhYmxlIGJpdCBpbiB0aGUK
PiA+ID4gPiBmbGFncyBvZiB0aGUgTG9jYWwgQVBJQyBlbnRyaWVzIGFzIGFkZGVkIGZhaXJseSBy
ZWNlbnRseSkuCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIGFybTY0IGFuIG9mZmxp
bmUgQ1BVIG1heSBiZSBkaXNhYmxlZCBieSBmaXJtd2FyZSwgcHJldmVudGluZyBpdCBmcm9tCj4g
PiA+ID4gPiA+IGJlaW5nIGJyb3VnaHQgYmFjayBvbmxpbmUsIGJ1dCBpdCByZW1haW5zIHByZXNl
bnQgdGhyb3VnaG91dC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQWRkaW5nIGNvZGUgdG8gcHJl
dmVudCB1c2VyLXNwYWNlIHRyeWluZyB0byBvbmxpbmUgdGhlc2UgZGlzYWJsZWQgQ1BVcwo+ID4g
PiA+ID4gPiBuZWVkcyBzb21lIGFkZGl0aW9uYWwgdGVybWlub2xvZ3kuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFJlbmFtZSB0aGUgS2NvbmZpZyBzeW1ib2wgQ09ORklHX0FDUElfSE9UUExVR19Q
UkVTRU5UX0NQVSB0byByZWZsZWN0Cj4gPiA+ID4gPiA+IHRoYXQgaXQgbWFrZXMgcG9zc2libGUg
Q1BVcyBwcmVzZW50Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhvbmVzdGx5LCBJIGRvbid0IHRoaW5r
IHRoYXQgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5IG9yIGV2ZW4gdXNlZnVsLgo+ID4gPiA+Cj4g
PiA+ID4gV2hpbHN0IGl0J3MgYW4gYXR0ZW1wdCB0byBhdm9pZCBmdXR1cmUgY29uZnVzaW9uLCB0
aGUgcmVuYW1lIGlzCj4gPiA+ID4gbm90IHNvbWV0aGluZyBJIHJlYWxseSBjYXJlIGFib3V0IHNv
IG15IGFkdmljZSB0byBSdXNzZWxsIGlzIGRyb3AKPiA+ID4gPiBpdCB1bmxlc3MgeW91IGFyZSBh
dHRhY2hlZCB0byBpdCEKPiA+ID4KPiA+ID4gV2hpbGUgSSBhZ3JlZSB0aGF0IGl0IGlzbid0IGEg
bmVjZXNzaXR5LCBJIGRvbid0IGZ1bGx5IGFncmVlIHRoYXQgaXQKPiA+ID4gaXNuJ3QgdXNlZnVs
Lgo+ID4gPgo+ID4gPiBPbmUgb2YgdGhlIGlzc3VlcyB3aWxsIGJlIHRoYXQgd2hpbGUgQXJtNjQg
d2lsbCBzdXBwb3J0IGhvdHBsdWcgdkNQVSwKPiA+ID4gaXQgd29uJ3QgYmUgc2V0dGluZyBBQ1BJ
X0hPVFBMVUdfQ1BVIGJlY2F1c2UgaXQgZG9lc24ndCBzdXBwb3J0Cj4gPiA+IHRoZSBwcmVzZW50
IGJpdCBjaGFuZ2luZy4gU28gSSBjYW4gc2VlIHdoeSBKYW1lcyBkZWNpZGVkIHRvIHJlbmFtZQo+
ID4gPiBpdCAtIGJlY2F1c2Ugd2l0aCBBcm02NCdzIGhvdHBsdWcgdkNQVSwgdGhlIGlkZWEgdGhh
dCBBQ1BJX0hPVFBMVUdfQ1BVCj4gPiA+IHNvbWVob3cgZW5hYmxlcyBob3RwbHVnIENQVSBzdXBw
b3J0IGlzIG5vdyBubyBsb25nZXIgdHJ1ZS4KPiA+ID4KPiA+ID4gS2VlcGluZyBpdCBhcyBBQ1BJ
X0hPVFBMVUdfQ1BVIG1ha2VzIHRoZSBjb2RlIGxlc3Mgb2J2aW91cywgYmVjYXVzZSBpdAo+ID4g
PiBsZWFkcyBvbmUgdG8gYXNzdW1lIHRoYXQgaXQgb3VnaHQgdG8gYmUgZW5hYmxlZCBmb3IgQXJt
NjQncwo+ID4gPiBpbXBsZW1lbnRhdGlub24sIGFuZCB0aGF0IGNvdWxkIHdlbGwgY2F1c2UgaXNz
dWVzIGluIHRoZSBmdXR1cmUgaWYKPiA+ID4gcGVvcGxlIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhh
dCAiQUNQSV9IT1RQTFVHX0NQVSIgbWVhbnMgaG90cGx1ZyBDUFUKPiA+ID4gaXMgc3VwcG9ydGVk
IGluIEFDUEkuIEl0IGRvZXNuJ3QgYW55bW9yZS4KPiA+Cj4gPiBPbiB4ODYgdGhlcmUgaXMgbm8g
Y29uZnVzaW9uIEFGQUlDUy4gIEl0J3MgYWx3YXlzIG1lYW50ICJhcyBsb25nIGFzCj4gPiB0aGUg
cGxhdGZvcm0gc3VwcG9ydHMgaXQiLgo+Cj4gVGhhdCdzIHg4Niwgd2hpY2ggc3VwcG9ydHMgcGh5
c2ljYWwgQ1BVIGhvdHBsdWcuIFdlJ3JlIGludHJvZHVjaW5nCj4gc3VwcG9ydCBmb3IgQXJtNjQg
aGVyZSB3aGljaCBkb2Vzbid0IHN1cHBvcnQgcGh5c2ljYWwgQ1BVIGhvdHBsdWcuCj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBQ1BJLWJhc2VkICAg
ICAgUGh5c2ljYWwgICAgICAgIFZpcnR1YWwKPiBBcmNoICAgIEhPVFBMVUdfQ1BVICAgICBBQ1BJ
X0hPVFBMVUdfQ1BVICAgICAgICBIb3RwbHVnICAgICAgICAgSG90cGx1ZyAgICAgICAgIEhvdHBs
dWcKPiBBcm02NCAgIFkgICAgICAgICAgICAgICBOICAgICAgICAgICAgICAgICAgICAgICBZICAg
ICAgICAgICAgICAgTiAgICAgICAgICAgICAgIFkKPiB4ODYgICAgIFkgICAgICAgICAgICAgICBZ
ICAgICAgICAgICAgICAgICAgICAgICBZICAgICAgICAgICAgICAgWSAgICAgICAgICAgICAgIFkK
Pgo+IFNvIEFDUElfSE9UUExVR19DUFUgYmVjb21lcyB0b3RhbGx5IG1pc25hbWVkIHdpdGggdGhl
IGludHJvZHVjdGlvbgo+IG9mIGhvdHBsdWcgb24gQXJtNjQuCj4KPiBJZiB3ZSB3YW50IHRvIGp1
c3QgbG9vayBhdCBzdHVmZiBmcm9tIGFuIHg4NiBwZXJzcGVjdGl2ZSwgdGhlbiB5ZXMsCj4gaXQg
cmVtYWlucyBjb3JyZWN0IHRvIGNhbGwgaXQgQUNQSV9IT1RQTFVHX0NQVS4gSXQgaXNuJ3QgY29y
cmVjdCBhcwo+IHNvb24gYXMgd2UgYWRkIEFybTY0LCBhcyBJIGFscmVhZHkgc2FpZC4KCkFuZCBp
ZiB5b3UgcmVuYW1lIGl0LCBpdCBiZWNvbWVzIGxlc3MgY29uZnVzaW5nIGZvciBBUk02NCwgYnV0
IG1vcmUKY29uZnVzaW5nIGZvciB4ODYsIHdoaWNoIGJhc2ljYWxseSBpcyBteSBwb2ludC4KCklN
TyAiaG90cGx1ZyIgY292ZXJzIGJvdGggY2FzZXMgd2VsbCBlbm91Z2ggYW5kICJob3RwbHVnIHBy
ZXNlbnQiIGlzCm9ubHkgYWNjdXJhdGUgZm9yIG9uZSBvZiB0aGVtLgoKPiBBbmQgaG9uZXN0bHks
IGEgdHdvIGxpbmUgcXVpcCB0byBteSByZWFzb25lZCBhcmd1bWVudCBpcyBub3QgSU1ITwo+IGFu
IGFjY2VwdGFibGUgcmVwbHkuCgpXZWxsLCBJJ20gbm90IGV2ZW4gc3VyZSBob3cgdG8gcmVzcG9u
ZCB0byB0aGlzIC4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
