Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC82C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwpyNLBVMPa9zvMae0l7MgrbqTq8N/LA1FZlOO1uGmc=; b=q6gPIMeDxdQTA7kKVvzP3dB/MP
	10E5DJqvZQUyKo5b5svdZH56k+FAV+W7HrgsAcbl3o2ty5k2WJ1g2ppPkZdJ16BedA69AkahJkk9C
	EDlK5vfKhKxbpTDz4w/RzN4rM+iVKN5fxTAFeydG8vdHEZllKMuoXHgb/w3TCG+azQFyu4REvdkBb
	FMYTHKDPOdPm3vZKxkf//RF6fEnZoXwmuhSIP1sE+H2AZNjnYgyUngv49AsHf6A49i6ICcCAuNBn2
	K+YwP+kV9A+Hc4tRwTr5SgjTT0MztZpKus7stMdjgFdUsLF0OxSh6vZLYcQUUu5H5pGOYM1ZkEiwq
	jJHOGRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpLdh-000ftE-OI; Tue, 23 Nov 2021 02:34:33 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpLdf-000fsw-Bx; Tue, 23 Nov 2021 02:34:31 +0000
Subject: Re: [RFC PATCH 3/3] riscv: Add riscv.fwsz kernel parameter
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-4-guoren@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ac5613d9-913e-ff07-5802-21e1771112f9@infradead.org>
Date: Mon, 22 Nov 2021 18:34:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211123015717.542631-4-guoren@kernel.org>
Content-Language: en-US
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

On 11/22/21 5:57 PM, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> chance to users to set the proper size of the firmware and get
> more than 1.5MB of memory.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 9725c546a0d4..ee505743c8f4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4964,6 +4964,9 @@
>   			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>   			CPUs.
>   
> +	riscv.fwsz=nn[KMG]
> +			[RISC-V] Determine firmware size to save memory

Is "Determine" like "Set"?  The user is setting (telling the software)
the firmware size?

"Determine" makes it sound to me like the Linux software is somehow
helping to determine the firmware size.

> +
>   	ro		[KNL] Mount root device read-only on boot
>   
>   	rodata=		[KNL]
> 


-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
