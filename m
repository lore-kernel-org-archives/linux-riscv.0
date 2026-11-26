Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAE606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SqpKeGPB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TABOzGOx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hz3QQ2DMpQSt088mbTk2DrEpme79IoM2LqfylgOQtG4=; b=SqpKeGPBNGktuSqQGrK4E+3qmm
	yzLuu7egJnMnYaykyOO6NcrAUXhtRhWfdTscysW3J+CL+4BSvJIobfbgWbCWzMG52ZO/CFYktRETc
	wGkOvOP8buN5e9oO9CGMSmM7Pg5HQhE5s2FpqgyxT3tPlTnpiNYOnmc0tIt+g1Z8uvlp+uSGOmwb4
	4EkVYKwWOaruOdaaWTHXUSxWnCHNvESw/CHs1rGIN6SOKrZ6UtCfcEsn7ddWyt22miSp9/hHzK2am
	10VjKzkSENYJw5MSvD9c4/QyRQ2wUjLNbAd9aBLQFIN3EyyHK/oGUBWDxYxp9BRo0LZOY6tHmSLhB
	0Ja4AgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTII-0000000CDt2-1JCH;
	Thu, 26 Nov 2026 06:49:22 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTIF-0000000CDsW-199u;
	Thu, 26 Nov 2026 06:49:20 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2FEC3403EF;
	Thu, 26 Nov 2026 17:49:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALDZI9zzoGK/EGXlQh9cjJVsMiJ6Nq8NocmOtDE4lVY=;
	b=TABOzGOxi1J6AGOAfDZT/+WS29Uy6C2yZftVVmKrm7PTlSkOHLK5XDikYwiChl5+NtFTB0
	mt0gXWk/t4zEQNHNWaVInTVHmJl3QW1DO9vFAGNlYe+OHLoSt5CnH6DUmOapf4kZwqZN32
	OQ7A5rQ7qg9cdrnDajTtt2U8pF9kFby03TKdzdcVeFZdkIGrYOEkfqGyoBtk/EBsijjNbH
	3GKgc8UFZntRHQ6DXwfGwE+kuJD5mUzP+eMacK91Unn975VSCFCkKCse2QzBC7lQLIOxEk
	LcwirsXbizh3PCuS5ug6Cw3hTcqfnf1a2GYvF5pXoA7XFfKRRGVoxZc93wMlNA==
X-GPT-Reason: This is a legitimate personal/technical correspondence
	regarding a Linux kernel patch or hardware driver update. The
	message is sent from a known personal domain (alastair@d-silva.org)
	to a recipient in a technical context, and the content specifically
	discusses hardware clock frequencies (26 MHz crystal, OrangePi
	4 Pro, DTS files) which aligns perfectly with the subject line.
	There are no phishing indicators, no unsolicited marketing, and
	no suspicious links; the conversation is a standard developer follow-up.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu, 26 Nov 2026 17:48:50 +1100
Message-ID: <20261126064909.2584729-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech> <20261125122452.3966873-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_224919_573249_DC6E501F 
X-CRM114-Status: UNSURE (   5.58  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSnVuaHVpLAoKR29vZCBjYXRjaCDigJQgSSBjb25maXJtZWQgdGhlIE9yYW5nZVBpIDQgUHJv
IGhhcyBhIDI2IE1IeiBjcnlzdGFsIG9uCmJvYXJkLCBhbmQgbXkgRFRTIGhhZCBkZWNsYXJlZCAy
NCBNSHogZm9yIGhvc2MuCgpVcGRhdGluZyAmaG9zYyB0byAyNjAwMDAwMCBIeiBmaXhlcyB0aGUg
cmF0ZSBjYWxjdWxhdGlvbjoKCiAgMjUwMDAwMC5zZXJpYWw6IHR0eVMwIE1NSU8zMjoweDAwMDAw
MDAwMDI1MDAwMDAgKGlycSA9IDQxNCwgYmFzZV9iYXVkID0gMTUwMDAwMCkgaXMgYSAxNjU1MEEK
CnR0eVMwIG5vdyBib290cyBjbGVhbmx5IHRvIHNoZWxsIHdpdGggeW91ciB2NyBDQ1Ugc2VyaWVz
LiBTb3JyeSBmb3IgdGhlCm5vaXNlLCBhbmQgSSdsbCBzZW5kIGEgdjIgb2YgbXkgT3JhbmdlUGkg
NCBQcm8gRFRTIHNlcmllcyB3aXRoIDI2IE1Iei4KClRoYW5rcywKQWxhc3RhaXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
