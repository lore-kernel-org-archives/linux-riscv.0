Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A770CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxHg/AuAsPh9oqRfxahaeazmAgGo0+gZGPDy+cXZ3hE=; b=VrkbbgEYa/XdAx
	e8+UCoKgJmQaOllNSqBX1e8gz7UvwGUsVbuWToRxnJXxjT0MlKMnmIVW2LJs3vQ44bnmSY3la6Ssx
	m5CGds6dj52OcajLfUaIm0Oz1vgkN+jDAo5fD5dTP10Y9wYurp9lvkWWCQPfMwNvQFOOp5UutNWiW
	cSpbZ4iRaamnbyMQBxTcVyb1eaPoRi5Mkq4Bm/4P/MPAxjUaWs4YnrdSkX2jxOzcl5YTHH1gf/d1q
	mE/CnwQS7IA3rwcJEy4eCPk9O+CawmSPl9ITf2i8CdXNfKWcobDp3aZtd+HTt/Fjyc82YXpF4T6MM
	6E0VbI6jHJdHKkkdjSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHgK-00000001fQ7-0cuF;
	Thu, 04 Apr 2024 07:38:44 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHgH-00000001fOY-1mjF
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 07:38:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C44C31BF20D;
	Thu,  4 Apr 2024 07:38:36 +0000 (UTC)
Message-ID: <7971e8b8-b18d-47ff-b7d3-4322ff2e2a1d@ghiti.fr>
Date: Thu, 4 Apr 2024 09:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
 <20240327143858.711792-3-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240327143858.711792-3-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_003841_648341_5172D974 
X-CRM114-Status: GOOD (  16.93  )
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


On 27/03/2024 15:38, Samuel Holland wrote:
> TASK_SIZE_MAX should be set to a constant value, at least the largest
> valid userspace address under any runtime configuration. This optimizes
> the check in __access_ok(), which no longer needs to compute the runtime
> value of TASK_SIZE. The check does not need to be exact, as long as it
> accepts all valid userspace addresses and rejects all valid kernel
> addresses; well-behaved programs will never fail the access_ok() check.
>
> For RISC-V, which requires all virtual addresses to be sign extended,
> the optimal choice is LONG_MAX because it simplifies the limit
> comparison to a sign bit test.
>
> This removes about half of the references to pgtable_l[45]_enabled.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - Set TASK_SIZE_MAX to LONG_MAX to optimize the comparison
>   - Reword the commit message
>
>   arch/riscv/include/asm/pgtable.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index f5cc8bcc7f8d..762a85551764 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -870,6 +870,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>    */
>   #ifdef CONFIG_64BIT
>   #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
> +#define TASK_SIZE_MAX	LONG_MAX
>   
>   #ifdef CONFIG_COMPAT
>   #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
