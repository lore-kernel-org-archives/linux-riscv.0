Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20CAC0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXqPIEo9DaWLRxJxPUOi4Og18PPCMeYYURXH+H9BfW8=; b=4YOPuAgLJLlGRR
	KNw3aFmbwgoM7NzEA7CFU3bLHd8f+fY4CZ7wLhawiNK24OyRAtv70N9gDvxhR44afV5t5WDbQvnys
	Yc9kCEiQYv1/F71lbw0FoEMEL8LRL1xHgPpngb5WUIHidpOvE4Fh9mMNbw1DAzFvJITALZIxF9pN7
	DY4VnYDNwfg/GwO+4HdNvEfbJUvKhNMlS/fEwHR31F0SEztBNkCbItetkwjgHW787ZwrP0THV0AZ4
	YYIkmqFVp5z64iW28XVXG5NKEFNBgdZUc8fL83EQVAsLwTGcOGc/71JPdbKn107xKRY5K6rg1UpEl
	dEPj9QjxQdEmA4MSiG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsfM-0000000AoZX-1yQ2;
	Fri, 31 Jan 2025 15:10:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsfJ-0000000AoZB-4AeW
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 15:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AEAD7A41653
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 15:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A9CC4CEDF
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738336241;
	bh=eX0cVA2yp71nvD7An+e7tafzcanp+36FNBsdUymO1Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jo4hQjC5aXakRQngnuNqTei/aintLDideMNfRRMpoHKdagZd5dGCa9ntGDzqkZvxx
	 tjxNoP4rC9xGhTf26llA1C/FXgbksxQUxV0wb6eRKSKviQqTFvceQuWEPQAzG25xpU
	 1DyTLB4R/PyDE5syvJ5JTKw/uWoLqdb2ZVc6Gud0gC94BX9r2hAZh0G0CZeXy4/BDZ
	 P//v8CKaDoI3WzYonswB3dLmuR3R/JOUqn+HmhVi5/O1D4sLcnGI5W1PCtnsfwpi76
	 JQUBaDVdVHiIXwWsFOadepXsQ7rBxIULMsiWOY1MQiG50924Yncf/e4v7Z1RvC2jMd
	 2pi680JBilq0g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2134941e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 07:10:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNQY+zP3l/MkY8ajqMAmrRE25z98dWF/sBut4m++Lo7Ut+zb2tnBXZDAN++Tg8e6KDp2G0kLJjFLgayw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVsi6HU2YJbPijRVXw3mMt9CgyooR55X1IPbU+kLa0GrW/X1QJ
	3xOn6BlZ/NO3Ac2/c781uNJ9LQ2qjjtYJucPrZLXP46DygRYqqfPNxjFkof4imoHyF4JuSotgAY
	R4/8g8BmFdIT3HiWRNv4eqtU9j1w=
X-Google-Smtp-Source: AGHT+IEa5D7ILTAFw/tuud1q0Rc56l9olpgCHLQg0r7/Z2bDIApocb2GXjNIBwm86F2MUJw8DwMA84TcH2H9Zj6R7x4=
X-Received: by 2002:a05:6512:3a8e:b0:542:8d45:cb3e with SMTP id
 2adb3069b0e04-543e4beb1d2mr4122940e87.18.1738336239628; Fri, 31 Jan 2025
 07:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost>
