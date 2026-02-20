Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C0C5AD58
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXZuu6Tcwj7TB1cMIe9MPZb0F99e0NHGP9gJ9mpDTxw=; b=uoCcg3vPZ2vOCU
	EvO4jBBJM7KtX4OeaezYh8xrEgqxTTxTzbYWV1rwd4xUheOU2lo6JTn48kBXgXd3cyt6xBjNPwx7+
	tCnQWmwekofHLioOQF494txAr9WO4YVuwXM9ilS8NvX+pv0doN1Zm5dwzmp9gvN7CGhc7tl7MqnN2
	vU5+f2JuKHYNgerWp3rKb7Tl5Q2JSUr8onq+jbJqvkkM6kcSN5c/bFOS0JOwH9XRVaoNzxyIwGaCl
	spOBezF++Cq3w1cT3na3aYtjsFLVNGMYPwzhusB7eL0Z4HBwFmidUpNwmnTBhhcHspXYhwRnUAung
	ArdIIhOP9vaw8svnaa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVLU-0000000FSKi-0wf6;
	Fri, 20 Feb 2026 18:35:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVLR-0000000FSKN-1gJ9
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 18:35:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b8f8d80faebso475331866b.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 10:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771612515; cv=none;
        d=google.com; s=arc-20240605;
        b=fXkvrcy/XPuBSr5AFnVtkoiB9OeUaFBzi7SrqKWRcZ5Sr3oemGU9zOPx5FetAcEi6r
         u1xuwv+4D3ZB+ooNpjS4EfZhFoE1cV5zXDwnuw+AQhVnnTWCKmF8ez6AEYVHtVJWu8g5
         Egbh3z5KgL3XV0mxDLLILDLkJNh7nJpIEM8JHdTp/PTUc43XR7NJQUqiElLzsi3SY0A/
         MzBiNScRNEU3SKp9LO9hYbRmkvcG9k3fDhqOMi1ssIXP3kgB09qFmxKghX3jhI/n5u4H
         QCrklQRyF5cOD7XQM5EsTNOZbCFB1ihiPCsxtgVxYETNOtnB/uEsBmHeRh17NKDKIhoa
         hkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Xu9HuQBL5cHkzfmroWqrxWWuNKUX0XVOJbElhWvSbc=;
        fh=uUsOLv3vLRW9c6m9TjjgG4ogVQ4sRL6ZKzQCTkelDkg=;
        b=Gk0SW2FSYI/IwHU2VKv8/YBAsVVA3k3baazGDE3TAQNPVfXqsgyi2nphj8wGnDiOOW
         ud7vChNP5XVJkBXRx4zINyCxfS3WhDz8M+bK7W/QlhjHB7Zh4VFvLMtfAQSodGIG9oXo
         rPC4DeCcXJ9TnTFOohj6X5izxdh72Cdd/8UnZtjMRdUg2hSL2mC7FtuPMPI0zaljVJwa
         10v6CVYFBN/ucWmAuVbeJlxpcJ9I13GPDUbjMN7QTzNZX/WnGycUr5zYJZSaQCSTbFha
         Nir8jGhpP/VUKQEacfMpE2D3d82i7YRMx+wb48V3lBPVlca2EzoxmMb3B916w2KZHABW
         UVpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771612515; x=1772217315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xu9HuQBL5cHkzfmroWqrxWWuNKUX0XVOJbElhWvSbc=;
        b=b7JnSOgRio6xkQoL2YJvMrw3oJR8TS3pd2hlEORJfqU2RblY45ZSvHSas2HzhXN+CF
         ddD4vvmj3UPkwEF8qKqnXu2+QkFO6/yYQVYv/DQW/XTy5sE0AlK/TsBQeXEUOkW84QrD
         EntrF2/hGOgQsIRu9GWOFMr6QXOuc23kEeMW99cvhyTj7bakddMB1+DT0KJ8FoHDCkkz
         dHvDBk4VrRqZfHF8oqjBWbp3ti3QPqAYAQT6fd2YKTyptpwgiXQC/IY7eghDmAZzU/NH
         RSAWaLOwDp2aDMMMnLaUXVQz7IZUY+hQiM0grNi6oQSQq/qpjcpYOW2Wr5Guv15b+KxF
         2J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612515; x=1772217315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Xu9HuQBL5cHkzfmroWqrxWWuNKUX0XVOJbElhWvSbc=;
        b=TmMiE77DB6OiEkaahBLMabFCFHYg4haGrXmzuzgtP8uw9+QY/0080DYVgH6IGTfXpj
         3vfL1MkfnDtfsvqlBxljBESDEJ6s5gjMHRXoMV+2Nxd4tEgC+vTVQu3YJ/+EvHIvGjU6
         uVNPFvtJv2vPbbZv9f1+46Z1QzyJdehsFBAbGktSgQMDCbXdrdCzacTFEK2CtLFDrGv6
         ZxWYwYkpridN3y6yQ9gBKkmk6hKfRuKyk8FpFCWuoIru6rO132DW4frO/Q/N2Oi1D5ya
         Wm2iF3kVZqfj0mjJ1NRbjNokY1AYiN2BTvpe2EyMJb3+uolqFMjDrhgow+tgU7oIJQ16
         /tcw==
