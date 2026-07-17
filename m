Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BDC4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtQnd38vxV5r5cqoSj8GCeMo0H3yR3owoPQhElWsQ2o=; b=Tk8OvywpVg/B2M
	Z71HSael8zuYTnxPMWiHIJmOa6qNhLJc+R/9chrRykDwHPz7j2Fu9Q9lzXjqiHJnrb8miD1+ODKB7
	2fZF3nrxvrBP7hSYQhrHFa83qZP5hg8+YEcG3E75XtNCweF4vvgj5LuBJmovw0iXu3IH4ADwXPbSB
	1FZAnPuL+ayLIQUSzjmpZC7+VakULDTpAgK4/Y+1NQyvZykAnyntDs6DKLKchrywbBoHol8P/XDuW
	yAQn2B/jmFhxU/sIakWHx9RUfU3K3YJ2ZhsKRDyvI9cUtBKXlRxvWGXtxUzHRO6HWRoxlp20ICYYH
	jn3KFrLGOrHBp7cc55Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmE4-00000002rF1-31iw;
	Fri, 17 Jul 2026 17:19:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmE0-00000002rEM-3oND
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 17:19:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8ee88fce572so57024396d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 10:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784308788; cv=none;
        d=google.com; s=arc-20260327;
        b=EaOUB+lrplmUxFmnzO0ctb1c39/jqPb4Uxzi8+Avf29oN60Kx/KxGzSQvg66tAnYUh
         4JYGC4669/Ve5TynFt+uAEs2B5JcyaERmKbMAWH54C4Gepf9qi1ztgL6OJEOjpp57BU9
         hCkYebKWFXjg5H22QfS/VMHoJWuxIm6KI7YKFhWC7dAoZs8MnH9jjox5RkqXwgaXpWt2
         RxwnO71yn3+fquP0G41i2EgSAm/bsM1yqjtAucszy8F/hjRebREa19LTUnyW2jHreJmi
         3S74Inb/T8iUoQjnhp/6smcsLGIKlfTljqksoLYIdpAXF6hFQIMNAVYbUUkXht8Teogb
         ffSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02jNwAFpmrc5ancxMMdpen26gEjJzUMhQEYgJ8QQX4c=;
        fh=fjzOYaom9WwvOJZZfG9IJ+bz/cskRaZvyn9HG4FHAT0=;
        b=RZ9QtTlAL5eDWzBcK8mMXo0GlqmxqzNAEW29ufQuLhgn9dXSvNVIURooH6gDk7KLRh
         y6pyPj1eVzP5jxBQ+T28kfI2khhkDyoMPt8xxuaqwz5ztpXZcUHeu43fAcaosuwftAjp
         5oSunLV8151oKp26E5/me2o01BXt1pVdd6NZEeeLtDM+0VC43erNFLk4D6yG0xaPeh3D
         QvV2QBvMt6k4x4U6PVjnN0UsVBDWRJTcFu85OPgmGhFoKpyfB2ttVrHUl1EeEVp2LgD6
         QNQIrHophSymVistc1BoHxfX0L62Z6OuT5aDh3hVnn0aQdqx8Y8Z3Pfas+fFPEveLmwg
         wHHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784308788; x=1784913588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02jNwAFpmrc5ancxMMdpen26gEjJzUMhQEYgJ8QQX4c=;
        b=eItWjAQkVeTeLa1lAPfiyqkkVmC1bSzxTvAC4eyf1aQd3yZfenxk4DYFtM7CnUB6Aq
         xLf4WkNuOpXpdlKbwpbQmtPderJxvIBYN0HVsGmhX/5ByA0bDHn29zmVgNmNQWr5OOz8
         bhCUMVg1Oy6IW/Y5PmgltwdUqJvhAfG9NUyXR9EjaeCqU/WgPCvIRGckC6ZCva71INYD
         4/ypytzyK8dyGilpDESo8xxVhq7pPlTIdPqkw2q4xH8VSmuR7iQZkqAxzcPrnO9gJtaj
         Zzbl4VyNl0w7rrMdtsiYew/sPpJOUfa119UDAKIpYVo6jkKZoOLbOu+L+CG0tuq97xU9
         H5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784308788; x=1784913588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02jNwAFpmrc5ancxMMdpen26gEjJzUMhQEYgJ8QQX4c=;
        b=VZIix8gP5tTpYH86VQCY8hsalTg/R9+283/9tM8kWUrMNyyrlY0igwx4g6DFcPwFzd
         0cLv1mTzvQGYS6kYarjo4Q6khUBcsHIc0W/9v9rFdFoA+1TtneeQ4MHdP6+vlzL+wcw8
         yV0Eg0WiEejQoflPxrR9QvsiMEwKp5Hv+/ARypBC/ZIRTBjrdhfi3P6osng0T+rCXi+e
         n0swQ75kgfuAxNgs4q2UBTB/7w1jkolk6U5KqK249JcTDvzsOrnXmeTsgMF/PUalqjga
         L1oVO6XnMe7mvTxUADy+qMBjRsm8tXe4lqaWZUVEFIYJB5fB1oSJ5n7g5qS5K0sftjys
         5Idg==
