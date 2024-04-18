Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D7C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZWGfJg9HsLHZcTsyJ+fvYWR0V6RPtmjZA6myvUjCF8=; b=1CTciaojuOeWTO
	iBa0tQrv0MzLuocEVgeFyKPnf9QDZMiEARhudJ04k2jfn8vgohbYmQXT3M0tkmGSG3S++IhnaZ9dD
	j3oBjgiIlNjo64Mddr7/XbJu4QJ26yf/VJT5UvN8cY40Y0W50Nn0YeorLf497i6xuN2W4YEbHW3dO
	R3rge/WTUENXCwX9871pdNt6JnwuVWCB2AVIkfv9biqmkSHtnBvQuWcDGJMhVBHx1i9ZivNivFkSD
	nC5kUgDsC/p2LBO61GzzofQCA5xfx55UJRUwjBiLMOssm2adlVG8Lhvicpc7nruAxVP8jbmiPbWyz
	MO4tcmxhYkZN3wpPYPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQqT-000000029UQ-48r2;
	Thu, 18 Apr 2024 12:26:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQqP-000000029S1-3qBU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:26:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2abf9305afcso261973a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1713443184; x=1714047984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/UmS13xtcMZDnEIpdmRzkPPXx3eO/KfzcsngCuc2tk=;
        b=THsg2lz1phTfCW1awvmowsQsrKTbo/H7kShH2MVZlN8ZURt+g52/FORejzgVtMTGJS
         4NLqNK4WoRwZUPlUiU+j1WjYdM6exfkl2ZMQsV92RGpPfZMs1kvilszCzEvrl8yD217n
         g8Ln49FpkwjFEB8cJyhPBjNUWHT780n2HLPjyZjXNqVJPbiDnAO/hKuUlN0NBfM4KKB8
         PVHRf3OyAau2PB546ypGwX9xjcPbvH5JY/a+t1F3oE4NSA2hZTYvHI28QO3Kvitn/RC8
         RZT6dLw9XeOfqVmSjYv8/aZILYMUL6lpQVHNbZitdx7Hq2UKxOU47fmX1HT7ilJaFTlM
         uT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713443184; x=1714047984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/UmS13xtcMZDnEIpdmRzkPPXx3eO/KfzcsngCuc2tk=;
        b=lDSeGmigG9eFZdltDGlDEdRygdS7qPyDlO4j6WV8lUIZTZzlX7c9JZw54ALPsG+AtM
         Tp5ds48lS+81sx1d1wzrMtDTzakWjWXaWN4UZuojFtaZvpwJLbLBI7IZEthEvD8m7A+L
         8BAeIKaAg3Id/j/v0AaXSUI6fVHLPAoUmRg+mg0o+Sq7bSTQt2of7GLl/Q8qrqrq7fmC
         pvxmad4HXMd92wSYnPCEwtS/B0iWjmYWFv9ixqtMpeGwdKSipVLnOdg80oJVDimg3/xV
         BDKNy7Vc2jyM3v8776rqt9YFsd47NIcSOBWniidpH/FQjkvl49ZlkNWCv9YKQHNG5vOW
         BTPg==
X-Forwarded-Encrypted: i=1; AJvYcCVq2DWbTKgBatSbSVWO1kX2Td4nEdSmZQAe/DEsYL3BZM2eHESl/mV9AhbGn3my6W3DpOjeCIpUEmMYAE81Zie3QDu8XffnIas2cihcFGG2
X-Gm-Message-State: AOJu0YxgjL53/Mqbn7og/bREun+/mInYXkFKIQp43FNhwLpLv76V3iQT
	1as0BzWbjg/c0wfnXA708f7MLL5MXv1mLqQF6ahcywuBoH7QXHyETThZIlnKbYkI45BGYuOUMaE
	5/5m2Gw7tPi4ig870vRFPlnvYWaR0XWGMblNRsA==
X-Google-Smtp-Source: AGHT+IFDobrs6jP7bQ06gkwfNDSAO5xZlBX+SZvdes90CxOyBYYPmWfXh2FZ/zWFafvNqrUkV1L5UE+4JWMG++qVWl8=
X-Received: by 2002:a17:90a:a106:b0:2a5:2be6:3ff5 with SMTP id
 s6-20020a17090aa10600b002a52be63ff5mr2495695pjp.21.1713443183703; Thu, 18 Apr
 2024 05:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
