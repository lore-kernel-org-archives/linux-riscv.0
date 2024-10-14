Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF2FD1812A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Epax6KXcr0LApmxgVy/iIDDr63uqwMzwDq5OUzfbKbw=; b=WtNvXyI6DnjfZ+
	fc4wuVaRVow5L81kgnlUIwW/nkwDdOecNR3mHTlwuBS5fw0ZW3WkznbBiWXOABP7GaT0Kju7FkfbC
	t30HUOmH/YAqwUM5kDgr1w3qwmuG6wENIlg7VkwC7326SKc1sIYkWaW+EZC7i5h2pRWOSNUt0WeOB
	cKboJXbxWA+b8gBaRNA+CVdePvEagsJtLYXUOmDsnAv/YopQfRqgy26Z9bGMWc5qy6k9eI4sMVV1n
	5Em88mkN2zq4STRX/yh3war4IDjxsKS6et+IAKZnfbM7uyYp9UwLW0nICZPOoAkn61QTdJEir/0kj
	PJ/wz3EJsO7x5BOiS2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0N6d-00000005gLk-3PEZ;
	Mon, 14 Oct 2024 15:35:35 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0M95-00000005UGO-2r2W
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 14:34:05 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-836f1b47cdfso202442339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1728916442; x=1729521242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZFiFSV2S6ephEEXxaRsM/YTIpGDjHwKVrQbLRq0m74=;
        b=kpZzA1y4YI6GCHLcklQ8OUZpEyuIQdGdOlDKVTmqPO1gCZZmyIyWdXyZHGN8m5fLea
         95566EdpvTKaRFX7gKYjH0ml21ko6qtlvy0VJsJwGUmthm5s7dLs+OF9gpIoJ28+WhfU
         s0r3qpo468hRUfZ5DwYDvt6JxB9FxA+XmnGeQqHYPxoHeL70B5St5ivp0XB80bJtl9HY
         GRJko3P0lLUUYDXChllHpanoJFyQ4m79PJgTM1BnKsA4zmzpBZZBAXPNC3bSautsNBwQ
         YEtHuFV6rWLwQKVre7b8y3KkeOcCQXRhmPKEnCUaZ2Q1ozdzFcNx3HJ2l1MIMBKymE3s
         aLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916442; x=1729521242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZFiFSV2S6ephEEXxaRsM/YTIpGDjHwKVrQbLRq0m74=;
        b=cW8O6KClAiRPyqBWlJdlPKCgS6Gu0Xsy+h9p6iQFrzsOeZokNVXyTia4TrVb3Y/img
         /oEGNxYMMtDpIQqWxFA6XUzRtBeyOLxL9o+kV4Uv1iN3H1o/L+HGoH8XJWcM4hoCrqtn
         0uRG7kaCN5SnXuhRM71mGp9p4lW2ElbGfNWepI3I3YUqTty3WHzff0kxFGtQH3EaWJzs
         VffF+kWNVMlCcTrRlNdTOrayXfSZ8of5z+RipkT2ALYncnj47fy2/dNgYj/HYNF1CdBv
         jBirJPcGt3aGtFpwSVsbcPq3bMzCK6Ax8xVMsaiWIqYa4mAugFXtFyx4iDzlidX0O4IV
         tH6w==
X-Forwarded-Encrypted: i=1; AJvYcCV1Vfc/3EIFn/bhnb1oGBJKX57esHER5uw9RBgbXHpjFhdmrUGuPU8umTBZIgNBIjv+u5WhhGx9+6OAag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuhzw5y91wQ844DmRArgNdpIoiTcJFvCD4agc/aHks/XCRs3v/
	sh18wwB0VoITKAhJJOJXiSH4qFOz5vOBVeXYhkKumAISCn0mSx7dVCGAV3bvXPsU1NXDp6je+LG
	Kyzu9VuZ4tIgQh/V15s2xGxqP/7LO3ZPbAWxafA==
X-Google-Smtp-Source: AGHT+IFYJowFNk6TiJAeIlJ6VE4pS1HwOZ1J0S0O0mVVAaMh1gyG2y64c+9AiCOVdFTYNqR+gnZqJMfVyAe4szQJ6+M=
X-Received: by 2002:a05:6602:3f91:b0:837:7e21:1677 with SMTP id
 ca18e2360f4ac-837929fd68fmr950720739f.4.1728916441860; Mon, 14 Oct 2024
 07:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-33-60d9fe073f37@rivosinc.com>
 <CANXhq0pXVS2s-hZNusPLoQ4qPkyi1S2BTQ-FyAvcz=cDctKQng@mail.gmail.com>
 <Zwj7aZj36TBGzpZa@finisterre.sirena.org.uk> <CANXhq0q49k6q3ZGYqzczMeFr+_rrfa9mL7FMu62xPHeUKfvhMw@mail.gmail.com>
 <ZwmAdRb5BRkPLbWg@debug.ba.rivosinc.com>
