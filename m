Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC42CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwYAss9okbvwJLMD3lFEZIkKThphDV9qp6cTg+xD8d8=; b=hAEhT3xo96x1F+
	sk2ya1HyJM2GleNQ/jf3HIG2Qn3x0yS0AyKQ9hPnPhJEZAwKSKzBYETPWmgqJxkBSquG0yPbgRQWK
	HwBLDKTqWFoJSrreapB3XNyVGw04kfhZJkt4f5V8JFp7jQDSy7cA3XVJPYoN8eZeDybEIrRQWBIlC
	JWD7E/lrmgCaaftoVmR043lVYncSHfY+ZzSwJl9D5lO1AMt1tRyd1uhOpfVUBzd4Ubo03FCifsyBk
	4P7XrdLbKfJMQ4MjAc7l6NMCyxw58akUIr+jLdhGUCtYOpHofQBlvMOE3iPreZVGpklMOudotuEVv
	gIF96ir4ZpH4L0ajz9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGGC-0000000AfVa-0osK;
	Sun, 23 Nov 2025 20:00:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGGA-0000000AfV6-1fJk
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 20:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8616060175;
	Sun, 23 Nov 2025 20:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9722C113D0;
	Sun, 23 Nov 2025 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763928033;
	bh=PptfrUeOsr0Ft61Q+XHwUaj3dNOn35ltiWi0Lff4bJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROgn1KnAgWQhb1fX0OBf8fgwayoG8zqbC10CQreGIh9zW1jicuH995WVNhSO+bYMa
	 HKSty19VNCAZ7h+7xFNXoTOfOPM8mIkr8/fHhsTCatBJO2mVnMkszvpT1q0CTpUjIS
	 VSbyFiUd/ptyRZUwo3uFyZKrmCAbBNGeQriTvXmgXaAe7I7Ikpg5YP0JL3s1g2Hde4
	 aJ/qNUib8LlMBrEyLt9uuQFXA2LohYngvQmtsQJRBAXxvhSKjT0+ZILBc2172qm7EH
	 mU1gjEVhf77ridCtKpToXh7pUoM/VYR1CMdWrAYuTB6qFfyx5f0zxtaGmVciVR9SE2
	 Tk5nQpilfTFsA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactco.de>,
	=?utf-8?q?linux-riscv=40lists=2Einfradead=2Eorg=2C_Ren=C3=A9_Rebe_=3Cren?=,
	=?utf-8?q?e=40exactco=2Ede=3E?=
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH] riscv: dts: sifive: unmatched: Add PWM controlled fans
Date: Sun, 23 Nov 2025 20:00:24 +0000
Message-ID: <20251123-psychic-boned-11090b797e75@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251122.131940.192031134976081316.rene@exactco.de>
References: <20251122.131940.192031134976081316.rene@exactco.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=332; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XI6yC8KoshRfMbdoa9yRg0GxNptE3HkxKGdLTY5W2gg=; b=kA0DAAoWeLQxh6CCYtIByyZiAGkjZ9nIkkI2wZRuQFbR5ucAEZ4xZYtGT079wdDWbe9fi8L1k Ih1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmkjZ9kACgkQeLQxh6CCYtLdPAD+Jm0w FN38NhQDmb3lvFKv4+N/1b7whgQnZQZxOBibhgsA/jJBI5Sxssq2Y1qUSD6FURhv/8WoP5/A6fM CyhIZegAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCk9uIFNhdCwg
MjIgTm92IDIwMjUgMTM6MTk6NDAgKzAxMDAsIFJlbsOpIFJlYmUgd3JvdGU6Cj4gVGhpcyBhZGRz
IHRoZSB0d28gUFdNLWNvbnRyb2xsZWQgZmFucyBvZiB0aGUgSGlGaXZlIFVubWF0Y2hlZCBib2Fy
ZCB0bwo+IHRoZSBkZXZpY2UgdHJlZS4KPiAKPiAKCkFwcGxpZWQgdG8gcmlzY3YtZHQtZm9yLW5l
eHQsIHRoYW5rcyEKClsxLzFdIHJpc2N2OiBkdHM6IHNpZml2ZTogdW5tYXRjaGVkOiBBZGQgUFdN
IGNvbnRyb2xsZWQgZmFucwogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvMTIz
YjVlYjcyNmZkCgpUaGFua3MsCkNvbm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
