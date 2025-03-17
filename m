Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4558AC28B2F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 02:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dc+teJ70ZrlB4EI3rcn8aQWP4n6t9xtbVE8FUNh06Pw=; b=32YFFa32TpVbhV
	XuMQ5tNrSm6LczvL0EiPkm99CRll36MizzzSe9EhNoVB4mukvROZjWhEznE07jvDyk/cxlqXZw2tV
	yB8wxNEzQMvi4WxaxGsQYW2mHCCpVPh08mPnVdsBlUpq1xnl+PjuJZgeQ9nwbe5D6DDAaS8nMKoPE
	T5H+icfIpkPG/na03gIIxTGRfVfYQ+b8siTeuzEvLW0trO1PyYYWaN1ELCW2t4planZRdBICUIZX/
	MmmQGJrn2z+/JMeQgqeIfiXjkcWZu53wz36aJ/ospCI0Jug2ltAwf6Eir+065WOcLcsiR3aJGK8pM
	1qjje8cZh5EYJE9xfE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0L9-00000000xHV-29y1;
	Mon, 17 Mar 2025 02:36:31 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0L7-00000000xH3-1hy5
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 02:36:30 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ff0c9d1761so33770147b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 19:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742178988; x=1742783788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAieqnBLry50aVc92wHL94KklEr+s0AxPers8TB3S70=;
        b=BOhbGqcEdc3yYielUd0Ic/SqLIo5ZdfSZ0KFICEaUP6HtrsUTV/25rp9XmRaPyNlls
         mawUaJTpu2JLA5mfjhreY2D9cWDvCFywSMRKy/7WzwTlwak0sD08jBXfhqfwdOveHM6i
         wQ2jNMQhrwlBFR10IE0Wh9hGQPh/fdBtLmEzK35t80tTQb3MyMhQGSkcC2CWBitwZAQ/
         AkBe5UjMpIWbgaz5tWtMlNOGldOz0jRoDqK6I8iWE9dFohkjEE94nc8JXWaxRq7Adl4L
         99dd7Uoi+Zq+lFr0ItT8Mk7Yc4hFfxJVCAj2wczJ9rvjC2FAv/VDuSNGmUfcwuf6F1hV
         YaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742178988; x=1742783788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAieqnBLry50aVc92wHL94KklEr+s0AxPers8TB3S70=;
        b=T67lQq70nvJNcOkqnwyXrJwwZ1EzTFM8uP8ddL2UgROL5zq13ZDf+Dh+KDhjuiUy/c
         lVgkdxqwoiWyl4yS8UjdSdpDWXp3/6wbTHFmm9KC1abHPZ8O+Xefco+sqmFnIw9FJC9N
         XWDVWQItroq9YKjj/2CogxbTQMUxN26N2NCLE83Box5Tn+m34qtIz8Bo8Cf0fGA7LsLS
         mpv+DNRd5MPtqK3dS8iZ5HTLjK22iAKQChGfajuF1lFGuRCAJ6JBjcccefEqnADYon0S
         XLq2dWHEgksvOIHZCOkcjL6kMxxIfiiGE5JXiR+bZFwGT68CYzpBWd0YlSn7Pnkr2rxr
         80FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX158X7NuqkiOM8g21+t+jMDfI+G4+jeFEiwNRiwFot3n4oKcy/f83H36AFZJi6n4qz6xkxpAlUi/teVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUerq3kGVLLSCVRKdzsIELFe99FW0ud71yhyxKsMLZlFc4SYAf
	KxkS8PwOMJK1A5B2Dx9HiY8KjlEs4msix6Ul9PN+tTh1zMc5wLgivDC/RuErCWA0fC+LwdWd1JB
	L18avaDcHTi2cPAqykmZJrP6bXXCenh37FqFy1w==
X-Gm-Gg: ASbGnctkASgJLHInGAl89IB5jlqfoGjPSH5ElFzBcjlYFDQdFvUbxAAL1Sv/RqNLffC
	9JFdux+lNfQNRStfOoBTKqJ1Rto9F4l5fXmCDw7NkeXyuOYIR71PKQOweKwiNf16IVkpROotrJT
	J8leI+srQTkHpIxN2iWJ++U4dZrv5l
X-Google-Smtp-Source: AGHT+IGW3uDLXtocExH9Ui6jGjDWWOMIuY5YmS12I91XdJtgAAD4qEnqqakbaR8kQz5+u4xtC5NQ/6Jpth0ECfaHJ6o=
X-Received: by 2002:a05:690c:380e:b0:6fd:4670:80e0 with SMTP id
 00721157ae682-6ff46025b58mr146044977b3.36.1742178987743; Sun, 16 Mar 2025
 19:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250314081255.3718-1-nick.hu@sifive.com> <20250314232518.GA2513550-robh@kernel.org>
In-Reply-To: <20250314232518.GA2513550-robh@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 17 Mar 2025 10:36:16 +0800
X-Gm-Features: AQ5f1Jo9JyczHGQbgVa9wnBIi8jG5ccbXuDLUoEYQjCpRWIiVXWEgSUSfb62P4U
Message-ID: <CAKddAkCL1qKG7dRaVDAO0HCdsEiRR3NxOEka8aFONvkXnZ5j5A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: Add SiFive CLINT2
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_193629_457612_1E760C8B 
X-CRM114-Status: GOOD (  18.87  )
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

