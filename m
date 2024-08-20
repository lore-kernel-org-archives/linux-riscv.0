Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF47EC531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 05:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHgvhx2L7MY+2sYwfeVjm8ZKJyoQXH6z0H6v8uK59/w=; b=K4Bv1aaY0jAy0F
	tHFlU+X+Q2fop32WkLEsz2tAaBO5O8Tf6a31Eg9lck2TTOgRfijOv7n7LD9vIczkaHgBvo1iaH6qk
	AFUH5+u0shBo9wwSh97t+wlfsPjQE7jhUzdfhKqrPmiz2pqrRGnU5AF87rTd9SFaJPByR0UrTjRxa
	sUX9Eai+XIYHNvUdToKouLtMZDx2EuiH73s6XeQw68l96DSXQuX+1SQjhNkxIDsM20BA+E2pR/PYa
	lTaSpNxa60gd1o66VZDWSjaGx9c5smKTqWlrQm0uWGDeuHLqR0QxCVzdynTErAw/KJ+ogPL/b5fyS
	3z7kR4GepXcz4QehQUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHbJ-00000003tZr-1T6h;
	Tue, 20 Aug 2024 05:40:13 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHbG-00000003tYa-0LS0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 05:40:12 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-81f85130660so188295439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 22:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724132409; x=1724737209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHUnwVKAbv6cDNfDJWpm3qE8ItdHvxgE8FlI7r00tew=;
        b=s2xzgiB5mOb2iDH3buOMLNX3BSOS3xrX6m8fu+2Y71EhAhWlGW4zodnv8zDK3v68VQ
         h5cN02/aXNZK1U9yLGhld59O9jZUEYj/6367T1grdVuQzuBnzNogVBxVev1ZX8WHLF3C
         hCx2m6GgzTGe3y/TOWNTVV+ZSB6p4RNj1zqNMP0H4EBA/wxG6z4/kNH1ZzEM8d9MEKsp
         Zg2KxdQHzlsFDutEPgoBqjLOpsSC/VcZLNKdsUeA7QHqtHee4LNi03JS9T9AhAbX8pfb
         L9bL2yanb3O/f7xVUx7v9W5E+PzW8jfsoGvQMesSKJ+cyFLGn6ei1lCtzaxNq8EtDH6q
         DwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724132409; x=1724737209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHUnwVKAbv6cDNfDJWpm3qE8ItdHvxgE8FlI7r00tew=;
        b=D6cDQdEltf1G2Jqj6GFS+e8Ay1kM85j1y4g9S1d0oLpV8Gn4tKE/zaTDvjk3qwJhS7
         2t2wL/znm3+A3anGAW4OTPB53U5/JPMlirf9pcTAgQGRyZBnm9gVxO16jEkp9QB56n60
         ZcOr3uASg3gD0wA1G6636eIz2FcmAMuybVpDmXxgfNYiKARNpv+sPjmeRRN/kFI4hSJm
         9dJVWOT5jeqtqwx3FhZ1T8xgMbJnW9vb8s+tk7e0IPeoKtyl9qtQNiBK9XzcitFWZ1IR
         fzbmw6Gg5yN4ny+fonBUH+mMJoP2Ac2pZRXYLPKLn0y4GQ8rQ/Hs4tfI7X6GE2eLdlby
         cnVw==
X-Forwarded-Encrypted: i=1; AJvYcCUiRbn3HopdLP14w4eSnIsFanf9lKnq3og1UCDTnrUWsDTiMI80lxXrPy7PWpyot8RNER0ruriClAOP8WN6mSLZQtuMZSmuUr4T4qUVYu5r
X-Gm-Message-State: AOJu0YxpiWiROBHW1WRwjYmpTOa8xgGqwH54BM68FMYwqih2zAkePcwh
	VEisxpxt94TuhHzOm9eKO4+Ip6Wt9MVNGGnpMfRKdZFgQie8arHWGNczt26s3RjCrjSHdv/E5bZ
	jiI/8/9omcr+jY9JAJt1mZQSBAFJb1ncEZbweFA==