In-Reply-To: <Z5xzkwwZAWRRLCdj@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 00:10:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
X-Gm-Features: AWEUYZnyZe5mPzh78I__zpHIfZytPX5pJn8z98JOPt3b9lu7WLwCwryXByvCTvU
Message-ID: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_071042_156842_BE9121A2 
X-CRM114-Status: GOOD (  24.28  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMzo1NOKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMzAsIDIwMjUgYXQgMDg6NTI6
NDVQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAyMiwg
MjAyNSBhdCAwNzoxNzoyNlBNIC0wODAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+IE9u
IHJpc2N2LCBrZXJuZWwgbW9kdWxlcyBlbmQgdXAgd2l0aCBhIHNpZ25pZmljYW50IG51bWJlciBv
ZiBsb2NhbAo+ID4gPiBzeW1ib2xzLiBUaGlzIGJlY29tZXMgYXBwYXJlbnQgd2hlbiBjb21waWxp
bmcgbW9kdWxlcyB3aXRoIGRlYnVnIHN5bWJvbHMKPiA+ID4gZW5hYmxlZC4gVXNpbmcgYW1kZ3B1
LmtvIGFzIGFuIGV4YW1wbGUgb2YgYSBsYXJnZSBtb2R1bGUsIG9uIHJpc2N2IHRoZQo+ID4gPiBz
aXplIGlzIDc1NE1CIChubyBzdHJpcHBpbmcpLCA1M01CICgtLXN0cmlwLWRlYnVnKSwgYW5kIDIx
TUIKPiA+ID4gKC0tc3RyaXAtdW5uZWVkZWQpLiBPTiB4ODYsIGFtZGdwdS5rbyBpcyA0ODJNQiAo
bm8gc3RyaXBwaW5nKSwgMjFNQgo+ID4gPiAoLS1zdHJpcC1kZWJ1ZyksIGFuZCAyME1CICgtLXN0
cmlwLXVubmVlZGVkKS4KPiA+ID4KPiA+ID4gVXNlIC0tc3RyaXAtdW5uZWVkZWQgaW5zdGVhZCBv
ZiAtLXN0cmlwLWRlYnVnIHRvIHN0cmlwIG1vZHVsZXMgc28KPiA+ID4gZGVjcmVhc2UgdGhlIHNp
emUgb2YgdGhlIHJlc3VsdGluZyBtb2R1bGVzLiBUaGlzIGlzIHBhcnRpY3VsYXJseQo+ID4gPiBy
ZWxldmFudCBmb3IgcmlzY3YsIGJ1dCBhbHNvIG1hcmdpbmFsbHkgYWlkcyBvdGhlciBhcmNoaXRl
Y3R1cmVzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPgo+ID4KPiA+IElzIHRoZXJlIGFueSBzb3J0IG9mIHJlZ3Jlc3Npb24g
cmlzayB3aXRoIHRoaXMgcGF0Y2g/IElmIHNvLCBhbm90aGVyCj4gPiBvcHRpb24gbWF5IGJlIHRv
IGdpdmUgYW5vdGhlciBsZXZlbCB0byBJTlNUQUxMX01PRF9TVFJJUCBsaWtlIDIgc28gdGhhdAo+
ID4gSU5TVEFMTF9NT0RfU1RSSVA9MSBjb250aW51ZXMgdG8gYmVoYXZlIGFzIGJlZm9yZSBidXQg
cGVvcGxlIGNhbiBlYXNpbHkKPiA+IG9wdCBpbnRvIHRoaXMgb3B0aW9uLiBObyBzdHJvbmcgb3Bp
bmlvbiBiZWNhdXNlIEkgYW0gbm90IHN1cmUgYnV0IHdhcwo+ID4gbm90IHN1cmUgaWYgaXQgd2Fz
IGNvbnNpZGVyZWQuCj4KPiBJIGRvIG5vdCBiZWxpZXZlIHRoaXMgd291bGQgY2F1c2UgcmVncmVz
c2lvbnMuIFRoZSBkZXNjcmlwdGlvbiBvbiBnbnUKPiBzdHJpcCBpczoKPgo+ICJSZW1vdmUgYWxs
IHN5bWJvbHMgdGhhdCBhcmUgbm90IG5lZWRlZCBmb3IgcmVsb2NhdGlvbiBwcm9jZXNzaW5nIGlu
Cj4gYWRkaXRpb24gdG8gZGVidWdnaW5nIHN5bWJvbHMgYW5kIHNlY3Rpb25zIHN0cmlwcGVkIGJ5
IC0tc3RyaXAtZGVidWcuIgo+Cj4gVGhlIGRlc2NyaXB0aW9uIG9uIGxsdm0tc3RyaXAgaXM6Cj4K
PiAiUmVtb3ZlIGZyb20gdGhlIG91dHB1dCBhbGwgbG9jYWwgb3IgdW5kZWZpbmVkIHN5bWJvbHMg
dGhhdCBhcmUgbm90Cj4gcmVxdWlyZWQgYnkgcmVsb2NhdGlvbnMuIEFsc28gcmVtb3ZlIGFsbCBk
ZWJ1ZyBzZWN0aW9ucy4iCj4KPiBnbnUgc3RyaXAgLS1zdHJpcC11bm5lZWRlZCBzdHJpcHMgc2xp
Z2h0bHkgbW9yZSBhZ2dyZXNzaXZlbHkgYnV0IGl0IGRvZXMKPiBub3QgYXBwZWFyIHRoaXMgY2F1
c2VzIGFueSBpc3N1ZXMuCj4KPiA+Cj4gPiBSZWdhcmRsZXNzOgo+ID4KPiA+IFJldmlld2VkLWJ5
OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4KPiBUaGFua3MhCj4KCgpJ
dCBpcyB0cnVlIC0tc3RyaXAtdW5uZWVkZWQgZHJvcHMgYSBsb3Qgb2YgY29tcGlsZXItZ2VuZXJh
dGVkIHN5bWJvbHMsIGJ1dAppdCBhbHNvIGRyb3BzIHJlYWwgc3ltYm9scyB0aGF0IG9yaWdpbmF0
ZSBpbiB0aGUgc291cmNlIGNvZGUuCgpTbywgdGhpcyB3b3VsZCBnaXZlIHVzZXItdmlzaWJsZSBj
aGFuZ2VzIGZvciBrYWxsc3ltcyBhdCBsZWFzdC4KCgokIHJpc2N2NjQtbGludXgtZ251LW5tICAt
bgovdG1wL3N0cmlwLXVubmVlZGVkL2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1nNjllODU4ZTBi
OGIyL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28KID4gL3RtcC9z
eW1ib2wtd2l0aC1zdHJpcC11bm5lZWRlZAokIHJpc2N2NjQtbGludXgtZ251LW5tICAtbgovdG1w
L3N0cmlwLWRlYnVnL2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1nNjllODU4ZTBiOGIyL2tlcm5l
bC9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28KID4gL3RtcC9zeW1ib2wtd2l0
aC1zdHJpcC1kZWJ1ZwoKJCAgZGlmZiAtdSAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLWRlYnVnICAv
dG1wL3N5bWJvbC13aXRoLXN0cmlwLXVubmVlZGVkCiBbIHNuaXAgXQogMDAwMDAwMDAwMDE2NzZj
YyB0IHV2ZF92Nl8wX3JpbmdfdGVzdF9yaW5nCiAwMDAwMDAwMDAwMTY3ODAyIHQgdXZkX3Y2XzBf
cmluZ19lbWl0X3BpcGVsaW5lX3N5bmMKIDAwMDAwMDAwMDAxNjdhMDIgdCB1dmRfdjZfMF9yaW5n
X2VtaXRfZmVuY2UKLTAwMDAwMDAwMDAxNjdiNTggciBDU1dUQ0guMgotMDAwMDAwMDAwMDE2N2I2
OCByIGFibV9zZXR0aW5ncwotMDAwMDAwMDAwMDE2N2I4MCByIGFibV9jb25maWcKLTAwMDAwMDAw
MDAxNjdiOTAgciBtaW5fcmVkdWN0aW9uX3RhYmxlX3ZfMl8yCi0wMDAwMDAwMDAwMTY3YmEwIHIg
bWF4X3JlZHVjdGlvbl90YWJsZV92XzJfMgotMDAwMDAwMDAwMDE2N2JiMCByIG1pbl9yZWR1Y3Rp
b25fdGFibGUKLTAwMDAwMDAwMDAxNjdiYzAgciBtYXhfcmVkdWN0aW9uX3RhYmxlCi0wMDAwMDAw
MDAwMTY3YmQwIHIgY3VzdG9tX2JhY2tsaWdodF9jdXJ2ZTAKIDAwMDAwMDAwMDAxNjdjMzggciBh
Ym1fc2V0dGluZ3NfY29uZmlnMgogMDAwMDAwMDAwMDE2N2M3MCByIGFibV9zZXR0aW5nc19jb25m
aWcxCiAwMDAwMDAwMDAwMTY3Y2E4IHIgYWJtX3NldHRpbmdzX2NvbmZpZzAKCgoKCi0tCkJlc3Qg
UmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
