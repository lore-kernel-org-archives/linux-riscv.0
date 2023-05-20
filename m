Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1952FC77B75
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 01:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UAzuvVTMjaLVISfHmxyO6JfwmY3lLLLJJX6sp29an0=; b=stxUSB8GRS1t8K
	leGtMZ6dd2Ysoh/K5jkcrGo2TrR5Xip86QJkzF6YyVTwPEzKZmhK2Xadavd9Y8wonb6S2nYeRhfDI
	Q/53OgbEX9BJMkSBgj3Hs65Mf8ypdjruALnrVS8f7xu7P4bPzG+9lvkbUb73G4xlFoDGZOzIN/c+5
	4RZu9nFZOy3L/7QIE9UIp43vL5IqRb4eq+tW6Wovw6/ZabcHKjUeF7FkDtIsUU4maamIWm38EkCLJ
	022CJSutB27X+b15lN4H2fftpmJCkNMxGJHnWL1wQNhZkIEDQTsGHDct0xjqOPaRQKxyIWOtCRBvg
	vGmTzX98Tulpsi1ARG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0BD7-000M5b-26;
	Sat, 20 May 2023 01:16:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0BD4-000M5A-2W
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 01:16:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0396B61BF3
	for <linux-riscv@lists.infradead.org>; Sat, 20 May 2023 01:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC4C4339E
	for <linux-riscv@lists.infradead.org>; Sat, 20 May 2023 01:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684545397;
	bh=cmPyGCDj3qYpYiJY3BxliTqaHfvx5UhxPrQyG6kxeS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lXQGijUOEm+xkhPEy7uN3Yw9xNiuxFfHKXog5I2f2KPdVq6ruBtfNJP5I/KFJk+IR
	 gqcCw58L69rFicAeGpMZiDATP6ljYaZS6ozhxB81pknfM1O7umGsNk8BuqM1RPbdix
	 ZW4XU8iAicsoPwGpnGPqcjDUUIOfsWaTipNUj44htuOS9hqr0vPjn3di83e2kN8qbX
	 DaY7QZKYf0hrp0zPbDjkZxN3Xz6vN0oJ1q1IoPCWlVewjwQKW4cQkArfQErf5ZNtHJ
	 v+CzvoYHrPDdEfn42PnXi23bwP7QEC4zRtraE8/MMCFb6Of4Row0Z521cGGzDaG65Y
	 0ZlgRfy5WD0ug==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-96f0678de80so713542066b.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 18:16:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDzuDyDNnQ7zZdKllms9NTqTxQ/xa3bVg1Byscg/XMOTZksyFPMz
	Ii4yTOeVKiXvZQaqBVeZp1BB3hEwPy+Mo6z5VQQ=
X-Google-Smtp-Source: ACHHUZ5BJxethRchVhvqgx4k+CmNvVMLwKMqXE8ThR/0TeGuD/7A9IKk1GVtu6KMRelWQhhuu+wSq2pSNp/02QFmE9M=
X-Received: by 2002:a17:907:8a10:b0:96a:d916:cb2f with SMTP id
 sc16-20020a1709078a1000b0096ad916cb2fmr4107322ejc.36.1684545395510; Fri, 19
 May 2023 18:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230518184541.2627-10-jszhang@kernel.org> <mhng-e1d500da-688e-49bf-a2d8-bef0e2df48f8@palmer-ri-x1c9a>
In-Reply-To: <mhng-e1d500da-688e-49bf-a2d8-bef0e2df48f8@palmer-ri-x1c9a>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 20 May 2023 09:16:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQrfGyitzi7yhcs1dedG9NH2wnieoLu78SUNSaRiyL9dg@mail.gmail.com>
Message-ID: <CAJF2gTQrfGyitzi7yhcs1dedG9NH2wnieoLu78SUNSaRiyL9dg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable T-HEAD SoC
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_181638_881222_8E25C081 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, jszhang@kernel.org, frank.li@vivo.com, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, linux-riscv@lists.infradead.org, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gU2F0LCBNYXkgMjAsIDIw
MjMgYXQgNDo1NuKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3Rl
Ogo+Cj4gT24gVGh1LCAxOCBNYXkgMjAyMyAxMTo0NTo0MSBQRFQgKC0wNzAwKSwganN6aGFuZ0Br
ZXJuZWwub3JnIHdyb3RlOgo+ID4gRW5hYmxlIFQtSEVBRCBTb0MgY29uZmlnIGluIGRlZmNvbmZp
ZyB0byBhbGxvdyB0aGUgZGVmYXVsdAo+ID4gdXBzdHJlYW0ga2VybmVsIHRvIGJvb3Qgb24gU2lw
ZWVkIExpY2hlZSBQaSA0QSBib2FyZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2NvbmZpZ3Mv
ZGVmY29uZmlnIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL3Jpc2N2
L2NvbmZpZ3MvZGVmY29uZmlnCj4gPiBpbmRleCBkOThkNmU5MGIyYjguLjEwOWU0YjViMDAzYyAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IEBAIC0yNyw2ICsyNyw3IEBAIENPTkZJR19F
WFBFUlQ9eQo+ID4gIENPTkZJR19QUk9GSUxJTkc9eQo+ID4gIENPTkZJR19TT0NfTUlDUk9DSElQ
X1BPTEFSRklSRT15Cj4gPiAgQ09ORklHX0FSQ0hfUkVORVNBUz15Cj4gPiArQ09ORklHX0FSQ0hf
VEhFQUQ9eQo+ID4gIENPTkZJR19TT0NfU0lGSVZFPXkKPiA+ICBDT05GSUdfU09DX1NUQVJGSVZF
PXkKPiA+ICBDT05GSUdfQVJDSF9TVU5YST15Cj4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
