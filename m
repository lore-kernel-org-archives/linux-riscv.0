Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7694AE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgvHL3ZlUzElTQTpkg+RV+rYr3K+abDUJNKAhUY5J8g=; b=lUnPPw666UWfww
	+6uLc2xOQXPm8b2YoA3Ic+jZ4BPxACsJAIsiRn9Qlxw6lq28r3UJOfL8g5M5wqmlbpxIloDVA4mJy
	K2yFH5hhcuXNfEo14XEfWMIYZqjyLw6+/jRa5bj7ituL+9uXcIFe76Gr59nU+z1d4ZBfh185QLC5p
	LOPH6UiCp8BEowyFFvTPdL8W+J82p8/siES6RbhhWwQ4rCMZN87pQNZ/OazlWsxXhB425FxKFvCYF
	P0LBp3ZonanJKLxnAg77opFE5kBHLMyRbB1jVr4FIpTTC55TXYrs6XPgJkv2Q76vWkKK0iavFJ5rl
	eEPZydXIbIIp0COSHzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1Bn-000000005gy-05wZ;
	Wed, 18 Dec 2024 21:02:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1Bj-000000005gG-3RUA
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 21:02:37 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-728d1a2f180so99784b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734555754; x=1735160554; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VEvOuS9GjCc8R1kkciZzUfnJPop9QAlnrlUsyAlmMgg=;
        b=wod5xUZuPhtXisjvaJfu/LmKwHqKjj3rVoc0KzR5qpMrbhpe1966kIAgfWdmDfc/4R
         x+uNuP92/3nBPt4sgQLkVKd/zWp9AVnVcuKIVdpwHJl30qgt/hLCswCrqKFGZ3mfkT/I
         0Uo9nUojcYKI6Px8Xd1Gms1fHvLNFzNZ6euE8dyFr5OpLUcngWRNk31yrPHh3CNwNNaJ
         cCWN2XkFU8iHVymuITTEnUlUifVECT7rAgv1UTRYVfMQdOV8ari2qzMyFuBCuDAuxAvG
         8CYAe1SNE3XyXE37r+eBdBPvnplRxjK3pt2tIA/9/V6tUfOzjfkAQpMo+7bif6ZjVI+p
         ai7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555754; x=1735160554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEvOuS9GjCc8R1kkciZzUfnJPop9QAlnrlUsyAlmMgg=;
        b=C/wdjb0lqLBN/5rJR6322MXkSzj3xYgnapeQt23vz+g1H/AnGTzXBPd3lUpgtmJ1Q2
         F2ku01392TwUyeiWlBSCL06xDLgDzVHu1/9vLp0X/S0p/PeWBlS1Ewhxr1gnIfOAXVpV
         DP2jjkCra4/hvataW4sdEToY3Ya9+ruw32aOgf83HczUT6iJIC/dnjWI+g9UXBcpIIB+
         3zH9hMLiNyelYXSPsQbUa23Qv+xAhj4i7ZtM8N0KKFBcgOzYez4+hXAoRsM2pwpYAjC6
         aAEfDw7roKy841jtvAgODGsGQzKHOFrjysEHnV6hDReIK9gJbVjixDg0dzJtAcmJLyOP
         9bcA==
X-Forwarded-Encrypted: i=1; AJvYcCUVS9mWSwvn3HFKSrkTh2FyHVVQUDiRRmYOtmW3do2HuNpv/99dI5OHWK2D3lywOoEZEIXAsmuaZ+E6Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSiC+XyufbEdGQl6FaJMnlvn9AtAX4YvyZMf0ZSynbQ24dAQUm
	5sTpCEXLNkQLuomiOef+bQnb3hWFfjl07gvogsPIbmUSGeRUTapaJPiQQXwBj1Y=
X-Gm-Gg: ASbGncvtIt9Q+T1kaKEGj6nifxkVC2TZC7FxaW+hBOxLvwVG+GobrHet/fNbSwzK4i6
	Jogz9pGTagCofuZNLjAZUOfYMR5ERRXhxRDA/b7xAIb4Vb7TW0ugy2RUfNY2Zqxac1c6YdDe581
	XlSxBMgDe5e7PWhI7XsLuBuVryCO1MktRgBBxUEdpB+kYqctjcxBC1zwCJVAdSDxnZ64nD2k0gX
	Rl8owGINvbIVLVz/B+fX4xrHz+Q8zRMZX793BBauqOrZ2s=
