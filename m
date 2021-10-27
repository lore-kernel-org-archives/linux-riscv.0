Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96421C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D6B60F38
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49D6B60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libc.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvA5z9TdGblpN0OsJqt5IqVc4YD/RIqD+5BEcBy4iyg=; b=iddOGYyVere7Rx
	Xxngcyol57KjhjACPW8XZSm8QPX9g5dqozJ5zEXcwM8IVzM/uZoFQl2liJy+xcev5F76hIPHgsTgo
	1kXShxhd91tnjUiSzJTn7VrAasZSlrlJ0Myy5K9+t+L1e6xuP8fiFQB8hA2i+okkcm3PXNMQvHuav
	FPdUjzzjY9wobWVHaWIuMSZLzMPOXuGdtiOx31suAHrUR7XP42MgZaEtqfJWDqp3mTq2fUcWBItY7
	Jh1Mue1nw0zTzkHAePNz98QpwMW9K5bvIZ83JEJJrvFE/67hGWIKRT0IuNnZn85MKEapIElaHhiPL
	QTfTHpg8GXZaGjjkbwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjte-0056yi-Nq; Wed, 27 Oct 2021 14:27:18 +0000
Received: from brightrain.aerifal.cx ([216.12.86.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjtN-0056t9-Tm
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:27:03 +0000
Date: Wed, 27 Oct 2021 10:26:54 -0400
From: Rich Felker <dalias@libc.org>
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/12] sh: Use of_get_cpu_hwid()
Message-ID: <20211027142651.GW7074@brightrain.aerifal.cx>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-10-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-10-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_072702_686906_4EFF4B1E 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Oct 06, 2021 at 11:43:29AM -0500, Rob Herring wrote:
> Replace open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/sh/boards/of-generic.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
> index 921d76fc3358..f7f3e618e85b 100644
> --- a/arch/sh/boards/of-generic.c
> +++ b/arch/sh/boards/of-generic.c
> @@ -62,9 +62,8 @@ static void sh_of_smp_probe(void)
>  	init_cpu_possible(cpumask_of(0));
>  
>  	for_each_of_cpu_node(np) {
> -		const __be32 *cell = of_get_property(np, "reg", NULL);
> -		u64 id = -1;
> -		if (cell) id = of_read_number(cell, of_n_addr_cells(np));
> +		u64 id = of_get_cpu_hwid(np, 0);
> +
>  		if (id < NR_CPUS) {
>  			if (!method)
>  				of_property_read_string(np, "enable-method", &method);
> -- 
> 2.30.2

Acked-by: Rich Felker <dalias@libc.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
