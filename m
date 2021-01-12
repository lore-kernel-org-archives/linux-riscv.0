Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547BBC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 14:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96E322E03
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 14:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96E322E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M78ElNjr9jAd6g6NCL8iIQoXhPAdtG1f6EeJBKK3Foc=; b=HVUv3+jAKMGdKs4KV0IKFQHgC
	VZ9n1nY0+HR8vhLfWAx7oHShh2uZYDbG7EhlCpSfCRUrC/7poze94YwAYXw6lStwzfOQKQomFm3+W
	79Xd92wUtEJlmpGZAM02iRb/xAXoDr7m3NL/ggXReXP0GyWKT56vAG50Coq66scnaFalcYuLfYeUo
	Sd/sBAFKU5ipJKSHANzZvFFwbOH60oHI88ZhygoK13fE7HJDx63mYmpXGXIaF8190unuebc9pJ1Z8
	QIhW/r7Sfsyx7uYDLM+qPGwyNvKxe5qapsmjsr+4jJDjPECAV4QpL/6Wx0JhuWsWGIsQSHJHb97LL
	Nw25xawog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKIQ-0001mE-Lz; Tue, 12 Jan 2021 14:05:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKIJ-0001jT-Gx; Tue, 12 Jan 2021 14:05:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A42AE22CE3;
 Tue, 12 Jan 2021 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610460310;
 bh=YIZSFd4ngdBu3d+V+tCrhUDlUF7epBaWbFsCZCkzGJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+ljzYYL3QMPhhApX5VwhFNyceVrA27EHM0FStNvwzUR1cQ7GFOIPOcEYTO0fdDaA
 Kj7O7lmy0yWuWK+AZisJL2LrmlkoM/j63MxdM7S787vyvaT4LD71jTgKDStmGrzxuQ
 L0/NqqEzqp6wU8ndgl0gsmTuxMJL2Vz98cUyPebone1iHGoyH3HLXEv/yY8kVzE9/C
 3JxXpkug6tFhHh2/KJ9Ii5coAgelm+gr542ObqppAE3GEOphOgXDNiAJFxaofg4s3u
 N68pjfATVrUXDVMPlwIcydiug5iK5JLd2AIK2alwIqlmLf7Si7Qy4TLd2kqk9nbCgG
 c2IYKYoLXP3bw==
Date: Tue, 12 Jan 2021 14:05:00 +0000
From: Will Deacon <will@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH v2] arch: consolidate pm_power_off callback
Message-ID: <20210112140459.GC9277@willie-the-truck>
References: <20201227140129.19932-1-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201227140129.19932-1-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_090511_764957_B01A3DEE 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 benh@kernel.crashing.org, linux-mips@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, paulus@samba.org,
 linux-csky@vger.kernel.org, hpa@zytor.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, jonas@southpole.se, linux-s390@vger.kernel.org,
 sstabellini@kernel.org, linux-c6x-dev@linux-c6x.org,
 ysato@users.sourceforge.jp, linux-hexagon@vger.kernel.org, deller@gmx.de,
 x86@kernel.org, ley.foon.tan@intel.com, mingo@redhat.com, geert@linux-m68k.org,
 catalin.marinas@arm.com, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-pm@vger.kernel.org, msalter@redhat.com,
 jacquiot.aurelien@gmail.com, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, bp@alien8.de, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, christian@brauner.io, chris@zankel.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 27, 2020 at 03:01:28PM +0100, Enrico Weigelt, metux IT consult wrote:
> Move the pm_power_off callback into one global place and also add an
> function for conditionally calling it (when not NULL), in order to remove
> code duplication in all individual archs.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

[...]

> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index eb1b15850761..ec4cd66dd1ae 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -53,6 +53,16 @@ int reboot_force;
>  void (*pm_power_off_prepare)(void);
>  EXPORT_SYMBOL_GPL(pm_power_off_prepare);
>  
> +void (*pm_power_off)(void);
> +EXPORT_SYMBOL_GPL(pm_power_off);
> +
> +void do_power_off(void)
> +{
> +	if (pm_power_off)
> +		pm_power_off();
> +}
> +EXPORT_SYMBOL_GPL(do_power_off);

Could this just live as a static inline in pm.h to avoid having to export
the extra symbol?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
