Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23B8C35FE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSEYLgJyEBNDnD+vDhISX1b5bXEWmHiPSZ6sXD19eqA=; b=EzzcTAHEg3YqP6
	3JYVLEtYdzi9a4rZ7XcqMuX3yt2PDfkXvQmkRQ2GEwkqk7WReUXN5mD8YATt22ZD4FNVpzl55Ulk5
	NWTHpOH7QMKeZUJnrMM8J0lGlERvOg4pC4DB3G5oPKvpH0cyoTB3HDOwqQRLGXi5mbOHgK89nYy59
	k1TKVSMq1SGRAQIjXMdlDvWEyRNtAJOZdSkRvFQ0ZWIjZXQX+Py++bGEIiO+J7akbtqQ61wGE9zGq
	0LPRHQouHC+Q+Vpg6Pjy2uek4+4zlKkfCbuoh3R3wNpdCgqWCPDjxV/AOKBRWcmMOETvBz/nUY1TL
	mzaB33ywt6Q9aLTzogrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spjld-00000001jUK-4Atx;
	Sun, 15 Sep 2024 07:33:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spjkY-00000001jNX-06MJ;
	Sun, 15 Sep 2024 07:32:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso566728766b.0;
        Sun, 15 Sep 2024 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726385568; x=1726990368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeRHQu+yKzQUqrXbd5lul2wLwuoHFUxcLP2h5VUYKXk=;
        b=XjAq5RC2X8/iPD2UGRx65CUyToxLRNSIGRknh/fbVRlUp38BhIzP5nA00CZlbUedEC
         UiKR7MLYLty5ckxwlGCyFEIMZaKPlOwh3om2Su8V4ayw6qK1lukipEulDwl9RYhjMMit
         +PF6ZkA8pdyEvEo+H/8Rm1PBMWTTseC1s/gUMCA1OZTiXraFBvyJc1DcGrE+7MridNAW
         ixg6LQy79dbtZ80vl9WeIdkcnJtAr1qzr4ce+nTXM0ttiGngdmTWf9WJanmf/rWEj5Z5
         Nb3gtnectFXsoXO8sMnRKKSs5mijug6M5m1ofsIBSDia8VHH7+ERqlGrAffstNQeC2lD
         bJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726385568; x=1726990368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeRHQu+yKzQUqrXbd5lul2wLwuoHFUxcLP2h5VUYKXk=;
        b=WbWXDYFToDwokuVGrs4VXBf597EOlf2+c9Mzqk+wDOeBQ7JACYRZIsqGFmKaCfYjAF
         Cw7WPEqcUoF5jgOM9N9jPR7dBxNMOSb0ajrOICldVZBtIMjqODtlkCfxPUAiNcmGglGa
         hVqFU4p2LuEt4DmgMDbDT1LXuXxk4uW/ym4hv2h0oF7Her7O05s8Fj+DtTBdpzXNHsuS
         8m2emySsvoZ5Pfm2NbiKkuZ6wxiJMjq+00A5+p+IsxnO0PJ7kYP+ZFn40Sh4ybdw4GRe
         7Pbdjoecg8jTTXK5+UXJgjSBMhb96/phkf822203NX7kKvyhehnzjhU6yLxY2wVLD9rg
         yVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2neoMG2TZ/frmGrMKiWy0GiBOPl5QJkBc0mMUAPp45jXUwd2+lypktaL2NhkokrivsGyEepXNdMVrJfTG4R4B@lists.infradead.org, AJvYcCWfG3Vr1L1wVmUJTac9peMFy/WJLSS/ndLcr59oj0Si1F1FyqVn++vsL8RswA4J8iYxTZUIwkGWLXCqPLg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdnm/E+hONtw+lRVdgE2yezYLG4fmct8//8XJS887iwP8eyWVm
	MaZ3mT/cmS2ijRWsq1bRkzQMFOTIXKom1AH7CmM/IAmIVWodEuWH
X-Google-Smtp-Source: AGHT+IGlHUAsnPjOFFuTn/tXNwH8GByOCS4k9zUVf6iXg3eJnbjo7p2RPWPflOmT8NKEozFzWvNMPQ==
X-Received: by 2002:a17:907:e28f:b0:a8d:2ab2:c99e with SMTP id a640c23a62f3a-a9029730615mr1197571366b.55.1726385566847;
        Sun, 15 Sep 2024 00:32:46 -0700 (PDT)
