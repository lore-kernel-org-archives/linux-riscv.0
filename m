Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43518E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR1DMn+WtcfcWN2mnFVjyY8scRo5mhCtbmw4zmkAi6E=; b=ysI6ohNTc+KCUf
	vznVzurP59AkPbGAJ5pfaW/E4DyGxkS92l7XBil74fMxo3U4KkVpwtBVknmvwCAuSPruPex94UGM3
	jRTc2VEjenAYdLYLc6O4zKR1PRMwbp8lBVBGM7xbeSUWaQCmducTZNWMxRa9VTOXRnChKbplvaIP6
	lQqndmYVs2y3bjPdkhWRPsE89ULNk2OSLfre9EM81DfrqsAJyl6/wx8S86CCbFevyReDoWCDaZ9py
	WGe25wkxunUd/P6eGCyQfvUUbX3YrnFgovUTVjVBG8MHuhcfXtrrOYY/NPiIgDhCKk2SXfs9OO5bi
	/Z2UPU6kH4ta1uZFb56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7po-00000004J02-1mvR;
	Fri, 13 Dec 2024 15:44:08 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7pm-00000004Iz5-0oeP
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 15:44:07 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5401ab97206so1916397e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734104644; x=1734709444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=ORO1mgCe/AGB4DqVuqUPWQeB+Oo/E111CahmsxFdTCKYGQj2hQGPjVKBY1rFlMW92u
         SrbRFT3ZhAXdZCUnMiW4F+RyOhKR2ifVZlDx2ctLAw5lE6aEWUmDd73ccqK5fHkPY5Mu
         vV7hwloglj+V2LMD+schN3c5g2mcb84jxq3voYwucw5IYWUFrE0Yc7ifw/rB7p2nPTFN
         hi+DNIGuDrLlw2ym1/h/MemchbTXgtyBPnq4Hk3+BpAX5Hs8cUov7fCah9dP0r6fhTTi
         NZWOBm9JIIs348+xLvk1YqRUyjDAjg/jBAxV4gbhh/n+NtS2HfzWBOUmy6Dpmm1AnK7q
         Gj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104644; x=1734709444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=QL4UAkhRE4BfEP9YooCNprrploPHH2lI2OdPV/NUl6qXsiPch3W2RhJ2v9g4tat0C/
         UOR36UB/8/MSsYTaG9HHUf6Jl0RUyW/+eburmHECHF8nDEZjWlKh7VE5203+Q8iCD1Rm
         qEvKE1R02LNj6Ay+znhb4l33rSGkK08exW00YUXmMS0P1NZjUFiL/bgdAeommNwT8ssY
         YQBFvhW7Uj9Azw+ddd9YhHd+v3a8BGfcQUcHFmojRhBUOtJ3++JVwm7MYXY7e0h2nwOV
         b86NpEfq/16QJ6ez2lc6kcSxk6+sTvFjUp2rneBTMY1wxDp4djLTnUiGA0POPzWdQZpj
         WskQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCFH//GnIHpRZgXIUdVEbOr7tAmROFTu6EH+E2yQsXyiYV+zty1QudE7ApxqhTF4qHlp5XXNETZBaigg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr8GyIyYZ70SEekW6dEI24dR0pQQYMcgnaxquNRlDsZ25xMNcS
	mlZJTF+BFgi33xBNEW1X/ZpIzQ6HPiRaf6Uvtfdql3/vLbuAImjLpo9Wn1JrK/jYZspI9BALNI/
	jQiCmQpg8BYGeRJSqmMUX4FRUN9YnavefzTHmYw==
X-Gm-Gg: ASbGncsEj3EY9qzro+w25JsgvTNu7QJH3QJdipiL1KGQLhUNgVPtLkTbNack0OZzmMw
	9n38ml44WRWS2nJBcs9G+EXbOvZfCY+dsa4Xw2sw=
