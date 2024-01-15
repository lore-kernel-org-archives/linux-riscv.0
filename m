Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0425C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWtNR6P13bgx+wHV4W1iXk2ja/VSUAwQ0Jdol/k2Moo=; b=EJ8MplIoiopQd3
	FDtSMC7Ac6ioostYfgUdh1XbMWyiqKIrs2AIwlYGcalVvSbBwejo1u+eftaokG8b+68Yi1rMSL8kq
	pynm/e0JYLIJntJV89/tPwC0thHmPoNeqYYsCg3G8tc12N0Ek98MUKislBQkKRGI9d7AIK7DSJnIm
	YNPzhGNPCq+oD/M9On7Hpr3smGhv042B/V1TgaL5v4eYIo6/o47CeEpVEIlKnyhHUumQFK2aOmvQn
	KSVLp8IMzoZAojZx5fNHb99WGc3v3PAvLpZAwBgSqKoEVZ+HEVEt3/npUy8Tb7TYmswoQLogrhJYD
	i1wvUG82w/nJqwiZeLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPLH0-008nX9-0U;
	Mon, 15 Jan 2024 11:36:58 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPLGx-008nU3-0I
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 11:36:56 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b77c843fbeso2299142e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705318612; x=1705923412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJFAvLMz2J3MmzgE9uWmzOvMvjh083nEDAmUPJ1MARE=;
        b=VDxoO4fy/AKzr1b25OglJp7WaFnyev1ZxUaivcFJuVz+jXy6QOBIxUfGGznh/ld8Tr
         xtaqEfji6QHZQG+GUvmWevc6ek/u5fxqa9fAxJD0qOg2EHZX8IAGQUEpC81IU69OVhuN
         FQDQfn6P/5rMgh15gGJxmJErkSYFngS9nfK4/YEepeAaKOCPptNOr28bm5k894ZWrmX6
         +hBJduonL3L7YXoi7Mrg3FM63e/QAYIP/l4mVdZyifqiVULlqDXg6bpdQk0ecP/SJXcD
         IpfxpBWoKrFx2Gk6hnctZzHNlJVukcHbyXDb2W4iaGhKi32b4HVDiADfkOycQQ5KExqm
         t+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705318612; x=1705923412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJFAvLMz2J3MmzgE9uWmzOvMvjh083nEDAmUPJ1MARE=;
        b=qPoO6wBDgR0XhtqCq5TNphhVeqpTXdMwBm7kSrvGchUQFJKHaXBprWfm3KXUPjhwmY
         iybuzIEBNGuCZdj2lGgh3M6gtc+RiOkrpNnA4W+cKKvkq60XW+Nhr2edlTQle0PVh/N6
         Tc7Qetbr5DDPsOXqyvu662PjnketNZMv0q4Fk+Falu7VOd+9vypD//rTVHWtZRnE/OLf
         KXvnJsU8dVqjNRSuLAVgoQ4CjL+zyvRYLuULTftXcgCkBPiE0S/h0CekTh41W43uYvRP
         Sc5wUo3c76msgi6V2JJZNgz/vRd5IMO2sU5mQYHK8Gs00ijHljrdNG0twnx0KeBPFV/w
         XdbA==
X-Gm-Message-State: AOJu0Yy/OjHMMZlySk2wyJLS8cuHlbfBrY3Q3e3CcKX/8LIjLKs/uV3J
	FmYZPkJ+KZjm86H6ypf53XenzCtzRYmNxse+l8A=
X-Google-Smtp-Source: AGHT+IHR1SzYVTZBhQKXrGTJlfGN+9M6Ovd3ejLgBp7G/V/xXyTVpHsvP9eWdT9fBzsJi5wAkY7tlLnkTeVhOxUlzoE=
X-Received: by 2002:a05:6122:c91:b0:4b6:e73d:7203 with SMTP id
 ba17-20020a0561220c9100b004b6e73d7203mr2330533vkb.14.1705318612468; Mon, 15
 Jan 2024 03:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20240111131558.31211-1-andy.chiu@sifive.com> <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
 <CA+V-a8v8X0idpo89ZViVJK-7WwKnCojJ7B9449t3v4Y5Rfvh7w@mail.gmail.com> <CABgGipUnT9VBf5ndU+=tYdaw9sbiKw=tJaJMGoJjUeFQB3h2bw@mail.gmail.com>
In-Reply-To: <CABgGipUnT9VBf5ndU+=tYdaw9sbiKw=tJaJMGoJjUeFQB3h2bw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Jan 2024 11:36:25 +0000
Message-ID: <CA+V-a8si08u40EepDBvG+z5k-_06Y1XhoQz4cYD_haNLx11Xgw@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: Andy Chiu <andy.chiu@sifive.com>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com, 
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de, 
	ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_033655_149932_1CAD48CF 
