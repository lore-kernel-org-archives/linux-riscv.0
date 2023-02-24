Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774ADC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoq2KE0XJLNzdxEk91liiYQsP1+FjeMNg+2Yr6SEAdU=; b=4zxu41jAO0oxan
	aAHXsC8kF6KBOD1A8rHUM+VMne4gC1q0BZCjsyasvXQ+JahQRTjYHHSIv809IJay4EVjICRyxdJig
	EOoIuBXjbVgfYjfUAPoi+l1NtYfQqmSmsnQpdC6oILkhY0umrUjiCGMsFKJjeV13EAh7bmhx85vwF
	e27UAT5OyFgUmZifhehdEq90q1AUstLrxty4Wn8IlwuHULSdkENZLWKHMRMHxXialtseYkBFt2iR7
	MGPS+Y4ct2az6x7HpvmTj5Qy/4x8XMDiJHIy4uJTNbgnGhkdzUbtNejt2m/wVENxtgSwGjURNNupi
	553r1BwNPb75ceiGdf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZJB-002nUb-V2; Fri, 24 Feb 2023 14:44:25 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZJ9-002nTI-Iq
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:44:24 +0000
Received: from [63.135.72.41] (helo=[192.168.1.21])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pVZJ4-008GKz-DE; Fri, 24 Feb 2023 14:44:18 +0000
Message-ID: <52014360-7160-82ac-7f7a-26f55ee3b684@codethink.co.uk>
Date: Fri, 24 Feb 2023 14:44:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] RISC-V: Fixup clear_page export when using Zicboz
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>, ajones@ventanamicro.com
References: <20230221190916.572454-7-ajones@ventanamicro.com>
 <20230224135844.619054-1-ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org
From: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
In-Reply-To: <20230224135844.619054-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_064423_644949_128E72BD 
X-CRM114-Status: GOOD (  15.25  )
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



On 24/02/2023 1:58 pm, Ben Dooks wrote:
> When the clear_page() via Zicboz is enabled, the module build
> fails as clear_page() is not marked as a ksym entry. Fix this
> by changing the asm code to use <asm-generic/export.h> to add
> the correct export.
> 
> Also remove the weak clear_page() as there's nothing else in
> the build defining this symbol, so just make it the entry when
> the Zicboz is enabled.
> 
> Fixes modpost errors such as this:
> ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
> 
> Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/lib/clear_page.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> index 7c7fa45b5ab5..4ed5fef52d80 100644
> --- a/arch/riscv/lib/clear_page.S
> +++ b/arch/riscv/lib/clear_page.S
> @@ -6,6 +6,7 @@
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  #include <asm/alternative-macros.h>
> +#include <asm-generic/export.h>
>  #include <asm/hwcap.h>
>  #include <asm/insn-def.h>
>  #include <asm/page.h>
> @@ -17,7 +18,7 @@
>  
>  /* void clear_page(void *page) */
>  ENTRY(__clear_page)

Shouldn't this be removed also? Am I missing something?



-- 
Regards
Sudip

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
