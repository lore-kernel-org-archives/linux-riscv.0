Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D607C83F0A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LFpiU0Aav/GLyo3ERrNV8ectWhNN3+8CBqtpuZFO8A=; b=htFzjjYT+13C2i
	YsdQ1YYP3tbLQ4aqS2OmtenlUwDn4WIRitZv/l1LD5InUHxpP848Wji2FFa2CcQLFs+uGUnKyFM7T
	94s2IJgXN116LfUDzqNVpAyr9TY1fFOvrABvQrkfityPPdGA1tyetbFceAuZRsUkAM8xEDai8cAUq
	zkCETlAM47rdd4Ce0k467VFsX4szpqCvaWyxCXTLm4Mwq9O9Ab3q9e+Njm0ZMNYwJyF5KToUFqtPT
	k/O4ZbSPcR1JElut4jCxOfC7KUCXbPeLVnxG6Z5a+s2dMfJ9FWKDtYd2oh8uo6OzQVJOkje4ThVqs
	om69LMidCBgPDbBX5Cjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBtq-000000064x1-2eWy;
	Tue, 08 Jul 2025 17:14:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBO9-00000005zzc-2bTh
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 16:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB0D6143F;
	Tue,  8 Jul 2025 16:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFA4C4CEF5;
	Tue,  8 Jul 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751992908;
	bh=rdhMhDbDsUjX5hjIU+cPezj8rvV97MeHEnix0pjd8uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvoO2R1ocwBu3BcUOR6JUthSRVHALJHP3DmQaDLCBk79STEH2VyJD0xBK2AJp5A/W
	 q0TwEC8ZFJW1veRmOMT33V5fUeqMARCvOa7aEm5nMtYvXF7reYMt7A8oEyhyU+doMe
	 wjqdG5W1wpSlo6A3fiqMzuz2NOSIjZsLkj1Ne5hl4PUvdbMNo1dKvrG2QMw+Lqjckd
	 aVS1vAhBB2SHXlYXXDQizdcFW1sxemkSydjJUhkzt4sHAESQ8Oj81Go54x2rI7axDJ
	 Oa8zJ++ewGd0tFPQ/+QctMy1zZCppeQ04Y0XUSqqm+38e9W+EEhCcgGwEQAg4Fnqch
	 VkFJXqFBOSyEw==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: spacemit: enable sdhci driver for K1 SoC
Date: Tue,  8 Jul 2025 17:41:28 +0100
Message-ID: <20250708-doily-concise-12620a7ceda5@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250708-02-k1-sdhci-defconfig-v1-1-73c631717338@gentoo.org>
References: <20250708-02-k1-sdhci-defconfig-v1-1-73c631717338@gentoo.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=95Fz3TVw+WlzEnWMLxXYtXF67YYqJlPsPN4hDfqsBVY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBm5XtauXyYuEzncynLKUyByqX10zN6dH3uclv1p22kvZ 5T3eIlfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZS/YuR4Wbz3XxHiZt531Yb WYif0l6e3rffy83n9Hylj09279E468rwv6ZmTvKRBStSOw/f71O0OlW+ITjkwgMVy9c5W3O7PTZ lsAAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Tue, 08 Jul 2025 09:44:56 +0800, Yixun Lan wrote:
> Enable sdhci driver support for SpacemiT K1 SoC, so eMMC storage
> will be probed and activated, Tested on the Banana Pi BPI-F3 board.
> 
> 

Applied to riscv-config-for-next, thanks!

[1/1] riscv: defconfig: spacemit: enable sdhci driver for K1 SoC
      https://git.kernel.org/conor/c/0bb48ad676d5

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
