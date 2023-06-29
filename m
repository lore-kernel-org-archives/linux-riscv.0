Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B086EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOBo3W+NMHjSV0IA4J9EdKdfNie2E3/r59Ms7Anym9U=; b=MaT4WvHAICBdMV
	Yjzavup7v15Vnq0Dh5Gnh2Cp0jtj/fCWSFcii9FcANDaL+C72ma7aTMmI7Tk+FhZLT2i3AHhsIDKM
	SNNnr7Kggoqjn6SzBFbHrEzwbegtMnIMVQ1RjWTUib3xZJpdyf/QT6ysJp4cYyjjIqYFw1J7yjV0y
	3Zw6b96oSGnUPjjC9762hf6LaFCuNiSzwAs/TeOCTv4oLB3mqKasJDN0lt1oNo+6+M/+RBr6EB668
	pHEC9gqlNNGRftcnpyGB8vUG5/PjN3DGdQNBuML6oRk7949VhVcMrL7mxLqX7WP8OoSutH8X3JqnX
	cYr30IZQBcrs7kGrvQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEkt1-0004DV-33;
	Thu, 29 Jun 2023 06:12:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEksy-0004CX-1K
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 06:12:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F3DB614BE
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 06:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C80C433CC
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688019124;
	bh=1dllSuhv2Us2xdabNpl+ribZVvPYTdGCOFQ7UYGcpno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jRE+zI4tJQHB5L73lhApOoVAGJhp/kRsJMOJSicbhUgvVy97Meqs3zIk8DVaVhjae
	 FniE4YmwzcBF6T0Z+YEAC3rKFx5E1egzy0BIrfBh9SlHFLaGSMGOjHqmSMph0+3cdK
	 xAXiCc6+K6P2Rts+gA5Wmy8vCofOUN3r52TvYZplKk8JfKkhBVXeuezUFqrZRYpnOK
	 WPLfU7dByct68CncGha3C2VpkqMoPAxtqKSFTHWzhkWaFyMqrUoGs8aNy9gQv1mHd2
	 n00pqrDlxJUOY1WN73IzpJS1LZL8jnFg17P2ey5KCa0eZa25bctrxwtkIxp1dcr5rT
	 NqfM6v/FNsh+g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso476547e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 23:12:04 -0700 (PDT)
X-Gm-Message-State: AC+VfDxqSHWilOY3uQdiIICMxe8M+4GhpPfpa2Yu/UpwvQGx5YxDW5Qc
	VdDmOjyFv7BgZQXt+cvD3eASfTYK3DILodbKkRA=
X-Google-Smtp-Source: ACHHUZ6USnDLvr39JSpXcw/jIN9dskfU0UTN5Blm43ZRM1ADrN6QOMXM8l3GpD7JhykpzkvZlcsZJkRUFd0a1ZHWajw=
X-Received: by 2002:a05:6512:308d:b0:4fb:780d:2a49 with SMTP id
 z13-20020a056512308d00b004fb780d2a49mr8148834lfd.5.1688019122670; Wed, 28 Jun
 2023 23:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230625155416.18629-1-andy.chiu@sifive.com> <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
In-Reply-To: <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 29 Jun 2023 02:11:51 -0400
X-Gmail-Original-Message-ID: <CAJF2gTSvM9uBNBn+HGWrNct+q5OAP4cOTuU6zrTV8o8+fZ+6Lw@mail.gmail.com>
Message-ID: <CAJF2gTSvM9uBNBn+HGWrNct+q5OAP4cOTuU6zrTV8o8+fZ+6Lw@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use trap
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_231208_533740_F2B5DF7F 
X-CRM114-Status: GOOD (  23.38  )
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