X-Forwarded-Encrypted: i=1; AHgh+RqoVaQ8s3bfdDIYkV/bK8y98E7fAbwZO7AyfqTb1mIbmpI6o+Y4UkGdDBSxqxKlgCdHb4wohqvfbFZRFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO/HtYe4WfCEVZO6p9GFgupqLUitn93GfSGLrLHdTcCSLHM0p2
	AhnFxW7ztyAnXZ6mxw+GpntIUsccZKi1HV0U1VXMhCaQ4ys9lhIRetITnjaxgP7t9y9pnHs+SuW
	mhg5gjiqiReIWAzBdv5ER+2B3Knixvbb2T+R7RRAtbQ==
X-Gm-Gg: AfdE7cnj1gwYHaJTJerX8t5liZPoYsfP0HR6msy4WYOXDPO4+8PepR7qxcp+JVA1JFp
	jaFjf8jySpioQTrroGvkKkiViZzNh4txB50BCQA1Qn7ptJbBLlAqXBakE//8x2DIOyUfjoPKNWi
	ChbOHFleKYQ5QIA48eiUrJAJcUv/QLLRZVwrb5PLtYiDeJhDJu+Pmr6rDCgibzYE6At908GKoTN
	a1AOEJm2Eu0Fch27wva3J/0LIpqlg829bKWBf/TQv9V+G2FjWmcX+ZUAzIAI81rJ9XaiRa4zooG
	WIPV3tmabTftAg03SU9ogd6C
X-Received: by 2002:a05:620a:2b95:b0:92f:196:20a3 with SMTP id
 af79cd13be357-930b41f8197mr365180085a.66.1784308787556; Fri, 17 Jul 2026
 10:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-2-luxu.kernel@bytedance.com> <alkD_YBF1HhbycqX@soda.int.kasm.eu>
 <CAPYmKFsA=fFKK5RtsCo1GQA0JqdxQ4h8O=GS+QXOBGPPcJrtuQ@mail.gmail.com>
 <CAPYmKFthTvFo4UJEd0GaNxM_S6j5kg5EK=b0gEr82Tr7ekHc_Q@mail.gmail.com> <alphELxiS4tIEymG@soda.int.kasm.eu>
In-Reply-To: <alphELxiS4tIEymG@soda.int.kasm.eu>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sat, 18 Jul 2026 01:19:35 +0800
X-Gm-Features: AUfX_myg-L39l6GlUwXOVLYk6M8taEnjtEURrAIcWUkhR8pG-Uaqkgrm7iKCki4
Message-ID: <CAPYmKFtFSQ7qSS3t_OCmkbPftSmWgt+7YvhyZ+HUJA+apXtPyw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: mm: Use ASID in update_mmu_cache()
To: Klara Modin <klarasmodin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_101949_336419_7DDD6085 
X-CRM114-Status: GOOD (  38.40  )
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

