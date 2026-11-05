Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4FD606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asnHqErw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+QnTs/b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xxu/ukZMh2XPt6R5w+BPxH8s221ZzXWR3mucBkC8Rdk=; b=asnHqErw1HzWgpdpsl3ILeUnYK
	MkEh91FfQlmw0xJ+UuultJrLjKmCqR0L1BiphTLzKO8SenqSLvyMXc5UNhVgq66p6ptJLu9GhwlEB
	3Xdqz7X2xjB19fW/k4aclt7vpwIGs1V2aCORRtXFJXGx6EqMMwu3euly45X9cYM4RdIXocSbcniRA
	MbB8VFuO8UTMC0XucOIhJ3xPBwcw+MOBUALIfPMFWZws9J2J18RvbTv3HrTC5y5yooIy3gw4IZy2f
	EYmtR/FwFi1jLFA3JSr8v/Gi5GX7W3fwnluv3+LZVTUnm747orn+QEUTbYabzzwZhFw8Vlgag5tSK
	swMHBqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2NV-0000000AABV-0KxS;
	Thu, 05 Nov 2026 18:40:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2NQ-0000000AAAG-2nEN
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:39:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24AFC430CD;
	Thu,  5 Nov 2026 18:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817071F00A1A;
	Thu,  5 Nov 2026 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903996;
	bh=oLnUQHYyXdNhT+rCItNWxapzit366l65YbXVvT4t9nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+QnTs/bDSCwBN660MzQuD8wNdgtNDePZ7KoYShjfYCdpSWEoJgljS5i5Kzld/T7o
	 DE3MdPgUx9qXwr+2Vsh2YJhhmOgQXty6Hoy7WqfHoJbm92F1oZfqbrw+2VgCkzgD8y
	 lAvBodgrw0rh5DzfOeEBnKtpky3JEjkaQ/klXdDbalVZKOZN7+7lGuEm9dKwa3pvs8
	 9A1Xaw+61ORXBN4ftIhkOsrwYSg5+3fxiQJD1G2jH5+l+71BlAKDbCHZm722vCFBeG
	 khOBUNdIQL1NksOY1Zet8G8xf/C5TxbYk0iiWEBI7CL2ssL6UwzuzmGQV7yglF9rZl
	 /qpqqTZArkzwQ==
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
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check errors
Date: Thu,  5 Nov 2026 18:39:40 +0000
Message-ID: <179390394384.1477457.6429216758645730448.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YRRo86G5lO4jP2/ynMMu+/bhBF+irqBFrR4pAfSjzn4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuYkm81r+xr82CLTt22a3PPfR8yLrplwJ7esL9p3X vla+nGOjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExE/hkjw/Lw45d+Pnh/oNqp xnGXzt4VWstevtO76LuWZ9ET+7V2HLkM/yO+f9b798xa77fdnhebbuyv3W45dW7G4qSuo9XiX47 Mk+MFAA==
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

On Sat, 03 Oct 2026 00:28:38 +0800, Junhui Liu wrote:
> The external CAN and watchdog clocks are optional board-level inputs to
> the DR1V90 CRU. The current binding requires both inputs, causing the
> common SoC device tree to provide fixed-clock placeholders without the
> required clock-frequency property. Consequently, dtbs_check reports:
> 
> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[2/2] riscv: dts: anlogic: drop unused DR1V90 external clocks
      (no commit info)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
