Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F3CCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30cD1GJwgNdKoNm1qxnSWh+gmsIoT9yYaTxa0UJD+OY=; b=hPLcIMhRXrRVzZ
	P5YU84cDFDUIFRIrs5xMF4qQXCR6Ekdt3cJcQEYZByrDroxv8ky41EEdJAzYhREDhnd5fBE1aABwd
	zARAxZJOiCHvcwLbyaRlUH+zqKi57SoNdlgVkvsKMO43yvZIHunt3+CSQEde8ut2C8Hx/BZ/8XYHU
	pkH4UmIngAEe1xD795uLfvCLQPvcM8qNSnjmMyZ1WMduyuSx+jnFv2xr8Uk0738W4r7BvDR+2J/pq
	SuWcdIQySJF3ps0At2YVxga1FCwxKPfmYWUsFtLWQDHGEJZWe2Jcl1PTuzyZPfmiTC1Zx8wOHGGw3
	WEoNh0qNSZSLJtqrikyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sef-00000000plh-2c8D;
	Mon, 06 Oct 2025 21:22:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sec-00000000pi2-0Ih0
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD24545F8A;
	Mon,  6 Oct 2025 21:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E895EC4CEF5;
	Mon,  6 Oct 2025 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785717;
	bh=KaLZw6EnRFqDo1Q2vZRWuIPK9V6qjnWoh4bOBSt73+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JtlKtv1wmeNw3UxPzsIp69DSuFSfRMYN/4neNXoDpRqyhzJZiZyaum758KpSm0/oN
	 jh9CDMTymoroGfg06d2uXrXah3HEHSEtPJ9E/Mfbi3ieAX5YtAQCY8pogTDeFmcvhp
	 DqlKjgxCT6QAVzK6F56ALzys22spnpY4uoMC8Eisj2FzBFRw60RTuMKwPTcny0D13g
	 uzOi0cSHO4r1v4sV/tA8uSmKWYc7SA6fEc8/JfoWv1uHpsDMvV2u+B2tIg0i0TkThn
	 1qeFTTD3EF6rcGeOhdeNe8URLgoWAUcUjdn+UsBlKmSXkBuodo0wCeFryYmRzrgerV
	 mWmHfKI7ZfSrA==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:48 -0700
Subject: [PATCH v2 8/8] riscv: defconfig: Enable Tenstorrent SoCs
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-8-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_142158_190498_49A800D2 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Enable support for Tenstorrent SoCs in the default configuration.

Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 7b5eed17611ad2260a28f9fe9985b88682eb1ebe..031d8f8f6e9d278eb802d195111f1cf9075b076d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
