Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9D8E7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQfl941Ogzm/8SZXO4B60IGvT2g0OKYcNuhk6qeD4s4=; b=CAbKxfT5xHhbd4
	DbwuwyVT0cl35b8bBnGGlWR2E2+vPamIFE/HIPDmO4I3g9QVQWCsI87tGsVwO1j/XdITV8iTZ9wcH
	K4aiFzC2avtkfavdgx6JW7/TWzZPU1HRBJuttMEifvcDxpoFZXTf3WqcVFolPHWnyDsNh9cQYqa8T
	SHAWWpcy9shPEED9QVL1E1kAmqjyZuJhgeu510Miy/sQkoOPi22VNujCsqfxQg69qrwDoi4/Shzo3
	LqilGTwix0U5I2a7xPns2nuuEJTxWNIQgqgLamcde0dV0w8xRmJCPf/1NG+i6OuBFcGuLEf3GBdLt
	IJoZLmIZb0+uwIIAYp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5DM-00000000U39-0xQ1;
	Thu, 19 Dec 2024 01:20:32 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5DJ-00000000U1U-30or
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 01:20:31 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so51275ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571228; x=1735176028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RHVxPSc6oea9aIgGh4D/2dAt3qJRUgcCKfo5Ib7QPU=;
        b=q5bFDZPe+FDKLU/UChODy0ubz3/sV7Jycz4PvzBsJ/lWhczz5pLLmU9rJIKq0rBPVE
         OKwc9866ImAFbupt/2ZieGvPcR+X1mQXOaI5BF2L0+laFNbMzdogfsxWfsOTL+K5JuoK
         i//TZTA0BWQO0e7xdWefU/b+E78KafgO0RALtEyDgYFCo79HX5O+4TlcjBQpfjx70CxG
         FGUmQzpLXVstXzBkOyqNGZOhCXuXlBG6ZTjk2ZhOSubArK3TzWWq6BFI9/tL7CrdMy+V
         EmcdB/8yejhsJUgXiCtLHs+Qspq5EbLjGc0nq/o6kJ8JfW1b0MYPHnP5gYBI9RdRXOds
         LKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571228; x=1735176028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RHVxPSc6oea9aIgGh4D/2dAt3qJRUgcCKfo5Ib7QPU=;
        b=vkqYA+zhHG6+KfXR4cDspRaKeTGABGQxiibIFbDCzsYmgf7X7z+rN0/JgOtcoIGDXd
         eam4USfPHoFTR8gpIxvYA7Z8SnMjFHGDoZ7WNN8LIJVYiEIsSTe+B28mx/N6Pq3AQz4c
         JA8pAzSGolYeHRwB50wy+YwsnEFjkPoJ9N2uPVCKIvUrBG+idJt83IjYgStGMiUhTcac
         mfpklQdpeTgR0nlL1W9/FSziJ4cN7/x2iMo6ya1ZI4XgCoyQrW1KvTuzZfs4mQTuHP2F
         ZbNNh3tlu5XbMh4T2Q45es8npS5ApGZUfCWejPIAwp+ged5ikBkDnYXpt/6lxz03UggH
         UJQw==
X-Forwarded-Encrypted: i=1; AJvYcCVkGj7gx/Ak2H3f9V6obB0EF5RPD5vGiYr9087HY5vDQdHsdDbOHj5ZyxKPkaGvb/DjkWi6lczTGCHi5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhNh2SEOYopKSO8eQ47DwTwn+yZaAehWsLD3wq2Qwd9OrvHAkb
	PXjyal9t8ySF5j7mUjWCuQH8bxxcu92F4aIXCrQ+Qv2PDquFsTEsRGqLey65AOUuD7Fh6fR3hQx
	dLO0EtaRFP7yYcrQHs/TDhK16rnxPnBlf8Tcl
X-Gm-Gg: ASbGncvsi7IIfzYCjFH9PJDQvHo3UxXYL17N/CJDNtVqcvTNNu3w3+eY6HXFcAEMOhC
	PT/Kr5ak5cWktfj2kCmrXWDG4d/snYu2sdgtEWrQ=
