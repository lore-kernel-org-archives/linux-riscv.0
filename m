Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0940FC4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:41:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 937DF61009
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 937DF61009
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OiIAG4Vu/4TWEtsgOyzVsZGg9+o9aZ/2KuFN7/Q6bkw=; b=xLLUa00VGSKt3c8xVXtyMqqYh6
	c6xlSvsz8emX1/FZcz7+vXoiv4vjxLf7GExUfDa6cgEteOhiX29+SAswAjt/cbKiqkaDqVaOv6Etq
	AzcdX0yssFXoxBzzSYZtajpcedqTtdIMmCNnOJiNsKdO9dqtjvk9N115q9acDM07TadTYcJY5+BKB
	BA6ht7wmoTIFEaI+O0wLXbtxmZUoa9AxVbJtIDUIFLkFYzaWPYFkz+nLOIuqSftRD38MYO3qNvijW
	+7/7K9aITlAiAbBwb6h6A9I4FfwTFNgoKJ3frZkjqigfaGqc2fCfTyNEkFPYI4+u/tVClCuMMgyjv
	+nR9LTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln3t4-0086DC-98; Sat, 29 May 2021 18:40:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln3t1-0086CM-9l
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 18:40:41 +0000
Received: by mail-pg1-x529.google.com with SMTP id 6so5112548pgk.5
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5eeuuk+L/opcH1pywf9XaZz1CvayeU6mj335HgHfKQ=;
 b=ICvFaD3jWrVFqzIKbhlTkKMyMhVw8JNUOBos7wMlnhofEwbn86h/BC77sKLPjNsPgP
 HiddcDkdZjwCdGm5EJgM+5X7eX/0HGui8ZCraI7n7sqBhUleV4OL9CONlK5yRe33TyxU
 rBncFJS2sOHEpWBcLqhqV6C16Ljd3l2I2Wf8BQu606roIDWx/UEP6Wfo8+WPR74TryVF
 pknTxXPFYEI0UR5rIfdG47/or7IrzYZbwZ5V51Mr1q6rjn2dliovcvYksMbzksyPoyhM
 fPugpjLMDYoIqkamDWrGVKZfkp4F1kjErN+/9HI79jFhbq1Mi2hhYWBTSZU6+VjZf7ZZ
 Wo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Y5eeuuk+L/opcH1pywf9XaZz1CvayeU6mj335HgHfKQ=;
 b=XDWTtyIgGiEuX/fx6TrCevqDy+4BEXMWKt7tZgl0vEkqaina9Yeb/YT9psZAzR1Py1
 tPXf9OsxoMArl8UbUS/yDFYbMIbnWlpQXfZNTpf+v4B2rcrpopwafbruaR1fLYo2glA9
 aeE4vR+t2SqSOOuw3DH/AZE7WNI8Qzzs3Tv9O5ak1UUt1M8iGOiWTH59CHpKAr3965Ad
 AdiBxrecEZcSr+YjcGib0P8zVOoNfY/HPSVEY411AIThhvAAfzhfTNI0/p3brJ04Shdz
 klQQMLsVi4lUGTE073REZuXJAIgj4d32EQCDUs3QfT5J77WMlpINzrR11hmmbUAffmYe
 GzlA==
X-Gm-Message-State: AOAM533/Cl/AvSdlhicVROnVc+UPJHi/gwTad1V2ntsMRAX2ogrPOEFR
 x94Gfb2tSK/FSI6MkdOy/uwPew==
X-Google-Smtp-Source: ABdhPJzc9dWVDPV7LCQvfbx+/+RbqsGuI3x8/CE9rDTRAvtwI5+otwsABJqdCAPxFQip/idPDNa3cg==
X-Received: by 2002:a63:f74b:: with SMTP id f11mr14943415pgk.327.1622313638156; 
 Sat, 29 May 2021 11:40:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v11sm6925372pgs.6.2021.05.29.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 11:40:37 -0700 (PDT)
Date: Sat, 29 May 2021 11:40:37 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 11:34:23 PDT (-0700)
Subject: Re: [PATCH] riscv: kprobes: Remove redundant kprobe_step_ctx
In-Reply-To: <20210512225819.6756c0b0@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-458b641d-fe97-4d92-8a6a-e43240aeb0c3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_114039_423244_7D0534AF 
X-CRM114-Status: GOOD (  24.31  )
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

On Wed, 12 May 2021 07:58:19 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> On Mon, 19 Apr 2021 00:29:19 +0800
> Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
>> From: Jisheng Zhang <jszhang@kernel.org>
>>
>> Inspired by commit ba090f9cafd5 ("arm64: kprobes: Remove redundant
>> kprobe_step_ctx"), the ss_pending and match_addr of kprobe_step_ctx
>> are redundant because those can be replaced by KPROBE_HIT_SS and
>> &cur_kprobe->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode)
>> respectively.
>>
>> Remove the kprobe_step_ctx to simplify the code.
>
> Hi all,
>
> This patch can still be applied to 5.13-rc1, could you please review? Let me
> know if a rebase on 5.13-rc1 is needed.

