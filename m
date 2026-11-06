Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1167606A333
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGLEXBmC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXD1nRCq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vj7IkgwYuF2HXl55Fy9/fmLGq7uCwtvuHBz6sCALwJ4=; b=fGLEXBmCnvebnzBy5ui8gpGBvL
	k8SMCAjqFraio+31HILhBBQiVMzU1wLfs/mCExkLGtde3+9C2osm1TP2G4jzX2OHNPfT0E0WdD8Fb
	gJ2Qma85eJowD0IiR9CCQJ6T9+4LjNIu93Va/PqY32Gs0L4x7ihV9RQmibL4dsffbQJ9xu5auYQTf
	T9p6dLt1Swh7phyHvW16JvGltSMjQgWjh6rlnTezsPTcWf+yVE16/nZnGa+5QZ6CMfv7Ew05mo+HA
	tx6weyuyk2/3pf1ySnofoGDnCl4MuF2gwzjbun2Fd0XxxA23GaMIU/rCafnF7jJDeDGMVR4F4lirm
	1YB/6z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP5S-0000000DT20-167l;
	Fri, 06 Nov 2026 18:54:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP5R-0000000DT1q-2jSI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:54:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E734A43289;
	Fri,  6 Nov 2026 18:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75C1F0089F;
	Fri,  6 Nov 2026 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991292;
	bh=RMetCwXaRXymMxJ1no11BIY53svi4m6BzWuwI+r3+Yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SXD1nRCq54irp9J3Hfs2YYDDkiieUeNvywxgPrZHddyLVMreqXE+BTopeC2rnOA9S
	 t0QBBE8LiX5BEwVq/M+us1Zsq+347PwekAHKH+VsESMkthK7XdoAwz+Me5oq5KRvMm
	 ZPXSNE3cUy91iLXJXEbWc5pOZtEepW76TCC3+PcClugDohWpFgTX6LkPoIXREb2CB7
	 iGZc69fFQASDk1z0YVpWKecItYEeWEZvWr3WtKs4TaWbYxcjaA7nee2oPumgGM+bXH
	 xg7LWXVPPhk/RLk7abTwiwQatq+fSpoT4XAnbWDO/TwDv1Iu/1MmqAFK4LLQukopvR
	 QzpfIaUGTe1AA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Owen O'Hehir <oo.hehir@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 18:54:42 +0000
Message-ID: <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106184055.3891621-1-oo.hehir@gmail.com>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=490; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eV68g8YH+NUab8Y375gkc9AMM08LiYaGELIC443mCNU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFnvlAofsbYKnvK+cnTZZtdcCe0HsW8i/xxewX7WUrLM5 Vhs6mXujlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkYg4jwwMRecWnp8I96le1 /87Te6erV37z0IeCxPs797e4ilvaijMyrLldfjE8VGvSaYf2ytX1K9b/cg3XqPaarV/6Sc7lzmY TXgA=
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

On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
> The firmware turns the status power LED on, but the node has no
> default-state, so the LED switches off when leds-gpio probes and the
> board looks powered down.
> 
> Default the LED to on.
> 
> Tested on a VisionFive 2 v1.3B.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
      https://git.kernel.org/conor/c/68dbe2550bd4

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
