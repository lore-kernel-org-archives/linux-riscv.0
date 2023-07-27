Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F55AC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spBQdh4RgxTF9vtW9cmlXyAHtMzepyAN0LtH3dZHeoI=; b=NoMQlbu2oiZkIu
	4R94Jgk46D2JsnJSSZLBDAwmnSXuJdsv9rP+jue2TwQZJBy76XHYDbNAQTfkbtQO8Wk4P7AO9Qdr7
	xKrf4mcMQ/pTkpTWOG1dOktkjX82J+bpGt6bt7g80cr6edFDppWjvf2hVvJQnU+VGpI5VroL08vO5
	lWUBNiUiA7jGcZCQ5AFs9lTZ/WJd8TnZ06nUSFz/JcEs71e9g2k9H8dyN0S8MKbKIT3tvbSv47GDc
	99/ryygX7NfNx1I++hhiHFq1Yg1WCfLHvVIORdRMGcF7HmX/FVdAX1aH3dYOxi0/HSsAupwJil5gD
	iW8PWo7zKAq82y+1f+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOoez-00BmN0-0o;
	Thu, 27 Jul 2023 00:15:17 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOoew-00BmLg-1u
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 00:15:16 +0000
Received: from [192.168.3.30] (unknown [36.44.143.80])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 1A1DB1C81CC;
	Thu, 27 Jul 2023 00:15:00 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690416905;
	bh=DIeHF5kJlA2aI9G3e6fvnHlF5pPSTY4C8thMtYC5jiI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wb87FT5DJHs6JK0kkjGyB2DV3Hrd2ZeMFoeSgfiyefBcReHXAqsMW83UaZyYIHnjF
	 CSnJtJoqtkVT+0uGBJARFDnZ53zaawbH7XFMa+0wDSbUZqY5CP6KPhP8zF4vXcSKg/
	 qTdrsOrNasLdASe9Jy1wYJ7K5XAQu23cl46f9US7WPY2QY8gI6z46QOHcLy2rbIzO9
	 fgAbZT1719VtNr+zfnKJgJxpCYw6ZOTor4T584TiuGAPK689c+IiiIzWEd8/m8JUNF
	 2XPPx7w4n+HRJPqDjV1ZyQmChzGVQd0n8h68ierXMAO/5l8HdjC0Xmj3riV81mMtAt
	 8L+EvJDv5NizQ==
Message-ID: <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Thu, 27 Jul 2023 08:14:57 +0800
In-Reply-To: <ZME1J4mpVf5yth32@xhacker>
References: <20230617161529.2092-1-jszhang@kernel.org>
	 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
	 <20230725-unheard-dingy-42f0fafe7216@wendy> <ZL/jMYL3akl78ZZN@xhacker>
	 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
	 <ZME1J4mpVf5yth32@xhacker>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_171514_805334_59996B37 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDIzOjAwICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+
IHdoaWNoIGR0cyByIHUgdXNpbmc/IHNlZSBiZWxvdy4KPiAKPiA+IAo+ID4gT3IgbWF5YmUgbXkg
dG9vbGNoYWluIChHQ0MgMTMuMS4wLCBCaW51dGlscy0yLjQwLCB3aXRoIG5vIHBhdGNoZXMpIGNh
bgo+ID4gbWlzY29tcGlsZSB0aGUga2VybmVsPwoKLyogc25pcCAqLwoKPiA+IEJvb3QgSEFSVCBJ
RMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogMAo+ID4gQm9vdCBIQVJUIERvbWFpbsKgwqDC
oMKgwqDCoMKgwqDCoCA6IHJvb3QKPiA+IEJvb3QgSEFSVCBQcml2IFZlcnNpb27CoMKgwqAgOiB2
MS4xMQo+ID4gQm9vdCBIQVJUIEJhc2UgSVNBwqDCoMKgwqDCoMKgwqAgOiBydjY0aW1hZmRjdngK
PiAKPiB3aGF0PyBJIGRvbid0IHRoaW5rIHRoZSBtYWlubGluZSBkdHMgcHJvdmlkZSB2IGFuZCB4
LiAKCkkgY29waWVkIHRoZSBjb21waWxlZCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUy
MC1saWNoZWUtcGktNGEuZHRiCmludG8gL2Jvb3QgYW5kIGxvYWRlZCBpdCB3aXRoIHUtYm9vdCAi
bG9hZCIgY29tbWFuZCBvbnRvIDB4NDYwMDAwMDAsIGFuZApwYXNzZWQgdGhpcyBhZGRyZXNzIHRv
IHRoZSBib290aSBjb21tYW5kLgoKQnV0IG1heWJlIEkndmUgY29waWVkIHRoZSB3cm9uZyBmaWxl
IG9yIG1hZGUgc29tZSBvdGhlciBtaXN0YWtlLi4uIEknbGwKcmVjaGVjay4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
