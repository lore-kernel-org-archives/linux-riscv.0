Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7873CD5BDD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnpH84UoN0r6jG8aad0V5mRTg9XftFIwghGFw8hgXm8=; b=xote+36dQlBM/Z
	38oATys54LyHM+W3eajUVTiP02cscrGb9EoAe6jTGW/8FZEJXOP30hO/RprSbOfz4zPQR6vsywsPa
	Z9VkAdSiD531bU17FNpq4UoIxkuzaKfM8W2oxdiFQahBAxwzutRPnew8+uSRkJMvIQXPnEW4/IrJP
	r6kWASNxJxGGXUEoEepprAQcVFLjLb6fEvbRk6HnKgCxrmPpIhdVs6A7JuvDV1QGkeADLOjSHdBk7
	MdBrdC7JJRdpXTSo60uZa0HE1xdga+zXRGgoyEtkDVs+iZhJ27GJDllhY1KdMK0xWr+FA9HKg41iv
	8ixFrMs66k+R0wUs0nJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXHE-0000000C0cQ-08bY;
	Fri, 06 Sep 2024 11:37:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXB4-0000000BzQX-3xIZ;
	Fri, 06 Sep 2024 11:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD605A44EB5;
	Fri,  6 Sep 2024 11:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA0CC4CEC4;
	Fri,  6 Sep 2024 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725622257;
	bh=KsFKVOSYoCnztZV+8yPxYOicRIlRK5U8T8o6SXl6mAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urHbFJgAAj29sBoL3XI9E5mPOhSY+tCOietZky9XbeWIixVaxgGI7BTtHW2JDXwuG
	 xazPCb690CLuR0M4lVdyIQ220Jb5iXBzS5pHxcQMefEONS2c0ptVDJeES9+ie8qnqD
	 NYBY0F0h6CcCIZ+Wt+ETt90iAlN1wxzVasjKF/dk4wpVf5ctFwFVJ+gb92sKHxuQcg
	 PabS68QzDFeI7N9l9BGDr96ly/U+L9EhgNZH/DIU0Q65CBMzIm0hSDhmSI7F33r5zW
	 FXd2RyGtTlIB1S/AgYkbbC4hkveoXuVMJu0KyTdRASCWkK7+2ocqwEHgmb9BSbz4Uf
	 7MxTwJB4lceOQ==
Date: Fri, 6 Sep 2024 12:30:51 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Clark Williams <williams@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/3] arm64: Allow to enable PREEMPT_RT.
Message-ID: <20240906113050.GB16124@willie-the-truck>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
 <20240906111841.562402-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906111841.562402-3-bigeasy@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_043059_367864_01B50D34 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, Sep 06, 2024 at 12:59:05PM +0200, Sebastian Andrzej Siewior wrote:
> It is really time.
> 
> arm64 has all the required architecture related changes, that have been
> identified over time, in order to enable PREEMPT_RT. With the recent
> printk changes, the last known road block has been addressed.
> 
> Allow to enable PREEMPT_RT on arm64.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 0e5bd38633936..2cce9cb44c31e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -101,6 +101,7 @@ config ARM64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> +	select ARCH_SUPPORTS_RT
>  	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> -- 
> 2.45.2

Acked-by: Will Deacon <will@kernel.org>

"Let it rip!"

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
