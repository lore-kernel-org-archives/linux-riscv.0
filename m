Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV1rrE0aUZl9g/WmfeqvPa/7HxCcW7Fb4l71NUCfbsw=; b=cQ16SS88bKoDVx
	D218gvK+dNNaZCOMMgpFYKuuGiZbPDjnq/thYPn5X0TSfDPpaIc31vb3srh0PfAPKR/k9whir/Moc
	Yd2ZuUuYkFXFtZM5SH88xFbKgqfbRaddlwBQd/UgR1jjYjG2XdgBOskEZCeBmCgcaEmNiNvYUhrQG
	btdWj9mRrhziXGJzPw239F30nOV+5w3vt/1mJ4EJd0Q5ajgZRAadQ89c+OcjqAAsDcrJOEsAKf8Yv
	YlP8Wa1hNnVG8R1V1dVGbEE/e32O1Nc8XOPD7/0U6cQhDMpzRKW8qooE60FX0X497WUR9VRVb7k/F
	dALAyyjnpDe6iGcW8XZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphx3-00000004ECA-1HSx;
	Sat, 23 Aug 2025 06:42:09 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upW3T-00000003HFz-2gbW
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 18:00:00 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-53b17531009so779937e0c.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755885598; x=1756490398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9fNzpGQYiY8hUTovQusQUuPvFziC263n9KoSaKQGOM=;
        b=dSG52vOlV9YVq0b/ghQZ0E5fwFn1fbmAJLQpuq9qmr8t93t7RPhGD2Ysr4l4s/znGu
         TzCYkuBNcuQbXZX2XtECLLhGK9uj1VTaYSWJieZXVIIhGSu9nk22JP8zLzEFpphY+jV1
         Y7/DZ1penNQhilHwU6AW/wQ7Ujnq0OYOIBK+3ZHww3C5iR8E4KI1VPw5Fu/pPnrIIHUY
         8/uGXnL4W/8hPtyfGb9yLAmUOFkoQn6GLjiOBbe3jEztICkpGf1rSsSoj2mH0f11GBwK
         NVsCZ7qhJCZUS4Eb9NkZd5SVUdRKb8BrOJg6VuQA7uUfFxRHr/VmRcSujvvoztXPXy3J
         OJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885598; x=1756490398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9fNzpGQYiY8hUTovQusQUuPvFziC263n9KoSaKQGOM=;
        b=uo9Vm+pJI+B1zw0LJ3H1VS+Q5eV8dQ+GppbbdSpp6OwHOab001vlJ6SitlZsf8CRLT
         McDWoW0yKaFUaDsy9oEL+jadBaCre8rPM6PehZ/9b+YkkdxuMqgL1bgd2gmn1PdUVaNG
         SUf69m9yC/vpAUx7CpAz2Qq/NzzKFJpmIKtPsEKoRv+J2UgLQycfbw+MgCVzflwzrh1x
         +Ao3TP54r5NpHQXdql4DX0MxB3MiTZjjZOl7k6FalxHIidGRDFIBvS6lM/3QbRUNq8cn
         qEndqAhKAt105nlPe2uLNY41HB8b++h8P9QRnUzw0McTp//DXOeQ/boCo0166BBK+Uza
         bqzQ==
X-Gm-Message-State: AOJu0YxNp7iANVSU1BEFeLyqB2lcrN1FQ1A56eG6C/zPrx5+Jsop4a6+
	Qiz+iclnK1v8KLKl08MwABccWkIJ5TsgiSICo2uW94gIohhwN570pcf97S0myAt1WlvchW9U/Yl
	QCo1wGG5Qr3b8s89kuD9KCy09HxR64rVyquoxP1QbfkAIl/ClZl4w