SGkgUm9iCgpTb3JyeSwgSSB0aG91Z2h0IEkgaGFkIHJlcGxpZWQgdG8gdGhlIG1haWxpbmcgbGlz
dCwgYnV0IGl0IGxvb2tzIGxpa2UKSSBvbmx5IHNlbnQgaXQgdG8gQ29ub3IuCgpUaGUgY29udHJv
bCBvZiBzaWZpdmUsY2xpbnQyIGRpZmZlcnMgZnJvbSB0aGF0IG9mIHNpZml2ZSxjbGludDAsCm1h
a2luZyB0aGVtIGluY29tcGF0aWJsZS4KCk9uIFNhdCwgTWFyIDE1LCAyMDI1IGF0IDc6MjXigK9B
TSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWFyIDE0
LCAyMDI1IGF0IDA0OjEyOjU0UE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiBBZGQgY29tcGF0
aWJsZSBzdHJpbmcgYW5kIHByb3BlcnR5IGZvciB0aGUgU2lGaXZlIENMSU5UIHYyLgo+Cj4gQ29u
b3IgYXNrZWQgYWJvdXQgYmVpbmcgYmFja3dhcmRzIGNvbXBhdGlibGUgd2l0aCB2MS4gUGxlYXNl
IHNheSB3aHkgaXQKPiBpc24ndCBoZXJlLgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljayBI
dSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAtIHYyIGNoYW5nZXM6Cj4gPiAg
IC0gRG9uJ3QgYWxsb3cgc2lmaXZlLGNsaW50MiBieSBpdHNlbGYuIEFkZCAnLXt9JyB0byB0aGUg
Zmlyc3QgZW50cnkKPiA+ICAgLSBNYXJrIHRoZSBzaWZpdmUsZmluZS1jdHItYml0cyBhcyB0aGUg
cmVxdWlyZWQgcHJvcGVydHkgd2hlbgo+ID4gICAgIHRoZSBjb21wYXRpYmxlIGluY2x1ZGVzIHRo
ZSBzaWZpdmUsY2xpbnQyCj4gPgo+ID4gIC4uLi9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQu
eWFtbCAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+IGluZGV4IDc2
ZDgzYWVhNGUyYi4uNGI5ZGFkMTFjMWU5IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+
IEBAIC0zNiw2ICszNiwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgLSBzdGFy
Zml2ZSxqaDcxMTAtY2xpbnQgICAjIFN0YXJGaXZlIEpINzExMAo+ID4gICAgICAgICAgICAgICAg
LSBzdGFyZml2ZSxqaDgxMDAtY2xpbnQgICAjIFN0YXJGaXZlIEpIODEwMAo+ID4gICAgICAgICAg
ICAtIGNvbnN0OiBzaWZpdmUsY2xpbnQwICAgICAgICAjIFNpRml2ZSBDTElOVCB2MCBJUCBibG9j
awo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0ge30KPiA+ICsgICAgICAgICAg
LSBjb25zdDogc2lmaXZlLGNsaW50MiAgICAgICAgIyBTaUZpdmUgQ0xJTlQgdjIgSVAgYmxvY2sK
PiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBTaUZpdmUgQ0xJTlQgdjIgaXMgdGhlIEhSVCB0aGF0
IHN1cHBvcnRzIHRoZSBaaWNudHIKPiA+ICAgICAgICAtIGl0ZW1zOgo+ID4gICAgICAgICAgICAt
IGVudW06Cj4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQKPiA+
IEBAIC02Miw2ICs2NiwyMiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICBtaW5JdGVtczogMQo+ID4g
ICAgICBtYXhJdGVtczogNDA5NQo+ID4KPiA+ICsgIHNpZml2ZSxmaW5lLWN0ci1iaXRzOgo+ID4g
KyAgICBtYXhpbXVtOiAxNQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIHdpZHRoIGluIGJpdHMg
b2YgdGhlIGZpbmUgY291bnRlci4KPiA+ICsKPiA+ICtpZjoKPiA+ICsgIHByb3BlcnRpZXM6Cj4g
PiArICAgIGNvbXBhdGlibGU6Cj4gPiArICAgICAgY29udGFpbnM6Cj4gPiArICAgICAgICBjb25z
dDogc2lmaXZlLGNsaW50Mgo+ID4gK3RoZW46Cj4gPiArICByZXF1aXJlZDoKPiA+ICsgICAgLSBz
aWZpdmUsZmluZS1jdHItYml0cwo+ID4gK2Vsc2U6Cj4gPiArICBwcm9wZXJ0aWVzOgo+ID4gKyAg
ICBzaWZpdmUsZmluZS1jdHItYml0czogZmFsc2UKPiA+ICsKPiA+ICBhZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKPiA+Cj4gPiAgcmVxdWlyZWQ6Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKQmVz
dCBSZWdhcmRzLApOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
