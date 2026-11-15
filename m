Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F4606A31D
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+PuD17t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYUcnqeZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IKaw+bQ53RZPymNsi/cllLJA2nZa9OgBjOzX96E5Gh0=; b=y+PuD17tR3kxHu4LZI6VJC2reb
	L+YR6h0xB62PP5EqNZhMK2ohCpZOIJjhHxj6f6bB6T+rk9Vq1cB5Xue8zPuH2WYri+wE5hBGTPNoX
	oXF7g7cRCmbnsluwpzQvEuFDt4Y34pnHDmblqSMgelpaSISo3nID09ubmgcpM/XUX5CtLZqHDCQuy
	RrWQRQTn4PqZNPyDNnTd/W22tCRi6MyQnvneHec7640huAyzCdCZD55ZIuVc4XJMnXU+DD3a5q4c7
	RqvPVVQ8pI507QWqof7y5NrLP3F6mmLC0ZUzw2WMIwCnUvjgwRFyWZfynQLR4P9KM3zHv+P25X3FQ
	dCcsRCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUhs-0000000HB5D-1GSk;
	Sun, 15 Nov 2026 07:31:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUho-0000000HB48-3Ovw
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 07:31:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2719964f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=AYUcnqeZIIKnUOdR5VJZYQvaaFRk1X4LeQYbvme+qilr4CISLX3sjakG3BkI+PzYu0
         yvNAyiVZutysYOMwrZaeCVEAlpRNHPWuF5epQ6be+Uhb5eb1NzlZTjJW8monlU6/O79P
         rv+bXkHFqFoxWw+jZzCw0fLee/u4gthtywaDfKimohdF8jkzlBLB20AYGg9q4Iql1EhR
         fJ/GBNiT5ijKx0t99/aoYvV0ZvM5ZYiQ4qvA5taZX76EX3gMpLvmpi68VosR8uabK5bY
         480fh4btH13iYwaqE4/OiGURhttGZbyN5Qk362a8NUN28YvOa4oLz6XoboYRwLo/23/W
         NLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=HbjhagRd/rM3qvmCyNYhhaNNgkIZ1l1ZFxiXuWchA23U4gCUAJIK/GQeA/AOmdWPYs
         7wPj98Y4NDB0meXQF03RIoO1sE3VKGv8qgfpUk+ahHQ1tZ/C8mTNV6JkfqEMXjYvrGQL
         CgAwpUc/hpfT2AWIm/bUQmFuriUkU+fSEgT8Vqgf+afP3PLQ8n6aet9MrOQZHh7RtROp
         67c6GbO2e7oEijesImfAbKu4xmUuqKBo/23LrzkQ31xTWvmwifh/nI1X68nqtnwyEI97
         p9QYFqsvqtVJGmpV7xatcRGAUGn5fRdP//vOf5ofExZ3yWJBaRYbJRCotUQNweM/A0TM
         Q77w==
X-Forwarded-Encrypted: i=1; AL+hErFfyHEYGslc9UzqRb+wFAbLNCsXKsrHKhJcj7WcdXzKGvRoQ8cgj0/TeaqOHHSADdElZH2+0o/tUz0/jg==@lists.infradead.org
X-Gm-Message-State: APuU4Z88RnZd+AgA8jX0zkIsRrFZEUGdwr8j0zshQgAZ0rG13pmhtwIi
	ecnlu7iIKNHImlrY6OrOqOFxwVSyGI2u/p3bOel+2mkteSlCDZO3iIQE
X-Gm-Gg: AYBFou3VZsxwuk58CIh9r2PINfbpXLp+6Jj5tNV6ttSZxfjKMmyRpa8QK+XwfSAAiRn
	uKOrlKR6SP0SPeGlvHldbMRGo2gCFXxmrDjIm2mxqz/MMUFSNmC0NcEetvXohIqZef+OnwA74sD
	naW0M532mRm4lWHZfVevIP6P1ayQ1j2bATs/pcH8a7lSN2093LNRJrZLNQbCGENSVa5r7P0MV4m
	FmUHyMu7LXYAp0qzkvFy/9345a7jI/99K7pGDtmMy9PPy0oir7J0XQ2G1MX6b7DHYDjggvRMucO
	1GkHovIXb00l/XtnVVoES3IxdR6zZUwfNp2P9yrt/93DHYOGt7dAdvfdFF0Z2Vub4HP1YG/ya/k
	pmGIvpwTbKeeWJooXGZ8P4EWsj1RL2pzpLFl9z/WYx871YubvNe1Dwfe0Z4qvvjkwAAMmqmgP4k
	I8maggKovqCj347xaxYzbFebWFZ2Awur6eQxwWz+bU5WTCNfBYXIXUYhDBUeT5hmevJ1TpppASs
	FJW0VnhmR4TvPq5hq15bqn47de6sfFoXml2AmkcuGSJZA61HwgLBx25n4wtr+P27wqACxOqS2u6
	UOFNMI/l5XnraUeuLjugjQjtHZyrtdohEzTrf50ORQJZDoJ7JuRvB6IiLL+2ejCv47p451RF+UP
	Oer0PMBD44ALHHlHUeYvZKzvlpJxAEB7/c6i4yh2zvMk/4pGj3W/ZhLxIFrrHyN/uZj//gkLfzV
	8IKC1BunoetHzUFDoyJghr0cTU5VQUW3Sw+7wjJ5ig9vTAxdILmbc//w3xuHRPLNAKxpPQezUWe
	YjfBX72iyAkFLpfuzphwHDpig==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_233117_600706_47A22E0A 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG5lIHBldGVrLCAxMy4gbm92ZW1iZXIgMjAyNiBvYiAyMzozMzozMiBTcmVkbmplZXZyb3Bza2kg
c3RhbmRhcmRuaSDEjWFzIGplIEhhbiBHYW8gdmlhIEI0IFJlbGF5IG5hcGlzYWwoYSk6Cj4gRnJv
bTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IAo+IEFkZCB0aGUgbWFpbiBDQ1UgZHJp
dmVyIGZvciB0aGUgVjg2MSwgYmFzZWQgb24gdGhlIEE1MjMgb25lLiBUaGUgQ1BVCj4gUExMLCB0
aGUgQ1BVIHN1YnN5c3RlbSBjbG9ja3MgYW5kIHRoZSBFOTA3IGNsb2NrcyBhcmUgbGVmdCB0byB0
aGUKPiBmaXJtd2FyZS4KPiAKPiBVbmxpa2Ugb24gdGhlIEE1MjMsIHRoZSBzZWNvbmQgZGl2aWRl
ciBvZiB0aGUgMjcgTUh6IG91dHB1dCBpcyBhIHBvd2VyCj4gb2YgdHdvLiBwbGwtYXVkaW8tNHgg
ZG9lcyBub3QgcGFzcyByYXRlIGNoYW5nZXMgdXAsIGFzIGl0cyBwYXJlbnQgYWxzbwo+IGZlZWRz
IHRoZSBVQVJUIGNsb2NrIG11eC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5A
aXNjYXMuYWMuY24+CgpEbyB5b3UgaGF2ZSBhbnkgdXNlciBtYW51YWwgZm9yIGl0PyBPciBhdCBs
ZWFzdCBCU1AgY29kZT8gSXQncyBoYXJkIHRvCnJldmlldyBwYXRjaGVzIHdpdGhvdXQgYW55IG9m
IHRob3NlIHJlZmVyZW5jZXMuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
