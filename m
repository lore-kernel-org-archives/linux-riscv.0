Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7308EDE99C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFH5ip6GutmmQAT0tZROQzdZEwS31Lo05HVO9/t8+v0=; b=LueugDlKe+dOs+
	HTtXjqAmGkEz6ThrB3Ca4d0Wh2AGaxUqQyN40/1EGEJFyt7CBofLZhFsr0y4PtAh6pa5/35S1kR2Y
	GMMMA7IHHDM9YuAjArDNd5o+0R5MXcQ3S7Okaw9tlVEXlnEb7gVCyzJxwLzKR144JscWP3tqNDLnw
	lV5BuGicGc6HVMHVHK9KIVmqnKXqBP1wd+itiK2BfFy9gty5aVUS4tp6JvNjbM0V8s/zOOgpmyeMo
	s+fLQIPa29MSXTaOx0Xph79Ye3A0a+6qRwRvHrni9tkzd22ODeVRZ/4WlUOAE/yRPlzg2aALWwFaz
	O07wcTpuHxTfyBQ68U5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiqX-007rLw-16;
	Thu, 14 Sep 2023 09:41:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiqU-007rKz-0K;
	Thu, 14 Sep 2023 09:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=axYPg+kto0nJNL9hl8iLv0sDKfjF50COIQpJVC5Qtaw=; b=y9o36XMaTplPci06WgCoImVV8n
	d0RovaoTBpKr7gNJzrFKhK4j6VnIAfNGEuin8IgO508xznoOSAMU8v7mEyO8Q1w+d+JewjyNHztCT
	si3rOh/smfaFzgZ1LG1aC1fG/mKkg2b12fPFXvwKeITYYMr91dEWS8uOqqHoL+u1MtXPePE6i0phH
	E02qmgG+39ruqyJCugCTGUAvoCwr2dxkmbUkAPkcESni1VtABAWuHsCJbC3T7qCOZIcLZffITyvnF
	ie4bA7HGR/+yUzFkj5tEJqgJk4LDKSq+OWYx+b0Lx7uSidPZmGk5fQNwCtoBifDxNMwHZJOrNFiwg
	IFJNmKDg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47660)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgiqJ-0003nl-2j;
	Thu, 14 Sep 2023 10:40:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgiqI-0004eL-CR; Thu, 14 Sep 2023 10:40:58 +0100
Date: Thu, 14 Sep 2023 10:40:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 04/35] drivers: base: Move cpu_dev_init() after
 node_dev_init()
Message-ID: <ZQLVKv6RgH/CM75O@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-5-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-5-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_024110_141246_8FCC9257 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Sep 13, 2023 at 04:37:52PM +0000, James Morse wrote:
> NUMA systems require the node descriptions to be ready before CPUs are
> registered. This is so that the node symlinks can be created in sysfs.
> 
> Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> are registered by arch code, instead of cpu_dev_init().
> 
> Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> can use GENERIC_CPU_DEVICES.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

I think this patch should be merged sooner rather than later so that
it gets a longer time to be tested, as moving the order that things
happen in init/main.c can be problematical.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
