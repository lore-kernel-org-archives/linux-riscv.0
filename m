Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2DAC83F0F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VtMJTHEnbxAmatwhKMGtwGYp5Gxj/62zDCHdzU+qIqE=; b=OOG1QgttiSzz7rCzzBruR0zzzd
	p3DkkjaexiXmI7ouFlLURoYCx5zh+W2uuubJp1/JNKaFzf6mPfg89cm91Ppi0xVwzmVmtAnKK5mVr
	35Hb8pRAM+hR8bUjx+LYAPkcerCWQbrInFd74iWYbLxewnaIFRTu8abbo5TlF6eypemdADTa85kCt
	9pu0GgBxgKVfiDW0sj1rUuKet6ySiKuAFwU3m0qdby7vqwvTdsCvVyTAzO71LIUWNLbDTnrj9wKlv
	NgEY/HDOcicjUbEVJR84yQKFAsXXJQQdQtFyHp/D1dRC4ptxANHizb8U460zMVtZsSOXzxbCayFjs
	8Jxvla6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXMI-00000009HFD-2TTf;
	Wed, 09 Jul 2025 16:09:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVXV-00000008veQ-1d03
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 14:12:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235d6de331fso72179065ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752070368; x=1752675168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sh1G9uIyIrM8UVHoGgJ08SC2aKmJgvWNLWkVXNGTe4=;
        b=2nIfdrgLurhVnEWiFPd2hj48k3vpuTb36M4A2DeWwfMaaktXoTN0ZqdhcUk0+QKWLx
         P92lHVONWewDKVTxqy6PVW5NlLpiG7o5t04mprYfBiirYU/xOCgTzW/4R33yNR+OHgtx
         AOAMSj9q99JAs+VVi6ocBhfn2kIiM5J0ftaf5YFQc8HbxlKgMA73j4+vN9K70A7Pjmfx
         Xlm3lUp0F3oCTt5jnQh4Ncet3xefFL5ztE/yVHND/+2dg9tclIq7O3b4y9IncNOMIagc
         ibdyjMDmo+3ScATsZUZbcLhteIpC6iPmV4rkAnt4OZL2B737giTPvaR43IOlgwXpUt2c
         weCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070368; x=1752675168;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sh1G9uIyIrM8UVHoGgJ08SC2aKmJgvWNLWkVXNGTe4=;
        b=wzpLc2LQSP3ugNbU3JY6lTu2H0LpCDwPOPfxYFUxrgDVnFAp+BSpq92KQpvul89BE4
         h4HRmwDB1oMIPlgZC1ll2Td4wwL7B122D8iQfucGgMS+8ZtJWbO/BHFDawwGQp47I45p
         ISEg2EyV6nE1JohNXiqXewRE8FT+3Autw5qBgwfdufyDLbn4jdykFv3jpaJrvsoasfRn
         o8JSFMMA5my1z+afrTHPdjQ6+F+x9nKmLERvHNSqRRa0z33k/e++9eT88DHV/xKh5tI4
         GiSUhyoKr5ywoV25akFGM0fiwZ6o6w9aBnAN5k+uH+oveK38OZEXSVFSPK3kPI3lY2U3
         lSww==
X-Forwarded-Encrypted: i=1; AJvYcCVdUly5dMTkmFEY0CEu8UhT+6taAb0d256exA95EZZ+JKWpTdSm1t40a4voD6ZSHtbSjW+Kzl1SWo98iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNMPZgadVZW220yKEQkAFxo0P9U8LuyOB14rnUOLwbG9s7tJ2
	yN2Otwxocfi2hqWTAL4N+uNm9UMnv/Nm2f9YQAxZLkh0LwbJe+zENzOWjJ6N6vXPKBI=
X-Gm-Gg: ASbGncuTkh+8MDRxTrwnQLve98fAK8XtiPBoc3EotLGoY6uMFFaOBrAHZ5KuPuMMniF
	QkiCI0n2HMjrIaYnq3t73zo1DokfZSzTNgn2ICyDu5ABH3RRLP1n7Xe0dVH0dMybM/nLFodG7PH
	0M+krQX2dIKSUVlZkYJtPi0L5zHM8XzAi8EJRsdCJC5iaSXnV6XSMSI/ISLp1AI8MuBQJheBZnW
	F8br6RbJG17qZFIk0zAU3XceMr1UxkYkE3zS0E9K7ouwSGFhgDuE5g0aaelLl5N4c4tu0cGwyPj
	PZ3tdfeCZu7pADjX6WZrbLielPWeOILVwDuzor5N2LFFoE+36UX8H3jchlwy
X-Google-Smtp-Source: AGHT+IHi6+p1+2PoHOilD16rPwmlo4mLHV2Z957WubESw5P4eL10+2uXRGzrnzQf+fdNsRPxpzdLkA==
X-Received: by 2002:a17:902:d2d0:b0:237:7802:da30 with SMTP id d9443c01a7336-23de24d48e2mr986145ad.31.1752070368282;
        Wed, 09 Jul 2025 07:12:48 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:a219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c8431e1b0sm140531525ad.44.2025.07.09.07.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:12:47 -0700 (PDT)
Date: Wed, 09 Jul 2025 07:12:47 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Jul 2025 07:12:45 PDT (-0700)
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a race condition
In-Reply-To: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  rabenda.cn@gmail.com, wangruikang@iscas.ac.cn, ziyao@disroot.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-6AFAE150-B97C-493D-9699-545AABAC78FD@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_071249_662734_FE13A8A8 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, 08 Jul 2025 01:33:48 PDT (-0700), alexghiti@rivosinc.com wrote:
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
> +{
> +	mutex_lock(&text_mutex);
> +}
> +
> +void ftrace_arch_code_modify_post_process(void)
> +{
> +	mutex_unlock(&text_mutex);
> +}

IIRC there's a reason we don't do it this way, we had (or had tried to) 
have it before.  It's been a while, though, and I'm just having some a 
coffee so may I'm just wrong...

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