VGhhbmtzLCBLbGFyYS4gVGhhbmtzLCBQYXVsLgoKQmVzdCByZWdhcmRzLApYdSBMdQoKT24gU2F0
LCBKdWwgMTgsIDIwMjYgYXQgMToxNeKAr0FNIEtsYXJhIE1vZGluIDxrbGFyYXNtb2RpbkBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNi0wNy0xOCAwMDo1NzowNiArMDgwMCwgWHUgTHUgd3Jv
dGU6Cj4gPiBIaSBQYXVsLAo+ID4KPiA+IEEgZ2VudGxlIHBpbmcuCj4gPgo+ID4gSSBoYXZlIG5v
IGlkZWEgd2hhdCBJIGNhbiBkbyByZWdhcmRpbmcgbGludXgtbmV4dC4gQ291bGQgeW91IHBsZWFz
ZQo+ID4gaGVscCByZXZlcnQgdGhlIHBhdGNoIGZyb20gdmVyc2lvbiAxIGFuZCBjaGVycnktcGlj
ayBhbGwgdGhlIHBhdGNoZXMKPiA+IGZyb20gdmVyc2lvbiAyIGluc3RlYWQ/IE9yIHdoYXQgY2Fu
IEkgZG8gZm9yIHRoaXM/Cj4KPiBQYXVsIGhhcyB1cGRhdGVkIHRoZSBmb3ItbmV4dCBicmFuY2gg
YXQKPiBnaXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXgu
Z2l0IHNvIGl0IHNob3VsZAo+IHNvcnQgaXRzZWxmIG91dCB0byBlaXRoZXIgdG9kYXkncyBvciBt
b25kYXkncyBuZXh0IHZlcnNpb24gKGRlcGVuZGluZyBvbgo+IGlmIHRoZSB0cmVlIGhhcyBhbHJl
YWR5IGJlZW4gcHVsbGVkIG9yIG5vdCkuIEV2ZW4gaWYgaXQgaXMgbm90IHB1bGxlZAo+IHVudGls
IG1vbmRheSBJIHRoaW5rIGl0IHdpbGwgYmUgZmluZSwgdGhpcyBpcyB3aGF0IGxpbnV4LW5leHQg
aXMgZm9yCj4gYWZ0ZXIgYWxsLgo+Cj4gUmVnYXJkcywKPiBLbGFyYSBNb2Rpbgo+Cj4gPgo+ID4g
QmVzdCByZWdhcmRzLAo+ID4gWHUgTHUKPiA+Cj4gPiBPbiBGcmksIEp1bCAxNywgMjAyNiBhdCAx
MDoxMeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gSGkgUGF1bCwKPiA+ID4KPiA+ID4gS2xhcmEgZm91bmQgdGhhdCBsaW51eC1uZXh0IGNo
ZXJyeS1waWNrcyB0aGUgbmV3IHZlcnNpb24gb2YgcGF0Y2ggMgo+ID4gPiB3aGlsZSBwaWNraW5n
IHRoZSBvbGQgdmVyc2lvbiBvZiBwYXRjaCAxLCB3aGljaCBsZWFkcyB0byBhbgo+ID4gPiB1bmlu
aXRpYWxpemVkIGFzaWQuIENvdWxkIHlvdSBwbGVhc2UgaGVscCBjb3JyZWN0IHRoaXM/Cj4gPiA+
Cj4gPiA+IEJlc3QgcmVnYXJkcywKPiA+ID4gWHUgTHUKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwg
MTcsIDIwMjYgYXQgMTI6MjXigK9BTSBLbGFyYSBNb2RpbiA8a2xhcmFzbW9kaW5AZ21haWwuY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpLAo+ID4gPiA+Cj4gPiA+ID4gT24gMjAyNi0wNy0x
NSAyMToyMDowNyArMDgwMCwgWHUgTHUgd3JvdGU6Cj4gPiA+ID4gPiBPbmx5IGZsdXNoIFRMQiBl
bnRyaWVzIGZvciB0aGUgc3BlY2lmaWVkIG1tIGluIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoKS4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oICB8IDQgKysrLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaCB8IDUgKysrKysKPiA+ID4gPiA+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMg
ICAgICAgICAgfCA1IC0tLS0tCj4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiA+ID4gPiA+IGluZGV4IDVkNTc1NmJkYTgyZS4uOTkyNjU1NjA5OWFlIDEwMDY0
NAo+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4g
PiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ID4gPiBAQCAt
NTY4LDYgKzU2OCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlX3Jhbmdl
KHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ID4gPiA+ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ID4gPiA+ID4gICAgICAg
ICAgICAgICBwdGVfdCAqcHRlcCwgdW5zaWduZWQgaW50IG5yKQo+ID4gPiA+ID4gIHsKPiA+ID4g
PiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+
ID4gPiA+ID4gKwo+ID4gPiA+Cj4gPiA+ID4gSXQgc2VlbXMgdGhlIG9sZCB2ZXJzaW9uIG9mIHRo
aXMgcGF0Y2ggaXMgc3RpbGwgdXNlZCAoYXQgbGVhc3QgaW4KPiA+ID4gPiBuZXh0LTIwMjY1MDcx
NiwgMTVjZTFkN2M0ZGRmZTBkZmYwMGZjYWVlNGNjYWVlZjNlZmJjNjJjNiksIHdoaWNoIG1lYW5z
Cj4gPiA+ID4gYXNpZCBpcyBub3QgaW5pdGlhbGlzZWQgaGVyZS4gV2UgaW5zdGVhZCBoYXZlOgo+
ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gPiBpbmRleCA1ZDU3
NTZiZGE4MmUuLjc1NTQ5NWE1NDJjYyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gPiA+ID4gQEAgLTU2OCw2ICs1NjgsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
dXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRk
cmVzcywKPiA+ID4gPiAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBu
cikKPiA+ID4gPiAgewo+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkOwo+ID4gPiA+
ICsKPiA+ID4gPiAgICAgICAgIC8qCj4gPiA+ID4gICAgICAgICAgKiBTdnZwdGMgZ3VhcmFudGVl
cyB0aGF0IHRoZSBuZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRoaW4KPiA+ID4gPiAg
ICAgICAgICAqIGEgYm91bmRlZCB0aW1lZnJhbWUsIHNvIHdoZW4gdGhlIHVhcmNoIGRvZXMgbm90
IGNhY2hlIGludmFsaWQKPiA+ID4gPiBAQCAtNTgzLDEwICs1ODUsMTEgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gPiA+
ID4gICAgICAgICAgKiBSZWx5aW5nIG9uIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgd291
bGQgc3VmZmljZSwgYnV0Cj4gPiA+ID4gICAgICAgICAgKiB0aGUgZXh0cmEgdHJhcHMgcmVkdWNl
IHBlcmZvcm1hbmNlLiAgU28sIGVhZ2VybHkgU0ZFTkNFLlZNQS4KPiA+ID4gPiAgICAgICAgICAq
Lwo+ID4gPiA+ICsgICAgICAgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+ID4gPiA+
ICAgICAgICAgd2hpbGUgKG5yLS0pCj4gPiA+ID4gLSAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNo
X3RsYl9wYWdlKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7Cj4gPiA+ID4gLQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKGFkZHJlc3MgKyBuciAqIFBB
R0VfU0laRSwgYXNpZCk7Cj4gPiA+ID4gIH0KPiA+ID4gPiArCj4gPiA+ID4gICNkZWZpbmUgdXBk
YXRlX21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXApIFwKPiA+ID4gPiAgICAgICAgIHVwZGF0ZV9t
bXVfY2FjaGVfcmFuZ2UoTlVMTCwgdm1hLCBhZGRyLCBwdGVwLCAxKQo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBUaGlzIG1lYW5zIHRoYXQgcGF0Y2ggMiBvZiB0aGlzIHNlcmllcyB3aWxsIHVzZSB0
aGUgdW5pbml0aWFsaXNlZCBhc2lkCj4gPiA+ID4gZm9yIGxvY2FsX3N2aW52YWxfdm1hKCkgYW5k
IEkgZ2V0IHRoZSBzYW1lIGJlaGF2aW91ciBhcyBiZWZvcmUgKGhhbmcgb24KPiA+ID4gPiBpbml0
cmFtZnMpLiBJZiBJIHJldmVydCB0aGUgdHdvIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgd2hpY2gg
YXJlIGluIG5leHQKPiA+ID4gPiBhbmQgYXBwbHkgdGhpcyBhZ2FpbiBpdCdzIGZpbmUuCj4gPiA+
ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IEtsYXJhIE1vZGluCj4KPiAuLi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
