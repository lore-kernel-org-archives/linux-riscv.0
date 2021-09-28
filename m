Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6817C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 22:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EC961357
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 22:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66EC961357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=btF3GRoezzxugoyWWfNlWU6eIxZGr+pxqJM/lBHrHlo=; b=WC1NvB0PFiFoO+jDikGsiz0J/I
	vZ2oYZNL5aHHQNv67KclMVTcq6PYsZbt8TTgHfkA01LJrOJx0bW52Ry0QW/xI4s3pM85ho3hduRb/
	U2sOCtD6PWJzxQNRl/4mC2/eLx6dwjuZoxZZEghPppdJlcguNdSLXQ3k6mlJaRSgHdHqLe/ESURbG
	ek7csjnEOatBbsMCOia1kMVl7sBaqvRJzENrsGiem3/1RPLODWJFCTKgXqXY5VSgsAeZZqIQTX1SG
	zcWl2bmkejrnoijUWy1/fAjw4n+al+rFsGPnuLgWQv3sYWiet/I3iCloUG6BcXt/tEbD+c0iTv/7t
	0Y1iudWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLGL-008y5T-BI; Tue, 28 Sep 2021 22:07:45 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLGH-008y34-PM
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 22:07:43 +0000
Received: by mail-qk1-x72d.google.com with SMTP id m7so329248qke.8
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hqLpx7Wm6Aikf3yaBVZ1DfYqAohja9hoxxDTJ4xjS7o=;
 b=I79TXBeeKhqw/PkSZBawchrYJxCClh648BkPzWLbNa1UkVvlTTkBiT5/9JZ+EP89Ho
 guh8PRCNJ/vUJtFdxBjphdv3bgHIkUSsNWXSjlUDvsWO3HOrWnzDZvk/lFdojijY2jBm
 97fJyoUUndoubaQUCmKy2tXrCNSbPLATypEeOetRkXaSK7lLYOl8+AdZseYJPanJiAoB
 KfXAL15/M4xU3OTAtvuix3kZ1MqdcjRGfyiy9wFV2n8BOIJUv9Q4ppd4p+p0P7dD6qbE
 GLziTGb2w4zMAPXS6NDZ4GbcEi892+RAgDw4uV9gr7Gi4UuGL6DvBJ3bjf+mUAn+Yeim
 ooKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hqLpx7Wm6Aikf3yaBVZ1DfYqAohja9hoxxDTJ4xjS7o=;
 b=JhDXbeufHvR9+5n98Tt7Isn8MYA+LSOuxFeKIiVHDr8PMjqCysUnTkRtLoQZAxj9C+
 q5PMDX48iR6b2/ucu1W37zX/PNrRHwqyqPDReCfcLVmilC0ag8NYULuOX8ioBWzUGVHK
 FRl9XmRkkoXKTdRwM1L4ai7pgvFs295T3dEwuUf/hiCBAfPzEHZRphgFoK9hacF7XteP
 jQQsNaQnUHLNW56O+yyxOCL/lVxWWBFgWDJ5kYOnAEtxLBzdd00GSyLbvDFpOXNfesGd
 VtiGLUztDJFKKo624mof2ztrUN1a2DcvWybftzxGwLuQmbCCkra7kR/qgIiP690InaMe
 CiOg==
X-Gm-Message-State: AOAM531rbX3rJABbKtNqklNqis9UX6MwpDvRlzS0Jp6RGdL1RJVagAEJ
 OgMS57hiFJ672Wk9PSQFq5NkXw==
X-Google-Smtp-Source: ABdhPJwYa3sPb+5NPeY3D11qHxW63pqGnDrFPVG/BTx8yJXFd0HA44jnISUSxDVomkPI7Dkdn063kA==
X-Received: by 2002:ae9:de86:: with SMTP id s128mr2452630qkf.146.1632866860009; 
 Tue, 28 Sep 2021 15:07:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e16sm332752qtq.18.2021.09.28.15.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:07:39 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:07:39 -0700 (PDT)
X-Google-Original-Date: Tue, 28 Sep 2021 15:07:35 PDT (-0700)
Subject: Re: [RFC PATCH 7/8] riscv: rely on core code to keep thread_info::cpu
 updated
In-Reply-To: <20210914121036.3975026-8-ardb@kernel.org>
CC: linux-kernel@vger.kernel.org, ardb@kernel.org, keithpac@amazon.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, 
 benh@kernel.crashing.org, christophe.leroy@csgroup.eu, paulus@samba.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, 
 borntraeger@de.ibm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 peterz@infradead.org, keescook@chromium.org, luto@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb@kernel.org
Message-ID: <mhng-7d24dba9-38a7-4267-b01c-388471412237@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_150741_893478_F6BA7CA6 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue, 14 Sep 2021 05:10:35 PDT (-0700), ardb@kernel.org wrote:
> Now that the core code switched back to using thread_info::cpu to keep
> a task's CPU number, we no longer need to keep it in sync explicitly. So
> just drop the code that does this.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/asm-offsets.c | 1 -
>  arch/riscv/kernel/entry.S       | 5 -----
>  arch/riscv/kernel/head.S        | 1 -
>  3 files changed, 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 90f8ce64fa6f..478d9f02dab5 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -33,7 +33,6 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> -	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>
>  	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
>  	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 98f502654edd..459eb1714353 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -544,11 +544,6 @@ ENTRY(__switch_to)
>  	REG_L s9,  TASK_THREAD_S9_RA(a4)
>  	REG_L s10, TASK_THREAD_S10_RA(a4)
>  	REG_L s11, TASK_THREAD_S11_RA(a4)
> -	/* Swap the CPU entry around. */
> -	lw a3, TASK_TI_CPU(a0)
> -	lw a4, TASK_TI_CPU(a1)
> -	sw a3, TASK_TI_CPU(a1)
> -	sw a4, TASK_TI_CPU(a0)
>  	/* The offset of thread_info in task_struct is zero. */
>  	move tp, a1
>  	ret
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fce5184b22c3..d5ec30ef6f5d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -317,7 +317,6 @@ clear_bss_done:
>  	call setup_trap_vector
>  	/* Restore C environment */
>  	la tp, init_task
> -	sw zero, TASK_TI_CPU(tp)
>  	la sp, init_thread_union + THREAD_SIZE
>
>  #ifdef CONFIG_KASAN

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
