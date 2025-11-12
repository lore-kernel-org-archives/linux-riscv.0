Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B683CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 06:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2htwDHwIOnOunV+M/VpZbv1NUE+PonI6VyGk5pemkU=; b=qW5Eo/Xw/xH+DC
	CEkaF0Y6w/d6sf5xX4n6ES7ENB1VovpNBovuVtAVwXuL1d6ML0FWZJkV9ekrTKGmWdtJ5nLk5AA18
	I+6rRX21PTFYFxqGhgRAOTqndIIOSyuRJuMfTsBLvqnlnfGq3g/9I7sC6uyN/H8b5KwUNgnNBiUQt
	5DLCSmMf3HB8iHZfhKsa04k8p7/o+CIGl1FbbiMlp8NWcH7mHDZnlk8wB1BCWJUba4OpDMgfuOzTX
	L2v+6wv1Ca5fyagkZJ/1uLjlVHETQwy+lBfXdSVOBLW/8AMKOEEuF3Btzm7coItFLTrHe64Vk070c
	ra+GxzkcfUWMAKgoVovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4W9-00000008DRU-3fb3;
	Wed, 12 Nov 2025 06:39:45 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4W6-00000008DQs-0ssp
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 06:39:44 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D3A86340F28;
	Wed, 12 Nov 2025 06:39:32 +0000 (UTC)
Date: Wed, 12 Nov 2025 14:39:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/2] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251112063925-GYE1677982@gentoo.org>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_223943_469511_9C78E083 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Michael,

On 04:44 Wed 12 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> This adds initial support for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> What makes this board attractive is its 4 Ethernet ports
> (2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
> and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
> PCI Express bus), its small form factor and its attractive
> pricing like other OrangePi boards.
> 
> What is supported:
> - Serial console on serial UART
> - 8 GB eMMC
> - 2x Gigabit RGMII Ethernet ports
> 
> This patch series is based on Spacemit's Linux tree,
> "linux-for-next" branch [3]
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Link: https://github.com/spacemit-com/linux/commits/k1/dt-for-next [3]
> 
for the series

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
