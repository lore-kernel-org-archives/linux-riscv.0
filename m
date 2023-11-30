Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559D6C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWz0jt5BBzzGsXLquln9Ays92xA5Rilf5M6WypHZq+E=; b=p9E6thVChcELuN
	QBSDQkGzw6EBQA6Du7Mob1C5dsN1saad6cdQW3ob1FS6Yex/Diox42uiqxYemySgRMRjtLDnGZFYK
	AGedj4w6sb0FC+hRtp3xRx8HVSI2f7/i2ADJ3m+3pgoPJuyPgMbKVyUR/dOCBfi44wUK/L+19NMyp
	VncoK0JByatTPNthPdN/fat3FQncElZEVDgp+pq4/brF/mY+aA/SI/0Sqc9NwXE+ayupPzT0rFV5V
	hUobg6bFa8elXjB6ogxPyL9Ih9Tq8YPlaIe5Av9V8ju7yVmpeURfTcyPtbUalVj5nf+hm8wJWifhx
	qh390nG7xSGSkK4TnOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fu0-00AoGF-1Z;
	Thu, 30 Nov 2023 12:12:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ftw-00Ao1g-2e;
	Thu, 30 Nov 2023 12:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2TjoRav92l6lGBHcgQ1IFwrVpqblxm0gDdEjjO9i59E=; b=GbSXqQ+vl+tK08waHI4y515wqP
	Q86qDI1AgJw1pLC5ZapIOzsHoJpbnsFqID0QXfxFNjS8NE1MxyGJvaPAqP8UXgXPG+OkIiwqvFlE5
	DgMw0T2oet8bb4vL8QGSd9PVtRm2H4WDDGvigxdO5dtwqWYIgGY2ZdIGbI4X/r0gW1UEzOMr2Dmde
	viBSuF8wOnZothwOKj7mlCWoQjHiCqAqz6lM/4ThVWLIR5o09TLvAb3QvQ8+pRelrxSE2XAmAfbqe
	GcIF1ksl2SBgzx/SYAZ9ZHOSd1E0v1qAotFN0UA7XzmyxTTFDemZpu8Qw++hpXqEzqrc9ikD4vd5b
	kcwkIMUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51064)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8frh-0001gG-1i;
	Thu, 30 Nov 2023 12:09:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8frg-00050Q-P4; Thu, 30 Nov 2023 12:09:56 +0000
Date: Thu, 30 Nov 2023 12:09:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
Message-ID: <ZWh7lA9+goBzAprN@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
 <20231128151115.00007726@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128151115.00007726@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041216_877873_44F6F838 
X-CRM114-Status: UNSURE (   9.83  )
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

On Tue, Nov 28, 2023 at 03:11:15PM +0000, Jonathan Cameron wrote:
> On Tue, 07 Nov 2023 10:30:30 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> > arch_register_cpu().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Ah. Or previous patch needs a forwards reference to the tweaking
> of it it here.
> 
> Maybe just smash the 2 together with a Co-developed: ?

I wanted to keep the two separate to preserve the authorship of the
individual patches, so I'll take the former. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
