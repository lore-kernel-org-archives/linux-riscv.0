Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55689CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecxn45hPYWeiStg00N5SIwL9oRRRNj96Cl0PPoSuyIk=; b=4WevF+X2b5GIsl
	GDoZojEzggBHTURtB3tQ9g0NiGbhUgahVn5U7ThQxQgU12U1iSh6YRJ8KJSzs0aZLfbjxl2mA0zw/
	cFs0oaN/thviJolgliz0F6x6urT4HasddOZLt7jxgauOoQxxyhW9/R1qwPjKOr3INo8crFer7NBBc
	liI65l7HAklLp4C5zQEN3o8cJBD9TS/o1kNKLFcLPkMx1HLD+l4a2G23miFFpYOGKWZoPo6EeRe9n
	4F8IMNLnDj29OVVMA4uwUIVptyU8eRp7ZONooqc2EEGns5J+1UxXKZGQGGqKBLuMxZMr0iLCtqTjd
	RBQzlFEVgknoxAX+SVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTy-0000000BvBJ-3uQR;
	Mon, 24 Nov 2025 15:28:02 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTx-0000000BvAM-153Z
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 15:28:02 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-43346da8817so21095855ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763998080; x=1764602880; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1RSYP6MsAvIm0Pq2Uruz+WZQe9fgkegsjE1gjboYnk=;
        b=b5BBTp6ObLbrACYdFbo/vr5UEqRQT2NPhZGvMejyz1BaOh1vOeOKQrr3Z/9WbFAqQZ
         3siezo5pRuLP/AAk9WxuAbTJ/LWCsBE40qa6VK/MD/BahUtkd+PTXuxbN9ElMZYFoeH2
         XxLI3vfVQalNNAbll532jr9cSunUGX6CXzDLEMSp4aaF1A5N8u3TaNb87vEjpM6uejHo
         wontdpN55fpHLO+RDwFXXnKnkK5OxpmVShh3zHqvX6Qi1L1SvOOAbalW+uTWMVOwAun5
         X8y/IzJ1ZH1Qb/rr8O0qYrkWn1vn7UZ+p5li+g72wLo+uL2PMqp5ECqHJ52UOmw+dp35
         Fh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998080; x=1764602880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1RSYP6MsAvIm0Pq2Uruz+WZQe9fgkegsjE1gjboYnk=;
        b=Un+pjW/TAaWb3A8US4GnVPsM64JGsdqBR5iYWbxX4Sm4KrH4WIpj2Qz3GtR92Kg7Y8
         KvrX7gQda4FYPqC9XIH8iR1cEtBTCFj2/xC4lU4C2UgWzkOK7Tggtis3o2sHGcCyNeWY
         LpIYfZC6Oe+17AkXFzSzTe7rlJGC63bWrL0ZQt+BV+TGICIt+B335ojbonzSyZzBWmVD
         cC6DauDSsTtoFKPelgB3XRfcdn9yoAuDY5ELXtbkVrC9k8yecdRUf3+LzPw6+b+jOp1M
         ZVMaIZKeSyipGM0JezowrLZGgIyLnDhot9BbXTmcu0WF/Ga+Or7HUrtPZUomvSaVOVMG
         7E8w==
X-Forwarded-Encrypted: i=1; AJvYcCU6uNfMAVzQwI0QyaxcgJzUL1/9ymj38EINN5KxLZwIgyZ4hdI6T01uE9ZS/Cv/Pp3YhraO7iEXxRtAqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZSEbT5zE7zYnjl6heYn0TmxKIwiTIKhxfY/PMIK6vPoVrB9Nh
	2jk+6XfwMoMOLFMa4kx87v9bGMj/bkFXaCHhMqRgs8BvzEeL0wXAY/72aoH7V5MlZAw=
