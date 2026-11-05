Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5627606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYJU/xyD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHqVyogz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BLrLOCXLi0sEns+nBQZUVspvqbX46R+8FwbOz7iwNLQ=; b=dYJU/xyDDNynbK5UcLYY5cHuNk
	XVee+5tPXHnPnCg91PhZCmsCyIsN/P3NFCVQPD/UhOE/uTtPengltqHG/2Vp+BQXip0rFWZ5z+9kk
	+0iFfyAMOJeQDq0bpTQnvfF/IQuannHCAuZ86i3IZRC9oFUfniNaao4+0RhV/7NfYuXjHLPjRX1m7
	5zOCnmhBrXJgK275Ui5wVmeAbzhtfZKLFOdyTKq274jDgeJKZLyizOovaV2loem0SjWUiSLAmT6vy
	6hNpshtE0gg6vfKI11G23XzCuMjRNrWi1VqNp0JaE/WehlCovHrzo+0q2cCY/4KsB4KvY+IYt4w00
	3bBmvd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ni-0000000AAEn-0qYF;
	Thu, 05 Nov 2026 18:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Nb-0000000AAD2-06vC
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61A4E6015B;
	Thu,  5 Nov 2026 18:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1217D1F00A18;
	Thu,  5 Nov 2026 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904006;
	bh=SOmm+v5+q4Ie3UaOXttJQyvUvoppMzAuwuREpO3lnEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kHqVyogzxsCRzbS2q/auJxr4pB0zr5JgupIkFB6KKutUygpmgt7VYrAQFJue/Pz/w
	 28tnsWGOvYXwsiIvV0mvvH99HGIIS9wLk5ojKNiaJxPEseODZAIjI/S9+/OXG+vIo5
	 edjll3odBTvSxADMyEGsW9kNw6/HV+F7zDPAlKLUwOjHMLMDXe77uzptrzWAF/wCzN
	 3rYvxfMIxMHsRpovZdVUIn4U2H8phrrfBp4tgsUU1wCf0cLyLXb6xQb5GriPhh3tWB
	 9IaUxHBm4vvhLY2Ccrx8ff3jMCTw1FuBwqH3d8RNAstjN5wH6aNveqfreLOEl/ADyj
	 dfJjNPhZ9VQCA==
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
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: (subset) [PATCH v5 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Thu,  5 Nov 2026 18:39:42 +0000
Message-ID: <179390394383.1477457.11835179524789645900.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=598; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1bhIAEPOqIDfQnMAOf+CD7PXBGi6CxXqji1n09U0SHw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuamnc3+cvftEbGlvI99zzNxFFX2KjW3f7uheVqN4 UzkhIzVHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI+39Ghs7leoxhfKLLlV8t zpd6lKl5OHinLuM8E3erPENP3cgOFYb/Ee/vbmH7PZcvRuvujFNhjD+3Xw3Wr5h+ZpPD811rft3 p4QMA
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 14 May 2026 17:27:16 +0800, Junhui Liu wrote:
> Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
> well as corresponding dts bindings and dts integration.
> 
> The CRU driver framework is built around the clock controller as the
> primary device, with the reset controller implemented as an auxiliary
> device. The clock part refers to the vendor's code [1] to determine the
> structure of the clock tree.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
      (no commit info)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
