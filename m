Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA2EE3F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23oJApvexparteeq20c/eR7tZDSBOZ01HxjpIPf25Kk=; b=oP2BFIn4U747Qq
	7T2p79wb9oJE3gZMKmRvoKh0qBBc56KqNEuPHGO8WnSjr2FKqJ09ektuywymEU5wYuJ7yVudqcpHY
	aIWVNI3j/+IYEUFrKIfiyr/Vw2WsxWjBFwGCvnCPm8Yf+81zrfaiKaF3Y0QgHt8vy0mjDcj9FgAKy
	dtKRUpp5Gml8o4pRvOum94+8elR1QfbK002hZPj/wsvkdFraa+ZuvDFUUAVvnueVfAV5hpq1kDfoo
	m0HLz9sZrxbemM5pa6t0GQgXA7hGZK2GIww5s+p3UZB6WbPDoJBAWjyRQzNRm1AcKQntR/FrCxeT/
	NyN3nngVhhEFlr3+xB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2Ec-009trv-0s;
	Fri, 15 Sep 2023 06:23:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2EZ-009tqx-28
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694758998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h49HJZ/O577BqKvSVyAVyTrcbTxM3sCo8B/Q+wbyQ4s=;
	b=aQMWXYcBeXTCbrRyYq8fzs6BBjH0TBlJ4I9UYJ1Xk2tfYeBYbHT26Xi8yYoYY70rbrQyGp
	jl9bjSY2OMexqhfwPG1s2n7DUf5tydfbMNw65bVf3xKdbWLPf2EYXuzNwCn/tgx3EWtNfv
	ElGF1Uwr/9MG3oDLJhfSl2PxWlZC5Js=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-ZZd8S3dENOGrVUBtKdMLCg-1; Fri, 15 Sep 2023 02:23:16 -0400
X-MC-Unique: ZZd8S3dENOGrVUBtKdMLCg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3aa0f368130so2717578b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758995; x=1695363795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h49HJZ/O577BqKvSVyAVyTrcbTxM3sCo8B/Q+wbyQ4s=;
        b=uaZy+tEi6cXM4rl2kVZRumcb7dsmRCzcjMw18n8pr+b+iqFjMzaYLF8jKTPnRGbssq
         mqXNZwlzp4y6ZYz8vQzP/RL792egmLCK7g3c8Po6S58T9xGYFIhPbNnBSIyunU0hisko
         agA0J+/OlBLvau03RkV6MOJtHpLAC7JTgiNwvlBDyjf6SZR2L8d2+6UJEIjwB29P1K9Y
         GGOyZdzUR+lToZtXLo3HFd+M0FKzhc5bxK2B3Nx/ep2nUbri8CfPltktw/gXbRPlG7te
         x/EgP1o0GV4w/hRzS8VKpWBIrxRdkKLDLgjwScUUMAsb604iDqnA9CQnCuhLTmLFiqaZ
         lyXA==
X-Gm-Message-State: AOJu0YzdX4RYa1lphOTJHDbQuKTNRgvo0+FMLQCnWX56tvgS9AI5/OFm
	qs9a+vgzSJG105yHn+UlYteUU4LwXJgiNo9uZpj9WjmvvDFx1GGvesiI8BGFhP7vneonBG2k9Xg
	rfqkeVLkXUPTM5vII37c1WXSKgu2W
X-Received: by 2002:a05:6808:15a4:b0:3a1:e12b:2f80 with SMTP id t36-20020a05680815a400b003a1e12b2f80mr1008561oiw.35.1694758995691;
        Thu, 14 Sep 2023 23:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnXl+iWXUNkjlGJTgGvcCE0+QSxnHePkAelhd7hHtYCVfy9sGfEJ3pO9ERuYXBQlky5+8lHw==
X-Received: by 2002:a05:6808:15a4:b0:3a1:e12b:2f80 with SMTP id t36-20020a05680815a400b003a1e12b2f80mr1008543oiw.35.1694758995419;
        Thu, 14 Sep 2023 23:23:15 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id e2-20020a9d7302000000b006c0d686f76esm1338510otk.63.2023.09.14.23.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:23:14 -0700 (PDT)
Date: Fri, 15 Sep 2023 03:23:05 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 13/17] RISC-V: paravirt: pvqspinlock: Add SBI
 implementation
Message-ID: <ZQP4SXLf00IntVWd@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-14-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-14-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_232319_795810_BA269C12 
X-CRM114-Status: GOOD (  20.01  )
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

On Sun, Sep 10, 2023 at 04:29:07AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Implement pv_kick with SBI implementation, and add SBI_EXT_PVLOCK
> extension detection.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/sbi.h           | 6 ++++++
>  arch/riscv/kernel/qspinlock_paravirt.c | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index e0233b3d7a5f..3533f8d4f3e2 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
> +	SBI_EXT_PVLOCK = 0xAB0401,
>  
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -243,6 +244,11 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>  
> +/* SBI PVLOCK (kick cpu out of wfi) */
> +enum sbi_ext_pvlock_fid {
> +	SBI_EXT_PVLOCK_KICK_CPU = 0,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
> index a0ad4657f437..571626f350be 100644
> --- a/arch/riscv/kernel/qspinlock_paravirt.c
> +++ b/arch/riscv/kernel/qspinlock_paravirt.c
> @@ -11,6 +11,8 @@
>  
>  void pv_kick(int cpu)
>  {
> +	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
> +		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
>  	return;
>  }
>  
> @@ -25,7 +27,7 @@ void pv_wait(u8 *ptr, u8 val)
>  	if (READ_ONCE(*ptr) != val)
>  		goto out;
>  
> -	/* wait_for_interrupt(); */
> +	wait_for_interrupt();
>  out:
>  	local_irq_restore(flags);
>  }
> @@ -62,6 +64,9 @@ void __init pv_qspinlock_init(void)
>  	if(sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
>  		return;
>  
> +	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
> +		return;
> +
>  	pr_info("PV qspinlocks enabled\n");
>  	__pv_init_lock_hash();
>  
> -- 
> 2.36.1
> 

IIUC this PVLOCK extension is now a requirement to use pv_qspinlock(), and 
it allows a cpu to use an instruction to wait for interrupt in pv_wait(), 
and kicks it out of this wait using a new sbi_ecall() on pv_kick().

Overall it LGTM, but would be nice to have the reference doc in the commit
msg. I end up inferring some of the inner workings by your implementation, 
which is not ideal for reviewing.

If understanding above is right,
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks!
Leo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
