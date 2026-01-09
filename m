Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D943D167FA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Htj6YCZryWuHW05V9cdxg4ax1hsp03ER3FgmcvFEbe4=; b=s684dn+jVuB6qw
	H716bYZ3DYqAWukNR8vtQVkAhfrxibxfXDQmtz2zmkc9uxUGWxe477eh4Q8K4nm9d6DuOYS7njQqv
	hoNko/PuLE9+9Pt79RIC4Mx3QHhuiZEhLXZQoHFaVXUEXeO+mKf9tcSsoLOn+haT0xvTxDYmFSy5v
	pzmOz/fjvjttxtJEMwBK3S4fyPCFE6O6eiOmqC7Dea09ehgb/x5dEwKqldRR0fbuysQ2DCOBT8nuW
	RByw3aEplUU8wumqs65/okICfpB5NFVIHJzOUwwW1K4JqIQJInoFcH1o9YMjvm9g76HHh9/bPa+4s
	6W24GqNMwYGVdDTzH7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ts-000000026Ym-2aBq;
	Fri, 09 Jan 2026 10:12:32 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Tq-000000026YR-35mz
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 10:12:31 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6467ac59e16so3134407d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767953549; x=1768558349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5UnQ4+RbLH5hA9T1G883ptw/7Yo4vuW1qZZcpMJdJQ=;
        b=si83eP4LXNFDIrBowHqTsCr499Fcmbw7fIpVILTUOB18jIKub3J7Azr/chf3CG2Chj
         qOhbazZ/bhJ87YM5x3kJCVIJj94QG3et0V3lrFsbVLhmUe636ounXyvssc47XK9wsrtl
         QfLkGxCdkzdyJYggv9Hax7wiYMN2fHVxmQgVSlQ9hxWo/iqkurlimb4SZ9NE37a5yHaC
         kjJtAVXT9viCC9hXdmCZAdrWDA4im+K01fl2v+xzWxk7+OZ8ZqdxrgJG0JvsgfUzZ28N
         ipJuvRR2iC6gvSDWBltbRkkZHVScJ/c6jNL9bIMCAxxgXKi99Qm+kJHr3mosaWnh1KEX
         kOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953549; x=1768558349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5UnQ4+RbLH5hA9T1G883ptw/7Yo4vuW1qZZcpMJdJQ=;
        b=vckx3Lc79aFneDddXHbfTWJQv/ujMugYwag+2lcrgDY30Q1RtrMqadwxhzJ0Y3PXvx
         qSOcYDZF7yT0iEeHUdUuKDwnog1BU8pzxQEP/EPe1T74GbGZKPXbqbe2D/aNJmer2+V8
         ngNa7ldAO+73PgMtsXy1mxhH1xF+qJoW4SZ4Y316GLlzasuzP7ECTQXZxVrFOsv2LGmL
         M3jOfQ77gMTSwvVjato15JvLzUMwYrCXcsOmJtCpDtewPVCOLlNwoTmjBzAV80CXBB7H
         aXsBuTCbfvnJupqIs2dbhvSVm16fkN61t8csr6OzWI1+YcP2OG9DKmyEtRSKKRf6grZz
         p2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV36N5n+zBOdpy7rHLlQOH5tPTq8ovm7mTxFVN42dBfnM24A/zy4vMR3Hx96CN8y85WyXXAdo+BO249Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/0IyQRxpNYcJ0E7DKmI6TIcs6ZWe6XKkHTDfHz/DZZKEXq3EI
	r9UCRbZrR15SHVMt7AfBsl7a7hvnxMRKrBd+P9NFOpfutKEiXa0yW/b/2kY974P8geR5Fr9pr3i
	0I4n5CKMt5LUkFGwdqJljOiZx4ZrSTWbmFJuTTAuLBA==
X-Gm-Gg: AY/fxX5gMqxw20V6ILc9kxbR0UtimIcscirEMhtjcvgiqVFeMuSoB6NfD4Ij/oAp16u
	EsjSNuXwQK4UjBphpCit+ffqMXAW77AfscY+ZeSjUKk95kjc9ydTkGHWFOzPR/iLM0CYI/gWcWy
	no7dAW/Rh4UAyl/pY+fO62xitHEC9hTjC3LSW7IEVS0HAJr3gHVWdCYFD3ySX/PQbzJsDnMkPps
	lBDhEtBQm2TWCNzqLJ6ePkF/1ltN9K8+6toQhjbnBiVcGsPcH3Mn3ro6WXGkv+isFQXV7Au9UQq
	VYYFuHVbyi+4CAxBDydJVSFaAJNlJ1lE5SUU/5poUDw=
X-Google-Smtp-Source: AGHT+IHwjyG2gHAKynms5yLd8dsoBN0TrT6WXnJJkvqrEPM5Oh9NnNxT58LAnnyarsoeqkwGZZAXFc3fOBsckE359B8=
X-Received: by 2002:a05:690e:1488:b0:640:d255:2d75 with SMTP id
 956f58d0204a3-64716c5ff62mr7691411d50.48.1767953549269; Fri, 09 Jan 2026
 02:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com> <20260109033608-GYA3681@gentoo.org>