In-Reply-To: <ZwmAdRb5BRkPLbWg@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 14 Oct 2024 22:33:50 +0800
Message-ID: <CANXhq0rH_07JRGbBnMTntPxhOQcXzxrcRJ0WAN7T6oQX7DaNoQ@mail.gmail.com>
Subject: Re: [PATCH v6 33/33] kselftest/riscv: kselftest for user mode cfi
To: Deepak Gupta <debug@rivosinc.com>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_073403_782490_69F3E414 
X-CRM114-Status: GOOD (  25.09  )
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

T24gU2F0LCBPY3QgMTIsIDIwMjQgYXQgMzo0NuKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDA3OjQzOjMwUE0g
KzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPk9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDY6MTjigK9Q
TSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJp
LCBPY3QgMTEsIDIwMjQgYXQgMDE6NDQ6NTVQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+PiA+
IE9uIFdlZCwgT2N0IDksIDIwMjQgYXQgNzo0NuKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPiA+Pgo+ID4+ID4gPiArICAgICAgIGlmIChzaS0+c2lfY29kZSA9
PSBTRUdWX0NQRVJSKSB7Cj4gPj4KPiA+PiA+IEhpIERlZXBhaywKPiA+PiA+IEkgZ290IHNvbWUg
ZXJyb3JzIHdoZW4gYnVpbGRpbmcgdGhpcyB0ZXN0LCBJIHN1cHBvc2UgdGhleSBzaG91bGQgYmUK
PiA+PiA+IGZpeGVkIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gPj4KPiA+PiA+IHJpc2N2X2NmaV90
ZXN0LmM6IEluIGZ1bmN0aW9uICdzaWdzZWd2X2hhbmRsZXInOgo+ID4+ID4gcmlzY3ZfY2ZpX3Rl
c3QuYzoxNzoyODogZXJyb3I6ICdTRUdWX0NQRVJSJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4K
PiA+PiA+IHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ1NFR1ZfQUNDRVJSJz8KPiA+PiA+
ICAgIDE3IHwgICAgICAgICBpZiAoc2ktPnNpX2NvZGUgPT0gU0VHVl9DUEVSUikgewo+ID4+ID4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+Cj4gPj4gPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFR1ZfQUNDRVJSCj4gPj4gPgo+ID4+Cj4g
Pj4gRGlkIHlvdSBydW4gIm1ha2UgaGVhZGVyc19pbnN0YWxsIiBwcmlvciB0byBidWlsZGluZyBr
c2VsZnRlc3QgdG8gZ2V0Cj4gPj4gdGhlIGN1cnJlbnQga2VybmVsJ3MgaGVhZGVycyBhdmFpbGFi
bGUgZm9yIHVzZXJzcGFjZSBidWlsZHM/Cj4gPgo+ID5ZZXMsIEkgaGF2ZSBydW4gIm1ha2UgaGVh
ZGVyIiBhbmQgIm1ha2UgaGVhZGVyX2luc3RhbGwiIGJlZm9yZQo+ID5idWlsZGluZyB0aGUga3Nl
bGZ0ZXN0LiBUaGlzIGVycm9yIGhhcHBlbnMgd2hlbiBJIGNyb3NzIGNvbXBpbGVkIGl0LAo+ID5w
ZXJoYXBzIEkgY2FuIGhlbHAgdG8gY2hlY2sgaWYgaXQgaXMgbWlzc2luZyBzb21lIGhlYWRlciBm
aWxlcyBvcgo+ID5oZWFkZXIgc2VhcmNoIHBhdGguCj4KPiBUaGF0J3Mgd2llcmQuCj4KPiBJdCBk
b2Vzbid0IGZhaWwgZm9yIG1lIGV2ZW4gaWYgSSBkbyBub3QgZG8gYG1ha2UgaGVhZGVyc19pbnN0
YWxsYC4gQnV0IEkgYW0KPiBidWlsZGluZyBrZXJuZWwgYW5kIHNlbGZ0ZXN0cyB3aXRoIHRvb2xj
aGFpbiB3aGljaCBzdXBwb3J0cyBzaGFkb3cgc3RhY2sgYW5kCj4gbGFuZGluZyBwYWQuIEl0J3Mg
ZGVmaW5lZCBpbiBgc2lnaW5mby5oYC4gV2hlbiBJIGJ1aWx0IHRvb2xjaGFpbiwgSSBkaWQgcG9p
bnQKPiBpdCBhdCB0aGUgbGF0ZXN0IGtlcm5lbCBoZWFkZXJzLiBNYXkgYmUgdGhhdCdzIHRoZSB0
cmljay4KPgo+ICIiIgo+Cj4gJCBncmVwIC1uaXIgU0VHVl9DUEVSUiAvc2NyYXRjaC9kZWJ1Zy9s
aW51eC9rYnVpbGQvdXNyL2luY2x1ZGUvKgo+IC9zY3JhdGNoL2RlYnVnL2xpbnV4L2tidWlsZC91
c3IvaW5jbHVkZS9hc20tZ2VuZXJpYy9zaWdpbmZvLmg6MjQwOiNkZWZpbmUgU0VHVl9DUEVSUiAg
ICAxMCAgICAgIC8qIENvbnRyb2wgcHJvdGVjdGlvbiBmYXVsdCAqLwo+Cj4gJCBncmVwIC1uaXIg
U0VHVl9DUEVSUiAvc2NyYXRjaC9kZWJ1Zy9vcGVuX3NyYy9zaWZpdmVfY2ZpX3Rvb2xjaGFpbi9J
TlNUQUxMX1NlcHQxOC9zeXNyb290L3Vzci8qCj4gL3NjcmF0Y2gvZGVidWcvb3Blbl9zcmMvc2lm
aXZlX2NmaV90b29sY2hhaW4vSU5TVEFMTF9TZXB0MTgvc3lzcm9vdC91c3IvaW5jbHVkZS9hc20t
Z2VuZXJpYy9zaWdpbmZvLmg6MjQwOiNkZWZpbmUgU0VHVl9DUEVSUiAgICAxMCAgICAgIC8qIENv
bnRyb2wgcHJvdGVjdGlvbiBmYXVsdCAqLwo+IC9zY3JhdGNoL2RlYnVnL29wZW5fc3JjL3NpZml2
ZV9jZmlfdG9vbGNoYWluL0lOU1RBTExfU2VwdDE4L3N5c3Jvb3QvdXNyL2luY2x1ZGUvYml0cy9z
aWdpbmZvLWNvbnN0cy5oOjEzOTogIFNFR1ZfQ1BFUlIgICAgICAgICAgICAgICAgICAvKiBDb250
cm9sIHByb3RlY3Rpb24gZmF1bHQuICAqLwo+IC9zY3JhdGNoL2RlYnVnL29wZW5fc3JjL3NpZml2
ZV9jZmlfdG9vbGNoYWluL0lOU1RBTExfU2VwdDE4L3N5c3Jvb3QvdXNyL2luY2x1ZGUvYml0cy9z
aWdpbmZvLWNvbnN0cy5oOjE0MDojICBkZWZpbmUgU0VHVl9DUEVSUiAgU0VHVl9DUEVSUgo+Cj4g
IiIiCgpJbiBteSBjYXNlLCBiZWNhdXNlIHRoZSB0ZXN0IGZpbGVzIGRvbid0IGV4cGxpY2l0bHkg
aW5jbHVkZSBzaWdpbmZvLmgsCkkgYXNzdW1lIGl0J3MgZXhwZWN0ZWQgdGhhdCBzaWdpbmZvLmgg
d2lsbCBiZSBpbmNsdWRlZCB0aHJvdWdoCnNpZ25hbC5oLiBSZWdhcmRpbmcgdGhlIGhlYWRlciBz
ZWFyY2ggcGF0aCwgaXQgd2lsbCBldmVudHVhbGx5IGxvY2F0ZQpzaWduYWwuaCBpbiB0b29sY2hh
aW5fcGF0aC9zeXNyb290L3Vzci9pbmNsdWRlLy4gSW4gbXkKdG9vbGNoYWluX3BhdGgvc3lzcm9v
dC91c3IvaW5jbHVkZS9zaWduYWwuaCwgaXQgZG9lc24ndCBpbmNsdWRlIGFueQpzaWduYWwuaDsg
aW5zdGVhZCwgc2lnbmFsLmggd2lsbCBiZSBpbmNsdWRlZCBmcm9tCnRvb2xjaGFpbl9wYXRoL3N5
c3Jvb3QvdXNyL2luY2x1ZGUvbGludXgvc2lnbmFsLmggb3IKa2VybmVsX3NyYy91c3IvaW5jbHVk
ZS9saW51eC9zaWduYWwuaCByYXRoZXIgdGhhbgp0b29sY2hhaW4vc3lzcm9vdC91c3IvaW5jbHVk
ZS9zaWduYWwuaC4gSSB0aGluayB0aGF0IGlzIHdoeSBJIGxvc3QgdGhlClNFR1ZfQ1BFUlIgZGVm
aW5pdGlvbi4gSXMgdGhlcmUgYW55IGRpZmZlcmVuY2Ugd2l0aCB5b3U/Cgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
