Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93F3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI/rortbnopWbqGVNFa+esX/YGUucpl2Qd/GwrrdCZU=; b=3CIFa0I3BttCbb
	pn7P54WKKkr2EtZ3gAP11MPd51fJJsJeuk2AZm1AS/q+MUZRUlGFmehaEHBMeDW6e2nm8dvswMkv+
	7RlZIWAdRu7qrz20ewFW7VpGrXOJ7sC2zIu6S67lzsh5QUtfpEJwZ1N+KS1gOgscSOBNokrxdnuGR
	qeV34l+RFS5ZT3UYbBoeprxdh/tKoYJngwWaO0NHVG6zhoO/P0iSnhqVBJx39qDzMr6HM60ZKctIA
	vPKEKO+0gnFmAsQb7/unb53GJU/1gxWDjVXwruE2CRFAdZyEvDF7v9Rv4EW2qYziKR4RbuYbzGQN7
	zVGqnhzLFKyHOVYAHGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nblWf-001nKj-Om; Tue, 05 Apr 2022 15:55:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nblWc-001mok-IH
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 15:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H64sRER9IZxDyAABR4li+balZ2bAMiCWiOIqNVvYBBY=; b=nH1T1WK2+6p6RiVuFqClvkbtlZ
 wu20h6W+A0u1TMyE4EWPfYt+dCJMamgFgGcc76SHE6KoU0ySg4GgDt/kjBuWx0oyXhNmMs2xedJiA
 WQBKzH/D8HaKeANKX9AYEsqJuzn3tkdcXbx+BA9xlqtvL67ZlpfNeqmn/XldV2nbg7zmjWXLmXOFS
 cF6616bnLDA0vuBw+kG7gFpwWBVfPppYjnCKpAGngtxeTWugWeSn8YxCFGodEyKfTXfrW5FHsyooF
 C04ziHmT0t61kh/DM+DfUlfVb6YyWDB3ezMGBHMOv+SD13k61FsHDVua/Z7WaFKQi2UcTmOO7kZ5w
 aMmaUQQQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58130)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nblUS-0001dg-Gd; Tue, 05 Apr 2022 16:53:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nblUQ-0004JB-RD; Tue, 05 Apr 2022 16:53:06 +0100
Date: Tue, 5 Apr 2022 16:53:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <Ykxl4m1uPPDktZnD@shell.armlinux.org.uk>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_085522_913303_74C5E5FF 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
> Hey,
> I seem to have come across a regression in the default riscv defconfig
> between riscv-for-linus-5.18-mw0 (bbde015227e8) & v5.18-rc1, exposed by
> c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt
> machine") which causes the ethernet phy to not come up on my Icicle kit:
> [ 3.179864] macb 20112000.ethernet eth0: validation of sgmii with support 0000000,00000000,00006280 and advertisement 0000000,00000000,00004280 failed: -EINVAL
> [ 3.194490] macb 20112000.ethernet eth0: Could not attach PHY (-22)

I don't think that would be related to the idle driver. This looks like
the PHY hasn't filled in the supported mask at probe time - do you have
the driver for the PHY built-in or the PHY driver module loaded?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
