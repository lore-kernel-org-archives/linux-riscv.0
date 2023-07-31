Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE9C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVM1yjmX24syRboN5yHgYjiwAsN6A8rApg7jtOBFR2g=; b=mRfZFfNeV+rFUu
	7mA4VUXEHdpk5NLCzkfZm9t12CZG/04PcgCklz66jVBson7rmRqsgJ0ATnJNEQuF4YWA4br62nuCc
	mK8xkCHl8+TkXXWb5vY3+m3MZ4lzcXu/ue8oZ3TZ/kugMWj+Uct0LNncRFUBfcpIcPXvrdwEwfXg8
	H8SD0yxRJDjp7bm8EkYtgIxZMdv6ASIyknFvoxrbO2UR/I3pA4vEE3FjiqjfsthNv4N4EcPFkhRrY
	tH3JN1obNCnO8G9nTWDctJoQqLkfZwm0vumH+o1mgFZmI3SMAIPhQV1ftK7mc6p6ncIvJoffM2zRF
	ccsYCoUWlXloagg+klqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRLL-00FMVp-0w;
	Mon, 31 Jul 2023 11:45:43 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRLI-00FMU7-1o
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 11:45:41 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7835e5fa459so180296339f.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690803934; x=1691408734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qqk/kt6+Ga7PWsdfCK1cL1LbXt2AwvGMSRMyEpCfxI=;
        b=okzYRkktr+nRrSVtBCUlShJ4iEpZ4pP6gbHywAWdvOlXSUoGQKdU1X0HWGYabemgKH
         ytJtYPBeUmdTwPScRayYq5tIJ7ak5hhR0ew7NKN/Yo+fqw8AZAX2VpLThA7e6RhhpeGw
         hnmLHI7Y6YN/pNZbqjNKJQBi5RKYL1MV2iktpmMb4E2/ruFT59/jbxVqJXmmQHo2/HAT
         05fUJ8tb3NGegcZhmZjThREc4+fFBqwwcSiAz4nVC7Ez4xC/5904A9vnR4KY8kqEX+rD
         kIxNYijsDgmpEmDesKraaqvWv9+SAElTQ+yLhbTsaQfeADCySqlFkzj9r8xzKkC/A4Td
         PyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690803934; x=1691408734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qqk/kt6+Ga7PWsdfCK1cL1LbXt2AwvGMSRMyEpCfxI=;
        b=ijC6wgQestjtJ4b3Wcn89vnbN5RNgNe6ZgKini3dnDvWb9+4HYgqclu6828VjICK2J
         m81I2y0o2Shy6gn1iSyu9UM4/ZjXGtbfTby13X83lVeiLEZDpZzyub1OPUb/uJg0IY0j
         khOJRfOz+d8i8ig3M0zk+k/mmk3w+eNw35gW63trbuuHL6Q33A8zH+atUSbdDugV/Xkj
         asz2cPHwPk+X0oB3GKjoVbDZnjPxJCqvLQEJqSPnjYMgjqbA0Im2LSby7CRtrpM4XLKU
         c/FualHXR6k7vqjH/24NAoT1IXUVMkz4uALcpfWczW2bz/SSfpC+J7zQolpUjPDtiLSa
         qcqQ==
X-Gm-Message-State: ABy/qLaBaqeeCvzNX0uu4BQmbFlvZ89iH+TxYiMiiXk22TG0HXMx6RRg
	qeKIdc93RA5LguIAzPykeD67k7nwkTalYUXcw9Y=
X-Google-Smtp-Source: APBJJlFrThYBjex3opWL4ObHhYJCyDIqwz8yyEyTGf1e1HNfu2R5yX7uSTL8+3rOH2emiyhCqRd8wSTGDCFWcr7gH1E=
X-Received: by 2002:a05:6602:8b:b0:786:26f0:3092 with SMTP id
 h11-20020a056602008b00b0078626f03092mr7456305iob.3.1690803934488; Mon, 31 Jul
 2023 04:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker> <CA+V-a8u3F_XDjBfVVVvNMfjrni8pgpcRgbVt6_Ax1TmG2fJdEg@mail.gmail.com>
 <20230731-tribute-splashing-6a90f443cefe@wendy>