X-Google-Smtp-Source: AGHT+IFTUSDlblXeHlfVDe8niGAxTlpQ6jMgiT9dHwTwMbW1zIwAk0PUlMzR2hff1vm/DrjTiJgiQiYP2mI3M++ExsU=
X-Received: by 2002:a05:6512:39cc:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-54099b699d2mr968768e87.50.1734104644176; Fri, 13 Dec 2024
 07:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
 <87r06gq2di.ffs@tglx> <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
 <877c84ade6.ffs@tglx>
In-Reply-To: <877c84ade6.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 Dec 2024 21:13:52 +0530
Message-ID: <CAK9=C2Xyqk1WRHTXa_74s1uWuuMP5d=RBpnoSREvuF=C3OWW_A@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_074406_233434_D30F0C76 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMToyMeKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDEyIDIwMjQgYXQgMjI6MTEsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPj4gLS0tIGEva2VybmVsL2lycS9jaGlwLmMKPiA+PiArKysgYi9r
ZXJuZWwvaXJxL2NoaXAuYwo+ID4+IEBAIC00Nyw2ICs0NywxMyBAQCBpbnQgaXJxX3NldF9jaGlw
KHVuc2lnbmVkIGludCBpcnEsIGNvbnN0Cj4gPj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4+Cj4gPj4gICAgICAgICBkZXNjLT5pcnFfZGF0YS5jaGlwID0gKHN0cnVjdCBpcnFf
Y2hpcCAqKShjaGlwID86ICZub19pcnFfY2hpcCk7Cj4gPj4gKwo+ID4+ICsgICAgICAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfUEVORElOR19JUlFfQ0hJUEZMQUdTKSAmJiBjaGlwKSB7
Cj4gPj4gKyAgICAgICAgICAgICAgIGlmIChjaGlwLT5mbGFncyAmIElSUUNISVBfTU9WRV9ERUZF
UlJFRCkKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpcnFkX2NsZWFyKCZkZXNjLT5pcnFf
ZGF0YSwgSVJRRF9NT1ZFX1BDTlRYVCk7Cj4gPj4gKyAgICAgICAgICAgICAgIGVsc2UKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBpcnFkX3NldCgmZGVzYy0+aXJxX2RhdGEsIElSUURfTU9W
RV9QQ05UWFQpOwo+ID4+ICsgICAgICAgfQo+ID4KPiA+IFdlIG5lZWQgc2ltaWxhciBjaGFuZ2Vz
IGluIGlycV9kb21haW5fc2V0X2h3aXJxX2FuZF9jaGlwKCkKPiA+IGJlY2F1c2Ugd2UgdXNlIElS
UV9ET01BSU5fSElFUkFSQ0hZIGluIFJJU0MtVi4KPgo+IEdyciwgeW91IGFyZSByaWdodC4gTGV0
IG1lIGFkZCB0aGF0IHRvIHRoZSBiYXNlIHBhdGNoLgo+Cj4gPj4gICAgICAgICBpcnFfcHV0X2Rl
c2NfdW5sb2NrKGRlc2MsIGZsYWdzKTsKPiA+PiAgICAgICAgIC8qCj4gPj4gICAgICAgICAgKiBG
b3IgIUNPTkZJR19TUEFSU0VfSVJRIG1ha2UgdGhlIGlycSBzaG93IHVwIGluCj4gPj4gQEAgLTEx
MTQsMTYgKzExMjEsMjEgQEAgdm9pZCBpcnFfbW9kaWZ5X3N0YXR1cyh1bnNpZ25lZCBpbnQgaXJx
LAo+ID4+ICAgICAgICAgdHJpZ2dlciA9IGlycWRfZ2V0X3RyaWdnZXJfdHlwZSgmZGVzYy0+aXJx
X2RhdGEpOwo+ID4+Cj4gPj4gICAgICAgICBpcnFkX2NsZWFyKCZkZXNjLT5pcnFfZGF0YSwgSVJR
RF9OT19CQUxBTkNJTkcgfCBJUlFEX1BFUl9DUFUgfAo+ID4+IC0gICAgICAgICAgICAgICAgICBJ
UlFEX1RSSUdHRVJfTUFTSyB8IElSUURfTEVWRUwgfCBJUlFEX01PVkVfUENOVFhUKTsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgSVJRRF9UUklHR0VSX01BU0sgfCBJUlFEX0xFVkVMKTsKPiA+PiAg
ICAgICAgIGlmIChpcnFfc2V0dGluZ3NfaGFzX25vX2JhbGFuY2Vfc2V0KGRlc2MpKQo+ID4+ICAg
ICAgICAgICAgICAgICBpcnFkX3NldCgmZGVzYy0+aXJxX2RhdGEsIElSUURfTk9fQkFMQU5DSU5H
KTsKPiA+PiAgICAgICAgIGlmIChpcnFfc2V0dGluZ3NfaXNfcGVyX2NwdShkZXNjKSkKPiA+PiAg
ICAgICAgICAgICAgICAgaXJxZF9zZXQoJmRlc2MtPmlycV9kYXRhLCBJUlFEX1BFUl9DUFUpOwo+
ID4+IC0gICAgICAgaWYgKGlycV9zZXR0aW5nc19jYW5fbW92ZV9wY250eHQoZGVzYykpCj4gPj4g
LSAgICAgICAgICAgICAgIGlycWRfc2V0KCZkZXNjLT5pcnFfZGF0YSwgSVJRRF9NT1ZFX1BDTlRY
VCk7Cj4gPj4gICAgICAgICBpZiAoaXJxX3NldHRpbmdzX2lzX2xldmVsKGRlc2MpKQo+ID4+ICAg
ICAgICAgICAgICAgICBpcnFkX3NldCgmZGVzYy0+aXJxX2RhdGEsIElSUURfTEVWRUwpOwo+ID4+
Cj4gPj4gKyAgICAgICAvKiBLZWVwIHRoaXMgYXJvdW5kIHVudGlsIHg4NiBpcyBjb252ZXJ0ZWQg
b3ZlciAqLwo+ID4+ICsgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX1BFTkRJ
TkdfSVJRX0NISVBGTEFHUykpIHsKPiA+PiArICAgICAgICAgICAgICAgaXJxZF9jbGVhcigmZGVz
Yy0+aXJxX2RhdGEsIElSUURfTU9WRV9QQ05UWFQpOwo+ID4+ICsgICAgICAgICAgICAgICBpZiAo
aXJxX3NldHRpbmdzX2Nhbl9tb3ZlX3BjbnR4dChkZXNjKSkKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBpcnFkX3NldCgmZGVzYy0+aXJxX2RhdGEsIElSUURfTU9WRV9QQ05UWFQpOwo+ID4+
ICsgICAgICAgfQo+ID4+ICsKPiA+Cj4gPiBUaGVzZSBjaGFuZ2VzIGluIGlycV9tb2RpZnlfc3Rh
dHVzKCkgbmVlZCB0byBiZSBkcm9wcGVkIHRvIHN1cHBvcnQKPiA+IHRoZSBhYm92ZSBjaGFuZ2Vz
IGluIGlycV9kb21haW5fc2V0X2h3aXJxX2FuZF9jaGlwKCkuCj4KPiBXaHk/IFdpdGggQ09ORklH
X0dFTkVSSUNfUEVORElOR19JUlFfQ0hJUEZMQUdTIGVuYWJsZWQgdGhpcyBodW5rIGlzCj4gY29t
cGlsZWQgb3V0LiBTbyBub3RoaW5nIGlzIG1vZGlmeWluZyBQQ05UWFQgaGVyZS4gVGhhdCdzIHRo
ZSB3aG9sZQo+IHBvaW50Lgo+CgpVbmRlcnN0b29kLCBwbGVhc2UgaWdub3JlIG15IHByZXZpb3Vz
IGNvbW1lbnQuCgpJIHdhcyB1c2luZyBpcnFfc2V0X3N0YXR1c19mbGFncygpIGluIGlycV9kb21h
aW5fc2V0X2h3aXJxX2FuZF9jaGlwKCkKd2hpY2ggZGlkIG5vdCB3b3JrIGJlY2F1c2UgaXJxX21v
ZGlmeV9zdGF0dXMoKSBkaWQgbm90IG1vZGlmeSBQQ05UWFQuCgpSZWdhcmRzLApBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
