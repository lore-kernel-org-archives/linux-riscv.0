Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403F0C001DB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=021q2SjsCe59WdiWMKG7hFmoK51n8P1WL9Bs5/sGEG4=; b=v3k7zKiIkss2Wj
	jRQRj9GEj9mnF72g0wWkuAg+dtYDshesYErGzXb835JzR4ItBS9Kjb2SU1GgQVSxzfP9FoIpcL6RA
	L+KhgeQHTvIOX5pQ5wz/E4nYVihIihP/9K9A07RJ0jOhcVcTsSLuSdItedsM6B4CUU9Tg5ume+j17
	EmTQ5xHyU54a8CkAiTxCwY1M5qqQy2R0R4ODdKKMJeaRaSyuJQ9vWzcwdkGDaAfO0xXC3Q700g7sH
	WHL82fjprEhwKxcDKT/QduA/eDHXJnhLQVWYSjf1H+HGHQL9GAJNsKtvqL5bJZ4AodHT5J95iqJfc
	oaiLjENUnTA3fRK6uUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUnGw-00DMJB-1F;
	Sat, 12 Aug 2023 11:59:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUnGt-00DMIg-1L
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 11:59:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B30AF618C9
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 11:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CA2C433CD
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691841545;
	bh=joc6twYzyq/OMO7DgVZmPVJLx3nC/hyckB9nZLCu7yk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JkRy1szDOkp2ampIAHbMPZ6Gd3xEhRJhWl101TXmcwADC3oxsnYclRFJ+eNvYamEF
	 5ZbkGpypYLY31+PWcSK/3+9ZoKF4fFSu4JsFEYZ73/ifbYovn0DGbIGf2q7sWJiHdw
	 tuv6FwmuNv90A/LTFB1zrzqr3Zp3Qip7rAtrsGEy9rjwVLn9j7sFuNN3Tw5O5ZmSqn
	 jEkiWNZKtgsd/M7fuaqJX9eC5bv7iEB+QoaotobAAIZsNRXl2jfQHeqDfwqjV/RWLN
	 D4BAopVjMquIgW5s6llWkHs7Cr5Kc2lzbaZzHGQ/urK/bjpZREuBEK5qnsSXyWuo74
	 1FEY4M/Z3UoSg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe0c566788so4407380e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 04:59:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyeQNtyiTyThMgAyHGTHlZt4tPNZtREMfgy9um3T9qD9tKZ6DCi
	odDpoO9VH+pMC3V1SDa1nc8bDUejikw6FIBSnz4=
X-Google-Smtp-Source: AGHT+IHZj996J8JNz9Gnnk7beXztJdnkbYwezXhNN/AZcdC/47G1QWQSmWiznUlqQMXlkgsuao6dE13FmA0yW5tI3jo=
X-Received: by 2002:a05:6512:2206:b0:4fe:19ef:879e with SMTP id
 h6-20020a056512220600b004fe19ef879emr3546527lfu.28.1691841543485; Sat, 12 Aug
 2023 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230724182129.843687-1-dfustini@baylibre.com>
In-Reply-To: <20230724182129.843687-1-dfustini@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Aug 2023 19:58:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRNjk_3z6QWGBs7vMNqTQuUaFvA-XsPe7Ek+YL6UzwWpQ@mail.gmail.com>
Message-ID: <CAJF2gTRNjk_3z6QWGBs7vMNqTQuUaFvA-XsPe7Ek+YL6UzwWpQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_045907_559329_57806B90 
X-CRM114-Status: GOOD (  17.78  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gVHVlLCBKdWwgMjUs
IDIwMjMgYXQgMjoyMeKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPiB3
cm90ZToKPgo+IE1vZGlmeSB0aGUgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgZm9yIGR1YWwgbGlj
ZW5zZSBvZiBHUEwtMi4wIE9SIE1JVC4KPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8
ZGZ1c3RpbmlAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFk
L3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0c2kgfCAyICstCj4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMgICAgICB8IDIgKy0KPiAgYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IEppc2hl
bmcgWmhhbmcgYW5kIEd1byBSZW4gLSBJIHRob3VnaHQgSSB3b3VsZCBwb3N0IHRoaXMgcGF0Y2gg
YmFzZWQgb24KPiB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgdGhyZWFkIGFib3V0IHRoZSBCZWFnbGVW
IEFoZWFkIHBhdGNoZXMuCj4KPiBNZXNzYWdlLUlEOgo+IDIwMjMwNzIyLXVwc3RyZWFtLWJlYWds
ZXYtYWhlYWQtZHRzLXYxLTAtY2NkYTUxMTM1N2Y0QGJheWxpYnJlLmNvbQo+Cj4gVGhhbmtzLAo+
IERyZXcKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1s
aWNoZWUtbW9kdWxlLTRhLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1s
aWNoZWUtbW9kdWxlLTRhLmR0c2kKPiBpbmRleCA0YjAyNDlhYzcxMGYuLmE4MDJhYjExMDQyOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9k
dWxlLTRhLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNo
ZWUtbW9kdWxlLTRhLmR0c2kKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
IE9SIE1JVCkKPiAgLyoKPiAgICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4KPiAgICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Ro
ZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gaW5kZXggYTEyNDhiMmVlM2EzLi45YTM4ODRh
NzNlMTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGlj
aGVlLXBpLTRhLmR0cwo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxp
Y2hlZS1waS00YS5kdHMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IE1JVCkKPiAgLyoKPiAgICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpzemhh
bmdAa2VybmVsLm9yZz4KPiAgICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
dGhlYWQvdGgxNTIwLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNp
Cj4gaW5kZXggNTZhNzMxMzRiNDllLi5jZTcwODE4M2I2ZjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvdGhlYWQvdGgxNTIwLmR0c2kKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wIE9SIE1JVCkKPiAgLyoKPiAgICogQ29weXJpZ2h0IChDKSAyMDIxIEFsaWJhYmEgR3JvdXAg
SG9sZGluZyBMaW1pdGVkLgo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
