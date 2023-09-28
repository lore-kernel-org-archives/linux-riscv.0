Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C3E732E5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qluwAfw7v7Hp220YdXkpibXW17Wn9LA3Ma0JteaWjo=; b=ndcYjBpr0+Knln
	K9XHbfJF/9Yjw766lFqAu93sk5aWrf5dLEieEuG3cur3XIxtP8CF7xpZO1/1sxlWWk93LofaG30kh
	Al8TxUkSq9rAMrHvBZwL/GbAw374SvxqXpeJ+YUkAiYKv5YK0uEp7wrHErbn6KJ/GL0VSNhSsFQ50
	tBWoNJ9pToAVj63wXWfpT3fgq/cI5cNbp3sZooGIFbQCrump08ggqfogqZgSlOCqFr2JJ2kclaIEl
	8h6Ib/tO+qowIrVXOSwsU275Jze4JCFlu3X2zdODPJuLlleJ2iTjFdLr86W2yjj7WwaRDk0w9LZ2r
	gKqkVSXG38M8+sT9fYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltjD-005upK-20;
	Thu, 28 Sep 2023 16:19:03 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltjB-005ulT-0b
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 16:19:02 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-49a319c9e17so3542191e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695917939; x=1696522739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mQRi8ZNuvLxfOVIX7Pb/xHqZWWctvdJZZK30/RGLwA=;
        b=GQviA+igU/XCoBlK0fk1xj7DR4etbbxkgUc28ZIarFMA+MsbM1WwJRRILacqmls99j
         AxRCVV/4XsHNqBfOnE2BcVEZ/y4uZ51xo3i6JupyZjSPH42ciVS3FDA+VUjoA6/nYU2D
         SPHJDG3Xn7onaMGMbPGZUpBXdr5oyVKdEwlOCQQWR9FrcPt4sxOwiGqhyyX10o93JIla
         GydZm7WOWs85hs8kQ0/sn8V0UCFxQ9LQ2vzJQWDKIzN4NP1r5QpVtepu3ZkgHBXxPPNE
         W50GlxAPeP2WO44ucsLdS42298vLFaOn4MJ6smr+PPHSOlk+1UHQudpWeu2wnOfxaAzD
         onEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695917939; x=1696522739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mQRi8ZNuvLxfOVIX7Pb/xHqZWWctvdJZZK30/RGLwA=;
        b=wINwI4N91uwDDj0PJDzc8p4Dv+yb2UdulFsTLUSicrr0HMP/Jxw14mwrikGwAGxBxW
         KpSe3Iop6nfNRSf9BComFRHzs9qlcO6Q/L0tRW3G3Rjh4mcW+Wx/I/GL+HLs6leE8tPK
         qcEtL1LLS0IWQuZcmmxKNlT06I0C1EE4HvaN3/2cndH6vaoU1XZ1k92yTnFuPShd60zl
         xTIu9gzKR/hSZXGnWRgF5D6C5xxhdCH14jbqbRRM+gkoB9f/9TzJg7cCJGJhFdJxyohU
         r+0t+W1vDchXNOVYASCF5RG1UxNRRH4zdERF+18AITHqzD9QsRbq5JigGCDIXREWJqel
         rg/A==
X-Gm-Message-State: AOJu0Yw3sK8S9LmAvbr8f4luKtOtTZNls2bqrxTFAq5vKcCN3gf7o4og
	N6f5+dDOpuosr0AisJuq2qmPhbpPAZA8asi7dn0=
X-Google-Smtp-Source: AGHT+IEEQIZo78ZB+LRqd4cG7MAVnesmuoPM3CUNnGVROTnyjl3M5KNHKj7J142QD6g9SdwTyZEoANcgn+R7moVi+/E=
X-Received: by 2002:a1f:49c5:0:b0:496:b3b7:5d4c with SMTP id
 w188-20020a1f49c5000000b00496b3b75d4cmr1343220vka.16.1695917939028; Thu, 28
 Sep 2023 09:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <4e4bf02b-2264-491e-9b71-ae3b5ad7fc39@sifive.com>
In-Reply-To: <4e4bf02b-2264-491e-9b71-ae3b5ad7fc39@sifive.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 28 Sep 2023 17:18:12 +0100
Message-ID: <CA+V-a8sSmy-UNwsB3b_yuETTRGS2fBWvS4sTMaVghTWm6oUb+Q@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock_event rating
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	Anup Patel <anup@brainfault.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor.dooley@microchip.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_091901_246851_CF7C97D4 
X-CRM114-Status: GOOD (  14.45  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgNTowNOKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjMtMDktMjgg
NTo0NSBBTSwgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IFJlbmVzYXMgUlovRml2
ZSBTb0MgaGFzIE9TVE0gYmxvY2tzIHdoaWNoIGNhbiBiZSB1c2VkIGZvciBjbG9ja19ldmVudCBh
bmQKPiA+IGNsb2Nrc291cmNlIFswXS4gVGhlIGNsb2NrX2V2ZW50IHJhdGluZyBmb3IgdGhlIE9T
VE0gaXMgc2V0IDMwMCBidXQKPiA+IHdoZXJlYXMgdGhlIHJhdGluZyBmb3IgcmlzY3YtdGltZXIg
Y2xvY2tfZXZlbnQgaXMgc2V0IHRvIDEwMCBkdWUgdG8gd2hpY2gKPiA+IHRoZSBrZXJuZWwgaXMg
Y2hvb3NpbmcgT1NUTSBmb3IgY2xvY2tfZXZlbnQuCj4gPgo+ID4gQXMgcmlzY3YtdGltZXIgaXMg
bXVjaCBtb3JlIGVmZmljaWVudCB0aGFuIE1NSU8gY2xvY2tfZXZlbnQsIGluY3JlYXNlIHRoZQo+
ID4gcmF0aW5nIHRvIDQwMCBzbyB0aGF0IHRoZSBrZXJuZWwgcHJlZmVycyByaXNjdi10aW1lciBv
dmVyIHRoZSBNTUlPIGJhc2VkCj4gPiBjbG9ja19ldmVudC4KPgo+IFRoaXMgaXMgb25seSB0cnVl
IGlmIHlvdSBoYXZlIHRoZSBTc3RjIGV4dGVuc2lvbiBhbmQgY2FuIHNldCBzdGltZWNtcCBkaXJl
Y3RseS4KPiBPdGhlcndpc2UgeW91IGhhdmUgdGhlIG92ZXJoZWFkIG9mIGFuIFNCSSBjYWxsLCB3
aGljaCBpcyBnb2luZyB0byBiZSBtdWNoIGhpZ2hlcgo+IHRoYW4gYW4gTU1JTyB3cml0ZS4gU28g
dGhlIHJhdGluZyBzaG91bGQgZGVwZW5kIG9uIFNzdGMsIGFzIGluIHRoaXMgcGF0Y2g6Cj4KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDcxMDEzMTkwMi4xNDU5MTgw
LTMtYXBhdGVsQHZlbnRhbmFtaWNyby5jb20vCj4KVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlci4g
RG8geW91IGtub3cgYW55IHRvb2wvdXRpbCB3aGljaCBJIGNhbiB1c2UKdG8gbWFrZSBjb21wYXJp
c29ucz8KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
