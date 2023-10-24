Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2671CC00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tJHm/KGFsVtNIUsVAE0XInupFGPSMQZZHgDWbPBBaM=; b=GxPHRuYTizlULk
	STvbWTqFOk/EVMIHfYp7+Q/gEFgkW5CBn0M4R1pzfUgMFtzRNC83GuViYjfpKqmLnk3syIfReo3i9
	u4pCEdEXPzrD9SFxrk8vTNEdw4Vxv0Z/b0Cfuf4I5stIZZTY5e3auhs716/hLr2oI1ns5vTLmSmw4
	LAhUliuUNRvwTznYnWHGH3jp4qWJUnZXyeoi5PLgYg6v1VnyiS924rRAMIyaB67kF4QJT76PjPQ0h
	a/5lRjaTeHQFHlW7FrffH0Q34FJ6tgbqgv32iH7vbNjuN3lKcdN0LtbrVv7Ix30fcIOKYA+Io1OVY
	a9e8YZmN6xbgqCRc0QKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJrb-00APYb-0t;
	Tue, 24 Oct 2023 16:02:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJrX-00APX6-2E;
	Tue, 24 Oct 2023 16:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA2D2CE2288;
	Tue, 24 Oct 2023 16:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C019C433C7;
	Tue, 24 Oct 2023 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698163353;
	bh=F7gFThJKXxRz67KtPOHXZ1MPyn546aHaKsuQ7HB3hqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0VPiT0NaPFcpVExXTrkeNQPAO04ohPxAd37DPcoJLpOtXMCCjTbSvuBTvMKm6fKL
	 7+97TChy1Rw9XyE2D4xj290syTx4P7Q0qI+cUomEuI1s01Fdc+0+On0HONlKTWh43O
	 JYqW/Fa9n5BmP1kwOrdU1rcoFgbCPjndXNvWvCiA=
Date: Tue, 24 Oct 2023 18:02:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 38/39] cpumask: Add enabled cpumask for present CPUs that
 can be brought online
Message-ID: <2023102411-ascent-plot-04fd@gregkh>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <E1qvJBk-00AqSW-R8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qvJBk-00AqSW-R8@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_090235_921213_186DCC37 
X-CRM114-Status: GOOD (  20.52  )
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

On Tue, Oct 24, 2023 at 04:19:24PM +0100, Russell King wrote:
> From: James Morse <james.morse@arm.com>
> 
> The 'offline' file in sysfs shows all offline CPUs, including those
> that aren't present. User-space is expected to remove not-present CPUs
> from this list to learn which CPUs could be brought online.
> 
> CPUs can be present but not-enabled. These CPUs can't be brought online
> until the firmware policy changes, which comes with an ACPI notification
> that will register the CPUs.
> 
> With only the offline and present files, user-space is unable to
> determine which CPUs it can try to bring online. Add a new CPU mask
> that shows this based on all the registered CPUs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/base/cpu.c      | 10 ++++++++++
>  include/linux/cpumask.h | 25 +++++++++++++++++++++++++
>  kernel/cpu.c            |  3 +++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 2b9cb2667654..f8bf1d4c7d71 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -95,6 +95,7 @@ void unregister_cpu(struct cpu *cpu)
>  {
>  	int logical_cpu = cpu->dev.id;
>  
> +	set_cpu_enabled(logical_cpu, false);
>  	unregister_cpu_under_node(logical_cpu, cpu_to_node(logical_cpu));
>  
>  	device_unregister(&cpu->dev);
> @@ -273,6 +274,13 @@ static ssize_t print_cpus_offline(struct device *dev,
>  }
>  static DEVICE_ATTR(offline, 0444, print_cpus_offline, NULL);
>  
> +static ssize_t print_cpus_enabled(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_enabled_mask));
> +}
> +static DEVICE_ATTR(enabled, 0444, print_cpus_enabled, NULL);

This needs to be documented somewhere in Documentation/ABI/ did I miss
that patch?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
