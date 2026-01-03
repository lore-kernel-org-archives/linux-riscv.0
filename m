Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F5FC6175
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm7/h51RD7uDooMcBoX8Ft934V4gsURlUQZanYUS4kU=; b=Tq5oFFiFXVORH/
	4eAbJTplpzu7rhnZlQclH4GZmIR27Imevv3aA2teKrUGppAOyBrrvnqb+HXrmvUUWFLllLm8cm0NL
	p5yyHRz2NIRcUZtXqLQpG0MuVYxj/osAHqKcMTFwMHMnJixEhYo3x6192Mp+4hYVvX3Du0Ui3vKAX
	KhqmLF6umvX5rcd0bKsPCfPDW8nsbkuLA2CNSfgjCSJljha/TFulGDRe9mfwBxs1E2JKz1QqlMO/E
	63FK5Gczck/hWOFPaj+mJ+nAIXpszqNJN0TlMHZlpyocbriNo0cSXtneE9PSf2yzEknLgBsVsGtQg
	hDjfC7dNEUq3f1XktbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3v9-00000009SGn-3Eek;
	Sat, 03 Jan 2026 15:52:03 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3v7-00000009SGC-1qld
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:52:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-598f59996aaso15248333e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767455519; x=1768060319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VTfCf7S9mTtGdsUwE0Got2y+5Zig2N8txuihMzqCLQ=;
        b=guRV70ejJRM+xeZVh3lq09cMGilu/HVjzuSQUepeLWstmyjVoB2LWBzx59xNxtZQPv
         B3RRl5wjFjIHqPptr7PRDKca/e303Lw7WxlGlKu/zFZ+Sm0F1GRCX3XrV28LUTvlikaT
         Epacix3rS3E6bsbqPWk8+8nqtFQXq0V2JgKg25YPCqx9BkjF0XCGMzROJZUGzNaaEnNj
         IhP0Xf7z36ZEoB65VS217IPb+kQ/F/fn7RaqSpbYcD3tRAbYaIU6GDSuHqhK1epkz9H7
         0ETApaeV1ajfu1NYku4griT3gbhb2NFkZk0xvpMXAYhde67eH3oYjmspgYAoMudBbEhN
         Uuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767455519; x=1768060319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VTfCf7S9mTtGdsUwE0Got2y+5Zig2N8txuihMzqCLQ=;
        b=Dn5zU66dSfKro6dwLEcQmKGiaI+XX/wNTewsm4Y0vhSMsdZS6lPPev2yEjl4egJSmD
         qPkEbnFX6BcM96kVsABoBBacw1QsJOwPHML+X+sX23CFKSA932lWBkIRqBwkr8MdYRzr
         bDeiKx5jqM9+uY8TWqHq44JKR3LeQoYTt8v4hdwMYpgkT3e/2tyF30jjpDPG+g4O3fr2
         aJdtj3VU0HWEt7XxUH6LWzp4wC3zIrgmzGJ1MhyplVGReyBnPNrSotrVXQK4Fz0iO7AK
         gfl5h7O5Ki+s2ywXpM+Am8T+WJ1Cf5PkiK2g4ttoZIWVKpJFJlfEWXAb8QUylnOgysVn
         ALPA==
X-Forwarded-Encrypted: i=1; AJvYcCU77GeBBgsnZAdwUQwvDa5+BST4VGId7go++tXN8DFmUQf3QV517gaV2C5IbUYPBKMYV4DyTKRxYI1Alg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw07SBnd/T2nFBDJeGsfNSFCsxM++SyJFaUfA5NBWqmc1WLzZh+
	dD2ij/Kfm224XZv7928HJQUyhLMKeglrR9DsVQ2in3OuTwZT69/phrySLTx6SN/3D019+co9igb
	dn+lenCJh6wY61yZURDPtqsXOmhafF2Q1fvxa46d9EA==
X-Gm-Gg: AY/fxX7DRVkLWvPH195E4KYgIjCQdQpuA4q6ugbMSsvOfka3UH1K8E8MOmB62av2N6a
	8g/NFhyrxpjwyzPlbYJT6PsxjQIlMOCn4SqlIjYFbQOJwbw1w1smu8JBGGKwrnrZE4p8bONt/Xb
	Ja/9lRy+UIPS67XW3oAcOltvTZh2+K8zQSabAJHjtGxkfAbYhRq0t8htRovNk6T9niYYB1HkNp+
	BRNgGkB//LtFpQllh74lplAzjQS7EywH5CHXAR89mR94jWfcF3jHziRbzajO32ATPCSKM5mMyTW
	ofGihMlPBUNFpmOHq6r/OQH1+6jg