In-Reply-To: <20230731-tribute-splashing-6a90f443cefe@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Jul 2023 12:45:08 +0100
Message-ID: <CA+V-a8uHAQBZJBVtLbhxczwAAZYcVSRz+CGoQX0EmPDU5OxEFA@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_044540_620845_25A88FE5 
X-CRM114-Status: GOOD (  21.36  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCAxMjozOeKAr1BNIENvbm9yIERvb2xl
eQo8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMzEs
IDIwMjMgYXQgMTI6MzA6NDNQTSArMDEwMCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiBPbiBT
dW4sIEp1bCAzMCwgMjAyMyBhdCA0OjA54oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4gT24gU3VuLCBKdWwgMDIsIDIwMjMgYXQgMDk6MzQ6MjZQTSAr
MDEwMCwgUHJhYmhha2FyIHdyb3RlOgo+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+ID4gPiA+ICtjb25maWcgUklT
Q1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTCj4gPiA+ID4gKyAgICAgYm9vbAo+ID4gPiA+ICsgICAg
IGRlcGVuZHMgb24gUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ID4gKyAgICAgaGVscAo+ID4g
PiA+ICsgICAgICAgVGhpcyBlbmFibGVzIGZ1bmN0aW9uIHBvaW50ZXIgc3VwcG9ydCBmb3Igbm9u
LXN0YW5kYXJkIG5vbmNvaGVyZW50Cj4gPiA+ID4gKyAgICAgICBzeXN0ZW1zIHRvIGhhbmRsZSBj
YWNoZSBtYW5hZ2VtZW50Lgo+ID4gPgo+ID4gPiBQZXIgRG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRj
aC1hY2NlcHRhbmNlLnJzdDoKPiA+ID4KPiA+ID4gIndlJ2xsIG9ubHkgY29uc2lkZXIgcGF0Y2hl
cyBmb3IgZXh0ZW5zaW9ucyB0aGF0IGVpdGhlcjoKPiA+ID4KPiA+ID4gLSBIYXZlIGJlZW4gb2Zm
aWNpYWxseSBmcm96ZW4gb3IgcmF0aWZpZWQgYnkgdGhlIFJJU0MtViBGb3VuZGF0aW9uLCBvcgo+
ID4gPiAtIEhhdmUgYmVlbiBpbXBsZW1lbnRlZCBpbiBoYXJkd2FyZSB0aGF0IGlzIHdpZGVseSBh
dmFpbGFibGUsIHBlciBzdGFuZGFyZAo+ID4gPiAgIExpbnV4IHByYWN0aWNlLiIKPiA+ID4KPiA+
ID4gSSdtIG5vdCBzdXJlIHdoaWNoIGl0ZW0gdGhpcyBwYXRjaCBzZXJpZXMgYmVsb25ncyB0by4K
PiA+ID4KPiA+IE1heWJlIENvbm9yIGNhbiBoZWxwIG1lIGhlcmUgOykKPgo+IEknbSBub3QgZW50
aXJlbHkgc3VyZSB3aHkgeW91IG5lZWQgbXkgaGVscCwgaXQncyB5b3VyIGNvbXBhbnkgdGhhdAo+
IG1hbnVmYWN0dXJlcyB0aGUgU29DIHRoYXQgbmVlZHMgdGhpcyBhZnRlciBhbGwuLiBJIHRoaW5r
IEVtaWwgYWxyZWFkeQo+IHBvaW50ZWQgb3V0IHRoYXQgaXQgd2FzIHRoZSBsYXR0ZXIgb2YgdGhl
IHR3by4gSSBndWVzcyBpdCBpcyBub3QgYW4KPiAiZXh0ZW5zaW9uIiBpbiB0aGUgc3RyaWN0ZXN0
IHNlbnNlIG9mIHRoZSB3b3JkLCBidXQgaXQgZmlsbHMgdGhlIHNhbWUKPiBnYXAgYXMgb25lLCBz
byAvc2hydWcuCj4KQWFoYSBJIHdhcyB3b25kZXJpbmcgSWYgdGhlcmUgaGFkIHRvIGJlIGFuIGFk
ZGl0aW9uYWwgZW50cnkgaGVyZSB0bwpmaXQgdGhpcyBjYXNlLCBidXQgaWYgaXQgYWxyZWFkeSBk
b2VzIGZpdCBpbiBpZ25vcmUgbWUuIFRoYW5rcyBmb3IgdGhlCmNsYXJpZmljYXRpb24uCgpDaGVl
cnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
