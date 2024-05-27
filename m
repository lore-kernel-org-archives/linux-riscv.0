Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BDC25B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=297Bovf+fBjkKAytvEp1UCQLdk/wSnkJyVMGxlX2vnw=; b=IAxhtglilkj2V4
	e7j8j861QfLnwPpmMm6N6+mRSnsmiXrTdzWs2cgbCHHj8yppEJgPlsb226yofqCqNGuyXtWnU8r8w
	xfy8y6X2Nf1poCglqg+lUAPRT/wmWMfB50Ah4tg7ISqn7CLhpN9mO8fjZ1RXM+LCJjyaX6wA9djiI
	iLHV83lZmpQ3d8XKn1co0xkoR+kZCDWtbdRgpAYqWhbSKk8op763Pvi13pTgD2aOp0I0OO6kZiAQ7
	wZZzFhef651EXXB/a1YzARzR/oQ0xyLM5zMwAwLJhSZxWmxuyzeiDH9JoFG0lEpVrbL1XFy6kR54b
	JQvggKahRkVyNqJRCnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVhF-0000000EEOu-30to;
	Mon, 27 May 2024 08:27:09 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVhC-0000000EEMe-1ybB
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 08:27:08 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36ddf683ad7so31188005ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1716798420; x=1717403220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5SBKZRmfn8ClYY/nEFrKLglh6rD618P8LlNAa3InrU=;
        b=NhW7E6vKnVc6Ql4UfmmPqmpzvlg54qHoWijtaiZKCjjarINEfKLpm4fXLh7HjmI8Si
         HDe8uMtmH8O95wd7rU144eN5zBMGggIP4MAFutXo3QDDbuTA4dtl1a/0Vw+0YdafTWVD
         XBpy1kTXEDAvG8C5Y90PwpVjwUK7ELU8+MNz4XzLUekjzKspjg8q+EShX8gLAfywXjW1
         E/ruQ5BjJxRZ/naZnuCaigMGj8JWOOkyvuQzA47UdXFAC1rnn/31SxUgLEJX0/pm5B4c
         8VGkdenBMuwHDEIOVnAbM1RwGXRrPX4bdxhBAtIJ6lnmrJ7AhKQH/ACx6OO7N0sLOLug
         u0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798420; x=1717403220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5SBKZRmfn8ClYY/nEFrKLglh6rD618P8LlNAa3InrU=;
        b=Rt4myvqzxld09sdJUw1RZT9NLtymx3jivIK8BzLtBumBBDFyezOuwg8S6s2C/JauEB
         FJ7H1arzVjuJu/N2NRSO4esWxNVv8IFi+RLlswt5gs2FKkFEpO38NzDmefw5KKIOs8IV
         qsByIJhZtYsT9H1Q5twMX7a2YIRX1m+UTqjSyZjsYiDw44GmkKiCCelMppd4bgK8zTA5
         Lk2tqfWAdyF3E85n26y+xlkMd3kF9pSbbXw6Yvkw83C7ERdLk3PbuvoLaKAgqE97qXub
         kP8W8T5s+H/V8vud4Fw8JYN6o4d3ZL4Qq1UiJGVjofe7kC71e3vw03sKE5bbAIIDrY8J
         dmdw==
X-Gm-Message-State: AOJu0Yzb1Ca9JGK98CgK6dnCurPKrwCkVCHGGUVT1PWAuivBi2FyFDcE
	REFvCuo3/W6GlbShqzRzSgycxMGnJSva62yLNK8u1H/2yh9KJ1WMW5KOzr7JC2/wTOe6GOE7d64
	56GQbAWp6ytaOmXq2i7DrRsGhSaLjbZUIx4NJdQ==
X-Google-Smtp-Source: AGHT+IEgDT4pS/mZr+ttNPQ/LXB18npnZnRGGeZXrhjUs0eiWtyBh4xHpLQwJaB4P1cmTNr+R0jrfrct3QLM4SE+COM=
X-Received: by 2002:a92:cf0a:0:b0:373:7f12:bc1a with SMTP id
 e9e14a558f8ab-3737f12c098mr74389655ab.13.1716798419836; Mon, 27 May 2024
 01:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240527081113.616189-1-sunilvl@ventanamicro.com>
In-Reply-To: <20240527081113.616189-1-sunilvl@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 May 2024 13:56:47 +0530
Message-ID: <CAAhSdy2tDtYPwPPa2o7_JBpVJXynv9+NwRMoOXErjRCcs+xBYg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Fix memory leak when
 riscv_intc_init_common() fails
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_012706_711358_8D494061 
X-CRM114-Status: GOOD (  15.78  )
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

T24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTo0MeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdoZW4gcmlzY3ZfaW50Y19pbml0X2NvbW1vbigpIGZh
aWxzLCB0aGUgZmlybXdhcmUgbm9kZSBhbGxvY2F0ZWQgaXMgbm90Cj4gZnJlZWQuIEZpeCB0aGlz
IG1lbW9yeSBsZWFrLgo+Cj4gRml4ZXM6IDcwMjNiOWQ4M2YwMyAoImlycWNoaXAvcmlzY3YtaW50
YzogQWRkIEFDUEkgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYyB8IDkgKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IGlu
ZGV4IDllNzFjNDQyODgxNC4uNGYzYTEyMzgzYTFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bnRjLmMKPiBAQCAtMjUzLDggKzI1Myw5IEBAIElSUUNISVBfREVDTEFSRShhbmRlcywgImFuZGVz
dGVjaCxjcHUtaW50YyIsIHJpc2N2X2ludGNfaW5pdCk7Cj4gIHN0YXRpYyBpbnQgX19pbml0IHJp
c2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxv
bmcgZW5kKQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm47Cj4gICAgICAg
ICBzdHJ1Y3QgYWNwaV9tYWR0X3JpbnRjICpyaW50YzsKPiArICAgICAgIHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmbjsKPiArICAgICAgIGludCByYzsKPgo+ICAgICAgICAgcmludGMgPSAoc3RydWN0
IGFjcGlfbWFkdF9yaW50YyAqKWhlYWRlcjsKPgo+IEBAIC0yNzMsNyArMjc0LDExIEBAIHN0YXRp
YyBpbnQgX19pbml0IHJpc2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVh
ZGVycyAqaGVhZGVyLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAgICAgICAg
IH0KPgo+IC0gICAgICAgcmV0dXJuIHJpc2N2X2ludGNfaW5pdF9jb21tb24oZm4sICZyaXNjdl9p
bnRjX2NoaXApOwo+ICsgICAgICAgcmMgPSByaXNjdl9pbnRjX2luaXRfY29tbW9uKGZuLCAmcmlz
Y3ZfaW50Y19jaGlwKTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgaXJxX2Rv
bWFpbl9mcmVlX2Z3bm9kZShmbik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4KPiAg
SVJRQ0hJUF9BQ1BJX0RFQ0xBUkUocmlzY3ZfaW50YywgQUNQSV9NQURUX1RZUEVfUklOVEMsIE5V
TEwsCj4gLS0KPiAyLjQwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
