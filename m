Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8grJbUZ5mpP7SL5BSWGpYAb5udw1EM4euRWVS8WlLzU=; b=cJQAMVtmJjglBO
	PG0TKmnQ6zKBEhT84ZSi7NP4o2+Jz+BHMr+/1z+Y4EjZV8QJD4cLQgh0OxhbTvHkZiVqL2jKCgggM
	tv8KEapBeOnXqwwpsslyE/jEMzoRXV95iR8MxzP4sVA39wJA0CTdrGA7ASIN0Pcq0e1OhjXkLcpqJ
	FgFhOMgOAEatV1RUsPlk6NWM2riDypUDWnBMU06mEQFUEt/qCHcdUMhTsYhse+B4yfmePYp97+T4Z
	vMOck8rK97w1kV9M4qNS4GeGX0p+T2RMxyTnqaf/VZRB84eaePTcwReS55aLu41rFqjBjn2LGqdqh
	Osis7lwndi+2onH0qDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Um0-000iGq-OL; Wed, 14 Dec 2022 16:38:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ulx-000iCr-U5
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 16:38:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id m14so299245wrh.7
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XQ9UK+L/0iK+KFqjWQesqR3gEiIaaEkyB4WhDQSSEk=;
        b=1sRvZWk4v6BhCyZTXJ2+f46RRZoXBbAchW/Nd0IonBe71PFBY3xQlZJN78/B1C9AOX
         O6U60oJ6kHQUPkFxgtYaux8Z8Fz+bVSKvBTLykYbGs5prvLBsaqwXgWA0XV/ice73Hdf
         oyz7kh52knuU7/BrncKSqlfagE7nHPX4LaaaoYADWYkF3baBh0tDQXVbXNlj+KL6St5x
         lxvKv88iCD2u8zD/Wm89B0n6pfUBOjctLvm+HkFc/sqZG/Bx8btVe/MC/JOZN3vDCW1B
         4i7BO8w0bu5RWUH2A5OAHRRc9OupsX7aegDRYTPXh8MsbK8IJcJlCoNc6CptrKQ2pg50
         ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XQ9UK+L/0iK+KFqjWQesqR3gEiIaaEkyB4WhDQSSEk=;
        b=CD8T3LuGMsXxF19IoVduWTJQz425XEJYgqjv+rUEZDW0foWbmDvHu6r8v/2AnDjVjx
         6syicdHtanYxsAXvWfVJa/QfQFb1l4U8yV1iKeorbPw9/mf1wSLPZXJPiGFKCURofJ4O
         JsmfKv1vuk2fwbffAb1H9CxYbM3H3r/omcfhZX55x6waGixO3h6mIPGzfogYmoFP65Mo
         Ue07c+lx6GXUQ1QSEZm9pUBnXqQf1ustWRzlWmx0nrsU7NxR4L8A70pUOZx83CShVO6N
         4KeDcjR6iMLQdGY0dN79zaTaG5TDw78pEKt3Npbbz8+obElwfbk+dY94FeA+bDRTEZIA
         QzkA==
X-Gm-Message-State: ANoB5pmFFct6H1csu19ga6y1SZG/xFEaH/9xggC97F7VyWzeIxqeuerP
	9TtAPMJvBHI+BlyqqpjK85AbOcwEHYTNRiJMij/Fjqpsl10LoQ==
X-Google-Smtp-Source: AA0mqf7Vq9T9tV5/hj5nHZjSecDz/ZDSCVTGbOpMMHcUxGzyHQ6ylbSGIsEibGaAkuvj3IzOFsHOLo7QrFmxZzz/y1E=
X-Received: by 2002:a05:6000:1a4e:b0:242:71b:e3cf with SMTP id
 t14-20020a0560001a4e00b00242071be3cfmr36380152wry.144.1671035899393; Wed, 14
 Dec 2022 08:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20221214143311.960266-1-alexghiti@rivosinc.com> <87cz8m3sha.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87cz8m3sha.fsf@all.your.base.are.belong.to.us>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 14 Dec 2022 17:38:08 +0100
Message-ID: <CAHVXubidb5gQBHSFMJiY=egoi4QOiqOh884VvAhxYqADxNDB6A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Allow to downgrade paging mode from the command line
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_083822_197129_CE0CDD01 
X-CRM114-Status: GOOD (  16.37  )
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