X-Gm-Gg: ASbGncvCpQrtU326BphYLfz8mD/PJiMdO3XtIQ3pxkL2T97UjLh0kUmFatSOIXKK5Sg
	yAV+WW3+Ni5T7XnT1pnCplj9o6vtjG7g2x9BR6CftYmlt4a00XoldLepsF5qYXuC2TjU3sceP9u
	JRb+vlOT15dnypm7Q2EJTDHeu9eRQG593cu9GqMvNf5IOKkBN8W9QKA4EXUjOtKKTKzeh8ovID6
	4xeXX2oZgjZJLpvk1ekJpNaH0o85nQRvI9iiXGCe6tm5Gnxx5Acw5YX+YmEuISHrPRmMjaMMKYK
	lWGU6aYFmtNhmMwxusQzy6ZFb4YgTAORtSZM/s9kPmrzXE/edOQg6C6pYjZwxmY9eWtReffe/8x
	eWno96GQaEB1bIdJPAlDlBeiVA6EiReana6g6M4RcmDebFjN9wiiZjNHdgHVuWUn+F5R2HBa3aw
	+qmvsFumtfkRc0
X-Google-Smtp-Source: AGHT+IHmDpkWVE+bXi7YcFx06zdDu1mvUX5E8wtndVMa3n+flWgwc0GhUUEOVNOo3pwJ3is8DkRQDw==
X-Received: by 2002:a05:6e02:3187:b0:433:7842:7967 with SMTP id e9e14a558f8ab-435b90f7448mr96578225ab.11.1763998079832;
        Mon, 24 Nov 2025 07:27:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-435a90dba32sm60356135ab.28.2025.11.24.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:27:59 -0800 (PST)
Date: Mon, 24 Nov 2025 09:27:57 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: fangyu.yu@linux.alibaba.com, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
Message-ID: <20251124-4ecf1b6b91b8f0688b762698@orel>
References: <20251122075023.27589-1-fangyu.yu@linux.alibaba.com>
 <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072801_304925_979086DF 
X-CRM114-Status: GOOD (  14.76  )
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

T24gU3VuLCBOb3YgMjMsIDIwMjUgYXQgMTA6MzM6MTlBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBTYXQsIE5vdiAyMiwgMjAyNSBhdCAzOjUw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGli
YWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXgu
YWxpYmFiYS5jb20+Cj4gPgo+ID4gQ3VycmVudGx5LCBIR0FUUCBtb2RlIHVzZXMgdGhlIG1heGlt
dW0gdmFsdWUgZGV0ZWN0ZWQgYnkgdGhlIGhhcmR3YXJlCj4gPiBidXQgb2Z0ZW4gc3VjaCBhIHdp
ZGUgR1BBIGlzIHVubmVjZXNzYXJ5LCBqdXN0IGFzIGEgaG9zdCBzb21ldGltZXMKPiA+IGRvZXNu
J3QgbmVlZCBzdjU3Lgo+ID4gSXQncyBsaWtlbHkgdGhhdCBubyBhZGRpdGlvbmFsIHBhcmFtZXRl
cnMgKGxpa2Ugbm81bHZsIGFuZCBubzRsdmwpIGFyZQo+ID4gbmVlZGVkLCBhbGlnbmluZyBIR0FU
UCBtb2RlIHRvIFNBVFAgbW9kZSBzaG91bGQgbWVldCB0aGUgcmVxdWlyZW1lbnRzCj4gPiBvZiBt
b3N0IHNjZW5hcmlvcy4KPiBZZXMsIG5vNS80bHZsIGlzIG5vdCBjbGVhciBhYm91dCBzYXRwIG9y
IGhnYXRwLiBTbywgY292ZXJpbmcgSEdQQVRQIGlzCj4gcmVhc29uYWJsZS4KClRoZSBkb2N1bWVu
dGF0aW9uIHNob3VsZCBiZSBpbXByb3ZlZCwgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBz
dGF0ZQp0aGF0IHRoZXNlIHBhcmFtZXRlcnMgYXBwbHkgdG8gYm90aCBzLSBhbmQgZy1zdGFnZS4g
SWYgd2UgbmVlZCBwYXJhbWV0ZXJzCnRvIGRpY3RhdGUgS1ZNIGJlaGF2aW9yIChnLXN0YWdlIG1h
bmFnZW1lbnQpLCB0aGVuIHdlIHNob3VsZCBhZGQgS1ZNCm1vZHVsZSBwYXJhbWV0ZXJzLgoKVGhh
bmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