X-Gm-Gg: ASbGnctb/73P4Cz7Ep3PyN+gLQx7WjWWu51iJfQEeboCaZifz9nxjrftc3io4EMcqYF
	aPbhTehOpb+7qMLhkZYrt+jiGHZQLYhxuifGwBQj/PmywJ+bp5oa6OYV3SslgKlqJF+Rxe3V2Z2
	MTFV9T4LTGtbeJaV2U746PxKsyGt2gRVSG9W3OF1crsI32ewLJZzZsF9js4tTuEBldO9/cJdYJk
	xbOcIhL
X-Google-Smtp-Source: AGHT+IGn5vdUvXU42asTYKNQVZYOTWSFQylr/vzhKnTrBq4lq3wiMD7MVYIp2kAGpgvKTA1X/43JEESbQNKODDhNtrQ=
X-Received: by 2002:a05:6122:2502:b0:539:27eb:ca76 with SMTP id
 71dfb90a1353d-53c8a2ea9admr1107586e0c.5.1755885598348; Fri, 22 Aug 2025
 10:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250822174715.1269138-1-jesse@rivosinc.com>
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Fri, 22 Aug 2025 10:59:47 -0700
X-Gm-Features: Ac12FXx85Q9pdAS3tmJucpDWbmumN5hD5YReh0RpBOKeYl8mPi6vXHz7zLBXbxM
Message-ID: <CALSpo=aQyb+E0HHDRoXs0f5vvxJtMpCA546ROkq0e3B-ur9QBg@mail.gmail.com>
Subject: Re: [PATCH 0/8] riscv: add initial support for hardware breakpoints
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Deepak Gupta <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Evan Green <evan@rivosinc.com>, 
	WangYuli <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Nam Cao <namcao@linutronix.de>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Joel Granados <joel.granados@kernel.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Celeste Liu <coelacanthushex@gmail.com>, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Nylon Chen <nylon.chen@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105959_680571_4D0DE8EF 
