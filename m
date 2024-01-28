Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDE1C46CD2
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0B4Cmyjxsk+3+mHI8KwqP7ZONWSFAPzuELJTaY6QTo=; b=VwYlUW/pJsjp+G
	ET00VNFXUjEQj8m4aIQU/1Tb+xNVoL6nunm6DI9xsLpo2dWyULTLMS3MgZaC2eqh3DHnvC7V/3ho/
	B185RDcD/Tsr0HA6vnD7KjG5BN0FXQhVvsYZpQs3pBDe9WboMKN2rafOrjYv/pxoPT51OvStURPSY
	fWuOjvqYGKmDRRjhLIflJitxdgAiwtqf07rUUKUnxJM/kG//FEu2/bXtuOZDPS6znvaIrRUwLljlP
	3tJSQN7Y9Va8su0zS129/PlY9bZybf6IKYf3lRn0UeoOEGbSIJkXfIGy3TN5TaOpLFALkGijE8pgD
	Yq+aVM8wyeGqZdAsfBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTvMd-00000008cVT-20cF;
	Sun, 28 Jan 2024 02:57:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTvMb-00000008cUp-1X4s
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 02:57:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-51030ce36fbso877497e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 18:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706410656; x=1707015456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUPe8kS/dYQxcvPbyImR2zb7xWJbztZ0Yj4HdTeCp4I=;
        b=W8Ksj57rxIs0/svYbVVsf1xo+7cxzG/C4b9KzJXxshwL/hyrMYmR8anUDDkhGSnPV9
         49q1HJYt3L6vAU0/D82lF59Th053iazblwu1d+AT7BCMi75OPMOdHxMeTyab/QOqGZp1
         5JrvPZPqQoSwqQ4WeyAohBaesNIfHbbWR0b2CAKxwrLKYO9ZmN5Hbakw7IWZlDemuar0
         hPODSZ92CJja3f4KskTH/Hzu86RHjYdI73wn7UJ67r90vp05yFuqUjOnUiT5q8mQO1rD
         yDofi+SpJCkKtwkWFMEuPLlhuziD7tCU/7mNOKoB6PCHukNzdEmM4YpU3w2gEab/W7pQ
         I5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706410656; x=1707015456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUPe8kS/dYQxcvPbyImR2zb7xWJbztZ0Yj4HdTeCp4I=;
        b=F0+uge226xLgCaEeYSlWNr4OSUnXXW1VLSjluWjL6vB4iCVoc8GS8I8bYKuk+R13GL
         AjXf9BZgUKq/GhFs3RgT7wTtPVoybUpkzHeawjsPNydFIlXBc5UPd1jx757SSoXKvHan
         74DpKBjLjK43q4zxEn2wcG++Kh2dwlPk87f4Pm5v5Gsyvotm1rj+w7xBMqrKzQWHz7fp
         JXxWWdpZ3ryl610qkLj+R2dvGTy4m/VGxyIg4CrVyx4DrQ+hI8EqE4oKyaZBGZDQxtQ4
         y9COlyfqoBOxXkXhpI3QeoZ60tCi9duBR5vZ/HOcQ01n6GkvtOPI+yoDxpMqK5Ikd8G/
         IuDg==
X-Gm-Message-State: AOJu0YwuT3nOcHPuzgE70tX30yV3rKdP4YESu1ymbnLXKU8Jf7EBhp55
	rgbW5wa0+DbEFJ/k/P881vVneTCgtb55CcNhIhqxxrrCy+CjCfaExk1yffxfqW2C2SLjBL1azKY
	+hKIYpuBztuvJlNmKYe6g2cB29yMmKzDA5NR92w==
X-Google-Smtp-Source: AGHT+IH9hs8nV3EIySrlhWIGxmnGMq22449h+fsNcRpbxaYZsJKDaLHJx2IgCnzvK9tg/L1sdXMDyhVz1NejyYUort8=
X-Received: by 2002:ac2:4893:0:b0:50e:630d:7364 with SMTP id
 x19-20020ac24893000000b0050e630d7364mr1500830lfc.28.1706410655622; Sat, 27
 Jan 2024 18:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
 <20240127090310.GF11935@sol.localdomain>
In-Reply-To: <20240127090310.GF11935@sol.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sun, 28 Jan 2024 10:57:24 +0800
Message-ID: <CABgGipVMv-+AJkGMPzFhimaPCUVATk3gjUDG0P4btRJWtXcMxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
To: Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	masahiroy@kernel.org, nicolas@fjasle.eu, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_185741_463730_B4EDF934 
X-CRM114-Status: GOOD (  26.38  )
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

