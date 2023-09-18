Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBE1C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXOTTuJt8sspyxEO+nPDI5WJ51dJkj64BPjZP7Nzhl0=; b=z7nRjFmrzAA8de
	AXIMKuc1rOpOdH3YAf10uaHhkU0//b7Hs5SYWNdD7aXcQIsEN+jpEaPUrkN+cezN4lCbJkknTQSvx
	sEi1pWnM1KzQHgbNgcyI3SoUcXN90gc9ZkmBaxRKo4LxztD0r8IjtbbFTULKZrMc1I5IwT/j2SupO
	Iw6tNd8Uar8Dj4r2kfIJtYn33v28Y7a41obiZut0vO7oDF4eJt8LfggeM2qyuNu63eKraKV71Nwcw
	uY7Cig07LN0mWdyqUTcsro5/5W6QQsT6wFqA7rDKZFnsL9aTaFbpkwCpFyGte65ginhnfKRxthlRn
	PijicoTy/GIALcOmhw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBTv-00F6UN-33;
	Mon, 18 Sep 2023 10:27:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBTs-00F6Pb-21;
	Mon, 18 Sep 2023 10:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JpmACuKzLEySkiefvR4XEzLq2l/GD0gp2bnZ8kEBIFI=; b=kVzQ7/vwTnpP+CIOcOrHaveVQL
	sLK/dUbflp5AVZCi1NjTN4vGf0n8ODQ7+WX0qtIA+7Sj8W67e4mukT7UakvHTeQdXmkgGSHuD5qlA
	hrSjKimLBut7aaQ14th62KlJ7yiOPuQc4rl7JsKxe0s/9reJwnUuY01QSW/vr6EANjJKVBe++3mpj
	ePhEwkrYE2JyWBt0U0Utguc04Ew3fBOT2gmdqMGE/JseHq70NaEbGE7t+Yc6zjLSOXMHhyz8rkrp3
	qCRkwR9dMkY8mB4getceyrmE3pKMTQIEtRvNZUG1hYZEd24ULHMIsy0/3v3OM9HvXiG2d2pib11lA
	dMSc1aMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34502)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qiBTj-000059-36;
	Mon, 18 Sep 2023 11:27:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qiBTi-0000Oe-EM; Mon, 18 Sep 2023 11:27:42 +0100
Date: Mon, 18 Sep 2023 11:27:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 00/35] ACPI/arm64: add support for virtual
 cpuhotplug
Message-ID: <ZQgmHtG10n+XyZYR@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_032752_689269_5DB8E046 
X-CRM114-Status: UNSURE (   8.86  )
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

On Wed, Sep 13, 2023 at 04:37:48PM +0000, James Morse wrote:
> This series is based on v6.6-rc1, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/ virtual_cpu_hotplug/rfc/v2

Hi James,

FYI, this doesn't seem to be based upon v6.6-rc1, but v6.4-rc5.
virtual_cpu_hotplug/rfc/v2 seems to have a hash of 505859b05e15.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
