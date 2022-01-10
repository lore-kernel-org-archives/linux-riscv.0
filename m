Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C44C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxfxDx1tyEhoa0CZK1LAzUKeniUG4p+KT4bfFLN2iFs=; b=wnjxzQsrWUqFQotyQdbSycdaGU
	Ly6WeDpqJVYH4a4n7inqjsJzUyMmjX/myRXj4v5fR/Wh/yC9V7kjQhmcgy5xou1IreJ/qinT8t3lg
	vZbZVlxzE4xJuWezBaywX2HbCSjWVVsDW0WrVEXbgW6e2ryCqZb/MaYB33o7exjK5ORqvkAyApv2u
	krZOqkZ7go9AHgy8o1+DRkqMGsDdHDQnMOqroIurapUcN3X/rJAvuqFnTNqDvlgX9YAXRIw/tB7VD
	98dBlgi1AEYYpJmjIQO7rndyM6y+unYV63v5fs91xPVJo//sVNLLs2iDtDUfJeeuV92Rpf6kCgIXl
	iCWPp7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6pf5-009lZ2-ND; Mon, 10 Jan 2022 08:04:15 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6pf2-009lXC-5f
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 08:04:14 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A184240003;
 Mon, 10 Jan 2022 08:03:50 +0000 (UTC)
Message-ID: <44e6e00e-0b80-8329-bcc9-820940e02023@ghiti.fr>
Date: Mon, 10 Jan 2022 09:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 12/13] riscv: Initialize thread pointer before calling
 C functions
Content-Language: en-US
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <20211206104657.433304-13-alexandre.ghiti@canonical.com>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211206104657.433304-13-alexandre.ghiti@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_000412_409560_AE10325A 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Palmer,

I fell onto this issue again today, do you think you could take this 
patch in for-next? Because I assume it is too late now to take the sv48 
patchset: if not, I can respin it today or tomorrow.

Thanks,

Alex

On 12/6/21 11:46, Alexandre Ghiti wrote:
> Because of the stack canary feature that reads from the current task
> structure the stack canary value, the thread pointer register "tp" must
> be set before calling any C function from head.S: by chance, setup_vm
> and all the functions that it calls does not seem to be part of the
> functions where the canary check is done, but in the following commits,
> some functions will.
>
> Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>   arch/riscv/kernel/head.S | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index c3c0ed559770..86f7ee3d210d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -302,6 +302,7 @@ clear_bss_done:
>   	REG_S a0, (a2)
>   
>   	/* Initialize page tables and relocate to virtual addresses */
> +	la tp, init_task
>   	la sp, init_thread_union + THREAD_SIZE
>   	XIP_FIXUP_OFFSET sp
>   #ifdef CONFIG_BUILTIN_DTB

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
