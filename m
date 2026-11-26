Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D417606A32E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhuk8hY9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=O59FxSK4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B9dOCJicIdcrXFtHudWwc8ypxXCBDfrOplX32KNWygI=; b=bhuk8hY9zAwOMjBO+E7GQyR45J
	Eyzd6MBfoT8g9lJhdGP8ePCn3JYw2ODI0U2TJ73qZG3aiiFzG0fH7CxgXaKdfKmwrodR0n6AXK/PX
	3BHCrDbpluRyc20QBFuR6870mZLq5H8/wqXKYkqpmOMc9omySkyYaOWokqCUD+Y71SjjHZZat5ydQ
	yLvFuWuDkP2osJtEylc4qXEqkt7lRDPcSojCGjJmJH6xBhtucruFnw9StBqTwLMkMmcDIe9jHxsVf
	VXYSSxDMAi8UGKh0lTSJdvY6v3IsPuplMoOOGm7biC7swwJjkZTiEH0njXChAmt8zYTgkNBP1rBa4
	/J311zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcrk-0000000E0jR-24Q1;
	Thu, 26 Nov 2026 17:02:36 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcrh-0000000E0fg-1IHj
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 17:02:34 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 9727A210CBD7;
	Thu, 26 Nov 2026 18:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 6E3D6210CB3D;
	Thu, 26 Nov 2026 18:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 6E3D6210CB3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712551;
	bh=Y+Z5OcIdHfLl7WqjQn8j93xvyYaxhnjrN28MjRvFBlg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=O59FxSK4jt2QJZeH38U+RTx2RLeWK+zf5SyVpOIWXQyQELQzV8XIl/6QulIq6L3L9
	 hcyorfLELSjAEs7jBbgpdYjl6jVWaLcp/jZFfWwmSZnMC9jbwefnXrlJTcz3zcmEIn
	 AabeyHeMSkMAHJaqos3sPcoBb69muReD9824aImQbCQgD3ijeYie2bzvzPoaMH+ppu
	 pbyTnZpLWHXreL0V/GND7/9xwv6WE5WbYzkDjtFH6KruHaXOISaYeiGXJnMz12o0Yw
	 3zpdavwQyr8Id4xoDAMMJM7EIDkW/709XqiqnRi24lGukdaF3fC7+m6k3pku7MYUee
	 pgGiy4XlKwCzA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id XV8IBwwsyA6k; Thu, 26 Nov 2026 18:02:31 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 6C238210CBD7;
	Thu, 26 Nov 2026 18:02:30 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Thu, 26 Nov 2026 18:02:04 +0100
Message-ID: <20261126170206.905453-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_090233_534980_617E7F8C 
X-CRM114-Status: UNSURE (   5.02  )
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

SGkgVHJveSwKClRlc3RlZCB2MyBvbiBhIEJhbmFuYSBQaSBCUEktRjMgKHY3LjQtcmM0KTogZDQw
MTQwMDAudGltZXIgcHJvYmVzIGFuZApiZWNvbWVzIHRoZSBicm9hZGNhc3QgZGV2aWNlIChvbmVz
aG90LCB0aWNrX2hhbmRsZV9vbmVzaG90X2Jyb2FkY2FzdCksCndpdGggbm8gbmV3IHdhcm5pbmdz
LiBXPTEgYnVpbGQgYW5kIGR0YnNfY2hlY2sgYXJlIGNsZWFuLiBBcyB3aXRoIHYxIGFuZAp2Miwg
aXRzIElSUSBjb3VudCBzdGF5cyBhdCAwLCBzaW5jZSBtYWlubGluZSBLMSBoYXMgbm8gaWRsZSBz
dGF0ZSB0aGF0CnN0b3BzIHRoZSBsb2NhbCB0aW1lciB5ZXQuIFJlYm9vdCBmcm9tIHRoaXMga2Vy
bmVsIGlzIGNsZWFuLgpUZXN0aW5nIGRvbmUgd2l0aCB0aGUgaGVscCBvZiBDbGF1ZGUgKEFJIGFz
c2lzdGFudCkuCgpUZXN0ZWQtYnk6IEZyw6lkw6lyaWMgTWFow6kgPGZyZWRlcmljLm1haGVAY2ly
YWQuZnI+ICMgQlBJLUYzCgpGcsOpZMOpcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
