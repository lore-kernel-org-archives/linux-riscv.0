Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9194C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iwyvcq2QI0HeuOTI0w5YT62Ll4+UHJj88X9AEoC5AN4=; b=vwme2cAwWCHj/M
	ULNP6+71lXtkZ1F9KbVVWxnnf5t9aiBmkyaBS7qJw2ipVkmLxdHdKA0JIIEGreEWd8/ZVjNlD+IFQ
	js9LiqMTwEtdHDXeT8gfQlxrphZMRD3QokHbV/5uU45EvczLBeAiIb1fTbrXVVjPU8zNuAlN05SKA
	0aJJK89RVxrY2mxN9YZdAGds2lqgYXBKjdZXf5Pxo0xxGcxdN6P1+m2njx+n1zfvqApFabB7FrGG0
	3bMNJI4GX6Ycp303lJigNdtyzq1OSfIG1pgoaKxlQfiTUmwEIpO52TxrsXbvYH3ckyUi8rsRG7SgT
	mkmN9nAfY5E2+h9SjNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZHW-002xDH-15;
	Fri, 26 May 2023 15:23:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZHS-002xBV-0i
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:23:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d58b3efbso570421f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685114578; x=1687706578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm0BztWeWOmSQyeDDYBVgxkYKsdv3ZjzePzlrRRXGLo=;
        b=ItxSceabl815FbWyIm+ZIKMnJoKMo2E0buhhE2Ou7PcOYfbNkW+ndTa7bOwj8NCysX
         7Wi6trkIznJYsoDVz/ujsnU6j0lTesYq0ibj9hdvGrUpqLgiV8kyxf4LIIAYLaeHgVXN
         sGEdvqipKnyTiimg+oNAK2qtS8edxgGthQjeoJC59N3CS/QkxwsHNok1c43FwjDgbmTN
         KCZaDrPZV4NUHzzmmjemc64mPu5ZMZIolW8p0M87+GOjNBRraA1NWpoSxvE0cimA6Tn6
         QOWIEJJCcFtY/PvmDqzeBqScttP/QkPxgu31i0uya5BhYiEMsRUH/Li9jW5zjfnpwKlR
         iBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114578; x=1687706578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm0BztWeWOmSQyeDDYBVgxkYKsdv3ZjzePzlrRRXGLo=;
        b=lTwT1wcF84PkQ12+gSjIrAXWn+JvDs2lIjYVB4wXOVwDO5h5L3/G+I3bAIQrQyVtj/
         XLi8OJ6AC7Xc/7MCj6mVgRM0hYpAXGzpIaEXNxVEX/XkS5HgTxDdcIGJAw2aouFcpyr/
         qt00e/FuKywqYtq8wu3gTnC7M+00YeJ6VJAZnevIepumPaJlOyfv6rAJmGZT/4S2TwD5
         Ucf5sqPKxD8+uUcBVxLR+Sp+GgkHzRfZlSQ/6thd0CmHq9XH80Sk/W4GI9mw5ah5Ch+0
         x1r/gTqMGTpLYKxhJEaOABWyVei9ThQa+VoU4eZE7rQJvadl3YwJS0D7wIbkfdQ5vV/2
         mq+A==
X-Gm-Message-State: AC+VfDwTutVb4PahDKfWkwYV3P68zmGT9O8Hwwk1T+0Jb10uw/iLrfGB
	SY//+6RjKO0HNkLTCRpiZyFM1mdtmy1UNPRXcH//+w==
X-Google-Smtp-Source: ACHHUZ61QWWYN5nYT1QLRB6g7Ao0U+3BXvCyZL/2rjs5jWs+Ay7wIyU4jmrWZW+vt6O/oDtOyS18YVFVzkDfK+5yx+E=
X-Received: by 2002:adf:e990:0:b0:306:42bb:53be with SMTP id
 h16-20020adfe990000000b0030642bb53bemr1829219wrm.10.1685114577926; Fri, 26
 May 2023 08:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud> <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud> <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud> <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
 <20230526-steep-omen-a5a46a1086bf@spud> <f82e7d3d-a16d-593e-7513-753b5cbf28af@ghiti.fr>
 <CAAhSdy0_XqiB=1w3hnYkipPj1aF_D=z=MD2fKLxk6rb_iDdBow@mail.gmail.com>
In-Reply-To: <CAAhSdy0_XqiB=1w3hnYkipPj1aF_D=z=MD2fKLxk6rb_iDdBow@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 26 May 2023 17:22:47 +0200
Message-ID: <CAHVXubj2oHJGwbfEukxRg58xHyVOieTdCa5wjHsR5XZ8rmxjgg@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Anup Patel <anup@brainfault.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <apatel@ventanamicro.com>, robh@kernel.org, jeeheng.sia@starfivetech.com, 
	linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_082302_447449_F38F4351 
