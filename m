Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6243C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK8KQCSEr+mk2+LnQAsx/V916YMYj4+6iaHP/NsX5vw=; b=1Pjx7YZ2yKqqci
	CqzIiqp5VthFCcYQs5TDjtrkxJRuyn506a7Krei/QY0ZKcjCOPpzIElSK1jeOiuEIs+mAaCBc9xuO
	X/sktNm148PAc/otMCEUgZN7R29tVe+/XU/GgfAujVrcjh5l3Ie8cFI1w0ygP7ke0AuSFzPUbVXWp
	srLO/WKAHfTO/oiRo4dRKd/drZSn+L0nc/oQY8aaBQsNuq3R85xmUmVJqh4m04zjHTewiveIwQJB0
	bieB4lFI2A/w7iDCmlt6AFqOEHg25L0EznjjSMhfkm26htLmcd3w1vr7KAeQNBhs0aQyzr4cGMLDA
	UNB7CBlGO1eukVR8HhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtYv-00000000rDl-3jE9;
	Wed, 06 Mar 2024 15:52:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtYr-00000000rC9-3Nar;
	Wed, 06 Mar 2024 15:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F7A9CE2256;
	Wed,  6 Mar 2024 15:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DF2C43394;
	Wed,  6 Mar 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709740322;
	bh=jZtqjcc68teaxGW7BSP8LVZ6Tdy5taDJ5nwTMZlZ+/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YiaraTxCYX+sh145ycLJRCrfAXHa6UY5RzGXxeOI2u4pNbnKN3EXM2agofesj++8p
	 9A5BxVuBz+tX6RKj9ZzXZez63QQV5zX3qVef6cVDps63BmqndBBoBWN5MQQMYAFhfl
	 BvyydWoIt27qJE3CH2suIykw+jMx2pPk/cpIUZLrbE0z+j05MSIXhz8drVO+K+Wca9
	 c4sDa+B+tOzEaCMJr5k/BpNbE7HdxrlD3BTFznFAWXNZ/in6zjfr+7VYyr2lVjaKVJ
	 cRFJuK/7HHfHZbgyCTLsX8ZZRRBWln1cqdlx+Y1ghlC+rlKvIwU27JWnnOUugX6vCF
	 yUXWQde6Y6YDw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v15 08/10] irqchip/riscv-aplic: Add support for MSI-mode
In-Reply-To: <20240226040746.1396416-9-apatel@ventanamicro.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
 <20240226040746.1396416-9-apatel@ventanamicro.com>
