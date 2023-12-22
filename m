Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78051C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwQvipmj6A/2KIEwzruQ5BoGdlTvuxPAu4TD0ybtbCA=; b=kJ+PSfaEgy3Jw3
	K4qeZlQPpAil1/XTlRl87zdoYr0AVMO6uUtgslWiqOMgE9eZa0/IkZWjHhgtmuI0JPGfcUwHCZSXe
	ZrDMRqMOPL5vCYNnJUOW9UkpEGEjSUeyOOegAGC/Q/eA0AHZdRYKwxB1n5gQQpYOemynz+Zxfq7pb
	9EaNj4rvCvE9X82TrgMUPeOB/SDzNwgS7HnM7TYSncSf6wGEddQkhRNmcPOt9C8mlrioeS1SEBzLT
	G/xv4qE5eYpHklkv+bkaKy8o+ymXNJGOixbF0dXUMuIcpphRzEwH31ylitMwRN9TwYTfZZexRLIP1
	JJ3B+6YOmpX/ZurfBwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGZmN-0058Mc-1k;
	Fri, 22 Dec 2023 07:17:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGZmK-0058LV-1F
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C69ECE2146
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 07:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26C1C433D9
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703229418;
	bh=AmoDXVpNKvbg5N7cc7yKcoH92BR12IIZfapYIlltAxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r41kLtfL2hUb62E5S89CzuSkDgNBkc+vJTswBnfqlC5irF1AGpf+wGsJkxuB6laRj
	 /eTPhOtHY47mL+aHWJ8ro+yzHPUFwsZ/X2ODKYXuERhN9UTig7w/atzKeCI0FZBb11
	 8RMGSUXpzbfvgL0EpmJrwQuBlQ2T4K91711aSsWWD9IWN/CIdfonSL5PEJm8p+Dzfg
	 eAYy15r/a/dyuCYQ4MnmZX+Wwzj845GiJqDCtCfahHx3BsA4VCo4Zac/8ZmrBS5gNT
	 hpcb0UI7iF6gwVab5+6IeiTq8ucnQiGCeHyfkH4zb9dZxUvezOqX6p4eRwRJa0/44H
	 hMu5mRBga9X7A==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so1240766a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:16:58 -0800 (PST)
X-Gm-Message-State: AOJu0Yzgj4M9q/TqVvGcSM9R4WROfL9HI/9VV1QLcW7FbXN6tcduhAr+
	oTKID8KBurJhyKQA5XAcZ0EZW8CM5jdxiPIHgqU=
X-Google-Smtp-Source: AGHT+IE3X2hSqss34/czMpkaTKnKCVy0/FHIwAHVJCTsdbIbrat3pjm8jzKzm4gX63iuDvkMwzARuTOeG2GDH67Wt0I=
X-Received: by 2002:a50:934d:0:b0:553:6b21:6c6 with SMTP id
 n13-20020a50934d000000b005536b2106c6mr450284eda.2.1703229417320; Thu, 21 Dec
 2023 23:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-4-guoren@kernel.org>
 <ZYUVTFqvIIqv7D9O@LeoBras>
In-Reply-To: <ZYUVTFqvIIqv7D9O@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 15:16:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSZSWJ7qZQckuALHkcJb8kEGTnb8wJQ9H2wgODkN56Lw@mail.gmail.com>
Message-ID: <CAJF2gTQSZSWJ7qZQckuALHkcJb8kEGTnb8wJQ9H2wgODkN56Lw@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	david@redhat.com, panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, 
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_231704_802572_4F613CDD 
X-CRM114-Status: GOOD (  15.92  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6NDnigK9QTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDc6MDBB
TSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9y
ZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gUmVtb3ZlIFRBU0tfU0laRV9NSU4gYmVjYXVz
ZSBpdCdzIG5vdCB1c2VkIGFueW1vcmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8
Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaCB8IDIgLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gaW5kZXggNzRmZmIyMTc4ZjU0Li5lNDE1NTgyMjc2
ZWMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IEBAIC04NzgsNyArODc4
LDYgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBw
dGUpCj4gPiAgICovCj4gPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ID4gICNkZWZpbmUgVEFTS19T
SVpFXzY0IChQR0RJUl9TSVpFICogUFRSU19QRVJfUEdEIC8gMikKPiA+IC0jZGVmaW5lIFRBU0tf
U0laRV9NSU4gICAgICAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+Cj4g
PiAgI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ICAjZGVmaW5lIFRBU0tfU0laRV8zMiAoX0FDKDB4
ODAwMDAwMDAsIFVMKSkKPiA+IEBAIC04OTAsNyArODg5LDYgQEAgc3RhdGljIGlubGluZSBwdGVf
dCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gPgo+ID4gICNlbHNlCj4gPiAg
I2RlZmluZSBUQVNLX1NJWkUgICAgRklYQUREUl9TVEFSVAo+ID4gLSNkZWZpbmUgVEFTS19TSVpF
X01JTiAgICAgICAgVEFTS19TSVpFCj4gPiAgI2VuZGlmCj4gPgo+ID4gICNlbHNlIC8qIENPTkZJ
R19NTVUgKi8KPiA+IC0tCj4gPiAyLjQwLjEKPiA+Cj4KPiBPbiB0b3J2YWxkcy9tYXN0ZXI6Cj4K
PiAkZ2l0IGdyZXAgVEFTS19TSVpFX01JTgo+IGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oOjIzOiNkZWZpbmUgVEFTS19TSVpFX01JTiBUQVNLX1NJWkUKPiBhcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDozNjojZGVmaW5lIFRBU0tfU0laRV9NSU4gVEFT
S19TSVpFMzIKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaDo4ODE6I2RlZmluZSBU
QVNLX1NJWkVfTUlOICAgICAgKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+IGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oOjg5MzojZGVmaW5lIFRBU0tfU0laRV9NSU4g
ICAgICBUQVNLX1NJWkUKPgo+IEkgY2FuIG9ubHkgc2VlIGRlZmluaXRpb25zLCB3aXRob3V0IGFu
eSB1c2FnZSwgc28gYWdyZWVkIG9uIHJlbW92aW5nIHRoZW0uCj4KPiBGV0lXOgo+IFJldmlld2Vk
LWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+ClRoeAoKPgo+IEkgd291bGQg
YWxzbyBzZW5kIGEgcGF0Y2ggZm9yIGxvb25nYXJjaCwgc2luY2UgdGhleSBhcmUgaW4gdGhlIHNh
bWUgYm9hdCA6KQpFaC4uLiBJJ3ZlIHNlbnQgb25lIHllc3RlcmRheSB0b2dldGhlci4KCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC8yMDIzMTIyMTA1NDYyNC4yMjA4MDE5LTEtZ3Vv
cmVuQGtlcm5lbC5vcmcvCgo+Cj4gVGhhbmtzIQo+IExlbwo+CgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