T24gV2VkLCBEZWMgMTQsIDIwMjIgYXQgNDozOSBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4gd3JpdGVzOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNo
L3Jpc2N2L21tL2luaXQuYwo+ID4gaW5kZXggYjU2YTBhNzU1MzNmLi44MTQwZmVmZTBlNTcgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9t
bS9pbml0LmMKPiA+IEBAIC03NTIsMTIgKzc1MiwzNSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZGlz
YWJsZV9wZ3RhYmxlX2w0KHZvaWQpCj4gPiAgICogdGhlbiByZWFkIFNBVFAgdG8gc2VlIGlmIHRo
ZSBjb25maWd1cmF0aW9uIHdhcyB0YWtlbiBpbnRvIGFjY291bnQKPiA+ICAgKiBtZWFuaW5nIHN2
NDggaXMgc3VwcG9ydGVkLgo+ID4gICAqLwo+ID4gLXN0YXRpYyBfX2luaXQgdm9pZCBzZXRfc2F0
cF9tb2RlKHZvaWQpCj4gPiArc3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodWludHB0
cl90IGR0Yl9wYSkKPiA+ICB7Cj4gPiAgICAgICB1NjQgaWRlbnRpdHlfc2F0cCwgaHdfc2F0cDsK
PiA+ICAgICAgIHVpbnRwdHJfdCBzZXRfc2F0cF9tb2RlX3BtZCA9ICgodW5zaWduZWQgbG9uZylz
ZXRfc2F0cF9tb2RlKSAmIFBNRF9NQVNLOwo+ID4gICAgICAgYm9vbCBjaGVja19sNCA9IGZhbHNl
Owo+ID4KPiA+ICsjaWZuZGVmIENPTkZJR19LQVNBTgo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAq
IFRoZSBiZWxvdyBmZHQgZnVuY3Rpb25zIGFyZSBrYXNhbiBpbnN0cnVtZW50ZWQsIHNpbmNlIGF0
IHRoaXMgcG9pbnQKPiA+ICsgICAgICAqIHRoZXJlIGlzIG5vIG1hcHBpbmcgZm9yIHRoZSBrYXNh
biBzaGFkb3cgbWVtb3J5LCB0aGlzIGNhbid0IGJlIHVzZWQKPiA+ICsgICAgICAqIHdoZW4ga2Fz
YW4gaXMgZW5hYmxlZC4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgaW50IGNob3Nlbl9ub2RlOwo+
ID4gKwo+ID4gKyAgICAgY2hvc2VuX25vZGUgPSBmZHRfcGF0aF9vZmZzZXQoKHZvaWQgKilkdGJf
cGEsICIvY2hvc2VuIik7Cj4gPiArICAgICBpZiAoY2hvc2VuX25vZGUgPj0gMCkgewo+ID4gKyAg
ICAgICAgICAgICBjb25zdCBjaGFyICpjbWRsaW5lID0gZmR0X2dldHByb3AoKHZvaWQgKilkdGJf
cGEsIGNob3Nlbl9ub2RlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImJvb3RhcmdzIiwgTlVMTCk7Cj4KPiBUaGUgY29tbWFuZCBsaW5lIGhhbmRs
aW5nIG5lZWRzIHRvIGhvbm9yIENPTkZJR19DTURMSU5FX0ZPUkNFIGFuZAo+IENPTkZJR19DTURM
SU5FX0VYVEVORCAod2hpY2ggbWFrZXMgaXQgcG9zc2libGUgdG8gdXNlIG5vezQsNX1sdmwgKmFu
ZCoKPiBLQVNBTiA7LSkpLgo+CgpJbmRlZWQsIEkgZm9yZ290IHRoYXQsIHRoYW5rcyBmb3Igbm90
aWNpbmchIEknbGwgcHJlcGFyZSB0aGUgInJlYWwiCmNvbW1hbmQgbGluZSBiZWZvcmUgbWF0Y2hp
bmcgdGhlIG5ldyBwYXJhbWV0ZXJzLgoKVGhhbmtzIGFnYWluLAoKQWxleAoKPgo+IEJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
