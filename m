Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECDC282DE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dmbe86NFdqoYUOiG7jk6d9bha9E2sEw5dZjzl6HbeOA=; b=h/RNtHwH44E2Uy
	9iA65cP516Wq8T86uXwbZ5zWN0A3pbafgVRVed/sOC49L9nrPDr7rwPGyt5GlqY7pD7uOvFYBfB84
	9iW0Wr+qaUvn7Exk+fuWXha/BpSYvh0Lb90Hw8MTsEE/c3dW63b+HPygnS5YbY3EkZ+zpWYxFhMTG
	sC1oMe4xvH/EkM2R1XsBRDBeY2BYuT9SN5RIk83mWnPy/q+0ofbJ1ylPgyRa2Dno9SjJxvPMaYwFP
	7lQxJmQ1T1ey5whIv3yGOsOoU25qJ0WcMEZEe/cllPGLWU+LHtLtO+i1y5U6xZ5vTOEA/md3672At
	jPtba7qQy+cP6uSj1YYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQIK-0000000DD90-12oW;
	Fri, 07 Mar 2025 05:30:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQHx-0000000DD2q-2sNN
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 05:30:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2240aad70f2so107095ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Mar 2025 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741325425; x=1741930225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdDEJTsHKwvjyl+F7qkE/MVBBT69xP0JtpsTNjb5e+Q=;
        b=NQ1uNkZ0UsC7XYj3pVS0zp1xXlZI/eQMh7czopYFErL8jbypTDRhm/iZUw4TK7hILS
         EpKhSZ7o7FG8VELQRRPtuOooZ8uotzKxom1YqfeaknoEqfEbPgopJf3p2ttoDKsWVrB9
         pnunqAYyftJ4NcFMwqDXwTJj7HZu8phD14o1hYRiMbMgfSZ+p66pFedzVVfanl4YH91r
         p/Vo2ofMlCyblvkh6x4hXssbYAL0AFZjvgWI9SZVNW84YBEJvIq0uF5MvtL2rN4OXWpM
         3RBgMNJLe1GYwGxctT+fzVmMADPffNp4BpIx6CSR7F7zAMkpfI0XOgQrxD9Kb6AhhEV0
         l0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741325425; x=1741930225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdDEJTsHKwvjyl+F7qkE/MVBBT69xP0JtpsTNjb5e+Q=;
        b=Hdo3CMEKBethWv3E8Og4KQ8MwdPClRtveM0uuHO+PT3FSd8F3qD1VYHlUXFHSgX9yO
         W2VvyicdScngpSq43Bwj2pLV/n3aZliDdWrsMhw/nK7MFygd2UG0BzR1ylplGxVUwVpv
         wMF6qHPECgfXmTkBPZy+DRPGNvGwIak5jEORRkVJBAE5aO7KT96c+vqXUQbycUhbupAf
         tgFldz7blg8uTbrsBh1Gxi2LXOHnFyZXQwVTfP7gyjY3W3ixNjXmx6ZArMgWAuOk2Ind
         qr8374t2lWZptV4Bf3B7N4+t9u/wrQ5ZnsOGCmiYpmUS/usJlW8sSEFqvFfL2y7sXA7e
         mqiA==
X-Forwarded-Encrypted: i=1; AJvYcCViOgXSJTaMeLY6g8254AmKGoxwmoGnI5p6TfapEhhBHyszXDpLIm3k04wAq0vtDGwMiU26n2GazrdV9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkAKSvtOXgSTr9cOVe4ThCxwFn30D/vG8OVmdc8ecD0wmwRy7L
	eTdqqiFJ449NoRnGKXE80NZbANKPs2iIglSIM18970KXxyutS4kauKyl2ZUXwhDgxzNNQsysL4w
	qyQHHoJ2bJW86djKV5X1eZMf4ONt0PprpuOmU
X-Gm-Gg: ASbGncsHgqB1RpgpdEXzzN9/x9YBA9QrtJvKpblspAUoFHMqEDqzjEX5VyUJ3EXKshN
	JtKQt+pUcIrLFc/D+zBjz6MaLbv5VZCt4vYVmYl5x7D5bY6J02/2BGDlcSCIxWgAlj/3yUTKqiL
	O9cN6xVd/tWdzzhS8Oedhe2PW8dY0=
X-Google-Smtp-Source: AGHT+IEcodZzFnpZf8m9GKxcrOIuoYtTe9WlblycwKpr+zFPLDPbCwJqYAatYqYzvaFLYn5WJRIGjZXLMcuz4Nbng4s=
X-Received: by 2002:a17:902:d504:b0:220:ce33:6385 with SMTP id
 d9443c01a7336-2242a6004b6mr1115105ad.9.1741325424567; Thu, 06 Mar 2025
 21:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com> <20250304050305.901167-7-irogers@google.com>
 <Z8pKTE7tOqdqNUdA@google.com>
