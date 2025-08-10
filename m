Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0111CA0EC0
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qpPLKG8aUtSHMGF1y31/CFnxC9UNeDrJpelSzASI0I=; b=t50TYTkgeqOigT
	lN+V64nbQkrdfQwNDy2S2rpiodpgYrPfV7jJeiEUibr+ehqr5M8b7pxRB1Au+jrQph/BsNrNizDGe
	kZoxiv4rhe1P7HF7mQyRPTgNY2gHXPX5OoeAITbVA4Om6bdg3TZBMGYOnHdLgrHyouguB6mciR3My
	98yI0G3H7+yHtGTg8+Ks6/5m7xTJVyQD5KCnX3kmOOw4Jbryh8xqKf2Vu0tFuU6HsDPdqeNo5jo6Y
	LCqtQyTMBdaPxHkZaApvscJ23l7dmA5eyW6O3CEWCUgnncjLItEUIN4fpp+1e9OShv0t6nxKDYfkX
	mFQfTsxW3G3O2bOjZZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDSX-000000061RB-2EGU;
	Sun, 10 Aug 2025 21:20:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKw-00000005zaP-0uIF;
	Sun, 10 Aug 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECAA94470C;
	Sun, 10 Aug 2025 21:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2752C4CEEB;
	Sun, 10 Aug 2025 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860333;
	bh=q6uQBP3ytVwY6Xa0bc7ANWecbKEHgjOcdNbvPZv33Lk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wf3MJIUha+tL0qtzl5Xf6xljjvs+i5UNLAoJ/pUEkJv27IMfKaWGuIXYUnccTV8lu
	 4osP+GVHUZPCF4H7EpfE+/sASevvtCay7yT0WV2OQWZwF1oYCCXq7L44lWCr9wV2Iq
	 /CH6JRm1eFDYNfX9gpbUk8layqijyn9I3/iZ0rCgIKraHTzIEqFwkfYabLlGJZCQnz
	 XgrA2HMScZbJ9Kw2bPTQeQu06I/gHMONMQw5KKtdKdj5YOsDYAsurp7Zyj0exMXQCf
	 nX+MRQb0244NMTke6zPThALZixE0KJtKSh2zA3y17EAm8PQ9HfaF5/dOzdssGMYDR+
	 HTudqeXY+X3wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDAD39D0C2B;
	Sun, 10 Aug 2025 21:12:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034649.1221929.797683482600200009.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:26 +0000
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 vz@mleia.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141214_275641_11912056 
X-CRM114-Status: UNSURE (   8.51  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPjoKCk9uIFR1ZSwgMjQg
SnVuIDIwMjUgMjA6MTU6MzYgKzAyMDAgeW91IHdyb3RlOgo+IEhlbGxvLAo+IAo+IHNvbWUgdGlt
ZSBhZ28gdGhlIHB3bSBjb3JlIGltcGxlbWVudGVkIGFkZGl0aW9uYWwgbG9ja2luZyB0byBwcm90
ZWN0Cj4gbG93bGV2ZWwgZHJpdmVyIGNhbGxiYWNrcyBhZ2FpbnN0IGRyaXZlciByZW1vdmFsLiBB
IHNpZGUgZWZmZWN0IGlzIHRoYXQKPiAuYXBwbHkoKSBhbmQgLmdldF9zdGF0ZSgpIGFyZSBzZXJp
YWxpemVkLiBUaGlzIGFsbG93cyB0byBkcm9wIHNvbWUKPiBsb2NraW5nIHRoYXQgaXMgbm93IHN1
cGVyZmx1b3VzIGR1ZSB0byB0aGUgY29yZSdzIGxvY2tpbmcuCj4gCj4gWy4uLl0KCkhlcmUgaXMg
dGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFs1LzhdIHB3bTogbWljcm9jaGlwLWNvcmU6IERy
b3AgZHJpdmVyIGxvY2FsIGxvY2tpbmcKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3Yv
Yy85NDcwZTdkMTFmZTIKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290
LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsv
cHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
