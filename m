Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3475C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCquoK654Bq7qkgCXICVB/aTPrws9p33sCjFFli7GII=; b=Y3irhL5yYz9N1G
	3UT8nvspKaXfc9O/OnklFjP5FnKmDKbUpZ27dTt4uJ+yfssvE2tmb4OV/+kNhTscc9FZxTBc/MDz+
	+WUfhMeO7CFDRafgB4Ks0kHiTOjivKf+C6kSrGi2TFIeUV+2Q6syz7inAXNUiF20mqLo4ZNOsWB7G
	h7QUpS1VJIbIHf+tZnxxE4l+zmlDsb/YC7MdERL3zGYCZnCS+VQUufE9KMttBdD41rPBI8d015ZWq
	gTbfwzpt6gTgeAcdmIksHa70QxyXAIvuv/lvPRiioOBkafsTBTH7xNNC/vdoFFtCJA3Px3KT/tsZA
	A5fsMYyPRglNog9lqxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qToCa-005dva-20;
	Wed, 09 Aug 2023 18:46:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qToCX-005duw-2t
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 18:46:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 341C464421;
	Wed,  9 Aug 2023 18:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DD8C433C8;
	Wed,  9 Aug 2023 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691606792;
	bh=0PVyUV/LZNkQhPq86fn/3LqQlvLNkh8cxs/e9gDxcnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4wyRVmqY0rfTGXhYrJnCsqNhhXtYJgID8Xj6a+aJ/G0alIjdVNVA+1bW3SJvSuBL
	 i760nXOLnMdTlZFoOW4uoMnQfmBTJZouegrVhbcG7cWa7W6KeEPHWb2HA9UqMYTSgu
	 kfPXCTUoRI0mb78ZJ9dEfG7yp9TZdkK3BlsLbAqRyGoQxTlZFhLCcCZUpyWH18du5g
	 CKKEXaXmgCwvBAKlgOjyQAjfh+Cs3opfevX2tKulWLiEDf6SuvUcsqFiep+WggNH/s
	 Il/phtseAz3k4ASDEeJzySULga3xQhBZnW566Rmd5dPY+uI9EOiZXJ/4Yj8iSEj4n6
	 FHHhfyq9ScPWA==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: starfive - Add crypto and trng node
Date: Wed,  9 Aug 2023 19:46:24 +0100
Message-Id: <20230809-boogieman-kiwi-4528c4b925d7@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808141558.296631-1-jiajie.ho@starfivetech.com>
References: <20230808141558.296631-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EoQ2wQ3bzDClK5rpakCInBeyO1//Echy2oc4sehgcho=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmX7/3fvqHJ6c+Z84/mC+w8voOZt6az8/j9ZyLxrkqmy 5p/fJoo0lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJTLjB8M/yeMeHuDnrfbKO X0pnjdhnOPPXi5S/D/9aJv6cuiv0bbU6wz8t9jPRd3cGnVRcJ6Z2qul8bQSbofjV3zcVft1Vurq iqIAPAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_114633_980904_8A8E6C1A 
X-CRM114-Status: UNSURE (   9.95  )
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

On Tue, 08 Aug 2023 22:15:56 +0800, Jia Jie Ho wrote:
> The following patches add hardware cryptographic and trng module nodes
> to JH7110 dts. Patches have been tested on VisionFive2 board.
> 
> v2 - Fixed dtbs_check errors on dma node in patch 1. (Conor)
> 
> Jia Jie Ho (2):
>   riscv: dts: starfive - Add crypto and DMA node for JH7110
>   riscv: dts: starfive - Add hwrng node for JH7110 SoC
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive - Add crypto and DMA node for JH7110
      https://git.kernel.org/conor/c/e2c07765e179
[2/2] riscv: dts: starfive - Add hwrng node for JH7110 SoC
      https://git.kernel.org/conor/c/87ddf5b10964

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