T24gU2F0LCBKYW4gMjcsIDIwMjQgYXQgNTowM+KAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAyNSwgMjAyNCBhdCAxMDozMjoxMEFN
IC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBFcmlj
IHJlcG9ydGVkIHRoYXQgYnVpbGRzIG9mIExMVk0gd2l0aCBbMV0gKGNsb3NlIHRvIHRpcCBvZiB0
cmVlKSBoYXZlCj4gPiBDT05GSUdfQVNfSEFTX09QVElPTl9BUkNIPW4gYmVjYXVzZSB0aGUgdGVz
dCBmb3IgZXhwZWN0ZWQgZmFpbHVyZSBvbgo+ID4gaW52YWxpZCBpbnB1dCBoYXMgc3RhcnRlZCBz
dWNjZWVkaW5nLgo+ID4KPiA+IFRoaXMgS2NvbmZpZyB0ZXN0IHdhcyBhZGRlZCBiZWNhdXNlICcu
b3B0aW9uIGFyY2gnIG9ubHkgY2F1c2VzIGFuCj4gPiBhc3NlbWJsZXIgd2FybmluZyB3aGVuIGl0
IGlzIHVuc3VwcG9ydGVkLCByYXRoZXIgdGhhbiBhIGhhcmQgZXJyb3IsCj4gPiB3aGljaCBpcyB3
aGF0IHVzZXJzIG9mIGFzLWluc3RyIGV4cGVjdCB3aGVuIHNvbWV0aGluZyBpcyB1bnN1cHBvcnRl
ZC4KPiA+Cj4gPiBUaGlzIGNhbiBiZSByZXNvbHZlZCBieSB0dXJuaW5nIGFzc2VtYmxlciB3YXJu
aW5ncyBpbnRvIGVycm9ycyB3aXRoCj4gPiAnLVdhLC0tZmF0YWwtd2FybmluZ3MnIGxpa2Ugd2Ug
ZG8gd2l0aCB0aGUgY29tcGlsZXIgd2l0aCAnLVdlcnJvcicsCj4gPiB3aGljaCBpcyB3aGF0IHRo
ZSBmaXJzdCBwYXRjaCBkb2VzLiBUaGUgc2Vjb25kIHBhdGNoIHJlbW92ZXMgdGhlIGludmFsaWQK
PiA+IHRlc3QsIGFzIHRoZSB2YWxpZCB0ZXN0IGlzIGdvb2QgZW5vdWdoIHdpdGggZmF0YWwgd2Fy
bmluZ3MuCj4gPgo+ID4gSSBoYXZlIGRpZmZlZCBzZXZlcmFsIGNvbmZpZ3VyYXRpb25zIGZvciB0
aGUgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMKPiA+IHRoYXQgdXNlIGFzLWluc3RyIGFuZCBJIGhh
dmUgZm91bmQgbm8gaXNzdWVzLgo+ID4KPiA+IEkgdGhpbmsgdGhpcyBjb3VsZCBnbyBpbiB0aHJv
dWdoIGVpdGhlciB0aGUga2J1aWxkIG9yIFJJU0MtViB0cmVlIHdpdGgKPiA+IHN1ZmZpY2llbnQg
YWNrcyBidXQgSSB3aWxsIGxldCB0aGVtIGZpZ2h0IG92ZXIgd2hvIHRha2VzIGl0IDopCj4gPgo+
ID4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvY29tbWl0LzNhYzlm
ZTY5ZjcwYTJiMzU0MTI2NmRhZWRiYWFhN2RjOWMwMDdhMmEKPiA+Cj4gPiAtLS0KPiA+IE5hdGhh
biBDaGFuY2VsbG9yICgyKToKPiA+ICAgICAgIGtidWlsZDogQWRkIC1XYSwtLWZhdGFsLXdhcm5p
bmdzIHRvIGFzLWluc3RyIGludm9jYXRpb24KPiA+ICAgICAgIFJJU0MtVjogRHJvcCBpbnZhbGlk
IHRlc3QgZnJvbSBDT05GSUdfQVNfSEFTX09QVElPTl9BUkNICj4gPgo+ID4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgICAgICAgfCAxIC0KPiA+ICBzY3JpcHRzL0tjb25maWcuaW5jbHVkZSAgIHwgMiAr
LQo+ID4gIHNjcmlwdHMvTWFrZWZpbGUuY29tcGlsZXIgfCAyICstCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBMb29rcyBnb29kLAo+Cj4g
VGVzdGVkLWJ5OiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+Cj4KPiBVbmZvcnR1
bmF0ZWx5IGFub3RoZXIgTExWTSBjb21taXQganVzdCBicm9rZSBUT09MQ0hBSU5fSEFTX1ZFQ1RP
Ul9DUllQVE8sIHNvCj4gSSd2ZSBzZW50IG91dCBhIHBhdGNoIHRvIGZpeCB0aGF0IHRvby4uLgo+
Cj4gQnV0IHdpdGggYWxsIHRoZSBmaXhlcyBhcHBsaWVkIGl0IHdvcmtzIGFnYWluLgo+Cj4gLSBF
cmljCgpGb3IgdGhpcyBzZXJpZXMKClRlc3RlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4KClRoYW5r
cywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
