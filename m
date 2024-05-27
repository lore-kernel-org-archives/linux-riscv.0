Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C32C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7Xo08DWPZIw6eyrB8ub8rrX4R7Co9MR393c/cymXWM=; b=xe4iRPelvsPnSXB++R0lG1/6fj
	nGrEHxk5wA1XNDGkYX9HSTyCdtwIwwypCpPw3Xc5MxviVmmPPzT9ysNCpDx9E4/e/rjnsMGdmUszv
	ezR9HZugBtdzPb8+qrOP8o2gXWyXcvafjCX0y+6YuJToqEk/GT8oJt6nlhOfN1joAbdwlnHHH8ES2
	qGxB8gYhba3uLMvRhayfGB2gpobgc1Nn1TAmWnMHyZLHSlxJm9HlHDjqDAPUnPnkfXHTQhe2SwIg5
	7rv1FtpwYVGSs4Ql/qX5VVbTk2PTswwZq0Nsm+kp5AAGTxmgUjRexar1ZyDgkZBqKE1W3EfJ3SBex
	OfO8Gz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHl-0000000EpQN-2DQb;
	Mon, 27 May 2024 12:17:05 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHg-0000000EpMn-1bTA
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:17:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B5AA60011;
	Mon, 27 May 2024 12:16:57 +0000 (UTC)
Message-ID: <fb039f36-07ad-488b-a988-c149a68ef177@ghiti.fr>
Date: Mon, 27 May 2024 14:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] riscv: cleanup XIP_FIXUP macro
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <19e63324d7a099f561c4a2e55f7df051bd5b8a6f.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <19e63324d7a099f561c4a2e55f7df051bd5b8a6f.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051700_808979_78AF2A36 
X-CRM114-Status: GOOD (  18.24  )
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

Hi Nam,

On 10/05/2024 08:28, Nam Cao wrote:
> The XIP_FIXUP macro is used to fix addresses early during boot before MMU:
> generated code "thinks" the data section is in ROM while it is actually in
> RAM. So this macro correct the addresses in the data section.
>
> This macro determines if the address needs to be fixed by checking if it is
> within the range startting of ROM address up to the size of 2 * XIP_OFFSET


s/startting/starting

And the sentence lacks the final dot.


>
> This means addresses within the .text section would incorrectly get fixed.


Yes, but XIP_FIXUP() should only be applied to data symbols so I believe 
this ^ is not relevant.


> Also if the kernel size if bigger than (2 * XIP_OFFSET), some addresses
> would not be fixed up.

s/the kernel size if/the kernel size is

>
> XIP kernel can still work if the above 2 cases do not happen. But this
> macro is obviously incorrect.
>
> Rewrite this macro to only fix up addresses within the data section.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/pgtable.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 58fd7b70b903..fbf342f4afee 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -139,11 +139,14 @@
>   
>   #ifdef CONFIG_XIP_KERNEL
>   #define XIP_FIXUP(addr) ({							\
> +	extern char _sdata[], _start[], _end[];					\
> +	uintptr_t __rom_start_data = CONFIG_XIP_PHYS_ADDR			\
> +				+ (uintptr_t)&_sdata - (uintptr_t)&_start;	\
> +	uintptr_t __rom_end_data = CONFIG_XIP_PHYS_ADDR				\
> +				+ (uintptr_t)&_end - (uintptr_t)&_start;	\
>   	uintptr_t __a = (uintptr_t)(addr);					\
> -	(__a >= CONFIG_XIP_PHYS_ADDR && \
> -	 __a < CONFIG_XIP_PHYS_ADDR + XIP_OFFSET * 2) ?	\
> -		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> -		__a;								\
> +	(__a >= __rom_start_data && __a < __rom_end_data) ?			\
> +		__a - __rom_start_data + CONFIG_PHYS_RAM_BASE :	__a;		\
>   	})
>   #else
>   #define XIP_FIXUP(addr)		(addr)


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
