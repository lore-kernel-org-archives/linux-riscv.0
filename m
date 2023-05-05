Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6FBC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aW8OlyglBTAxsiEvWLWF+rnZ/hTt7Z+8u4II8eCAHuQ=; b=vfJBkC6TTnzq+6
	0GpDch4u7jwYjTDWKvFmWonI3xRGyIYQfe6MJxjcdll9dWYmE3JLz8UDrvcCuAKPVZHBW6iO9L3+f
	OBum0TSTM0SF1sA2QsnkDRUa/JS7n9taK1kEF85F2PL5iyATO+BKC8ivjbY5sc7MzV+J1SkdouXeW
	BcMb5gfnDOaYGPdwrgNsX8ecwHmSOCqYzbawNjI4BUBzoF+exMOa1eqK51dHwlNY0yWWJyjvm+EJb
	9emzHRVFGEvxVegSPtwHNjfy3xqHYogRG1sAoRAMBT1GSEv6M2jxSXdAXA4wk3dV7SOccYHWM1j4R
	xZeeCXp93I0Wdn3QPRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puukb-00AuL0-0N;
	Fri, 05 May 2023 12:41:29 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puukW-00AuJW-36
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 12:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1683290472; bh=DbkOPfphAhGuRUJgM5kNf6oSs45zQG6Gyzk9us65Xa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gHZj4PEscNOw1qxy7+LwNQr64CGkO3XzHf1sXPvi8M82n7BitBiORCW59KHibhQ3G
	 GXC1bzhZnaaDqYhFGLinGb28Gevi6LHE01zCUnRyBKf1QW/mBo4ng+oObJXHzDdLtv
	 12kIVmwD3nvhZP6LrM2RsHkc2UBXKcHIhKG2nASs=
Received: from localhost.localdomain ([2001:da8:c800:4::9b62])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id A1785A16; Fri, 05 May 2023 20:40:23 +0800
X-QQ-mid: xmsmtpt1683290423tz9nh68kz
Message-ID: <tencent_3385F6B8E304EE4B8C4BC858E3369F97A006@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjhxYV/uk0Bx3naOaHXyJi/suLIRsIHeCtyLODEupRL+ESZmutxH
	 KdIVK2Z4AzJniDcftF5gFDVcxilFn26qSgat3ieLpwxTQF6Y93znvsCZq3iVsAzNcpcwkytjpIIP
	 hK2Kne7wL81ku/rbY0BhbQz2/dbqmsiD0CesKY6FPSWkir6SJFcQ4bH+R+j7UhGAnGDOJ77ZzBjz
	 C6un/DSti+VEpIAouurIVzB4MKE6lr75sEf3kJS9Vjv6sesXwUMI9nlkzot9gwz1eRhmsatctZ30
	 ScKQ3QOOYGevILXskqp6ErnCtpy1IivcqMJFai4UEUSzSKgoxwTjSUSTHJA2OzGGIFBRQVGyndn3
	 jaLdKkskmEy1tyU6uhQxmmf2lh76/W3zfHHe3+vUiV+yNe3cDq+H5ertiTPYFl1qE1tbpDV1O+/b
	 oI1xWEnKTV06LNgs6aavZQ4TsHDkX0Xw0xGBXU74AwERj6kRwqlI0HXEc61WGMfc64RFYgveWR+3
	 806cZDgwf9QsZbTd0Hdd29TCmgUotb/f0H1rMDRek60hR2X+8PghXnomPFwK6Qklcc6G8NL37QDx
	 s8f8Ro/NtiqBZLRRvWIBx5AzEem3aymbMN4OJKVoklILde2NTzFutvQsaTdhZcm8RiYYfhH9DoI8
	 OcQsFp6llh9KqwWNr+AdCgP4lhpN0QYVKEg+fOBS1JUrYHsvJu/6KRgzPEzbHiFU5JX+IFxzf+Ti
	 G0+h2pGfVmIXIINwydd2/f2+hgQKT4qZpwrumctG5KPdF4WfXr2p17lXWdgph13hq8g6hTaQ4u6G
	 +K7a7oTanPSwskK5l7M7eaK24gHydPMoQtGccIKEf/lLVrmt2YAZ92UGyzJq6OOP13+FXKQdMMQ6
	 KVHk2SCWDRbGW5mRi6dshrYIbcMaRdOptVdnUasMWHrZIzaBtXOxLd2slyLKAkHTJOdBlkNaB21c
	 O7myazCyDHjAy5n3U2Gj0lV7bbzixyLyTBo0SL0j4Yp/PXz3o+XU0om+CvgBYc
From: Yangyu Chen <cyy@cyyself.name>
To: conor@kernel.org
Cc: ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cyy@cyyself.name,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v1 4/7] RISC-V: validate riscv,isa at boot, not during ISA string parsing
Date: Fri,  5 May 2023 20:40:22 +0800
X-OQ-MSGID: <20230505124022.14532-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20230504-sultry-frostlike-9dbf19333725@spud>
References: <20230504-sultry-frostlike-9dbf19333725@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_054125_362474_2AD84919 
X-CRM114-Status: GOOD (  21.09  )
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

On 5/5/23 2:14 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Since riscv_fill_hwcap() now only iterates over possible cpus, the
> basic validation of whether riscv,isa contains "rv<width>" can be moved
> to riscv_early_of_processor_hartid().
>
> Further, "ima" support is required by the kernel, so reject any CPU not
> fitting the bill.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c        |  8 +++++---
>  arch/riscv/kernel/cpufeature.c | 12 ++++++------
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 7030a5004f8e..b0c3ec0f2f5b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -63,10 +63,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
>  		return -ENODEV;
>  	}
> -	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
> -		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> +
> +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
> +		return -ENODEV;
> +
> +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
>  		return -ENODEV;
> -	}
>  
>  	return 0;
>  }

What about reducing the compare string to "rv32" and "rv64" only?

Linux kernel is able to run on RV32IA or RV64IA CPUs theoretically as
someone did before[1]. In this case, M extension is not required here.
Although it's an invalid DT for now, reducing the compare string will
make the porting easier. And M extension does not provide additional
ISA-level registers that need the kernel to care about during context
switch.

In my opinion, we should concern about if someday linux will support
RV32E or RV64E. It's not necessary to validate if "ima" presents here
for better forward compatibility.

[1] https://www.facebook.com/groups/riscv.tw/posts/1611033709104137/

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3ae456413f79..a79c5c52a174 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -130,12 +130,12 @@ void __init riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> -		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
> -			continue;
> -
> -		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
> -			continue;
> -
> +		/*
> +		 * For all possible cpus, we have already validated in
> +		 * the boot process that they at least contain "rv" and
> +		 * whichever of "32"/"64" this kernel supports, and so this
> +		 * section can be skipped.
> +		 */
>  		isa += 4;
>  
>  		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);

Looks good to me.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
