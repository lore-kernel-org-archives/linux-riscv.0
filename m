Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE7BEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 03:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DK9KkOFveXYQidC3ZStpCuzUYm9IIzAtu7MMKM1ow4=; b=GmyB3YONovg+7P
	tO/vzJ0qSh8/5PiBP9xRbGd1i7Yiw9SXlNbix4syZEl3RXc98eoCyXBFsy4rza+kqAKqBEQpp9pvn
	DoaKnlz8mKgln/XRrhbkv38HOujMWjShdGffEOLqrRnb+XblZ3JD1HtOQQmr8wALyP0Z/7VlbgFYY
	mXXuV+iW7ScurzNDJjp1F4c88LcKxqsCEwFWKWCHpluNCfNQu6igLvCsgigDVLtYHG1VOnx8g//cH
	7Fb6/YtQpK5qwB9OvKgOJKOoOylNLnqk4tF+9p0K0Nk1tDR4SES68DWAXjeBtZWDwwmyNrvbYH/cQ
	RFzcxuMI40aAjzbPqG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtMR-00EhWZ-2h;
	Wed, 05 Jul 2023 03:39:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtMP-00EhW5-1G
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 03:39:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so9379576e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 20:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1688528358; x=1691120358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF+Zlyzj+2+F2BSpGdgAxR7q4B9xA97/cOTdG+YgPzc=;
        b=JjWt009Q46FpwY9PYXm49xkWyaP9loeW+RQNmX+ofs9mv6PCUpcVbSnBxVKWt30SCf
         blzHdQsdwCJVjqBrwg0PRWQggWVROw6biroabgLGEaCV/CEUkKSGzAEJQcxgqymzUaJ+
         qp0IjTuzI43IjJGI/bdSJbb1bFTytMdvmPtXIwOvJnMG2Ar5AqHXtJ7p0qgxkQdxNfPi
         ja7bqTTzooDVQbPGIjL71ZPgEUDDKkAIB9TaVSTF567NeYAdT16ThF1FWEIR95OZRxJh
         5NBl9HaYQBWLYperJr2v0LYG7065EKEgKGNg6oDH4jCGqgur6bD7mcCrggeEzs99srwP
         HuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688528358; x=1691120358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF+Zlyzj+2+F2BSpGdgAxR7q4B9xA97/cOTdG+YgPzc=;
        b=JIno7LWMT2B8T4CqdsWorWHWyNFuClZ6syB4nIQH32BasWyPwRlEKhMqkjPuXhO5so
         504IiBDPmwHiR2kVi3D8U8vHqGGQfYPkqTIabfsfwTKFwTUBSil/mcW1B1YXENy9eQjw
         su6XTH1F64AvDc2M2Ki7stdGQHJpKIaPVlnvG8r3W6feGr0RCpwN0kZ0SfKK3TV44kBv
         Vo9hGybuU8mu6AIca3QiQ6fNktiESA7v+7LUguyO5kKEVphbfpYjBTCgXznGhQ9FrmIi
         7Oyi7yL2FtfmKqL5w4gCDk0XOWsr3OEowiNFgqlh/ZCJ/66vM6V40xlzajUz3SlAbepr
         6wXA==
X-Gm-Message-State: ABy/qLbRwHBRnR/pbic57WdHnatp5Dv2ls9JrtnuR7xfcWbnXigNk6AT
	lxVVLtPyZ3JKKYTdC0/fiKpHtjLRO66gAYOU9nGUWg==
X-Google-Smtp-Source: APBJJlFmjwxzyOmxm3085K4reqfsHuisqwFljW6MsLeEfqaTp0Y6f45PAid9E7DQFBBYCKa3ibka8g0vFfdMYYIqP/o=
X-Received: by 2002:a05:6512:1094:b0:4f8:77db:1d9e with SMTP id
 j20-20020a056512109400b004f877db1d9emr11806517lfg.12.1688528358548; Tue, 04
 Jul 2023 20:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230625155416.18629-1-andy.chiu@sifive.com> <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
 <CAJF2gTSvM9uBNBn+HGWrNct+q5OAP4cOTuU6zrTV8o8+fZ+6Lw@mail.gmail.com>
