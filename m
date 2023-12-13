Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVf3iTX2EyhVfF1A2FZaRFMwVhonS21iNw3c1A7uSsc=; b=Yc61wn4HHElJm3
	+XvF5kbThxbo+gtyyDW9gcco3F3yIwD/FPqnPNp89rZBby3meyGNbsXICy7u5ExyZIIDHpQvZvSvF
	AvnF172LrYDKVFnnPZ9Z6WnDlSGMrS53B2mCD1CfgOwFVFxvGn6IVLJfjWu1Bo8B2qUhEjrZ8lHLO
	qmjh/XI5/QuoQW82vaS2w4tS5TZz20H3HsaVS/6nvb2e8xZb8xzOyDENVl4Sgval7/LmfTDr7LLwt
	7KU3sm9WGYncwKx3pD61irVR07eeP7oIny2fZ+e86tkmEjkzNSjgBIRZrFz7pTRYAPkr8Rr0646jE
	dXI0w/6NZTOJVSMjls3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRO5-00FIxB-0t;
	Wed, 13 Dec 2023 15:43:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRO1-00FIw1-2S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3AC4B81E06;
	Wed, 13 Dec 2023 15:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154A1C433CA;
	Wed, 13 Dec 2023 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482179;
	bh=hkcptZUU72QGqUIGA2u1ZtU7E07KBVFxcMF2xAvR6u4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OwCt09Q1RWJLNWO0MDuEwZGt9IkbFtgsoctzaaeO0noYh6S1gFg2cd/dUnLZ49B3+
	 LBfhqfjbjkM+nMXEcHHYLb/GJ1OUYk7eDPruZ7TbrQvOIFFpsyGYnWQL/qLmolr7R0
	 Sn8Bb3MyJXaXx3I3ytBdwMN/U6HIuMbORSty8ziKODMDvsJvJjyRku86VuHntHcusR
	 KsWfxsQeidwpNCPFPYVNwPD62fd9P+UXa2LqlNJ6EVvNybCOj9qH3TJhXNnerXfkU5
	 0Qr8yhPEXnGbVdNGhBobuVWjlRxUmHUcibXK5Fr3NtPlAXUbDwM49L+HcJx6Msf4Jv
	 8kuNMLvIJfQ0Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: (subset) [PATCH v2 0/8] Add JH7100 errata and update device tree
Date: Wed, 13 Dec 2023 15:42:44 +0000
Message-Id: <20231213-jester-rendering-dd876ef8e8ac@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=615; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uS9TPJL7JAemNHfJAG96Ozr9DLEia/BDfH/NodMVEi4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmVFz7NKPq9Wf/i82/1PJKM+a+/LLT8uEA9OVkvUemn9 XTnvoClHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI8CZGhjO6oY7/Q4IjSk3V 6/YcYg9bG7YmLFziUYICj+/dxuUfVjEyTC/9JyH07PTaME+b1znb7sXYLatmPMWka2HdpKF5XNO TDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_074302_006620_94004782 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 30 Nov 2023 16:19:24 +0100, Emil Renner Berthing wrote:
> Now that the driver for the SiFive cache controller supports manual
> flushing as non-standard cache operations[1] we can add an errata option
> for the StarFive JH7100 SoC and update the device tree with the cache
> controller, dedicated DMA pool and add MMC nodes for the SD-card and
> wifi.
> 
> This series needs the following commit in [1] to work properly:
> 
> [...]

Applied to riscv-cache-for-next, thanks!

[1/8] riscv: errata: Add StarFive JH7100 errata
      https://git.kernel.org/conor/c/64fc984a8a54

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
