Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35635C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 17:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzAiH03iqySERIbxYy49jGoSPbmQdZRxBqJHpw/l4zg=; b=hE+Xz0lEBmbUZB
	6v0mzHgllRD/Akn8EBwyOQEgnmWbmuKEyFP1Rc+54ZT/BOA6U1a8Taz+n8PqnCGOzj49PyqS4xTbz
	LDzRFepyfL7f5mZHrnoZcYBCir4sEHDeOrGoCRJ27iw7oQoM+n0Ku8bCIhmvXxKoQE5f3S4e1BVEa
	iqGgqVXYhmerpI8WI7nREqtwgUzpTgdObxM1YyUb9Mc+MEwGras1VtoQJWdVSgzRe1hF6eXhBKDhX
	nfBbX9uTy20c8P+71Ezg9BKnhMXNFMFWsgiPhFeuI4H1q95SzstktI6Azi49l8AQeppv5Fxl836Du
	X2JCQCoiAuA5NkfB6oCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxXU-0000000CePk-3hkb;
	Fri, 02 Feb 2024 17:41:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxXR-0000000CeOC-3BmV
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 17:41:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a354408e6bfso586769066b.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706895676; x=1707500476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWtC7jO98lUeRBHL4RQhZAFvZjsqfE/uVt4nvdNHZP4=;
        b=cmqovFu3LoIdUzD0kKIdvtOGrXSINJE8PdQl+Np588KWz1PVTHFU8U9SGr9Im9P4Vw
         feHR+0CgWTJIhXbpMyuVLcj0Bft90YcwsopgxBLPKkDpSr135CJF8CyCXmN5S4ZRYnjc
         GJy+fEcqZ1F8xJSF/BKEW4xtVV8y7FHs1YldMDp1P3CCRkqpgUUTrKnxjWAjBZVZjIBQ
         c/bbqKOdDnOtaNoYsDpEGFiN83dBnruXPIrmtRftNL5DDyJqc3XeF6038j5qVwxjJ8nH
         9p9B8ls/WDsY10+PpmSfupHUco0BKrbovXQjiPO9Z6uGvn1BzW0tbu2VLeJ913BVKIkP
         zuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895676; x=1707500476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWtC7jO98lUeRBHL4RQhZAFvZjsqfE/uVt4nvdNHZP4=;
        b=UQ4/g50BgWWpQEg6Ro6p9nquzPSCcKu7BSzP+pf3LxvSDMwzcLpYRPEM48weptgl6K
         r17wxKoNBubd866O5NxnfGySZroNcCa+J7U2F4eJiirXXmcID2WAhX4fWQStfWc/U+Ju
         JJsg/rQKlppYbBJwsbBnOxAaZZQ3fHkktRXi05IUFoxznEaaRQ+4XWIEIBOourOthZn4
         fvpkGt3yw9gDhOvFbrZvi7CKDRIYNZscGZCUjZKHf8ixyXickMbnfJzo1/+XBDqN54oB
         x66BDKmjAQbqJFqAXsvndW3qUt9niYsHJHiQahurMJpkfB3Q+OeVZiXXKn9L7tLZsZ4Q
         PJIw==
X-Gm-Message-State: AOJu0Yx46FM/WFlt/8s45jarYLunKkVqbnnXjBl/TkC1z8jVFd23dAig
	Vflvt20ZcQ2q4hsCpg+Z3Pa+amGyUrK4MsT2B+cE9LClfOY4LchW/KY+seG/QostEKX/HYP937C
	DIVewS2Qn42EO8pJ7ODLaHyPnMkIv1DIn8+5b0A==
X-Google-Smtp-Source: AGHT+IHHACEG53UViD2eXG7vvDC/BBy9cKKGK86pK1KqKt9yPaQGwmh1+pUQisp4lH6+ccNGliBBByhYVThQhkwmoN4=
X-Received: by 2002:a17:907:971a:b0:a37:1778:7d7f with SMTP id
 jg26-20020a170907971a00b00a3717787d7fmr1914343ejc.29.1706895675962; Fri, 02
 Feb 2024 09:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20240202163433.786581-1-abrestic@rivosinc.com>
 <20240202163433.786581-3-abrestic@rivosinc.com> <CAMj1kXH7=9-Ww_z6a4Z5K8MrbH8x17Y3EzYk9Qf-3PL-JgMcww@mail.gmail.com>
In-Reply-To: <CAMj1kXH7=9-Ww_z6a4Z5K8MrbH8x17Y3EzYk9Qf-3PL-JgMcww@mail.gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Fri, 2 Feb 2024 12:41:04 -0500
Message-ID: <CALE4mHq4KhfBd+n2waUpHt48fTRXdBWZyiEJf5a3=hfUA_ue3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: Don't add memblocks for unusable memory
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_094118_013658_716B895B 
X-CRM114-Status: GOOD (  24.49  )
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