X-Google-Smtp-Source: AGHT+IE40VLUA+0xzyRlFpDTLoBgS8NtqsfjjIDibE9AsUZhr1cOV4VV1OW1QVjrbj6XPgBas9HhL/Y6bqd46Rnlx14=
X-Received: by 2002:a05:6e02:19c9:b0:39b:3724:6038 with SMTP id
 e9e14a558f8ab-39d56f87e9emr18824685ab.14.1724132408705; Mon, 19 Aug 2024
 22:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240815170907.2792229-1-apatel@ventanamicro.com>
In-Reply-To: <20240815170907.2792229-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 11:09:57 +0530
Message-ID: <CAAhSdy0x8X8cuXe+zYKmUousr4cCHUZPb1gL=go28U_6LKK-dg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Don't zero-out PMU snapshot area before
 freeing data
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_224010_387712_960D8520 
X-CRM114-Status: GOOD (  21.43  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMTA6MznigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXaXRoIHRoZSBsYXRlc3QgTGludXgtNi4xMS1yYzMs
IHRoZSBiZWxvdyBOVUxMIHBvaW50ZXIgY3Jhc2ggaXMgb2JzZXJ2ZWQKPiB3aGVuIFNCSSBQTVUg
c25hcHNob3QgaXMgZW5hYmxlZCBmb3IgdGhlIGd1ZXN0IGFuZCB0aGUgZ3Vlc3QgaXMgZm9yY2Vm
dWxseQo+IHBvd2VyZWQtb2ZmLgo+Cj4gICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDA1MDgKPiAg
IE9vcHMgWyMxXQo+ICAgTW9kdWxlcyBsaW5rZWQgaW46IGt2bQo+ICAgQ1BVOiAwIFVJRDogMCBQ
SUQ6IDYxIENvbW06IHRlcm0tcG9sbCBOb3QgdGFpbnRlZCA2LjExLjAtcmMzLTAwMDE4LWc0NGQ3
MTc4ZGQ3N2EgIzMKPiAgIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiAg
IGVwYyA6IF9fa3ZtX3dyaXRlX2d1ZXN0X3BhZ2UrMHg5NC8weGE2IFtrdm1dCj4gICAgcmEgOiBf
X2t2bV93cml0ZV9ndWVzdF9wYWdlKzB4NTQvMHhhNiBba3ZtXQo+ICAgZXBjIDogZmZmZmZmZmYw
MTU5MGU5OCByYSA6IGZmZmZmZmZmMDE1OTBlNTggc3AgOiBmZmZmOGY4MDAwMWYzOWIwCj4gICAg
Z3AgOiBmZmZmZmZmZjgxNTEyYTYwIHRwIDogZmZmZmFmODAwMjQ4NzJjMCB0MCA6IGZmZmZhZjgw
MDI0N2UwMDAKPiAgICB0MSA6IDAwMDAwMDAwMDAwMDA3ZTAgdDIgOiAwMDAwMDAwMDAwMDAwMDAw
IHMwIDogZmZmZjhmODAwMDFmMzlmMAo+ICAgIHMxIDogMDAwMDdmZmY4OWFjNDAwMCBhMCA6IGZm
ZmZmZmZmMDE1ZGQ3ZTggYTEgOiAwMDAwMDAwMDAwMDAwMDg2Cj4gICAgYTIgOiAwMDAwMDAwMDAw
MDAwMDAwIGEzIDogZmZmZmFmODAwMDAwMDAwMCBhNCA6IGZmZmZhZjgwMDI0ODgyYzAKPiAgICBh
NSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiBmZmZmYWY4MDAzMjhkNzgwIGE3IDogMDAwMDAwMDAw
MDAwMDFjYwo+ICAgIHMyIDogZmZmZmFmODAwMTk3YmQwMCBzMyA6IDAwMDAwMDAwMDAwODI4YzQg
czQgOiBmZmZmYWY4MDAyNDhjMDAwCj4gICAgczUgOiBmZmZmYWY4MDAyNDdkMDAwIHM2IDogMDAw
MDAwMDAwMDAwMTAwMCBzNyA6IDAwMDAwMDAwMDAwMDEwMDAKPiAgICBzOCA6IDAwMDAwMDAwMDAw
MDAwMDAgczkgOiAwMDAwN2ZmZjg2MWZkNTAwIHMxMDogMDAwMDAwMDAwMDAwMDAwMQo+ICAgIHMx
MTogMDAwMDAwMDAwMDgwMDAwMCB0MyA6IDAwMDAwMDAwMDAwMDA0ZDMgdDQgOiAwMDAwMDAwMDAw
MDAwNGQzCj4gICAgdDUgOiBmZmZmZmZmZjgxNDEyNmUwIHQ2IDogZmZmZmZmZmY4MTQxMjcwMAo+
ICAgc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDA1MDggY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMGQKPiAgIFs8ZmZmZmZmZmYwMTU5MGU5OD5dIF9fa3ZtX3dyaXRl
X2d1ZXN0X3BhZ2UrMHg5NC8weGE2IFtrdm1dCj4gICBbPGZmZmZmZmZmMDE1OTQzYTY+XSBrdm1f
dmNwdV93cml0ZV9ndWVzdCsweDU2LzB4OTAgW2t2bV0KPiAgIFs8ZmZmZmZmZmYwMTVhMTc1Yz5d
IGt2bV9wbXVfY2xlYXJfc25hcHNob3RfYXJlYSsweDQyLzB4N2UgW2t2bV0KPiAgIFs8ZmZmZmZm
ZmYwMTVhMTk3Mj5dIGt2bV9yaXNjdl92Y3B1X3BtdV9kZWluaXQucGFydC4wKzB4ZTAvMHgxNGUg
W2t2bV0KPiAgIFs8ZmZmZmZmZmYwMTVhMmFkMD5dIGt2bV9yaXNjdl92Y3B1X3BtdV9kZWluaXQr
MHgxYS8weDI0IFtrdm1dCj4gICBbPGZmZmZmZmZmMDE1OWIzNDQ+XSBrdm1fYXJjaF92Y3B1X2Rl
c3Ryb3krMHgyOC8weDRjIFtrdm1dCj4gICBbPGZmZmZmZmZmMDE1OGU0MjA+XSBrdm1fZGVzdHJv
eV92Y3B1cysweDVhLzB4ZGEgW2t2bV0KPiAgIFs8ZmZmZmZmZmYwMTU5OTMwYz5dIGt2bV9hcmNo
X2Rlc3Ryb3lfdm0rMHgxNC8weDI4IFtrdm1dCj4gICBbPGZmZmZmZmZmMDE1OTMyNjA+XSBrdm1f
ZGVzdHJveV92bSsweDE2OC8weDJhMCBba3ZtXQo+ICAgWzxmZmZmZmZmZjAxNTkzM2Q0Pl0ga3Zt
X3B1dF9rdm0rMHgzYy8weDU4IFtrdm1dCj4gICBbPGZmZmZmZmZmMDE1OTM0MTI+XSBrdm1fdm1f
cmVsZWFzZSsweDIyLzB4MmUgW2t2bV0KPgo+IENsZWFybHksIHRoZSBrdm1fdmNwdV93cml0ZV9n
dWVzdCgpIGZ1bmN0aW9uIGlzIGNyYXNoaW5nIGJlY2F1c2UgaXQgaXMKPiBiZWluZyBjYWxsZWQg
ZnJvbSBrdm1fcG11X2NsZWFyX3NuYXBzaG90X2FyZWEoKSB1cG9uIGd1ZXN0IHRlYXIgZG93bi4K
Pgo+IFRvIGFkZHJlc3MgdGhlIGFib3ZlIGlzc3VlLCBzaW1wbGlmeSB0aGUga3ZtX3BtdV9jbGVh
cl9zbmFwc2hvdF9hcmVhKCkgdG8KPiBub3QgemVyby1vdXQgUE1VIHNuYXBzaG90IGFyZWEgZnJv
bSBrdm1fcG11X2NsZWFyX3NuYXBzaG90X2FyZWEoKSBiZWNhdXNlCj4gdGhlIGd1ZXN0IGlzIGFu
eXdheSBiZWluZyB0b3JlIGRvd24uCj4KPiBUaGUga3ZtX3BtdV9jbGVhcl9zbmFwc2hvdF9hcmVh
KCkgaXMgYWxzbyBjYWxsZWQgd2hlbiBndWVzdCBjaGFuZ2VzCj4gUE1VIHNuYXBzaG90IGFyZWEg
b2YgYSBWQ1BVIGJ1dCBldmVuIGluIHRoaXMgY2FzZSB0aGUgcHJldmlvdXMgUE1VCj4gc25hcGhz
b3QgYXJlYSBtdXN0IG5vdCBiZSB6ZXJvZWQtb3V0IGJlY2F1c2UgdGhlIGd1ZXN0IG1pZ2h0IGhh
dmUKPiByZWNsYWltZWQgdGhlIHBlcnZpb3VzIFBNVSBzbmFwc2hvdCBhcmVhIGZvciBzb21lIG90
aGVyIHB1cnBvc2UuCj4KPiBGaXhlczogYzJmNDFkZGJjZGQ3ICgiUklTQy1WOiBLVk06IEltcGxl
bWVudCBTQkkgUE1VIFNuYXBzaG90IGZlYXR1cmUiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4
LTYuMTEgZml4ZXMuCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jIHwgMTQgKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRleCBiY2Y0MWQ2ZTBkZjAu
LjI3MDdhNTFiMDgyYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC0zOTEsMTkgKzM5MSw5IEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV9wbXVfcmVhZF9ocG0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNp
Z25lZCBpbnQgY3NyX251bSwKPiAgc3RhdGljIHZvaWQga3ZtX3BtdV9jbGVhcl9zbmFwc2hvdF9h
cmVhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9wbXUg
Kmt2cG11ID0gdmNwdV90b19wbXUodmNwdSk7Cj4gLSAgICAgICBpbnQgc25hcHNob3RfYXJlYV9z
aXplID0gc2l6ZW9mKHN0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSk7Cj4KPiAtICAgICAg
IGlmIChrdnBtdS0+c2RhdGEpIHsKPiAtICAgICAgICAgICAgICAgaWYgKGt2cG11LT5zbmFwc2hv
dF9hZGRyICE9IElOVkFMSURfR1BBKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0
KGt2cG11LT5zZGF0YSwgMCwgc25hcHNob3RfYXJlYV9zaXplKTsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBrdm1fdmNwdV93cml0ZV9ndWVzdCh2Y3B1LCBrdnBtdS0+c25hcHNob3RfYWRkciwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdnBtdS0+c2Rh
dGEsIHNuYXBzaG90X2FyZWFfc2l6ZSk7Cj4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgcHJfd2Fybigic25hcHNob3QgYWRkcmVzcyBpbnZhbGlkXG4i
KTsKPiAtICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICBrZnJlZShrdnBtdS0+c2Rh
dGEpOwo+IC0gICAgICAgICAgICAgICBrdnBtdS0+c2RhdGEgPSBOVUxMOwo+IC0gICAgICAgfQo+
ICsgICAgICAga2ZyZWUoa3ZwbXUtPnNkYXRhKTsKPiArICAgICAgIGt2cG11LT5zZGF0YSA9IE5V
TEw7Cj4gICAgICAgICBrdnBtdS0+c25hcHNob3RfYWRkciA9IElOVkFMSURfR1BBOwo+ICB9Cj4K
PiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