X-CRM114-Status: GOOD (  31.57  )
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

SGkgQW5keSwKCk9uIFNhdCwgSmFuIDEzLCAyMDI0IGF0IDE6MjbigK9QTSBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+IE9uIFNhdCwg
SmFuIDEzLCAyMDI0IGF0IDQ6MDXigK9BTSBMYWQsIFByYWJoYWthcgo+IDxwcmFiaGFrYXIuY3Nl
bmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgNjoz
MuKAr0FNIDxwYXRjaHdvcmstYm90K2xpbnV4LXJpc2N2QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBIZWxsbzoKPiA+ID4KPiA+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlz
Y3YvbGludXguZ2l0IChmb3ItbmV4dCkKPiA+ID4gYnkgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBy
aXZvc2luYy5jb20+Ogo+ID4gPgo+ID4gPiBPbiBUaHUsIDExIEphbiAyMDI0IDEzOjE1OjQ4ICsw
MDAwIHlvdSB3cm90ZToKPiA+ID4gPiBUaGlzIHNlcmllcyBwcm92aWRlcyBzdXBwb3J0IHJ1bm5p
bmcgVmVjdG9yIGluIGtlcm5lbCBtb2RlLgo+ID4gPiA+IEFkZGl0aW9uYWxseSwga2VybmVsLW1v
ZGUgVmVjdG9yIGNhbiBiZSBjb25maWd1cmVkIHRvIHJ1biB3aXRob3V0Cj4gPiA+ID4gdHVybm5p
bmcgb2ZmIHByZWVtcHRpb24gb24gYSBDT05GSUdfUFJFRU1QVCBrZXJuZWwuIEFsb25nIHdpdGgg
dGhlCj4gPiA+ID4gc3Vwb3J0LCB3ZSBhZGQgVmVjdG9yIG9wdGltaXplZCBjb3B5X3t0byxmcm9t
fV91c2VyLiBBbmQgcHJvdmlkZSBhCj4gPiA+ID4gc2ltcGxlIHRocmVzaG9sZCB0byBkZWNpZGUg
d2hlbiB0byBydW4gdGhlIHZlY3Rvcml6ZWQgZnVuY3Rpb25zLgo+ID4gPiA+Cj4gPiA+ID4gV2Ug
ZGVjaWRlZCB0byBkcm9wIHZlY3Rvcml6ZWQgbWVtY3B5L21lbXNldC9tZW1tb3ZlIGZvciB0aGUg
bW9tZW50IGR1ZQo+ID4gPiA+IHRvIHRoZSBjb25jZXJuIG9mIG1lbW9yeSBzaWRlLWVmZmVjdCBp
biBrZXJuZWxfdmVjdG9yX2JlZ2luKCkuIFRoZQo+ID4gPiA+IGRldGFpbGVkIGRlc2NyaXB0aW9u
IGNhbiBiZSBmb3VuZCBhdCB2OVsxXQo+ID4gPiA+Cj4gPiA+ID4gWy4uLl0KPiA+ID4KPiA+ID4g
SGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgo+ID4gPiAgIC0gW3YxMCwwMS8xMF0gcmlz
Y3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKPiA+ID4gICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9jMGFlMzUwZjcxNGYKPiA+ID4gICAtIFt2MTAsMDIvMTBd
IHJpc2N2OiB2ZWN0b3I6IG1ha2UgVmVjdG9yIGFsd2F5cyBhdmFpbGFibGUgZm9yIHNvZnRpcnEg
Y29udGV4dAo+ID4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2ViZjUyYWMz
MGU0Zgo+ID4gPiAgIC0gW3YxMCwwMy8xMF0gcmlzY3Y6IEFkZCB2ZWN0b3IgZXh0ZW5zaW9uIFhP
UiBpbXBsZW1lbnRhdGlvbgo+ID4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9j
LzlmZjk3MjExYTYyMwo+ID4gPiAgIC0gW3YxMCwwNC8xMF0gcmlzY3Y6IHNjaGVkOiBkZWZlciBy
ZXN0b3JpbmcgVmVjdG9yIGNvbnRleHQgZm9yIHVzZXIKPiA+ID4gICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcmlzY3YvYy9mNDQ3MTI1MmYzYjkKPiA+ID4gICAtIFt2MTAsMDUvMTBdIHJpc2N2
OiBsaWI6IHZlY3Rvcml6ZSBjb3B5X3RvX3VzZXIvY29weV9mcm9tX3VzZXIKPiA+ID4gICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xNDVjYTZlZGRkNzAKPiA+ID4gICAtIFt2MTAs
MDYvMTBdIHJpc2N2OiBmcHU6IGRyb3AgU1JfU0QgYml0IGNoZWNraW5nCj4gPiA+ICAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMjVhODMwOTQ0NzczCj4gPiA+ICAgLSBbdjEwLDA3
LzEwXSByaXNjdjogdmVjdG9yOiBkbyBub3QgcGFzcyB0YXNrX3N0cnVjdCBpbnRvIHJpc2N2X3Zf
dnN0YXRlX3tzYXZlLHJlc3RvcmV9KCkKPiA+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cmlzY3YvYy85ZGVjZThiZjAzNDMKPiA+ID4gICAtIFt2MTAsMDgvMTBdIHJpc2N2OiB2ZWN0b3I6
IHVzZSBhIG1hc2sgdG8gd3JpdGUgdnN0YXRlX2N0cmwKPiA+ID4gICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcmlzY3YvYy9jMDU5OTI3NDdjOTYKPiA+ID4gICAtIFt2MTAsMDkvMTBdIHJpc2N2
OiB2ZWN0b3I6IHVzZSBrbWVtX2NhY2hlIHRvIG1hbmFnZSB2ZWN0b3IgY29udGV4dAo+ID4gPiAg
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzY2MDIxNzQyOTYxNAo+ID4gPiAgIC0g
W3YxMCwxMC8xMF0gcmlzY3Y6IHZlY3RvcjogYWxsb3cga2VybmVsLW1vZGUgVmVjdG9yIHdpdGgg
cHJlZW1wdGlvbgo+ID4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2FhMjNj
NjE3MmQzMwo+ID4gPgo+ID4gV2l0aCB0aGlzIHNlcmllcyBtZXJnZWQgaW4gUlovRml2ZSBzdG9w
cyBib290aW5nIFswXSwgSSBkb250IGdldCBhbnkKPiA+IHBhbmljIGFzIHN1Y2ggYnV0IGl0J3Mg
YSBrZXJuZWwgZnJlZXplLiBSZXZlcnRpbmcgdGhpcyBzZXJpZXMgYWxsCj4gPiBib290cyB1cCBP
Sy4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L2hpZGRlbi9hODI5MzI0MC8K
Pgo+IFRoYW5rcyBmb3IgdGhlIG5vdGUuCj4KPiBVbmZvcnR1bmF0ZWx5IEkgZGlkbid0IGZpbmQg
YSBkaXJlY3QgY2x1ZSBvZiBmYWlsdXJlIGZyb20geW91ciBsb2cuCj4gQnV0IEkgYmVsaWV2ZSB0
aGlzIGlzIHRoZSBzYW1lIGNhc2UgYXMgdGhlIGFscGluZSBvbmUgYWJvdmUsIGJlY2F1c2UKPiB0
aGV5IHdvdWxkIGZhaWwgdmVyeSBlYXJseS4gSSBoYXZlIHVwZGF0ZWQgYSBicmFuY2ggaGVyZVsw
XS4gSXQgc2hvdWxkCj4gYmUgZml4ZWQgbm93LiBBbHNvLCBpdCBzaG91bGQgZml4IHRoZSBib290
IGZhaWx1cmUgdGhhdCBhcHBlYXJzIG9uCj4gVWJ1bnR1LiBJdCB3b3VsZCBiZSBuaWNlIGlmIHlv
dSBjb3VsZCBoYXZlIGEgdHJ5LiBJIHdpbGwgc2VuZCBpdCBvdXQKPiBhcyB2MTEgaWYgbm8gZnVy
dGhlciBpc3N1ZSBpcyBkZXRlY3RlZCBiZWZvcmUgdGhlIHdlZWsgZW5kcy4KPgo+IFswXSBodHRw
czovL2dpdGh1Yi5jb20vc2lmaXZlL3Jpc2N2LWxpbnV4L3RyZWUvMmIyNWRmMmFkM2EzNjUxYmMx
Zjc3ZmVjNjVjOTVhMWFlNjU2ZDY3NQo+CkkgY2FuIGNvbmZpcm0gd2l0aCB0aGUgcGF0Y2hlcyBh
cHBsaWVkIGZyb20gYWJvdmUgbGluaywgdGhlIFJaL0ZpdmUKU01BUkMgcGxhdGZvcm0gY2FuIGJv
b3QgYXMgbm9ybWFsLgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gPgo+ID4gQ2hlZXJzLAo+ID4gUHJh
Ymhha2FyCj4gPgo+ID4gPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPiA+ID4gLS0KPiA+
ID4gRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KPiA+ID4gaHR0cHM6Ly9rb3JnLmRvY3Mua2Vy
bmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cj4KPiBUaGFua3MsCj4gQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
