Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6522AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oc+XnYiVxOWD3GM3zCoxCCOh01uxYyMKVQDavHUcP0=; b=czX1dqG1JeyVSG
	f0ByBnP7nPHaYABOmSaaxzDp7bVzLIKa/AEYRwtNwkL2mHMzhBzx09mJjqW1Vnfd0dqF1wV8JvglM
	LXhksrvyYP19uzL2d5sI+Q/xWIpQyccPDYuZh6URkIzTLBpD7PpuTKi4bbxEDmhjzXNlQ4QBHvwh4
	iYoCwV7rZONhaMYC8XYDK9Dn70/9pR0nxgixXQHrZAJ/vhyuPOXLkDgWViG82Sa/DZsPOJCLEI5or
	5vhoJA4yy6KV2yXSyQTkjlIPxHWg9Q0mZSmTb3Lgedy9BW8wK24dHjK9UY2bjJhBHVZ51eWNdAgIl
	tpYOr7CjtY4gk9YiTvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPQy-00000001tmD-2flH;
	Thu, 18 Apr 2024 10:56:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPQu-00000001tlg-2SAG
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88552CE17F8;
	Thu, 18 Apr 2024 10:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B970C113CC;
	Thu, 18 Apr 2024 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713437757;
	bh=QKZFgiAAxVmB0Ab5Gva4C9DkDubO+iF3SWJEtPIsX54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9EE8h6c6EWLkKWVpIDYsnrXuMlaE30U6yItOJCjmn5/bI3ZabIyA4UKpilHNOIdr
	 QcM3XONAwYtkblNReNMkGnUWnxmhPXC3l38oIX1599gIR3sr2TMgyY7VnG9Kshg+jT
	 14j16rC9ARdf0SX+YRY0zBXWMislAXOQsKLpVxpGGGhLICGI1WLSNPsmnivIlaZqgL
	 ch79sKBN2oGs6LILzeZri63UzbcUYpHD0UiSTRxj2JsuPjsfv9WhANU0yE2+gOeCv6
	 sLgfsrsCGRJiT0sNsvzJ1vZeGRWQXuqFQbJIl1zqcKFde14VmQJsKRXUgqJWavd08I
	 2n4Gf9BPpjcAA==
Date: Thu, 18 Apr 2024 13:54:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Andreas Dilger <adilger@dilger.ca>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"ndesaulniers @ google . com" <ndesaulniers@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tejun Heo <tj@kernel.org>,
	Krister Johansen <kjlx@templeofstupid.com>,
	Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <ZiD79h1OXbzmpfCi@kernel.org>
References: <20240418102943.180510-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418102943.180510-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_035601_047260_7EC24599 
X-CRM114-Status: GOOD (  26.96  )
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

On Thu, Apr 18, 2024 at 12:29:43PM +0200, Nam Cao wrote:
> There is nothing preventing kernel memory allocators from allocating a
> page that overlaps with PTR_ERR(), except for architecture-specific
> code that setup memblock.
> 
> It was discovered that RISCV architecture doesn't setup memblock
> corectly, leading to a page overlapping with PTR_ERR() being allocated,
> and subsequently crashing the kernel (link in Close: )
> 
> The reported crash has nothing to do with PTR_ERR(): the last page
> (at address 0xfffff000) being allocated leads to an unexpected
> arithmetic overflow in ext4; but still, this page shouldn't be
> allocated in the first place.
> 
> Because PTR_ERR() is an architecture-independent thing, we shouldn't
> ask every single architecture to set this up. There may be other
> architectures beside RISCV that have the same problem.
> 
> Fix this one and for all by reserving the physical memory page that
> may be mapped to the last virtual memory page as part of low memory.
> 
> Unfortunately, this means if there is actual memory at this reserved
> location, that memory will become inaccessible. However, if this page
> is not reserved, it can only be accessed as high memory, so this
> doesn't matter if high memory is not supported. Even if high memory is
> supported, it is still only one page.
> 
> Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.base.are.belong.to.us
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: <stable@vger.kernel.org> # all versions

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  init/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/init/main.c b/init/main.c
> index 881f6230ee59..f8d2793c4641 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -900,6 +900,7 @@ void start_kernel(void)
>  	page_address_init();
>  	pr_notice("%s", linux_banner);
>  	early_security_init();
> +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE); /* reserve last page for ERR_PTR */
>  	setup_arch(&command_line);
>  	setup_boot_config();
>  	setup_command_line(command_line);
> -- 
> 2.39.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
