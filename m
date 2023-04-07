Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AD7C77B61
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijPF06UZ9aOX/jcmBk65h3ieBOsOOthdMx528ryWPiw=; b=CI31+sHEReZptP
	2hP/G1GjeichRahk5bw/N0qwWjLCdGjRHbOM9i0uOIEc9wtnqeBtYB/or1ChXqQGoDxDHYVsMrS6Q
	9ibmqlETn0lxZ1cNSIHr0FJy2hCvPhvM+ql0AU5AvtbXcOINza4EtCCa/hWv/WONi5y7iS4DGFC7j
	hvsJDn8JcpKEiETqwmU1CzCAJFzKP1strjkuqTV8lldtQKjZuwu/fd9wU71zdmAqy4JhMmgFkqU6h
	mTTn7Wy0E9cE82DPWILQa4q3YNC9+Y0ZXGTdi6bEkO4O3xg5dq/WwjXyXlCTNBDNNWGy8XD4Jd3r0
	LqCc7PnFUBSxUvkTSaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkob-00A8bn-1B;
	Fri, 07 Apr 2023 12:03:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkoU-00A8ab-1I;
	Fri, 07 Apr 2023 12:03:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8931260F87;
	Fri,  7 Apr 2023 12:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7BDC4339B;
	Fri,  7 Apr 2023 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680869009;
	bh=MDs+MtGIXGFtAsm2rEE3JPZAgrsutam8x/+OyQ6U/5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdUYTX/0/+T9+z9T0OX02fulTzrK0zyn+hY+KU0Ur572LTK2I7rQcUfOgGaBnhPRo
	 ambh4jV0pVIr3U4pU0iogCbVobAeEL28y+0+soqZjQmEOPVMv4bKzjW8TnJbNu6QeG
	 NgTY3NkpLzztvLl5tfUsyR4E6nzurftFip1H4rEaJco8ZhdFUpmEWUK2UmnFg93Z2/
	 TFvhvuZh/EwITPZfg8gYG/JDXQAAbMeABH072LcXVYuv6CfiYDeJr+mJx0BTxcbKOQ
	 yGI7VxGsk78TZkWIkVuFCW40AaU5CLA9eRCADsYEiijPIEQGePzGSqqiv/dksnm2vT
	 BdkpJiCa/Fzpg==
Date: Fri, 7 Apr 2023 14:03:23 +0200
From: Simon Horman <horms@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v3 1/2] riscv: kdump: Implement
 crashkernel=X,[high,low]
Message-ID: <ZDAGi2/+1q0oEUZ5@kernel.org>
References: <20230406220206.3067006-1-chenjiahao16@huawei.com>
 <20230406220206.3067006-2-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406220206.3067006-2-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_050330_496637_1F188C9A 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Apr 07, 2023 at 06:02:05AM +0800, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Here introduce the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low".
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

...

> @@ -1180,14 +1206,37 @@ static void __init reserve_crashkernel(void)
>  		return;
>  	}
>  
> -	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
>  				&crash_size, &crash_base);
> -	if (ret || !crash_size)
> +	if (ret == -ENOENT) {
> +		/*
> +		 * crashkernel=X,[high,low] can be specified or not, but
> +		 * invalid value is not allowed.

nit: Perhaps something like this would be easier to correlate with the
     code that follows:

		/* Fallback to crashkernel=X,[high,low] */


> +		 */
> +		ret = parse_crashkernel_high(cmdline, 0, &crash_size, &crash_base);
> +		if (ret || !crash_size)
> +			return;
> +
> +		/*
> +		 * crashkernel=Y,low is valid only when crashkernel=X,high
> +		 * is passed and high memory is reserved successful.

nit: s/successful/successfully/

> +		 */
> +		ret = parse_crashkernel_low(cmdline, 0, &crash_low_size, &crash_base);
> +		if (ret == -ENOENT)
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +		else if (ret)
> +			return;
> +
> +		search_start = search_low_max;
> +	} else if (ret || !crash_size) {
> +		/* Invalid argument value specified */
>  		return;
> +	}

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
