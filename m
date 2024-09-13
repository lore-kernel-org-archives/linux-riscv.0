Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB116FC6181
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM65UcWtBH7GA6YwJuPT7frxRSzxswhlRfLnme2ZD0M=; b=2JSbhRfLhW3fWv
	5e5HA+WHEuZDGsIjYAILKIjlFmkR492C83L6huzE1GhzVA2tEwPa3XAWQ14RT8Ybjlvwvpa9gdsx+
	E7tgERmaSpF7Yj+c9i6mHhlQOf04hdUpBvuFNdLDGWeCMvmnKfj2wrRh6vkEAswX6Gq/qGObp5qD8
	By3U2fEcXSkgZeQJ4U9HeLcdG+qafA0qQNvK5wYtgmamezQ2GyN7eV8Iauqldp+Y0lWMskCpv/oDe
	HQeucbQUhh2avlzJdR5MpAwdTh6OS3KmSNnYB8Vhomv3EOXdmgeFep9dgYCMUceOTc1fFSsvybW6/
	e6wlx5x/iAVRuVKRf7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spE70-0000000HCZR-0mCa;
	Fri, 13 Sep 2024 21:45:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spE5u-0000000HCEn-0UEj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 21:44:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso21354565e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263879; x=1726868679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf45eyq3v7x3TRRfxhlxvxhoc9NAlP67nksFtDxcHog=;
        b=OGfwVOjoo9qFDIqdmJWqSifn8CQ2uWuRU0r53NXS9W2wUH5SOva/hioksdlGhTcGeC
         qhr1N0iwAK80z6EUh55CJY7cJ1PC1oOEYZrnR9vmnQD5/c+vnkN1S+eKh6I3xC4o2wjL
         lKzu5DY4Albr55c2Z/Qhic0erZOAEfD1AchvPEUkgSwX7VK//iOUfh3kDuB+snnj4tJA
         FEHVqnETcnt8tk32nlEJUrjNFt3vk0y8m7Jq62xwD0IzVOxwOKlyqY/fPmLNMsZuGEem
         /9HnBxokrz2y9LYNxP2B5096sOdTylWK0fQl2LOppzqHFKGa5TxRQqm/h4feSM98ZVxc
         hLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263879; x=1726868679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf45eyq3v7x3TRRfxhlxvxhoc9NAlP67nksFtDxcHog=;
        b=JgU+3ZNK7XQb1MOm36mUNw++xE0+cnhtMsEYVEAHfiCzo12XJh0Px9Cu/PfWUeu4aN
         LXEGCgcKG14aKymEPjMOZHUDFvM0m+GCzoHYm6GfX2/2YGb5AQUEZ7xtqJocBeY1z8b2
         wiUMdtkx8bdWmJdB8cxco5TJV0Enlf2Zf9C55Ot6AC7/UKK0ykLHz0zkJ8lBIyekr+lq
         HACWbMm8JypCZ4SRXm1fd9j0bg5BnZvaNiWEn0lXqb+7akpJsEayeDbrtIvJ4Pi7ZUlv
         DPYoRxyrx6hp8BxSU7hdtBGoUGRtBhwkb1EaThZ/sW9RhCZy7VAIW8RAbAaFL/ZLfnPP
         VGEw==
X-Forwarded-Encrypted: i=1; AJvYcCW63OiW+OFK90rfJ+YHGz04hr9zaqOhBZSm73Ii5tuvReJxQv2CUio8qjYUj9O1iUqWjYi1ZZQ4x4tcJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/aEQlsiVadFroOkavZO2HeLDKrzFVGS3Js1f8Q/rHyzdpmLt
	jGbkBnHE+doHwcWyArkVhTEoX9H+KlePoetgRCetMBUU1/rUhqf4+88ller30kV/aF4JAkMgcbp
	SRnWS1U38XdSL13mSWEyXnymQ+H4DWEfZJ4Bc
X-Google-Smtp-Source: AGHT+IEmwetFagY93QocO76IsaU0CwLVTVwEf+i4UEMkAx5533P8vYmTDozz/DvOPi7tFuew3ENtKMeHxf8V8bRaarI=
X-Received: by 2002:a5d:5711:0:b0:374:b685:672 with SMTP id
 ffacd0b85a97d-378c2d04ad5mr4700069f8f.26.1726263879124; Fri, 13 Sep 2024
 14:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com> <20240913-shack-estate-b376a65921b1@spud>
