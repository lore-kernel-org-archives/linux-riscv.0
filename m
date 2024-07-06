Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D4C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 08:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKJ3QrtrD9Mv2lakRjnRmfibcJX/NTV7n2ZtDC8oXnY=; b=eVN8lx0HfdDhTP
	JWyf2ez+RrzrtkAzf5sfr/SX+EEzlX26SpUXEvnVDnB9OBH2LbWQjtzylrxF8fIaIHuq/IvIxRtnR
	QWXD6B/d2bBWIxruOMk1A4c4hyqXKpMCJCK+V4L14HkyPvfYzWOvYs17rNP3HhOBxO33HlF1XTztd
	oytsAOjKeChGWBHKRmW1DCmY2R9ILfoc53qcA8Mw+hZs8n+3Y31G8y9AzbQkdEizBCSvCieTvFhdV
	sLE5DnT42vm1YKUrCQy5GI2bjxKbTrKWEcQ+Zm8xOSF6Y57nRn65Ab9pTBhdpFftSDrjdDZTsPQ+Q
	Y517CT8hOOllvIS42WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0Qp-0000000HW9f-3S28;
	Sat, 06 Jul 2024 08:06:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0Qk-0000000HW90-3sxn
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 08:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B22B9CE09FC;
	Sat,  6 Jul 2024 08:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F843C2BD10;
	Sat,  6 Jul 2024 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720253160;
	bh=yRgXLaKmUsIdQHY1Q3h67uj2rWQ7+iou6MCLsSzPh+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYqjoKCndsh1dPwy3fITjkAEFgvhA7Ic4mR0JIulCUlq4GOTlrguxNfg5X74DucdV
	 Fb642usa+0w+oLSKjhfSEDuVuZrarWOY4zS7tNcbk8sXJi4boGMQWHq4duu5as14ry
	 j82qJ1S+t9aUtA9+Tb2Wm4Siy1C9laN76TNwM+Ig=
Date: Sat, 6 Jul 2024 10:05:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?5byg54yb?= <zhangmeng.kevin@spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Jisheng Zhang <jszhang@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Jiri Slaby <jirislaby@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 06/11] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
Message-ID: <2024070645-trapper-shucking-acdb@gregkh>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org>
 <ZoarsYMNJRu1-_wn@xhacker>
 <20240705064721.GB3042186@ofsar>
 <21b192b47649688e2400e3968e28905bba186d51.42926de8.32d7.41ea.b98f.6e2edb5e6c5a@feishu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21b192b47649688e2400e3968e28905bba186d51.42926de8.32d7.41ea.b98f.6e2edb5e6c5a@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_010603_282269_AAEE398F 
X-CRM114-Status: UNSURE (   6.79  )
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

T24gU2F0LCBKdWwgMDYsIDIwMjQgYXQgMDQ6MDI6NTdQTSArMDgwMCwg5byg54ybIHdyb3RlOgo+
IFRoaXMgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnQgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5
IGJlIHByaXZpbGVnZWQgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIG1lc3NhZ2UsIHBsZWFz
ZSBkZWxldGUgaXQgYW5kIGFueSBhdHRhY2htZW50IGZyb20geW91ciBzeXN0ZW0gYW5kIG5vdGlm
eSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGJ5IHJlcGx5IGUtbWFpbC4gVW5pbnRlbmRlZCByZWNp
cGllbnRzIHNob3VsZCBub3QgdXNlLCBjb3B5LCBkaXNjbG9zZSBvciB0YWtlIGFueSBhY3Rpb24g
YmFzZWQgb24gdGhpcyBtZXNzYWdlIG9yIGFueSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBtZXNzYWdlLiBFbWFpbHMgY2Fubm90IGJlIGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVy
cm9yIGZyZWUgYXMgdGhleSBjYW4gYmUgaW50ZXJjZXB0ZWQsIGFtZW5kZWQsIGxvc3Qgb3IgZGVz
dHJveWVkLCBhbmQgeW91IHNob3VsZCB0YWtlIGZ1bGwgcmVzcG9uc2liaWxpdHkgZm9yIHNlY3Vy
aXR5IGNoZWNraW5nLiAKCk5vdyBkZWxldGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
