Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D9CC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4ChvkSljilwiUQWADidyMGXchzCEwNmdDEHBbnJriE=; b=ldjufExBX6u0My
	qPWhnvi73lytI3ZFsnUMGv/sQk6O9DDV1bN65wzmXqqUDBT4vGr4sAxnbGxTjfGLuYQE0GS7Ja/T5
	6FaK4f4kLbv/QIT9xlHN/c2nqOxWGjRaKfVN33qwh1/nHC2lcCn16YeeusM6xiOq3FhDQkpkcknxc
	PS06tPPRzdGedTWwfswP+He3QKVci1eqXlIJmsmcnxFOsvVLa9DfoYVyUF6vMseBpAxmuyo6kJGiL
	pV4wZBESCCQ7RCNnudWwWqforFHkZchWUyLzdlcTnG6JEdUbgqL5SOJjgGe6qu/RHqNY+OfbK6wd9
	F0zObOatzmYAKrsB3YsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSh7-0000000BFV9-0Q19;
	Wed, 11 Jun 2025 21:09:13 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNAr-0000000ALvr-40fm
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 15:15:35 +0000
Received: from localhost.localdomain (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E9846340824;
	Wed, 11 Jun 2025 15:15:27 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: enable eMMC for K1 SoC
Date: Wed, 11 Jun 2025 23:15:07 +0800
Message-ID: <174965447661.1611186.10400081292030756093.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org>
References: <20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_081534_025831_9FAF0EA2 
X-CRM114-Status: UNSURE (   6.14  )
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


On Fri, 23 May 2025 21:21:04 +0800, Yixun Lan wrote:
> Enable eMMC support for SpacemiT K1 SoC, successfully tested on
> Bananapi-F3 board which shipped with a 16GB eMMC chip - KLMAG1JETD-B041.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: enable eMMC for K1 SoC
      https://github.com/spacemit-com/linux/commit/37df56ac500222384d6a6a13c69c489e01fb686c

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