X-Google-Smtp-Source: AGHT+IFT4VomyTbaDm+Tt9oLhBLkCP6zjLLV9ggnhwJAIaPZFjvjp4bRFXXsaIbxAGg8/I8njI04ZXZzDs+aEIwkU1Y=
X-Received: by 2002:a92:c54e:0:b0:3a7:a5d2:c641 with SMTP id
 e9e14a558f8ab-3c05833f719mr1448515ab.14.1734571226270; Wed, 18 Dec 2024
 17:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost> <Z2MXXFhUzoQmW4xV@x1> <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost> <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
 <Z2NNcy1jCLqb62h2@ghost>
In-Reply-To: <Z2NNcy1jCLqb62h2@ghost>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Dec 2024 17:20:15 -0800
Message-ID: <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241218_172029_764222_F8F33F4C 
X-CRM114-Status: GOOD (  54.84  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMjozMuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDI6MTM6
MjBQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDE4LCAyMDI0IGF0
IDE6MDLigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTE6MjM6NTFBTSAtMDgwMCwgSWFu
IFJvZ2VycyB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAxMDo0MeKAr0FN
IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbwo+ID4gPiA+IDxhY21lQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0IDA0OjMwOjE1UE0g
LTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiA+ID4gT24gVHVlLCBEZWMgMTcs
IDIwMjQgYXQgMDQ6MTg6MzJQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4gPiA+ID4g
PiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFy
bGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBBZnRlciBiaW51dGlscyBj
b21taXQgZTQzZDg3NiB3aGljaCB3YXMgZmlyc3QgaW5jbHVkZWQgaW4gYmludXRpbHMgMi40MSwK
PiA+ID4gPiA+ID4gPiA+IHJpc2N2IG5vIGxvbmdlciBzdXBwb3J0cyBkdW1waW5nIGluIHRoZSBt
aWRkbGUgb2YgaW5zdHJ1Y3Rpb25zLiBJbmNyZWFzZQo+ID4gPiA+ID4gPiA+ID4gdGhlIG9iamR1
bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQg
c2l0cwo+ID4gPiA+ID4gPiA+ID4gb24gdGhlIGJvdW5kYXJ5IG9mIHRoZSBzcGVjaWZpZWQgc3Rv
cC1hZGRyZXNzIGlzIG5vdCBjdXQgaW4gaGFsZi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29n
bGUuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEEgYmludXRpbHMgcGF0Y2ggaGFzIGJl
ZW4gc2VudCBhcyB3ZWxsIHRvIGZpeCB0aGlzIGluIG9iamR1bXAgWzFdLgo+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0
aWxzLzIwMjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRl
dGVjdGlvbiBhdCBydW50aW1lIChJYW4pCj4gPiA+ID4gPiA+ID4gPiAtIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMTYtcGVyZl9maXhfcmlzY3Zfb2JqX3JlYWRp
bmctdjEtMC1iNzU5NjI2NjBhOWJAcml2b3NpbmMuY29tCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+ID4gPiA+ID4gPiA+ID4g
QEAgLTE4Myw5ICsyNDQsMzAgQEAgc3RhdGljIGludCByZWFkX3ZpYV9vYmpkdW1wKGNvbnN0IGNo
YXIgKmZpbGVuYW1lLCB1NjQgYWRkciwgdm9pZCAqYnVmLAo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICBjb25zdCBjaGFyICpmbXQ7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiA+
ID4gPiA+ID4gPiAgICAgICAgIGludCByZXQ7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHU2NCBz
dG9wX2FkZHJlc3MgPSBhZGRyICsgbGVuOwo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChfX3Jpc2N2KSkgewo+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5IGlzc3VlIGhlcmUuIEVsc2V3
aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+ID4gPiA+ID4gdXNpbmcgaWZkZWYsIHN1Y2ggYXM6Cj4gPiA+
ID4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
cGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdh
cmYtcmVncy5oP2g9cGVyZi10b29scy1uZXh0I242OQo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBk
b24ndCBoYXZlIGFueSBzdHJvbmcgZmVlbGluZ3MgYWJvdXQgdGhhdC4gSSBjYW4gY2hhbmdlIGl0
IHRvIGJlIGFuCj4gPiA+ID4gPiA+IGlmZGVmLiBPbiBvdGhlciBsaXN0cyBJIGhhdmUgYmVlbiB0
b2xkIHRvIHVzZSBJU19FTkFCTEVEIHdoZW5ldmVyCj4gPiA+ID4gPiA+IHBvc3NpYmxlLCBidXQg
aXQncyBvbmx5IGEgc21hbGwgZGlmZmVyZW5jZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDYW4ndCB3
ZSBqdXN0IHVzZSB1bmFtZSBoZXJlPwo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIHRoYXQgd2UgZG9u
J3QgdXNlIGtjb25maWcuaCBzaW5jZSBpdHMgbm90IHVzZWQgaW4gdG9vbHMvcGVyZi8gYW5kCj4g
PiA+ID4gPiBtYWtlcyBpdCBsb29rcyBsaWtlIHBlcmYgaXMgaW4gbG9ja3N0ZXAgd2l0aCB0aGUg
a2VybmVsIHNvdXJjZSB0cmVlCj4gPiA+ID4gPiB2ZXJzaW9uIGl0IHdhcyBjb21waWxlZCBmcm9t
Pwo+ID4gPiA+ID4KPiA+ID4gPiA+ICQgZ2l0IGdyZXAga2NvbmZpZy5oIHRvb2xzL3BlcmYvCj4g
PiA+ID4gPiAkCj4gPiA+ID4gPgo+ID4gPiA+ID4gQlRXLCB3aGF0IHdvdWxkIGhhcHBlbiBpZiBJ
IGNvbGxlY3RlZCBhIHBlcmYuZGF0YSBmaWxlIG9uIHg4Nl82NCBhbmQKPiA+ID4gPiA+IHdvdWxk
IHJlYWQgaXQgaW4gYSBSaXNjViBtYWNoaW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lvbj8g
VGhlIHNhbWUKPiA+ID4gPiA+IHByb2JsZW0/Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGNvZGUgaXMg
aW4gdGVzdHMgaGVuY2UgdGhpbmtpbmcgdGhhdCBhIHNlcGFyYXRlIGZpeCBpcyBuZWVkZWQgZm9y
Cj4gPiA+ID4gdGhhdCBwcm9ibGVtLiBIb3BlZnVsbHkgdGhlIHVzZSBvZiBlbGYgbWFjaGluZS9m
bGFncyB0YWNrbGVzIGl0Ogo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYv
dXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaD9oPXBlcmYtdG9vbHMtbmV4dCNuMjUKPiA+ID4gPiBX
ZSBhcmUgZ2V0dGluZyBzb21ld2hhdCBkaXNhc3NlbWJsZXIgaGVhdnkuIFdlIGhhdmUgbGx2bSBh
cyBhIGxpYnJhcnksCj4gPiA+ID4gY2Fwc3RvbmUgYXMgYSBsaWJyYXJ5LCBiaW51dGlscyBvYmpk
dW1wIGFuZCBsbHZtIG9iamR1bXAuIEdpdmVuIHRoZQo+ID4gPiA+IHBhaW4gd2l0aCBwYXJzaW5n
IHRleHQsIGNvdWxkIHdlIGxvc2UgdGhlIG9iamR1bXBzPyBTaW1pbGFybHkgZm9yCj4gPiA+ID4g
YWRkcjJsaW5lPwo+ID4gPgo+ID4gPiBBcmUgeW91IHN1Z2dlc3RpbmcgdG8gcmVtb3ZlIHRoaXMg
dGVzdCBjYXNlIGVudGlyZWx5IHRvIGdldCByaWQgb2YgdGhlCj4gPiA+IG9iamR1bXAgZGVwZW5k
ZW5jeT8gVGhlIGdvYWwgb2YgdGhpcyB0ZXN0IGNhc2Ugc2VlbXMgdG8gYmUgdG8gY2hlY2sKPiA+
ID4gb2JqZHVtcCBhbmQgcGVyZiByZXR1cm4gdGhlIHNhbWUgZGF0YSwgc28gaXQgZG9lc24ndCBz
ZWVtIGxpa2UgdGhlcmUKPiA+ID4gd291bGQgYmUgYW4gYWx0ZXJuYXRpdmUgdG8gdXNpbmcgb2Jq
ZHVtcC4KPiA+Cj4gPiBJIGNhbiBpbWFnaW5lIGhhdmluZyBhbiBvYmpkdW1wIGRlcGVuZGVuY3kg
Zm9yIGEgdGVzdCBidXQgbm90IGZvciBzb21lCj4gPiBtb3JlIGNvcmUgbGlrZSBgcGVyZiBhbm5v
dGF0ZWAuIFdlIGhhdmUgdG8gZG8gd2VpcmQgdGhpbmdzIHdoZW4KPiA+IHBhcnNpbmcgdGV4dCwg
bGlrZSB0aGlzIGNvZGUgSSdtIG5vdCBwcm91ZCBvZjoKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVl
L3Rvb2xzL3BlcmYvdXRpbC9zcmNsaW5lLmM/aD1wZXJmLXRvb2xzLW5leHQjbjUyMwo+ID4gVGhl
IGlzc3VlIHdpdGggdGhhdCBjb2RlIGlzIHRoYXQgTExWTSBvYmpkdW1wIGhhcyBjaGFuZ2VkIGl0
cyBvdXRwdXQKPiA+IGluIG5ld2VyIHZlcnNpb25zIHRvIGJlIGNsb3NlciB0byBiaW51dGlscyBv
YmpkdW1wLiBEaWQgdGhhdCBicmVhawo+ID4gcGVyZj8gTWF5YmUgaXQganVzdCBicm9rZSB3aGF0
IG91ciB2YXJpYWJsZXMgdGhpbmsgaXMgYW4gTExWTSBvYmpkdW1wLAo+ID4gYnV0IHRoaW5ncyBh
cmVuJ3QgcmVhbGx5IGJyb2tlbi4gVGhpcyBraW5kIG9mIGlzc3VlIGRvZXNuJ3Qgb2NjdXIgd2l0
aAo+ID4gYSBsaWJyYXJ5LCBhbHRob3VnaCB0aGUgZGlmZmVyaW5nIG5lZWRzIG9mIGxpYnJhcnkg
dmVyc2lvbnMgaXMgYSByZWFsCj4gPiB0aGluZy4KPgo+IFllYWggZG9pbmcgdGhlIHBhcnNpbmcg
b2YgdGhlIHRleHQgb3V0cHV0IGlzIG5vdCBpZGVhbC4uLiBGb3IgdGhpcyB0ZXN0Cj4gY2FzZSBp
dCBzaG91bGQgYmUgcG9zc2libGUgdG8gZHluYW1pY2FsbHkgbGluayBhZ2FpbnN0IGxpYmJmZC4K
CkkgbmVlZCB0byB3cml0ZSB0aGUgcGF0Y2ggc2V0IHRvIGRlbGV0ZSBsaWJiZmQgZnJvbSBwZXJm
LiBJQU5BTCBidXQKdGhlIGlzc3VlIGlzIHRoYXQgbGliYmZkIGlzIHBhcnQgb2YgYmludXRpbHMg
YW5kIEdQTHYzLCB3aGlsZSBwZXJmIGlzCnBhcnQgb2YgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGFy
Z2VseSBHUEx2Mi4gR1BMdjMgaXMgaW5jb21wYXRpYmxlIHdpdGgKR1BMdjI6Cmh0dHBzOi8vd3d3
LmdudS5vcmcvbGljZW5zZXMvZ3BsLWZhcS5odG1sI0FsbENvbXBhdGliaWxpdHkKV2hpbGUgdXNp
bmcgZGxvcGVuIG1lYW5zIHdlJ3JlIG5vdCBsaW5raW5nIGFnYWluc3QgbGliYmZkLCB3ZSBtYXkK
ZWZmZWN0aXZlbHkgYmUgdXNpbmcgaXQgYXMgYSBwbHVnaW4gd2hpY2ggYWdhaW4gR1BMdjMgKGlu
IG15IElBTkFMCm9waW5pb24pIHdvdWxkbid0IGFsbG93OgpodHRwczovL3d3dy5nbnUub3JnL2xp
Y2Vuc2VzL2dwbC1mYXEuZW4uaHRtbCNHUExQbHVnaW5zCkN1cnJlbnRseSB0byBnZXQgbGliYmZk
IHN1cHBvcnQgaW4gcGVyZiB5b3UgbmVlZCB0byBiZSBidWlsZGluZyB0aGUKYmluYXJ5IHlvdXJz
ZWxmIGFuZCBhZGQgdG8gdGhlIGJ1aWxkIEJVSUxEX05PTkRJU1RSTz0xLiBXZSBkbyB0aGlzIGFz
CnBhcnQgb2Ygb3VyIGJ1aWxkIHRlc3RpbmcgYnV0IGhhdmluZyBhbGwgdGhlICNpZmRlZi1lZCBs
aWJiZmQgY29kZSBpZgpub3RoaW5nIGVsc2UgbWFrZXMgdGhlIGNvZGUgaGFyZGVyIHRvIHVuZGVy
c3RhbmQuCgo+IEkgd291bGQKPiBndWVzcyBzb21ldGhpbmcgc2ltaWxhciBjb3VsZCBiZSBkb25l
IHdpdGggbGx2bS1vYmpkdW1wIGJ1dCBJIGFtIGxlc3MKPiBmYW1pbGlhciB3aXRoIHRoYXQuIEkg
ZG9uJ3Qga25vdyBpZiB0aGF0J3MgYSBnb29kIHBhdGggdG8gZ28gZG93bgo+IHRob3VnaC4KCklu
IHRoZSBwYXN0IEkgcGVyY2VpdmVkIHRoZXJlIHdhcyBob3N0aWxpdHkgdG93YXJkIExMVk0gZnJv
bSB0aGUgTGludXgKa2VybmVsIGNvbW11bml0eS4gSSBndWVzcyBHUEwgd2FzIGNvbnNpZGVyZWQg
dGhlIHNwZWNpYWwgc2F1Y2UgYXMgdG8Kd2h5IExpbnV4IHdvbiBhbmQgdGhlIEJTRHMgaGFkbid0
LCBzbyB0aGUgcHJlZmVyZW5jZSB3YXMgdG8gZmF2b3IgYQpjb21waWxlciB0aGF0IHVzZWQgdGhl
IHNhbWUgbGljZW5zZS4gSSBkb24ndCB0aGluayB0aGF0J3MgdHJ1ZSBhbnkKbW9yZSBhbmQgSSB0
aGluayB0aGVyZSdzIGEgbG90IG9mIHNlbnNlIGluIHVzaW5nIExMVk0ncyBsaWJyYXJpZXMKcmF0
aGVyIHRoYW4gcmVpbnZlbnRpbmcgdGhlbSBpbiB0aGUgcGVyZiB0b29sLCBvciB1c2luZyBwZXJo
YXBzIGxlc3MKb3J0aG9kb3ggc291cmNlcyBsaWtlIGxpYmNhcHN0b25lLiBJJ20gbm90IGEgZmFu
IG9mIHRoZSB0ZXh0IG91dHB1dApwcm9jZXNzaW5nIHN0dWZmIHNvIGdldHRpbmcgcmlkIG9mIG9i
amR1bXAgYW5kIGxsdm0tb2JqZHVtcCBzdXBwb3J0CndvdWxkIGJlIGdvb2QgaW1vLgoKQW5vdGhl
ciBhcmVhIHdoZXJlIEkgdGhpbmsgd2UgY291bGQgbG9zZSBhIGxvdCBvZiBjb2RlIGJhZ2dhZ2Ug
aXMgd2l0aApsaWJ1bndpbmQsIGFzIEJQRiBzdXBwb3J0IHJlcXVpcmVzIGxpYmVsZiB3aGljaCBi
cmluZ3Mgd2l0aCBpdApsaWJkd2FydmVzIHdoaWNoIHdoZW4gcHJlc2VudCBtZWFucyB3ZSBkb24n
dCB1c2UgbGlidW53aW5kLiBJJ3ZlIGhlYXJkCnJlcG9ydHMgdGhhdCBsaWJkd2FydmVzIGlzIHNs
b3dlciwgYnV0IEknbSBzdXJlIHdlIGNhbiBhZGQgY2FjaGVzIHRvCnNwZWVkIGl0IHVwIHdoaWNo
IHdvdWxkIGxpa2VseSBiZW5lZml0IGEgcmFuZ2Ugb2YgcGVvcGxlLiBJIHdhcyBraW5kCm9mIGhv
cGluZyB3aXRoIGFsbCB0aGF0IGRlbGV0ZWQgd2UgbWF5IGJlIGFibGUgdG8gZ2V0IHJpZCBvZiB0
aGUKbWFqb3JpdHkgb2YgdGhlIGFyY2ggZGlyZWN0b3J5LCBidXQgdGhlIHN5c2NhbGx0Ymwgd29y
ayBpcyBhZGRpbmcgdG8KdGhhdCBkaXJlY3RvcnkgOi0pCgpUaGFua3MsCklhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
