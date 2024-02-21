Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B5DC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeViMDrloLwNwNfsaE2+JKuK6Q+A5teP7WsO6+GtX7Q=; b=BBqSHJ0mK1t2o9
	ugUm9xl68BAihtiGBmRq4+59LyJKLlXd4hInQy0wIVj4guvpAtaHXXddnpIezWvhoKVFZf4QknJV2
	hDh5+KW1b6Ukkjtfz/34tCdmsLXwPj+3Ve+N3bmos7TXENWFDgOtdt1hF7rMdEenJ0j0AtecE2f0C
	frTY5CSoREKZda1S6sr0EMrAbuSsR5g1ueTD/f/HLARnZJTjjbn4pu9nTsngOKrbO1dutgUv7ITX9
	/tnae4PI8QNtgY3unSUYDUrI6Up100MyK8bROSk6ufGkTWAGAKeSjrqEZDlYfD/MD2+sSgJqWheEz
	EISmX9SelhUeutyKs5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmiU-000000014xq-2U4a;
	Wed, 21 Feb 2024 13:32:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmiQ-000000014wJ-2iNj
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 13:32:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-512b3b04995so700550e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708522368; x=1709127168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfWb8XMWz9JE2jfcdSXO3QFdpoEmfn/qndzXSrmaboY=;
        b=DNf+ap3EA01gwDWFaWd/B7HCKrY6qaVrxv88xwfSXSdndH9Pg/xnyZIDG/gW8SdyPi
         LVePzlxF2aWYqe8uMANfby1z6/1dkxoPKUBOedKN4F0J3bP4FrPfvYh2S1JlMBtVYqcH
         qGzDBUn+jqAsCHnWrdmTNnsx5XursKoPf/4GXzVB+JQlnG2DSoFSDKwoaHldSf6jzlyb
         hywehTCkT9tPBcLgdZZ0jzowhNnLsl6R+UMXkIFTky093wB2bV0iJ1iAEou3ywq1MLYf
         HmzX6oQWpa4rQFSdgN1SA/xmLEohhKDyrAt5Iz/hO8RVVRxr7KXpx9srZ2u52CCHKicF
         kW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522368; x=1709127168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfWb8XMWz9JE2jfcdSXO3QFdpoEmfn/qndzXSrmaboY=;
        b=ecAzb4+v7s7nyYvzPUp8w4UcQ/dyQyhy9fmYB0E+F67RMD/ITS+dCT9kx1tu1AisaU
         Q8XvdjOdFyzxOsFZO3HIX6N75u7yFs/Fyff8i8nIxbxKtnomg87ULMN6wbTKEu2Amlz8
         3PDkTgt9JLOZORo+n4Qv5oTWcgdadmRsRKg9295ug/LIjcBS/2fMVpbyu6sxxHOYGLfo
         6EJRyowUbrxR0wTBCLDLaHCsnoQxbF0+Tifa1F+KAvaY0QSQm1h3tYjkMoYS6R5gEeF6
         EvvVmaTJmlNG81+nWR9oXcGFj4qadlIKIFEff1HmbfTaeFtGAPrX3yY+YxwxuJc07Blf
         zHDA==
X-Forwarded-Encrypted: i=1; AJvYcCXWAerF7ffbZU8TFmF12LsT4xXS35G/d1JzJzrAo11eSTyY61KTKciAnkLc4yP3xF2qXTSxJCayFxxErXmG4pdDVu9epwjnO+0hdTU8Aaug
X-Gm-Message-State: AOJu0YzLyJhRbf+DQ7c/w1f/PxqVt1mup8wMEo6Mvk04MPzdnXzvSZ7A
	yz9HuDIKsPm9nmAOzeDfZ4aTKZ9BFWnSu7EV1M24wcaryjhObAs21wKEmK/ak565KSc562STSxT
	CIVZuQzhz1V+H4rMtjhL45B+LxFRrm4XB0VSdBA==
X-Google-Smtp-Source: AGHT+IGrWHp9dA4CgYAReiZvpVC3h4faMXExc5Y/Zw6gft716uhzwJCrU7dCwfSI/yjSEz/SSOSoFux6n+RH0LjfsSw=
X-Received: by 2002:a05:6512:3089:b0:512:ada6:f218 with SMTP id
 z9-20020a056512308900b00512ada6f218mr8741526lfd.59.1708522368449; Wed, 21 Feb
 2024 05:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-4-apatel@ventanamicro.com> <87cysrigud.ffs@tglx>
In-Reply-To: <87cysrigud.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Feb 2024 19:02:37 +0530
Message-ID: <CAK9=C2VwFJG0XDkDt5zrUT-xYatZ7V7vRwvV=bhLx0P73RzzAw@mail.gmail.com>
Subject: Re: [PATCH v13 03/13] irqchip/riscv-intc: Add support for RISC-V AIA
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_053250_698005_17393771 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMzo0M+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4KPiA+IFRoZSBSSVNDLVYgYWR2YW5jZWQgaW50ZXJydXB0IGFyY2hp
dGVjdHVyZSAoQUlBKSBleHRlbmRzIHRoZSBwZXItSEFSVAo+ID4gbG9jYWwgaW50ZXJydXB0cyBp
biBmb2xsb3dpbmcgd2F5czoKPiA+IDEuIE1pbmltdW0gNjQgbG9jYWwgaW50ZXJydXB0cyBmb3Ig
Ym90aCBSVjMyIGFuZCBSVjY0Cj4gPiAyLiBBYmlsaXR5IHRvIHByb2Nlc3MgbXVsdGlwbGUgcGVu
ZGluZyBsb2NhbCBpbnRlcnJ1cHRzIGluIHNhbWUKPiA+ICAgIGludGVycnVwdCBoYW5kbGVyCj4g
PiAzLiBQcmlvcml0eSBjb25maWd1cmF0aW9uIGZvciBlYWNoIGxvY2FsIGludGVycnVwdHMKPiA+
IDQuIFNwZWNpYWwgQ1NScyB0byBjb25maWd1cmUvYWNjZXNzIHRoZSBwZXItSEFSVCBNU0kgY29u
dHJvbGxlcgo+ID4KPiA+IFdlIGFkZCBzdXBwb3J0IGZvciAjMSBhbmQgIzIgZGVzY3JpYmVkIGFi
b3ZlIGluIHRoZSBSSVNDLVYgaW50Ywo+ID4gZHJpdmVyLgo+Cj4gUy9XZSBhZGQvQWRkLwoKT2th
eSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICtzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2lu
dGNfYWlhX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICB1bnNpZ25l
ZCBsb25nIHRvcGk7Cj4gPiArCj4gPiArICAgICB3aGlsZSAoKHRvcGkgPSBjc3JfcmVhZChDU1Jf
VE9QSSkpKQo+ID4gKyAgICAgICAgICAgICBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNf
ZG9tYWluLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvcGkg
Pj4gVE9QSV9JSURfU0hJRlQpOwo+Cj4gUGxlYXNlIGxldCBpdCBzdGljayBvdXQuIFlvdSBnb3Qg
MTAwIGNoYXJhY3RlcnMuIEFsbCBvdmVyIHRoZSBwbGFjZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUu
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
