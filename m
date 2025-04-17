Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F36C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIFSU/k4GmcfJicl4xT4AySH8sXF950irCKoCaFO4Q4=; b=FkyCOmyLOOiSZZ
	WFSk1EgMDaT4m2KQtC2JXT+Fd2q4oJjfKXDrzRACwR+KJzKaaKBFpi17uHYrkAfKD5wO40D1ndU8u
	zqQjyBTaHrXfeUDDjG+tOJQKn8La3r7Dv4ZYl+l32U1RR/Wl8cH0Jo03BmnXLVNsRonfdhjyINT9Y
	8MM+dQi96GKe7jQutzsa0QPbgrR6MigtEvz6TEPdUIlyi4ao+gcpSnCu36VFaS7rjTKNIhvK71r4m
	yS8h+q86/estVLn4rFF0X4iHlLZ+suj0V43u6TWxXFqc6c2YVDY5KkDu/pam6u9s/2LCVbCVnIfii
	GxB8TcIWXZoKhFceLRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K8M-0000000CCGS-3Bhe;
	Thu, 17 Apr 2025 07:58:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K8K-0000000CCFD-06W3
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1E7EA4B160
	for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 07:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D968EC4CEF0
	for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744876682;
	bh=Js9PnPh53l/RPMmQHOE+NlNbkf8vxe/CykSrXM0XUvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dl8W6d1OQwhWGF25I4N4e6NJW72zHAeiYIqcjLe2tToWXg1OKEnqDpfvAEsg2dAu8
	 fDAxoFvmrqNyKeZZZStUPGUBkOJ3Z94enWTerGPEMd1L1pKmllqe3XdCNPMsVHMfqG
	 jVEBBwHfOqWOn+WA5kSKNMTfWyJOipzAUK5Ah/LJmoTqKceDZ/qFboE+NiAUqSsKk4
	 SnfSxuyUH/pUEjW+vHz/DQrXrMZknUriuIn1WpafWTo7uqvBwX//cIriR8KY78bylH
	 F6yXL52XDD2jOoVhGyOXVZF//eDi0zjboVNXg2FhcQE4HxgkQAsSXqbFvmBFnM6mnN
	 dfl8GuLta+Rrg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54963160818so575450e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 00:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKh2FyAIZ3qzICUZRnUgccJGPYH30rsMbEYKzx7EtmkuTjBeFnE5z09+boT56/R93EQTHutYM5ZYjgow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0qY2vyvmL1BRyd38fKZ+YqntyA0JJeJ31xn0Io3D7kZrHpp2g
	W/a/BR4phs0Qg0IHI8HC8kArpH3G9hWbzLCFQgiFFskzDk1R2Ye0hF9Cg/Vwrn4Rv0mxDKv1wSM
	JU57e3H/pkl2S2yzM9MDiQB2FRU8=
X-Google-Smtp-Source: AGHT+IH+UGf3TCV/ileu1EuOqc6i/WlofQ6d6d2XoOO/gySbI9Xvr1O2nr7dG2avGasJMuGSvjsQhU5N69R4KoqhLdg=
X-Received: by 2002:a05:6512:3c87:b0:54a:cc11:9cc6 with SMTP id
 2adb3069b0e04-54d64a99ffcmr1827489e87.19.1744876681141; Thu, 17 Apr 2025
 00:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
In-Reply-To: <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Apr 2025 09:57:49 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
X-Gm-Features: ATxdqUFMmNbL_QaqhzIxzv2O_oKF8Akp0R3BbKtNgh9uwgL4T2xnWwluVDekAc8
Message-ID: <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Qingfang Deng <dqfext@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_005804_190031_A8705B37 
X-CRM114-Status: GOOD (  24.74  )
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

