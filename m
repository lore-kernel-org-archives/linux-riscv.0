Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8C9EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cM8MR5nLb72nFY6IeZC6jae5VwW6AfkIP6Ck4f7oUfg=; b=My9QYICa+TPF1H
	zaiXC1uaoEJOeaaQ0sm8rlaZ+9BNYXJR79/8DsqIepMxCriUGccK8Q9gvVAGDo4VuIK+fPAd2NevR
	Rx9PVZupmO/5e4fdjDg8X0xxfd7ltYjMix/jlMsr6VZanI0kMbljV6++6qEES1PyADLL/L/HwaRxP
	1QCYyrvAWdO/C2LoNc0LllphmXKPf0qjXb7fG9C7K3spZ0E0EvRGStCm5cIsBzUCPw7+JN8+UqZGz
	Pn7VTkofDdwK+YblrTj1mPsYQPU+DzCca3dkNIgtfejdeVBKOfRjMe04Ru8zgmXfiP7XjTzZ60C+0
	MG+5bLa9GQ02GOmUynmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXR-00BfiX-1m;
	Thu, 20 Jul 2023 16:30:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXO-00BfhT-1F
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 16:29:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1030461A6D;
	Thu, 20 Jul 2023 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E376C433C8;
	Thu, 20 Jul 2023 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689870596;
	bh=vq8H8MuRdT8JCy9+BLPg0kOAxafD5sox594B5wyMovY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcSsjoIP45IJWk8hN+tZVKyy9d0dWCKEDAAkhUE5ugSw+zYqVH3rw8+78aBDeyju0
	 XP8UZhe6gOnX9/zFC4bVpkPSh+RaqHahKLwUHKsRsM5kmB2A8zgOsdbS2VwKRQ1YhN
	 jB0WSYvvcBzJKe7jRVAedREiMMgMbtIDzdzMp5Lzv6j9FBc08hAziucnW1J23E5YUu
	 734yEYv38hkdxCHOEaI7hu04LFHtqkoj4v4XcGGa1i4eN2T3YjqOOFqFC9q4R+heMe
	 w4t/jTu28elNqwqmDojcXzJZgwKdMLW1bV+DJ/7vzLwdAftL0drN00zlHnPnNzFKxx
	 wOhXvMI4ClMpg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/3] riscv: dts: starfive: jh71x0: Add temperature sensor nodes and thermal-zones
Date: Thu, 20 Jul 2023 17:29:48 +0100
Message-Id: <20230720-embroider-kindle-421180f7b886@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718034937.92999-1-hal.feng@starfivetech.com>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=618; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XYK3GgqdqOYIaRTM344ts3ulEzHjEr/ZzZ2UIiONiWs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk7E34z/ttU4S8SKP9A4/CP01/Val6K2JhLvs2SE/qWO bPkTP2VjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk/TqG/7XLH4snHP9pqx7P pcVs+bv7pPizRSFZbNlKtR0SOfM+HmP4wxXxpKzgz/auM9WeculTW0KdXBO9ubadf7JEJj2S4UQ TLwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_092958_483258_BEA35A54 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 18 Jul 2023 11:49:34 +0800, Hal Feng wrote:
> These patches add temperature sensor nodes and thermal-zones for the
> StarFive JH71X0 SoC. I have tested them on the BeagleV Starlight board
> and StarFive VisionFive 1 / 2 board. Thanks.
> 
> Best regards,
> Hal
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] riscv: dts: starfive: jh7100: Add temperature sensor node and thermal-zones
      https://git.kernel.org/conor/c/0417c587420f
[2/3] riscv: dts: starfive: jh7110: Add temperature sensor node and thermal-zones
      https://git.kernel.org/conor/c/54ab0b6b85d4

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
