Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F96C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCeyJg7ZUYBkZIfC14u3/6X1/CykAy9m4xqaKdE9JRU=; b=Z/R8xGjSGaaiY7
	sobM5PrcA5p/hYeKLJGsKmLTFaHYkuDDtIUefzIc1Jl5LjO6uZmagecmlf0PfdWsr09LQ6CYI0QXf
	/5H4FwegluNM7eo7dsuFpz1TECQTDMSY3BLOHRlnlEcic0Mg0oYnbnF4+jT26cFZyvRvE3zImZBOB
	MSPrr+cCb38RfSGf6nFV5jxS2PmJ+g7OaZn9SvKqPvVZxxIEpVMv50SVRYotx3zeOdCM3vgvYA5V8
	/Y5sHe4vataJxSPV0sRs30DfFk3CUK/ibHsfHsU3SPAvzIsBFWCZxLO8DoVpMD/Zxwt46sNjXMSK+
	U2BUTM8Gz+GLbCcWesxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph36Q-00DMRU-1I;
	Tue, 28 Mar 2023 06:46:42 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph36N-00DMQA-0D
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:46:40 +0000
Received: by mail-lj1-x22d.google.com with SMTP id a21so4224949ljq.10
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 23:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679985996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1XHAQoLpqUkdzwTbDoHACx1szTrEA0iohgHCx3vq/8=;
        b=RPfmjUDq9fVJ0cg+5VyR6LMxEePEFgqG+46h4jYUj2MMJ6QuGhYgo7YNjS4fvjllti
         KrVwLdcjAfIMv4G65ncXtrQaY1PaVm3DhwsR8wSP3SvbOXkMtaHVn7OfwADd3rfHdqeZ
         gzz7xqzXsasrL7eAE7WwEDTmbERoWGptvOc5zrkC5ldAf+YYwvUQy+nurWpxEuC7SqpA
         uFtrvPGBzy5mgYkCySfAUDbDPdroQYr1TR+sCuK+k3Bl/yankxN3VPdRR4voY7FOMjjt
         X7wzHz3VqXWYctGxhNtvSkfds9V8Bew9qUPBA/9dIxGnVwNAvzmgaCqzuWk1ci+UaW98
         Ea+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1XHAQoLpqUkdzwTbDoHACx1szTrEA0iohgHCx3vq/8=;
        b=7a7z53GMqqK1YPbMGFa9EX84/v3spwKqzUYRQtbLb2l5RgvRuhb6uYRbKtmapKodjS
         r8Qj2ZHvV1GHMDawr4Pn7QFgpHOho3yTgQoSX7X2cEhSUl8i0F58kkaDPwM7jJ6C1fy5
         JnTGPIyNhT+uR5qX0Ztxo1zsM/PgyPQwaJZxvsgMfAywBipOII8E42rDalVLVyJPNzpl
         6ondbkEb+iMkSx9nM4KVrDyWwhHelKoCyO+xbEy5JK8CNhauSB1H+k+PgUY1sO57id9F
         VIEfCTPGtkVueKID07DYtwBhkRbpUZTz9TK2+OcnnNJXfr97JPfQcxtVLelGimUZ2Pc0
         UPxw==
X-Gm-Message-State: AAQBX9eDW1rB+dC0QxkZuy/ekEszMbDaUO5tvuR/YiaPrGjzn7VG6uva
	3BK5tPPU8ZgOb6cbtFntGBNzur3VJBQ3RawD2GYcdw==
X-Google-Smtp-Source: AKy350aj03u+AwN2EEmKhkoKmZSoRKbdhO/Z9rJtA54de/v8g1VSN1m3aP5mrq3kBBOiXkwL0KInrskLFPzTY8ZAugU=
X-Received: by 2002:a2e:a175:0:b0:299:ac68:4801 with SMTP id
 u21-20020a2ea175000000b00299ac684801mr4347500ljl.0.1679985995953; Mon, 27 Mar
 2023 23:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230327164941.20491-1-andy.chiu@sifive.com> <20230327164941.20491-12-andy.chiu@sifive.com>
 <5660672.DvuYhMxLoT@devpool47.emlix.com>
In-Reply-To: <5660672.DvuYhMxLoT@devpool47.emlix.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 28 Mar 2023 14:46:24 +0800
Message-ID: <CABgGipWcK6kAARBMCT8JGxV-9_yav_p0HME9+28vcv195R6_ww@mail.gmail.com>
Subject: Re: [PATCH -next v17 11/20] riscv: Add ptrace vector support
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Qing Zhang <zhangqing@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234639_142567_0B9A89B3 
X-CRM114-Status: GOOD (  27.66  )
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

