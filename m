Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C782C624D3
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLCnAXe8RIletc/5pM8eJ5STTB0t+j9BX4x1HxhH4wg=; b=dBvipBj8NKsGZV
	B1C5Bfep1gbJyyy1ay2D3f7WVcjyyGs84XgAlCnv6qYXVh4XeOA1l+PE0LR9vry6R7nWaWBFQpC6I
	vImew+zEnXAmGpFES8z9dCErJ1yt/+yJBnDqULa82oeocJjae33h/CwwltSBkF0kflZnewaY1Yiuf
	DZOZCwQQ297vBMINunZSt73hvQNriJ41Pj32+y8Hlpiqk95fZ5/EMkeOt1MNSELAy8w3Ub1bSQrS9
	tlpOMAU6/slWyt2WBmIOjz3AHIYeZ/AQA3bZSMUt3IwcYcLexhLB9H6bJYVJDyoMToqMvBksiS3eW
	1J48QjSon+zcqb3qnuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V3o-00000002PP0-30uW;
	Fri, 04 Sep 2026 14:38:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V3n-00000002POW-1x70
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 14:38:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7F8541212
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 14:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDF91F00A3D
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532710;
	bh=35hah3ul6tI29YPkX4PeIj+oqlMkJqdL3z01PNAAsrg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SiG00Z5CF353Uf2DYrIXUx4/MBmlozwYEdDH7eVn9n9Wv4TcwENDhU1IL2HV3sx0n
	 nlqqRVfViv2HW3/KM6Uc+jpa4BYuk7oLLai2YSffkRLwYZK6JZZ0rCWvhIm86lNIhn
	 Vium3ZebWOCTWfPp/sY/R0I9avFQ3kfFK1LlMIf+vpolf+7123/GNu+8D2Hx11tMPH
	 Xm7XN9WefnHv7H5OzvHUtaXg3NNTBG3O1eg1gjpYMv2VW2jedR3vbNbLXD259VYADo
	 QkJDm+ADRJkZ9EnL5zovA317pkiTZkWhC1lMK6zQnT8IYe+TKZyVAdsSfxV+VTuIM6
	 GfubG7/rchZKw==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48589798dbbso700837f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 07:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFCTJxp75hugfcvzBQZ3G+D5uNPRKvMd1fowkZ4HH/bCqxkaiqyPCj2RSFsOZuH9IQicaSArQgBL3rkA==@lists.infradead.org
X-Gm-Message-State: AFuF++knUwRe1pl8tZ4kjTgsHlDe7IARc0Ta4lCc/N+qHhfjrCAdDFEQ
	aJiV5ABOKKf91Dtq9UeRpB4RVObCQcNYKTH1oXrJGLvz0zP03ztKH1GSdnYaC9lZ7Vc3GLn4+hi
	nBklAi76/A2fakeCFlTCCZmPZsu3D5Sg=
X-Received: by 2002:a05:6000:4555:b0:482:e1ce:d45c with SMTP id
 ffacd0b85a97d-485872c2589mr5731713f8f.21.1788532709395; Fri, 04 Sep 2026
 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-nr_mmios-v1-1-3a19dc74fab8@kernel.org>
In-Reply-To: <20260904-nr_mmios-v1-1-3a19dc74fab8@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Sep 2026 22:38:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSbRMUBd0+WXpiq8O61V+kkZ9hkJYVwBOeA4gjo-P4dGw@mail.gmail.com>
X-Gm-Features: AcwNN1WZc5yAPQLWYeJULNrT1Af-ctH-VxYkMfhSomePh3lXqSn4VGAGpBjdZrI
Message-ID: <CAJF2gTSbRMUBd0+WXpiq8O61V+kkZ9hkJYVwBOeA4gjo-P4dGw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix MMIO regset lookup loop bound
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

U29ycnksIEkgZGlkbid0IG5vdGljZSB0aGlzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNjA3MTgwMzM2NDYuMDAxLjdlMDIyNTU0LWNhcGxpdG11cy1ydkBpc2Nhcy5h
Yy5jbi8KClBsZWFzZSBhYmFuZG9uIHRoaXMgcGF0Y2guCgpPbiBGcmksIFNlcCA0LCAyMDI2IGF0
IDEwOjMy4oCvUE0gR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IFRoZSBucl9tbWlvcyBpcyB0aGUgbnVtYmVyIG9mIGVudHJpZXMgaW4gdGhlIE1NSU8gcmVz
b3VyY2UgYXJyYXksIHdoaWxlCj4gaiBpcyB0aGUgaW5kZXggdXNlZCB0byBpdGVyYXRlIG92ZXIg
dGhlIGFycmF5LiBUZXN0aW5nIG5yX21taW9zIGRpcmVjdGx5Cj4gbWFrZXMgdGhlIGxvb3AgY29u
ZGl0aW9uIHBlcm1hbmVudGx5IHRydWUgd2hlbmV2ZXIgYXQgbGVhc3Qgb25lIE1NSU8KPiByZWdp
b24gZXhpc3RzLgo+Cj4gU28sIGNoYW5nZQo+ICAgZm9yIChqID0gMDsgbnJfbW1pb3M7IGorKykg
ewo+IHRvCj4gICBmb3IgKGogPSAwOyBqIDwgbnJfbW1pb3M7IGorKykgewo+Cj4gRml4ZXM6IDIx
YThmOGEwZWIzNSAoImlycWNoaXA6IEFkZCBSSVNDLVYgaW5jb21pbmcgTVNJIGNvbnRyb2xsZXIg
ZWFybHkgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiBUaGlzIHBh
dGNoIGZpeGVzIGFuIG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIHRoZSBSSVNDLVYgSU1TSUMgTU1J
Two+IHJlc291cmNlIGxvb2t1cC4KPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1zdGF0ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBp
bmRleCBiOGQxYmJiZjQyZjcuLjAwOGRmY2YzNDNlNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXN0YXRlLmMKPiBAQCAtODk2LDcgKzg5Niw3IEBAIGludCBfX2luaXQgaW1z
aWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVl
KQo+ICAgICAgICAgICAgICAgICBpbmRleCA9IG5yX21taW9zOwo+ICAgICAgICAgICAgICAgICBy
ZWxvZmYgPSBpICogQklUKGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgKgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BBR0VfU1o7Cj4gLSAgICAgICAgICAgICAgIGZvciAo
aiA9IDA7IG5yX21taW9zOyBqKyspIHsKPiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8
IG5yX21taW9zOyBqKyspIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmVsb2ZmIDwg
cmVzb3VyY2Vfc2l6ZSgmbW1pb3Nbal0pKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbmRleCA9IGo7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
Pgo+IC0tLQo+IGJhc2UtY29tbWl0OiBiYzM1OTY1ZjY5NDBhOWJmODM0ZDU0MTg3YjYwODhiOGVi
MDkyMDZkCj4gY2hhbmdlLWlkOiAyMDI2MDkwNC1ucl9tbWlvcy04NjhlMzY5ZGUyNWIKPgo+IEJl
c3QgcmVnYXJkcywKPiAtLQo+IEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4K
PgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
