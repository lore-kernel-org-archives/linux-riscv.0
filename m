Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB169C021A1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 16:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoTuxqzZTeX7f+DrQLjLrpE0km/1+rPd5GrkBWlCsDw=; b=PH4pAp46Z78iRo
	W0XzrfxptaUl0FhiqHliu/EEqwDyHfG+5pwnxe1Mu++HHfsNgs55dC7Nft4QUW4MFx7qeHcK59+3u
	Sy//zbUhykNDWlEN3oDJgjD3KAUr2oZbuYGOY3B1HvrihsL+nn63NxIimhHNacPv7lPCyZVmHxQGt
	HrCFNzKw8uXXis19UiEEagZKntAO/XfI4V7QHp5RsRvFlCRwAPzIoOQtj1YEmu3gK/3YUfj9jwZeU
	2rjyMsIi9Z4YBu60LTt4LZLpYHWJKASNaSi/uTVra6nGkoJpDs+eK/EkKrLHkKf0LI5jI2XdihznL
	8mZDahb2QfAi2mCHgsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtP1-00000004ZdQ-0Bry;
	Tue, 11 Feb 2025 16:46:27 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsya-00000004TZC-1Sf5
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 16:19:09 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d13fe99d03so177375ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739290747; x=1739895547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPuoFgyUqShqiHXq7m4WJY26nDOJr72a7sYiaqDAkZ8=;
        b=4HfZquNnsYULBXwcyQMyEpTuHgk156sXqN63kim1NfLA5vxKUFZk4W3H54W/QxucBf
         M8QNZh5kfg0PpEcAmMkRNHVrKTqTsM13kgd1Tew4sHOaJhbHPcce7/manf8wX8HLwX0M
         GgIvtjVpowW0sV8a+tOb3dwHUiktlnKHyoo0zqOrERluB2jS6nB+RqgYCQdxL3TENibz
         QRRcY5iiBHmel9nku30RC8xoieYF+uTMjcfk4gYQUS8xcVUNa5ES/JFXkzZwLxYhP/U1
         0GR0RorWZVZy3rdAWaGdLciQUFRYuqN1yARObSLOotH5dGmq4AJS0rTtg5UkG1j0qGk2
         g6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290747; x=1739895547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPuoFgyUqShqiHXq7m4WJY26nDOJr72a7sYiaqDAkZ8=;
        b=DM9MwiXph9aQGfEPc/e1gQl6iwK7/6iY/KEWYH1aAWhM/qx6Zs8SzUu+zR0oGUyH8l
         zTQSFNTOnaCHIFSvwP1uhI7L4yOQ03F09uR3I5Y93VSR8uAJRGwQlBp8l0Rh6j2bkuzO
         Obx8oLjLucHACEzGi9N9EU5mVJsKiLZ2zm15FM5a4DamFyzWzWAu9uiJfb37jNKCg2bD
         1OhpaLaMvJuPNcMmmoP8gQrQatEPpO06AtqZGNCt+3R1vRYX3DGd6oIoG7/CTtT3M1IW
         ttinwLT/06z/nosZYNAEWy5IgC+2pws50/2L9esBD/W5qHM6SP8Us6ihkVoc3ROHBLth
         +75g==
X-Forwarded-Encrypted: i=1; AJvYcCVK9WcDGSFEPZyOfRwTnJ2EFzlb0jS2x3J+kxd3cXb1GCGabRUP3/AzyuS67I24Hkt3jekHn8D3gcIUcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVUtosUXdVdAzwPylSO7W6re5fIwre5h/W+TPEWKMdS8rzilN
	dSgur5uGcpfSv2/DOGIXBVf9mfa0Jyf4om2cwiOQV36vu/dUV8kPFGYnGerA6qpLQShclB7tMQE
	0YhUg1RNXh/TrG3vHZ6xArV7J5jjyoH5Rg7wh
X-Gm-Gg: ASbGncvWPbm4lj3FUOV7c4TFQznXls58PTRb/OLNqO5rto01vm4zIzX8/1lEagOsHRH
	ltWygqsaIEwYtoOwCZyv5/EWf0f48YyJnKzHE8xwH2vHL8D4YyhgjuyGlx9LkDwLNTfj3coBJ8z
	n7mmbH3X5klNhsVRjF9xG8+sxB
