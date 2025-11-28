Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9A3CFD376
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEkDKNpCN5p6vnK3zzD+pLJ9ox/mgVBszcTBDNe3GnQ=; b=Ox0INlDSfnQrJx
	GX1dlyzob+q5B/JKyGFpyI5qtgsIKitjb6n56y4kDGutA92/cd0lTBxEMWawgtcGRDfqnsmWV4AO9
	m1SKHYH76OfWoCeapbZf7aXzAIHV8ynTeoHKNhdghNTgBUSc7ofFzI0nVtBrjvAVY224jitjsvEnA
	PI4Z2egQfOWe81LzyBgOzM5HD0195sxIMUnatxuLWhUwZJZqU/NIJnqgtldmC5PvqP/VhDUyF0iPZ
	Ti3NMRZbhqEU0dwSrQXm5d6Aa7gv3IqnmJ2wJ8TE5PCXDqDxjZq0E2aSjr//Nx7vhT7Wn6Jj4ESfZ
	6EEwrQTE3wCjTyLO/dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvRn-00000000Gtr-0RXq;
	Fri, 28 Nov 2025 10:11:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvRl-00000000Gt6-1dR5
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 10:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F2B760222
	for <linux-riscv@lists.infradead.org>; Fri, 28 Nov 2025 10:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3194C19424
	for <linux-riscv@lists.infradead.org>; Fri, 28 Nov 2025 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764324683;
	bh=PWsRhLp6z6n29IRXVTS5+3foE+B/FlguofEGjtrPnAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJqpK8dBqFSb4b0m9DQYK2iaCS3+Gd3oWB596cjJhVJJk/Zg2OiNnqagNQSREoTKc
	 BFwKZDjHcBOAiK604Fkf8TtdXStOcWZ1rY5nJJGfFTmIJHGnYtOTKtpvkLHpg4XAPa
	 J4vFis/tO92GN+97xn7YNGDC/iLi+aRxZVjGqp2bYJTlE4643EWXts7vMqt3Q1AelD
	 W3o2FD6IbaBn2cpuX96MEOmH02WBhpbJFHoUpuJEim6cupU3bg3FVLhl0vksZ3ZWwq
	 0PpEuF61HEL+G5WbZ3LdqHhMKuelrI0kzOEaloaKlgldOsoG6gznCCFq9QTKkwb2Uq
	 RjRS/eD0HIXrg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so256637566b.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Nov 2025 02:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1RoEae+xiIm+EM6gRAQjAJGnjMvc2VfVqmVY5Vw4PDJnR91qCXWYjt+Ox/ArOM75eFBuyGgphqjFmcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTBT330jbltak624yQkagsrhUCgllU1/Yeht3CNlOB9gt/SqIW
	KHIWaPzIwEUs9vSUt5OpnI8tdJT3J9Szer5Yf0F5FEoCvAAJAUcfhAWM8fLDFqj1qJnxuvAj3Cq
	ckEDbqNFCRdiMYzL6ZvHUQvedFiRQ8lg=
X-Google-Smtp-Source: AGHT+IER+7jriN3w9Pv8lhWqhpVubB2j1VJ3WiM2RJPPedEcwCvbKIiBl12aNjVZ1s4Ed6Fb1u3VbAod9cGN/G90Wrw=
X-Received: by 2002:a17:907:747:b0:b76:4c16:6afe with SMTP id
 a640c23a62f3a-b76c5515075mr1672433466b.28.1764324682207; Fri, 28 Nov 2025
 02:11:22 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck> <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn> <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
 <fc4fa66f-15a0-ebe3-0a27-f3f38b03bbdb@loongson.cn> <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
In-Reply-To: <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 18:11:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkX3iCrwW5eCVl7oUJENC1CV_iFBcerr6LqbeRJus8VyU5MC421CDs2fZk
Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
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

