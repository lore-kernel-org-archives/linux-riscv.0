Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D8BC36002
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 02:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvUO5xxI2fHNb73VMqUo7Bpb7vBe8/zkIYulaCWp9PI=; b=TYUFe3NUg28lGR
	+wKvX9wH2PnYsUXB+JQlFI8iiHfg/LAQyL+VonXS9kTNjHJBMu21pfMQ7gLbZkmMJ4RqtB17a/gK2
	SWZ9XU7Qw76NzylN7mqTYTA8J20Puo7N+CqYZchEeZEbJ2ejibNUszw/Qa3PygYV1mJTD1lOWdRK5
	V+VEf226McwFDoM+M/dvYnqjF3/gsxvpnB5kQissuehb5XpDIJJarGgc2PZpqtRFCb0OneQaVhKEM
	ONBD/iy7HyiJhiNv4MQbMF3kyPrJ6E7e2/B7p8C1y5lTMcfMMKpjHml6q9vlMumiqZkH5mhINyXl1
	yLYIVAh5HwHyEe2bNtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twu8m-00000004hFD-2W7S;
	Tue, 25 Mar 2025 02:35:44 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twu8k-00000004hEq-1g4y
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 02:35:43 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d45875d440so24561135ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 19:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742870141; x=1743474941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP1g4WGEQjeKx9pF4VwRKEHZWt/9BpkRBedLjRMdTF8=;
        b=WoW/R3vdITH6NbFQOSLcUJnjrSsAbum6AMwrrU+NwkybBe7fvlj2dudQ4HiEWasQp9
         BVdH1ru5NqGzkAnqYNzsa1wy05SDobnaodCbAoutvJBjXdSTDXXzcv86V0649dtNjalM
         le9NuJ1bwkvIT8X164WG1HIXlrZqmiFRWhzcMAbvctt4WdrmInJ0UD3r/Rq4UxYGW8wb
         6mHgXeAityjAwYJj58WxNamnvffDglIpcgY+kurkv+TpWisDlOqn/quY/DPhMR83g558
         dwmU+zi+TgyQMRAnkQJFSkon7nhWo8wntoNrTeGts49r4iHdWgbQ5PY5v0ukTl7oRoMX
         owWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742870141; x=1743474941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GP1g4WGEQjeKx9pF4VwRKEHZWt/9BpkRBedLjRMdTF8=;
        b=UuLg9D5ce0EFtM7qgpaizEYYHAhF7vZwyOdJ2doQl16jw2N46igNU/8fGqBm+Y9WYI
         vwV11ly8k+pusB4hHvJX+2rg7OS/egSTEIH3vkswLbUreSSMQDuicCcxVmRRwStCSJSw
         a1y5zD6+rcACcbLzs/nxVfTgGF8CPxAFLaa8zWaOaoDN/e+3pA2pdp9Z1WF0PzX/5KqM
         Ud/HQvQ99h5OgFuglenl28t6H6gUjcoNKVt7gSA3bcJ9VVY7qqRlHK2vKmgohFc+dNbl
         e/WdpSVUjdAzLLPVhz0jJTmgpZaV4Rm20oYyPZIIiDe9X1AC/bbRWUtUD/l3WaYwoufS
         eH6w==
X-Forwarded-Encrypted: i=1; AJvYcCVl3lcv6fMBRTwjmcDeUWfdVRWlhyUmH6sDiRSdvdnuCew62RUmuv7PBK8mrZKhR5T5aE7utiLAbMwI9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLHcUhx14TYhAjH6XMfcytcV92M41oV/MUfGOAa3c6oaWSYIIJ
	KfrJJQFHQYBwGIkc5ubdTZg4cvIdzW/xWRgs5mVoY0tp7017mAVPApKLresJxyI=