In-Reply-To: <CAJF2gTSvM9uBNBn+HGWrNct+q5OAP4cOTuU6zrTV8o8+fZ+6Lw@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 5 Jul 2023 11:39:07 +0800
Message-ID: <CABgGipXLNDO_HN0SSDw4Q2d1UN98uphD2ys_9_n3TSDw0xLboQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use trap
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_203921_507413_F6BFC6AA 
X-CRM114-Status: GOOD (  23.40  )
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

SGkgR3VvLAoKT24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMjoxMuKAr1BNIEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEFub3RoZXIgb25lOgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gaW5k
ZXggZjljOGUxOWFiMzAxLi43NjRiN2MwOTgxNjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+IEBAIC04
NCw3ICs4NCw3IEBAIHN0YXRpYyBpbnQgcmlzY3Zfdl90aHJlYWRfemFsbG9jKHZvaWQpCj4gIHsK
PiAgICAgICAgIHZvaWQgKmRhdGFwOwo+Cj4gICAgICAgICBkYXRhcCA9IGt6YWxsb2MocmlzY3Zf
dl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAgICBpZiAoIWRhdGFwKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKPgo+IEBAIC0xNjIsMTAgKzE2Miw5IEBAIGJvb2wgcmlzY3Zf
dl9maXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgICAgICAgICAqIGNv
bnRleHQgd2hlcmUgVlMgaGFzIGJlZW4gb2ZmLiBTbywgdHJ5IHRvIGFsbG9jYXRlIHRoZSB1c2Vy
J3MgVgo+ICAgICAgICAgICogY29udGV4dCBhbmQgcmVzdW1lIGV4ZWN1dGlvbi4KPiAgICAgICAg
ICAqLwo+IC0gICAgICAgaWYgKHJpc2N2X3ZfdGhyZWFkX3phbGxvYygpKSB7Cj4gLSAgICAgICAg
ICAgICAgIGZvcmNlX3NpZyhTSUdCVVMpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsK
PiAtICAgICAgIH0KPiArICAgICAgIGlmIChyaXNjdl92X3RocmVhZF96YWxsb2MoKSkKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX29u
KHJlZ3MpOwo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiAtLS0tLS0tLQo+Cj4gWW91ciBm
b3JjZV9zaWcgdGhyb3dzIHRoZSBkZWJ1ZyBpbmZvIGF3YXksIGFuZCB0aGUgc3RhbmRhcmQgb25l
IGlzCj4gZW5vdWdoIGZvciB1cy4KCkNvdWxkIHlvdSBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgbW9y
ZSBvbiBob3cgdGhpcyB0aHJvd3MgZGVidWcgaW5mbwphd2F5PyBEbyB5b3UgbWVhbiB0aGUgcHJf
aW5mbygpIHByaW50IGluIHRoZSBkb190cmFwKCkgZnVuY3Rpb24/IElmCndlJ2Qgd2FudCB0byB1
c2UgdGhlIHN0YW5kYXJkIG9uZSB0aGVuIHdlIHNob3VsZCBpbnN0ZWFkIHJldHVybiBhCnNpZ25h
bCBudW1iZXIgaW4gcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcigpLiBCZWNhdXNlIHdlIHdhbnQg
dG8gc2VuZApTSUdCVVMgaW5zdGVhZCBvZiBTSUdJTEwuCgo+Cj4gT24gVGh1LCBKdW4gMjksIDIw
MjMgYXQgMjowNOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBTdW4sIEp1biAyNSwgMjAyMyBhdCAxMTo1NOKAr0FNIEFuZHkgQ2hpdSA8YW5keS5jaGl1
QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgZnVuY3Rpb24gaXJxZW50cnlfZXhp
dF90b191c2VyX21vZGUoKSBtdXN0IGJlIGNhbGxlZCB3aXRoIGludGVycnVwdAo+ID4gPiBkaXNh
YmxlZC4gVGhlIGNhbGxlciBvZiBkb190cmFwX2luc25faWxsZWdhbCgpIGFsc28gYXNzdW1lcyBy
dW5uaW5nCj4gPiA+IHdpdGhvdXQgaW50ZXJydXB0cy4gU28sIHdlIHNob3VsZCB0dXJuIG9mZiBp
bnRlcnJ1cHRzIGFmdGVyCj4gPiA+IHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoKSByZXR1cm5z
Lgo+ID4gPgo+ID4gPiBGaXhlczogY2QwNTQ4MzcyNDNiICgicmlzY3Y6IEFsbG9jYXRlIHVzZXIn
cyB2ZWN0b3IgY29udGV4dCBpbiB0aGUgZmlyc3QtdXNlIHRyYXAiKQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCA4ICsrKysrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+
ID4gPiBpbmRleCAwNWZmZGNkMTQyNGUuLjE1OTVlMjQ2YmRhMSAxMDA2NDQKPiA+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4gPiA+IEBAIC0xNDksMTIgKzE0OSwxOCBAQCBET19FUlJPUl9JTkZPKGRvX3RyYXBf
aW5zbl9mYXVsdCwKPiA+ID4KPiA+ID4gIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0
aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVnYWwoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+
ICB7Cj4gPiA+ICsgICAgICAgYm9vbCBoYW5kbGVkOwo+ID4gPiArCj4gPiA+ICAgICAgICAgaWYg
KHVzZXJfbW9kZShyZWdzKSkgewo+ID4gPiAgICAgICAgICAgICAgICAgaXJxZW50cnlfZW50ZXJf
ZnJvbV91c2VyX21vZGUocmVncyk7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICBsb2NhbF9p
cnFfZW5hYmxlKCk7Cj4gPiA+Cj4gPiA+IC0gICAgICAgICAgICAgICBpZiAoIXJpc2N2X3ZfZmly
c3RfdXNlX2hhbmRsZXIocmVncykpCj4gPiA+ICsgICAgICAgICAgICAgICBoYW5kbGVkID0gcmlz
Y3Zfdl9maXJzdF91c2VfaGFuZGxlcihyZWdzKTsKPiA+IEhvdyBhYm91dCBtYWtpbmcgcmlzY3Zf
dl9maXJzdF91c2VfaGFuZGxlciBpcnFfZGlzYWJsZSBzYWZlPwo+ID4gLS0tLS0tLS0KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gaW5kZXggNTE1ODk2MWVhOTc3Li41NDUyOTUwNDU3MDUgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gPiBAQCAtMTUzLDggKzE1Myw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9f
dHJhcF9zZWN0aW9uIHZvaWQKPiA+IGRvX3RyYXBfaW5zbl9pbGxlZ2FsKHN0cnVjdCBwdF9yZWdz
ICpyZQo+ID4gICAgICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPiAgICAgICAgICAgICAg
ICAgaXJxZW50cnlfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7Cj4gPgo+ID4gLSAgICAgICAg
ICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKPiA+IC0KPiA+ICAgICAgICAgICAgICAgICBpZiAo
IXJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIocmVncykpCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0lMTCwgSUxMX0lMTE9QQywgcmVncy0+ZXBjLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiT29wcyAtIGlsbGVnYWwg
aW5zdHJ1Y3Rpb24iKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3Iu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiBpbmRleCBmOWM4ZTE5YWIzMDEuLjc2
MTZjMDI3ZWU2NCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gQEAgLTg0LDcgKzg0LDcgQEAg
c3RhdGljIGludCByaXNjdl92X3RocmVhZF96YWxsb2Modm9pZCkKPiA+ICB7Cj4gPiAgICAgICAg
IHZvaWQgKmRhdGFwOwo+ID4KPiA+IC0gICAgICAgZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNp
emUsIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgICBkYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6
ZSwgR0ZQX0tFUk5FTCB8IEdGUF9BVE9NSUMpOwo+ID4gICAgICAgICBpZiAoIWRhdGFwKQo+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gLS0tLS0tLS0tCj4gPgo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ID4gPiArCj4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoIWhhbmRsZWQpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGRvX3RyYXBfZXJyb3IocmVncywgU0lHSUxMLCBJTExfSUxMT1BDLCByZWdzLT5lcGMsCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk9vcHMgLSBpbGxlZ2Fs
IGluc3RydWN0aW9uIik7Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuMTcuMQo+ID4gPgo+ID4KPiA+
Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgo+Cj4KPgo+IC0tCj4gQmVzdCBS
ZWdhcmRzCj4gIEd1byBSZW4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
