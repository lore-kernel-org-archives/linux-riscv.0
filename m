Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F77C27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A98fkhWxV0WnyX0NTAL0ooDK8c4Fuq+biFeSPDF2qdo=; b=J/Hb/xEEuloZO3
	FgVsL9FjPu2mDkzfaJuwKr7QuOvwrcsH/H5+rC7cLqHm8H+16oM/iWY0Gx19bQ909CZp5GCwWAkWU
	/Q9dOoOkB9tk6omBBoz+eH6iSzUXVs4u3gyJ4ig3Rw3y8u3xBoQHjxdjTFS7UQqggF3RaJZjhgYrg
	3/qAB0uogAFinUNQJuo7fiM+KTQ9MDGMRN5HlAKG/Gbz3FcI05Q0bcuapQX56ONyrl0WXiFw/GIfM
	ezV6UyLQ7xLXf2Jr+N/8OKyJEhyvQ505d1KKalhdpZpP84CQelry9SbP9x8VbvhqEF1CuRFVAp3lQ
	i8KWD/Qwty3bR/88Vmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaTE-00000004GXX-2dxp;
	Mon, 10 Jun 2024 08:33:40 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaTB-00000004GX4-1P0v
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 08:33:38 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52c82bea25fso281838e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718008416; x=1718613216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VONwh53+sI/q+7igjZXIEzywb8W5GjMK/wuw98MkWNU=;
        b=LxJvVgpLd5eUU3zTOm7EBhxI3yS/ujBMgWh8jwPdSil0UtttckLcK8ObmPtvDbASi7
         JjwubGZihjXKEvq3W70+syWXhB6FkXkGQTsPk46nI7QSKi3n0gLGz0JbbWjNJeGtmZPZ
         I6H2/VrkBhSFCF3LS0H9dBGgDequ77J4oR+4S42xhur7Y334PLIHQiZXTJmEvVhdpraB
         brG+kxs7sXV1KbFLtAN4ga+5cYjxLCaVUjxLORz6INbcAVOHZzHZfrOsE1H5SFkWwxaR
         Kt85/cRkE2gVQqJjbc9v7w7mk5rEe3xXyq5u99s7pDhAleL0AfCE9xqpd7mI8/A4PlT8
         CgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008416; x=1718613216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VONwh53+sI/q+7igjZXIEzywb8W5GjMK/wuw98MkWNU=;
        b=qQ3eFSiu0T1lBp3rPCye5A/vvMZLGNvSKjjamuj8zUK00SC4DhiwlmK7ZY7f9gWXvC
         0CAurj/+9OQBFQqodac7w16StfRcXsEM+WjlViZmezvewbZXMZkhXvWE9vFuHXwWCdyZ
         tQoJgjTcaKAd3/Y1JRhFs6zgBl7GSY9WZWZU11tbMNfsYwJiZzstw0tkNnOgGvCHCmVA
         vLWoh2MUC4u4S6QlCnLqSzCOJo8dYChKYGmB1caci+5WXtzoGNz374ob7G8nluFlTTm0
         hl0P6wNLjbX5dSHr5fB1cTZNySghB+zHTXNbxGnem+fXpo2uH8D3+gpFYlHNFNlbekpN
         vQQw==
X-Forwarded-Encrypted: i=1; AJvYcCV6mYefNb0N0Bm0a3S1puAXXSEryIdZXWtbdXckqNU3lcVqR5w+OlTJGgzrwv2ZFXGPCiZ+bvJ8fWOMLf4cTaJoZLjgA3DhOBSi6mzqFiPC
X-Gm-Message-State: AOJu0YxyuPSYmf1vYo4H6vKyXk9hmpGoZBBDtJXLSlPrXmuQye79+/7K
	PNTRYCdV0jJ5vtMniBu0Wi5pm074RA3z/wHxmLc4i16PqjK8ig21uwK6CpkBmg0=
X-Google-Smtp-Source: AGHT+IFahvD3U+kTggZzk4bIrxGmCLQrUgdTOQl0vpqy33eDYS/aj7HavpfyJtTvywy7ZbtTTbtAcA==
X-Received: by 2002:a19:6b03:0:b0:52b:bd23:1e9 with SMTP id 2adb3069b0e04-52bbd2304e7mr4688601e87.1.1718008415424;
        Mon, 10 Jun 2024 01:33:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:deb:d879:7179:d010? ([2a01:e0a:999:a3a0:deb:d879:7179:d010])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e674sm135087885e9.6.2024.06.10.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 01:33:34 -0700 (PDT)
