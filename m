Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65ADC00528
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKzoZIfPHm+vKDghBSOTkzpE5UIBDa9Ewv3kJH7lxGg=; b=UVaqDUf3bcCRY/
	WdTlYB+HBm0F/Afz9JVoue9iXkPOxngT3pCusLPXhS50KmjNz8CFXb9XjHHVy8bEOGVs8WJFVA0P0
	KksiL0D8f0j3bfuzY3dhVqE42J6kJ8j8YxxnKxsPpQ07d5tQfGf0MJbBIKcCuInrHSLrTbRvkNLb7
	U2rrWlglTBjiwi735zRPXDJkb4P7Q+TBR/9gxTqAClzhZslZM8KeYkDJ2s+W5PfIq64MZdMKWvEsw
	XxWiRm0n1pmutisY1eHTtVe2/xojMPpikOI4TrQKJlVxrZg5H9h73LGFFU892BaAb2f31fVKU925t
	IIS3G/6zeYNuD1LLQsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNxns-004mHE-0m;
	Mon, 24 Jul 2023 15:48:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNxnp-004mFx-2V
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 15:48:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba74870abso6735869e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690213729; x=1690818529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DSeY5kmx4Jg6eBOOBrPHpvYuzfcayGR3E+1cQUFfAI=;
        b=cnhidQBoB+vUvzugLtJmxZ+BhkxRMSlePnIOXWtBXm76BcUhn1JIrImpjsjZKM3skY
         BezW51RECmbRJYwc6ZQZA2zncqw6H/ec6DtPeEl3KrEMHgxmOpREEUqNqt1YicKbpNiN
         aNvRHGBAe4vcWVejA3r/atJMhTa68CY0h58ads0YEN9EZq/klNB/DIPol8jN745bat8n
         jM5ZxvkwB0X8a6VI+Cyui33n10JHiqR5AMNrilMKuWydR+wF/YkxazvP69D8oxNv9TqA
         YnejvM2Czay7uf9UbYG7y5OceNDXHhInJwtcLSxbDXuvjU6T8EbrfM8jnOyJQ2+bfgMS
         LF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690213729; x=1690818529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DSeY5kmx4Jg6eBOOBrPHpvYuzfcayGR3E+1cQUFfAI=;
        b=Qf5C21tB22COhWhOtcI0eqJdttPVE6I1okIS8CQXgqchKF2hdngUU6rcsknX/MUZhu
         wgA4rPyvVlSyCyqkQWklPp2zqSrqO5suhrPR8RWay0YRwSb2Ex6MgC1qwk3eoDQWUp7j
         TzQD19BlidXO9GixKBL8YZV4siMhTSXULIo30sKEE4q+PKuqu42L2+GqYmXlfOPHjEth
         GtruOgBq0NUhJ/Q7nFU92mFMEXQl6xyq0osP0R5HOtpUgxr/uJg9FgUgnHKaI7b4FSZd
         70neEetJhEXBjAVXC7cck6oyb5MCmde2dbHDaBUgp6K8QOrdp4SsJJmgXstzup19bSE4
         bpDg==
X-Gm-Message-State: ABy/qLbVwFacaMRG73wUkNh72F4Fw8nSugVfWT2TWnmUpocf6ZO5cC48
	4HHxkWJlSauM2EjxS3ZQB0ZnqebK/L3onoMc54IZ7Q==
X-Google-Smtp-Source: APBJJlGWSW7v0wm4xV0OWP9hFVvSLKaLxWx7P3Al0QNz/mE78rq8dIuUVYBTOBaSpNbHSUAp/1eBAjydJqAEhXs+uLY=
X-Received: by 2002:a05:6512:3703:b0:4f8:77db:1d9e with SMTP id
 z3-20020a056512370300b004f877db1d9emr5118812lfr.12.1690213729085; Mon, 24 Jul
 2023 08:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230721112855.1006-1-andy.chiu@sifive.com> <20230721112855.1006-3-andy.chiu@sifive.com>
 <20230724-greedless-pardon-983bbe3178c0@wendy>
In-Reply-To: <20230724-greedless-pardon-983bbe3178c0@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 24 Jul 2023 23:48:37 +0800
Message-ID: <CABgGipU3pTQPoHKmZLjiNjNRTNB3J2_Lq2GfeHGC69uLPcnh5A@mail.gmail.com>
Subject: Re: [v2, 2/5] riscv: Add support for kernel mode vector
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, vineetg@rivosinc.com, 
	bjorn@kernel.org, greentime.hu@sifive.com, paul.walmsley@sifive.com, 
	guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org, 
	heiko.stuebner@vrull.eu, Vincent Chen <vincent.chen@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Anup Patel <apatel@ventanamicro.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_084853_816766_96ACDB78 
