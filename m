Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B5EC47079
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6TdOBkIk79kMzpCPupAbkRZV2rMpwDb6UDa0SZzkiY=; b=3SMz3IRYviYwnD
	A5lS3fMbG3/W3SJ52MdiJaIV+/RuD9rAsMXJUxzvyXF2gXn3CHAatDg9S7P1OU3bSGf27mJWzZ6O5
	MRUvi9pGtx+Rbs6p75zUHyucPjv7s/DzhL7YAqXf7YRopAAdyrcKaSs9bJYxVLUm23sMCOyUh+2GG
	wwo3OFoWlpVvsX/fyXbf18n8YZgkCHcAB96Y2BX9e5VTbldfDQBk3J5lDneP0VUCP5HJ6XhynaNCp
	ZzkAEHKNrh99IwAXUIHv/etwBJ1B13hDU8Lulivoe3PP9iWogjgACela7hwBGjGLF5ShwqBGqGVYj
	YqIBKCeVcbjcVlJRgFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKuXx-009sJO-14;
	Wed, 03 Jan 2024 06:16:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKuXr-009sIM-06
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 06:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2A51CE129B
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 06:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B99C433CC
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 06:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704262559;
	bh=aISuBIPvlbjdRJQp1EvQGGxlNwVmVGu5wNaG6PYXKW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohAFyRsFAMsRuWhgpjtVVyEX0rxljYHqbBiqZp07oThiUPqhjJMngZ2EPNGQsFVDJ
	 U4k5Wv3F80chaXU+07CONswhQm/ffQWI2/mHPkeVOhtAvoVnkPXKg7jxOyRfPD6Env
	 B+bWflRvzf6zEATvNPYwa01GoRraw8jgm7rJ53eFwWCLzC2VwzNyhvkWSy8FRRJCTY
	 MugXKtn7Lw62XaPfr4BhandButtX2UybxfZLba50Udh7firR0gLHMJ6o05Ju8bbxnp
	 fF9NK0Mhf4o0LrTeHBad6+Zc286+qkS55fH5AXSzz0ZWs48FnAkiOYsGgd+lvjsRb4
	 LRC8VDSKaOrRw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-556aa7fe765so991966a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 22:15:59 -0800 (PST)
X-Gm-Message-State: AOJu0Yzz/2C4g3ksEa3HhNHIt4xI3dpeawJGLv+Y1HVynl4sWG/hm3bh
	ZjQCcLcAgM3s3cuMju8rxboClG+MRNC4Yt92NiE=
X-Google-Smtp-Source: AGHT+IGH3h1v0Bkgu0W/NqOIVERH6UhOcT+omf7z0qMfRbc6D1WwAIhExCpIJxP6Dy0kf8SRjb6cp8iojBx0SEi9a8I=
X-Received: by 2002:aa7:d304:0:b0:555:da15:23ab with SMTP id
 p4-20020aa7d304000000b00555da1523abmr4772991edq.62.1704262557607; Tue, 02 Jan
 2024 22:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org>
 <20240102-81391283df04c430d76c0eb0@orel>
