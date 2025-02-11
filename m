Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9842C021A5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PRX/K/Exlfn44PpD+3dbCjexhyg3DIQdBdUrZ5GhPg=; b=L/z42wA3gFO63Z
	lWR7WQCnObGfvJ8T8RkGdkUpaDT61cyNR7eI8SuatgMzNRlqTbZuZvkPVd1jyVoOAeJyU+Gh51jKS
	X5EU0JCwx29nWsug2KzcB+qWRGv6LjOT8wYnQn6m0bLGXc/stCa81x+wV/LW9BiIwgTYHnva4XxiQ
	A2KC+7C1GW+XHFgLxhjclSURP3qRXSuN849HjmdhuJ1AlonkgwRFR7ch7egchKf2EqtWd4EUHfxc6
	QxiuaLnapVs1lqfpL45fcSkP/eL1WbDjSoEEh+oZC+1eWfE425aXeaqHlO7F+CSx1WzGTpcwlyAhY
	yYfLMYbMV8vBHoBmWbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHr-00000004igf-1HNN;
	Tue, 11 Feb 2025 17:43:07 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu7m-00000004h8D-3QJg
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 17:32:43 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d05815e89dso179885ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739295162; x=1739899962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wQ94efDGzeP+hPazDVZ0s87mMmIX0OkL74nPRKdj5c=;
        b=PWQx27xBmR2gCdVRzILTtHraT6SQp+Atm9K+raQ0zLSMuXE5lNFmYaQFzQChZEr5/E
         7nKYd4tVS4oCYCZgrND47cFzbM3Q0NdzWJcX6GxdzMJ5kUTkdYq0WDtSYl2lbcKL8KdE
         acVhiGAeSWFqKJPk5UrmqQPfN6hAmNd735kSJf4Cc8Ql57JqH4ohMYxsSNFb3GOL2Yob
         dEuzhmkiT8i2ZA/YzN4JJnDLk5459z+ye1iHIB73fn/6q5Yk8q08Fxjc9rIv6KSGAkle
         X6BQbRcZFkROpKPc6SdVqDkQSpp07aDGzutUg6F4YTUMGAbCzKxO0nXp/ChEOsso1NME
         IcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295162; x=1739899962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wQ94efDGzeP+hPazDVZ0s87mMmIX0OkL74nPRKdj5c=;
        b=esb6wiJ7F4zv+DyBOPxLnFHkW+unGCFICoadZiylsdrh/atmduNkfsbH/R0VBVRtuO
         Kp3gYRudYPCMJ+L0q5Tq/wpFHcdykDZud/zD4pHVCtpju2jeOeybMymL3vmI97pJsVbp
         lW72x09RcDak0KUkSaIGiDE9mlZh7vROkynRULlPxz0Ahv2au/AHQChVRvdNXVlh8mmr
         ShyRCorFU/0pu7huJA3UcT8uEBi4zNyMGf9xdIN4NwI0+aK1nBwh8v3pdTebtRhMRdJv
         n/kuiitQy8ulVmqy25QtMHUS1DG9VWZqvH4oF9GpnJeqDrFtPCt6jpuvjhZBeGnPkoXS
         fuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVegHxiL/WgDzkgbAVjIY5nNakr68io+6Wve1YxEIX0jQrzMFqatJTexdYuyGCBPwtctLY4BCFziPEXuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQly/WzG3E00TU/c6pV7M1Ct0onj0/SBAaRm32sNGb75nzXJkY
	b7dI3lZtQBhPXCacyuMX8QzRk9lRuVGxp8CYKC47LPttBcz0rkcOQcYDe6QE8R5atgeGXzN2ds9
	6Nhg17r68lzwlEz6d+ba2UodDT0SDktOYS8gj
X-Gm-Gg: ASbGncvMjBhTpdAAlMETHrhviII9cfIxv+CjBYUx2uigzlLbhFeUq4UwIDLgPSJW9H8
	prQGgYVBawDS21MG3DnH4GQnQGYbs8HYhTlT/9Q7XlWgZkK7AsiN1k0OdMe07M6I8Yg55Kokp4S
	y3VrCGbfmcVcCrVxHJYW6GJvkA
X-Google-Smtp-Source: AGHT+IFx7gQLpljuW0IlQHJkC2sPOgwjKNSe/p6Gvj27OoKy/WP45l1TbYOsmf4dkw4zbjr78o/5BoHNMYA6pqf60WY=
X-Received: by 2002:a92:c848:0:b0:3d1:7959:1793 with SMTP id
 e9e14a558f8ab-3d179591827mr1211895ab.25.1739295161966; Tue, 11 Feb 2025
 09:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com> <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
 <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
