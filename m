Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5C5D12D55
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Nov 2024 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saGLOGVjvDjBjSecbEih9mc9GOrajOYQ2uDiBLDjtLI=; b=vMDMdoCK1Uj7ZJ
	UT1G791+GFsDmogboZOtN2zNFaElU+7fRh8bi06YQXVL3u8tyhQGCwGVk0oz0j3XDzpY5CtZ6Dxer
	Jzr5ka5dVHqkVGo6nwBIfL9A/JUT4Kh8STxi6K4lWfCLrFi470kz/j5yt2RrvOWzUxet2Q2KAj58a
	rK7k7E0PTp7hoTqyNDyH+VriNLvaKG1IUB3O1fRK2ea+H8E6Xq0rWWjmodcDlO0w9bIcvFZfVG4L8
	zqWLgUP1aBZMbG0rm0F5vPA8LE1ME7HIiAO4aWjTUETQLx+HLkrGGAzmhdmr7q2PTcyV9gQdu5krj
	SLWqgq1bUygUbIv8nR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFHr-0000000Fc0C-2ar9;
	Sun, 10 Nov 2024 21:15:59 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFHo-0000000FbzZ-3w5b
	for linux-riscv@lists.infradead.org;
	Sun, 10 Nov 2024 21:15:58 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-460c2418e37so31228831cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731273355; x=1731878155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AG8mReJsrFYSFuqEgfHLQC6MR+XTmmn8w2H1oDxPNbo=;
        b=GIFt7u1LKpAPD2tDrhiu426ghnU41bB4BBasZxuwJo/5AgljXfAp6KE/dLvNZdiM1H
         kAjr7HlntvYmmouE4z7+E5ENAklOSJlosUNhAbo9CVmwSBSH8OdVQ2WwhJXmLaLAQMyV
         HRrNSv7ScYxcDufidaUxIlW6aEFAfgIHtr4Ea3QhMl0Bkcx+r7K1C/CDrLIsllNjPMOs
         bU/dT+7eK72GkdT0hnfzh1doLNpEv2zjMdc3sMnHGefGeAzT9ylqSVSf4Fq+SZnQyavM
         yNS+t0JXo0Vnc8CFPmwXzNc6aZet2grufBXOeCiJMbOdjiukUGOgZu8mTW7MT7L7o4Hv
         pmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731273355; x=1731878155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AG8mReJsrFYSFuqEgfHLQC6MR+XTmmn8w2H1oDxPNbo=;
        b=QOsVD/y8kF4Jfbb3L3ofR0L3Yc8OUXbG2Zfsy/NWSrSth0SR6Y1iuSyBL3zIs+DAtS
         x88jKsw0TIwTJ0DH09il6wVoahYx6t6KO6/2eEcOWeH3gntx/TS55006T1OxZPVMzU6U
         Fhlm4J3slfce5d7Lp8de4BKQ0XXnpuWPT0yPcpCy8kXAb7jLDkojuhadzp7qJwgvU2s6
         AXM6Gkp6GxvoEPMfMNZsqHPTIYUFd6OlkSpkjDlkpUekjmX5zSHmWhLxEttidfiGMRQs
         4xB4gy66OFmb6a5wuUM2m9oQYoL9vGm3zUT5iw25Dd+ADX2TwPBlL0lr4YXTkZPpW5Xi
         ewDw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHR1QzW3psGbYjjz8xZ0gCdY0s02f3kEqLN+31kxP8VLeYubFeLcC4nbkAkRTtveDWLJnX60C34y62Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8NgfAjaul/7fJu+1ZKByillN/PpGFUV4NWY+6zSqC2w9g8WB
	uLGbJ2vcJqVzPdVQLg20Ei+PCFaNejAQ7MIoFQ+UYp1kGZNmYOqd
X-Google-Smtp-Source: AGHT+IEUA21eJT6RC7BGoCrGQUVP+nm95ovUgv7XydgYTHvq0Jcdo48GbJHMhG6cNEi8Ea0f+JicQQ==
X-Received: by 2002:a05:622a:4d:b0:460:c5b2:58b7 with SMTP id d75a77b69052e-4630942cc70mr139025861cf.51.1731273355031;
        Sun, 10 Nov 2024 13:15:55 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff3df534sm51691451cf.10.2024.11.10.13.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 13:15:54 -0800 (PST)
Message-ID: <208f8a06-c176-4377-8255-7800ecd2cf6c@gmail.com>
Date: Sun, 10 Nov 2024 16:15:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-next v2] riscv: Fix default misaligned access trap
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108-fix_handle_misaligned_load-v2-1-91d547ce64db@rivosinc.com>
Content-Language: en-US
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20241108-fix_handle_misaligned_load-v2-1-91d547ce64db@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_131557_015429_BEF8C14D 
X-CRM114-Status: GOOD (  13.30  )
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



On 11/8/24 18:47, Charlie Jenkins wrote:
> Commit d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses
> supported") removed the default handlers for handle_misaligned_load()
> and handle_misaligned_store(). When the kernel is compiled without
> RISCV_SCALAR_MISALIGNED, these handlers are never defined, causing
> compilation errors.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Jesse Taube <mr.bossman075@gmail.com>

Thanks,
Jesse
> Fixes: d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses supported")
> ---
> Changes in v2:
> - Change CONFIG_RISCV_SCALAR_MISALIGNED to CONFIG_RISCV_MISALIGNED
>    (Jesse)
> - Link to v1: https://lore.kernel.org/r/20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com
> ---
>   arch/riscv/include/asm/entry-common.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
> index 7b32d2b08bb6..b28ccc6cdeea 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -25,7 +25,19 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>   void handle_page_fault(struct pt_regs *regs);
>   void handle_break(struct pt_regs *regs);
>   
> +#ifdef CONFIG_RISCV_MISALIGNED
>   int handle_misaligned_load(struct pt_regs *regs);
>   int handle_misaligned_store(struct pt_regs *regs);
> +#else
> +static inline int handle_misaligned_load(struct pt_regs *regs)
> +{
> +	return -1;
> +}
> +
> +static inline int handle_misaligned_store(struct pt_regs *regs)
> +{
> +	return -1;
> +}
> +#endif
>   
>   #endif /* _ASM_RISCV_ENTRY_COMMON_H */
> 
> ---
> base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
> change-id: 20241107-fix_handle_misaligned_load-8be86cb0806e


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