In-Reply-To: <20240418114942.52770-1-luxu.kernel@bytedance.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 18 Apr 2024 14:26:12 +0200
Message-ID: <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
Subject: Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_052626_014882_0617CF31 
X-CRM114-Status: GOOD (  15.34  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTo1MOKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgYSBuZXcg
aW1wbGVtZW50YXRpb24gb2YgaWRsZSB0aHJlYWQgdXNpbmcKPiBaYXdycyBleHRlbnNpb24uCgpU
aGlzIG92ZXJsYXBzIHdpdGggdGhlIGZvbGxvd2luZyBzZXJpZXM6CiAgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwMzE1MTM0MDA5LjU4MDE2Ny03LWFqb25lc0B2ZW50YW5hbWljcm8u
Y29tLwoKQlIKQ2hyaXN0b3BoCgo+Cj4gVGhlIFphd3JzWzBdIGV4dGVuc2lvbiBpbnRyb2R1Y2Vz
IHR3byBuZXcgaW5zdHJ1Y3Rpb25zIG5hbWVkIFdSUy5TVE8gYW5kCj4gV1JTLk5UTyBpbiBSSVND
LVYuIFdoZW4gc29mdHdhcmUgcmVnaXN0ZXJzIGEgcmVzZXJ2YXRpb24gc2V0IHVzaW5nIExSCj4g
aW5zdHJ1Y3Rpb24sIGEgc3Vic2VxdWVudCBXUlMuU1RPIG9yIFdSUy5OVE8gaW5zdHJ1Y3Rpb24g
d2lsbCBjYXVzZSB0aGUKPiBoYXJ0IHRvIHN0YWxsIGluIGEgbG93LXBvd2VyIHN0YXRlIHVudGls
IGEgc3RvcmUgaGFwcGVucyB0byB0aGUKPiByZXNlcnZhdGlvbiBzZXQgb3IgYW4gaW50ZXJydXB0
IGJlY29tZXMgcGVuZGluZy4gVGhlIGRpZmZlcmVuY2UgYmV0d2Vlbgo+IHRoZXNlIHR3byBpbnN0
cnVjdGlvbnMgaXMgdGhhdCBXUlMuU1RPIHdpbGwgdGVybWluYXRlIHN0YWxsIGFmdGVyIGFuCj4g
aW1wbGVtZW50YXRpb24tZGVmaW5lZCB0aW1lb3V0IHdoaWxlIFdSUy5OVE8gd29uJ3QuCj4KPiBU
aGlzIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIGlkbGUgdGhyZWFkIHVzaW5nIFdSUy5OVE8gaW5z
dHJ1Y3Rpb24uCj4gQmVzaWRlcywgd2UgZm91bmQgdGhlcmUgaXMgbm8gbmVlZCB0byBzZW5kIGEg
cmVhbCBJUEkgdG8gd2FrZSB1cCBhbiBpZGxlCj4gQ1BVLiBJbnN0ZWFkLCB3ZSB3cml0ZSBJUEkg
aW5mb3JtYXRpb24gdG8gdGhlIHJlc2VydmF0aW9uIHNldCBvZiBhbiBpZGxlCj4gQ1BVIHRvIHdh
a2UgaXQgdXAgYW5kIGxldCBpdCBoYW5kbGUgSVBJIHF1aWNrbHksIHdpdGhvdXQgZ29pbmcgdGhy
b3VnaAo+IHRyYW5kaXRpb25hbCBpbnRlcnJ1cHQgaGFuZGxpbmcgcm91dGluZS4KPgo+IFswXSBo
dHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtemF3cnMvYmxvYi9tYWluL3phd3JzLmFkb2MK
Pgo+IFh1IEx1ICgyKToKPiAgIHJpc2N2OiBwcm9jZXNzOiBJbnRyb2R1Y2UgaWRsZSB0aHJlYWQg
dXNpbmcgWmF3cnMgZXh0ZW5zaW9uCj4gICByaXNjdjogVXNlIFphd3JzIHRvIGFjY2VsZXJhdGUg
SVBJIHRvIGlkbGUgY3B1Cj4KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICB8
ICAyNCArKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1aWRsZS5oICAgfCAgMTEg
Ky0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgIHwgICAxICsKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAzMSArKysrKysrKysKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zbXAuaCAgICAgICB8ICAxNCArKysrCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jICAgICAgICAgICAgfCAgIDUgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAg
fCAxMDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c21wLmMgICAgICAgICAgICB8ICAzOSArKysrKysrLS0tLQo+ICA5IGZpbGVzIGNoYW5nZWQsIDIw
NSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4yMC4xCj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
