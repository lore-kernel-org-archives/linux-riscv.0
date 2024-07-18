Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E98EC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asmyU7pAUthr/AoS8po9YagTrthFZFXKDr4PRomyG2A=; b=gut5crdUZxD+/S
	3zMYrC3rUNjtIIm4Xhiz26Op+RlbfevR/CxlBeVV65DeFyGXjv5rSE+6dw3bm35bih+g6OM48d+pp
	xjoqHI1Xu3Jwpbjf6UxkN5GpNgyIUvuYprfnQZOOTJU6i51vwnnrNlY+YsB9CxjWHit8ncABZmJcB
	aOZjrSRELMwLB0vkLzo6Vto8T2+GPZWEgmbs6c14jNtV7+Ci+sUVl63Dvc4Xk9Nzhl07+5igffQ6g
	NG7mxeFgVxYs3LBEOOSu2fXq+Bwz3thncp/o7SaO9JPDPLrICV0X2iSD6MUKMBZdwSzyv6xagXYOk
	BujV4yr22NuJbxlYMHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUeR-000000003p3-2Oyg;
	Thu, 18 Jul 2024 17:10:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUeP-000000003oI-3ywd
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Jul 2024 17:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NsOKOoz/n0E7x52hYduE2+T+cVMkB7jCqVFM0M9IM1k=; b=l+MePdu8bYu/cU+TSh7JRJxYS1
	rvABr1XnTuOowsMjAnc7fLAlZWmwOr4QbzAFTrrXTBbwDKw5l2/F7QMIYUSip9VEs8jl5WdI360as
	NM1ndolkJhBZiKcWR+00oSycKtbrKf62pmreoJKJUi1g/obBHg02KhSWXsnY6YmcIheEHucoQofNi
	Y8SvSROJNeqwIpv1Cs5vD6zzvJ+zCWbxBvGxHLlkd+CRO7abc9lNwApOae6Fqf0/zBZY2sywg1twv
	8/CInLdVbrl/403Osb+TJ5ItrU8L9HPawmVOdrac5P03vENZmeeWlFgfUDbT506ge3kwnGdCeVhsc
	CpqMyvAA==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUeM-00000002Zvu-0OlR
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 17:10:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D09F3E0003;
	Thu, 18 Jul 2024 17:10:31 +0000 (UTC)
Message-ID: <1305dab1-9d9b-4c9d-bbcd-b81b823e5034@ghiti.fr>
Date: Thu, 18 Jul 2024 19:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
Content-Language: en-US
To: Daniel Maslowski <cyrevolt@googlemail.com>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Daniel Maslowski <cyrevolt@gmail.com>
References: <20240716204047.7649-1-cyrevolt@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240716204047.7649-1-cyrevolt@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_181038_772356_F4D69E7F 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Daniel,

On 16/07/2024 22:40, Daniel Maslowski wrote:
> When alignment handling is delegated to the kernel, everything must be
> word-aligned in purgatory, since the trap handler is then set to the
> kexec one. Without the alignment, hitting the exception would
> ultimately crash. On other occasions, the kernel's handler would take
> care of exceptions.
> This has been tested on a JH7110 SoC with oreboot and its SBI delegating
> unaligned access exceptions and the kernel configured to handle them.
>
> Fixes: 736e30af583fb6e0e2b8211b894ff99dea0f1ee7
> Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
> ---
>   arch/riscv/purgatory/entry.S | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 5bcf3af903da..0e6ca6d5ae4b 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -7,6 +7,7 @@
>    * Author: Li Zhengyu (lizhengyu3@huawei.com)
>    *
>    */
> +#include <asm/asm.h>
>   #include <linux/linkage.h>
>   
>   .text
> @@ -34,6 +35,7 @@ SYM_CODE_END(purgatory_start)
>   
>   .data
>   
> +.align LGREG
>   SYM_DATA(riscv_kernel_entry, .quad 0)
>   
>   .end


With the Fixes tag fixed like Matthias suggested, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
