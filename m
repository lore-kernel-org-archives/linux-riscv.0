Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A117CC3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jX58NlEeJW9p8vrfJP8Sav9N7ZPCqpgtCSMf7Tj8bfk=; b=w8CBemIXPb0wP3
	9MHXzhW7OcvjE1IEBydWJHy6ayKcbKxavoze8bc4ve1Drt7Flx2GSVnPDysGBYqRAyLNUswGnwquw
	zJ9J5xYKYzZttrzUYfj203khEuTqjbJL8SyhA3ZJyqNdx2fLk/5kH/wLppJWYE8w0nKtmGecQiilY
	WV4i0tTqojWAFFljKq7e0VRfgMuYOMXogcOVTml6IYsuScpN4vvdzmlWEKRyld6DhlDkQUKNv6JQW
	AGDroD/xmr7NgnCUh7NrUNsOpXWyf59akxAxfXzCMhglgF/L92G+pKM4Ye9wvrLLV3RDH/cxlVgjp
	+EVi7vJANsxZ3AaGeSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28nl-000000049Gk-15fs;
	Tue, 08 Apr 2025 13:15:41 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u283M-00000003z8g-3oby
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 12:27:46 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-703cd93820fso50897347b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115264; x=1744720064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB1seewdxiTr2VW07A3+uDKCe37V8ksv4C8EdOhGRy0=;
        b=kvJUiyAH7zkjEt8L+DcBCaYXflkIo9VYl5c2RZC6FzMl98zL8DmMSjossyewrYp9bS
         U9wlMw6bUqhaY3pL0FhK5DaA0H979zw4xiXabL0SZ/OAhMZn/0BVS1eeMGmuy2hBLOPQ
         RLLLPeskwGy1ySz2AtRK2nixugK9PYqdX1z0zu4rhLKXBGHbsJmCrhdmnBKN/h3Z2PgN
         iOLYNXAlJ88V5aWJ2O+1g4FKd5oeyzAW2YD5yQUK8JABfJHxWJ8pyKeeZClqGBgwL7FE
         u8IrTIqG4BKbUQ797axndBL+kkRrv4V4BiIsVQLfSo5Ilzjjf5J4vTqPHzCLoPvdHCwo
         oH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115264; x=1744720064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB1seewdxiTr2VW07A3+uDKCe37V8ksv4C8EdOhGRy0=;
        b=Pg4TNO3DNscEy6qR4TQCdnIx4HjpHmH7AVND6L8uqP30Db/0DcF1DPTd/sSKIGG1tz
         +sHW7ERS8KJ3KUCxzV8iFwoJBg+hRKORKXFy6mFcmFdXKY7S2UpuyDZNsm6lQOYKP3fq
         U7NbLa4mAI0o8itcuK94TssOEEhHOs3QI7VP3EB9MPXP9RcNxJcpPFsjA14tGAwToPhf
         DKrzlXqNHJF66jEcVUF0CjTZQc9ltMLuZr00oabN+1Ahw/1aAZ10lRwmU0MbygngFEjq
         r2BNkswO8MnxDyZz5Durb7Q1ZPd+FaOSKi0g2zzsBGzP+ntXPWhaZ8aTnKFUH8aFmHMW
         Fl4A==
X-Forwarded-Encrypted: i=1; AJvYcCWKf5Z3nVxT+KDSZyCEcz7Aq9ZGxjw9du17BFuei81hLP7mtXR0sCTqEXmB6c/sTJbJXLNHRpsy6xUixg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFQdscir39df3WDZ5x3Xt5cK0++zHGIwNpSFlWv8Q9nQI9w1BZ
	UoXzcVSfTrZsiwrNpAkDPy23qIsgAOcMLRF1Mmq7hAvNgm4PWtngBYF0iinTuqY+PtdwGlEQafy
	QdZ2EcekVyiBzqc+HcthFl0pn2VNnNkreca8J4Q==
X-Gm-Gg: ASbGncuHYto8qTeELnpL3ZIHieieecz0W7M34H6l5DnDT1Aoeuvu3QkatDrUjdhbglH
	f/xqkYDdp3TxK8mGZ3dbH7qxuHBK0OioIln29Pzkw5nDKp56P/oUwYmsRwQoOf9wZhcwIg+s51F
	92z7Yn2elNQOw+ZspJSlAPGd8W0YE=
