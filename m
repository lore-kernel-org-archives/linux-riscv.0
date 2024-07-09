Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1FAC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 21:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpJ9FJrnDGGufhrRJA2bFxmCsHIs0eYUSqcp6lVc2M8=; b=V893Q2GanuODTD
	wHq5v57/SdrH4z/N0UZxb+Dv36gwnZoAzOrbQyhxWvrMbsXZzp2Kh4MSDbF42K7uxqyjE1Ob7nDSm
	jg6YSOwHhI43rYm2WQWt8IE8lZGkAW59lusH7QVsOeQSZw3q2qUQNd+BXPJZTmjlFOtGicE0F2dhC
	rtMACkmstd+g+rcNRMMZNTS7mKweNtbkiJLIVqHBGGgojqC9ncr9BOEl3hALLJk5aVGqccPdNIZD6
	PBWnOQPXfO3REJq2UQmdmIxT0O77NtGsnP/ZUfaiJ0b+dgKNT96XqDmeQQJmQpW8o30T4f8mJexYA
	H3eN9Sc2nV+U7UXxpHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRIcs-00000008gzW-0PPe;
	Tue, 09 Jul 2024 21:43:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRIcp-00000008gyu-0Xna
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 21:43:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52ea952ce70so3753940e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 14:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1720561429; x=1721166229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9KDmmsWhRFdstXTLMKyGmo701itOW7xttxQmh/Uk4w=;
        b=c8QuGcO371nXC3++uw8lhpKA97IbG11vTjIawMm/rRb4Af0p41n1rHcvGdVnovq6Aj
         DY5AWzNSSzeqniyouaN6RUh/3kzr0bNQuWkcJHEZHEZtAj1w2WIN1i/qmtf0m+IHqoSj
         frx9ZrWlFjwk8mXDbDLmtc3Mkbge0gp+19Dgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720561429; x=1721166229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9KDmmsWhRFdstXTLMKyGmo701itOW7xttxQmh/Uk4w=;
        b=CUoVyigexJlTUOVOv+GsRPHhDDt/jCBvjACMHeRcZIHmOWtJnJ7zhqqbShx+PbEbyi
         joHzL9IvSKCRmaeFsUMkMMSNPn0/3ikqQzaHpUkCQESYhFHi1S09Epk39UnDhRhqw4CL
         z3jwIJKxqrlxDKbzK3s5vyawtSpK+1Zg+eg5GXuJwFYLKsHn9gb13bRQUyZSkxnvak9v
         AujN1X5rj5JfVS1v2YBkewwhGzpWMu7bCkZPvsAzEQNvF+f/qv0TTw6wK/P41KYNRmMk
         pP/riCM/qxyIlMpxHqw/EZCDgc4MdHW9R9Leu4UDCQoi8arpR3p512Ye4UKcL9MKwhBO
         VYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXv1fP18mv/VBaG4qDbdNWn7qjox7TS4z02hvCMbVGfKqFsnBqb75W5ja0papLGxsyNVW5W/dajnV/RGk0afRG3joI97J0lyUWkziwSbIy
X-Gm-Message-State: AOJu0Yxwu0ttvpaxPCy7imBc8/v3ut43HOpMaTnTE1VxVYD1725+mR2N
	wwtqAlghq7OklGreaV0m2oBZRdAC3yCkkcdIuLEvtRq2gqAaxS+V15ejFog93l6106wTVR44r5p
	uTk/UyCeLr5S3//Jqow5ZOXyFlIG0AWzX6Csd
X-Google-Smtp-Source: AGHT+IEdSu2Z8+Igotjd337CZpmBMypgM+FA2pSw0xGsQbhyzXqlnF45xvhplFvdJXGPyLzA6YQDGuV6Dtl3aFywxhQ=
X-Received: by 2002:a05:6512:a8d:b0:52e:74d5:4bf9 with SMTP id
 2adb3069b0e04-52eb99d15a4mr2148639e87.54.1720561428757; Tue, 09 Jul 2024
 14:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
 <20240708-wildcard-denim-12de7fae795b@spud> <Zo2dtuv0quQ7FwtK@ghost>
 <20240709-unengaged-handgrip-56a5c7b3e1d1@spud> <Zo2kSxsJkdkBdBEW@ghost> <20240709-fame-uptown-c936014cd66a@spud>
In-Reply-To: <20240709-fame-uptown-c936014cd66a@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 9 Jul 2024 14:43:37 -0700
Message-ID: <CAOnJCULo2gwLYCPdMppwhZekbuLh7FydjO7T1ZvJ0C8VG559YQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
To: Conor Dooley <conor@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, anup@brainfault.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_144351_299656_4978F6AE 
X-CRM114-Status: GOOD (  38.95  )
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

