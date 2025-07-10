Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3038C83F10
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 00:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kT6+vfm+TDN2/w2G03lsc+mp8/KshdU/kzGH/SItEI=; b=kSEFpufXCeQ534
	mHQjBPtfUDDea9f3kb8Pdbvfw6FsPxYKrCAfGbQZenO1TXgHNTnRSLOVHQvMlMGLRKzmdir8SNpx/
	mZ/yK/Oqk6ikfB16OYGtlJ/sA+fPU2EHYLMkkOloOU5vTLDsiWznbUh5uaxDq74cHzInnUBHSksLy
	5ryaX07y6gJ1QhrXCS8BY+Jzps+vPfkZo0Vh1O56oGs1pe9Ncd8A4L/8c5QfMANwzyPr0m6Fb7X2i
	XeV9ssJ7FDEaDj5KjWbisLUS1MZQpYTbz2Ye3j+hrHFVOxzU53pdGoQUTViP9PnVoVBXeYWMEsPIN
	CbhOVO5GCE25PlcLKQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeo6-0000000AIQi-1teM;
	Thu, 10 Jul 2025 00:06:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeo4-0000000AIQF-3HLd
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 00:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4765C45B06;
	Thu, 10 Jul 2025 00:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB65C4CEEF;
	Thu, 10 Jul 2025 00:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752105991;
	bh=6A1NBhselrYKFebK5UkZ4t+OQWLuowk2Z0FQ1uuVC64=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ORrp505S3OyLA/3F6Zb0Y0y8cn5Lu2zljTqBIaGRCRwYeqQtjUiF6wEtSc1mo08mX
	 R01OKtsPlkmiarEki3GD16wHxliQRXlIyvcQDzdWSQSyYs3laLDnOTB5k+FvHsT40T
	 M3sQyQweEj7VNaLd4zOYHV56RNTEjbe6T6W7z1v8qx7F656fzr6BqRNJCArOlXA8Dn
	 hph5s1r8cuIp7XGNTG2W+g52NWg0PAwG56/pXF2VU7mGptLOx60UlWc6c+HiT3yQzo
	 zypq3fds3IWGRNOI2rfI9EcNmwY48Yd4+34b/54rTC+yOO6Ma8HSb/o8fy8F3VkQvy
	 0NhNpOFlPaECw==
Date: Thu, 10 Jul 2025 09:06:27 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Han
 Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi
 <ziyao@disroot.org>
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a
 race condition
Message-Id: <20250710090627.999979465d2c263ac2833048@kernel.org>
In-Reply-To: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
References: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_170632_872219_B1C988E8 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, 08 Jul 2025 08:33:48 +0000
Alexandre Ghiti <alexghiti@rivosinc.com> wrote:

> As reported by lockdep, some patching was done without acquiring
> text_mutex, so there could be a race when mapping the page to patch
> since we use the same fixmap entry.
> 
> Reported-by: Han Gao <rabenda.cn@gmail.com>
> Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reported-by: Yao Zi <ziyao@disroot.org>
> Closes: https://lore.kernel.org/linux-riscv/aGODMpq7TGINddzM@pie.lan/
> Tested-by: Yao Zi <ziyao@disroot.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/ftrace.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4c6c24380cfd9d6c51f0e4340cd674160b83a610..22e7bdf8de2b6ca950cf2c8b734bc82ea46ba8bf 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -14,6 +14,16 @@
>  #include <asm/text-patching.h>
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +void ftrace_arch_code_modify_prepare(void)

To be sure this is acquire the text_mutex, add __acquires(&text_mutex) here.

> +{
> +	mutex_lock(&text_mutex);
> +}
> +
> +void ftrace_arch_code_modify_post_process(void)

Ditto, add __releases(&text_mutex) here.

others looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> +{
> +	mutex_unlock(&text_mutex);
> +}
> +
>  unsigned long ftrace_call_adjust(unsigned long addr)
>  {
>  	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
> @@ -29,10 +39,8 @@ unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
>  
>  void arch_ftrace_update_code(int command)
>  {
> -	mutex_lock(&text_mutex);
>  	command |= FTRACE_MAY_SLEEP;
>  	ftrace_modify_all_code(command);
> -	mutex_unlock(&text_mutex);
>  	flush_icache_all();
>  }
>  
> @@ -149,6 +157,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  	unsigned int nops[2], offset;
>  	int ret;
>  
> +	guard(mutex)(&text_mutex);
> +
>  	ret = ftrace_rec_set_nop_ops(rec);
>  	if (ret)
>  		return ret;
> @@ -157,9 +167,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  	nops[0] = to_auipc_t0(offset);
>  	nops[1] = RISCV_INSN_NOP4;
>  
> -	mutex_lock(&text_mutex);
>  	ret = patch_insn_write((void *)pc, nops, 2 * MCOUNT_INSN_SIZE);
> -	mutex_unlock(&text_mutex);
>  
>  	return ret;
>  }
> 
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250708-alex-fixes-1e719b9899f3
> 
> Best regards,
> -- 
> Alexandre Ghiti <alexghiti@rivosinc.com>
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
