Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B955EC197A0
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpobUBgA5sMJK8TSNBRrApepmMh/te1TW08B/9LLqeU=; b=m/e+yjMgw9jTxG
	SY7BfaeAGZbZrRRepQL+v5wyKB4ReU2Q05QFj35Sv80S1hXACN8jfmva5q4i1byupkXLhi2LpSI4C
	Nvpd+NGhsv9Go/bn2FWgdKS6dUWc6u3PCwNrWNkculGkP1l/WIfOi/mLuibcG8Uf3uI3FE2qtmxIM
	lSIFeOe1ttP+VhF3Gd3Tta8YlSj1HGLKhf20TLuojf2HcOeeRcGtl4xd+xN9XpUHQcSf8vqc5fV1c
	PygmVA5BueB5V2I4Y4+j9pVJ5Gtp/YGV/L5c0o1GJ1P1f3NV80miSj67oGFrwV0b88AhhFpGiKzjd
	DF+ULOxom5/LA30ACNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yN8-006aA2-36;
	Fri, 17 Nov 2023 12:54:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yN5-006a8Y-2i;
	Fri, 17 Nov 2023 12:54:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9245C61D72;
	Fri, 17 Nov 2023 12:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7672C433C7;
	Fri, 17 Nov 2023 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700225689;
	bh=jgQc5Itelpk92zM45YpqFlo1y4VJI+dnHxsnMdw3FZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg7fSaYXjkW0T93Lpe/n79IhrWlBC15Gxd2bhh9VEEQTsdCNzpOFxXBHZ9Mid9MJW
	 uaZTpS/4fSrgMvOFG23qHmqv9SJ/UfOHoIu4EaC4U8esmvFCFcsH0fzhhjVPXehKcG
	 PpW5zmsMlu9aSPBUhrg+7bhG7dt2wEjy1zCa7Hlt8Rh2G4rPy+m1Oy8+qgoXKrEb8j
	 xr+0tpSZ4D7FYlBUygvGx0OKU8ccQKLVhTg7Cse9Yn7G9aaLpq8zhRBNHWMv9Xa1gk
	 hKtgr78XHjGXL2+BQDh2uKxmRtxlIwf7WttNVWLMy03Mu/e2nmSIrcbafGiDjz/clC
	 VWZTNDXKG4aSw==
Date: Fri, 17 Nov 2023 12:54:41 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Samuel Holland <samuel@sholland.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 2/5] leds: sun50i-a100: New driver for the A100
 LED controller
Message-ID: <20231117125441.GC153049@google.com>
References: <20221231235541.13568-1-samuel@sholland.org>
 <20221231235541.13568-3-samuel@sholland.org>
 <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045455_943682_2F310564 
X-CRM114-Status: UNSURE (   8.70  )
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

T24gVGh1LCAxOSBPY3QgMjAyMywgQW5kcsOpIEFwaXR6c2NoIHdyb3RlOgoKPiBIaSBTYW11ZWws
Cj4gCj4gdGhlcmUgYXJlIHR3byBtb3JlIHRoaW5ncyB0byBjaGFuZ2UsIHdoaWNoIGNhbWUgdXAg
cmVjZW50bHkuIFNlZSBiZWxvdy4KClBsZWFzZSByZW1lbWJlciB0byBzbmlwIHlvdXIgcmVwbGll
cy4KCj4gUmVnYXJkcywKPiBBbmRyw6kKCltzbmlwcGVkIDYwMCsgbGluZXNdCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