QW5vdGhlciBvbmU6CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IGY5YzhlMTlhYjMwMS4uNzY0YjdjMDk4MTY1
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC92ZWN0b3IuYwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IHJpc2N2X3ZfdGhy
ZWFkX3phbGxvYyh2b2lkKQogewogICAgICAgIHZvaWQgKmRhdGFwOwoKICAgICAgICBkYXRhcCA9
IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7CiAgICAgICAgaWYgKCFkYXRhcCkK
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKQEAgLTE2MiwxMCArMTYyLDkgQEAgYm9v
bCByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogICAgICAg
ICAqIGNvbnRleHQgd2hlcmUgVlMgaGFzIGJlZW4gb2ZmLiBTbywgdHJ5IHRvIGFsbG9jYXRlIHRo
ZSB1c2VyJ3MgVgogICAgICAgICAqIGNvbnRleHQgYW5kIHJlc3VtZSBleGVjdXRpb24uCiAgICAg
ICAgICovCi0gICAgICAgaWYgKHJpc2N2X3ZfdGhyZWFkX3phbGxvYygpKSB7Ci0gICAgICAgICAg
ICAgICBmb3JjZV9zaWcoU0lHQlVTKTsKLSAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwotICAg
ICAgIH0KKyAgICAgICBpZiAocmlzY3Zfdl90aHJlYWRfemFsbG9jKCkpCisgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7CisKICAgICAgICByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKTsKICAgICAg
ICByZXR1cm4gdHJ1ZTsKIH0KLS0tLS0tLS0KCllvdXIgZm9yY2Vfc2lnIHRocm93cyB0aGUgZGVi
dWcgaW5mbyBhd2F5LCBhbmQgdGhlIHN0YW5kYXJkIG9uZSBpcwplbm91Z2ggZm9yIHVzLgoKT24g
VGh1LCBKdW4gMjksIDIwMjMgYXQgMjowNOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDExOjU04oCvQU0gQW5keSBDaGl1
IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIGZ1bmN0aW9uIGlycWVu
dHJ5X2V4aXRfdG9fdXNlcl9tb2RlKCkgbXVzdCBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHQKPiA+
IGRpc2FibGVkLiBUaGUgY2FsbGVyIG9mIGRvX3RyYXBfaW5zbl9pbGxlZ2FsKCkgYWxzbyBhc3N1
bWVzIHJ1bm5pbmcKPiA+IHdpdGhvdXQgaW50ZXJydXB0cy4gU28sIHdlIHNob3VsZCB0dXJuIG9m
ZiBpbnRlcnJ1cHRzIGFmdGVyCj4gPiByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKCkgcmV0dXJu
cy4KPiA+Cj4gPiBGaXhlczogY2QwNTQ4MzcyNDNiICgicmlzY3Y6IEFsbG9jYXRlIHVzZXIncyB2
ZWN0b3IgY29udGV4dCBpbiB0aGUgZmlyc3QtdXNlIHRyYXAiKQo+ID4gU2lnbmVkLW9mZi1ieTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgfCA4ICsrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gaW5kZXggMDVmZmRj
ZDE0MjRlLi4xNTk1ZTI0NmJkYTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBAQCAtMTQ5LDEy
ICsxNDksMTggQEAgRE9fRVJST1JfSU5GTyhkb190cmFwX2luc25fZmF1bHQsCj4gPgo+ID4gIGFz
bWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVn
YWwoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgewo+ID4gKyAgICAgICBib29sIGhhbmRsZWQ7
Cj4gPiArCj4gPiAgICAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsKPiA+ICAgICAgICAgICAg
ICAgICBpcnFlbnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPiA+Cj4gPiAgICAgICAg
ICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ID4KPiA+IC0gICAgICAgICAgICAgICBpZiAo
IXJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIocmVncykpCj4gPiArICAgICAgICAgICAgICAgaGFu
ZGxlZCA9IHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIocmVncyk7Cj4gSG93IGFib3V0IG1ha2lu
ZyByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyIGlycV9kaXNhYmxlIHNhZmU/Cj4gLS0tLS0tLS0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKPiBpbmRleCA1MTU4OTYxZWE5NzcuLjU0NTI5NTA0NTcwNSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+IEBAIC0xNTMsOCArMTUzLDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZAo+IGRvX3RyYXBfaW5zbl9pbGxlZ2FsKHN0cnVjdCBwdF9yZWdzICpyZQo+
ICAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ICAgICAgICAgICAgICAgICBpcnFlbnRy
eV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPgo+IC0gICAgICAgICAgICAgICBsb2NhbF9p
cnFfZW5hYmxlKCk7Cj4gLQo+ICAgICAgICAgICAgICAgICBpZiAoIXJpc2N2X3ZfZmlyc3RfdXNl
X2hhbmRsZXIocmVncykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZG9fdHJhcF9lcnJvcihy
ZWdzLCBTSUdJTEwsIElMTF9JTExPUEMsIHJlZ3MtPmVwYywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJPb3BzIC0gaWxsZWdhbCBpbnN0cnVjdGlvbiIpOwo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jCj4gaW5kZXggZjljOGUxOWFiMzAxLi43NjE2YzAyN2VlNjQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0
b3IuYwo+IEBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyBpbnQgcmlzY3Zfdl90aHJlYWRfemFsbG9j
KHZvaWQpCj4gIHsKPiAgICAgICAgIHZvaWQgKmRhdGFwOwo+Cj4gLSAgICAgICBkYXRhcCA9IGt6
YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBkYXRhcCA9IGt6YWxs
b2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCB8IEdGUF9BVE9NSUMpOwo+ICAgICAgICAgaWYg
KCFkYXRhcCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gLS0tLS0tLS0tCj4K
PiA+ICsKPiA+ICsgICAgICAgICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ID4gKwo+ID4g
KyAgICAgICAgICAgICAgIGlmICghaGFuZGxlZCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGRvX3RyYXBfZXJyb3IocmVncywgU0lHSUxMLCBJTExfSUxMT1BDLCByZWdzLT5lcGMsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJPb3BzIC0gaWxsZWdhbCBpbnN0
cnVjdGlvbiIpOwo+ID4KPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdh
cmRzCj4gIEd1byBSZW4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