T24gVHVlLCBOb3YgMjUsIDIwMjUgYXQgOTo0OeKAr0FNIEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTm92IDIzLCAyMDI1IGF0IDExOjM3OjE0
QU0gKzA4MDAsIFRpZXpodSBZYW5nIHdyb3RlOgo+ID4gT24gMTEvMjMvMjUgMTA6MjksIEh1YWNh
aSBDaGVuIHdyb3RlOgo+ID4gPiBJcyBpdCBwb3NzaWJsZSB0byBpbXByb3ZlIG9ianRvb2wgdGhh
dCBjYW4gaGFuZGxlIGluZGlyZWN0IF9fbm9yZXR1cm4gZnVuY3Rpb25zPwo+Cj4gU29tZWRheSB0
aGF0IHdpbGwgYmUgcG9zc2libGUgdmlhIGEgbmV3IGNvbXBpbGVyIGZlYXR1cmUgb3IgcGx1Z2lu
LiAgQnV0Cj4gdG9kYXkgaXQgY2FuJ3QgYmUgZG9uZS4KPgo+ID4gPiBJcyBpdCBwb3NzaWJsZSB0
byBpbXByb3ZlIG9ianRvb2wgdGhhdCBjYW4gaGFuZGxlCj4gPiA+IE9CSkVDVF9GSUxFU19OT05f
U1RBTkRBUkQgZXZlbnQgTFRPIGlzIGVuYWJsZWQ/Cj4KPiBObywgdGhhdCBpcyBwdXJlbHkgYSBt
YWtlZmlsZSBjb25zdHJ1Y3Qgd2hpY2ggc2hvdWxkIGluIGdlbmVyYWwgYmUKPiBhdm9pZGVkIGFu
eXdheSBmb3IgYSB2YXJpZXR5IG9mIHJlYXNvbnMuCj4KPiA+ID4gSXMgaXQgcG9zc2libGUgdG8g
aW1wcm92ZSBvYmp0b29sIHRoYXQgb25seSBpZ25vcmUgX19lZmlzdHViIHByZWZpeAo+ID4gPiBm
b3IgTG9vbmdBcmNoPwo+ID4gWy4uLl0KPiA+IHN0YXRpYyBpbnQgdmFsaWRhdGVfYnJhbmNoKCkK
PiA+IHsKPiA+IC4uLgo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChhcmNoX2lzX2VmaXN0
dWIoZnVuYykpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaWYgKGZpbGUtPmlnbm9yZV91bnJlYWNoYWJsZXMp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgV0FSTigiJXMoKSBmYWxscyB0aHJvdWdoIHRvIG5leHQgZnVuY3Rp
b24gJXMoKSIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jLT5uYW1lLCBpbnNu
X2Z1bmMoaW5zbiktPm5hbWUpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGZ1bmMtPndhcm5l
ZCA9IDE7Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ID4gLi4uCj4g
PiB9Cj4KPiBUaGF0IG9ubHkgc2lsZW5jZXMgdGhlIHdhcm5pbmcsIGl0IGRvZXNuJ3QgcHJldmVu
dCBvYmp0b29sIGZyb20gZG9pbmcKPiB0aGUgYWN0dWFsIHN0YWNrIHZhbGlkYXRpb24gb3IgT1JD
IGdlbmVyYXRpb24uICBOZWl0aGVyIG9mIHdoaWNoIG1ha2VzCj4gc2Vuc2UgZm9yIGxpYnN0dWIu
Cj4KPiBBbmQgb2JqdG9vbCBoYXMgbWFueSBvdGhlciBmZWF0dXJlcyBiZXlvbmQganVzdCBzdGFj
ayB2YWxpZGF0aW9uIGFuZAo+IE9SQy4gIE5vbmUgb2YgdGhvc2UgbWFrZSBzZW5zZSBmb3IgbGli
c3R1YiBlaXRoZXIuCj4KPiBUbyBmdWxseSBleGNsdWRlIGFsbCBsaWJzdHViIGNvZGUgZnJvbSBv
Ymp0b29sLCB0aGVzZSBhcmNoX2lzX2VmaXN0dWIoKQo+IGNoZWNrcyB3b3VsZCBuZWVkIHRvIGJl
IHNwcmlua2xlZCBhbGwgb3ZlciB0aGUgcGxhY2UuCklmIHRoZSBjYWxsIHNpdGVzIGFyZSBsZXNz
IHRoYW4gNSwgSSB0aGluayBpdCBpcyBhY2NlcHRhYmxlLgoKSHVhY2FpCgo+Cj4gVGhhdCB3b3Vs
ZCBiZSBhIGxvdCBtb3JlIGZyYWdpbGUgdGhhbiBqdXN0IGV4Y2x1ZGluZyBsaWJzdHViIGZyb20K
PiB2bWxpbnV4Lm8gaW4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gLS0KPiBKb3NoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
