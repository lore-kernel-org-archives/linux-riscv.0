Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AA9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwJb6jiIhcXQvsCFq1dXkQwh83K/I2inO1f0PuccXUo=; b=mfkHWR3Oipl1ER
	fT3fNFw6Nk24/kY7IquSvMgTXS5/q5rbiAxbaIy7RuJDTWmDzJZ6FVyG9DM2Tcz3S50WhB2FafklW
	T7NQ2/HtYg4A/wc3BQRiCbH0seSSXYEhyPC8Iwivx3gk9d+wtl8VLvgX9C3q65iEk7NGHiw9K3krV
	DbCAKKGJXGkg8mBm0EjqbRFuH4mmkp7WkkYNiI60EeEhj/RbK8TPzg2t0ZteJD3hY//JD/SeHi+EE
	XCE8MAt1bf4tNJjWcocKYJca3TQ62URpclWfc6S+EBqJ9F9rRTWX8eruTBLWVq/g6lA+urwD12HGY
	DuAALfB0g0fZgkBE2vLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt3jR-00Eoo1-GO; Fri, 03 Dec 2021 08:15:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt3jO-00EonB-PT
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 08:15:48 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id ECF9860017;
 Fri,  3 Dec 2021 08:15:41 +0000 (UTC)
Message-ID: <e3912496-87aa-d579-b3c1-861c13b66bec@ghiti.fr>
Date: Fri, 3 Dec 2021 09:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/5] riscv: mm: init: remove unnecessary "#ifdef
 CONFIG_CRASH_DUMP"
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-2-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211203050317.2102-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_001547_001885_C1ED70D6 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/3/21 06:03, Jisheng Zhang wrote:
> The is_kdump_kernel() returns false for !CRASH_DUMP case, so we don't
> need the #ifdef CONFIG_CRASH_DUMP for is_kdump_kernel() checking.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 3c0649dba4ff..745f26a3b02e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -790,12 +790,10 @@ static void __init reserve_crashkernel(void)
>   	 * since it doesn't make much sense and we have limited memory
>   	 * resources.
>   	 */
> -#ifdef CONFIG_CRASH_DUMP
>   	if (is_kdump_kernel()) {
>   		pr_info("crashkernel: ignoring reservation request\n");
>   		return;
>   	}
> -#endif
>   
>   	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>   				&crash_size, &crash_base);


Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
