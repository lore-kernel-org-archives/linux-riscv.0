Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED8CEDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFl1QjGimum/4yS8wRCR0YvcUtWKwpqjbRdlgKc27/U=; b=y/kzLPuxYKB8rq
	hBrUm8V9tyg1AuAp+X8ttax9Ox35cjWz2hp1N1xNBnBnwCGVLg6eBPlCS1hEVbO+zFqwVDZxvw9Oy
	R34h5tjxhGBWc5Y4TbHreDEUU0eNQLV4Cx5PqpQd+ZhxvnDiAk67c8lZfvNNctHaD9Nf+iRXdQ8zA
	WGDnuV5vsOt8cVJjj7gn40t3kdmIoiCFABsY6sfGeZqDNcl4MqEi6g+kZoLeuxRuJypfh548ujtc7
	Q8290TU3n1ayI8iaasdXfCEnvDEA2t5mCjoGMXQd1xw6LjAUcjGnFpscL5yJL+5OXBc8GEJaKMi3Y
	4qz7QcVw3Zf92cAN8VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ93-0060G8-1O;
	Wed, 13 Sep 2023 13:43:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQ91-0060FU-0P
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:43:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D9141CE210B;
	Wed, 13 Sep 2023 13:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC45C433C7;
	Wed, 13 Sep 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694612579;
	bh=lFraKzdNfExngIGaIv/1K58suMvu++hc1nKgmQ0iXQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRikp+ctqfYM5nwvev0vmw1nveMqm+sw2yKSNsonXUlMahLHJF7ucVKX98G+txgkF
	 K62GisiU5xPDXcLI3UFlKnlWPITWbX1U/JVDNda7o/youuEm8H+9bloP+KKgtxSg/A
	 X6UYHNWPxzK5lCS3s8ZN1efrBbAiDUcTjWzSPaTtZy6/lsM9wgn+TokLNJE/16/sue
	 QTLIQIe3fIlUkdLIQejJcLZuTcN39IAZ3m9h9hyaZwa9nCu/Uk+f7NaedFkpvWLQ1D
	 +gErPJokNMYPNKZMwbzOSJ0NwRqlNVtx1i7N4S3pSGnaIg0MbvE9FxtfjydPgsARo9
	 hISqQFw6Yyd8g==
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
	Hal Feng <hal.feng@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Add PWM-DAC audio support for StarFive JH7110 RISC-V SoC
Date: Wed, 13 Sep 2023 14:42:50 +0100
Message-Id: <20230913-capital-skiing-1b504653358c@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814080618.10036-1-hal.feng@starfivetech.com>
References: <20230814080618.10036-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=675; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Dk53k5rmUx7nlZbwvEoZddi3urCZf9sprXbm0Xahd8U=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmMeyK38Vg8XDP9ycTFbhttxeYbi8ZVxB3kv6naNlV07 Y54m2jdjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyE6zIjw8EjHkdOMK3dId06 X519wpIDtUduBKd0XVTdxXxueUkrQyAjw9Ukc8aOR8/Ej4QYbfjN/GntYbGKDS+/zVA52tc/WSY 3kw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_064303_341321_102C4D0E 
X-CRM114-Status: GOOD (  12.98  )
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

On Mon, 14 Aug 2023 16:06:15 +0800, Hal Feng wrote:
> This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
> The PWM-DAC module does not require a hardware codec, but a dummy codec is
> needed for the driver. The dummy spdif codec driver, which is already
> upstream, is compatible with the one which JH7110 PWM-DAC needed. So we
> use it as the dummy codec driver for the JH7110 PWM-DAC module.
> 
> The third patch depends on tag next-20230809 in linux-next branch.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[3/3] riscv: dts: starfive: Add JH7110 PWM-DAC support
      https://git.kernel.org/conor/c/be326bee0937

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