X-CRM114-Status: GOOD (  17.84  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgNjo0OeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFuZHksCj4KPiBPbiBGcmksIEp1bCAy
MSwgMjAyMyBhdCAxMToyODo1MkFNICswMDAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiBGcm9tOiBH
cmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4KPiA+IEFkZCBrZXJuZWxf
dmVjdG9yX2JlZ2luKCkgYW5kIGtlcm5lbF92ZWN0b3JfZW5kKCkgZnVuY3Rpb24gZGVjbGFyYXRp
b25zCj4gPiBhbmQgY29ycmVzcG9uZGluZyBkZWZpbml0aW9ucyBpbiBrZXJuZWxfbW9kZV92ZWN0
b3IuYwo+ID4KPiA+IFRoZXNlIGFyZSBuZWVkZWQgdG8gd3JhcCB1c2VzIG9mIHZlY3RvciBpbiBr
ZXJuZWwgbW9kZS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2Vu
dC5jaGVuQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNl
bnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVl
bnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5j
aGl1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZWxvZyB2MjoKPiA+ICAtICdzL2tlcm5l
bF9ydnYva2VybmVsX3ZlY3RvcicgYW5kIHJldHVybiB2b2lkIGluIGtlcm5lbF92ZWN0b3JfYmVn
aW4KPiA+ICAgIChDb25vcikKPiA+ICAtIGV4cG9ydCBtYXlfdXNlX3NpbWQgdG8gaW5jbHVkZS9h
c20vc2ltZC5oCj4gPiAtLS0KPgo+ID4gKy8qCj4gPiArICoga2VybmVsX3ZlY3Rvcl9iZWdpbigp
OiBvYnRhaW4gdGhlIENQVSB2ZWN0b3IgcmVnaXN0ZXJzIGZvciB1c2UgYnkgdGhlIGNhbGxpbmcK
PiA+ICsgKiBjb250ZXh0Cj4gPiArICoKPiA+ICsgKiBNdXN0IG5vdCBiZSBjYWxsZWQgdW5sZXNz
IG1heV91c2Vfc2ltZCgpIHJldHVybnMgdHJ1ZS4KPiA+ICsgKiBUYXNrIGNvbnRleHQgaW4gdGhl
IHZlY3RvciByZWdpc3RlcnMgaXMgc2F2ZWQgYmFjayB0byBtZW1vcnkgYXMgbmVjZXNzYXJ5Lgo+
ID4gKyAqCj4gPiArICogQSBtYXRjaGluZyBjYWxsIHRvIGtlcm5lbF92ZWN0b3JfZW5kKCkgbXVz
dCBiZSBtYWRlIGJlZm9yZSByZXR1cm5pbmcgZnJvbSB0aGUKPiA+ICsgKiBjYWxsaW5nIGNvbnRl
eHQuCj4gPiArICoKPiA+ICsgKiBUaGUgY2FsbGVyIG1heSBmcmVlbHkgdXNlIHRoZSB2ZWN0b3Ig
cmVnaXN0ZXJzIHVudGlsIGtlcm5lbF92ZWN0b3JfZW5kKCkgaXMKPiA+ICsgKiBjYWxsZWQuCj4g
PiArICovCj4gPiArdm9pZCBrZXJuZWxfdmVjdG9yX2JlZ2luKHZvaWQpCj4gPiArewo+ID4gKyAg
ICAgaWYgKFdBUk5fT04oIWhhc192ZWN0b3IoKSkpCj4gPiArICAgICAgICAgICAgIHJldHVybjsK
PiA+ICsKPiA+ICsgICAgIEJVR19PTighbWF5X3VzZV9zaW1kKCkpOwo+ID4gKwo+ID4gKyAgICAg
cmlzY3Zfdl92c3RhdGVfc2F2ZShjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwo+ID4g
Kwo+ID4gKyAgICAgZ2V0X2NwdV92ZWN0b3JfY29udGV4dCgpOwo+ID4gKwo+ID4gKyAgICAgcmlz
Y3Zfdl9lbmFibGUoKTsKPiA+ICsKPgo+ID4gKyAgICAgcmV0dXJuIDA7Cj4KPiBUaGlzIGJyZWFr
cyB0aGUgYnVpbGQgYXMgeW91IGhhdmUgbWFkZSB0aGUgZnVuY3Rpb24gdm9pZC4KClNvcnJ5LCBt
eSBiYWQgYWdhaW4uLgpJIHdpbGwgc2VuZCBhIHYzIHRvIGFkZHJlc3MgdGhpcyB3aGVuIHdlIGNs
b3NlIHRoZSBkaXNjdXNzaW9uIG9uIHBhdGNoIDUvNS4KCj4KPiBPdGhlcndpc2UsIHRoaXMgbG9v
a3MgZmluZSB0byBtZS4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
