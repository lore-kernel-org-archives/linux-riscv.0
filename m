Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7495C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjIwcqM5pBZDYl/TihZ/ZRsT2hHgQQzyTU05VP+isGg=; b=vOs9bI8Qoghz/0
	DGd80xpvvAdrvBvvB3wNl8epeP3kZ1WtEIN3hCErP6XPame4F/U9k7yBdGUp9SyLvV4Fa7lfIUGmc
	mcPYrcP9lp1amu7+1ddZ/gokgfguJJwY5tftuZ34AvGZpUaXO+oiWyqbVkvKfdxNUNhb0+MB6iUI6
	V7euo+KFjvUyODiY+D8yr+TpDr957l0N97johrL6WYAC6/HVRp1G4Jr7rtOVdkUFOjfa2VlbJv9Oe
	TXFxYJ+m2FVbpKmnr9nvTMGX7XezUHIr7JmsM99K9axLSyKmNn9Iao/Lb1dILNovqO1yEAh6BA3gT
	wu1mrZ2+zPUFTt2dUhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBlH-006LEB-Lt; Tue, 10 Jan 2023 10:21:43 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBlE-006LBb-WB
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 10:21:42 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 51678E000E;
	Tue, 10 Jan 2023 10:21:32 +0000 (UTC)
Message-ID: <49fe95c8-031e-5f4b-3c37-8bc78a7210d8@ghiti.fr>
Date: Tue, 10 Jan 2023 10:21:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
To: guoren@kernel.org, alexandre.ghiti@canonical.com, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230110080419.931185-1-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230110080419.931185-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_022141_210564_30B67625 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Guo,

On 1/10/23 09:04, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> KERN_VIRT_SIZE is 1/4 of the entries of the page global directory,
> not half.
>
> Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..2a88362dffa5 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -31,7 +31,7 @@
>   #define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
>   
>   /*
> - * Half of the kernel address space (half of the entries of the page global
> + * Half of the kernel address space (1/4 of the entries of the page global


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>    * directory) is for the direct mapping.
>    */
>   #define KERN_VIRT_SIZE          ((PTRS_PER_PGD / 2 * PGDIR_SIZE) / 2)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