In-Reply-To: <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 09:32:30 -0800
X-Gm-Features: AWEUYZkcknJc_ecEWZmGNLleCOMX5hjRpYX4QmTXwPuP9BwndmjrpXk_kZmIMOQ
Message-ID: <CAP-5=fWjJbg_q3xN0iytcqdBzSuRX+PD7CKp9+rHvFxB1VYxhw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250211_093242_854579_01795EA4 
X-CRM114-Status: GOOD (  24.25  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgODozNOKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMTEsIDIwMjUsIGF0IDE3OjE4LCBJYW4gUm9n
ZXJzIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTE6NDjigK9QTSBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPgo+ID4+IFRoZSBzeXNjYWxsIG51bWJlcnMg
b24gbWlwcyAoYW5kIHByZXZpb3VzbHkgb24gaWE2NCkgYXJlIG9mZnNldCBieQo+ID4+IGEgbGFy
Z2UgbnVtYmVyIGRlcGVuZGluZyBvbiB0aGUgQUJJIChvMzIvbjMyL242NCkuIEkgYXNzdW1lIHdo
YXQKPiA+PiB3ZSB3YW50IGhlcmUgaXMgdG8gaGF2ZSB0aGUgc21hbGwgbnVtYmVycyB3aXRob3V0
IHRoZSBvZmZzZXQgaW4KPiA+PiBzeXNjYWxsX251bV90b19uYW1lW10sIGJ1dCB0aGF0IHJlcXVp
cmVzIGFkZGluZyB0aGUgb2Zmc2V0IGR1cmluZwo+ID4+IHRoZSBsb29rdXAuIENhbiB5b3UgY2hl
Y2sgaWYgdGhpcyBpcyBoYW5kbGVkIGNvcnJlY3RseT8KPiA+Cj4gPiBUaGFua3MgQXJuZCEgSSBh
Z3JlZSB0aGUgdGFibGVzIGFyZSBsYXJnZSBhbmQgY2FuIGJlIHNwYXJzZSwgdGhleSdsbAo+ID4g
YWxzbyBiZSBmdWxsIG9mIHJlbG9jYXRpb25zLiBNSVBTIGRvZXNuJ3QgbG9vayBsaWtlIGFuIG91
dGxpZXIgdG8gbWUKPiA+IGhlcmU6Cj4KPiBTb3JyeSwgSSBzaG91bGQgaGF2ZSBiZWVuIGNsZWFy
ZXIgd2hhdCBJIG1lYW50LCBzZWUKPiBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS91bmlzdGQu
aDoKPgo+ICNpZiBfTUlQU19TSU0gPT0gX01JUFNfU0lNX05BQkkzMgo+ICNkZWZpbmUgX19OUl9M
aW51eCAgICAgIDYwMDAKPiAjaW5jbHVkZSA8YXNtL3VuaXN0ZF9uMzIuaD4KPiAjZW5kaWYKPgo+
IGFuZAo+IGFyY2gvbWlwcy9pbmNsdWRlL2dlbmVyYXRlZC91YXBpL2FzbS91bmlzdGRfbjMyLmgK
Pgo+ICNkZWZpbmUgX19OUl9yZWFkIChfX05SX0xpbnV4ICsgMCkKPiAjZGVmaW5lIF9fTlJfd3Jp
dGUgKF9fTlJfTGludXggKyAxKQo+ICNkZWZpbmUgX19OUl9vcGVuIChfX05SX0xpbnV4ICsgMikK
Pgo+IFRoZXNlIG9mZnNldHMgYXJlIDQwMDAvNTAwMC82MDAwIHJlc3BlY3RpdmVseS4KPgo+ID4g
YGBgCj4gPiAjaWYgZGVmaW5lZChBTExfU1lTQ0FMTFRCTCkgfHwgZGVmaW5lZChfX21pcHNfXykK
PiA+IHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBzeXNjYWxsX251bV90b19uYW1lX0VNX01JUFNb
XSA9IHsKPiA+ICAgICAgICBbMF0gPSAicmVhZCIsCj4gPiAgICAgICAgWzFdID0gIndyaXRlIiwK
PiA+ICAgICAgICBbMl0gPSAib3BlbiIsCj4gPiAuLi4KPiA+ICAgICAgICAgWzQ2NV0gPSAibGlz
dHhhdHRyYXQiLAo+ID4gICAgICAgICBbNDY2XSA9ICJyZW1vdmV4YXR0cmF0IiwKPiA+IH07Cj4K
PiBUaGlzIG1lYW5zIHRoZSBhcnJheSBpcyBub3Qgc3BhcnNlLCBidXQgdGhlIG51bWJlcnMKPiBo
ZXJlIGRvIG5vdCBtYXRjaCB0aGUgc3lzY2FsbCBudW1iZXIgYXJndW1lbnQgcmVnaXN0ZXIuCj4K
PiBUaGUgcXVlc3Rpb24gaXMgd2hldGhlciB0cmFjaW5nIG9uIG1pcHMgYWRkcyB0aGUgc2FtZQo+
IHBlci1BQkkgb2Zmc2V0IGFnYWluLCBvciBpZiBpdCB0cmllcyBhbmQgZmFpbHMgdG8gbG9vawo+
IHVwIGluZGV4IDYwMDIgZm9yICdvcGVuJy4KClRoYW5rcyBmb3IgY2xhcmlmeWluZy4gSSBiZWxp
ZXZlIGl0IHdpbGwgdXNlIDYwMDIgYW5kIGJlIGJyb2tlbi4gSQpiZWxpZXZlIHRoYXQnZCBiZSB0
cnVlIHdpdGhvdXQgdGhlc2UgY2hhbmdlcyB0b28uIEknbSBub3QgdGVzdGluZyBvbgpNSVBTIHNv
IGl0J2QgYmUgbmljZSB0byBoYXZlIGEgZml4IHRhcmdldGVkIGF0IG1ha2luZyBpdCB3b3JrLiBJ
ZGVhbGx5CndlIHdvdWxkbid0IHVzZSBfX05SX0xpbnV4IGFuZCBpbnN0ZWFkIGZ1ZGdlIHRoZSBp
ZC9zeXN0ZW0gY2FsbCBudW1iZXIKYmFzZWQgb24gZV9tYWNoaW5lL2VfZmxhZ3MuIEkgdGhpbmsg
aXQgaXMgZm9sbG93IG9uIHdvcmssIGVzcGVjaWFsbHkKYmVjYXVzZSBJIGRvbid0IGZpbmQgTUlQ
UyBhIHZlcnkgbW90aXZhdGluZyB1c2UtY2FzZS4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