T24gVGh1LCAxNyBBcHIgMjAyNSBhdCAwOToyNSwgUWluZ2ZhbmcgRGVuZyA8ZHFmZXh0QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBIaSBBcmQsCj4KPiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAyOjU4
4oCvUE0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gKGNj
IEVyaWMpCj4gPgo+ID4gT24gVGh1LCAxNyBBcHIgMjAyNSBhdCAwODo0OSwgUWluZ2ZhbmcgRGVu
ZyA8ZHFmZXh0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IFFpbmdmYW5nIERl
bmcgPHFpbmdmYW5nLmRlbmdAc2lmbG93ZXIuY29tLmNuPgo+ID4gPgo+ID4gPiBBZGQgYSBzY2Fs
YXIgaW1wbGVtZW50YXRpb24gb2YgR0hBU0ggZm9yIFJJU0MtViB1c2luZyB0aGUgWmJjIChjYXJy
eS1sZXNzCj4gPiA+IG11bHRpcGxpY2F0aW9uKSBhbmQgWmJiIChiaXQtbWFuaXB1bGF0aW9uKSBl
eHRlbnNpb25zLiBUaGlzIGltcGxlbWVudGF0aW9uCj4gPiA+IGlzIGFkYXB0ZWQgZnJvbSBPcGVu
U1NMIGJ1dCByZXdyaXR0ZW4gaW4gcGxhaW4gQyBmb3IgY2xhcml0eS4KPiA+ID4KPiA+ID4gVW5s
aWtlIHRoZSBPcGVuU1NMIG9uZSB0aGF0IHJlbHkgb24gYml0LXJlZmxlY3Rpb24gb2YgdGhlIGRh
dGEsIHRoaXMKPiA+ID4gdmVyc2lvbiB1c2VzIGEgcHJlLWNvbXB1dGVkIChyZWZsZWN0ZWQgYW5k
IG11bHRpcGxpZWQpIGtleSwgaW5zcGlyZWQgYnkKPiA+ID4gdGhlIGFwcHJvYWNoIHVzZWQgaW4g
SW50ZWwncyBDTE1VTCBkcml2ZXIsIHRvIGF2b2lkIHJlZmxlY3Rpb25zIGR1cmluZwo+ID4gPiBy
dW50aW1lLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFu
Zy5kZW5nQHNpZmxvd2VyLmNvbS5jbj4KPiA+Cj4gPiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3Ig
dGhpcz8gQUlVSSwgdGhlIHNjYWxhciBBRVMgaW5zdHJ1Y3Rpb25zIHdlcmUKPiA+IG5ldmVyIGlt
cGxlbWVudGVkIGJ5IGFueW9uZSwgc28gaG93IGRvIHlvdSBleHBlY3QgdGhpcyB0byBiZSB1c2Vk
IGluCj4gPiBwcmFjdGljZT8KPgo+IFRoZSB1c2UgY2FzZSBfaXNfIEFFUy1HQ00sIGFzIHlvdSBt
ZW50aW9uZWQuIFdpdGhvdXQgdGhpcywgY29tcHV0aW5nCj4gR0hBU0ggY2FuIHRha2UgYSBjb25z
aWRlcmFibGUgYW1vdW50IG9mIENQVSB0aW1lIChtb25pdG9yZWQgYnkgcGVyZikuCj4KCkkgc2Vl
LiBCdXQgZG8geW91IGhhdmUgYSBwYXJ0aWN1bGFyIGNvbmZpZ3VyYXRpb24gaW4gbWluZD8gRG9l
cyBpdApoYXZlIHNjYWxhciBBRVMgdG9vPyBJIGxvb2tlZCBpbnRvIHRoYXQgYSB3aGlsZSBhZ28g
YnV0IEkgd2FzIHRvbGQKdGhhdCBub2JvZHkgYWN0dWFsbHkgaW5jb3Jwb3JhdGVzIHRoYXQuIFNv
IHdoYXQgYWJvdXQgdGhlc2UKZXh0ZW5zaW9ucz8gQXJlIHRoZXkgY29tbW9ubHkgaW1wbGVtZW50
ZWQ/CgpbMF0gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2FyZGIvbGludXguZ2l0L2xvZy8/aD1yaXNjdi1zY2FsYXItYWVzCgo+ID4gLi4uCj4gPiA+
ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIF9fdWludDEyOF90IGdldF91bmFsaWduZWRfYmUxMjgo
Y29uc3QgdTggKnApCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgX191aW50MTI4X3QgdmFsOwo+ID4g
PiArI2lmZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPgo+ID4g
Q09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgbWVhbnMgdGhhdCBnZXRfdW5h
bGlnbmVkX3h4eCgpCj4gPiBoZWxwZXJzIGFyZSBjaGVhcC4gQ2FzdGluZyBhIHZvaWQqIHRvIGFu
IGFsaWduZWQgdHlwZSBpcyBzdGlsbCBVQiBhcwo+ID4gcGVyIHRoZSBDIHN0YW5kYXJkLgo+Cj4g
VGVjaG5pY2FsbHkgYW4gdW5hbGlnbmVkIGFjY2VzcyBpcyBVQiBidXQgdGhpcyBwYXR0ZXJuIGlz
IHdpZGVseSB1c2VkCj4gaW4gbmV0d29ya2luZyBjb2RlLgo+CgpPZiBjb3Vyc2UuIEJ1dCB0aGF0
IGlzIG5vIHJlYXNvbiB0byBrZWVwIGRvaW5nIGl0LgoKPiA+Cj4gPiBTbyBiZXR0ZXIgdG8gZHJv
cCB0aGUgI2lmZGVmIGVudGlyZWx5LCBhbmQganVzdCB1c2UgdGhlCj4gPiBnZXRfdW5hbGlnbmVk
X2JlNjQoKSBoZWxwZXJzIGZvciBib3RoIGNhc2VzLgo+Cj4gQ3VycmVudGx5IHRob3NlIGhlbHBl
cnMgd29uJ3QgZ2VuZXJhdGUgcmV2OCBpbnN0cnVjdGlvbnMsIGV2ZW4gaWYKPiBIQVZFX0VGRklD
SUVOVF9VTkFMSUdORURfQUNDRVNTIGFuZCBSSVNDVl9JU0FfWkJCIGlzIHNldCwgc28gSSBoYXZl
IHRvCj4gaW1wbGVtZW50IG15IG93biB2ZXJzaW9uIG9mIHRoaXMgdG8gcmVkdWNlIHRoZSBudW1i
ZXIgb2YgaW5zdHJ1Y3Rpb25zLAo+IGFuZCB0byBhbGlnbiB3aXRoIHRoZSBvcmlnaW5hbCBPcGVu
U1NMIGltcGxlbWVudGF0aW9uLgo+CgpTbyBmaXggdGhlIGhlbHBlcnMuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