X-Forwarded-Encrypted: i=1; AJvYcCVhOHR9reM8FlZ5FtYOjv/lhYTss9M6MXdcnKF6gfkcwFTbg3hjHT6XpIaJxxixZTz+S/B3JPFyUw7rgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmiIFAo2yM1dzIZg2R8O1/BzMLxR4JvvhSLaCborGvdJ3dB8w
	DMzcgsiVZKl77tLasUYkj6IpIlP4Gopvf6aVvtiPOPVN/aeVXwJWql6KigGbksD/KZq7u1f1115
	6ooIr4chRN1cRb71rlEocZzSfswvjNs0NNcXPaOQu6g==
X-Gm-Gg: AZuq6aLZl5/HTNU8Yfz3jECUo5Nw09mFMJxju+eE5V8YQoTjBTNm9MQiX7yMBrQMYfa
	3eteTaKWDKw8AagRjFJ6rx3zgy2OTJtoG/8RgoF8HnvxCeMYzDPIyVGoc5sV/thrvjasZWLvCt6
	gzE8O/4yVi8obmixRKgQSc5fLUyLNnKdTQDKpKKs0ZTAjNJ2/a+Op+bkZPneHd2S3F+vegXIAGe
	cp1YkYwvn3LP0ZeEObWg/n/w37adrXBbmFaB6uZV8OKO3NafHKYOG6fD9fy4K2LSWk61ai5aDx7
	Db5UutNqUA==
X-Received: by 2002:a17:907:3ea7:b0:b90:77bb:5aa3 with SMTP id
 a640c23a62f3a-b90810895b3mr33703266b.16.1771612515417; Fri, 20 Feb 2026
 10:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com> <20260220-fu740-v1-3-c8af54130c58@sifive.com>
 <45821cd4-214c-43c0-ab2d-bbf34d9ec911@lunn.ch>
In-Reply-To: <45821cd4-214c-43c0-ab2d-bbf34d9ec911@lunn.ch>
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 02:35:03 +0800
X-Gm-Features: AaiRm52zdgGy_ZwaGZNcNjw3wNbwheS9Jou-9dGIz_POzEmmVoyRUwnv2BD7-yg
Message-ID: <CAHibDyzQAWgGP9sktLtnpND-Qr6FRrTA=HEiweyDD6rWm=8=5g@mail.gmail.com>
Subject: Re: [PATCH 3/5] net: macb: Add support for SiFive FU740-C000
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_103517_474613_CA79834C 
X-CRM114-Status: GOOD (  16.07  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LCBBbmRyZXchCgpCYXNlZCBvbiBDb25vcidzIGZlZWRiYWNr
IG9uIHBhdGNoIDEsIEknbGwgYmUgZHJvcHBpbmcgdGhpcyBwYXRjaCBlbnRpcmVseQppbiB2Mi4g
SW5zdGVhZCwgSSdsbCB1c2UgYSBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZyBwYXR0ZXJuCigi
c2lmaXZlLGZ1NzQwLWMwMDAtZ2VtIiwgInNpZml2ZSxmdTU0MC1jMDAwLWdlbSIpIGluIHRoZSBk
ZXZpY2UgdHJlZSwKd2hpY2ggbWFrZXMgdGhpcyBkcml2ZXIgY2hhbmdlIHJlZHVuZGFudC4KClNp
bmNlIHRoZXJlIHdpbGwgYmUgbm8gbmV0IHN1YnN5c3RlbSBjaGFuZ2VzIGluIHYyLCB0aGUgc2Vy
aWVzIHdpbGwgZ28KdGhyb3VnaCB0aGUgZGV2aWNldHJlZSBhbmQgUklTQy1WIHRyZWVzIGluc3Rl
YWQuCgpUaGFua3MsCk1heAoKCk9uIEZyaSwgRmViIDIwLCAyMDI2IGF0IDk6MTXigK9QTSBBbmRy
ZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYg
YXQgMDQ6Mjc6MDdQTSArMDgwMCwgTWF4IEhzdSB3cm90ZToKPiA+IEFkZCBhIGRpc3RpbmN0IGNv
bmZpZ3VyYXRpb24gZm9yIHRoZSBTaUZpdmUgRlU3NDAtQzAwMCBldGhlcm5ldAo+ID4gY29udHJv
bGxlciB0byBjb21wbHkgd2l0aCB0aGUgU2lGaXZlIElQIHZlcnNpb25pbmcgZ3VpZGVsaW5lcy4K
Pgo+IFdlIGFyZSBpbiB0aGUgbWVyZ2Ugd2luZG93IGF0IHRoZSBtb21lbnQsIHNvIG5ldC1uZXh0
IGlzIGNsb3NlZC4KPgo+IEFzIHJlcXVlc3RlZCwgcGxlYXNlIHJld29yZCB0aGUgY29tbWl0IG1l
c3NhZ2VzIHRvIHJlcGxhY2UgdGhlIFNpRml2ZQo+IGd1aWRlbGluZXMgd2l0aCB0aGUgZ2VuZXJp
YyBEVCBndWlkZWxpbmVzLiBBbmQgcmVwb3N0IHdoZW4gbmV0LW5leHQKPiByZW9wZW5zLgo+Cj4g
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9tYWludGFpbmVy
LW5ldGRldi5odG1sCj4KPiBUaGUgU3ViamVjdCBsaW5lIGFsc28gbmVlZHMgdG8gaW5kaWNhdGUg
d2hpY2ggdHJlZSB0aGlzIGlzIGZvci4KPgo+ICAgICBBbmRyZXcKPgo+IC0tLQo+IHB3LWJvdDog
Y3IKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