X-Google-Smtp-Source: AGHT+IHPTBP1/MTjSrc/I/MptAtnciiKhGr+WPv5BjoVAvGTZrpvXVXjRqBEPOIQ+IqwWxaW3A1IyTTYeV/ni7FYYsI=
X-Received: by 2002:a05:690c:4b06:b0:6f9:af1f:53a4 with SMTP id
 00721157ae682-703e16636afmr292316087b3.32.1744115263719; Tue, 08 Apr 2025
 05:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
 <CGME20250303143637eucas1p1a3abdea520ab88688de1263a5f07bba0@eucas1p1.samsung.com>
 <20250303143629.400583-5-m.wilczynski@samsung.com> <de50dd55e1285726e8d5ebae73877486.sboyd@kernel.org>
 <4c035603-4c11-4e71-8ef3-b857a81bf5ef@samsung.com> <aacd03a071dce7b340d7170eae59d662d58f23b1.camel@pengutronix.de>
 <e90a0c77-61a0-49db-86ba-bac253f8ec53@samsung.com> <38d9650fc11a674c8b689d6bab937acf@kernel.org>
 <CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com>
 <ef17e5d1-b364-41e1-ab8b-86140cbe69b2@samsung.com> <21983f8d-681d-4fed-ae44-42eee44c7f14@samsung.com>
In-Reply-To: <21983f8d-681d-4fed-ae44-42eee44c7f14@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:27:07 +0200
X-Gm-Features: ATxdqUHjCmHHXOL_8iuBi_mjDxdVOZW28WwVm4E83fRcaHrvrprcU7GgL8K7Wwo
Message-ID: <CAPDyKFofVfrK04OVmJ2aX_0uMV0b+f8dCpoezpA9LJbnSOf-9Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] clk: thead: Add GPU clock gate control with CLKGEN
 reset support
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, 
	mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, wefu@redhat.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_052744_951434_852E5338 
X-CRM114-Status: GOOD (  37.30  )
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