T24gRnJpLCBGZWIgMiwgMjAyNCBhdCAxMTo0NeKAr0FNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAyIEZlYiAyMDI0IGF0IDE3OjM0LCBBbmRyZXcg
QnJlc3RpY2tlciA8YWJyZXN0aWNAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGRpbmcg
bWVtYmxvY2tzIChldmVuIGlmIG5vbWFwKSBmb3Igc3VjaCByZWdpb25zIHVubmVjZXNzYXJpbHkg
Y29uc3VtZXMKPiA+IHJlc291cmNlcyBieSBjcmVhdGluZyBzdHJ1Y3QgcGFnZXMgZm9yIG1lbW9y
eSB0aGF0IG1heSBuZXZlciBiZSB1c2VkIG9yLAo+ID4gaW4gdGhlIGNhc2Ugb2Ygc29mdC1yZXNl
cnZlZCByZWdpb25zLCBwcmV2ZW50cyB0aGUgbWVtb3J5IGZyb20gbGF0ZXIKPiA+IGJlaW5nIGhv
dHBsdWdnZWQgaW4gYnkgZGF4X2ttZW0uIFRoaXMgaXMgYWxzbyBjb25zaXN0ZW50IHdpdGggaG93
IHg4Ngo+ID4gaGFuZGxlcyB1bnVzYWJsZSBtZW1vcnkgZm91bmQgaW4gdGhlIEVGSSBtZW1vcnkg
bWFwLgo+ID4KPgo+IHg4NiBkb2Vzbid0IGNhcmUgYXMgbXVjaCBhYm91dCBtZW1vcnkgdnMgZGV2
aWNlIHNlbWFudGljcyBhcyBBUk0gZG9lcy4KPgo+IFRoaXMgYWZmZWN0cyB0aGUgb3V0cHV0IG9m
IG1lbWJsb2NrX2lzX1tyZWdpb25fXW1lbW9yeSgpLCBzbyB3ZSdkIGhhdmUKPiB0byBkb3VibGUg
Y2hlY2sgdGhhdCBub25lIG9mIHRob3NlIHVzZXMgZ2V0IGJyb2tlbiBieSB0aGlzLgo+Cj4gSWYg
dGhlIHNvZnQgcmVzZXJ2ZWQgcmVnaW9ucyBuZWVkIHRvIGJlIG9taXR0ZWQgZnJvbSBtZW1ibG9j
aywgd2UgY2FuCj4gZGVhbCB3aXRoIHRoYXQgc2VwYXJhdGVseSBwZXJoYXBzLCBidXQgY2hhbmdp
bmcgaXQgYXQgdGhpcyBsZXZlbCBzZWVtcwo+IGluYXBwcm9wcmlhdGUgdG8gbWUuCgpTdXJlLCBJ
IGNhbiBjb25zdHJhaW4gdGhpcyB0byBqdXN0IHRoZSBzb2Z0LXJlc2VydmVkIHJlZ2lvbnMuCgot
QW5kcmV3Cgo+Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBCcmVzdGlja2VyIDxhYnJlc3Rp
Y0ByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9lZmktaW5p
dC5jIHwgMTIgKy0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9l
ZmkvZWZpLWluaXQuYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2VmaS1pbml0LmMKPiA+IGluZGV4
IGQ0OTg3ZDAxMzA4MC4uZjA1YmFjYWM4OWI3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9maXJt
d2FyZS9lZmkvZWZpLWluaXQuYwo+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLWlu
aXQuYwo+ID4gQEAgLTI0LDEzICsyNCw2IEBACj4gPgo+ID4gIHVuc2lnbmVkIGxvbmcgX19pbml0
ZGF0YSBzY3JlZW5faW5mb190YWJsZSA9IEVGSV9JTlZBTElEX1RBQkxFX0FERFI7Cj4gPgo+ID4g
LXN0YXRpYyBpbnQgX19pbml0IGlzX21lbW9yeShlZmlfbWVtb3J5X2Rlc2NfdCAqbWQpCj4gPiAt
ewo+ID4gLSAgICAgICBpZiAobWQtPmF0dHJpYnV0ZSAmIChFRklfTUVNT1JZX1dCfEVGSV9NRU1P
UllfV1R8RUZJX01FTU9SWV9XQykpCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiAt
ICAgICAgIHJldHVybiAwOwo+ID4gLX0KPiA+IC0KPiA+ICAvKgo+ID4gICAqIFRyYW5zbGF0ZSBh
IEVGSSB2aXJ0dWFsIGFkZHJlc3MgaW50byBhIHBoeXNpY2FsIGFkZHJlc3M6IHRoaXMgaXMgbmVj
ZXNzYXJ5LAo+ID4gICAqIGFzIHNvbWUgZGF0YSBtZW1iZXJzIG9mIHRoZSBFRkkgc3lzdGVtIHRh
YmxlIGFyZSB2aXJ0dWFsbHkgcmVtYXBwZWQgYWZ0ZXIKPiA+IEBAIC0xOTUsMTIgKzE4OCw5IEBA
IHN0YXRpYyBfX2luaXQgdm9pZCByZXNlcnZlX3JlZ2lvbnModm9pZCkKPiA+ICAgICAgICAgICAg
ICAgICBtZW1yYW5nZV9lZmlfdG9fbmF0aXZlKCZwYWRkciwgJm5wYWdlcyk7Cj4gPiAgICAgICAg
ICAgICAgICAgc2l6ZSA9IG5wYWdlcyA8PCBQQUdFX1NISUZUOwo+ID4KPiA+IC0gICAgICAgICAg
ICAgICBpZiAoaXNfbWVtb3J5KG1kKSkgewo+ID4gKyAgICAgICAgICAgICAgIGlmIChpc191c2Fi
bGVfbWVtb3J5KG1kKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZWFybHlfaW5pdF9k
dF9hZGRfbWVtb3J5X2FyY2gocGFkZHIsIHNpemUpOwo+ID4KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGlmICghaXNfdXNhYmxlX21lbW9yeShtZCkpCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1lbWJsb2NrX21hcmtfbm9tYXAocGFkZHIsIHNpemUpOwo+ID4gLQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgLyoga2VlcCBBQ1BJIHJlY2xhaW0gbWVtb3J5IGludGFj
dCBmb3Iga2V4ZWMgZXRjLiAqLwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1kLT50
eXBlID09IEVGSV9BQ1BJX1JFQ0xBSU1fTUVNT1JZKQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKHBhZGRyLCBzaXplKTsKPiA+IC0tCj4gPiAyLjM0
LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
