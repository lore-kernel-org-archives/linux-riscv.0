Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DEC6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whoRKN9lHxF9My+eUuG44RL4lRmAbZ0D6i9yedENS6M=; b=aWOqIMfoh/CvYY
	HoL0QHQgiYYpAkSAYAvxqlFic3Gc8epZCu/ScJQo87cOdM81bgwlUZljkgfkPnAFXz11bkrnaTEZp
	DSE/0CoSFKFS72jFDgSEUBAtIUt79SEKdyMoFIlVtF1iq62MAlPkU0L5u6fSAPRn6brzk9lb1mI/n
	peE/g6d0hGz7D0W/BZzACDs/3ATm3tICmOSV3wOYUlRWX+SJKrBn2qvoOzKPM4woiy2gt5jW31yLs
	ERmxDOniU7oKacZn5q2jU/FzUM0QSsbdUfhTZNhDf9R1SSp2MUyLzLAgjBh//xyInjVHqiGyfHvuW
	sSboKCCr4t/jxYHh9w6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmEF-00BrK0-38; Wed, 22 Feb 2023 10:20:03 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlbg-00BX7S-0I
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:40:13 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id D58E5140ABD;
	Wed, 22 Feb 2023 09:40:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 320E134;
	Wed, 22 Feb 2023 09:39:57 +0000 (UTC)
Message-ID: <2cf5852092ac5940b8bc6664f54bd6066fe03be2.camel@perches.com>
Subject: Re: [PATCH v3 5/7] RISC-V: hwprobe: Support probing of misaligned
 access performance
From: Joe Perches <joe@perches.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Date: Wed, 22 Feb 2023 01:39:55 -0800
In-Reply-To: <20230221190858.3159617-6-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
	 <20230221190858.3159617-6-evan@rivosinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 320E134
X-Stat-Signature: ybbcoyf11h49p9quu88t1dg4kuty1m1n
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+8kobCdGdcWhmHWOr9mPUUF3sOhp8Kwis=
X-HE-Tag: 1677058797-751421
X-HE-Meta: U2FsdGVkX1+UdPFDfaN1hY5zcxQ+HQPvxVKNWYfjZMmIKNJ658qKEWuywkzdpnpyRHDVQTb4ua/dzl8jHTTtRA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014012_165035_2EE95E41 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, slewis@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2023-02-21 at 11:08 -0800, Evan Green wrote:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
[]
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
[]
> @@ -89,11 +94,11 @@ static bool riscv_isa_extension_check(int id)
>  void __init riscv_fill_hwcap(void)
>  {
>  	struct device_node *node;
> -	const char *isa;
> +	const char *isa, *misaligned;
>  	char print_str[NUM_ALPHA_EXTS + 1];
>  	int i, j, rc;
>  	unsigned long isa2hwcap[26] = {0};
> -	unsigned long hartid;
> +	unsigned long hartid, cpu;
>  
>  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
>  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> @@ -246,6 +251,28 @@ void __init riscv_fill_hwcap(void)
>  			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>  		else
>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +
> +		/*
> +		 * Check for the performance of misaligned accesses.
> +		 */
> +		cpu = hartid_to_cpuid_map(hartid);
> +		if (cpu < 0)
> +			continue;

unsigned long can't be less than 0
Likely cpu should be long not unsigned long
It seems cpu is rather randomly either int or long.
Perhaps standardizing on int would be better.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