Sorry, I missed this one.  This is on for-next.

>
> Thanks
>
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>  arch/riscv/include/asm/kprobes.h   |  7 ------
>>  arch/riscv/kernel/probes/kprobes.c | 40 +++++++-----------------------
>>  2 files changed, 9 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
>> index 4647d38018f6..9ea9b5ec3113 100644
>> --- a/arch/riscv/include/asm/kprobes.h
>> +++ b/arch/riscv/include/asm/kprobes.h
>> @@ -29,18 +29,11 @@ struct prev_kprobe {
>>  	unsigned int status;
>>  };
>>
>> -/* Single step context for kprobe */
>> -struct kprobe_step_ctx {
>> -	unsigned long ss_pending;
>> -	unsigned long match_addr;
>> -};
>> -
>>  /* per-cpu kprobe control block */
>>  struct kprobe_ctlblk {
>>  	unsigned int kprobe_status;
>>  	unsigned long saved_status;
>>  	struct prev_kprobe prev_kprobe;
>> -	struct kprobe_step_ctx ss_ctx;
>>  };
>>
>>  void arch_remove_kprobe(struct kprobe *p);
>> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
>> index 8c1f7a30aeed..4c1ad5536748 100644
>> --- a/arch/riscv/kernel/probes/kprobes.c
>> +++ b/arch/riscv/kernel/probes/kprobes.c
>> @@ -17,7 +17,7 @@ DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>>
>>  static void __kprobes
>> -post_kprobe_handler(struct kprobe_ctlblk *, struct pt_regs *);
>> +post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>>
>>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>>  {
>> @@ -43,7 +43,7 @@ static void __kprobes arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
>>  		p->ainsn.api.handler((u32)p->opcode,
>>  					(unsigned long)p->addr, regs);
>>
>> -	post_kprobe_handler(kcb, regs);
>> +	post_kprobe_handler(p, kcb, regs);
>>  }
>>
>>  int __kprobes arch_prepare_kprobe(struct kprobe *p)
>> @@ -149,21 +149,6 @@ static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
>>  	regs->status = kcb->saved_status;
>>  }
>>
>> -static void __kprobes
>> -set_ss_context(struct kprobe_ctlblk *kcb, unsigned long addr, struct kprobe *p)
>> -{
>> -	unsigned long offset = GET_INSN_LENGTH(p->opcode);
>> -
>> -	kcb->ss_ctx.ss_pending = true;
>> -	kcb->ss_ctx.match_addr = addr + offset;
>> -}
>> -
>> -static void __kprobes clear_ss_context(struct kprobe_ctlblk *kcb)
>> -{
>> -	kcb->ss_ctx.ss_pending = false;
>> -	kcb->ss_ctx.match_addr = 0;
>> -}
>> -
>>  static void __kprobes setup_singlestep(struct kprobe *p,
>>  				       struct pt_regs *regs,
>>  				       struct kprobe_ctlblk *kcb, int reenter)
>> @@ -182,8 +167,6 @@ static void __kprobes setup_singlestep(struct kprobe *p,
>>  		/* prepare for single stepping */
>>  		slot = (unsigned long)p->ainsn.api.insn;
>>
>> -		set_ss_context(kcb, slot, p);	/* mark pending ss */
>> -
>>  		/* IRQs and single stepping do not mix well. */
>>  		kprobes_save_local_irqflag(kcb, regs);
>>
>> @@ -219,13 +202,8 @@ static int __kprobes reenter_kprobe(struct kprobe *p,
>>  }
>>
>>  static void __kprobes
>> -post_kprobe_handler(struct kprobe_ctlblk *kcb, struct pt_regs *regs)
>> +post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_regs *regs)
>>  {
>> -	struct kprobe *cur = kprobe_running();
>> -
>> -	if (!cur)
>> -		return;
>> -
>>  	/* return addr restore if non-branching insn */
>>  	if (cur->ainsn.api.restore != 0)
>>  		regs->epc = cur->ainsn.api.restore;
>> @@ -355,16 +333,16 @@ bool __kprobes
>>  kprobe_single_step_handler(struct pt_regs *regs)
>>  {
>>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>> +	unsigned long addr = instruction_pointer(regs);
>> +	struct kprobe *cur = kprobe_running();
>>
>> -	if ((kcb->ss_ctx.ss_pending)
>> -	    && (kcb->ss_ctx.match_addr == instruction_pointer(regs))) {
>> -		clear_ss_context(kcb);	/* clear pending ss */
>> -
>> +	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
>> +	    ((unsigned long)&cur->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode) == addr)) {
>>  		kprobes_restore_local_irqflag(kcb, regs);
>> -
>> -		post_kprobe_handler(kcb, regs);
>> +		post_kprobe_handler(cur, kcb, regs);
>>  		return true;
>>  	}
>> +	/* not ours, kprobes should ignore it */
>>  	return false;
>>  }
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
