Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B777CC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 06:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP9g5HQTkS/IfgSYgHcfnc9fwTQFxKLwbZ28JjmmL0M=; b=D/8X9eMpkOQSmo
	cMhBGvV0em/z0ec94EjgOJ+7SY9L9xEZ0ctlAvt/R/xpcQUJo9skiDSZnlOs2jDBZUDs15UkaTUr2
	pqGIablF4l8vo1QE8DyTseT+Z2ed2GPO65kzpbTHtKO2HHPqEMi3y8hzynVj1DH7dz83eycdeuYEh
	+oVMjhoIKt46rUIXCkzPd702VhWAbasqRy7HFKGus4lPXRKkVL6+NFmy8NQJggKVpAlzttN5UDFS6
	8Dl7SS9gRdncLnRiLjv4QrkupXJ5Ax27ti0gks1XXwC4WPcBgi5IeIk0etsHo6Cean8MiReQOajye
	eLr+nNG+qienzqnFO+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoKw-00BgN9-10;
	Fri, 04 Aug 2023 06:30:58 +0000
Received: from out-119.mta0.migadu.com ([2001:41d0:1004:224b::77])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoKs-00BgK0-1n
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 06:30:56 +0000
Date: Fri, 4 Aug 2023 16:25:42 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691130632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnyyMjp6/z58rKII/Rp2mOpVsSyBs8OQVRiCTOvwHzg=;
	b=rU5Afm+UogipGA1Ghu8dxKZ9+UgBF3vyzWvmBEaKnN76hnXKL3M7yZ+l8cSQasw3LtH/Bd
	BvMHgwnV0Dglp2WwL+J2xzkGh5fOtpFDIRgMxGDke8IUmWOtuDs1S3rSB0cZb7LUNfswYQ
	0pWAn3ewJ5Sw4dTiJGpqeVO0A3uI2Zqj901+ynSCkaEBpCMzjtj5psdXq8Emyz39UKaRhm
	DB4sssEAUyAxeWryzNAFHD6FCr3WbpN6L6tALdwc8uxdtAXxvRgkxQ5j0eBTNGszgZL9EL
	A7JYumZdKXnUbJEviPMcnMRGSLr6lAbaUTLUVER/RmASJN9Fz/KxHsiuVQMWPA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Message-ID: <ZMyZ5kZSiiJHtdeS@titan>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3248110.44csPzL39Z@jernej-laptop>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_233054_756293_2EB77BCE 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, mkl@pengutronix.de, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMTA6NTk6MzBQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IHBpbmN0cmwtbmFtZXMgYW5kIHBpbmN0cmwtMCBhcmUgdXN1YWxseSBhdCB0aGUg
dG9wLiBIb3dldmVyLCBzaW5jZSB0aGVyZSBpcyBubyAKPiBoYXJkIHJ1bGUgKEkndmUgc2VlbiBp
dCBtaXhlZCksIEknbSBmaW5lIHdpdGggaXQuCgpIYXBweSB0byBjaGFuZ2UgaWYgbmVlZGVkLgoK
PiBTaW5jZSBvcmlnaW5hbCBEVCBub2RlIGVudHJ5IGdvZXMgdGhyb3VnaCBuZXRkZXYgdHJlZSwg
dGhpcyBzaG91bGQgYmUgcGlja2VkIAo+IHRoZXJlIG9yIGl0IGNhbiBiZSBkcm9wcGVkIHRoZXJl
IGFuZCBJIHBpY2sgYm90aCBwYXRjaGVzIG9yIEkgY2FuIHBpY2sgcGF0Y2ggCj4gZm9yIGxhdGVy
IGtlcm5lbCB2ZXJzaW9uLgoKRG8gSSBoYXZlIHRvIGRvIHNvbWV0aGluZyBiYXNlZCBvbiB0aGlz
LCBsaWtlIHJlc2VuZCBteSBwYXRjaD8KCj4gQmVzdCByZWdhcmRzLAo+IEplcm5lagoKSm9obgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
