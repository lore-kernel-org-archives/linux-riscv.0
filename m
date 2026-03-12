Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD23FED2FE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqXKuX7winUDR5VLVGIYEdM48TEjrHG9h1Ysin02VyY=; b=OG7KABKqVJ7/ES
	bZAiVOSLHzU6RCCAmu8bk0lO9sv2F8fvqJ+GwJvfnROtCRCxR4fxQyjem9quwivg6HeksFtY4ZtJg
	hTwoAF04tGKeszArkm6KdIANkjlwM1nGmmoU1sF+6mMgIxDzpGH4JK8vA7h91D63Y19XNp1Xt8Dnq
	gfmJCzGOqZSjcWE7UX+uAkFPLyTfRFfps8XRJ2j4tGKqVqy/EbHaswvJ6VoQ4aOgypcsqIXcL7Yzi
	4s002Q6QOo1WgLfFSezY58y6mFFfHrn2u6cZdA25MNeWfH2aCT72ICwcYXfDYpcH+qol/LF1m1G/V
	m+p5sE7skLVrk5HokN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czC-0000000DpP9-08h8;
	Thu, 12 Mar 2026 10:09:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cz7-0000000DpKE-18gA
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:09:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD2CC4E42650;
	Thu, 12 Mar 2026 10:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BCD65FDEB;
	Thu, 12 Mar 2026 10:09:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D14E710368916;
	Thu, 12 Mar 2026 11:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773310173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nFQgtZbZOzsOMmIw2RPypC2zKtBFpiQqQrkl+bjWfQM=;
	b=fmSie3twSJgvMniuNeOaMgCypnaPOQgNSpPCA5mmJA5rcxWgqqto+u5Cb6zAWbB231nftB
	NdyDoNg4Qqsslt1F+LmG1MVYyhJzMxY9fZCF2e1IGVHQfH6RnXievAt5cPKnJ4k3jyZm0C
	igfswQiWXPdEojOZR3xlF/gTGROjw0W5V0nYOWjGg8jLtUU30e53NnTuDK7nPrl/Km4nAB
	1iUL+Cx6LPrLpkG9bO3Kw50sQYnVnj4fNqjJ2T4R6f0IymoQpiHVlJ7FNf10C6+oHn2UDs
	IKbcUGsdK9r1u0kqWq0PMgO5UQANDEOLyEmgyhWHXaCaAPS98UuWTPXJpNro3A==
Mime-Version: 1.0
Date: Thu, 12 Mar 2026 11:09:24 +0100
Message-Id: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
To: "Conor Dooley" <conor@kernel.org>, <netdev@vger.kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v3 00/10] macb usrio/tsu patches
Cc: "Conor Dooley" <conor.dooley@microchip.com>,
 <Valentina.FernandezAlanis@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Daire McNamara" <daire.mcnamara@microchip.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Richard Cochran" <richardcochran@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Sean Anderson"
 <sean.anderson@linux.dev>, "Vineeth Karumanchi"
 <vineeth.karumanchi@amd.com>, "Abin Joseph" <abin.joseph@amd.com>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 <Ryan.Wanner@microchip.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260310-moneyless-dispense-7bce14b16388@spud>
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030941_446209_4667E880 
X-CRM114-Status: GOOD (  11.83  )
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

SGVsbG8gQ29ub3IsCgpPbiBUdWUgTWFyIDEwLCAyMDI2IGF0IDY6MTcgUE0gQ0VULCBDb25vciBE
b29sZXkgd3JvdGU6Cj4gQXQgdGhlIHZlcnkgbGVhc3QsIGl0J2QgYmUgZ29vZCBvZiB0aGUgc29j
IHZlbmRvciBmb2xrcyBjb3VsZCBjaGVjawo+IHRoZWlyIHBsYXRmb3JtcyBhbmQgc2VlIGlmIHRo
ZWlyIHVzcmlvIHN0dWZmIGFjdHVhbGx5IGxpbmVzIHVwIHdpdGggd2hhdAo+IHRoZSBkcml2ZXIg
Y3VycmVudGx5IGNhbGxzICJtYWNiX2RlZmF1bHRfdXNyaW8iLiBPdXJzIGRpZG4ndCBhbmQgaXQg
d2FzCj4gYSBuYXN0eSBzdXJwcmlzZS4KPgo+IFRoZW8sIHlvdSBhZGRlZCBleWVxNSByZWNlbnRs
eS4gRG9lcyBpdCBnZW51aW5lbHkgaGF2ZSB0aGUgc2FtZSB1c3Jpbwo+IGJpdHMgYXMgdGhlIGF0
OTEgZGV2aWNlcz8KClNvcnJ5IEkgbWlzc2VkIHlvdXIgZGlyZWN0IG1lbnRpb24uIEFmdGVyIGNo
ZWNraW5nIChiZWNhdXNlIEkgY29tcGxldGVseQppZ25vcmVkIHRoaXMgcGFydCBvZiB0aGUgY29k
ZSBiZWZvcmUpLCB0aGUgVXNlciBJL08gZmVhdHVyZSBpcyBkaXNhYmxlZApvbiBFeWVRNSAmIEV5
ZVE2SC4gSXQgY2FuIGJlIHNlZW4gZnJvbSBEQ0ZHMSBCSVQoOSkuIEl0IHdhcyBpbnZpc2libGUK
YmVjYXVzZSB0aGUgVVNSSU8gcmVnaXN0ZXIgdHVybnMgcmVhZC1vbmx5IHdoZW4gVXNlciBJL08g
aXMgZGlzYWJsZWQuCgoxLiBTbyBJIHRob3VnaHQgYWJvdXQgYWRkaW5nIHJ1bnRpbWUgZGV0ZWN0
aW9uLgoKMi4gQnV0IHRoZW4gaGF2aW5nIGV5ZXE1X2NvbmZpZy0+dXNyaW8gbWFkZSBubyBzZW5z
ZSBzbyBJIGRyb3BwZWQgaXQuCgozLiBBbmQgdGhlbiBJIHRob3VnaHQgdGhhdCBhIGNvbmZpZyBo
YXZpbmcgdXNyaW8gYmVpbmcgTlVMTCBzaG91bGQKICAgaW1wbHkgTUFDQl9DQVBTX1VTUklPX0RJ
U0FCTEVEIHRvIGVuc3VyZSB3ZSBkb24ndCBOVUxMIGRlcmVmZXJlbmNlCiAgIHRoZSBicC0+dXNy
aW8gcG9pbnRlci4KCiMxIGlzIHVzZWxlc3MgZm9yIEV5ZVEgY29tYmluZWQgd2l0aCAjMiBhbmQg
IzMsIGJ1dCBpdCBzaG91bGQgYmUgdXNlZnVsCmZvciB0aGUgbWFueSBjb21wYXRpYmxlcyB0aGF0
IGluaGVyaXRlZCB0aGUgd3JvbmcgZGVmYXVsdCB2YWx1ZSBvZgphdDkxX2RlZmF1bHRfdXNyaW8u
CgpJIGFtIHNlbmRpbmcgdGhvc2UgdGhyZWUgcGF0Y2hlcyBhcyBhIHJlcGx5LCBmZWVsIGZyZWUg
dG8gcGljayB0aGVtIHVwCmlmIHlvdSBjb25zaWRlciB0aGVtIHVzZWZ1bC4gVGhleSBhcHBseSBv
biB0b3Agb2YgeW91ciBzZXJpZXMgYW5kIGhhdmUKYmVlbiB0ZXN0ZWQgb24gRXllUTUuCgpUaGFu
a3MgQ29ub3IsCgotLQpUaMOpbyBMZWJydW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
