Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEC0C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIO0PU5MeRi3+KY2jJDch0Fx/rCF0wHPhSow49kay+A=; b=n3HuUe+y8V0k/u
	NXHDObrsAUwJ3amp1xbZWbAdFRJ+MqIo9g2hWyuUMSc1fGSTp1ZaTHYrdj6oslqrLIPauJ+vUN3Tg
	/PQgYysqO8y5PjBNUf6PUzAT3YGHyHf2t4DflZpgOspPhgsw17kFPta3iQyaa1oBg2I/xzlM4Jeiq
	Dsm2QO4IyEEXA3NKrgSJJfIWyyjJX2v7WpDuLhZqEoyPYa0XfzZqBQqbs9Ra9RneVm7svP+iS0n48
	lH1JJUtlfAzBYjluU6qFbvN+ik83ebk3oOS04F1mxbtESTvc/nDnW2zaZgfe0rtOWhDlv5DbUjf+z
	16BD9ktVEfKIx7bNmtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz1s-00000002aLO-0Lhj;
	Fri, 16 Feb 2024 14:17:28 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz1p-00000002aJQ-0Aq6
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:17:26 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6002317a427so18386977b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708093041; x=1708697841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKVA6eT9vMZObsICtCU8wuFH8FzY1FdTCqpK118q1IE=;
        b=eYSJYXzet/xqkf5ZE6yplBIIGZ9lE2Wl0UxpyzScRdOXlmLiS9dlAFX7RGRXRuCSXy
         zDbAS1lfrj/r/SVmUk3FrJS6qiAXJYKLUvZIG3GkCFJ8vUaWgae7uOf2OLFtr7LHKG+g
         tqTmUX1i2h2+RKo++4VwUe0c8TkpIWJcoctg3Q6S2qL0f72GM8W3fm5zhoDkbhMpwbuQ
         RD0I+wMji1Q6YUfYWpzrZcK3BvbQmAcATtoeGuKDDj+pqVtFUNWWs0n6PkthnxP21859
         yMnbAdzpEcrgVt5p+SgyDk+18TCyF1EvYz5yl9PzHBgNQYX7ADxo6BP4ylZbYD5eU+3w
         sYRA==
X-Forwarded-Encrypted: i=1; AJvYcCVEvIWJHw2oupcwvt5K+Hdag9k7G1R+6FeJlYRqZUGQvHDxQS3LCorkWs//r0RIVRr97MGJvAXpsLpyiZO/nk5ivf+GK/qNN/qq2wzECB1p
X-Gm-Message-State: AOJu0YzNUyQWGHYEtiLCoMzfv/0tq0Z9JM+f5XE2l4EvuHyqdMatSuPp
	TbUToGVGsOYz8bHyi4LwvfBADKUn2neaLwsQ+3XDk0zYVxrcWOjzZbuHld1eSzA=
X-Google-Smtp-Source: AGHT+IFHdH76+Ki9PIXgkd7NMYtgaK8AD2OBe+UXWF019F/UdDbif8E9Ua619+1Gr6Y2zGPUGlXzXw==
X-Received: by 2002:a81:5201:0:b0:604:9262:4a4c with SMTP id g1-20020a815201000000b0060492624a4cmr4622025ywb.28.1708093041317;
        Fri, 16 Feb 2024 06:17:21 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id t17-20020a81c251000000b006049de6fa26sm347411ywg.57.2024.02.16.06.17.20
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:17:20 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso2208294276.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcQQZjR2vO5zJG1Do9fLs7eqofdTS7b90HzuMnTNHkmeIulzYvJPiTbRHMkqz9zrUFvlBUPBVDy65UpghnFJcuki/wRTChtuBYZhuMnLB3
X-Received: by 2002:a25:b904:0:b0:dc7:8c3a:4e42 with SMTP id
 x4-20020a25b904000000b00dc78c3a4e42mr4580893ybj.30.1708093039976; Fri, 16 Feb
 2024 06:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:17:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
Message-ID: <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
Subject: Re: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the
 ethernet IRQ GPIOs with proper flags
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061725_217516_1E7B7C72 
X-CRM114-Status: GOOD (  16.83  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gRXRoZXJuZXQgSVJRIEdQSU9zIGFy
ZSBtYXJrZWQgYXMgZ3Bpby1ob2cuIFRodXMsIHRoZXNlIEdQSU9zIGFyZSByZXF1ZXN0ZWQKPiBh
dCBwcm9iZSB3L28gY29uc2lkZXJpbmcgaWYgdGhlcmUgYXJlIG90aGVyIHBlcmlwaGVyYWxzIHRo
YXQgbmVlZHMgdGhlbS4KPiBUaGUgRXRoZXJuZXQgSVJRIEdQSU9zIGFyZSBzaGFyZWQgdy8gU0RI
STIuIFNlbGVjdGlvbiBiL3cgRXRoZXJuZXQgYW5kCj4gU0RISTIgaXMgZG9uZSB0aHJvdWdoIGEg
aGFyZHdhcmUgc3dpdGNoLiBUbyBhdm9pZCBzY2VuYXJpb3Mgd2hlcmUgb25lIHdhbnRzCj4gdG8g
Ym9vdCB3aXRoIFNESEkyIHN1cHBvcnQgYW5kIHNvbWUgU0RISSBwaW5zIGFyZSBub3QgcHJvcGVy
dGx5IGNvbmZpZ3VyZWQKPiBiZWNhdXNlIG9mIGdwaW8taG9nIGd1YXJkIEV0aGVybmV0IElSUSBH
UElPIHdpdGggcHJvcGVyIGJ1aWxkIGZsYWcuCj4KPiBGaXhlczogOTMyZmYwYzgwMmM2ICgiYXJt
NjQ6IGR0czogcmVuZXNhczogcnpnM3Mtc21hcmMtc29tOiBFbmFibGUgdGhlIEV0aGVybmV0IGlu
dGVyZmFjZXMiKQo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YS51akBicC5yZW5lc2FzLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEgKHdoaWNoIHdhcyB3
ZWxsLWhpZGRlbiBiZXR3ZWVuIG5vbi1maXhlcyA7LSkKClJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwgcXVldWUgaW4gcmVu
ZXNhcy1kZXZlbCBmb3IgdjYuOS4KCkFzIEV0aGVybmV0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdCwg
SSB0aGluayB0aGVyZSBpcyBubyBuZWVkIHRvIGZhc3QtdHJhY2sKdGhpcyBmb3IgdjYuOC4KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
