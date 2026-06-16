Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24044CD98DE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FroGIcsAoY0PAOxMJ/gI0S9FGRgg0Sjuu8rteegAIS0=; b=ZjsyQQwzUhMzMn
	ePQ4A6m5izOVnYn4TUlJnkrakg1zM2hQFAQw7WV+Z9zsolstth9+lKLBnxdkF9m+PiltqzIyCE6R1
	3sPrvA1iegaOeVk1Tk1sWQQpe7NFoXQr/2tb9+nkJ7xnToDJSquQwxRMlWYUQRK0MpjjQU/zNMHO3
	dKWWFakxDuqyQP2oQMsdYCtRpy4pHx9e5wgvr1OUnQZmdRrcf9R1JDjZ9sxZ2skCwteDFiIF3MjVK
	jG1H10LDlmqI5u+GQPE9z0rREMDbhwF26wsTNEoUYoU3A9RnJjVWsURpGwocx6xnn4x2UK6fYI0Ug
	6TiQmVywKTzuBLUWay2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZK71-0000000F8US-32QR;
	Tue, 16 Jun 2026 03:05:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZK71-0000000F8UK-0TMK
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 03:05:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CD5340974;
	Tue, 16 Jun 2026 03:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6231B1F000E9;
	Tue, 16 Jun 2026 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781579114;
	bh=lcN1Rfl7aDSj0DZ5HyYtJgZFzJ29ICvABy26jIqS94M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UE6gvTCyfVo/gJA86Vkg5VetDrNwz24PcbzvCouVlWuiWZ1NX8UGiHJlqma9E2V6k
	 KyH5j1ONpSLfsbrdHZCqmPaCtF/Z/HxkCNs4TvUUe4jsaUNMmD4G7dOw8adGc0WpmM
	 +J10ZZx/R4sElYXo/KTDjGwZd4kV4tVxhK4YKHuVgompm/YS6eEV7x0AhXWKprv9ns
	 yFpFEf9Q+VsHevakDjI2YS4T/xWgfHvJEE0vGHEFLX9PM2NhPhOfuuSXgol6NvlXa/
	 mE9ctPV/EoQlahFPkqJWEvhNkYkwLwxAHFAWVsron2w7pImq5VCrWRjTcNaWWGHpSq
	 m57PIGpSPcOgQ==
Message-ID: <77749c92-ac8a-4074-bb59-59dbbd3d84f2@kernel.org>
Date: Tue, 16 Jun 2026 13:05:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: Avoid uninitialized read in
 hwprobe_get_cpus()
To: Mark Harris <mark.hsj@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612045502.70850-1-mark.hsj@gmail.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260612045502.70850-1-mark.hsj@gmail.com>
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

On 12/6/26 2:55 pm, Mark Harris wrote:
> When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
> initialize its copy of the cpu mask, which could cause non-deterministic
> results from the riscv_hwprobe syscall on a system with more than 8 CPUs
> when the supplied cpu mask is empty.  Address this by fully initializing
> the cpu mask.
> 
> Signed-off-by: Mark Harris <mark.hsj@gmail.com>
> ---
>   arch/riscv/kernel/sys_hwprobe.c | 1 +
>   1 file changed, 1 insertion(+)

This should have a fixes tag, I think it's:

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 1659d31fd288..caf6762427c8 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -450,6 +450,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
>   	if (cpusetsize > cpumask_size())
>   		cpusetsize = cpumask_size();
>   
> +	cpumask_clear(&cpus);
>   	ret = copy_from_user(&cpus, cpus_user, cpusetsize);
>   	if (ret)
>   		return -EFAULT;

cpus is on the stack, and is copied back out at the end of the function, 
so this looks like it could be a stack info leak.

But the copy back is also bounded by cpusetsize, so in fact there is not 
any leak of uninitialised stack out to userspace:

         ret = copy_to_user(cpus_user, &cpus, cpusetsize);
         if (ret)
                 return -EFAULT;

Reviewed-by: Michael Ellerman <mpe@kernel.org>

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
