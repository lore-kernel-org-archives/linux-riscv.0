Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A0C35FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaVlwHDs88d1dwYriyF2eRlBv2KvIMREYDowXRrGaCU=; b=iuPUGFHVmcqBP5
	8nkf5mVxmEvSQVyDnD9BDgKhDjz8HsPaZbzZ933D0IBQYBMj1qGsOOkXhSXZi78RnI88HDmtLX9Fw
	6x3GxfLUCOHy1HXOQRF8HVQssQ/OWJ9m54qHo+bHOADl7eHD8xNW3fCvO9y5x4rCFtcyuq9JDmMqZ
	HTFPmI215b3WpPsBnustIo+nZ6eXdrSE6A/zyJt9F8PCpDJiWbnFmusMeZbbFDCgyKN93FpqwYzlH
	xig7YvgNANZ1zLly08qXsGCIstRII+nER1FJJqGCUgIsIqnAAYw4YWg59AvEYndmXqXdsOKZW7xCJ
	o7I3KgrKRvQP9eaq56tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJXy-0000000CmhC-0KhL;
	Thu, 20 Mar 2025 17:19:10 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJUF-0000000Clxw-0KbU;
	Thu, 20 Mar 2025 17:15:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8861443AB;
	Thu, 20 Mar 2025 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742490914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxcpHL6JN0oeezTkg7NVy58dIuvVNMDJ2U1SuOSdwYU=;
	b=J9IJpfJxCUQy4Nmv3ICqgxXGSZ6zv41jNmXAdsbdKwqXzLaMoy2ew7RCtXu5kef/Qj3UaF
	2+zElCQGrOuVLtFPPGpzcf0ORi6zbAgThOr3jt8MSGqTewV8LkyAcFrOub33cnTGhHm4ar
	+Yjt05/rZBHpbLjzJ0yMU4mJPyS1sVB0JlyPwtCLy0Rek9OG/1w4yvPoe0lqnNZN7Hy4ZH
	iDkGER6Agr4nUeyy4ujo3PCO0lt28Nff7uJGFke26TRdk+V2mG5xX4NQNx6whIo35RVIvA
	mOBc/Tkse0yiIsQ/+2DTBIftNn2i5pBmRhc9cRmwADMAw5PcFX20fwBKo1+lIA==
Date: Thu, 20 Mar 2025 18:15:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
 Antoine Tenart <atenart@kernel.org>, Sven Peter <sven@svenpeter.dev>, Janne
 Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Nishanth Menon
 <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
Message-ID: <20250320181508.132c4636@bootlin.com>
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
	<20250319092951.37667-7-jirislaby@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrthgvnhgrrhhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_101519_583203_F4215673 
X-CRM114-Status: UNSURE (   6.52  )
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

SGkgSmlyaSwKCk9uIFdlZCwgMTkgTWFyIDIwMjUgMTA6Mjg6NTkgKzAxMDAKIkppcmkgU2xhYnkg
KFNVU0UpIiA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBvZl9ub2RlX3RvX2Z3bm9k
ZSgpIGlzIGlycWRvbWFpbidzIHJlaW1wbGVtZW50YXRpb24gb2YgdGhlICJvZmZpY2lhbGx5Igo+
IGRlZmluZWQgb2ZfZndub2RlX2hhbmRsZSgpLiBUaGUgZm9ybWVyIGlzIGluIHRoZSBwcm9jZXNz
IG9mIGJlaW5nCj4gcmVtb3ZlZCwgc28gdXNlIHRoZSBsYXR0ZXIgaW5zdGVhZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+CgpSZXZp
ZXdlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CkFja2VkLWJ5
OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4gIyBpcnEtbGFuOTY2eC1v
aWMKCkJlc3QgcmVnYXJkcywKSGVydsOpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