Received: from ?IPV6:2003:df:bf21:aa00:bafe:d6:9476:f8d4? (p200300dfbf21aa00bafe00d69476f8d4.dip0.t-ipconnect.de. [2003:df:bf21:aa00:bafe:d6:9476:f8d4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613205b8sm163145166b.188.2024.09.15.00.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 00:32:46 -0700 (PDT)
Message-ID: <c7c5a16b-d033-4b46-8994-259c55bfd8b1@gmail.com>
Date: Sun, 15 Sep 2024 09:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>, Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_003250_092113_C7930735 
X-CRM114-Status: GOOD (  26.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW0gMTMuMDkuMjQgdW0gMjM6NDQgc2NocmllYiBBbGljZSBSeWhsOgo+IE9uIEZyaSwgU2VwIDEz
LCAyMDI0IGF0IDExOjE44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPj4KPj4gT24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMTI6MDg6MjBBTSArMDIwMCwgTWlndWVs
IE9qZWRhIHdyb3RlOgo+Pj4gT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTA6MjPigK9BTSBBbGlj
ZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBBZGQgYWxsIG9m
IHRoZSBmbGFncyB0aGF0IGFyZSBuZWVkZWQgdG8gc3VwcG9ydCB0aGUgc2hhZG93IGNhbGwgc3Rh
Y2sKPj4+PiAoU0NTKSBzYW5pdGl6ZXIgd2l0aCBSdXN0LCBhbmQgdXBkYXRlcyBLY29uZmlnIHRv
IGFsbG93IG9ubHkKPj4+PiBjb25maWd1cmF0aW9ucyB0aGF0IHdvcmsuCj4+Pgo+Pj4gQXBwbGll
ZCB0byBgcnVzdC1uZXh0YCAtLSB0aGFua3MgZXZlcnlvbmUhCj4+Pgo+Pj4gUGF1bC9QYWxtZXIv
QWxiZXJ0L1JJU0MtVjogSSB0aGluayB5b3Ugd2VyZSBub3QgQ2MnZCAoYXQgbGVhc3QgaW4gdGhp
cwo+Pj4gdmVyc2lvbj8pLCBzbyBwbGVhc2Ugc2hvdXQgaWYgeW91IGhhdmUgYSBwcm9ibGVtIHdp
dGggdGhpcy4KPj4KPj4gRm9yIHNvbWUgcmVhc29uIEkgZGVsZXRlZCB0aGUgc2VyaWVzIGZyb20g
bXkgbWFpbGJveCwgbXVzdCd2ZSBiZWVuIGluCj4+IGR0LWJpbmRpbmcgcmV2aWV3IG1vZGUgYW5k
IGhpdCBjdHJsICsgZC4gSSd2ZSBiZWVuIGF3YXkgYW5kIGJ1c3ksIHNvIG15Cj4+IGFwb2xvZ2ll
cyBBbGljZSBmb3Igbm90IHRyeWluZyB0aGlzIG91dCBzb29uZXIuCj4+IEl0J3Mgc29ydGEgYW5u
b3lpbmcgdG8gdGVzdCBydXN0ICsgc2NzIG9uIHJpc2N2LCBjb3MgeW91IG5lZWQgKHVubGVzcyBJ
Cj4+IGFtIG1pc3Rha2VuKSBsbHZtLTE5LiBsbHZtLTE4ICsgcnVzdCBidWlsdCBmaW5lLCBidXQg
aGFzIG5vIFNDUy4KPj4KPj4gbGx2bS0xOSArIHJ1c3QgZmFpbGVkIHRvIGJ1aWxkIGZvciBtZSBy
aXNjdiwgcHJvZHVjaW5nOgo+Pgo+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3N0dWZmL2xpbnV4
L3J1c3QvaGVscGVycy9oZWxwZXJzLmM6MjI6Cj4+IC9zdHVmZi9saW51eC9ydXN0L2hlbHBlcnMv
c3BpbmxvY2suYzoxMDoyMzogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAnc3Bp
bmxvY2tfY2hlY2snOyBJU08gQzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBm
dW5jdGlvbiBkZWNsYXJhdGlvbnMgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4+
IF9fcmF3X3NwaW5fbG9ja19pbml0KHNwaW5sb2NrX2NoZWNrKGxvY2spLCBuYW1lLCBrZXksIExE
X1dBSVRfQ09ORklHKTsKPj4gXgo+PiAvc3R1ZmYvbGludXgvcnVzdC9oZWxwZXJzL3NwaW5sb2Nr
LmM6MTA6MjM6IGVycm9yOiBpbmNvbXBhdGlibGUgaW50ZWdlciB0byBwb2ludGVyIGNvbnZlcnNp
b24gcGFzc2luZyAnaW50JyB0byBwYXJhbWV0ZXIgb2YgdHlwZSAncmF3X3NwaW5sb2NrX3QgKicg
KGFrYSAnc3RydWN0IHJhd19zcGlubG9jayAqJykgWy1XaW50LWNvbnZlcnNpb25dCj4+IF9fcmF3
X3NwaW5fbG9ja19pbml0KHNwaW5sb2NrX2NoZWNrKGxvY2spLCBuYW1lLCBrZXksIExEX1dBSVRf
Q09ORklHKTsKPj4gXn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gL3N0dWZmL2xpbnV4L2luY2x1ZGUv
bGludXgvc3BpbmxvY2suaDoxMDE6NTI6IG5vdGU6IHBhc3NpbmcgYXJndW1lbnQgdG8gcGFyYW1l
dGVyICdsb2NrJyBoZXJlCj4+IGV4dGVybiB2b2lkIF9fcmF3X3NwaW5fbG9ja19pbml0KHJhd19z
cGlubG9ja190ICpsb2NrLCBjb25zdCBjaGFyICpuYW1lLAo+PiBeCj4+IDIgZXJyb3JzIGdlbmVy
YXRlZC4KPj4KPj4gVGhpcyBvY2N1cnMgYmVjYXVzZSBJIGhhdmUgREVCVUdfU1BJTkxPQ0sgZW5h
YmxlZC4gSSBkaWRuJ3QgY2hlY2sgd2h5LAo+PiBidXQgQW5kcmVhcyBzZWVtcyB0byBoYXZlIGlu
dHJvZHVjZWQgdGhhdCBjb2RlIC0gbHVja2lseSBoZSdzIGFscmVhZHkgb24KPj4gQ0MgaGVyZSA6
KQo+Pgo+PiBXaXRoIHRoYXQgZGlzYWJsZWQsIHRoZXJlIGFyZSBkb3plbnMgb2Ygd2FybmluZ3Mg
YWxvbmcgdGhlIGxpbmVzIG9mOgo+PiAvc3R1ZmYvbGludXgvcnVzdC9oZWxwZXJzL2Vyci5jOjY6
MTQ6IHdhcm5pbmc6IHN5bWJvbCAncnVzdF9oZWxwZXJfRVJSX1BUUicgd2FzIG5vdCBkZWNsYXJl
ZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4gSWYgdGhvc2UgYXJlIG9rYXkgZm9yIHJ1c3QgY29k
ZSwgaXQgd291bGQgYmUgcmF0aGVyIGhlbHBmdWwgaWYgdGhlCj4+IHdhcm5pbmdzIGNvdWxkIGJl
IGRpc2FibGVkIC0gb3RoZXJ3aXNlIHRoZXkgc2hvdWxkIHJlYWxseSBiZSBmaXhlZC4KPj4KPj4g
Rm9sbG93aW5nIHRoYXQsIEkgZ290IGEgYnVpbGQgZXJyb3I6Cj4+Cj4+IGVycm9yW0UwNDI1XTog
Y2Fubm90IGZpbmQgZnVuY3Rpb24gYF9fbXV0ZXhfaW5pdGAgaW4gY3JhdGUgYGJpbmRpbmdzYAo+
PiAtLT4gL3N0dWZmL2xpbnV4L3J1c3Qva2VybmVsL3N5bmMvbG9jay9tdXRleC5yczoxMDQ6MjgK
Pj4gfAo+PiAxMDQgICB8ICAgICAgICAgICB1bnNhZmUgeyBiaW5kaW5nczo6X19tdXRleF9pbml0
KHB0ciwgbmFtZSwga2V5KSB9Cj4+IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5e
Xl5eXl5eXl4gaGVscDogYSBmdW5jdGlvbiB3aXRoIGEgc2ltaWxhciBuYW1lIGV4aXN0czogYF9f
bXV0ZXhfcnRfaW5pdGAKPj4gfAo+PiA6OjogL3N0dWZmL2Jyc2RrL3dvcmsvbGludXgvcnVzdC9i
aW5kaW5ncy9iaW5kaW5nc19nZW5lcmF0ZWQucnM6MTI5MDc6NQo+PiB8Cj4+IDEyOTA3IHwgLyAg
ICAgcHViIGZuIF9fbXV0ZXhfcnRfaW5pdCgKPj4gMTI5MDggfCB8ICAgICAgICAgbG9jazogKm11
dCBtdXRleCwKPj4gMTI5MDkgfCB8ICAgICAgICAgbmFtZTogKmNvbnN0IGNvcmU6OmZmaTo6Y19j
aGFyLAo+PiAxMjkxMCB8IHwgICAgICAgICBrZXk6ICptdXQgbG9ja19jbGFzc19rZXksCj4+IDEy
OTExIHwgfCAgICAgKTsKPj4gfCB8X19fX18tIHNpbWlsYXJseSBuYW1lZCBmdW5jdGlvbiBgX19t
dXRleF9ydF9pbml0YCBkZWZpbmVkIGhlcmUKPj4KPj4gZXJyb3I6IGFib3J0aW5nIGR1ZSB0byAx
IHByZXZpb3VzIGVycm9yCj4gCj4gVGhpcyBsb29rcyBsaWtlIGFuIHVucmVsYXRlZCBwcm9ibGVt
IHRvIG1lLiAKCgpZZXMsIGl0IGlzIHVucmVsYXRlZCB0byB0aGlzIGNoYW5nZS4gSXQgaXMgUFJF
RU1QVF9SVCB1c2FnZSByZWxhdGVkLiBJIAp0aGluayB3ZSBjb3VsZCBhZGQgc29tZXRoaW5nIGxp
a2UKCiNpZmRlZiBDT05GSUdfUFJFRU1QVF9SVAp2b2lkIHJ1c3RfaGVscGVyX19fbXV0ZXhfaW5p
dChzdHJ1Y3QgbXV0ZXggKm11dGV4LCBjb25zdCBjaGFyICpuYW1lLAoJCQkgc3RydWN0IGxvY2tf
Y2xhc3Nfa2V5ICprZXkpCnsKCXJldHVybiBfX211dGV4X2luaXQobXV0ZXgsIG5hbWUsIGtleSk7
Cn0KI2VuZGlmCgp0byBoZWxwZXJzIHRvIGZpeAoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9ydXN0L2tlcm5l
bC9zeW5jL2xvY2svbXV0ZXgucnM/JmlkPTZkMjBkNjI5YzZkODU3NWJlOThlZWViZTQ5YTE2ZmIy
ZDdiMzIzNTAKCj8KCkV4cGxhbmF0aW9uOiBMb29raW5nIGF0CgpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9pbmNs
dWRlL2xpbnV4L211dGV4Lmg/I241MgoKd2UgaGF2ZSAoc2ltcGxpZmllZCkKCiNpZm5kZWYgQ09O
RklHX1BSRUVNUFRfUlQKZXh0ZXJuIHZvaWQgX19tdXRleF9pbml0KHN0cnVjdCBtdXRleCAqbG9j
aywgY29uc3QgY2hhciAqbmFtZSwKCQkJIHN0cnVjdCBsb2NrX2NsYXNzX2tleSAqa2V5KTsKI2Vs
c2UKI2RlZmluZSBfX211dGV4X2luaXQobXV0ZXgsIG5hbWUsIGtleSkJCQlcCmRvIHsJCQkJCQkJ
XAoJcnRfbXV0ZXhfYmFzZV9pbml0KCYobXV0ZXgpLT5ydG11dGV4KTsJCVwKCV9fbXV0ZXhfcnRf
aW5pdCgobXV0ZXgpLCBuYW1lLCBrZXkpOwkJXAp9IHdoaWxlICgwKQojZW5kaWYKClNvIGluIHRo
ZSBDT05GSUdfUFJFRU1QVF9SVCBjYXNlIGJpbmRnZW4gZG9lc24ndCByZXNvbHZlIHRoZSBtYWNy
byAKd2hhdCBjb3VsZCBiZSBmaXhlZCBieSBhZGRpbmcgYSBoZWxwZXIuCgpEaXJrCgoKPiBUaGlz
IHBhdGNoIG9ubHkgY2hhbmdlcwo+IHRoZSBydXN0YyBmbGFncywgYnV0IHRoZXNlIGVycm9ycyBo
YXZlIHRvIGRvIHdpdGggdGhlIFJ1c3QKPiBoZWxwZXJzL2JpbmRpbmdzLCB3aGljaCBnZXQgZ2Vu
ZXJhdGVkIGJlZm9yZSB0aGUgcnVzdGMgZmxhZ3MgYXJlIHVzZWQKPiBhdCBhbGwuIE1vc3QgbGlr
ZWx5LCB0aGVyZSBpcyBhIHByb2JsZW0gdW5kZXIgdGhlIHBhcnRpY3VsYXIKPiBjb25maWd1cmF0
aW9uIHlvdSBhcmUgdXNpbmcuIFdlcmUgeW91IGFibGUgdG8gcmVwcm9kdWNlIHRoZXNlIGVycm9y
cwo+IHdpdGhvdXQgdGhpcyBwYXRjaD8KPiAKPj4gSSBzdG9wcGVkIHRoZXJlLCBTcGFjZSBNYXJp
bmUgMiBhd2FpdHMuCj4+Cj4+IEhvcGVmdWxseSBJJ2xsIGdldCB0byBzYXkgaGVsbG8gbmV4dCB3
ZWVrLAo+PiBDb25vci4KPiAKPiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2ssIGFuZCBzZWUgeW91
IGF0IFBsdW1iZXJzIQo+IAo+IEFsaWNlCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