In-Reply-To: <20240102-81391283df04c430d76c0eb0@orel>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 3 Jan 2024 14:15:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
Message-ID: <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_221603_426573_27E4F3CB 
X-CRM114-Status: GOOD (  25.04  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCA3OjE54oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIERlYyAzMSwgMjAyMyBhdCAwMzoyOTo1
M0FNIC0wNTAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1
b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgY29zdCBvZiBjaGFuZ2luZyBhIGNh
Y2hlbGluZSBmcm9tIHNoYXJlZCB0byBleGNsdXNpdmUgc3RhdGUgY2FuIGJlCj4gPiBzaWduaWZp
Y2FudCwgZXNwZWNpYWxseSB3aGVuIHRoaXMgaXMgdHJpZ2dlcmVkIGJ5IGFuIGV4Y2x1c2l2ZSBz
dG9yZSwKPiA+IHNpbmNlIGl0IG1heSByZXN1bHQgaW4gaGF2aW5nIHRvIHJldHJ5IHRoZSB0cmFu
c2FjdGlvbi4KPiA+Cj4gPiBUaGlzIHBhdGNoIG1ha2VzIHVzZSBvZiBwcmVmZXRjaC53IHRvIHBy
ZWZldGNoIGNhY2hlbGluZXMgZm9yIHdyaXRlCj4gPiBwcmlvciB0byBsci9zYyBsb29wcyB3aGVu
IHVzaW5nIHRoZSB4Y2hnX3NtYWxsIGF0b21pYyByb3V0aW5lLgo+ID4KPiA+IFRoaXMgcGF0Y2gg
aXMgaW5zcGlyZWQgYnkgY29tbWl0OiAwZWEzNjZmNWUxYjYgKCJhcm02NDogYXRvbWljczoKPiA+
IHByZWZldGNoIHRoZSBkZXN0aW5hdGlvbiB3b3JkIGZvciB3cml0ZSBwcmlvciB0byBzdHhyIiku
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCB8IDQgKysrLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NtcHhjaGcuaAo+ID4gaW5kZXggMjZjZWEyMzk1YWFlLi5kN2I5ZDc5NTFmMDggMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+IEBAIC0xMCw2ICsxMCw3IEBACj4g
Pgo+ID4gICNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ID4gICNpbmNsdWRlIDxhc20vZmVuY2Uu
aD4KPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ID4KPiA+ICAjZGVmaW5lIF9fYXJj
aF94Y2hnX21hc2tlZChwcmVwZW5kLCBhcHBlbmQsIHIsIHAsIG4pICAgICAgICAgICAgICAgICBc
Cj4KPiBBcmUgeW91IHN1cmUgdGhpcyBpcyBiYXNlZCBvbiB2Ni43LXJjNz8gQmVjYXVzZSBJIGRv
bid0IHNlZSB0aGlzIG1hY3JvLgpPaCwgaXQgaXMgYmFzZWQgb24gTGVvYnJhcycgcGF0Y2hlcy4g
SSB3b3VsZCByZW1vdmUgaXQgaW4gdGhlIG5leHQgb2YgdmVyc2lvbi4KCj4KPiA+ICAoeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiBAQCAtMjMsNiArMjQsNyBAQAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAg
IF9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiAgICAgICAgICAgICAgcHJlcGVuZCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgIFBSRUZFVENIV19B
U00oJTUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAg
ICAgICAgICAiMDogICAgICBsci53ICUwLCAlMlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiAgICAgICAgICAgICAgIiAgICAgICAgYW5kICAlMSwgJTAsICV6NFxuIiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICIgICAgICAgIG9y
ICAgJTEsICUxLCAlejNcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IEBAIC0z
MCw3ICszMiw3IEBACj4gPiAgICAgICAgICAgICAgIiAgICAgICAgYm5leiAlMSwgMGJcbiIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgIGFwcGVuZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAg
ICAgICAgICAgICA6ICI9JnIiIChfX3JldHgpLCAiPSZyIiAoX19yYyksICIrQSIgKCooX19wdHIz
MmIpKSAgICAgICBcCj4gPiAtICAgICAgICAgICAgOiAickoiIChfX25ld3gpLCAickoiICh+X19t
YXNrKSAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgIDogInJKIiAo
X19uZXd4KSwgInJKIiAofl9fbWFzayksICJySiIgKF9fcHRyMzJiKSAgICAgICAgIFwKPgo+IEkn
bSBwcmV0dHkgc3VyZSB3ZSBkb24ndCB3YW50IHRvIGFsbG93IHRoZSBKIGNvbnN0cmFpbnQgZm9y
IF9fcHRyMzJiLgo+Cj4gPiAgICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAg
ICAgIHIgPSAoX190eXBlb2ZfXygqKHApKSkoKF9fcmV0eCAmIF9fbWFzaykgPj4gX19zKTsgICAg
ICAgICAgICAgICBcCj4gPiAtLQo+ID4gMi40MC4xCj4gPgo+Cj4gVGhhbmtzLAo+IGRyZXcKCgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