T24gVHVlLCBKdWwgOSwgMjAyNCBhdCAyOjA14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDA5LCAyMDI0IGF0IDAxOjU3OjQ3UE0gLTA3
MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDA5LCAyMDI0IGF0IDA5
OjQ0OjE3UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMDks
IDIwMjQgYXQgMDE6Mjk6NDJQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+
IE9uIE1vbiwgSnVsIDA4LCAyMDI0IGF0IDAxOjIyOjExUE0gKzAxMDAsIENvbm9yIERvb2xleSB3
cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgSnVsIDA4LCAyMDI0IGF0IDA4OjEyOjI0UE0gKzA4MDAs
IFhpYW8gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gVGhlIG1hY3JvIENPTkZJR19SSVNDVl9QTVUg
bXVzdCBoYXZlIGJlZW4gZGVmaW5lZCB3aGVuIHJpc2N2X3BtdS5jIGdldHMKPiA+ID4gPiA+ID4g
Y29tcGlsZWQsIHNvIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgcmVkdW5kYW50IGNoZWNrLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IERpZCB5b3UgaW52ZXN0aWdhdGUgd2h5IHRoaXMgZGVmaW5lIHdhcyBh
ZGRlZD8gV2h5IGRvIHlvdSB0aGluayB0aGF0IGl0Cj4gPiA+ID4gPiBpcyByZWR1bmRhbnQsIHJh
dGhlciB0aGFuIGNoZWNraW5nIHRoZSBpbmNvcnJlY3QgY29uZmlnIG9wdGlvbj8KPiA+ID4gPgo+
ID4gPiA+IFRoaXMgZmlsZSBpcyBvbmx5IGNvbXBpbGVkIHdpdGggQ09ORklHX1JJU0NWX1BNVToK
PiA+ID4KPiA+ID4gSSBtaWdodCBiZSBpbGwsIGJ1dCBJIGNhbiBzdGlsbCByZWFkLiBJIHdhcyBu
b3QgZGlzYWdyZWVpbmcgd2l0aCBYaWFvCj4gPiA+IHRoYXQgdGhlIGNvbmRpdGlvbiBpcyByZWR1
bmRhbnQgYXMgd3JpdHRlbiAtIEkgd2FudCB0byBrbm93IHdoZXRoZXIgdGhleQo+ID4gPiBtYWRl
IHN1cmUgdGhhdCB0aGlzIGNoZWNrIHdhcyBpbnRlbnRpb25hbGx5IHVzaW5nIENPTkZJR19SSVND
Vl9QTVUgaW4gdGhlCj4gPiA+IGZpcnN0IHBsYWNlLCBvciBpZiBhbm90aGVyIG9wdGlvbiBzaG91
bGQgaGF2ZSBiZWVuIGhlcmUgaW5zdGVhZC4KPiA+Cj4gPiBNYWtlcyBzZW5zZSEgTG9va2luZyB0
aHJvdWdoIHRoZSBsaXN0cyBJIHNlZSB0aGlzIFJGQyBmcm9tIEF0aXNoIHdoZXJlCj4gPiBoZSBp
bnRyb2R1Y2VkIGEgZGlmZmVyZW50IGNvbmZpZyBvcHRpb24gZm9yIHRoaXMKPiA+ICJDT05GSUdf
UklTQ1ZfUE1VX0NPTU1PTiJbMV0uIEkgd29uZGVyIGlmIHNvbWV0aGluZyBnb3QgY29uZnVzZWQg
aW4gdGhlCj4gPiBkZXZlbG9wbWVudCBvZiB0aGVzZSB0d28gcGF0Y2hlcy4KPgoKTm9wZS4gVGhh
dCdzIG5vdCByZWxhdGVkIGFzIHRoZSBhYm92ZSBzZXJpZXMgaXMgYSBjb21wbGV0ZSByZXZhbXAg
b2YKUE1VIGluZnJhc3RydWN0dXJlCmFuZCBmYXIgZnJvbSBiZWluZyBtZXJnZWQuCgo+IFBlcmhh
cHMuLiBXaGF0IEkgd2FzIHdvcnJpZWQgYWJvdXQgd2FzIHRoZSB3cm9uZyBvcHRpb24gYmVpbmcg
aGVyZQo+IChtYXliZSB0aGF0IGl0IHNob3VsZCBoYXZlIGJlZW4gUklTQ1ZfUE1VX1NCSSBvciBz
aW1pbGFyKSBhbmQgZGVwZW5kaW5nCj4gb24gaG93IHRoZSBrZXJuZWwgaXMgY29uZmlndXJlZCwg
dXNlcnNwYWNlIHdvdWxkIGdldCB0aGUgd3JvbmcgaW5mbwo+IGhlcmUuIEJ1dCBtYXliZSBpdCBp
cyBpbm5vY3VvdXMgeW91ciB0aGVvcnkgd291bGQgc3VnZ2VzdCwgYW5kIHRoZXJlJ3MKPiBub3Ro
aW5nIHRvIHdvcnJ5IGFib3V0LiBCdXQgdGhhdCdzIGZvciBzb21lb25lIHdpdGggYSBmdW5jdGlv
bmluZyBicmFpbgo+IHRvIGZpZ3VyZSBvdXQgOykKPgpUaGlzIG1hY3JvIGhhcyBiZWVuIHRoZXJl
IHNpbmNlIHYzIG9mIHRoZSBvcmlnaW5hbCBzZXJpZXMuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyMzA4MDIwODAzMjguMTIxMzkwNS04LWFsZXhnaGl0aUByaXZvc2luYy5jb20vCgpJ
ZGVhbGx5LCB0aGlzIHNob3VsZCBoYXZlIGJlZW4gUklTQ1ZfUE1VX1NCSSBhcyBjdHJfZ2V0X3dp
ZHRoIHdhcyBub3QKZGVmaW5lZCBlYXJsaWVyIGZvciBsZWdhY3kuCkhvd2V2ZXIsIHRoYXQgd2Fz
IGZpeGVkIGhlcmUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDIyNzE3MDAwMi4x
ODg2NzEtMy12YWRpbS5zaGFraXJvdkBzeW50YWNvcmUuY29tLwoKU28gd2UgY2FuIHJlbW92ZSB0
aGUgbWFjcm8gY2hlY2sgaGVyZS4KClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4KCj4gQ2hlZXJzLAo+IENvbm9yLgo+Cj4gPgo+ID4gTGluazoKPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAyMTcwMDU3MzguMzc0NDEyMS0xMi1hdGlzaHBA
cml2b3NpbmMuY29tLwo+ID4gWzFdCj4gPgo+ID4gPiA+ICMgZHJpdmVycy9wZXJmL01ha2VmaWxl
Cj4gPiA+ID4gb2JqLSQoQ09ORklHX1JJU0NWX1BNVSkgKz0gcmlzY3ZfcG11Lm8KPiA+ID4gPgo+
ID4gPiA+IFNvIGhhdmluZyB0aGlzIGNoZWNrIGRvZXMgc2VlbSByZWR1bmRhbnQuIEkgYW0gY29w
eWluZyBBbGV4IGFzIGl0IGxvb2tzCj4gPiA+ID4gbGlrZSBoZSB3cm90ZSB0aGlzLgo+ID4gPiA+
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW8gV2FuZyA8eGlhby53
LndhbmdAaW50ZWwuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvcGVy
Zi9yaXNjdl9wbXUuYyB8IDIgLS0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCj4gPiA+ID4gPiA+IGluZGV4
IDBhMDJlODVhODk1MS4uNzY0NDE0N2Q1MGI0IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdS5jCj4gPiA+ID4gPiA+IEBAIC0zOSw3ICszOSw2IEBAIHZvaWQgYXJjaF9wZXJmX3VwZGF0
ZV91c2VycGFnZShzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsCj4gPiA+ID4gPiA+ICAgICAgIHVz
ZXJwZy0+Y2FwX3VzZXJfdGltZV9zaG9ydCA9IDA7Cj4gPiA+ID4gPiA+ICAgICAgIHVzZXJwZy0+
Y2FwX3VzZXJfcmRwbWMgPSByaXNjdl9wZXJmX3VzZXJfYWNjZXNzKGV2ZW50KTsKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gLSNpZmRlZiBDT05GSUdfUklTQ1ZfUE1VCj4gPiA+ID4gPiA+ICAgICAg
IC8qCj4gPiA+ID4gPiA+ICAgICAgICAqIFRoZSBjb3VudGVycyBhcmUgNjQtYml0IGJ1dCB0aGUg
cHJpdiBzcGVjIGRvZXNuJ3QgbWFuZGF0ZSBhbGwgdGhlCj4gPiA+ID4gPiA+ICAgICAgICAqIGJp
dHMgdG8gYmUgaW1wbGVtZW50ZWQ6IHRoYXQncyB3aHksIGNvdW50ZXIgd2lkdGggY2FuIHZhcnkg
YmFzZWQgb24KPiA+ID4gPiA+ID4gQEAgLTQ3LDcgKzQ2LDYgQEAgdm9pZCBhcmNoX3BlcmZfdXBk
YXRlX3VzZXJwYWdlKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwKPiA+ID4gPiA+ID4gICAgICAg
ICovCj4gPiA+ID4gPiA+ICAgICAgIGlmICh1c2VycGctPmNhcF91c2VyX3JkcG1jKQo+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgIHVzZXJwZy0+cG1jX3dpZHRoID0gdG9fcmlzY3ZfcG11KGV2ZW50
LT5wbXUpLT5jdHJfZ2V0X3dpZHRoKGV2ZW50LT5ody5pZHgpICsgMTsKPiA+ID4gPiA+ID4gLSNl
bmRpZgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICBkbyB7Cj4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgcmQgPSBzY2hlZF9jbG9ja19yZWFkX2JlZ2luKCZzZXEpOwo+ID4gPiA+ID4gPiAt
LQo+ID4gPiA+ID4gPiAyLjI1LjEKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+
ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+ID4gPiA+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+ID4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4gPiA+Cj4gPgo+ID4KCgoKLS0gClJlZ2FyZHMs
CkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
