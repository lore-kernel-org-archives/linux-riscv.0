Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B446E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZhA62L+GJoFRZ4Orl2oaw7UPufqaXFZni0uYBf/LRQ=; b=D9tzWfmC4B79tc
	rf578xFl3gqnk6ojdBAeGzKXYZK7qQ9xevSc10lYW75QUtakGQsVGHcddjmYG0V4wlYEN9x7NIoVL
	VbrOeWUYs604ORrfzDKaQgkpzySX3PvIIpyqXaNvJEHJHMER2blc1JAlBClJCjRfbqDMzcWHMQxdW
	6jANqNk8kzUxAtvm1XOtt6dX/5NzXIT1TPsop001NyHwP/32rko3Vocukdc/i2job6oxvtvgRABT8
	sMB/DXgqhnR67FcnAb6MfIQMj0uNkv5WwNWkkhzp3JkQwcySUNRvhlDmP1DwU1sUU9MQ8lqGWIgzh
	QZCsH9fk5NeWfbOHMTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2IQ-00000000DU8-3jlV;
	Wed, 18 Dec 2024 22:13:34 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2IO-00000000DSw-1NcG
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 22:13:33 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a7dfcd40fcso6175ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 14:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734560011; x=1735164811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNyF2ZCrhTzYkHOFwOv71exzNGm0f4UVt3o61cO/AHw=;
        b=gNSNo1V8ecezE4+0tAviiD83NBshTowPfCzEeDLOTCP6sq9zGdOE13MwcXhDJi6NU4
         M54IJlPI384iXvXVfA5/13khgZtE7qkCJqUpjrVhWKH1SK8lGPYOSYBe5lRfWLlsqWoa
         bd+wEP0zePqGuYQx+wdJDbvFivbmCdmw1qXGfHFHnS4xXkeqzVH6Xc9vwsNkrwiVfTFY
         vD4fF20OW1By8KsOXPF+iJ7uLheaxsUIYX5fPPY87G+x3496bKU8d5vLPgyRbL0iPnT6
         ZuiPs0ujoa5xnlS2ohxgrU7BRHTNIFJ4qnXIvzV2AtklpsSM3E+4sVLrFKlTvSX2lyfm
         9Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734560011; x=1735164811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNyF2ZCrhTzYkHOFwOv71exzNGm0f4UVt3o61cO/AHw=;
        b=XJHKjwtrsnw/cRavDFMMMFNxhHkVphKdBOV0TvSEyqp4r3yg2GVTUsAv1O8fpSwWWG
         7pK1T2PYCFYTJ89Dc1NSBhn0FAaNMsncM62S6+zVf2lSZHAuIDPP+qpJ8k1TUnZCuOAM
         vsVpLBVaG7xzJutVS1D4iCQda8bhGmfhOZ23WsgFspOV9AEGRpv0mFzizob2wT93fgSy
         Dbo9e6G0ImDJs3EZDXTZh2MJAlEb4rnnajy/ZkDmyEoW9XCoKv3513cL0AQ1UaME/VhB
         XfM8V6F0xyN29dLUY4JiGAN/rtee8PwO3hiDrquWPzebVQChzmqKMwOEnJFD4B+DtGvc
         OLUA==
X-Forwarded-Encrypted: i=1; AJvYcCUcAQ8vFsg2aberUwfW1J6ZN+dHh+IJaZSeFvIvg/FPdbUs5RjSwRbipZWAmcvdXuiXT4dsssGUVRU29w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf3QSUtXRGTpGI8l8Yf1bT8Fby/nGsr2s1Igj2TPD2PVtK9tPF
	CnDCBaY65bXpm5NF/AUbocwd8mbJWiknCkd/L6S4Ia8rGOl9QsST51SUzv/wv2BYc70yXROzZVQ
	HkswOQZLMe3MlJYD4IfW//VWLln+F3Z4Bsa6N
X-Gm-Gg: ASbGncv5lAjAdggyZOuZFYbc6I70MeMdO3reCm8YL9QheyQcMsXnGClhu1fNRkpeMtz
	RmjvWcOaJXvZFd4ozybXxSKsCYNddW/2eHa3+IXk=
X-Google-Smtp-Source: AGHT+IEKVIcmec9DHv//inZYLfmgrOtHowVFU41P4dXFAeGSnp+m/BFfIkFiBkYG6iOLBfI+3J+uSAydwMZjIlAvOUE=
X-Received: by 2002:a05:6e02:1f86:b0:3a0:9f85:d768 with SMTP id
 e9e14a558f8ab-3c0aca442ccmr155815ab.11.1734560011376; Wed, 18 Dec 2024
 14:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost> <Z2MXXFhUzoQmW4xV@x1> <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
