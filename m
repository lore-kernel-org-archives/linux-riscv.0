Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA93C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iTI4upclbAFpM6fqlp2IdBAAHR0OVYv+Ztz4mcEULWQ=; b=l0/nuHpTjIKfosHBA/E7Kj6Xuh
	qODhCcWCgVhOgTsmhuJ5mtM/OvvYTCOjSBclKtjgrL4K87ZYif1dAP6O8AGGBmlwjzjB4Gb7zy2Np
	g9IKCuGhxSbg2j6kaPdInyUCOrgTxUIDArhhdsOaMxWrVuIohSmgAcAIwoB+60jgS1+50Dm8PU/j6
	vwaQdkt11wf6NQY1LbyAfqv/SK7DSWXkU3jszEfgLfq3TDWPZTAIHHf62TYcKVS/hxhbemthLva0c
	yZFTl7ARVspdz+8ANg2HZa0qzb1YC6Nucxq3u5qFPvICpTcuRmTusXt6A8Gf2Ruyac/c5xcbmOHnw
	T/bMAmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJiH-0038cy-2L;
	Thu, 21 Dec 2023 14:07:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJiD-0038bM-06
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 14:07:48 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A0013F2C1
	for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703167659;
	bh=YSFGFVOxlECeWrb1201TBHQMqNul2EH+RYRBpW3Owdk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vrOt3mNPIqDZFQmElKWBgamyxG3HSXwUAhXtIykqlf4hNLf9632k50seanQzW8f5Z
	 N6AsGWcoN1bUmBBNF4GcceiNimdfaVo0ZuX8iIrCkDpF57UN34/itQxvjA1AgX8wCv
	 tJXhaFHmMu0yv5g2I4ck8G6hKsjoVsR4jn5yvfH3UEaeKa/X0uVAjuD36VeAGbsFdx
	 RkmBxESlE/rBB1/pvR9Law68XFJgs/uyOB72nwv0+UD2ZGwPJycDRCZGzITImhN9xI
	 YACikZSadocP2TNb7h6lynGjTWWngb0dQbJLhMHHDdEvaxMKuwb8jyBhVvuHdFfPNp
	 /R3sVB2hLOeIw==
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50e40d1a6fbso707781e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 06:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167658; x=1703772458;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSFGFVOxlECeWrb1201TBHQMqNul2EH+RYRBpW3Owdk=;
        b=CmuWnyflDC0LrPnNbeggfyf+JokB/ZI3h2ug26vVneAAxcJk9m+d9rm2/mBpaxQ1/K
         sGaODyt4cKCVEWZXcqIchM/+vafGEYa4J0ndfODpf5i6kDj1IlCRAKiFcbKiS8OD8ydf
         Zy48ZbNsbQF62kJ2hluBMwDfGD5Sb/PSs/gztC7hlueu+ZxdsxEK4u4Wc9ehQXVQbjeU
         l7Esk40mz4hM/mKEC0pKsPh/3ed9r6GK2L2g7jS6ir4ytgRjZxvF1vu30m6UZAdUF8vV
         /+IaEirPstEifTHIFZQLvcKeZcd1Ku33KbKAM5ZJ74D+o10LKmK5yCn1ZHh/dRu2Vslq
         wqxg==
X-Gm-Message-State: AOJu0YxrNoLPBXMVeYr4XldCcH6AyRob9uYj6hCYC9DLe7tDLLDWpf/0
	dpBy/pkrlT3zmrcXhag/m70pU3FCwD3t6qZ/2MKMYqh1pXeqH/Y6p8MAIIhUFb5QMuc09f9t6TR
	jMb7NmwQ6d867ReJ7isXRn4Ix6U1Ks882MKl4uxoGCPFP6NNWCvumHzsAPmZZvg==
X-Received: by 2002:ac2:5617:0:b0:50e:29c1:f829 with SMTP id v23-20020ac25617000000b0050e29c1f829mr3635670lfd.74.1703167658226;
        Thu, 21 Dec 2023 06:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGplfpPbW0FT9ATmbiZqm1++et4V4L718raZzPodJBABIbwHrAdrNT6mNWONQxZ+jsDmjLpy/oSnYqjsp61ks4=
X-Received: by 2002:ac2:5617:0:b0:50e:29c1:f829 with SMTP id
 v23-20020ac25617000000b0050e29c1f829mr3635656lfd.74.1703167657892; Thu, 21
 Dec 2023 06:07:37 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Dec 2023 09:07:36 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
 <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
 <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com> <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com>
Mime-Version: 1.0
Date: Thu, 21 Dec 2023 09:07:36 -0500
Message-ID: <CAJM55Z8SwyNEqw4HWRd7G8Y9rdtOGtKy-KbzDorqohdK3nZg0A@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_060745_407304_09E96F8D 
X-CRM114-Status: GOOD (  20.64  )
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

TGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAxOjI44oCvUE0g
RW1pbCBSZW5uZXIgQmVydGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNv
bT4gd3JvdGU6Cj4gPiBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiBPbiBTYXQsIERlYyAxNiwg
MjAyMyBhdCAyOjU34oCvUE0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPiA+ID4gPGVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+ID4gPiArICAgICAg
ICAgIHRoZWFkLHN0cm9uZy1wdWxsLXVwOgo+ID4gPiA+ID4gPiArICAgICAgICAgICAgb25lT2Y6
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gdHlwZTogYm9vbGVhbgo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMgo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgIGVudW06IFsgMCwgMjEwMCBdCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIG9yIGRpc2FibGUgc3Ryb25n
IDIuMWtPaG0gcHVsbC11cC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBiaWFzLXB1bGwtdXAgY2FuIGFs
cmVhZHkgc3BlY2lmeSB0aGUgc3RyZW5ndGggaW4gT2htcy4KPiA+ID4gPgo+ID4gPiA+IFRoZSBz
dHJvbmcgcHVsbCB1cCBpcyBhIHNlcGFyYXRlIGJpdCB0aGF0IGNhbiBiZSBlbmFibGVkIGluZGVw
ZW5kZW50bHkgZnJvbSB0aGUKPiA+ID4gPiByZWd1bGFyIHB1bGwtdXAvZG93biwgc28gaW4gdGhl
b3J5IHlvdSBjb3VsZCBlbmFibGUgYm90aCB0aGUgcmVndWxhciBwdWxsLXVwCj4gPiA+ID4gYW5k
IHRoZSBzdHJvbmcgcHVsbC11cCBhdCB0aGUgc2FtZSB0aW1lLCBvciBldmVuIHRoZSByZWd1bGFy
IHBvbGwtZG93biBhbmQgdGhlCj4gPiA+ID4gc3Ryb25nIHB1bGwtdXAgd2hpY2ggaXMgcHJvYmFi
bHkgbm90IGFkdmlzZWQuCj4gPiA+Cj4gPiA+IGJpYXMtcHVsbC11cDsgPC0gSnVzdCByZWd1bGFy
IHB1bGxpbmcgdXAgdGhlIG9yZGluYXJ5Cj4gPiA+IGJpYXMtcHVsbC11cCA9IDwxMDA+OyA8LSBT
YW1lIHRoaW5nIGlmIHRoZSBvcmRpbmFyeSBpcyAxMDAgT2htIChmaWd1cmUgb3V0IHdoYXQKPiA+
ID4gICByZXNpc3RhbmNlIGl0IGFjdHVhbGx5IGlzLi4uLikKPiA+ID4gYmlhcy1wdWxsLXVwID0g
PDIxMDAwMDAwPjsgPC0gc3Ryb25nIHB1bGwgdXAKPiA+ID4gYmlhcy1wdWxsLXVwID0gPDIxMDAw
MTAwPjsgPC0gYm90aCBhdCB0aGUgc2FtZSB0aW1lCj4gPgo+ID4gSG1tLi4gdGhlIHR3byBwdWxs
LXVwcyBjb21iaW5lZCB3b3VsZCBiZSBhIHN0cm9uZ2VyIHB1bGwtdXAsIGVnLiBsb3dlcgo+ID4g
cmVzaXN0YW5jZSwgcmlnaHQ/IFNvIHlvdSdkIG5lZWQgdG8gY2FsY3VsYXRlIGl0IHVzaW5nCj4g
PiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9TZXJpZXNfYW5kX3BhcmFsbGVsX2NpcmN1
aXRzI1Jlc2lzdGFuY2VfdW5pdHNfMgo+Cj4gWWVhaCBoZWhlIGVsZW1lbnRhcnkgZWxlY3Ryb25p
Y3MgYmVhdHMgbWUsIG9mIGNvdXJzZSBpdCBpcyBpbiBwYXJhbGxlbC4KPgo+ID4gVGhlIHByb2Js
ZW0gaXMgdGhhdCB0aGUgZG9jdW1lbnRhdGlvbiBkb2Vzbid0IGFjdHVhbGx5IG1lbnRpb24gd2hh
dCB3aWxsIGhhcHBlbgo+ID4gaWYgeW91IGNvbWJpbmUgdGhlIHN0cm9uZyBwdWxsLXVwIHdpdGgg
dGhlIHJlZ3VsYXIgYmlhcy4KPgo+IFNvIHdoeSBldmVuIGFsbG93IGl0IHRoZW4/Cj4KPiBEbyB0
aGUgcGVvcGxlIGRlc2lnbmluZyBib2FyZHMgdXNpbmcgdGhpcyBoYXZlIGJldHRlciBkb2N1bWVu
dGF0aW9uIHRoYW4gd2hhdAo+IHlvdSBoYXZlPyBUaGVuIGVpdGhlciBnZXQgdGhhdCBkb2N1bWVu
dGF0aW9uIG9yIGp1c3QgZG9uJ3QgZ2l2ZSB0aGVtCj4gdG9vIG11Y2ggcm9wZS4KCldlIGNhbiBj
ZXJ0YWlubHkgcHJldmVudCBMaW51eCBmcm9tIGV2ZXIgY29tYmluaW5nIHRoZSBzdHJvbmcgcHVs
bC11cCB3aXRoIHRoZQpyZWd1bGFyIGJpYXMsIGJ1dCB0aGF0IGRvZXNuJ3QgbWVhbiB0aGF0IHRo
ZSB2ZW5kb3IgdS1ib290IGNhbid0IGZpbmQgYSB1c2UgZm9yCml0IGFuZCBtaWdodCBoYW5kIG92
ZXIgcGlucyBpbiBzdWNoIHN0YXRlcyBMaW51eCB0aGVuIHdvdWxkbid0IGtub3cgaG93IHRvCmhh
bmRsZS4KCklmIHlvdSB0aGluayBpdHMgYmV0dGVyIHdlIGNvdWxkIGp1c3QgcG9zdHBvbmUgdGhh
dCBwcm9ibGVtIHRvIHdoZW4vaWYgaXQgZXZlcgpoYXBwZW5zLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