X-CRM114-Status: GOOD (  28.66  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgNToxN+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgODo0MuKAr1BNIEFs
ZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDI2LzA1
LzIwMjMgMTY6NTksIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXkgMjYsIDIw
MjMgYXQgMDM6MTQ6MzNQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPj4gSGkg
ZXZlcnlvbmUsCj4gPiA+Pgo+ID4gPj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTE6MjTigK9Q
TSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPj4+IE9uIFRodSwg
TWF5IDI1LCAyMDIzIGF0IDAxOjA2OjA0UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4g
Pj4+PiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMTozOeKAr0FNIENvbm9yIERvb2xleSA8Y29u
b3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Pj4+PiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAx
MTozNzo0MEFNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+ID4+Pj4+Cj4gPiA+Pj4+Pj4g
QW55IHRlc3Rpbmcgb2YgaGliZXJuYXRpb24gc3RpbGwgbmVlZHMgdG8gcmV2ZXJ0IHRoZSBwYXRj
aCB1bnRpbCB3ZQo+ID4gPj4+Pj4+IGhhdmUgdGhlIHByb3BlciBmaXguCj4gPiA+Pj4+PiAidGhl
IHBhdGNoIiBpcyB3aGF0IGV4YWN0bHk/IEkgYXNzdW1lIHlvdSBkb24ndCBtZWFuIGRlcGVuZGlu
ZyBvbgo+ID4gPj4+Pj4gTk9OUE9SVEFCTEUsIHNpbmNlIHRoYXQgaXMgYSBLY29uZmlnIG9wdGlv
bi4KPiA+ID4+Pj4gTm9wZS4gU29ycnkgSSBtZWFudCB0aGUgY29tbWl0Cj4gPiA+Pj4+Cj4gPiA+
Pj4+IDMzMzUwNjggKCJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFy
IG1hcHBpbmciKQo+ID4gPj4+IEFoLCBpZiB5b3VyIFNCSSBpbXBsZW1lbnRhdGlvbiBpcyBvbmUg
b2YgdGhlIGFmZmVjdGVkIG9uZXMsIHllYWguCj4gPiA+Pj4gSWYgbm90LCB5b3UgY2FuIGp1c3Qg
c2V0IE5PTlBPUlRBQkxFIDopCj4gPiA+PiBAQmrDtnJuIFTDtnBlbCBlbWl0dGVkIHRoZSBpZGVh
IG9mIGV4Y2x1ZGluZyBmcm9tIHRoZSBoaWJlcm5hdGlvbiBhbGwKPiA+ID4+IHRoZSBtZW1vcnkg
bm9kZXMgaW4gdGhlICIvcmVzZXJ2ZWQtbWVtb3J5IiBub2RlCj4gPiA+PiAoaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC1yYzEvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2ZWQtbWVtb3J5LnlhbWwpOgo+ID4g
Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSBkb24ndCBzZWUgd2h5IGl0IGlzIG5vdCBkb25lIGJ5
IGRlZmF1bHQgYnkgdGhlCj4gPiA+PiBrZXJuZWwuCj4gPiA+IE15IHVuZGVyc3RhbmRpbmcgd2Fz
IHRoYXQgaXQgd2FzIHBlcmZlY3RseSBmaW5lIHRvIHVzZSByZXNlcnZlZCBtZW1vcnkKPiA+ID4g
bm9kZXMgdG8gZmVuY2Ugb2ZmIHNvbWUgbWVtb3J5IHRvIHVzZSBpbiBkZXZpY2UgZHJpdmVycyBl
dGMsIHdoaWNoIHRoZW4KPiA+ID4gbWF5IG5lZWQgdG8gYmUgc2F2ZWQvcmVzdG9yZWQuCj4gPgo+
ID4KPiA+IEFncmVlZCwgYnV0IEkgd291bGQgc2F5IHRoYXQgaXQncyB1cCB0byB0aGUgZHJpdmVy
IHRoZW4gdG8gdGFrZSBjYXJlIG9mCj4gPiB0aGF0LCBzZWUgaHR0cHM6Ly9kb2NzLmtlcm5lbC5v
cmcvZHJpdmVyLWFwaS9wbS9ub3RpZmllcnMuaHRtbAo+Cj4gSSBhZ3JlZSwgaXQgc2hvdWxkIGJl
IGRyaXZlcnMgcmVzcG9uc2liaWxpdHkgdG8gc2F2ZS9yZXN0b3JlIHRoZSBkZWRpY2F0ZWQKPiBy
ZXNlcnZlZCBtZW1vcnkgdXNlZCBieSBpdHNlbGYuCj4KPiBBbHRob3VnaCwgSSB0aGluayB3ZSBz
aG91bGQgYXQgbGVhc3Qgc2F2ZS9yZXN0b3JlIHJlc2VydmVkIG1lbW9yeQo+IHJlZ2lvbnMgaGF2
aW5nICJyZXVzYWJsZSIgcHJvcGVydHkgc2V0LgoKR29vZCBwb2ludCEgSSdsbCBwcm9wb3NlIGFu
IFJGQyBhbmQgZ2F0aGVyIGZlZWRiYWNrIGZyb20gdGhlIHBlb3BsZSBpbgpjaGFyZ2Ugb2YgdGhl
IGhpYmVybmF0aW9uIHByb2Nlc3MuCgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiA+Cj4gPgo+ID4g
Pj4gVW5sZXNzIHRoZXJlIGlzIHN0dWZmIGluIHRoaXMgbm9kZSB0aGF0IG5lZWRzIHRvIGJlICJo
aWJlcm5hdGVkIiwgSQo+ID4gPj4gdGhpbmsgdGhhdCB3b3VsZCBiZSBhIHZlcnkgZ29vZCBzb2x1
dGlvbiBzaW5jZSB3ZSB3b3VsZCBub3QgcmVseSBvbgo+ID4gPj4gdGhlIG5hbWUgb2YgdGhlICJp
bnRlcm5hbCIgbm9kZXMgb2YgIi9yZXNlcnZlZC1tZW1vcnkiIChpLmUuCj4gPiA+PiAibW1vZGVf
cmVzdiIpLgo+ID4gPj4KPiA+ID4+IEknbSBkaWdnaW5nIGludG8gd2h5IGl0IGlzIG5vdCBkb25l
IGJ5IGRlZmF1bHQsIGp1c3Qgd2FudGVkIHRvIGhhdmUKPiA+ID4+IHlvdXIgZmVlZGJhY2sgYmVm
b3JlIHRoZSB3ZWVrLWVuZCA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
