Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA9C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0IITwDuCGVlLRulAhebVKVXO37F1aaetrzlux1evxQ=; b=t8H1agRv9v5UQT
	6ug+/gop9ZsgZ3zfhRO91TBNyPD/aYmM8zyms1ooOAHbuV99qCYi/Dnkhi4KtDv4Mjp0qRXA2vIvD
	b/iiE8gJ+xb30i+vIlvLUkCkjICLMSjnaLRrRWQrZwM38GTdKI7oCcCqhWHSKduRm9BDFzrZgXm1j
	nP5YAnDR3ROqVX2c9b9RPJwkURjCQQZLnfpltU9/PqpEury+jMrd+yBB1QokodsF2KVKpuy1fMsK9
	tSS6nOZBEAMPuUm+icnpFyF45wMt7ugpCo7E7dxt/GUbyMb8TDJmRD7SkWKGxYBU9PX5zsxZhXaZX
	L/gd/DU5nYqitWcmiddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQRY-00Bi41-1s;
	Fri, 12 May 2023 10:56:12 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQRW-00Bi39-12
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 10:56:11 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pxQQy-008C4M-MJ; Fri, 12 May 2023 18:55:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 12 May 2023 18:55:37 +0800
Date: Fri, 12 May 2023 18:55:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZF4bKe0YkpcQakLs@gondor.apana.org.au>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
 <20230504073400.1170979-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504073400.1170979-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_035610_359045_1CE1EAD2 
X-CRM114-Status: UNSURE (   5.58  )
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

T24gVGh1LCBNYXkgMDQsIDIwMjMgYXQgMDM6MzQ6MDBQTSArMDgwMCwgSmlhIEppZSBIbyB3cm90
ZToKPgo+ICsJd3JpdGVsKH5TVEFSRklWRV9JRV9NQVNLX0hBU0hfRE9ORSwgY3J5cC0+YmFzZSAr
IFNUQVJGSVZFX0lFX01BU0tfT0ZGU0VUKTsKPiArCXdyaXRlbChjc3IudiwgY3J5cC0+YmFzZSAr
IFNUQVJGSVZFX0hBU0hfU0hBQ1NSKTsKCldpdGggY29tcGlsZSB0ZXN0aW5nIEkgZ2V0CgouLi9k
cml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtaGFzaC5jOiBJbiBmdW5jdGlvbiDigJhzdGFy
Zml2ZV9oYXNoX3N0YXJ04oCZOgouLi9kcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtaGFz
aC5jOjExMDo5OiB3YXJuaW5nOiBjb252ZXJzaW9uIGZyb20g4oCYbG9uZyB1bnNpZ25lZCBpbnTi
gJkgdG8g4oCYdW5zaWduZWQgaW504oCZIGNoYW5nZXMgdmFsdWUgZnJvbSDigJgxODQ0Njc0NDA3
MzcwOTU1MTYxMeKAmSB0byDigJg0Mjk0OTY3Mjkx4oCZIFstV292ZXJmbG93XQoKUGxlYXNlIGZp
eC4KClRoYW5rcywKLS0gCkVtYWlsOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5v
cmcuYXU+CkhvbWUgUGFnZTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJlcnQvClBH
UCBLZXk6IGh0dHA6Ly9nb25kb3IuYXBhbmEub3JnLmF1L35oZXJiZXJ0L3B1YmtleS50eHQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
