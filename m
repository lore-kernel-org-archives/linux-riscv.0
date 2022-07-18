Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97450C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0MWp0IRh/2VvXgJo5ZjWvHAckZBc2PyDRnSazkqVhs=; b=xSED10iuFxvsjLoSpYfR6OAjtO
	CvaruxBJeBtakjO078FahsSakYXFV4gQOmJ4L+KpaQJxlCUjuf5TvTbHxozTKYAO6BPSzxOX8tutK
	DwcLhBWdZ0MEEaM7+zm3ZYbAFU24dVKpN+2cFwfitTqkMY/rp3/QI7jzIJWlGuV3MffWqq7C/hM/D
	ryNw02pV7IIveVgKpzC73c+1bwRnxk+K5zO0HzbkKeaen5Z4zh8nh96dLZI4Be/0EGAZXdkEQjBRN
	6AnTKlyBFfwLSb3u74aI5rGdhKz24QBBuecmuKFLMC0yZjLPRkU4Y+QQ8xbqZMNeZy1LoOKOKaaHR
	1Dhx/WHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSOc-00G6ZF-FD; Mon, 18 Jul 2022 15:10:54 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSOX-00G6TN-SU
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 15:10:51 +0000
Received: from [167.98.27.226] (helo=[10.35.4.171])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oDSO7-002C7q-5v; Mon, 18 Jul 2022 16:10:23 +0100
Message-ID: <5dcbc6e6-a5f4-a28e-b78a-9eddce1b7ca8@codethink.co.uk>
Date: Mon, 18 Jul 2022 16:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
Content-Language: en-GB
To: Chen Lifu <chenlifu@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akira.tsukamoto@gmail.com,
 jszhang@kernel.org, wangkefeng.wang@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 alankao@andestech.com
References: <20220615014714.1650349-1-chenlifu@huawei.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220615014714.1650349-1-chenlifu@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_081049_990282_A319726E 
X-CRM114-Status: GOOD (  14.97  )
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

On 15/06/2022 02:47, Chen Lifu wrote:
> Since commit 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> and commit ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code"),
> if __clear_user and __copy_user return from an fixup branch,
> CSR_STATUS SR_SUM bit will be set, it is a vulnerability, so that
> S-mode memory accesses to pages that are accessible by U-mode will success.
> Disable S-mode access to U-mode memory should clear SR_SUM bit.
> 
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")
> 
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>

I've not run tested this, but it does look correct

Reviewed-by: Ben Dooks <ben.dooks@codethink.co.uk>


> ---
>   arch/riscv/lib/uaccess.S | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 8c475f4da308..ec486e5369d9 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -173,11 +173,11 @@ ENTRY(__asm_copy_from_user)
>   	ret
>   
>   	/* Exception fixup code */
>   10:
>   	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>   	mv a0, t5
>   	ret
>   ENDPROC(__asm_copy_to_user)
>   ENDPROC(__asm_copy_from_user)
>   EXPORT_SYMBOL(__asm_copy_to_user)
> @@ -225,10 +225,10 @@ ENTRY(__clear_user)
>   	j 3b
>   
>   	/* Exception fixup code */
>   11:
>   	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>   	mv a0, a1
>   	ret
>   ENDPROC(__clear_user)
>   EXPORT_SYMBOL(__clear_user)


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
