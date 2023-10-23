Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF9CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksNRgnz8CCe5DvTIIvyNvlOnZVwXKYd4FElXGZ0CTeI=; b=ARJXS3TwZbiVUP
	Vtqmn5O2Tn1UbcuZhqFhEOSjlMlHFE0TCj8aOFoLAK0X2tYp47OC5b9ClcZ+yDvC6ziRxcAkvWVu1
	tHTxWSe5I+cnPIUcgdB/ni8Knpjc5nWXAcudjKBf4M78bT1tRrH3fJ6ionyqujB5tzkE5qYeCYkPn
	MqtobaPX56YFC/LdIXp71V4Lx4eHTzhbABD3TNVbLeExJPH37Dm9lxw9zxcX6kL6in90UJz8BW/rY
	gnHKjpL5DSkbrio03EtbM2f2meeUcewwB+wGk07WK+e88oOz9QC7lgfdREPK7qXZIdJOy8T+H9j39
	1KeVJdtOGFgVooSY+QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqbi-006oQ7-20;
	Mon, 23 Oct 2023 08:48:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqbf-006oPW-09;
	Mon, 23 Oct 2023 08:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LLAJ1nq21ZTnhrh8ZIS+thX2+YPOAC3uh7BNx3S3/K4=; b=RJf6lAwrPgbn53kZMA321NVbtj
	0Ks3SzBk30AugMzXMIwVHw9EiW2Pp6YnEDkow/Gr0/Oj5gpxeciu5pm9cxAMjFhJDinr7ueEHesEJ
	JHjDcWS8EscOrdST4BZAealHDBBTWdFWrgDA9wP2Voq3z4amaH0+I8EIjOcAzUjproiVcMEJGAReF
	IEftgvyWAiiy65PziiJt27kRV43C29OqPuDLOUKERo9CjbNtxsXoimqywk09n0NUFB7J9AG6rQcdV
	uzUt9Kn9Vq6E21W0GVhayz+8tdqlx1MuTvuZy/1M8Y82WkOaS/SopzbKr4q9bxBEW/+QCCj78pkDD
	3cBRvZTA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42934)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1quqbY-0002gh-0i;
	Mon, 23 Oct 2023 09:48:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1quqbZ-0004g9-3N; Mon, 23 Oct 2023 09:48:09 +0100
Date: Mon, 23 Oct 2023 09:48:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 25/35] LoongArch: Use the __weak version of
 arch_unregister_cpu()
Message-ID: <ZTYzSQw0iLlAKNCn@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-26-james.morse@arm.com>
 <20230914154111.0000189d@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914154111.0000189d@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_014815_083598_22111DFE 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Sep 14, 2023 at 03:41:11PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:38:13 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > LoongArch provides its own arch_unregister_cpu(). This clears the
> > hotpluggable flag, then unregisters the CPU.
> > 
> > It isn't necessary to clear the hotpluggable flag when unregistering
> > a cpu. unregister_cpu() writes NULL to the percpu cpu_sys_devices
> > pointer, meaning cpu_is_hotpluggable() will return false, as
> > get_cpu_device() has returned NULL.
> 
> Thought that looked odd earlier but didn't care enough to dig.
> Seem unlikely state would persist for an unregistered cpu.
> Great to see confirmation.

Would it make sense to move this immedaitely after "LoongArch: Switch
over to GENERIC_CPU_DEVICES" ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