In-Reply-To: <20240913-shack-estate-b376a65921b1@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Sep 2024 23:44:26 +0200
Message-ID: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_144446_163689_A5DD07A4 
X-CRM114-Status: GOOD (  30.51  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMTE6MTjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMTI6MDg6MjBBTSAr
MDIwMCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTA6
MjPigK9BTSBBbGljZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEFkZCBhbGwgb2YgdGhlIGZsYWdzIHRoYXQgYXJlIG5lZWRlZCB0byBzdXBwb3J0IHRoZSBz
aGFkb3cgY2FsbCBzdGFjawo+ID4gPiAoU0NTKSBzYW5pdGl6ZXIgd2l0aCBSdXN0LCBhbmQgdXBk
YXRlcyBLY29uZmlnIHRvIGFsbG93IG9ubHkKPiA+ID4gY29uZmlndXJhdGlvbnMgdGhhdCB3b3Jr
Lgo+ID4KPiA+IEFwcGxpZWQgdG8gYHJ1c3QtbmV4dGAgLS0gdGhhbmtzIGV2ZXJ5b25lIQo+ID4K
PiA+IFBhdWwvUGFsbWVyL0FsYmVydC9SSVNDLVY6IEkgdGhpbmsgeW91IHdlcmUgbm90IENjJ2Qg
KGF0IGxlYXN0IGluIHRoaXMKPiA+IHZlcnNpb24/KSwgc28gcGxlYXNlIHNob3V0IGlmIHlvdSBo
YXZlIGEgcHJvYmxlbSB3aXRoIHRoaXMuCj4KPiBGb3Igc29tZSByZWFzb24gSSBkZWxldGVkIHRo
ZSBzZXJpZXMgZnJvbSBteSBtYWlsYm94LCBtdXN0J3ZlIGJlZW4gaW4KPiBkdC1iaW5kaW5nIHJl
dmlldyBtb2RlIGFuZCBoaXQgY3RybCArIGQuIEkndmUgYmVlbiBhd2F5IGFuZCBidXN5LCBzbyBt
eQo+IGFwb2xvZ2llcyBBbGljZSBmb3Igbm90IHRyeWluZyB0aGlzIG91dCBzb29uZXIuCj4gSXQn
cyBzb3J0YSBhbm5veWluZyB0byB0ZXN0IHJ1c3QgKyBzY3Mgb24gcmlzY3YsIGNvcyB5b3UgbmVl
ZCAodW5sZXNzIEkKPiBhbSBtaXN0YWtlbikgbGx2bS0xOS4gbGx2bS0xOCArIHJ1c3QgYnVpbHQg
ZmluZSwgYnV0IGhhcyBubyBTQ1MuCj4KPiBsbHZtLTE5ICsgcnVzdCBmYWlsZWQgdG8gYnVpbGQg
Zm9yIG1lIHJpc2N2LCBwcm9kdWNpbmc6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3N0dWZm
L2xpbnV4L3J1c3QvaGVscGVycy9oZWxwZXJzLmM6MjI6Cj4gL3N0dWZmL2xpbnV4L3J1c3QvaGVs
cGVycy9zcGlubG9jay5jOjEwOjIzOiBlcnJvcjogY2FsbCB0byB1bmRlY2xhcmVkIGZ1bmN0aW9u
ICdzcGlubG9ja19jaGVjayc7IElTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0IGltcGxp
Y2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KPiBfX3Jhd19zcGluX2xvY2tfaW5pdChzcGlubG9ja19jaGVjayhsb2NrKSwgbmFtZSwga2V5
LCBMRF9XQUlUX0NPTkZJRyk7Cj4gXgo+IC9zdHVmZi9saW51eC9ydXN0L2hlbHBlcnMvc3Bpbmxv
Y2suYzoxMDoyMzogZXJyb3I6IGluY29tcGF0aWJsZSBpbnRlZ2VyIHRvIHBvaW50ZXIgY29udmVy
c2lvbiBwYXNzaW5nICdpbnQnIHRvIHBhcmFtZXRlciBvZiB0eXBlICdyYXdfc3BpbmxvY2tfdCAq
JyAoYWthICdzdHJ1Y3QgcmF3X3NwaW5sb2NrIConKSBbLVdpbnQtY29udmVyc2lvbl0KPiBfX3Jh
d19zcGluX2xvY2tfaW5pdChzcGlubG9ja19jaGVjayhsb2NrKSwgbmFtZSwga2V5LCBMRF9XQUlU
X0NPTkZJRyk7Cj4gXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAvc3R1ZmYvbGludXgvaW5jbHVkZS9s
aW51eC9zcGlubG9jay5oOjEwMTo1Mjogbm90ZTogcGFzc2luZyBhcmd1bWVudCB0byBwYXJhbWV0
ZXIgJ2xvY2snIGhlcmUKPiBleHRlcm4gdm9pZCBfX3Jhd19zcGluX2xvY2tfaW5pdChyYXdfc3Bp
bmxvY2tfdCAqbG9jaywgY29uc3QgY2hhciAqbmFtZSwKPiBeCj4gMiBlcnJvcnMgZ2VuZXJhdGVk
Lgo+Cj4gVGhpcyBvY2N1cnMgYmVjYXVzZSBJIGhhdmUgREVCVUdfU1BJTkxPQ0sgZW5hYmxlZC4g
SSBkaWRuJ3QgY2hlY2sgd2h5LAo+IGJ1dCBBbmRyZWFzIHNlZW1zIHRvIGhhdmUgaW50cm9kdWNl
ZCB0aGF0IGNvZGUgLSBsdWNraWx5IGhlJ3MgYWxyZWFkeSBvbgo+IENDIGhlcmUgOikKPgo+IFdp
dGggdGhhdCBkaXNhYmxlZCwgdGhlcmUgYXJlIGRvemVucyBvZiB3YXJuaW5ncyBhbG9uZyB0aGUg
bGluZXMgb2Y6Cj4gL3N0dWZmL2xpbnV4L3J1c3QvaGVscGVycy9lcnIuYzo2OjE0OiB3YXJuaW5n
OiBzeW1ib2wgJ3J1c3RfaGVscGVyX0VSUl9QVFInIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBp
dCBiZSBzdGF0aWM/Cj4gSWYgdGhvc2UgYXJlIG9rYXkgZm9yIHJ1c3QgY29kZSwgaXQgd291bGQg
YmUgcmF0aGVyIGhlbHBmdWwgaWYgdGhlCj4gd2FybmluZ3MgY291bGQgYmUgZGlzYWJsZWQgLSBv
dGhlcndpc2UgdGhleSBzaG91bGQgcmVhbGx5IGJlIGZpeGVkLgo+Cj4gRm9sbG93aW5nIHRoYXQs
IEkgZ290IGEgYnVpbGQgZXJyb3I6Cj4KPiBlcnJvcltFMDQyNV06IGNhbm5vdCBmaW5kIGZ1bmN0
aW9uIGBfX211dGV4X2luaXRgIGluIGNyYXRlIGBiaW5kaW5nc2AKPiAtLT4gL3N0dWZmL2xpbnV4
L3J1c3Qva2VybmVsL3N5bmMvbG9jay9tdXRleC5yczoxMDQ6MjgKPiB8Cj4gMTA0ICAgfCAgICAg
ICAgICAgdW5zYWZlIHsgYmluZGluZ3M6Ol9fbXV0ZXhfaW5pdChwdHIsIG5hbWUsIGtleSkgfQo+
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl4gaGVscDogYSBmdW5j
dGlvbiB3aXRoIGEgc2ltaWxhciBuYW1lIGV4aXN0czogYF9fbXV0ZXhfcnRfaW5pdGAKPiB8Cj4g
Ojo6IC9zdHVmZi9icnNkay93b3JrL2xpbnV4L3J1c3QvYmluZGluZ3MvYmluZGluZ3NfZ2VuZXJh
dGVkLnJzOjEyOTA3OjUKPiB8Cj4gMTI5MDcgfCAvICAgICBwdWIgZm4gX19tdXRleF9ydF9pbml0
KAo+IDEyOTA4IHwgfCAgICAgICAgIGxvY2s6ICptdXQgbXV0ZXgsCj4gMTI5MDkgfCB8ICAgICAg
ICAgbmFtZTogKmNvbnN0IGNvcmU6OmZmaTo6Y19jaGFyLAo+IDEyOTEwIHwgfCAgICAgICAgIGtl
eTogKm11dCBsb2NrX2NsYXNzX2tleSwKPiAxMjkxMSB8IHwgICAgICk7Cj4gfCB8X19fX18tIHNp
bWlsYXJseSBuYW1lZCBmdW5jdGlvbiBgX19tdXRleF9ydF9pbml0YCBkZWZpbmVkIGhlcmUKPgo+
IGVycm9yOiBhYm9ydGluZyBkdWUgdG8gMSBwcmV2aW91cyBlcnJvcgoKVGhpcyBsb29rcyBsaWtl
IGFuIHVucmVsYXRlZCBwcm9ibGVtIHRvIG1lLiBUaGlzIHBhdGNoIG9ubHkgY2hhbmdlcwp0aGUg
cnVzdGMgZmxhZ3MsIGJ1dCB0aGVzZSBlcnJvcnMgaGF2ZSB0byBkbyB3aXRoIHRoZSBSdXN0Cmhl
bHBlcnMvYmluZGluZ3MsIHdoaWNoIGdldCBnZW5lcmF0ZWQgYmVmb3JlIHRoZSBydXN0YyBmbGFn
cyBhcmUgdXNlZAphdCBhbGwuIE1vc3QgbGlrZWx5LCB0aGVyZSBpcyBhIHByb2JsZW0gdW5kZXIg
dGhlIHBhcnRpY3VsYXIKY29uZmlndXJhdGlvbiB5b3UgYXJlIHVzaW5nLiBXZXJlIHlvdSBhYmxl
IHRvIHJlcHJvZHVjZSB0aGVzZSBlcnJvcnMKd2l0aG91dCB0aGlzIHBhdGNoPwoKPiBJIHN0b3Bw
ZWQgdGhlcmUsIFNwYWNlIE1hcmluZSAyIGF3YWl0cy4KPgo+IEhvcGVmdWxseSBJJ2xsIGdldCB0
byBzYXkgaGVsbG8gbmV4dCB3ZWVrLAo+IENvbm9yLgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29r
LCBhbmQgc2VlIHlvdSBhdCBQbHVtYmVycyEKCkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