Message-ID: <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
Date: Mon, 10 Jun 2024 10:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atishp@rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_013337_398825_2D1403FD 
X-CRM114-Status: GOOD (  27.63  )
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

CgpPbiAwNy8wNi8yMDI0IDIwOjUxLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MDMsIDIwMjQgYXQgMDE6NDc6NDBQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiBN
b24sIEp1biAwMywgMjAyNCBhdCAxMToxNDo0OUFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4+PiBIaSBDb25vciwKPj4+Cj4+PiBPbiAzMS8wNS8yMDI0IDE5OjMxLCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4+PiA+IE9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDEyOjIzOjI3UE0gLTA0MDAs
IEplc3NlIFRhdWJlIHdyb3RlOgo+Pj4gPiA+IERlY3RlY3QgdGhlIFprciBleHRlbnNpb24gYW5k
IHVzZSBpdCB0byBzZWVkIHRoZSBrZXJuZWwgYmFzZQo+Pj4gYWRkcmVzcy4KPj4+ID4gPgo+Pj4g
PiA+IERldGVjdGlvbiBvZiB0aGUgZXh0ZW5zaW9uIGNhbiBub3QgYmUgZG9uZSBpbiB0aGUgdHlw
aWNhbAo+Pj4gZmFzaGlvbiwgYXMKPj4+ID4gPiB0aGlzIGlzIHZlcnkgZWFybHkgaW4gdGhlIGJv
b3QgcHJvY2Vzcy4gSW5zdGVhZCwgYWRkIGEgdHJhcCBoYW5kbGVyCj4+PiA+ID4gYW5kIHJ1biBp
dCB0byBzZWUgaWYgdGhlIGV4dGVuc2lvbiBpcyBwcmVzZW50Lgo+Pj4gPiBZb3UgY2FuJ3QgcmVs
eSBvbiB0aGUgbGFjayBvZiBhIHRyYXAgbWVhbmluZyB0aGF0IFprciBpcyBwcmVzZW50Cj4+PiB1
bmxlc3MKPj4+ID4geW91IGtub3cgdGhhdCB0aGUgcGxhdGZvcm0gaW1wbGVtZW50cyBTc3N0cmlj
dC4gVGhlIENTUiB3aXRoIHRoYXQKPj4+IG51bWJlcgo+Pj4gPiBjb3VsZCBkbyBhbnl0aGluZyBp
ZiBub3QgU3NzdHJpY3QgY29tcGxpYW50LCBzbyB0aGlzIGFwcHJvYWNoIGdldHMgYQo+Pj4gPiBu
YWsgZnJvbSBtZS4gVW5mb3J0dW5hdGVseSwgU3NzdHJpY3QgZG9lc24ndCBwcm92aWRlIGEgd2F5
IHRvIGRldGVjdAo+Pj4gPiBpdCwgc28geW91J3JlIHN0dWNrIHdpdGggZ2V0dGluZyB0aGF0IGlu
Zm9ybWF0aW9uIGZyb20gZmlybXdhcmUuCj4+Pgo+Pj4KPj4+IEZZSSwgdGhpcyBwYXRjaCBpcyBt
eSBpZGVhLCBzbyBJJ20gdGhlIG9uZSB0byBibGFtZSBoZXJlIDopCj4+Pgo+Pj4KPj4+ID4KPj4+
ID4gRm9yIERUIHN5c3RlbXMsIHlvdSBjYW4gYWN0dWFsbHkgcGFyc2UgdGhlIERUIGluIHRoZSBw
aSwgd2UgZG8gaXQKPj4+IHRvIGdldAo+Pj4gPiB0aGUga2FzbHIgc2VlZCBpZiBwcmVzZW50LCBz
byB5b3UgY2FuIGFjdHVhbGx5IGNoZWNrIGZvciBaa3IuIFdpdGgKPj4+IEFDUEkKPj4+ID4gSSBo
YXZlIG5vIGlkZWEgaG93IHlvdSBjYW4gZ2V0IHRoYXQgaW5mb3JtYXRpb24sIEkgYW1uJ3QgYW4g
QUNQSS1pc3QuCj4+Pgo+Pj4KPj4+IEkgdG9vayBhIGxvb2sgYXQgaG93IHRvIGFjY2VzcyBBQ1BJ
IHRhYmxlcyB0aGlzIGVhcmx5IHdoZW4KPj4+IGltcGxlbWVudGluZyB0aGUKPj4+IFphYmhhL1ph
Y2FzIHBhdGNoZXMsIGJ1dCBpdCBzZWVtcyBub3QgcG9zc2libGUuCj4+Pgo+Pj4gQnV0IEknbGwg
bG9vayBpbnRvIHRoaXMgbW9yZSwgdGhpcyBpcyBub3QgdGhlIGZpcnN0IHRpbWUgd2UgbmVlZCB0
aGUKPj4+IGV4dGVuc2lvbnMgbGlzdCB2ZXJ5IGVhcmx5IGFuZCBzaW5jZSB3ZSBoYXZlIG5vIHdh
eSB0byBkZXRlY3QgdGhlCj4+PiBwcmVzZW5jZQo+Pj4gb2YgYW4gZXh0ZW5zaW9uIGF0IHJ1bnRp
bWUsIHNvbWV0aGluZyBuZWVkcyB0byBiZSBkb25lLgo+Pgo+PiBBeWUsIGhhdmluZyByZW1lbWJl
cmVkIHRoYXQgcmVhZGluZyBDU1JfU0VFRCBjb3VsZCBoYXZlIHNpZGUtZWZmZWN0cyBvbiBhCj4+
IHN5c3RlbSB3aXRoIG5vbi1jb25mb3JtaW5nIGV4dGVuc2lvbnMsIGl0J2QgYmUgZ29vZCB0byBz
ZWUgaWYgd2UgY2FuCj4+IGFjdHVhbGx5IGRvIHRoaXMgdmlhIGRldGVjdGlvbiBvbiBBQ1BJIC0g
ZXNwZWNpYWxseSBmb3Igc29tZSBvdGhlcgo+PiBleHRlbnNpb25zIHRoYXQgd2UgbWF5IG5lZWQg
dG8gdHVybiBvbiB2ZXJ5IGVhcmx5IChJIGZvcmdldCB3aGljaCBvbmVzIHdlCj4+IHRhbGtlZCBh
Ym91dCB0aGlzIGJlZm9yZSBmb3IpLiBJIGRpZG4ndCBhcm02NCBkbyBhbnl0aGluZyB3aXRoIEFD
UEkgaW4KPj4gdGhlCj4+IHBpIGNvZGUsIGlzIHRoZSBjb2RlIGFyY2gveDg2L2Jvb3QvY29tcHJl
c3NlZCBydW4gYXQgYW4gZXF1aXZpbGVudC1pc2gKPj4gcG9pbnQKPj4gaW4gYm9vdD8KPiAKPiBj
YzogK0NsZW1lbnQgYW5kIEF0aXNoCj4gCj4gSSBkb24ndCBrbm93IGFsbCB0aGUgZGV0YWlscyBi
dXQgb24gZmlyc3QgZ2xhbmNlIGl0IHNlZW1zIGxpa2UgaW5zdGVhZAo+IG9mIEFDUEksCj4gbWF5
IGJlIEZXRlQgaXMgYSBiZXR0ZXIgcGxhY2UgZm9yIGRpc2NvdmVyeSA/Cj4gaHR0cHM6Ly9saXN0
cy5yaXNjdi5vcmcvZy90ZWNoLXBycy90b3BpYy9wYXRjaF92MTJfYWRkX2Zpcm13YXJlLzEwNjQ3
OTU3MQoKSU1ITywgZG9pbmcgZGlzY292ZXJ5IGluIEZXRlQgaXMgbm90IHRoZSBnb2FsIG9mIHRo
aXMgZXh0ZW5zaW9uLiBJIHRoaW5rCnRoZSAicmVhbCIgc29sdXRpb24gd291bGQgYmUgdG8gd2Fp
dCBmb3IgdGhlIHVuaWZpZWQgZGlzY292ZXJ5IHRhc2sKZ3JvdXAgdG8gY29tZSB1cCB3aXRoIHNv
bWV0aGluZyBmb3IgdGhhdCAod2hpY2ggaXMgdGhlaXIgZ29hbCBJIHRoaW5rKSBbMV0KCkNsw6lt
ZW50LAoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L2NvbmZpZ3VyYXRpb24tc3RydWN0
dXJlIFsxXQoKPiAKPiBTdXBlcnZpc29yIGNvdWxkIHF1ZXJ5IGlmIFNzdHJpY3QgaXMgaW1wbGVt
ZW50ZWQgYW5kIHRoZW4gaXQgY2FuIGNoZWNrIGZvcgo+IGxhY2sgb2YgdHJhcCBvbiBDU1JfU0VF
RCBvciBzdHJhaWdodC1hd2F5IGNoZWNrIGZvciBwcmVzZW5jZSBvZiBaa3IuCj4gCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