Wy4uLl0KCj4gPj4+Cj4gPj4+IEl0IGxvb2tzIGxpa2UgdGhlIFNvQyBnbHVlIG1ha2VzIHRoZSBp
bnRlcmFjdGlvbnMgYmV0d2VlbiB0aGUgY2xrIGFuZAo+ID4+PiByZXNldCBmcmFtZXdvcmtzIGNv
bXBsaWNhdGVkIGJlY2F1c2UgR1BVIGNsa3MgZG9uJ3Qgd29yayBpZiBhIHJlc2V0IGlzCj4gPj4+
IGFzc2VydGVkLiBZb3UncmUgdHJ5aW5nIHRvIGZpbmQgYSBwbGFjZSB0byBjb29yZGluYXRlIHRo
ZSBjbGsgYW5kIHJlc2V0Lgo+ID4+PiBBbSBJIHJpZ2h0Pwo+ID4+Pgo+ID4+PiBJJ2QgYWR2aXNl
IG1hbmFnaW5nIHRoZSBjbGtzIGFuZCByZXNldHMgaW4gYSBnZW5lcmljIHBvd2VyIGRvbWFpbiB0
aGF0Cj4gPj4+IGlzIGF0dGFjaGVkIHRvIHRoZSBHUFUgZGV2aWNlLiBJbiB0aGF0IHBvd2VyIGRv
bWFpbiwgY29vcmRpbmF0ZSB0aGUgY2xrCj4gPj4+IGFuZCByZXNldCBzZXF1ZW5jaW5nIHNvIHRo
YXQgdGhlIHJlc2V0IGlzIGRlYXNzZXJ0ZWQgYmVmb3JlIHRoZSBjbGtzIGFyZQo+ID4+PiBlbmFi
bGVkIChvciB3aGF0ZXZlciB0aGUgYWN0dWFsIHJlcXVpcmVtZW50IGlzKS4gSWYgdGhlIEdQVSBk
cml2ZXIKPiA+Pj4gX211c3RfIGhhdmUgYSBjbGsgYW5kIHJlc2V0IHBvaW50ZXIgdG8gdXNlLCBp
bXBsZW1lbnQgb25lIHRoYXQgZWl0aGVyCj4gPj4+IGRvZXMgbm90aGluZyBvciBmbGFnIHRvIHRo
ZSBHUFUgZHJpdmVyIHRoYXQgdGhlIHBvd2VyIGRvbWFpbiBpcyBtYW5hZ2luZwo+ID4+PiBhbGwg
dGhpcyBmb3IgaXQgc28gaXQgc2hvdWxkIGp1c3QgdXNlIHJ1bnRpbWUgUE0gYW5kIHN5c3RlbSBQ
TSBob29rcyB0bwo+ID4+PiB0dXJuIG9uIHRoZSBjbGtzIGFuZCB0YWtlIHRoZSBHUFUgb3V0IG9m
IHJlc2V0Lgo+ID4+Pgo+ID4+PiBGcm9tIHdoYXQgSSBjYW4gdGVsbCwgdGhlIEdQVSBkcml2ZXIg
bWFpbnRhaW5lciBkb2Vzbid0IHdhbnQgdG8gdGhpbmsKPiA+Pj4gYWJvdXQgdGhlIHdyYXBwZXIg
dGhhdCBsaWtlbHkgZ290IHBsYWNlZCBhcm91bmQgdGhlIGhhcmR3YXJlIGJsb2NrCj4gPj4+IHNo
aXBwZWQgYnkgSU1HLiBUaGlzIHdyYXBwZXIgaXMgdGhlIFNvQyBnbHVlIHRoYXQgbmVlZHMgdG8g
Z28gaW50byBhCj4gPj4+IGdlbmVyaWMgcG93ZXIgZG9tYWluIHNvIHRoYXQgdGhlIGRpZmZlcmVu
dCBQTSByZXNvdXJjZXMsIHJlc2V0LCBjbGssCj4gPj4+IGV0Yy4gY2FuIGJlIGNvb3JkaW5hdGVk
IGJhc2VkIG9uIHRoZSBHUFUgZGV2aWNlJ3MgcG93ZXIgc3RhdGUuIEl0J3MKPiA+Pj4gZWl0aGVy
IHRoYXQsIG9yIGdvIHRoZSBkd2MzIHJvdXRlIGFuZCBoYXZlIFNvQyBnbHVlIHBsYXRmb3JtIGRy
aXZlcnMKPiA+Pj4gdGhhdCBtYW5hZ2UgdGhpcyBzdHVmZiBhbmQgY3JlYXRlIGEgY2hpbGQgZGV2
aWNlIHRvIHJlcHJlc2VudCB0aGUgaGFyZAo+ID4+PiBtYWNybyBzaGlwcGVkIGJ5IHRoZSB2ZW5k
b3IgbGlrZSBTeW5vcHN5cy9JbWFnaW5hdGlvbi4gRG9pbmcgdGhlIHBhcmVudAo+ID4+PiBkZXZp
Y2UgZGVzaWduIGlzbid0IGFzIGZsZXhpYmxlIGFzIFBNIGRvbWFpbnMgYmVjYXVzZSB5b3UgY2Fu
IG9ubHkgaGF2ZQo+ID4+PiBvbmUgcGFyZW50IGRldmljZSBhbmQgdGhlIGNoaWxkIGRldmljZSBz
dGF0ZSBjYW4gYmUgaWdub3JlZCB2cy4gbWFueSBQTQo+ID4+PiBkb21haW5zIGF0dGFjaGVkIGlu
IGEgZ3JhcGggdG8gYSBkZXZpY2UgdGhhdCBhcmUgbW9yZSBkaXJlY3RseQo+ID4+PiBpbmZsdWVu
Y2VkIGJ5IHRoZSBkZXZpY2UgdXNpbmcgcnVudGltZSBQTS4KPiA+Pj4KPiA+Pj4gTWF5YmUgeW91
J2xsIGJlIGhlYXJ0ZW5lZCB0byBrbm93IHRoaXMgcHJvYmxlbSBpc24ndCB1bmlxdWUgYW5kIGhh
cwo+ID4+PiBleGlzdGVkIGZvciBkZWNhZGVzIDopIEkgZG9uJ3Qga25vdyB3aGF0IHN0YXRlIHRo
ZSBncmFwaGljcyBkcml2ZXIgaXMgaW4KPiA+Pj4gYnV0IHRoZXknbGwgbGlrZWx5IGJlIGludGVy
ZXN0ZWQgaW4gc29sdmluZyB0aGlzIHByb2JsZW0gaW4gYSB3YXkgdGhhdAo+ID4+PiBkb2Vzbid0
ICJwb2xsdXRlIiB0aGVpciBkcml2ZXIgd2l0aCBTb0Mgc3BlY2lmaWMgZGV0YWlscy4gSXQncyBh
bGwgYQo+ID4+PiBxdWVzdGlvbiBvZiB3aGVyZSB5b3UgcHV0IHRoZSBjb2RlLiBUaGUgcmVzZXQg
ZnJhbWV3b3JrIHdhbnRzIHRvIGZvY3VzCj4gPj4+IG9uIHJlc2V0cywgdGhlIGNsayBmcmFtZXdv
cmsgd2FudHMgdG8gZm9jdXMgb24gY2xrcywgYW5kIHRoZSBncmFwaGljcwo+ID4+PiBkcml2ZXIg
d2FudHMgdG8gZm9jdXMgb24gZ3JhcGhpY3MuIEJUVywgd2Ugd2VudCB0aHJvdWdoIGEgc2ltaWxh
cgo+ID4+PiBkaXNjdXNzaW9uIHdpdGggcmVndWxhdG9ycyBhbmQgY2xrcyB5ZWFycyBhZ28gYW5k
IGVuZGVkIHVwIGhhbmRsaW5nIHRoYXQKPiA+Pj4gd2l0aCBPUFBzIGFuZCBwb3dlciBkb21haW5z
Lgo+ID4+Cj4gPj4gUmlnaHQsIHBvd2VyLWRvbWFpbiBwcm92aWRlcnMgYXJlIG1vc3RseSBpbXBs
ZW1lbnRpbmcgU29DIHNwZWNpZmljIGNvZGUuCj4gPj4KPiA+PiBJbiBzb21lIGNhc2VzLCBwb3dl
ci1kb21haW4gcHJvdmlkZXJzIGFsc28gaGFuZGxlIHBlciBkZXZpY2UgU29DCj4gPj4gc3BlY2lm
aWMgY29uc3RyYWludHMvc2VxdWVuY2VzLCB3aGljaCBzZWVtcyB3aGF0IHlvdSBhcmUgZGlzY3Vz
c2luZwo+ID4+IGhlcmUuIEZvciB0aGF0LCBnZW5wZCBoYXMgYSBjb3VwbGUgb2YgY2FsbGJhY2tz
IHRoYXQgY291bGQgYmUKPiA+PiBpbnRlcmVzdGluZyB0byBoYXZlIGEgbG9vayBhdCwgc3VjaCBh
czoKPiA+Pgo+ID4+IGdlbnBkLT5hdHRhY2h8ZGV0YWNoX2RldigpIC0gZm9yIHByb2JlL3JlbW92
ZQo+ID4+IGdlbnBkLmRldl9vcHMtPnN0YXJ0fHN0b3AoKSAtIGZvciBydW50aW1lL3N5c3RlbSBQ
TQo+ID4+Cj4gPj4gVGhhdCBzYWlkLCBtYXliZSBqdXN0IHVzaW5nIHRoZSByZWd1bGFyIGdlbnBk
LT5wb3dlcl9vbnxvZmYoKSBjYWxsYmFjawo+ID4+IGlzIHN1ZmZpY2llbnQgaGVyZSwgZGVwZW5k
aW5nIG9uIGhvdyB5b3UgZGVjaWRlIHRvIG1vZGVsIHRoaW5ncy4KPiA+Cj4gPgo+ID4gVGhhbmtz
IFN0ZXBoZW4sIFVsZiAhCj4gPgo+ID4gU28gdGhlIHdheSBmb3J3YXJkIEkgc2VlOgo+ID4KPiA+
IDEpIFRoZSByZXNldCBkcml2ZXIgY2FuIGJlIG1lcmdlZCBhcy1pcywgaWYgUGhpbGlwcCBpcyBm
aW5lIHdpdGggdGhpcwo+ID4gY29kZSBbMl0uCj4gPiAyKSBJIHdpbGwgY29vayB1cCB0aGUgdXBk
YXRlIHRvIHRoZSB0aGVhZCBwb3dlci1kb21haW4gZHJpdmVyIHdoaWNoIHdpbGwKPiA+IGhhbmRs
ZSByZXNldCBhbmQgY2xvY2sgbWFuYWdlbWVudC4KPgo+IEhpIFVsZiwKPiBJJ20gd29ya2luZyBv
biB0aGUgc2VyaWVzIHJpZ2h0IG5vdyBhbmQgSSB3YW50ZWQgdG8gYXNrIHlvdSBob3cgeW91Cj4g
cHJlZmVyIHZlcnNpb25pbmcgdG8gYmUgaGFuZGxlZC4gV291bGQgeW91IGxpa2UgbWUgdG8gc2Vu
ZCBhIHNlcmllcyBhcyBhCj4gdjEsIG9yIHRyZWF0IGlzIGFzIGEgY29udGludWF0aW9uIG9mIHRo
aXMgc2VyaWVzIFsxXSBhbmQgc2VuZCBhcyBhIHY5Lgo+IFdvdWxkIGxpa2UgdG8gYXZvaWQgYW55
IGNvbmZ1c2lvbi4KCkkgd291bGQgc3VnZ2VzdCBzdGFydGluZyBvdmVyIHdpdGggdjEsIGJ1dCBk
b24ndCBmb3JnZXQgdG8gcmVmZXIgdG8Kc29tZSBvZiB0aGUgcHJldmlvdXMgYXR0ZW1wdHMvZGlz
Y3Vzc2lvbiBpbiB0aGUgY292ZXItbGV0dGVyLiAgQXQKbGVhc3QgSSB3b3VsZCBiZSBmaW5lIGJ5
IHRoaXMuCgo+Cj4gVGhhbmtzLAo+IE1pY2hhxYIKPgo+IFsxXSAtIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MDMxMTE3MTkwMC4xNTQ5OTE2LTEtbS53aWxjenluc2tpQHNhbXN1bmcu
Y29tLwo+CgpbLi4uXQoKS2luZCByZWdhcmRzClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