X-CRM114-Status: GOOD (  17.49  )
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

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMTA6NDfigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBpbml0aWFsIHN1cHBvcnQg
Zm9yIGhhcmR3YXJlIGJyZWFrcG9pbnRzIGFuZAo+IHdhdGNocG9pbnRzIHRvIHRoZSAgUklTQy1W
IGFyY2hpdGVjdHVyZS4gVGhlIGZyYW1ld29yayBpcyBidWlsdCBvbgo+IHRvcCBvZiBwZXJmIHN1
YnN5c3RlbSBhbmQgU0JJIGRlYnVnIHRyaWdnZXIgZXh0ZW5zaW9uLgo+Cj4gQ3VycmVudGx5IGZv
bGxvd2luZyBmZWF0dXJlcyBhcmUgbm90IHN1cHBvcnRlZCBhbmQgYXJlIGluIHdvcmtzOgo+ICAt
IGljb3VudCBmb3Igc2luZ2xlIHN0ZXBwaW5nCj4gIC0gVmlydHVhbGl6YXRpb24gb2YgZGVidWcg
dHJpZ2dlcnMKPiAgLSBrZXJuZWwgc3BhY2UgZGVidWcgdHJpZ2dlcnMKPgo+IFRoZSBTQkkgZGVi
dWcgdHJpZ2dlciBleHRlbnNpb24gY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvYmxvYi9tYXN0ZXIvc3JjL2V4dC1kZWJ1Zy10
cmlnZ2Vycy5hZG9jCj4KPiBUaGUgU2R0cmlnIElTQSBpcyBwYXJ0IG9mIFJJU0MtViBkZWJ1ZyBz
cGVjaWZpY2F0aW9uIHdoaWNoIGNhbiBiZQo+IGZvdW5kIGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1kZWJ1Zy1zcGVjCj4KPiBiYXNlZCBvZmYgdGhlIG9yaWdpbmFsIFJGQyBi
eSBIaW1hbnNodSBDaGF1aGFuIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDI0MDIyMjEyNTA1OS4xMzMzMS0xLWhjaGF1aGFuQHZlbnRhbmFtaWNyby5jb20vCj4KPiBTZWNv
bmQgUkZDIGJ5IEplc3NlIFRhdWJlIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDI1MDcyMjE3MzgyOS45ODQwODItMS1qZXNzZUByaXZvc2luYy5jb20vCj4KPiBIaW1hbnNo
dSBDaGF1aGFuICgyKToKPiAgIHJpc2N2OiBBZGQgU0JJIGRlYnVnIHRyaWdnZXIgZXh0ZW5zaW9u
IGFuZCBmdW5jdGlvbiBpZHMKPiAgIHJpc2N2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgaGFyZHdh
cmUgYnJlYWsvd2F0Y2hwb2ludHMKPgo+IEplc3NlIFRhdWJlICg2KToKPiAgIHJpc2N2OiBBZGQg
aW5zbi5jLCBjb25zb2xpZGF0ZSBpbnN0cnVjdGlvbiBkZWNvZGluZwo+ICAgcmlzY3Y6IGluc246
IEFkZCBnZXRfaW5zbl9ub2ZhdWx0Cj4gICByaXNjdjogaHdfYnJlYWtwb2ludDogVXNlIGljb3Vu
dCBmb3Igc2luZ2xlIHN0ZXBwaW5nCj4gICByaXNjdjogcHRyYWNlOiBBZGQgaHcgYnJlYWtwb2lu
dCBzdXBwb3J0Cj4gICByaXNjdjogcHRyYWNlOiBBZGQgaHcgYnJlYWtwb2ludCByZWdzZXQKPiAg
IHNlbGZ0ZXN0czogcmlzY3Y6IEFkZCB0ZXN0IGZvciBoYXJkd2FyZSBicmVha3BvaW50cwo+Cj4g
IGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYnVnLmggICAgICAgICAgICAgICAgICB8ICAxMiAtCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oICAgICAgICB8ICA1OSArKwo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCAgICAgICAgICAgICAgICAgfCAxMzIgKyst
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2RlYnVnLmggICAgICAgICAgICAgICB8ICAgMyAr
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAgICAgICAgfCAgIDQg
Kwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgICAgICAgICAgICAgfCAgMzMg
Ky0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oICAgICAgICAgIHwgICA5
ICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAy
ICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jICAgICAgICAgICAgIHwgNzYz
ICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9pbnNuLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAxNjUgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAxMDIgKy0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICAgICAgICAgICAgICB8ICAgNCArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAg
ICAgICAgICAgICAgICAgICB8IDE2OSArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
ICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgICAgICAgICAgfCAgOTMgKy0tCj4gIGluY2x1ZGUvdWFwaS9saW51eC9lbGYu
aCAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIHRvb2xzL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYuaCAgICAgICAgICAgICAgICB8ICAgMSArCj4gIHRvb2xzL3BlcmYvdGVzdHMvdGVzdHMu
aCAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9NYWtlZmlsZSAgICAgICAgfCAgIDIgKy0KPiAgLi4uL3NlbGZ0ZXN0cy9yaXNjdi9i
cmVha3BvaW50cy8uZ2l0aWdub3JlICAgIHwgICAxICsKPiAgLi4uL3NlbGZ0ZXN0cy9yaXNjdi9i
cmVha3BvaW50cy9NYWtlZmlsZSAgICAgIHwgIDEzICsKPiAgLi4uL3Jpc2N2L2JyZWFrcG9pbnRz
L2JyZWFrcG9pbnRfdGVzdC5jICAgICAgIHwgMjQ2ICsrKysrKwo+ICAyNCBmaWxlcyBjaGFuZ2Vk
LCAxNjQxIGluc2VydGlvbnMoKyksIDE5MSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9od19icmVha3BvaW50LmMKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2luc24uYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYnJlYWtwb2ludHMvLmdpdGlnbm9yZQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYnJlYWtwb2ludHMv
TWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2JyZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVzdC5jCj4KPiAtLQo+IDIuNDMuMAo+CgpPb3Bz
LCB0aGlzIG1lYW50IHRvIGJlIFYyLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