In-Reply-To: <Z8pKTE7tOqdqNUdA@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Mar 2025 21:30:13 -0800
X-Gm-Features: AQ5f1JqqAJ5MO97ObltKzRcURCg1d-Uko29NllBm3N5v0f7KDyGvXHVOjRAnU58
Message-ID: <CAP-5=fXdZZX=wa8EkN-dcpnDjA7J-cQ09BERufAQzoBeoNCT1g@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] perf dso: Add support for reading the e_machine
 type for a dso
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_213025_730185_C91A54D2 
X-CRM114-Status: GOOD (  27.38  )
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

T24gVGh1LCBNYXIgNiwgMjAyNSBhdCA1OjIy4oCvUE0gTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDAzLCAyMDI1IGF0IDA5OjAzOjAwUE0g
LTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBGb3IgRUxGIGZpbGUgZHNvcyByZWFkIHRoZSBl
X21hY2hpbmUgZnJvbSB0aGUgRUxGIGhlYWRlci4gRm9yIGtlcm5lbAo+ID4gdHlwZXMgYXNzdW1l
IHRoZSBlX21hY2hpbmUgbWF0Y2hlcyB0aGUgcGVyZiB0b29sLiBJbiBvdGhlciBjYXNlcwo+ID4g
cmV0dXJuIEVNX05PTkUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvcGVyZi91dGlsL2Rzby5jIHwgNTQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHRvb2xzL3BlcmYv
dXRpbC9kc28uaCB8ICAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL2Rzby5jIGIvdG9vbHMvcGVyZi91
dGlsL2Rzby5jCj4gPiBpbmRleCA1YzZlODVmZGFlMGQuLjdmMmYxYWY0ZjczYiAxMDA2NDQKPiA+
IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9kc28uYwo+ID4gKysrIGIvdG9vbHMvcGVyZi91dGlsL2Rz
by5jCj4gPiBAQCAtMTE3MCw2ICsxMTcwLDYwIEBAIHNzaXplX3QgZHNvX19kYXRhX3JlYWRfb2Zm
c2V0KHN0cnVjdCBkc28gKmRzbywgc3RydWN0IG1hY2hpbmUgKm1hY2hpbmUsCj4gPiAgICAgICBy
ZXR1cm4gZGF0YV9yZWFkX3dyaXRlX29mZnNldChkc28sIG1hY2hpbmUsIG9mZnNldCwgZGF0YSwg
c2l6ZSwgdHJ1ZSk7Cj4gPiAgfQo+ID4KPiA+ICt1aW50MTZfdCBkc29fX2VfbWFjaGluZShzdHJ1
Y3QgZHNvICpkc28sIHN0cnVjdCBtYWNoaW5lICptYWNoaW5lKQo+ID4gK3sKPiA+ICsgICAgIHVp
bnQxNl90IGVfbWFjaGluZSA9IEVNX05PTkU7Cj4gPiArICAgICBpbnQgZmQ7Cj4gPiArCj4gPiAr
ICAgICBzd2l0Y2ggKGRzb19fYmluYXJ5X3R5cGUoZHNvKSkgewo+ID4gKyAgICAgY2FzZSBEU09f
QklOQVJZX1RZUEVfX0tBTExTWU1TOgo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVfX0dV
RVNUX0tBTExTWU1TOgo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVfX1ZNTElOVVg6Cj4g
PiArICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9fR1VFU1RfVk1MSU5VWDoKPiA+ICsgICAgIGNh
c2UgRFNPX0JJTkFSWV9UWVBFX19HVUVTVF9LTU9EVUxFOgo+ID4gKyAgICAgY2FzZSBEU09fQklO
QVJZX1RZUEVfX0dVRVNUX0tNT0RVTEVfQ09NUDoKPiA+ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9U
WVBFX19TWVNURU1fUEFUSF9LTU9EVUxFOgo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVf
X1NZU1RFTV9QQVRIX0tNT0RVTEVfQ09NUDoKPiA+ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9UWVBF
X19LQ09SRToKPiA+ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9UWVBFX19HVUVTVF9LQ09SRToKPiA+
ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9UWVBFX19CUEZfUFJPR19JTkZPOgo+ID4gKyAgICAgY2Fz
ZSBEU09fQklOQVJZX1RZUEVfX0JQRl9JTUFHRToKPiA+ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9U
WVBFX19PT0w6Cj4gPiArICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9fSkFWQV9KSVQ6Cj4KPiBJ
IHRoaW5rIHNvbWUgb2YgdGhlbSBjYW4gYmUgcG9zc2libGUgaW4gcmVjb3JkZWQgZGF0YS4gIEJ1
dCBsZXQncyBnbwo+IHNpbXBsZSB3aXRoIEVNX0hPU1QgYXMgd2UgaGF2ZW4ndCBzdXBwb3J0ZWQg
Y3Jvc3MtYXJjaCB0cmFjZS4KCkkgdGhpbmsgeW91IGFyZSBhZ3JlZWluZyB3aXRoIHRoZSBjb2Rl
LCB3aGljaCBJIHRoaW5rIGlzIHJpZ2h0IDotKSBJCmRvbid0IGtub3cgYSB3YXkgdG8gZ28gZnJv
bSBzYXkgL3Byb2Mva2FsbHN5bXMgdGV4dCBmaWxlIHRvIGFuCmVfbWFjaGluZSBudW1iZXIgYW5k
IGludmVudGluZyBhIHdheSBpcyBnZXR0aW5nIGJleW9uZCB0aGUgc2NvcGUgb2YKdGhpcyBzZXJp
ZXMuCgo+ID4gKyAgICAgICAgICAgICByZXR1cm4gRU1fSE9TVDsKPiA+ICsgICAgIGNhc2UgRFNP
X0JJTkFSWV9UWVBFX19ERUJVR0xJTks6Cj4gPiArICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9f
QlVJTERfSURfQ0FDSEU6Cj4gPiArICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9fQlVJTERfSURf
Q0FDSEVfREVCVUdJTkZPOgo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVfX1NZU1RFTV9Q
QVRIX0RTTzoKPiA+ICsgICAgIGNhc2UgRFNPX0JJTkFSWV9UWVBFX19PUEVORU1CRURERURfREVC
VUdJTkZPOgo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVfX0ZFRE9SQV9ERUJVR0lORk86
Cj4gPiArICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9fVUJVTlRVX0RFQlVHSU5GTzoKPiA+ICsg
ICAgIGNhc2UgRFNPX0JJTkFSWV9UWVBFX19NSVhFRFVQX1VCVU5UVV9ERUJVR0lORk86Cj4gPiAr
ICAgICBjYXNlIERTT19CSU5BUllfVFlQRV9fQlVJTERJRF9ERUJVR0lORk86Cj4gPiArICAgICAg
ICAgICAgIGJyZWFrOwo+ID4gKyAgICAgY2FzZSBEU09fQklOQVJZX1RZUEVfX05PVF9GT1VORDoK
PiA+ICsgICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgIHJldHVybiBFTV9OT05FOwo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcHRocmVhZF9tdXRleF9sb2NrKCZkc29fX2RhdGFfb3Bl
bl9sb2NrKTsKPgo+IEhtbS4uIEknbSBhZnJhaWQgaXQnZCBzbG93IGRvd24gcGVyZiB0cmFjZSBh
IGJpdCBtb3JlLiAgSXQgc2Vlcwo+IG9jY2FzaW9uYWwgTE9TVCBldmVudHMuICBCdXQgaXQgbWF5
IGJlIG9rIGFzIGl0J3MgY2FjaGVkIGluIHRocmVhZCBsYXRlci4KCkFncmVlZCwgSSB0aGluayB0
aGUgY2FjaGluZyB3aWxsIGhhbmRsZSB0aGlzLiBUaGUgbG9jayBpcyBwcmUtZXhpc3RpbmcKYW5k
IGlzIHVzZWQgdG8gZ3VhcmQgdXNlIG9mIHRoZSBkc29fZGF0YS0+ZmQuIFRoZSBsb2NrIGNvdWxk
IGJlIG1hZGUKcmVhZGVyLXdyaXRlciwgaXQgY291bGQgYmUgcGxhY2VkIHdpdGhpbiB0aGUgZHNv
X2RhdGEgaXQgY291bGQgYWxzbyBiZQpzaGFyZGVkLiBJJ3ZlIG5vdCBkb25lIGFueSBvZiB0aGF0
IGhlcmUgYXMgSSBiZWxpZXZlIHRoZSBwcm9jZXNzaW5nIGlzCmFsbCBoYW5kbGVkIG9uIGEgc2lu
Z2xlIHRocmVhZCBhbnl3YXkuCgo+ID4gKwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIGRzb19f
ZGF0YShkc28pLT5mZCBtaWdodCBiZSBjbG9zZWQgaWYgb3RoZXIgdGhyZWFkIG9wZW5lZCBhbm90
aGVyCj4gPiArICAgICAgKiBmaWxlIChkc28pIGR1ZSB0byBvcGVuIGZpbGUgbGltaXQgKFJMSU1J
VF9OT0ZJTEUpLgo+ID4gKyAgICAgICovCj4gPiArICAgICB0cnlfdG9fb3Blbl9kc28oZHNvLCBt
YWNoaW5lKTsKPiA+ICsgICAgIGZkID0gZHNvX19kYXRhKGRzbyktPmZkOwo+ID4gKyAgICAgaWYg
KGZkID49IDApIHsKPiA+ICsgICAgICAgICAgICAgX1N0YXRpY19hc3NlcnQob2Zmc2V0b2YoRWxm
MzJfRWhkciwgZV9tYWNoaW5lKSA9PSAxOCwgIlVuZXhwZWN0ZWQgb2Zmc2V0Iik7Cj4gPiArICAg
ICAgICAgICAgIF9TdGF0aWNfYXNzZXJ0KG9mZnNldG9mKEVsZjY0X0VoZHIsIGVfbWFjaGluZSkg
PT0gMTgsICJVbmV4cGVjdGVkIG9mZnNldCIpOwo+ID4gKyAgICAgICAgICAgICBpZiAocHJlYWQo
ZmQsICZlX21hY2hpbmUsIHNpemVvZihlX21hY2hpbmUpLCAxOCkgIT0gc2l6ZW9mKGVfbWFjaGlu
ZSkpCj4KPiBJIHRoaW5rIGl0IG5lZWRzIHRvIGNoZWNrIHRoZSBlbmRpYW5lc3MgYW5kIHN3YXAg
dGhlIGRhdGEuCgpBZ3JlZWQuIFdpbGwgc2VuZCBhIGZpeCBpbiB2NS4KClRoYW5rcywKSWFuCgo+
IFRoYW5rcywKPiBOYW1oeXVuZwo+Cj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBlX21hY2hp
bmUgPSBFTV9OT05FOwo+ID4gKyAgICAgfQo+ID4gKyAgICAgcHRocmVhZF9tdXRleF91bmxvY2so
JmRzb19fZGF0YV9vcGVuX2xvY2spOwo+ID4gKyAgICAgcmV0dXJuIGVfbWFjaGluZTsKPiA+ICt9
Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogZHNvX19kYXRhX3JlYWRfYWRkciAtIFJlYWQgZGF0YSBm
cm9tIGRzbyBhZGRyZXNzCj4gPiAgICogQGRzbzogZHNvIG9iamVjdAo+ID4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3BlcmYvdXRpbC9kc28uaCBiL3Rvb2xzL3BlcmYvdXRpbC9kc28uaAo+ID4gaW5kZXgg
ZjNjYTJhNWU3NjcwLi5iYTliODNkYjA2MWEgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3V0
aWwvZHNvLmgKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9kc28uaAo+ID4gQEAgLTgxOCw2ICs4
MTgsNyBAQCBpbnQgZHNvX19kYXRhX2ZpbGVfc2l6ZShzdHJ1Y3QgZHNvICpkc28sIHN0cnVjdCBt
YWNoaW5lICptYWNoaW5lKTsKPiA+ICBvZmZfdCBkc29fX2RhdGFfc2l6ZShzdHJ1Y3QgZHNvICpk
c28sIHN0cnVjdCBtYWNoaW5lICptYWNoaW5lKTsKPiA+ICBzc2l6ZV90IGRzb19fZGF0YV9yZWFk
X29mZnNldChzdHJ1Y3QgZHNvICpkc28sIHN0cnVjdCBtYWNoaW5lICptYWNoaW5lLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBvZmZzZXQsIHU4ICpkYXRhLCBzc2l6ZV90IHNp
emUpOwo+ID4gK3VpbnQxNl90IGRzb19fZV9tYWNoaW5lKHN0cnVjdCBkc28gKmRzbywgc3RydWN0
IG1hY2hpbmUgKm1hY2hpbmUpOwo+ID4gIHNzaXplX3QgZHNvX19kYXRhX3JlYWRfYWRkcihzdHJ1
Y3QgZHNvICpkc28sIHN0cnVjdCBtYXAgKm1hcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IG1hY2hpbmUgKm1hY2hpbmUsIHU2NCBhZGRyLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICB1OCAqZGF0YSwgc3NpemVfdCBzaXplKTsKPiA+IC0tCj4gPiAyLjQ4LjEuNzEx
LmcyZmVhYmFiMjVhLWdvb2cKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