In-Reply-To: <Z2M4ZparbNRvRHpz@ghost>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Dec 2024 14:13:20 -0800
Message-ID: <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_141332_394674_C8CAB85E 
X-CRM114-Status: GOOD (  39.28  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTowMuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTE6MjM6
NTFBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDE4LCAyMDI0IGF0
IDEwOjQx4oCvQU0gQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvCj4gPiA8YWNtZUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MzA6MTVQTSAt
MDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0
IGF0IDA0OjE4OjMyUE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUs
IERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IEFmdGVyIGJpbnV0aWxzIGNvbW1pdCBlNDNkODc2
IHdoaWNoIHdhcyBmaXJzdCBpbmNsdWRlZCBpbiBiaW51dGlscyAyLjQxLAo+ID4gPiA+ID4gPiBy
aXNjdiBubyBsb25nZXIgc3VwcG9ydHMgZHVtcGluZyBpbiB0aGUgbWlkZGxlIG9mIGluc3RydWN0
aW9ucy4gSW5jcmVhc2UKPiA+ID4gPiA+ID4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMg
dG8gZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQgc2l0cwo+ID4gPiA+ID4gPiBvbiB0
aGUgYm91bmRhcnkgb2YgdGhlIHNwZWNpZmllZCBzdG9wLWFkZHJlc3MgaXMgbm90IGN1dCBpbiBo
YWxmLgo+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPgo+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IElhbiBSb2dl
cnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+ID4KPiA+ID4gPiA+ID4gQSBiaW51dGlscyBwYXRj
aCBoYXMgYmVlbiBzZW50IGFzIHdlbGwgdG8gZml4IHRoaXMgaW4gb2JqZHVtcCBbMV0uCj4gPiA+
Cj4gPiA+ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0
aWxzLzIwMjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gPiA+Cj4gPiA+ID4gPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiA+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBhdCBy
dW50aW1lIChJYW4pCj4gPiA+ID4gPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI0MTIxNi1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVhZGluZy12MS0wLWI3NTk2MjY2
MGE5YkByaXZvc2luYy5jb20KPiA+ID4KPiA+ID4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0
cy9jb2RlLXJlYWRpbmcuYwo+ID4gPiA+ID4gPiBAQCAtMTgzLDkgKzI0NCwzMCBAQCBzdGF0aWMg
aW50IHJlYWRfdmlhX29iamR1bXAoY29uc3QgY2hhciAqZmlsZW5hbWUsIHU2NCBhZGRyLCB2b2lk
ICpidWYsCj4gPiA+ID4gPiA+ICAgICAgICAgY29uc3QgY2hhciAqZm10Owo+ID4gPiA+ID4gPiAg
ICAgICAgIEZJTEUgKmY7Cj4gPiA+ID4gPiA+ICAgICAgICAgaW50IHJldDsKPiA+ID4gPiA+ID4g
KyAgICAgICB1NjQgc3RvcF9hZGRyZXNzID0gYWRkciArIGxlbjsKPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiArICAgICAgIGlmIChJU19FTkFCTEVEKF9fcmlzY3YpKSB7Cj4gPiA+Cj4gPiA+ID4g
PiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5IGlzc3VlIGhlcmUuIEVsc2V3aGVy
ZSB3ZSdyZSBqdXN0Cj4gPiA+ID4gPiB1c2luZyBpZmRlZiwgc3VjaCBhczoKPiA+ID4gPiA+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10
b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaD9o
PXBlcmYtdG9vbHMtbmV4dCNuNjkKPiA+ID4KPiA+ID4gPiBJIGRvbid0IGhhdmUgYW55IHN0cm9u
ZyBmZWVsaW5ncyBhYm91dCB0aGF0LiBJIGNhbiBjaGFuZ2UgaXQgdG8gYmUgYW4KPiA+ID4gPiBp
ZmRlZi4gT24gb3RoZXIgbGlzdHMgSSBoYXZlIGJlZW4gdG9sZCB0byB1c2UgSVNfRU5BQkxFRCB3
aGVuZXZlcgo+ID4gPiA+IHBvc3NpYmxlLCBidXQgaXQncyBvbmx5IGEgc21hbGwgZGlmZmVyZW5j
ZS4KPiA+ID4KPiA+ID4gQ2FuJ3Qgd2UganVzdCB1c2UgdW5hbWUgaGVyZT8KPiA+ID4KPiA+ID4g
U28gdGhhdCB3ZSBkb24ndCB1c2Uga2NvbmZpZy5oIHNpbmNlIGl0cyBub3QgdXNlZCBpbiB0b29s
cy9wZXJmLyBhbmQKPiA+ID4gbWFrZXMgaXQgbG9va3MgbGlrZSBwZXJmIGlzIGluIGxvY2tzdGVw
IHdpdGggdGhlIGtlcm5lbCBzb3VyY2UgdHJlZQo+ID4gPiB2ZXJzaW9uIGl0IHdhcyBjb21waWxl
ZCBmcm9tPwo+ID4gPgo+ID4gPiAkIGdpdCBncmVwIGtjb25maWcuaCB0b29scy9wZXJmLwo+ID4g
PiAkCj4gPiA+Cj4gPiA+IEJUVywgd2hhdCB3b3VsZCBoYXBwZW4gaWYgSSBjb2xsZWN0ZWQgYSBw
ZXJmLmRhdGEgZmlsZSBvbiB4ODZfNjQgYW5kCj4gPiA+IHdvdWxkIHJlYWQgaXQgaW4gYSBSaXNj
ViBtYWNoaW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lvbj8gVGhlIHNhbWUKPiA+ID4gcHJv
YmxlbT8KPiA+Cj4gPiBUaGlzIGNvZGUgaXMgaW4gdGVzdHMgaGVuY2UgdGhpbmtpbmcgdGhhdCBh
IHNlcGFyYXRlIGZpeCBpcyBuZWVkZWQgZm9yCj4gPiB0aGF0IHByb2JsZW0uIEhvcGVmdWxseSB0
aGUgdXNlIG9mIGVsZiBtYWNoaW5lL2ZsYWdzIHRhY2tsZXMgaXQ6Cj4gPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5n
aXQvdHJlZS90b29scy9wZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xz
LW5leHQjbjI1Cj4gPiBXZSBhcmUgZ2V0dGluZyBzb21ld2hhdCBkaXNhc3NlbWJsZXIgaGVhdnku
IFdlIGhhdmUgbGx2bSBhcyBhIGxpYnJhcnksCj4gPiBjYXBzdG9uZSBhcyBhIGxpYnJhcnksIGJp
bnV0aWxzIG9iamR1bXAgYW5kIGxsdm0gb2JqZHVtcC4gR2l2ZW4gdGhlCj4gPiBwYWluIHdpdGgg
cGFyc2luZyB0ZXh0LCBjb3VsZCB3ZSBsb3NlIHRoZSBvYmpkdW1wcz8gU2ltaWxhcmx5IGZvcgo+
ID4gYWRkcjJsaW5lPwo+Cj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRvIHJlbW92ZSB0aGlzIHRlc3Qg
Y2FzZSBlbnRpcmVseSB0byBnZXQgcmlkIG9mIHRoZQo+IG9iamR1bXAgZGVwZW5kZW5jeT8gVGhl
IGdvYWwgb2YgdGhpcyB0ZXN0IGNhc2Ugc2VlbXMgdG8gYmUgdG8gY2hlY2sKPiBvYmpkdW1wIGFu
ZCBwZXJmIHJldHVybiB0aGUgc2FtZSBkYXRhLCBzbyBpdCBkb2Vzbid0IHNlZW0gbGlrZSB0aGVy
ZQo+IHdvdWxkIGJlIGFuIGFsdGVybmF0aXZlIHRvIHVzaW5nIG9iamR1bXAuCgpJIGNhbiBpbWFn
aW5lIGhhdmluZyBhbiBvYmpkdW1wIGRlcGVuZGVuY3kgZm9yIGEgdGVzdCBidXQgbm90IGZvciBz
b21lCm1vcmUgY29yZSBsaWtlIGBwZXJmIGFubm90YXRlYC4gV2UgaGF2ZSB0byBkbyB3ZWlyZCB0
aGluZ3Mgd2hlbgpwYXJzaW5nIHRleHQsIGxpa2UgdGhpcyBjb2RlIEknbSBub3QgcHJvdWQgb2Y6
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVy
Zi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9zcmNsaW5lLmM/aD1wZXJmLXRv
b2xzLW5leHQjbjUyMwpUaGUgaXNzdWUgd2l0aCB0aGF0IGNvZGUgaXMgdGhhdCBMTFZNIG9iamR1
bXAgaGFzIGNoYW5nZWQgaXRzIG91dHB1dAppbiBuZXdlciB2ZXJzaW9ucyB0byBiZSBjbG9zZXIg
dG8gYmludXRpbHMgb2JqZHVtcC4gRGlkIHRoYXQgYnJlYWsKcGVyZj8gTWF5YmUgaXQganVzdCBi
cm9rZSB3aGF0IG91ciB2YXJpYWJsZXMgdGhpbmsgaXMgYW4gTExWTSBvYmpkdW1wLApidXQgdGhp
bmdzIGFyZW4ndCByZWFsbHkgYnJva2VuLiBUaGlzIGtpbmQgb2YgaXNzdWUgZG9lc24ndCBvY2N1
ciB3aXRoCmEgbGlicmFyeSwgYWx0aG91Z2ggdGhlIGRpZmZlcmluZyBuZWVkcyBvZiBsaWJyYXJ5
IHZlcnNpb25zIGlzIGEgcmVhbAp0aGluZy4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
