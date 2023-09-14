Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1357EDE99C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teT2VEvIjWrimIGpx9CbJJiF6TP0IKlZiqJFMvuIxUM=; b=Kjy7lHErS/tVub
	hmQjUlP+Hbj2xqFecAfDnnLcSOKq6QoDaEacpaXRSwKjAdzP+lWImiIct91pZzrdE7TVLpGlLlmep
	wm0j+e/vx9mIz0Sk3+dXa99Mgx4AAVsYZHH3cpAejPMiJMoSzH1sH7rFIhWXGlfmeE283N7kOvotH
	PltdvAuQbMK8UueXzN3kbe7CQrWXBswO5YeU2oiLuj8uGJxauzCxwbk7ipBMSP/1H9sdVfZMvnOTh
	Q1DhwO3h9yRazdZQo8BATwgYHWrGg1XKac4h9tIZ5gZlkyFE6J6Vgr9AEM3h5I7t4fi/kkAfwiHFI
	NDiYtFr8YHJEfPXfI10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj24-007tAy-1y;
	Thu, 14 Sep 2023 09:53:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj1z-007t6r-29;
	Thu, 14 Sep 2023 09:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kjCoeFUXcWqdbQ4ytSudIB7XxdSYxvc86vXHZmkFftM=; b=rhzpvQlxSHf24Gd5N7JBIAIQdh
	dLEtXRF4OgBDxIlF5hWj+Cx8mp2MGZZVwpoTdcH+pfAHOWXtY/OvJz5ZjdkVFlguAoh9uJJDY/DgI
	6E+xe6xX02/J2eLbxvTxpvoYoAtVzmM3RqqHQEbksCz7wCDyta1Y1ZAx+QFISaWA4/fr3p7eqVBPg
	BqjpJKJFZN4dpbfl9WPXpG0nVqeZiI5ysbUSnNvxOLprDrJ+htXi6/VlBsZJQVTxJYvBVBsTjQkaA
	mOcj/oH8B4WaaVrenHXrDU0VgvPmsS+IzB/Iip4ia74aT5CqJrhqDtAh8KXGz4QZK4wTVVvY9SYgz
	ZbFDsgiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36094)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgj1u-0003pI-0M;
	Thu, 14 Sep 2023 10:52:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgj1t-0004ee-CA; Thu, 14 Sep 2023 10:52:57 +0100
Date: Thu, 14 Sep 2023 10:52:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 05/35] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
Message-ID: <ZQLX+XEe2gD/btaQ@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-6-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-6-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025303_708169_70798290 
X-CRM114-Status: GOOD (  14.36  )
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

On Wed, Sep 13, 2023 at 04:37:53PM +0000, James Morse wrote:
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Assuming other architectures do similar to x86 (which only return the
error code from register_cpu()), the only error that would occur here
is if device_register() fails, which would be catastophic, and I
suspect the system would fail to boot anyway.

Downgrading the panic to a warning at least gives us a chance that
the system may come up sufficiently to examine what happened, so I
think this makes sense:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