T24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMTo1M+KAr1BNIFJvbGYgRWlrZSBCZWVyIDxlYkBlbWxp
eC5jb20+IHdyb3RlOgo+Cj4gT24gTW9udGFnLCAyNy4gTcOkcnogMjAyMyAxODo0OTozMSBDRVNU
IEFuZHkgQ2hpdSB3cm90ZToKPiA+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20+Cj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzIHB0cmFjZSBzdXBwb3J0IGZvciByaXNj
diB2ZWN0b3IuIFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIHdpbGwKPiA+IGJlIHNhdmVkIGluIGRhdGFw
IHBvaW50ZXIgb2YgX19yaXNjdl92X2V4dF9zdGF0ZS4gVGhpcyBwb2ludGVyIHdpbGwgYmUgc2V0
Cj4gPiByaWdodCBhZnRlciB0aGUgX19yaXNjdl92X2V4dF9zdGF0ZSBkYXRhIHN0cnVjdHVyZSB0
aGVuIGl0IHdpbGwgYmUgcHV0IGluCj4gPiB1YnVmIGZvciBwdHJhY2Ugc3lzdGVtIGNhbGwgdG8g
Z2V0IG9yIHNldC4gSXQgd2lsbCBjaGVjayBpZiB0aGUgZGF0YXAgZ290Cj4gPiBmcm9tIHVidWYg
aXMgc2V0IHRvIHRoZSBjb3JyZWN0IGFkZHJlc3Mgb3Igbm90IHdoZW4gdGhlIHB0cmFjZSBzeXN0
ZW0gY2FsbAo+ID4gaXMgdHJ5aW5nIHRvIHNldCB0aGUgdmVjdG9yIHJlZ2lzdGVycy4KPiA+Cj4g
PiBDby1kZXZlbG9wZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCB8ICA3ICsr
Kwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAgICB8IDcwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvZWxmLmggICAgICAg
ICAgICAgfCAgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcHRyYWNlLmMKPiA+IGluZGV4IDIzYzQ4YjE0YTBlNy4uNzVlNjZjMDQwYjY0IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiA+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3B0cmFjZS5jCj4gPiBAQCAtODAsNiArODQsNjEgQEAgc3RhdGljIGludCByaXNj
dl9mcHJfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ID4gIH0KPiA+ICAjZW5kaWYK
PiA+Cj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+ID4gK3N0YXRpYyBpbnQgcmlzY3Zf
dnJfZ2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldCAqcmVnc2V0LAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBtZW1idWYgdG8pCj4gPiArewo+ID4gKyAgICAgc3RydWN0IF9fcmlzY3Zf
dl9leHRfc3RhdGUgKnZzdGF0ZSA9ICZ0YXJnZXQtPnRocmVhZC52c3RhdGU7Cj4gPiArCj4gPiAr
ICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyh0YXJnZXQpKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAg
ICAgICogRW5zdXJlIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGhhdmUgYmVlbiBzYXZlZCB0byB0aGUg
bWVtb3J5IGJlZm9yZQo+ID4gKyAgICAgICogY29weWluZyB0aGVtIHRvIG1lbWJ1Zi4KPiA+ICsg
ICAgICAqLwo+ID4gKyAgICAgaWYgKHRhcmdldCA9PSBjdXJyZW50KQo+ID4gKyAgICAgICAgICAg
ICByaXNjdl92X3ZzdGF0ZV9zYXZlKGN1cnJlbnQsIHRhc2tfcHRfcmVncyhjdXJyZW50KSk7Cj4g
PiArCj4gPiArICAgICAvKiBDb3B5IHZlY3RvciBoZWFkZXIgZnJvbSB2c3RhdGUuICovCj4gPiAr
ICAgICBtZW1idWZfd3JpdGUoJnRvLCB2c3RhdGUsIG9mZnNldG9mKHN0cnVjdCBfX3Jpc2N2X3Zf
ZXh0X3N0YXRlLAo+IGRhdGFwKSk7Cj4gPiArICAgICBtZW1idWZfemVybygmdG8sIHNpemVvZih2
b2lkICopKTsKPgo+IE5vIGlkZWEgd2h5IEkgaGF2ZSBub3Qgc2VlbiBpdCBpbiBhbnkgcHJldmlv
dXMgdmVyc2lvbiwgYnV0IHRoaXMgInNpemVvZih2b2lkCj4gKikiIGp1c3QgbWFkZSBtZSB0aGlu
ZyAid2hhdCBpcyBnb2luZyBvbiBoZXJlPyIuIEkgcGVyc29uYWxseSB3b3VsZCBoYXZlCj4gd3Jp
dHRlbiBzb21ldGhpbmcgbGlrZSAic2l6ZW9mKHRvLnZhcikiIG9yICJvZmZzZXRvZih0by5idWYp
IiBvciBzb21ldGhpbmcgbGlrZQo+IHRoYXQuIFRoYXQgbWFrZXMgaXQgZWFzaWVyIGZvciBtZSB0
byB1bmRlcnN0YW5kIHdoYXQgaXMgc2tpcHBlZC96ZXJvZWQgaGVyZSwKPiBsZXQgYWxvbmUgbWFr
aW5nIGl0IGEgYml0IG1vcmUgZm9vbCBwcm9vZiB3aGVuIHNvbWVvbmUgY2hhbmdlcyBvbmUgb2Yg
dGhlCj4gc3RydWN0IGxheW91dHMuIFlNTVYuCj4KClRoYW5rcyBmb3IgdGhlIGZpbmRpbmcuIEZp
eGluZyBpdCBub3cKCj4gUmVnYXJkcywKPgo+IEVpa2UKPiAtLQo+IFJvbGYgRWlrZSBCZWVyLCBl
bWxpeCBHbWJILCBodHRwOi8vd3d3LmVtbGl4LmNvbQo+IEZvbiArNDkgNTUxIDMwNjY0LTAsIEZh
eCArNDkgNTUxIDMwNjY0LTExCj4gR290aGFlciBQbGF0eiAzLCAzNzA4MyBHw7Z0dGluZ2VuLCBH
ZXJtYW55Cj4gU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBHw7Z0dGluZ2VuLCBBbXRzZ2VyaWNodCBH
w7Z0dGluZ2VuIEhSIEIgMzE2MAo+IEdlc2Now6RmdHNmw7xocnVuZzogSGVpa2UgSm9yZGFuLCBE
ci4gVXdlIEtyYWNrZSDigJMgVXN0LUlkTnIuOiBERSAyMDUgMTk4IDA1NQo+Cj4gZW1saXggLSBz
bWFydCBlbWJlZGRlZCBvcGVuIHNvdXJjZQoKQ2hlZXJzLApBbmR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
