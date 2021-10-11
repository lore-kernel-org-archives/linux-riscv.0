Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB960C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 23:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452C6606A5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 23:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 452C6606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70OLl0a612tlO4jfeOKUS3llS21HGGlRKws+jxxS+HY=; b=qKuIy77yZqTcEd
	tpA1X45Zv/jkZw7qpF3eOo4dNvqEhxPQTLGX/74VyctazJBO4T5yNbDBMmulmQO3X9XG7Q4rdw9dx
	DNEVK5r9NAyRLEhZisSMwJRfd9zx8KyC6ZNlQoVcK32ikEWk1ifFqya4QxFywNyxOBFnn6rWzlXUq
	nnXlXcmspLAsUAu/juUT4S8mgB8T884eAnVEx4ujUaIQ5K5n7kFeynOIVbWKq9nfXeuuvcJzDTSGV
	dA9TZ7sYLbO3drZo4/QAmme8I5jG6WUzOTCKVNCpMcBnjubcJQZcVU7wZSSuJnArnff99nwriP9FI
	eSLI6MeDhR3zMjLWe6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma4XU-00Axvp-Sn; Mon, 11 Oct 2021 23:17:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma4XS-00Axuj-Fy; Mon, 11 Oct 2021 23:16:59 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ma4XD-0001SF-O2; Tue, 12 Oct 2021 01:16:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v8 1/8] RISC-V: Enable CPU_IDLE drivers
Date: Tue, 12 Oct 2021 01:16:42 +0200
Message-ID: <4300884.9bbH7Ay9ha@diego>
In-Reply-To: <20211011081820.1135261-2-anup.patel@wdc.com>
References: <20211011081820.1135261-1-anup.patel@wdc.com>
 <20211011081820.1135261-2-anup.patel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_161658_570515_326EEC3E 
X-CRM114-Status: GOOD (  20.15  )
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

Hi Anup,

Am Montag, 11. Oktober 2021, 10:18:13 CEST schrieb Anup Patel:
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig                |  7 +++++++
>  arch/riscv/configs/defconfig      |  1 +
>  arch/riscv/configs/rv32_defconfig |  1 +
>  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/process.c       |  3 ++-
>  5 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8de2afb460f7..d02f1f5a2431 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>  	select CLONE_BACKWARDS
>  	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
> +	select CPU_PM if CPU_IDLE
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select GENERIC_ATOMIC64 if !64BIT
> @@ -564,5 +565,11 @@ source "kernel/power/Kconfig"
>  
>  endmenu
>  
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  source "arch/riscv/kvm/Kconfig"
>  source "drivers/firmware/Kconfig"

another issue, the "arch/riscv/kvm/Kconfig" line above comes from a
commit that is not in the riscv-tree at all but in the kvm-tree [0],
making this patch fail to apply onto riscv/for-next alone.

If you have multiple independent patch series in flight, like shown in
the github branch you references, it might be easier to base each on
top of the relevant branch cleanly and after one gets applied rebase
the other ones.

That way you're not dependent on the others going in first and also
people can test patch series individually without too much hassle.

Thanks
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git/commit/?h=next&id=99cdc6c18c2d815e940e81b9b477d469bdd41788



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
