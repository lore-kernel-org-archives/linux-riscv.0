Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC6EF3D5FA
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:In-Reply-To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mesML8d7u4GgH+btYOLLfwuw7/XBLx940fZ+1CLUfQ0=; b=OZcOWv9WeIY+XRlHduj4WZ/2Wo
	NbUP7NPrRedPSmwBeEqglloM67dcpwIGAY8FZjCdvUpcExqJbL4hzWhltuJU8uEQhSv/Y/PdGCGe9
	cp+d/Z7+Gd62qTogobGXGcveuCt3hars+8l0rmbpDVVNBGJu5KwpkYsIsao8Yyvi+10evORgqxfLA
	RePTcGlkTWb7EgKTwJhF74Ng0B0CTkAWC/SalKphhRTSFavpkOuf0L3wrNOr3//gveKoEMP5sDEYK
	vbJcoexo2Q1WcxTpllP4ympoDWMEn2HdlRm9C4mVUPC96GEsgt+YC2C6GOu3LnLQhnmteEkYbBqYQ
	bIRglKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mJw-00000009mpZ-0Ktm;
	Sun, 29 Mar 2026 09:20:36 +0000
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mJs-00000009moq-3rOM
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 09:20:34 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8F1D319F5C6;
	Sun, 29 Mar 2026 11:20:01 +0200 (CEST)
Message-ID: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
Date: Sun, 29 Mar 2026 11:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
From: Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock,
 infrastructure for SD operation
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_022033_128383_CF60FF83 
X-CRM114-Status: UNSURE (   5.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpJIGFwcGxpZWQgdGhpcyBzZXJpZXMgb24gdG9wIG9mIGNiZmZmY2NhMmJmMDYyMmI2
MDFiN2VhZjQ3N2FhMjkwMzUxNjkxODQgCihsaW51eCBtYWlubGluZSBmcm9tIHllc3RlcmRheSkg
YW5kwqBzdWNjZXNzZnVsbHnCoGJvb3RlZCB0aGUgcmVzdWx0aW5nIAprZXJuZWwgZnJvbSBhbiBT
RCBjYXJkIG9uIGFuIE9yYW5nZVBpLVJWMiAod2l0aCB0aGUgdmVuZG9yIHUtYm9vdCBmcm9tIAp0
aGUgU1BJIGZsYXNoKS4KClNvIGlmIHlvdSB3YW50LCB5b3UgY2FuIGFkZCBteTogVGVzdGVkLWJ5
OiBWaW5jZW50IExlZ29sbCAKPGxlZ29sbEBvbmxpbmUuZnI+ICMgT3JhbmdlUGktUlYyIHRvIHRo
ZSByZWxldmFudCBwYXRjaGVzIGZyb20gdGhpcyAKc2VyaWVzIFRoYW5rcyBSZWdhcmRzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
