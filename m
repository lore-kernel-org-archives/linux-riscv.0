Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE8C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3coeTrOcyq3n5UBROVK9x89sDBCVQrJag+rRPMejsE=; b=3eNdW8PQygXu4u
	8SkKFnBawAPH0n+Eb1NtJfvYjlfwPHSK++P2E4U0Dg1CAPLGhd2wSVk+1gMMb7yGyhii6WeEDrYgm
	KklrkRzSf+LjwR2MIiMmBUKrDTBwmdeVp4xRJ1XkSnXB3GJ9dU5OhwnOGQRzPYh6/UDvoPHAg9442
	57PqQ6Uc1knzARysVsDyR80TOS1qkbczdnfusoBJw7wxPn8T4hGowmqhS10rH75Xm+r4cyEcXXySp
	kESaeY31YPumNKJhzon74ehpyMygs5h5PZQjQBZe2tKg8ZE21sM4n3ZAr24l8crB4uZwN2av9gHHh
	mN2ht4HSXDrbpEp7wo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnSD-00000008hdH-3dv2;
	Mon, 22 Jul 2024 07:27:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnRp-00000008hX3-0M9i;
	Mon, 22 Jul 2024 07:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37256CE0B18;
	Mon, 22 Jul 2024 07:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACB7C116B1;
	Mon, 22 Jul 2024 07:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721633222;
	bh=dH+wG+QVFbCksW1/xG4MwjSTXFfGmqsXVVmCulccai4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwfZHQCyXkx/doLytbGc2a+uUyy/VW2gNvI8YSM5yCJ9jwI5i+3Pgq5CI9zfzBfCA
	 1N81oll60NfA8OBgFmbn+OyDkbBXWbuBkE1zfVgVPdkBE4nIHUtbLbqjiFTRYkrPEY
	 1WqM9Z3XQNb1Qu8KTNqbDSqr8v6inJkyiYFey9HQsAs9ko2sgjxlDCbmcYhV/hL+0f
	 NNIpiSDCVarmxKdtrxTIcOI/5510nKl2/hiuVY9xKUnWeoh3oEsdjvW4CkdZyhJwwg
	 r41+R3r7J8lbTox7FNqKpvaaUYE4qCyQ1/Yk+5/JMMmJ9fYz5K/OcdwQ3HGJ7Xoc0T
	 avfZzoMxlNX+g==
Date: Mon, 22 Jul 2024 10:23:54 +0300
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
Message-ID: <Zp4JCmiZgGZ8jq-b@kernel.org>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
 <20240722035701.696874-4-ruanjinjie@huawei.com>
 <Zp3-dZHhN7LbMggc@kernel.org>
 <5816d4d5-e038-c90b-5ac2-1a3b3a8b9e46@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5816d4d5-e038-c90b-5ac2-1a3b3a8b9e46@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_002705_716043_A0C97D58 
X-CRM114-Status: GOOD (  27.96  )
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

On Mon, Jul 22, 2024 at 03:08:29PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2024/7/22 14:38, Mike Rapoport wrote:
> > Hi,
> > 
> > On Mon, Jul 22, 2024 at 11:57:01AM +0800, Jinjie Ruan wrote:
> >> Similar with x86_32, on Riscv32 Qemu "virt" machine with 1GB memory, the
> >> crash kernel "crashkernel=4G" is ok as below:
> >> 	crashkernel reserved: 0x00000000bf400000 - 0x00000001bf400000 (4096 MB)
> >>
> >> The cause is that the crash_size is parsed and printed with "unsigned long
> >> long" data type which is 8 bytes but allocated used with "phys_addr_t"
> >> which is 4 bytes in memblock_phys_alloc_range().
> >>
> >> Fix it by checking if the crash_size is greater than system RAM size and
> >> warn out as parse_crashkernel_mem() do it if so.
> >>
> >> After this patch, it fails and there is no above confusing reserve
> >> success info.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >>  arch/riscv/mm/init.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >> index bfa2dea95354..5d66a4937fcd 100644
> >> --- a/arch/riscv/mm/init.c
> >> +++ b/arch/riscv/mm/init.c
> >> @@ -1381,6 +1381,11 @@ static void __init arch_reserve_crashkernel(void)
> >>  	if (ret)
> >>  		return;
> >>  
> >> +	if (crash_size >= memblock_phys_mem_size()) {
> >> +		pr_warn("Crashkernel: invalid size.");
> >> +		return;
> >> +	}
> >> +
> > 
> > What the point of adding three identical checks right after the call to
> > parse_crashkernel()?
> > 
> > This check should be there and parse_crashkernel() should return error in
> > this case.
> 
> Hi, Mike
> 
> How about the folling rough patch?
> 
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -313,7 +313,7 @@ int __init parse_crashkernel(char *cmdline,
>         if (high && ret == -ENOENT) {
>                 ret = __parse_crashkernel(cmdline, 0, crash_size,
>                                 crash_base, suffix_tbl[SUFFIX_HIGH]);
> -               if (ret || !*crash_size)
> +               if (ret || !*crash_size || crash_size >= system_ram)
>                         return -EINVAL;
> 
>                 /*
> @@ -332,7 +332,7 @@ int __init parse_crashkernel(char *cmdline,
>                 *high = true;
>         }
>  #endif
> -       if (!*crash_size)
> +       if (!*crash_size || crash_size >= system_ram)
>                 ret = -EINVAL;
> 

Why no simply

diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index 5b2722a93a48..64312709877d 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -336,6 +336,9 @@ int __init parse_crashkernel(char *cmdline,
 	if (!*crash_size)
 		ret = -EINVAL;
 
+	if (*crash_size >= system_ram)
+		ret = -EINVAL;
+
 	return ret;
 }
 
 
> > 
> >>  	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
> >>  				    low_size, high);
> >>  }
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
