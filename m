Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB12BEDE990
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c92mmpayFdG86un5gYVZjN56ECKHi/vGkruYwa+0MpE=; b=RGrxZgVeWRsUco
	1lL6TUGBcUcrYkxdhRWGd4ROYNUYqnFm3FWRWJnZUNycfOPBhJrvIlhojjaqFl8XzOjQY8ObvWB+F
	1uq2E60K1uDAXYEqINPTHEBPtfrxxeCDFwWAKbhaPwqUrBTmuc70vFcO7Aqgox+hiKgIevwh1bCd/
	Ux1GmItXU6mSVXITjGw8S0yrLq1BGm/ZF2mzzcDB9Vxbgih9dA6doww0qwQG69H2+UiKkk9oHsTMz
	2Ifbl78MiCG2GdHix7GhFsY9RWxWO3MDl6tyfGTCLx2Pz80VTUkBVbqHaDsG019nyvGP6Be26WzEl
	7TOj1dA7l+9Ix6AvgHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghaw-007gf6-0c;
	Thu, 14 Sep 2023 08:21:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghat-007geK-0A;
	Thu, 14 Sep 2023 08:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jFy+WxBhwYo/RJJ6gzVJec734NGNXktDMBEY9ow/Fcg=; b=hyJmh5YCPZYWVjLLnLzcQDRTY7
	ywvl6lBjVSG9cEkIBAf2Hx5RF5uYtKBW1F3qZiT64n+qjI4+g8X47j2unLXPjYgyLaN3QUwWHtWsP
	fW+ULTHC9y3lAiAwozVPKS/GyrQWD8X+T9MKu4B1WO9MHe6UcpNl2cEd5DF40Y6lz+CVxn8Asl1U5
	Bu1IWMEEoMa8ePJ+5z2RutRuCQcnGq6Lk+jujK3UBTi9GKeKgviujNSc3K8lwzCP1NA3Wa4V+Wj1c
	fLJMeHEapLIwlRAHD0OLv0kav5/UwRl9Js5aNjE1xnVdzf+oxFI1F7TJv/G3mjYqUg2VCJ7+XJsDe
	Mno7iVww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53756)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qghao-0003hf-1j;
	Thu, 14 Sep 2023 09:20:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qghao-0004ag-K8; Thu, 14 Sep 2023 09:20:54 +0100
Date: Thu, 14 Sep 2023 09:20:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 02/35] drivers: base: Use present CPUs in
 GENERIC_CPU_DEVICES
Message-ID: <ZQLCZsw+ZGbTM8oK@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-3-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-3-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_012059_104671_ECA6CEA5 
X-CRM114-Status: GOOD (  18.72  )
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

On Wed, Sep 13, 2023 at 04:37:50PM +0000, James Morse wrote:
> Three of the five ACPI architectures create sysfs entries using
> register_cpu() for present CPUs, whereas arm64, riscv and all
> GENERIC_CPU_DEVICES do this for possible CPUs.
> 
> Registering a CPU is what causes them to show up in sysfs.
> 
> It makes very little sense to register all possible CPUs. Registering
> a CPU is what triggers the udev notifications allowing user-space to
> react to newly added CPUs.
> 
> To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
> it to use for_each_present_cpu(). Making the ACPI architectures use
> GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
> cpu_register() logic, before moving it into the ACPI processor driver.
> When ACPI is disabled this work would be done by
> cpu_dev_register_generic().
> 
> Of the ACPI architectures that register possible CPUs, arm64 and riscv
> do not support making possible CPUs present as they use the weak 'always
> fails' version of arch_register_cpu().
> 
> Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
> distinction between present and possible CPUs.
> 
> The following architectures use GENERIC_CPU_DEVICES but are not SMP,
> so possible == present:
>  * m68k
>  * microblaze
>  * nios2
> 
> The following architectures use GENERIC_CPU_DEVICES and consider
> possible == present:
>  * csky: setup_smp()
>  * parisc: smp_prepare_boot_cpu() marks the boot cpu as present,
>    processor_probe() sets possible for all CPUs and present for all CPUs
>    except the boot cpu.

However, init/main.c::start_kernel() calls boot_cpu_init() which sets
the boot CPU in the online, active, present and possible masks. So,
_every_ architecture gets the boot CPU in all these masks no matter
what.

Only of something then clears the boot CPU from these masks (which
would be silly) would the boot CPU not be in all of these masks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