X-Google-Smtp-Source: AGHT+IGBRJUYM7eB7GRcv7zbcCLNqRmCzTZKJzAh5FAel3+2vWVb9N+g6mOuPoRoTCDTrgVk0gX8MyeGCqZ63HpU/Co=
X-Received: by 2002:a05:6e02:1848:b0:3a7:df79:71b3 with SMTP id
 e9e14a558f8ab-3d171e30ba1mr3350285ab.19.1739290746485; Tue, 11 Feb 2025
 08:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
In-Reply-To: <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 08:18:54 -0800
X-Gm-Features: AWEUYZnsI21FqO05tMc19ZFoLQwRQjxl2-W2xUAqGcaU1HeGa3Km7KpVudfKIf8
Message-ID: <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] perf syscalltbl: Remove struct syscalltbl
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_081908_389837_5368FA65 
X-CRM114-Status: GOOD (  31.71  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTE6NDjigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDEwLCAyMDI1LCBhdCAxNzo1MSwgSWFuIFJv
Z2VycyB3cm90ZToKPiA+IFRoZSBzeXNjYWxsdGJsIGhlbGQgZW50cmllcyBvZiBzeXN0ZW0gY2Fs
bCBuYW1lIGFuZCBudW1iZXIgcGFpcnMsCj4gPiBnZW5lcmF0ZWQgZnJvbSBhIG5hdGl2ZSBzeXNj
YWxsdGJsIGF0IHN0YXJ0IHVwLiBBcyB0aGVyZSBhcmUgZ2FwcyBpbgo+ID4gdGhlIHN5c3RlbSBj
YWxsIG51bWJlciB0aGVyZSBpcyBhIG5vdGlvbiBvZiBpbmRleCBpbnRvIHRoZQo+ID4gdGFibGUu
IEdvaW5nIGZvcndhcmQgd2Ugd2FudCB0aGUgc3lzdGVtIGNhbGwgdGFibGUgdG8gYmUgaWRlbnRp
ZmlhYmxlCj4gPiBieSBhIG1hY2hpbmUgdHlwZSwgZm9yIGV4YW1wbGUsIGkzODYgdnMgeDg2LTY0
LiBDaGFuZ2UgdGhlIGludGVyZmFjZQo+ID4gdG8gdGhlIHN5c2NhbGx0Ymwgc28gKDEpIGEgKGN1
cnJlbnRseSB1bnVzZWQgbWFjaGluZSB0eXBlIG9mIEVNX0hPU1QpCj4gPiBpcyBwYXNzZWQgKDIp
IHRoZSBpbmRleCB0byBzeXNjYWxsIG51bWJlciBhbmQgc3lzdGVtIGNhbGwgbmFtZSBtYXBwaW5n
Cj4gPiBpcyBjb21wdXRlZCBhdCBidWlsZCB0aW1lLgo+ID4KPiA+IFR3byB0YWJsZXMgYXJlIHVz
ZWQgZm9yIHRoaXMsIGFuIGFycmF5IG9mIHN5c3RlbSBjYWxsIG51bWJlciB0byBuYW1lLAo+ID4g
YW4gYXJyYXkgb2Ygc3lzdGVtIGNhbGwgbnVtYmVycyBzb3J0ZWQgYnkgdGhlIHN5c3RlbSBjYWxs
IG5hbWUuIFRoZQo+ID4gc29ydGVkIGFycmF5IGRvZXNuJ3Qgc3RvcmUgc3RyaW5ncyBpbiBwYXJ0
IHRvIHNhdmUgbWVtb3J5IGFuZAo+ID4gcmVsb2NhdGlvbnMuIFRoZSBpbmRleCBub3Rpb24gaXMg
Y2FycmllZCBmb3J3YXJkIGFuZCBpcyBhbiBpbmRleCBpbnRvCj4gPiB0aGUgc29ydGVkIGFycmF5
IG9mIHN5c3RlbSBjYWxsIG51bWJlcnMsIHRoZSBkYXRhIHN0cnVjdHVyZXMgYXJlCj4gPiBvcGFx
dWUgKGhlbGQgb25seSBpbiBzeXNjYWxsdGJsLmMpLCBhbmQgc28gdGhlIG51bWJlciBvZiBpbmRp
Y2VzIGZvciBhCj4gPiBtYWNoaW5lIHR5cGUgaXMgZXhwb3NlZCBhcyBhIG5ldyBBUEkuCj4gPgo+
ID4gVGhlIGFycmF5cyBhcmUgY29tcHV0ZWQgaW4gdGhlIHN5c2NhbGx0Ymwuc2ggc2NyaXB0IGFu
ZCBzbyBubyBzdGFydC11cAo+ID4gdGltZSBjb21wdXRhdGlvbiBhbmQgc3RvcmFnZSBpcyBuZWNl
c3NhcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IEhvd2FyZCBDaHUgPGhvd2FyZGNodTk1QGdtYWlsLmNvbT4K
Pgo+IFlvdXIgY2hhbmdlcyBsb29rIGZpbmUgdG8gbWUsIGJ1dCBJIG5vdGljZWQgb25lIHBhcnQg
dGhhdCBtYXkKPiBiZSB3cm9uZyBiZWZvcmUgYW5kIGFmdGVyIHlvdXIgcGF0Y2g6Cj4KPiA+Cj4g
PiAtY29uc3QgaW50IHN5c2NhbGx0YmxfbmF0aXZlX21heF9pZCA9IFNZU0NBTExUQkxfTUFYX0lE
Owo+ID4gLXN0YXRpYyBjb25zdCBjaGFyICpjb25zdCAqc3lzY2FsbHRibF9uYXRpdmUgPSBzeXNj
YWxsdGJsOwo+ID4gK2NvbnN0IGNoYXIgKnN5c2NhbGx0YmxfX25hbWUoaW50IGVfbWFjaGluZSBf
X21heWJlX3VudXNlZCwgaW50IGlkKQo+ID4gK3sKPiA+ICsgICAgIGlmIChpZCA+PSAwICYmIGlk
IDw9IChpbnQpQVJSQVlfU0laRShzeXNjYWxsX251bV90b19uYW1lKSkKPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIHN5c2NhbGxfbnVtX3RvX25hbWVbaWRdOwo+ID4gKyAgICAgcmV0dXJuIE5VTEw7
Cj4gPiArfQo+Cj4gVGhlIHN5c2NhbGwgbnVtYmVycyBvbiBtaXBzIChhbmQgcHJldmlvdXNseSBv
biBpYTY0KSBhcmUgb2Zmc2V0IGJ5Cj4gYSBsYXJnZSBudW1iZXIgZGVwZW5kaW5nIG9uIHRoZSBB
QkkgKG8zMi9uMzIvbjY0KS4gSSBhc3N1bWUgd2hhdAo+IHdlIHdhbnQgaGVyZSBpcyB0byBoYXZl
IHRoZSBzbWFsbCBudW1iZXJzIHdpdGhvdXQgdGhlIG9mZnNldCBpbgo+IHN5c2NhbGxfbnVtX3Rv
X25hbWVbXSwgYnV0IHRoYXQgcmVxdWlyZXMgYWRkaW5nIHRoZSBvZmZzZXQgZHVyaW5nCj4gdGhl
IGxvb2t1cC4gQ2FuIHlvdSBjaGVjayBpZiB0aGlzIGlzIGhhbmRsZWQgY29ycmVjdGx5PwoKVGhh
bmtzIEFybmQhIEkgYWdyZWUgdGhlIHRhYmxlcyBhcmUgbGFyZ2UgYW5kIGNhbiBiZSBzcGFyc2Us
IHRoZXknbGwKYWxzbyBiZSBmdWxsIG9mIHJlbG9jYXRpb25zLiBNSVBTIGRvZXNuJ3QgbG9vayBs
aWtlIGFuIG91dGxpZXIgdG8gbWUKaGVyZToKYGBgCiNpZiBkZWZpbmVkKEFMTF9TWVNDQUxMVEJM
KSB8fCBkZWZpbmVkKF9fbWlwc19fKQpzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc3lzY2FsbF9u
dW1fdG9fbmFtZV9FTV9NSVBTW10gPSB7CiAgICAgICBbMF0gPSAicmVhZCIsCiAgICAgICBbMV0g
PSAid3JpdGUiLAogICAgICAgWzJdID0gIm9wZW4iLAouLi4KICAgICAgICBbNDY1XSA9ICJsaXN0
eGF0dHJhdCIsCiAgICAgICAgWzQ2Nl0gPSAicmVtb3ZleGF0dHJhdCIsCn07CmBgYApGb3IgY29u
dHJhc3QgeDg2OgpgYGAKI2lmIGRlZmluZWQoQUxMX1NZU0NBTExUQkwpIHx8IGRlZmluZWQoX19p
Mzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykKc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHN5
c2NhbGxfbnVtX3RvX25hbWVfRU1fMzg2W10gPSB7CiAgICAgICAgWzBdID0gInJlc3RhcnRfc3lz
Y2FsbCIsCiAgICAgICAgWzFdID0gImV4aXQiLAogICAgICAgIFsyXSA9ICJmb3JrIiwKLi4uCiAg
ICAgICAgWzQ2NF0gPSAiZ2V0eGF0dHJhdCIsCiAgICAgICAgWzQ2NV0gPSAibGlzdHhhdHRyYXQi
LAogICAgICAgIFs0NjZdID0gInJlbW92ZXhhdHRyYXQiLAp9OwpgYGAKTG9va2luZyB0aHJvdWdo
IHRoZSB0YWJsZXMgSSBzZWUgYWxwaGEgaGF2aW5nIHRoZSBoaWdoZXN0IG51bWJlcgpzeXNjYWxs
IHdpdGggNTcyIGJlaW5nIG1zZWFsLgoKSSBkb24ndCB0aGluayB0aGlzIGlzIGdyZWF0IGJ1dCBp
biB0aGUgY3VycmVudCBjb2RlIChvbiB4ODYtNjQpIHdlCmhhdmUgaW4gYXJjaC94ODYvaW5jbHVk
ZS9nZW5lcmF0ZWQvYXNtL3N5c2NhbGxzXzY0Lmg6CmBgYApzdGF0aWMgY29uc3QgY2hhciAqY29u
c3Qgc3lzY2FsbHRibFtdID0gewogICAgICAgWzBdID0gInJlYWQiLAogICAgICAgWzFdID0gIndy
aXRlIiwKICAgICAgIFsyXSA9ICJvcGVuIiwKLi4uCiAgICAgICAgWzQ2NV0gPSAibGlzdHhhdHRy
YXQiLAogICAgICAgIFs0NjZdID0gInJlbW92ZXhhdHRyYXQiLAp9OwojZGVmaW5lIFNZU0NBTExU
QkxfTUFYX0lEIDQ2NgpgYGAKU28gdGhlIGNoYW5nZSBpcyBjYXJyeWluZyBmb3J3YXJkIGEgYmFk
IGJlaGF2aW9yLCB0aGUgdGFibGUgaXMgc3RpbGwKb25seSBhcm91bmQgNGtiLiBXZSBjb3VsZCBi
ZSBtb3JlIGFnZ3Jlc3NpdmUgaW4gY29tcHJlc3NpbmcgdGhlCnN0cmluZ3MgYW5kIHBvaW50ZXJz
LCBmb3IgZXhhbXBsZSBob3cgd2UgY29tcHJlc3MgdGhlIHBlcmYgZXZlbnRzIGFuZAptZXRyaWNz
LiBJIHRoaW5rIGl0IGlzIGdldHRpbmcgb3V0LW9mLXNjb3BlIGhlcmUgYXMgdGhhdCBsb2dpYyBp
cwp3cml0dGVuIGluIHB5dGhvbiwgd2l0aCB0aGUgYWlkIG9mIGxvdHMgb2YgZGljdGlvbmFyaWVz
LCB3aGlsc3QgdGhpcwpjb2RlIGlzIGN1cnJlbnRseSBhIHNoZWxsIHNjcmlwdC4gSXQgYmVjb21l
cyBtb3JlIG9mIGFuIGlzc3VlIGlmIHdlCmVuYWJsZSBhbGwgb2YgdGhlIHRhYmxlcyBpbiB0aGUg
YnVpbGQgYXQgb25jZS4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