X-Google-Smtp-Source: AGHT+IGGTepBnro/Yv+Td9aOesliGxiq1HfALi+NYhCuWSXz+YG9fqxb1BuJcfYw6mbiXYYJ+gAnug==
X-Received: by 2002:a05:6a00:7428:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-72aa9a10440mr1146368b3a.3.1734555753073;
        Wed, 18 Dec 2024 13:02:33 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b77290sm8969134b3a.113.2024.12.18.13.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:02:32 -0800 (PST)
Date: Wed, 18 Dec 2024 13:02:30 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z2M4ZparbNRvRHpz@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_130235_850760_31106415 
X-CRM114-Status: GOOD (  34.99  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTE6MjM6NTFBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAxMDo0MeKAr0FNIEFybmFsZG8gQ2FydmFsaG8g
ZGUgTWVsbwo+IDxhY21lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgRGVjIDE3
LCAyMDI0IGF0IDA0OjMwOjE1UE0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4g
T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MTg6MzJQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiA+ID4gPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBBZnRlciBiaW51dGls
cyBjb21taXQgZTQzZDg3NiB3aGljaCB3YXMgZmlyc3QgaW5jbHVkZWQgaW4gYmludXRpbHMgMi40
MSwKPiA+ID4gPiA+IHJpc2N2IG5vIGxvbmdlciBzdXBwb3J0cyBkdW1waW5nIGluIHRoZSBtaWRk
bGUgb2YgaW5zdHJ1Y3Rpb25zLiBJbmNyZWFzZQo+ID4gPiA+ID4gdGhlIG9iamR1bXAgd2luZG93
IGJ5IDItYnl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQgc2l0cwo+ID4g
PiA+ID4gb24gdGhlIGJvdW5kYXJ5IG9mIHRoZSBzcGVjaWZpZWQgc3RvcC1hZGRyZXNzIGlzIG5v
dCBjdXQgaW4gaGFsZi4KPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4KPiA+ID4gPiBSZXZpZXdlZC1ieTogSWFuIFJv
Z2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4KPiA+ID4gPiA+IEEgYmludXRpbHMgcGF0Y2gg
aGFzIGJlZW4gc2VudCBhcyB3ZWxsIHRvIGZpeCB0aGlzIGluIG9iamR1bXAgWzFdLgo+ID4KPiA+
ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIw
MjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gPgo+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoK
PiA+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBhdCBydW50aW1lIChJYW4p
Cj4gPiA+ID4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEy
MTYtcGVyZl9maXhfcmlzY3Zfb2JqX3JlYWRpbmctdjEtMC1iNzU5NjI2NjBhOWJAcml2b3NpbmMu
Y29tCj4gPgo+ID4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+
ID4gPiA+ID4gQEAgLTE4Myw5ICsyNDQsMzAgQEAgc3RhdGljIGludCByZWFkX3ZpYV9vYmpkdW1w
KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRkciwgdm9pZCAqYnVmLAo+ID4gPiA+ID4gICAg
ICAgICBjb25zdCBjaGFyICpmbXQ7Cj4gPiA+ID4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiA+ID4g
PiAgICAgICAgIGludCByZXQ7Cj4gPiA+ID4gPiArICAgICAgIHU2NCBzdG9wX2FkZHJlc3MgPSBh
ZGRyICsgbGVuOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChf
X3Jpc2N2KSkgewo+ID4KPiA+ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5
IGlzc3VlIGhlcmUuIEVsc2V3aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+ID4gdXNpbmcgaWZkZWYsIHN1
Y2ggYXM6Cj4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2luY2x1
ZGUvZHdhcmYtcmVncy5oP2g9cGVyZi10b29scy1uZXh0I242OQo+ID4KPiA+ID4gSSBkb24ndCBo
YXZlIGFueSBzdHJvbmcgZmVlbGluZ3MgYWJvdXQgdGhhdC4gSSBjYW4gY2hhbmdlIGl0IHRvIGJl
IGFuCj4gPiA+IGlmZGVmLiBPbiBvdGhlciBsaXN0cyBJIGhhdmUgYmVlbiB0b2xkIHRvIHVzZSBJ
U19FTkFCTEVEIHdoZW5ldmVyCj4gPiA+IHBvc3NpYmxlLCBidXQgaXQncyBvbmx5IGEgc21hbGwg
ZGlmZmVyZW5jZS4KPiA+Cj4gPiBDYW4ndCB3ZSBqdXN0IHVzZSB1bmFtZSBoZXJlPwo+ID4KPiA+
IFNvIHRoYXQgd2UgZG9uJ3QgdXNlIGtjb25maWcuaCBzaW5jZSBpdHMgbm90IHVzZWQgaW4gdG9v
bHMvcGVyZi8gYW5kCj4gPiBtYWtlcyBpdCBsb29rcyBsaWtlIHBlcmYgaXMgaW4gbG9ja3N0ZXAg
d2l0aCB0aGUga2VybmVsIHNvdXJjZSB0cmVlCj4gPiB2ZXJzaW9uIGl0IHdhcyBjb21waWxlZCBm
cm9tPwo+ID4KPiA+ICQgZ2l0IGdyZXAga2NvbmZpZy5oIHRvb2xzL3BlcmYvCj4gPiAkCj4gPgo+
ID4gQlRXLCB3aGF0IHdvdWxkIGhhcHBlbiBpZiBJIGNvbGxlY3RlZCBhIHBlcmYuZGF0YSBmaWxl
IG9uIHg4Nl82NCBhbmQKPiA+IHdvdWxkIHJlYWQgaXQgaW4gYSBSaXNjViBtYWNoaW5lIHdpdGgg
c3VjaCBhIG9iamR1bXAgdmVyc2lvbj8gVGhlIHNhbWUKPiA+IHByb2JsZW0/Cj4gCj4gVGhpcyBj
b2RlIGlzIGluIHRlc3RzIGhlbmNlIHRoaW5raW5nIHRoYXQgYSBzZXBhcmF0ZSBmaXggaXMgbmVl
ZGVkIGZvcgo+IHRoYXQgcHJvYmxlbS4gSG9wZWZ1bGx5IHRoZSB1c2Ugb2YgZWxmIG1hY2hpbmUv
ZmxhZ3MgdGFja2xlcyBpdDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwv
aW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xzLW5leHQjbjI1Cj4gV2UgYXJlIGdldHRp
bmcgc29tZXdoYXQgZGlzYXNzZW1ibGVyIGhlYXZ5LiBXZSBoYXZlIGxsdm0gYXMgYSBsaWJyYXJ5
LAo+IGNhcHN0b25lIGFzIGEgbGlicmFyeSwgYmludXRpbHMgb2JqZHVtcCBhbmQgbGx2bSBvYmpk
dW1wLiBHaXZlbiB0aGUKPiBwYWluIHdpdGggcGFyc2luZyB0ZXh0LCBjb3VsZCB3ZSBsb3NlIHRo
ZSBvYmpkdW1wcz8gU2ltaWxhcmx5IGZvcgo+IGFkZHIybGluZT8KCkFyZSB5b3Ugc3VnZ2VzdGlu
ZyB0byByZW1vdmUgdGhpcyB0ZXN0IGNhc2UgZW50aXJlbHkgdG8gZ2V0IHJpZCBvZiB0aGUKb2Jq
ZHVtcCBkZXBlbmRlbmN5PyBUaGUgZ29hbCBvZiB0aGlzIHRlc3QgY2FzZSBzZWVtcyB0byBiZSB0
byBjaGVjawpvYmpkdW1wIGFuZCBwZXJmIHJldHVybiB0aGUgc2FtZSBkYXRhLCBzbyBpdCBkb2Vz
bid0IHNlZW0gbGlrZSB0aGVyZQp3b3VsZCBiZSBhbiBhbHRlcm5hdGl2ZSB0byB1c2luZyBvYmpk
dW1wLgoKLSBDaGFybGllCgo+IAo+IFRoYW5rcywKPiBJYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
