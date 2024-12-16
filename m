Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA53E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAD6Mk5VOlxe+k9joZfFgnCyazbQWsudiLXauotH4qo=; b=MraZbomYOMzf0V
	IdpOYxSJPwFKtm2tsuUJjbmxZYamnRieWdUTWAy9gqeiluSQiNSh+dayJpm8uHV8mxApfdTGvDZz5
	5f576HBK27xoBZPIxCLBpqY4EqV6FlB6PXGDRkNXbHI7B8kYE6jsVLyZ9H10Lx+EF8LhJ1KXJK0AG
	A5mn0TfmLv8SecFPRUFo3MBOEISYyfGGRuEVneiYcwGq9trgrsWrzLgsTLWDbRM17LlWFfP1iVJUJ
	tUzlTUjAmDbYC6OpqQhihCcVqIj4aO87e0o9Li3TQAM/hDMabdTWzKqpawUgw5oVlGbPwOlYowgmX
	K9QJZuyUuTk1QAaMzdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6Om-00000009NsR-2gJp;
	Mon, 16 Dec 2024 08:24:16 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6OJ-00000009NkT-2Ouh
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:23:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EA1F240008;
	Mon, 16 Dec 2024 08:23:40 +0000 (UTC)
Message-ID: <4110cdab-7658-4820-a809-da326e4ad3e7@ghiti.fr>
Date: Mon, 16 Dec 2024 09:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition
To: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de,
 alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20241215135252.201983-1-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241215135252.201983-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_002347_758929_8F9704EF 
X-CRM114-Status: GOOD (  10.94  )
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

On 15/12/2024 14:52, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When CONFIG_RISCV_QUEUED_SPINLOCKS=y, the _Q_PENDING_LOOPS
> definition is missing. Add the _Q_PENDING_LOOPS definition for
> pure qspinlock usage.
>
> Fixes: ab83647fadae ("riscv: Add qspinlock support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   arch/riscv/include/asm/spinlock.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> index e5121b89acea..52f11bfd0079 100644
> --- a/arch/riscv/include/asm/spinlock.h
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -3,8 +3,11 @@
>   #ifndef __ASM_RISCV_SPINLOCK_H
>   #define __ASM_RISCV_SPINLOCK_H
>   
> -#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> +#ifdef CONFIG_QUEUED_SPINLOCKS
>   #define _Q_PENDING_LOOPS	(1 << 9)
> +#endif
> +
> +#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
>   
>   #define __no_arch_spinlock_redefine
>   #include <asm/ticket_spinlock.h>


Yep, good catch!

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