Date: Wed, 06 Mar 2024 16:51:56 +0100
Message-ID: <87y1avbboj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_075206_216083_99D24D65 
X-CRM114-Status: GOOD (  12.01  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMgYi9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmIyYTI1ZTAxMWJiMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gK3N0YXRpYyB2b2lkIGFwbGljX21zaV93
cml0ZV9tc2coc3RydWN0IGlycV9kYXRhICpkLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+ICt7Cj4g
Kwl1bnNpZ25lZCBpbnQgZ3JvdXBfaW5kZXgsIGhhcnRfaW5kZXgsIGd1ZXN0X2luZGV4LCB2YWw7
Cj4gKwlzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdiA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRh
KGQpOwo+ICsJc3RydWN0IGFwbGljX21zaWNmZyAqbWMgPSAmcHJpdi0+bXNpY2ZnOwo+ICsJcGh5
c19hZGRyX3QgdHBwbiwgdGJwcG4sIG1zZ19hZGRyOwo+ICsJdm9pZCBfX2lvbWVtICp0YXJnZXQ7
Cj4gKwo+ICsJLyogRm9yIHplcm9lZCBNU0ksIHNpbXBseSB3cml0ZSB6ZXJvIGludG8gdGhlIHRh
cmdldCByZWdpc3RlciAqLwo+ICsJaWYgKCFtc2ctPmFkZHJlc3NfaGkgJiYgIW1zZy0+YWRkcmVz
c19sbyAmJiAhbXNnLT5kYXRhKSB7Cj4gKwkJdGFyZ2V0ID0gcHJpdi0+cmVncyArIEFQTElDX1RB
UkdFVF9CQVNFOwo+ICsJCXRhcmdldCArPSAoZC0+aHdpcnEgLSAxKSAqIHNpemVvZih1MzIpOwo+
ICsJCXdyaXRlbCgwLCB0YXJnZXQpOwoKSXMgdGhlIGZlbmNlIG5lZWRlZCBoZXJlICh3cml0ZWxf
cmVsYXhlZCgpKS4uLgoKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICsJLyogU2FuaXR5IGNoZWNr
IG9uIG1lc3NhZ2UgZGF0YSAqLwo+ICsJV0FSTl9PTihtc2ctPmRhdGEgPiBBUExJQ19UQVJHRVRf
RUlJRF9NQVNLKTsKPiArCj4gKwkvKiBDb21wdXRlIHRhcmdldCBNU0kgYWRkcmVzcyAqLwo+ICsJ
bXNnX2FkZHIgPSAoKCh1NjQpbXNnLT5hZGRyZXNzX2hpKSA8PCAzMikgfCBtc2ctPmFkZHJlc3Nf
bG87Cj4gKwl0cHBuID0gbXNnX2FkZHIgPj4gQVBMSUNfeE1TSUNGR0FERFJfUFBOX1NISUZUOwo+
ICsKPiArCS8qIENvbXB1dGUgdGFyZ2V0IEhBUlQgQmFzZSBQUE4gKi8KPiArCXRicHBuID0gdHBw
bjsKPiArCXRicHBuICY9IH5BUExJQ194TVNJQ0ZHQUREUl9QUE5fSEFSVChtYy0+bGh4cyk7Cj4g
Kwl0YnBwbiAmPSB+QVBMSUNfeE1TSUNGR0FERFJfUFBOX0xIWChtYy0+bGh4dywgbWMtPmxoeHMp
Owo+ICsJdGJwcG4gJj0gfkFQTElDX3hNU0lDRkdBRERSX1BQTl9ISFgobWMtPmhoeHcsIG1jLT5o
aHhzKTsKPiArCVdBUk5fT04odGJwcG4gIT0gbWMtPmJhc2VfcHBuKTsKPiArCj4gKwkvKiBDb21w
dXRlIHRhcmdldCBncm91cCBhbmQgaGFydCBpbmRleGVzICovCj4gKwlncm91cF9pbmRleCA9ICh0
cHBuID4+IEFQTElDX3hNU0lDRkdBRERSX1BQTl9ISFhfU0hJRlQobWMtPmhoeHMpKSAmCj4gKwkJ
ICAgICBBUExJQ194TVNJQ0ZHQUREUl9QUE5fSEhYX01BU0sobWMtPmhoeHcpOwo+ICsJaGFydF9p
bmRleCA9ICh0cHBuID4+IEFQTElDX3hNU0lDRkdBRERSX1BQTl9MSFhfU0hJRlQobWMtPmxoeHMp
KSAmCj4gKwkJICAgICBBUExJQ194TVNJQ0ZHQUREUl9QUE5fTEhYX01BU0sobWMtPmxoeHcpOwo+
ICsJaGFydF9pbmRleCB8PSAoZ3JvdXBfaW5kZXggPDwgbWMtPmxoeHcpOwo+ICsJV0FSTl9PTiho
YXJ0X2luZGV4ID4gQVBMSUNfVEFSR0VUX0hBUlRfSURYX01BU0spOwo+ICsKPiArCS8qIENvbXB1
dGUgdGFyZ2V0IGd1ZXN0IGluZGV4ICovCj4gKwlndWVzdF9pbmRleCA9IHRwcG4gJiBBUExJQ194
TVNJQ0ZHQUREUl9QUE5fSEFSVChtYy0+bGh4cyk7Cj4gKwlXQVJOX09OKGd1ZXN0X2luZGV4ID4g
QVBMSUNfVEFSR0VUX0dVRVNUX0lEWF9NQVNLKTsKPiArCj4gKwkvKiBVcGRhdGUgSVJRIFRBUkdF
VCByZWdpc3RlciAqLwo+ICsJdGFyZ2V0ID0gcHJpdi0+cmVncyArIEFQTElDX1RBUkdFVF9CQVNF
Owo+ICsJdGFyZ2V0ICs9IChkLT5od2lycSAtIDEpICogc2l6ZW9mKHUzMik7Cj4gKwl2YWwgPSBG
SUVMRF9QUkVQKEFQTElDX1RBUkdFVF9IQVJUX0lEWCwgaGFydF9pbmRleCk7Cj4gKwl2YWwgfD0g
RklFTERfUFJFUChBUExJQ19UQVJHRVRfR1VFU1RfSURYLCBndWVzdF9pbmRleCk7Cj4gKwl2YWwg
fD0gRklFTERfUFJFUChBUExJQ19UQVJHRVRfRUlJRCwgbXNnLT5kYXRhKTsKPiArCXdyaXRlbCh2
YWwsIHRhcmdldCk7CgouLi5hbmQgaGVyZT8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
