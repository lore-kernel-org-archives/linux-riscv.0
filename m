Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184BB606A335
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEdeBG7z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mw+dQQKZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BjgMYnD1753G6nS0HIxoUsVjTmVmjrDa7AEu6GOhko8=; b=BEdeBG7zI5dtUMBQajS6OXZsp+
	5C6LachbaSnvqKvkxHRxXsSKtn8lG8zocyVK1KjdtE4XaIm8Rj0GNXaeT65LEFCcLcomAFirZoi7l
	HmCw1PusTs1iaXVZsrlGliO8F1rkaGYDE1yDtsG/gtxqYBXrTTdgKj5fCEbj4xbEILy9HjiYu8Tp+
	GnSFerbP97rCtKzAsNskrCDCRpiXSglCxqO+kvGqNq5UH+wZsDYUULgyQWmWS8UZAdmXXNkQiNzFo
	DoEOasrq8tAI4PVeCsmAyHNSpxMWJwp7pH7VypgDm2hKHxSPbdtt2UHrJB7iblV/P6iSl4tJU6J5g
	PYAFFEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2O9-0000000AAL4-0MCR;
	Thu, 05 Nov 2026 18:40:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Nw-0000000AAI6-0H8b
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A377941269;
	Thu,  5 Nov 2026 18:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846111F000C1;
	Thu,  5 Nov 2026 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904027;
	bh=FWTdhllvzHmd3ZCW6mBaAn9ZyTGZc5+2hwtmFkAy1xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mw+dQQKZotTnJ9SZg5xPho7MFTVjDO980yFjUxbdCbS0ncLHOjSCE2W5cdqAqQPU1
	 wo8ZvO4gWa/QjB0I0+OcdY3T7G4B9V6wsd8+2hUY9p/42M/StFjarJLVfbpOej6i3Z
	 iPbrK43GuqwauoN3Im1yHiDlY0zJTlNE9cvdG5wib1hRVZREGaJSh9Mw3bWyZJbbfJ
	 9AM81P/S2eC4tpuDZ7hHZ+rO9HrQHR2gCfwPx9GqjJlbjYFQAsR0+8TAmFkkTzRrNU
	 Lxb8slp23GhPcUeKUi2Dxhi+8fK5xyqhgg1/EdvAY6Ew3UzCYSSsoOO+p7cPo6+Jf5
	 tETwrMtGHS4VA==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jonathan Cameron <jic23@kernel.org>,
	Avi Weiss <thnkslprpt@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3] cache: sifive_ccache: propagate IRQ count errors
Date: Thu,  5 Nov 2026 18:39:43 +0000
Message-ID: <179390394385.1477457.3217607972839279522.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017151651.1138811-1-thnkslprpt@gmail.com>
References: <20261017151651.1138811-1-thnkslprpt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=477; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9lOpLeSu7E2eEt0dSM5/y+xGzK0tE1L3ZW5BvwhtpnI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuY6TmuV2Cim/PfNpYPt/jnceeXiAXfb0hbfT9r6P lTkOq9SRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSYM/wz2jW0ndPXhlxqE6R it7Atnnn37eL6hOerWws7z/zwMiVmY2RYdKCf+nn0zUnlgTdKhHTLj1z3ZA58+Z7Wb0+Xo4ZUum t/AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 17 Oct 2026 18:16:51 +0300, Avi Weiss wrote:
> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
> 
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] cache: sifive_ccache: propagate IRQ count errors
      https://git.kernel.org/conor/c/5820e9bc940b

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