X-Gm-Gg: ASbGncsk3Xp+kyiI+2u74lHuwhJtTXxNCdoLxQiZE/V6dLuqd9dEHCl8Egd+jnx5atG
	gXSz0RErp0AS3u4zRz2otVfNgFsjTjDjEEEpP47krc463A2Bze0wngqBhOdrggjBIwEBz3jN5O6
	jzZrpRhJEuhWeMbyB7PbU9gg2wgUvIJFtqwiyE27XQsRQMGr2lp6Beo1VO0Hw7rDv33/EqWkOlG
	fcrCk6H79GfBg/AWJLvqMXuaaNaaJORdrdZ3ry6oMlCPSZffcKGyYFJOs0c7U+3/Uo26Eht1TfF
	uztiu+oxdcW3go07DR6sm16R1mgi37F7xWYwe1L6SiekWSg8JCd44s1KJtsyaw==
X-Google-Smtp-Source: AGHT+IHoO2mUdNStDkAJ0PN4Y8/X7eJhlSrEmAcUGr5BpBZXvMsEO/6OaiDFtNns3KvOVx0B86Rmtg==
X-Received: by 2002:a05:6e02:1fe2:b0:3d3:faad:7c6f with SMTP id e9e14a558f8ab-3d5960cd064mr125511535ab.5.1742870141386;
        Mon, 24 Mar 2025 19:35:41 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdeac0esm2106900173.70.2025.03.24.19.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 19:35:40 -0700 (PDT)
Message-ID: <4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com>
Date: Mon, 24 Mar 2025 21:35:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Huacai Chen <chenhuacai@loongson.cn>
References: <CEF1937DAC500D66+20250322062836.362600-1-wangyuli@uniontech.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CEF1937DAC500D66+20250322062836.362600-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_193542_447547_8D8FF15F 
X-CRM114-Status: GOOD (  17.76  )
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

On 2025-03-22 1:28 AM, WangYuli wrote:
> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
> symbol using inline assembly.
> 
> There's a potential issue where the compiler might inline
> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
> symbol multiple times, leading to fail to link vmlinux.o.
> 
> This isn't merely a potential compilation problem. The intent here
> is to determine the global symbol address of kgdb_compiled_break,
> and if this function is inlined multiple times, it would logically
> be a grave error.
> 
> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/riscv/include/asm/kgdb.h | 13 +------------
>  arch/riscv/kernel/kgdb.c      |  8 ++++++++
>  2 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 46677daf708b..566ab1bc66fa 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -17,20 +17,9 @@
>  #define BREAK_INSTR_SIZE	4
>  #endif
>  
> -#ifndef	__ASSEMBLY__
> -
> +extern void arch_kgdb_breakpoint(void);
>  extern unsigned long kgdb_compiled_break;
>  
> -static inline void arch_kgdb_breakpoint(void)
> -{
> -	asm(".global kgdb_compiled_break\n"
> -	    ".option norvc\n"
> -	    "kgdb_compiled_break: ebreak\n"
> -	    ".option rvc\n");
> -}
> -
> -#endif /* !__ASSEMBLY__ */

Why remove the __ASSEMBLY__ check? This allows the header to be included from
assembly source files by excluding the C constructs. It is still needed after
moving arch_kgdb_breakpoint()

> -
>  #define DBG_REG_ZERO "zero"
>  #define DBG_REG_RA "ra"
>  #define DBG_REG_SP "sp"
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index 2e0266ae6bd7..5d1ce8dacaf5 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>  	regs->epc = pc;
>  }
>  
> +noinline void arch_kgdb_breakpoint(void)
> +{
> +	asm(".global kgdb_compiled_break\n"
> +	    ".option norvc\n"
> +	    "kgdb_compiled_break: ebreak\n"
> +	    ".option rvc\n");

This is a separate issue, but using ".option rvc" here is a bug. It will
unconditionally enable the C extension for the rest of the file, even if the
kernel is being built with CONFIG_RISCV_ISA_C=n. This function needs to use
.option push/.option pop.

Regards,
Samuel

> +}
> +
>  void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>  				char *remcom_out_buffer)
>  {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
