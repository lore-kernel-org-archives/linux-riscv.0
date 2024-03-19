Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060BCC54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqJD25LXUs6sz+6cPsvAnfgEjRDYf/5JTIKAFNkDZxU=; b=1+tZThQuJC4WNu
	M3nYQIjMcVS2acLL7yY37S/tleYiWDuMt3tlfSXsltBICyUM5dN7h7fgZZu6imzI4k8fZPktGESzm
	pv+NRm4PhwpBRbD9zTyp3bKof2N1xYHd1ge0TMsPRJ8KMCsRK+aezUXtBoQZgADOXfhKxku/wnf+z
	wW/Y0Bj4vaIA03ddV022RioVLSnD5r/S4Jj4VzE1ELypBHay0ehF1fjDsnr+kDnfAqJB/ZrqVJUq5
	z5h4a6fe5BkiuZkOZT7cL+dxf80MKGquOrYffmzmrh0widBnSZXdAynf2X510G+QDU6zeAyKrCdBM
	k+zu/044R1NgHitVD1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfQC-0000000E27i-2osT;
	Tue, 19 Mar 2024 19:46:52 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfQ9-0000000E26k-3FRB
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 19:46:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so1917997a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 12:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710877608; x=1711482408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEfqQMYpHT+mLEEWMqpipCvQSl9ONp1yIz4RNp/cJvo=;
        b=OrYUMmRjcZ2ClGrPAMM3w781hUFlp6bHL3/hhfU1bLMJo+OcCbUfoh829Gqq633AG1
         I1IfyloUhR05gYMGghcfaBs9H/N4wn7WBJqLWGtP9l64HC83Ubwmvs5Z9cnIHaDR86aw
         7lG6MXTYuJlyiLA0s8uzPOkbGxP7/+3lQk8XkYu/2ANXTfpEyoMuQ4JrUHon2vvyWh8T
         idSw2ZjP2YaPfVXLiKAp7T6o4bylSRuA0J5VloMd+o7+WKnDxcLhRmhMdagTwxGU6TmO
         IHNQwzDgvbcd6q9LWq23Omj4hBYCJsvGk1Rk2/gAURDWxOwOzXkSemBKjBnSedRTXmj1
         UFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710877608; x=1711482408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEfqQMYpHT+mLEEWMqpipCvQSl9ONp1yIz4RNp/cJvo=;
        b=pb5EoiL7T+jCyNRDLDyBEddHoc98tqnMtYLSeD5RBhlbhky43JuhBZLDKa2lHYEwhr
         T+94WUhDNpHFFQFqgZGG2KMGtn0JKLPHHqZwi5yrsVQS1k5dtW4SyvUZwgsLBpWMMaCX
         SEDNSCoFxaU+b/M7RlWKxHZKIYZzeUrWDLWjTPn6ELG732UfzZ6T7QC6qg28uuaWv91r
         5h/S/OtjXC0Dtlqjhv8CRTc3ZSy+eSyxgadmMHOtCC+hnXetKAP+qBj+0HyYg4qqQ1u2
         yFzbs3jvexypoGNwwoC5JAIVxIkbXXD1Iz2wtvfcOBbEvYTrs7ASa3thr9eCrjC1Erwp
         zhSw==
X-Forwarded-Encrypted: i=1; AJvYcCV35f8DGwZsysBrhjP2HZ3PnfBtq3r1AIhtHnmPOrL2hYS4lR+O4uhkBXsYFrqdGJN4YlBi+zPqtF7HIkDhzs1wgAOYH7YXemnkmimaEaaX
X-Gm-Message-State: AOJu0YyTUTwqeYwCZm8uPiAYHsKtXKYsk0VXbYxsKe5/pCcQNc/m4Dz9
	k2RyDns2Zv4N9b8F8+piJOfE4w8e+xF7CBIY7vKVGDhlc9XvtOCbIuFm0cgCSfs=
X-Google-Smtp-Source: AGHT+IHhNrRvQWeD27wPMAcbezsog+p7JKwlthEaikJqnF6LIE09EOJOnc2q/lrvDHUVUDG6NBVGhw==
X-Received: by 2002:a05:6a20:2042:b0:1a3:529a:9cd1 with SMTP id x2-20020a056a20204200b001a3529a9cd1mr9477350pzx.43.1710877608154;
        Tue, 19 Mar 2024 12:46:48 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id v14-20020aa799ce000000b006da96503d9fsm10149006pfi.109.2024.03.19.12.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 12:46:47 -0700 (PDT)
Message-ID: <37249973-fa73-401e-b5eb-7fd13fc38996@rivosinc.com>
Date: Tue, 19 Mar 2024 12:46:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: use KERN_INFO in do_trap
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org
References: <mvmy1aegrhm.fsf@suse.de>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <mvmy1aegrhm.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_124649_869663_F8AE486C 
X-CRM114-Status: GOOD (  13.48  )
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

On 3/19/24 08:40, Andreas Schwab wrote:
> Print the instruction dump with info instead of emergency level.  The
> unhandled signal message is only for informational purpose.
> 
> Fixes: b8a03a634129 ("riscv: add userland instruction dump to RISC-V splats")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2: clarify commit message
> ---
>   arch/riscv/kernel/traps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index a1b9be3c4332..142f5f5168fb 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -121,7 +121,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
>   		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
>   		pr_cont("\n");
>   		__show_regs(regs);
> -		dump_instr(KERN_EMERG, regs);
> +		dump_instr(KERN_INFO, regs);
>   	}
>   
>   	force_sig_fault(signo, code, (void __user *)addr);

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
