Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE1C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYrYU2Bhzuat5WuYSwE0N7caoMNeZ6xCSikflbcWSj4=; b=XpC6+HfRMD6JAw
	w6nQwIeW0Ht1tIzioc3CdjEfdR7uozpr8cHGyVvQWmOSVoAyeM02YE0YH8LHxRgp9G3oPF+zoR0h3
	lZ6j3i3FV0QD+mR4mPxu+vurupWTOMMi0Zd0RK7nYxRW4hSdYYI03tFRE2KrvG2HV8s5Lksvo/M9B
	Hf6lgI6bulU10QS64/bvywrHv1X379FgxTtH8gOLb19WqIrVxDaIfrI0fCVlGgQLWo0XmUGEFuMCd
	zePv4qOJchVQ+zus4xAOYOrdjNF3iuA/gL2320Pe7ocLnuLKTqufQTpcSdiSQIVZENvXjw1DIL2NL
	/Lbm4/qgux9spyKJgV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seWn7-00000009UEh-3APB;
	Thu, 15 Aug 2024 09:29:09 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seWn4-00000009UEM-3FjC
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 09:29:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6379C0007;
	Thu, 15 Aug 2024 09:29:01 +0000 (UTC)
Message-ID: <384451e5-e2af-44f7-a5b5-894049232e09@ghiti.fr>
Date: Thu, 15 Aug 2024 11:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: misaligned: Restrict user access to kernel memory
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: stable@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@codethink.co.uk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240815005714.1163136-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240815005714.1163136-1-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_022906_999723_25B8857F 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Samuel,

On 15/08/2024 02:57, Samuel Holland wrote:
> raw_copy_{to,from}_user() do not call access_ok(), so this code allowed
> userspace to access any virtual memory address.
>
> Cc: stable@vger.kernel.org
> Fixes: 7c83232161f6 ("riscv: add support for misaligned trap handling in S-mode")
> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/kernel/traps_misaligned.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..1a76f99ff185 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -417,7 +417,7 @@ int handle_misaligned_load(struct pt_regs *regs)
>   
>   	val.data_u64 = 0;
>   	if (user_mode(regs)) {
> -		if (raw_copy_from_user(&val, (u8 __user *)addr, len))
> +		if (copy_from_user(&val, (u8 __user *)addr, len))
>   			return -1;
>   	} else {
>   		memcpy(&val, (u8 *)addr, len);
> @@ -515,7 +515,7 @@ int handle_misaligned_store(struct pt_regs *regs)
>   		return -EOPNOTSUPP;
>   
>   	if (user_mode(regs)) {
> -		if (raw_copy_to_user((u8 __user *)addr, &val, len))
> +		if (copy_to_user((u8 __user *)addr, &val, len))
>   			return -1;
>   	} else {
>   		memcpy((u8 *)addr, &val, len);


We could even do the access_ok() *before* even calling 
handle_misaligned_load() in do_trap_load_misaligned() to back off 
earlier. But unless you think it is important, I'm fine with this patch, 
it's on my list for -fixes!

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
