Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33490606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vJ/aFL5x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=JhouUIo+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xV/TpyGViarEkcHNjyMV4E5SqDRDxsV9r70t197czdE=; b=vJ/aFL5xzCm3W+DrhJO531ceP3
	K3JwfpUaIwF0+CKT9gXfWhaSl0TzlqwWKe05sNtHhBGyR99dJSzr3wxpZsdhXgy0CuvHUWsc6EzQp
	ppj8NqACP0J4E1s4kKxDiDO0yo6KQ/adD84fdyoCuCaWJoI5DrgpU7IS1ziFuYFExGM5aX3YyxPV4
	qmfwFUKfk6uKXnHdq9Urkw7YlqXBz7ltIdXDMt3NXyg7jkbFjGJt3nU4f5MrexR1LbC+XN4GbBkJc
	+R5unKJAWlIG29oKIXEqg6BRik0IuE4+KKq7GZfWlYfot3LO/S6MLws65Pv7BxgLkbBNgU6gXWp8a
	sVlWEJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcp3-0000000DzMu-3faW;
	Thu, 26 Nov 2026 16:59:49 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcp0-0000000DzJ5-2K7K
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:59:48 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 1A375210CB39;
	Thu, 26 Nov 2026 17:59:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E2B91210CB8B;
	Thu, 26 Nov 2026 17:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E2B91210CB8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712380;
	bh=AHx1ZHDrqBb1Si3Vg9G24oWeMqKbUp9iTNo0v3fevqo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=JhouUIo+srPjnJRPo3bBdddGVOSulP0WXkfsaXtn3NC7xUv/Pfq98honcLwGI1G+k
	 Uw699z0xEriJO1hFUqlceUnxaCxqxj/fg/1vRAq/PknZ2bhg+BrravmlOGRyqzRJiu
	 aaHK15FcJ8OWpFRjdlh869gCH+UBKH09Ac45nfKAhQtNEegq4Bq5s3D1oCfy/+khRC
	 PnPYUGfKYrIAemPme9H7I48OCRUtkdFu2gdq4ERf9dSDduRLVO9JlBid8IYnBoc0YC
	 /gdlf/6gW9IMolp8s2hWC09uOcAS84lajEQmzPRNLGNhtYzMqJhpWuU5MSeOoJBAWD
	 OlgjQyNZSYbdg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id mmMzcOV2bv_K; Thu, 26 Nov 2026 17:59:39 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 200E7210CB39;
	Thu, 26 Nov 2026 17:59:39 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/2] mmc: spacemit: Introduce tx delay DT property
Date: Thu, 26 Nov 2026 17:59:19 +0100
Message-ID: <20261126165920.905227-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
References: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_085947_041676_03037C87 
X-CRM114-Status: UNSURE (   4.81  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWWl4dW4sCgpUZXN0ZWQgdjIgb24gYSBCYW5hbmEgUGkgQlBJLUYzICh2Ny40LXJjNCkgd2l0
aG91dCB0aGUgbmV3IHByb3BlcnR5Cih0aGUgYm9hcmQgRFQgZG9lcyBub3Qgc2V0IGl0KTogbm8g
cmVncmVzc2lvbi4gVGhlIGVNTUMgcnVucyBpbiBIUzQwMAplbmhhbmNlZCBzdHJvYmUgKDI1NiBN
aUIgZGlyZWN0IHJlYWQgYXQgMjEwIE1CL3MpLCBhbmQgYW4gU0QgY2FyZCBpbgpoaWdoLXNwZWVk
IG1vZGUgcmVhZHMgYXQgMTUuNiBNQi9zLiBXPTEgYnVpbGQgaXMgY2xlYW4uClRlc3RpbmcgZG9u
ZSB3aXRoIHRoZSBoZWxwIG9mIENsYXVkZSAoQUkgYXNzaXN0YW50KS4KClRlc3RlZC1ieTogRnLD
qWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4gIyBCUEktRjMKCkZyw6lkw6ly
aWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