X-Google-Smtp-Source: AGHT+IECgA1I6BXecBzxlb05yweSyZkYzSmaR6UTloWrNaAyLATBVI7vvlv38IDmKwWKANsc7POa7hpX9pq6UqGyXBg=
X-Received: by 2002:a05:6512:b0d:b0:594:74f9:3b3 with SMTP id
 2adb3069b0e04-59a17d3dc55mr13332862e87.29.1767455519305; Sat, 03 Jan 2026
 07:51:59 -0800 (PST)
MIME-Version: 1.0
References: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
In-Reply-To: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Jan 2026 21:21:48 +0530
X-Gm-Features: AQt7F2ovNypTlRVUHMFIVpLY8_pGpQgHJqQS8rMOdjn7TMmSCEhMbjwFJFAXlPY
Message-ID: <CAK9=C2XKuHH9pyv-ozBOh=W6KTzEgSF0staZ53n+-p+-S0qkFA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: adapt to syscore API passing context data
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, virendrasinhchauhan1206@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_075201_504672_5E288925 
X-CRM114-Status: GOOD (  22.11  )
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

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgNDo0MuKAr1BNIFNhbmpheSBDaGl0cm9kYQo8c2FuamF5
ZW1iZWRkZWRzZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogU2FuamF5IENoaXRyb2RhIDxz
YW5qYXllbWJlZGRlZHNlQGdtYWlsLmNvbT4KPgo+IGxpbnV4LW5leHQgY29tbWl0IGE5N2ZiYzNl
ZTNlMiAoInN5c2NvcmU6IFBhc3MgY29udGV4dCBkYXRhIHRvIGNhbGxiYWNrcyIpCj4gY2hhbmdl
ZCB0aGUgc3lzY29yZSBBUEkgdG8gcmVnaXN0ZXIgcGVyLWluc3RhbmNlIGNvbnRleHQgYWxvbmdz
aWRlIHRoZQo+IHN5c2NvcmUgb3BlcmF0aW9ucyBhbmQgdG8gcGFzcyB0aGF0IGNvbnRleHQgaW50
byBjYWxsYmFja3MuIEFzIGEgcmVzdWx0LAo+IGRyaXZlcnMgbXVzdCBubyBsb25nZXIgcmVseSBv
biBnbG9iYWwgc3RhdGUgb3IgaW1wbGljaXQgZGF0YSBhY2Nlc3MgaW4KPiB0aGVpciBzeXNjb3Jl
IHN1c3BlbmQvcmVzdW1lIGhhbmRsZXJzLgo+Cj4gVGhlIFJJU0MtViBBUExJQyBkcml2ZXIgc3Rh
cnRlZCBwcmVzZXJ2aW5nIHN0YXRlIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSwKPiBidXQgaXRzIHN5
c2NvcmUgdXNhZ2Ugc3RpbGwgYXNzdW1lZCB0aGUgb2xkIEFQSS4gQnVpbGRpbmcgYWdhaW5zdAo+
IGxpbnV4LW5leHQgYWZ0ZXIgYTk3ZmJjM2VlM2UyIGZhaWxzIGJlY2F1c2UgdGhlIGNhbGxiYWNr
cyBkb27igJl0IHJlY2VpdmUKPiB0aGUgbmVjZXNzYXJ5IGRyaXZlciBjb250ZXh0Lgo+Cj4gVXBk
YXRlIGlycS1yaXNjdi1hcGxpYyB0byB0aGUgbmV3IHN5c2NvcmUgQVBJOgo+ICAgKiByZWdpc3Rl
ciBzeXNjb3JlIHdpdGggZHJpdmVyLXByaXZhdGUgY29udGV4dCwKPiAgICogcGFzcyB0aGUgY29u
dGV4dCB0byBzYXZlL3Jlc3RvcmUgaGVscGVycywKPiAgICogc3RvcCB1c2luZyBpbXBsaWNpdCBn
bG9iYWxzIGluIHN5c2NvcmUgcGF0aHMuCj4KPiBUaGlzIGZpeGVzIHRoZSBjb21waWxhdGlvbiBl
cnJvciBhbmQgcmVzdG9yZXMgY29ycmVjdCBBUExJQyBzdGF0ZQo+IGhhbmRsaW5nIGFjcm9zcyBz
dXNwZW5kL3Jlc3VtZSB3aXRoIHRoZSBuZXcgc3lzY29yZSBpbnRlcmZhY2UuCj4KPiBGaXhlczog
YTk3ZmJjM2VlM2UyICgic3lzY29yZTogUGFzcyBjb250ZXh0IGRhdGEgdG8gY2FsbGJhY2tzIikK
PiBGaXhlczogMWM1NDZiYjQzMzYxODg0MyAoImlycWNoaXAvcmlzY3YtYXBsaWM6IFByZXNlcnZl
IEFQTElDIHN0YXRlcyBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUiKQo+IFNpZ25lZC1vZmYtYnk6IFNh
bmpheSBDaGl0cm9kYSA8c2FuamF5ZW1iZWRkZWRzZUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jIHwgMTIgKysrKysrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwo+IGluZGV4IGI3NjA5NDJlNTdmOS4uMTI4M2Q2
ZTY5ZjViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFp
bi5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiBAQCAt
ODksNyArODksNyBAQCBzdGF0aWMgdm9pZCBhcGxpY19zYXZlX3N0YXRlcyhzdHJ1Y3QgYXBsaWNf
cHJpdiAqcHJpdikKPiAgICAgICAgIH0KPiAgfQo+Cj4gLXN0YXRpYyBpbnQgYXBsaWNfc3lzY29y
ZV9zdXNwZW5kKHZvaWQpCj4gK3N0YXRpYyBpbnQgYXBsaWNfc3lzY29yZV9zdXNwZW5kKHZvaWQg
KmRhdGEpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBhcGxpY19wcml2ICpwcml2Owo+Cj4gQEAgLTk5
LDcgKzk5LDcgQEAgc3RhdGljIGludCBhcGxpY19zeXNjb3JlX3N1c3BlbmQodm9pZCkKPiAgICAg
ICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgYXBsaWNfc3lzY29yZV9yZXN1bWUo
dm9pZCkKPiArc3RhdGljIHZvaWQgYXBsaWNfc3lzY29yZV9yZXN1bWUodm9pZCAqZGF0YSkKPiAg
ewo+ICAgICAgICAgc3RydWN0IGFwbGljX3ByaXYgKnByaXY7Cj4KPiBAQCAtMTA3LDExICsxMDcs
MTUgQEAgc3RhdGljIHZvaWQgYXBsaWNfc3lzY29yZV9yZXN1bWUodm9pZCkKPiAgICAgICAgICAg
ICAgICAgYXBsaWNfcmVzdG9yZV9zdGF0ZXMocHJpdik7Cj4gIH0KPgo+IC1zdGF0aWMgc3RydWN0
IHN5c2NvcmVfb3BzIGFwbGljX3N5c2NvcmVfb3BzID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHN5c2NvcmVfb3BzIGFwbGljX3N5c2NvcmVfb3BzID0gewo+ICAgICAgICAgLnN1c3BlbmQgPSBh
cGxpY19zeXNjb3JlX3N1c3BlbmQsCj4gICAgICAgICAucmVzdW1lID0gYXBsaWNfc3lzY29yZV9y
ZXN1bWUsCj4gIH07Cj4KPiArc3RhdGljIHN0cnVjdCBzeXNjb3JlIGFwbGljX3N5c2NvcmUgPSB7
Cj4gKyAgICAgICAub3BzID0gJmFwbGljX3N5c2NvcmVfb3BzLAo+ICt9Owo+ICsKPiAgc3RhdGlj
IGludCBhcGxpY19wbV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25l
ZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0YSkKPiAgewo+ICAgICAgICAgc3RydWN0IGFwbGljX3By
aXYgKnByaXYgPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBhcGxpY19wcml2LCBnZW5wZF9uYik7
Cj4gQEAgLTM3Miw3ICszNzYsNyBAQCBzdGF0aWMgaW50IGFwbGljX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCBy
YywgImZhaWxlZCB0byBzZXR1cCBBUExJQyBpbiAlcyBtb2RlXG4iLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1zaV9tb2RlID8gIk1TSSIgOiAiZGlyZWN0Iik7Cj4gICAgICAgICBl
bHNlCj4gLSAgICAgICAgICAgICAgIHJlZ2lzdGVyX3N5c2NvcmVfb3BzKCZhcGxpY19zeXNjb3Jl
X29wcyk7Cj4gKyAgICAgICAgICAgICAgIHJlZ2lzdGVyX3N5c2NvcmUoJmFwbGljX3N5c2NvcmUp
Owo+Cj4gICNpZmRlZiBDT05GSUdfQUNQSQo+ICAgICAgICAgaWYgKCFhY3BpX2Rpc2FibGVkKQo+
IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
