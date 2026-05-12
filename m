Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD7CCD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ecg+XS5WnEyHgXRJAnpr7xUys8GPjmM8Fyx5YBhjTQU=; b=w2OoPNgZbmlgyl
	rIn0J5peDiFgzA/9/npeo8J5AYgwJ7ilkxGjbnkbGafeAdJB+GEWvLJI8pc+7OizUSKBpBn9Xpqxc
	sg90TszWKfR32nAUkDPJCJ5ueFEAdRDHxqxm6JFVFJKTYdsZXYL9HjcFqvr/1EVQgiJCvFRHnXkB2
	55oNjaiQ9/B2a3OMHsMbHDjIS7IUlvyth1Vp3lzjrri0X+uZAkXar4Bwz0lMiZ7auq7J3iy+MELqh
	owY1sAEqvpfbj346d0mUN0JG8mnv1BnbXLUFllLLXGVQ9A0K6LAz6GLuVa7dzev/YGlgbdK5GtDkV
	AvK6k7V0Mzp0clPwYDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwHw-00000000fgi-1jbK;
	Tue, 12 May 2026 23:13:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwHv-00000000fg0-0WUS;
	Tue, 12 May 2026 23:13:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2723160120;
	Tue, 12 May 2026 23:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E9CC2BCB0;
	Tue, 12 May 2026 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778627597;
	bh=7y5ERZ+46G5TuZ6kypctntsWjjmLUBio5KVlVFgY9Zw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L8ix4T7LumVzKwTGAmGHMrwUukpsAmAzFvnrLz0XdT9IECAVpIFPzI8JAdwAjELFb
	 eEOXvwRJm5nKwiHf/5bwAazCxNLpjjYIURLL8u5VLa2jLpFYeCMrf0TzKNrnZcgJ3k
	 b1lCRWWmuNb7/GLTRAnrSQXC0w+Xf2ly6Yt7jub737/bcoKACKWpPLlF+VCL8d8bld
	 +ASIw4J2jCQZw86XzI2rfrgQWBcvoQF4p6LyjzYRgVlHTseYTsHE0RaF3T6I2k9mJZ
	 OwdU7ctOnJp0Ts89wGEA+Md1HUBm4TJwDahotDhq1bYxG1AgaLLYqPhajGxV8kGAQ9
	 YJQWeT5Ho3mBg==
Date: Tue, 12 May 2026 16:13:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: andrew+netdev@lunn.ch, devicetree@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 horms@kernel.org
Subject: Re: [PATCH net-next v7 2/4] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <20260512161315.141aba88@kernel.org>
In-Reply-To: <446f69bd.7fe4.19e1ab248fb.Coremail.lizhi2@eswincomputing.com>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
	<20260427072508.1151-1-lizhi2@eswincomputing.com>
	<20260428180625.738223cf@kernel.org>
	<2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
	<20260430163551.7491407a@kernel.org>
	<38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
	<446f69bd.7fe4.19e1ab248fb.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
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

T24gVHVlLCAxMiBNYXkgMjAyNiAxMzozOToxMiArMDgwMCAoR01UKzA4OjAwKSDmnY7lv5cgd3Jv
dGU6Cj4gRm9yIHRoZSBldGgxIGVuYWJsZW1lbnQgcGFydCwgbXkgY3VycmVudCB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgaXQKPiBzaG91bGQgYmUgdHJlYXRlZCBhcyBhIG5ldyBpbmRlcGVuZGVudCB2
MSBzZXJpZXMgZm9yIG5ldC1uZXh0LAo+IHNpbmNlIHRoZSBzY29wZSBhbmQgdGFyZ2V0IHRyZWUg
aGF2ZSBjaGFuZ2VkIGFmdGVyIHRoZSBzcGxpdC4KPiAKPiBXb3VsZCB5b3UgcHJlZmVyIHRoaXMg
ZXRoMSBzZXJpZXMgdG8gc3RhcnQgYXMgdjEsIG9yIHNob3VsZCBpdAo+IGNvbnRpbnVlIGFzIHY4
IGZvciBjb250aW51aXR5IHdpdGggdGhlIG9yaWdpbmFsIHNlcmllcz8KCnY4IGlzIGJldHRlciwg
YnV0IGlzIHRoZSBmaXggaW4gbmV0LW5leHQgYWxyZWFkeT8KCklmIHRoaXMgaXMgdGhlIHBvc3Rp
bmcgeW91J3JlIHJlZmVycmluZyB0bzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NTA3MDgzMjE0LjE5Mi0xLWxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20vCml0IGhhcyBiZWVuIGRy
b3BwZWQgYmFzZWQgb24gZmVlZGJhY2sgZnJvbSBNYXhpbWUgYW5kIEkgZG9uJ3Qgc2VlIGEgdjIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
