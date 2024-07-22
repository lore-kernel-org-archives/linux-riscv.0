Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B1C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 06:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeKNcMHKlrm9tLJ7C597pw0TlOrtL+7yy2Z53u6QqcM=; b=yaTvPBk+HJzX+E
	PP0TvCxQWsfNBOjl9pZinAeMSGR5jz0hykuWriTuRPvJr4xH4Qpoc0GvcsWOSuTAFfJMrAiGZq28b
	lSoAupvfkttffgKW76MZixdXcPwWGYdPyv5OXcUa6Xi6aCQUqbcDN7Rp/t64yDESYsKmb76On6Iy8
	L/2S5CYEDFhQ8NG4ZKhVqenrEH9Ko2nx7/Cfve9C7kGIv7c23iC/N84HmNUurQeryOumKIYrat19r
	AUO8/0ip4mOV5HMbOKdEhd1f8qXa6PIxq6zJrttKuJJ37lEWxhkWzBXLVbxO/DJ4jCxTeZHdustjV
	9jfdjfXjzQUaw++FUDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmkQ-00000008Y4f-3Aiw;
	Mon, 22 Jul 2024 06:42:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmk4-00000008Y10-3cOh;
	Mon, 22 Jul 2024 06:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73B7760AB1;
	Mon, 22 Jul 2024 06:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B928C116B1;
	Mon, 22 Jul 2024 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630511;
	bh=Uc2H8MzMbL0exp6NDBd0fqrLYZ7z9SrwjguOdZewCxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4+ac8sOH29nEcY30v7JfwQUBbY10MKUUKQRDDkYsEHF3O2B5HPlFnFq63P+ndHri
	 98hYHPANCcLLIXpfRCn+i0RQkBu08yu9XtKvj6OesNHMs89ZbXknaNe0ywTHriBSWT
	 0Od7glk0EMv/qvnMPGg1iOZ8q8M+9CpUTDT0/SlQ1QKBRF985lbN2vQ0Xvn99b8nLe
	 jwB/0ao/Y1b3RmhwAJusTDrD1C5/hDHFRK5WF5ehBhdkhp2819VDjK+cBpOVr/SuU6
	 qDALwmz7Ot/QZLFEL4EYLp+VbntPOE9WX9A3k2HDhe1LMgcduwkTWSqoMJpFx60u+8
	 GBUzk2gmHxqRg==
Date: Mon, 22 Jul 2024 09:38:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux@armlinux.org.uk, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	arnd@arndb.de, gregkh@linuxfoundation.org, deller@gmx.de,
	javierm@redhat.com, bhe@redhat.com, robh@kernel.org,
	alexghiti@rivosinc.com, bjorn@rivosinc.com,
	akpm@linux-foundation.org, namcao@linutronix.de,
	dawei.li@shingroup.cn, chenjiahao16@huawei.com,
	julian.stecklina@cyberus-technology.de, rafael.j.wysocki@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] riscv: kdump: Fix crash memory reserve exceed
 system memory bug
Message-ID: <Zp3-dZHhN7LbMggc@kernel.org>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
 <20240722035701.696874-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722035701.696874-4-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_234152_986725_DCE7C065 
X-CRM114-Status: GOOD (  20.16  )
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

Hi,

On Mon, Jul 22, 2024 at 11:57:01AM +0800, Jinjie Ruan wrote:
> Similar with x86_32, on Riscv32 Qemu "virt" machine with 1GB memory, the
> crash kernel "crashkernel=4G" is ok as below:
> 	crashkernel reserved: 0x00000000bf400000 - 0x00000001bf400000 (4096 MB)
> 
> The cause is that the crash_size is parsed and printed with "unsigned long
> long" data type which is 8 bytes but allocated used with "phys_addr_t"
> which is 4 bytes in memblock_phys_alloc_range().
> 
> Fix it by checking if the crash_size is greater than system RAM size and
> warn out as parse_crashkernel_mem() do it if so.
> 
> After this patch, it fails and there is no above confusing reserve
> success info.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/mm/init.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index bfa2dea95354..5d66a4937fcd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1381,6 +1381,11 @@ static void __init arch_reserve_crashkernel(void)
>  	if (ret)
>  		return;
>  
> +	if (crash_size >= memblock_phys_mem_size()) {
> +		pr_warn("Crashkernel: invalid size.");
> +		return;
> +	}
> +

What the point of adding three identical checks right after the call to
parse_crashkernel()?

This check should be there and parse_crashkernel() should return error in
this case.

>  	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
>  				    low_size, high);
>  }
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
