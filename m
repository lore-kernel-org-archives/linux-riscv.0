Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117B3EDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhRg+SiUw9fWrVpL3R1zG7fsNLSGCQBihVZL2O3b7uQ=; b=WPpdAKPuRf21HE
	Jfj1D4jgI0ICmRsmR3woR/YxIl9WA+XKug8RE8ysvI1RTxr3xr5gOdZ/flm2whFRgJJmVMSf0jUuY
	EqKQCRDV+Kn233KbVkT+Ifel2PdegajOoT1e1HITI9v+v8t1/JdI8Z3GPE3E0B7+gZqCsKrf7GGHr
	T04SjWomYAXsGX0QUrVMR47sdPA+EHsXkAJKPowSquO3TpC4c2TaOgX2qWH9lh3nrD0saRZZMvw9W
	2R5wgi24OU1Wb67dpD5ZRfvyM9gEEW+tkvDKKlus9NaCxDONSQJzpUwanOnEac7+dc2LY3o0D63Ky
	ajG2F/jaIMXJwahRuuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ9A-0060H9-1W;
	Wed, 13 Sep 2023 13:43:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ98-0060GH-0J
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:43:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4E5FFCE1F1B;
	Wed, 13 Sep 2023 13:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38425C433C9;
	Wed, 13 Sep 2023 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694612584;
	bh=a6eJFMD7UYNieE8ipLLApaS7mzhbB7aFjI27sQ41vYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJi+xGH0yrj+npciZCHvuvASWqtk4I+kILeKP67P3Q9Di+vGZr3SGaZB12YH6aj0f
	 unXLzNF8vC11jYZncTri1Peu5A48lOmWd02PkhinYT56fObW6hnOLKwVO775t3ycVR
	 dqsmV/XSDlpYDaxBFngOszwFk5974F05Po7xOgaMMI8GfFMq4cUZ/ORh24wT7SyY9T
	 4rrNUMTLayZrnqbMyj3j0F4zjoIEn7o1QuT/KEIZ0zirf2GpnzOllxb+i8DBttOXQt
	 RTGKQXTCXoG8Gdeqxnj4RdDFiAzm+NItzHDwbqnkUeeE26oPkOockb77oUwKOl2FTQ
	 i86CCqZx/Cxbw==
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: (subset) [PATCH v2 0/5] Add I2S support for the StarFive JH7110 SoC
Date: Wed, 13 Sep 2023 14:42:51 +0100
Message-Id: <20230913-duly-ecosystem-523099962151@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gTDwtdWsXuWMdJzLCtxk+GWpTOa8FGy41bK8MQux3T0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmMe6Jmt63vkdN3PNruwzAj8ueZByc8bA+Wdn9RK5tZK M7ylLuxo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNRXsTIsMCPa/OK6Jt/p4Qe UbzmUH11/Z5dzG3aHBWLfqqvTzdR9WJkOPNyR9Dk6/cqJpcFJi/7+mPy4x7VL2sb9x7ecLGLTTO hnwUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_064310_310841_3BBA7999 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, 21 Aug 2023 22:41:46 +0800, Xingyu Wu wrote:
> This patch series adds I2S support for the StarFive JH7110 RISC-V
> SoC based on Designware I2S controller. There has three I2S channels
> (RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and
> two for playback(TX).
> 
> The first patch adds support for the StarFive JH7110 SoC in the
> Designware I2S bindings.
> The second patch adds the ops to get data from platform bus in the
> I2S driver.
> The third patch adds support for the StarFive JH7110 SoC in
> the Designware I2S driver.
> The fourth patch fixes the name of I2STX1 pinmux.
> The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[4/5] riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
      https://git.kernel.org/conor/c/4e1abae5688a
[5/5] riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1
      https://git.kernel.org/conor/c/92cfc35838b2

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