In-Reply-To: <20260109033608-GYA3681@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 18:12:17 +0800
X-Gm-Features: AQt7F2ruyJZja2_iA58MgeCUcAeuWdBMOblJYXEsXdoTwjRnAKOiZA60duu51-A
Message-ID: <CAH1PCMYCLweVJ8WG2VY0jAk6UBuGA138urgfZV9+0fVeqmbbEw@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and
 Pico-ITX board bindings
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_021230_785601_2B270CED 
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

SGksIFlpeHVuCgpPbiBGcmksIEphbiA5LCAyMDI2IGF0IDExOjM24oCvQU0gWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IE9uIDIwOjI1IFRodSAw
OCBKYW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCBEVCBiaW5kaW5nIGRvY3VtZW50
YXRpb24gZm9yIHRoZSBTcGFjZW1pVCBLMyBTb0MgYW5kIHRoZSBib2FyZCBQaWNvLUlUWAo+ID4g
d2hpY2ggaXMgYSAyLjUtaW5jaCBzaW5nbGUtYm9hcmQgY29tcHV0ZXIuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+IHYz
OiBObyBjaGFuZ2UuCj4gPiB2MjogVXNlIG9uZS1ibGFuay1zcGFjZSBiZXR3ZWVuIG5hbWUgYW5k
IGVtYWlsIGFkZHJlc3MuCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbCB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAo+ID4gaW5kZXggOWM0OTQ4MjAwMmY3Njhj
ZDBjYzU5YmU2ZGIwMjY1OWE0M2ZhMzFjZS4uZmU2Mjk3MWM5ZDFmNGE3NDcwZWFiYzBlODRlOGE3
NDdmODRiYWYwZCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9zcGFjZW1pdC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAo+ID4gQEAgLTksNiArOSw3IEBAIHRpdGxl
OiBTcGFjZW1pVCBTb0MtYmFzZWQgYm9hcmRzCj4gPiAgbWFpbnRhaW5lcnM6Cj4gPiAgICAtIFlh
bmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+ID4gICAgLSBZaXh1biBMYW4gPGRsYW5AZ2Vu
dG9vLm9yZz4KPiA+ICsgIC0gR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPgo+
IHNvcnQgYnkgYWxwaGFiZXQgbGV0dGVyIG9mIGZpcnN0IG5hbWU/CgpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcgY29tbWVudHMuClN1cmUsIEkgY2FuIGRvIHRoYXQuCgo+Cj4gPiAgZGVzY3JpcHRpb246
Cj4gPiAgICBTcGFjZW1pVCBTb0MtYmFzZWQgYm9hcmRzCj4gPiBAQCAtMjYsNiArMjcsOSBAQCBw
cm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgLSB4dW5sb25nLG9yYW5nZXBpLXIycwo+ID4g
ICAgICAgICAgICAgICAgLSB4dW5sb25nLG9yYW5nZXBpLXJ2Mgo+ID4gICAgICAgICAgICAtIGNv
bnN0OiBzcGFjZW1pdCxrMQo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gLi4KPiA+ICsgICAgICAgICAg
LSBjb25zdDogc3BhY2VtaXQsazMtcGljby1pdHgKPiBpZiBEVCBtYWluYWluZXIgaGFzIG5vIG9i
amVjdGlvbiwgSSdkIHN1Z2dlc3QgdG8gY2hhbmdlIHRvIGVudW0KPiAgICAgICAgICAgICAgLSBl
bnVtOgo+ICAgICAgICAgICAgICAgICAgLSBzcGFjZW1pdCxrMy1waWNvLWl0eAo+Cj4gYWx0aG91
Z2ggc2luZ2xlIGVudW0gaXMgZWZmZWN0aXZlbHkgZXF1aXZhbGVudCB0byBjb25zdCwgYnV0IGVh
c3kgZm9yCj4gYWRkaW5nIG1vcmUgYm9hcmRzIGluIGZ1dHVyZSAobm8gY2hhbmdlIHRvIHByZXZp
b3VzIGNvZGUpLi4KPgoKT2ssIEkgc2VlIHlvdXIgcG9pbnQuIEkgY2FuIGZpbmQgdGhlcmUgYXJl
IG90aGVyIHlhbWwgZmlsZXMgZG9pbmcgdGhlIHNhbWUKc3R5bGUuIElmIG5vIG90aGVyIG9iamVj
dGlvbiwgSSB3aWxsIGNoYW5nZSBpdCB0byBlbnVtIGluIG5leHQgdmVyc2lvbi4KCkJSLApHdW9k
b25nIFh1Cgo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzcGFjZW1pdCxrMwo+ID4KPiA+ICBhZGRp
dGlvbmFsUHJvcGVydGllczogdHJ1ZQo+ID4KPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+Cj4g
LS0KPiBZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
