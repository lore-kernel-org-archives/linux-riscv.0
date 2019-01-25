Return-Path: <SRS0=IGe1=QB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD809C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 20:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1E0218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 20:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bT/pPFq4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZtzBVdWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1E0218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IfFCN7AYiV2Vz65QenZRfblg09wioDEbZlhQEg5iUmg=; b=bT/pPFq4QTw6Lixx98mDMexit
	/svOex99IeQfBbZSJlFnhukEh8bh3CxFFbVVLBwyC74l39UM8th6yoUNzdq3nfGSyalukj+Gxv4z2
	YXNKIDzMwmRELWhR9zIkiZzV1WsDFBrcYQNSlTiYc/wx0PlYINAIXEPAfyjfOXCOXWkogdcM7HXa2
	Ao9ZSYTYWnWoJDAXftPDhQiYJXp8G5mzsQhs4JaOCTyTZE5Mkx7O/T3E+TgP6EuW5MBALIB5ChKC+
	P9ro5DikQXkwr0EJD08NvhS54enB5xqeoi2UC8qltnmKTL6g55UUn9rdXBSaeykwjNgkufoi4UW4L
	aWk0hUO/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn7yT-0003ym-63; Fri, 25 Jan 2019 20:21:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn7yP-0003yP-Fe
 for linux-riscv@lists.infradead.org; Fri, 25 Jan 2019 20:21:11 +0000
Received: by mail-pf1-x435.google.com with SMTP id z9so5250346pfi.2
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jan 2019 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Ws2HHMq1XbFKmb4ZCrC6ZT8aroJThJOl1L18cEAWS0M=;
 b=ZtzBVdWqUVHmqFO4zN0/Hhg/gW5XyCsQct2AY+nF8vjOXPmbzDnoCBnaYX3RV2mHNF
 2ZtKNn68oVfYqNzN1+47Ltb5mjiGMDyCwjWi2IJ5hZ1SAzw9jVDM8zpYC4VSlwzcWexm
 wHcEUaZtRlMaEVofeq34+hLWYRjRlKee+uxWlGpvWw8GvnMQ6obRo3CQbBccakgcBmVE
 jm/B95ysAYTV/2+qhGxkhlz4IjpOYTbEz+yQbwPj0DwezsTXz4ZLqo89BWHiYwvrSebp
 K0zn6HPHD1HtmVlBJtZM7HVWIPK/nVrAfLeGA78t0ErOH/CS6fAYu8v8t/jFq87HvCWm
 7sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Ws2HHMq1XbFKmb4ZCrC6ZT8aroJThJOl1L18cEAWS0M=;
 b=Br5TW6sImA40uyz01QC52bjgN579/GAc2zvVvmukAVkl+DM5qaHZXKX31z4DSJ9/rQ
 AUkuIW1Am8sSfDi+GbpNM5ANnVsUEf/R1+eOGRKy1M1QJ0/Pvg938/dUiVgpfLFB6knn
 1s7uNmwU5QMX7XNBiomZRtZ74CwZuZd6SSBbzV3SOy0Cj+b/OwCOvdkAwx3JJa+HNu6v
 WaUsRpbXtuSOKVeM7L6UTx+gw561mAi3OuSVTHyzRjiw09Rd2baHCKYQmlAkEAB4vl9s
 kT25bT3UiDpMlL0QBbt7NnaJACURArcLoSADbko4pmsqF9VljInOxxKLCfTqSSsJHLPA
 WT5A==
X-Gm-Message-State: AJcUukcURkrlxbh3ElDz97W10DGJzLL1vLtyL0AUMzd/HAHVS734Ch9V
 RrWyxAgliAe/5RSajD9FkvDmIA==
X-Google-Smtp-Source: ALg8bN5wUGkA8FJ0NUjD29oQ0381vGrhIc2/6a/7ukgO/Hgg3kGAx0l0rhmkDGhSnjiHELIUxPnKTg==
X-Received: by 2002:a62:f5da:: with SMTP id b87mr12516304pfm.253.1548447668228; 
 Fri, 25 Jan 2019 12:21:08 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s84sm54194445pfi.15.2019.01.25.12.21.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Jan 2019 12:21:07 -0800 (PST)
Date: Fri, 25 Jan 2019 12:21:07 -0800 (PST)
X-Google-Original-Date: Fri, 25 Jan 2019 12:20:55 PST (-0800)
Subject: Re: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
In-Reply-To: <CAJ+HfNigethi_fK-Cv5CskH9B7b+9Go1_qSVsGhvXnX1kbxykw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bjorn.topel@gmail.com, Jim Wilson <jimw@sifive.com>
Message-ID: <mhng-0770bfe6-73bd-4b8a-9fa7-142ed95a6974@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_122109_554249_208A2C78 
X-CRM114-Status: GOOD (  19.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, daniel@iogearbox.net, davidlee@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 08:06:47 PST (-0800), bjorn.topel@gmail.com wrote:
> Den tis 15 jan. 2019 kl 16:39 skrev Christoph Hellwig <hch@infradead.org>:
>>
>> Hmm, while the RISC-V spec requires misaligned load/store support,
>> who says they are efficient?  Maybe add a little comment that says
>> on which cpus they are efficient.
>
> Good point! :-) I need to check how other architectures does this.
> Enabling it for *all* RV64 is probably not correct.

RISC-V mandates that misaligned memory accesses execute correctly in S-mode, 
but allow them to be trapped and emulated in M-mode.  As a result they can be 
quite slow.  Every microarchitecture I know of traps misaligned accesses into 
M-mode, so for now we're probably safe just unconditionally saying they're 
slow.

GCC does have a tuning parameter that says "are misaligned accesses fast?" that 
we set depending on -mtune, but it doesn't appear to be exposed as a 
preprocessor macro.  I think it's probably best to just expose the tuning 
parameter as a macro so software that needs to know this has one standard way 
of doing it.

Jim, would you be opposed to something like this?

    diff --git a/riscv-c-api.md b/riscv-c-api.md
    index 0b0236c38826..a790f5cc23ee 100644
    --- a/riscv-c-api.md
    +++ b/riscv-c-api.md
    @@ -52,6 +52,10 @@ https://creativecommons.org/licenses/by/4.0/.
     * `__riscv_cmodel_medlow`
     * `__riscv_cmodel_medany`
     * `__riscv_cmodel_pic`
    +* `__riscv_tune_misaligned_load_cost`: The number of cycles a word-sized
    +  misaligned load will take.
    +* `__riscv_tune_misaligned_store_cost`: The number of cycles a word-sized
    +  misaligned store will take.
    
     ## Function Attributes

Which I think shouldn't be too much of a headache to implement in GCC -- I 
haven't compiled this yet, though...

    diff --git a/gcc/config/riscv/riscv-c.c b/gcc/config/riscv/riscv-c.c
    index ca72de74a7b4..fa71a4a22104 100644
    --- a/gcc/config/riscv/riscv-c.c
    +++ b/gcc/config/riscv/riscv-c.c
    @@ -98,4 +98,9 @@ riscv_cpu_cpp_builtins (cpp_reader *pfile)
           builtin_define ("__riscv_cmodel_pic");
           break;
         }
    +
    +    builtin_define_with_int_value ("__riscv_tune_misaligned_load_cost",
    +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);
    +    builtin_define_with_int_value ("__riscv_tune_misaligned_store_cost",
    +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);
     }
    diff --git a/gcc/config/riscv/riscv-opts.h b/gcc/config/riscv/riscv-opts.h
    index a3ab6cec33b4..d58a307d27b4 100644
    --- a/gcc/config/riscv/riscv-opts.h
    +++ b/gcc/config/riscv/riscv-opts.h
    @@ -39,4 +39,6 @@ enum riscv_code_model {
     };
     extern enum riscv_code_model riscv_cmodel;
     
    +extern struct riscv_tune_info riscv_tune_info;
    +
     #endif /* ! GCC_RISCV_OPTS_H */
    diff --git a/gcc/config/riscv/riscv.c b/gcc/config/riscv/riscv.c
    index bf4571d91b8c..671c2ddaaa0f 100644
    --- a/gcc/config/riscv/riscv.c
    +++ b/gcc/config/riscv/riscv.c
    @@ -226,7 +226,7 @@ struct riscv_cpu_info {
       const char *name;
     
       /* Tuning parameters for this CPU.  */
    -  const struct riscv_tune_info *tune_info;
    +  const struct riscv_tune_info *riscv_tune_info;
     };
     
     /* Global variables for machine-dependent things.  */
    @@ -243,7 +243,7 @@ unsigned riscv_stack_boundary;
     static int epilogue_cfa_sp_offset;
     
     /* Which tuning parameters to use.  */
    -static const struct riscv_tune_info *tune_info;
    +const struct riscv_tune_info *riscv_tune_info;
     
     /* Index R is the smallest register class that contains register R.  */
     const enum reg_class riscv_regno_to_class[FIRST_PSEUDO_REGISTER] = {
    @@ -1528,7 +1528,7 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
     	 instructions it needs.  */
           if ((cost = riscv_address_insns (XEXP (x, 0), mode, true)) > 0)
     	{
    -	  *total = COSTS_N_INSNS (cost + tune_info->memory_cost);
    +	  *total = COSTS_N_INSNS (cost + riscv_tune_info->memory_cost);
     	  return true;
     	}
           /* Otherwise use the default handling.  */
    @@ -1592,7 +1592,7 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
     	 mode instead.  */
           mode = GET_MODE (XEXP (x, 0));
           if (float_mode_p)
    -	*total = tune_info->fp_add[mode == DFmode];
    +	*total = riscv_tune_info->fp_add[mode == DFmode];
           else
     	*total = riscv_binary_cost (x, 1, 3);
           return false;
    @@ -1601,14 +1601,14 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
         case ORDERED:
           /* (FEQ(A, A) & FEQ(B, B)) compared against 0.  */
           mode = GET_MODE (XEXP (x, 0));
    -      *total = tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (2);
    +      *total = riscv_tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (2);
           return false;
     
         case UNEQ:
         case LTGT:
           /* (FEQ(A, A) & FEQ(B, B)) compared against FEQ(A, B).  */
           mode = GET_MODE (XEXP (x, 0));
    -      *total = tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (3);
    +      *total = riscv_tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (3);
           return false;
     
         case UNGE:
    @@ -1617,13 +1617,13 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
         case UNLT:
           /* FLT or FLE, but guarded by an FFLAGS read and write.  */
           mode = GET_MODE (XEXP (x, 0));
    -      *total = tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (4);
    +      *total = riscv_tune_info->fp_add[mode == DFmode] + COSTS_N_INSNS (4);
           return false;
     
         case MINUS:
         case PLUS:
           if (float_mode_p)
    -	*total = tune_info->fp_add[mode == DFmode];
    +	*total = riscv_tune_info->fp_add[mode == DFmode];
           else
     	*total = riscv_binary_cost (x, 1, 4);
           return false;
    @@ -1633,7 +1633,7 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
     	rtx op = XEXP (x, 0);
     	if (GET_CODE (op) == FMA && !HONOR_SIGNED_ZEROS (mode))
     	  {
    -	    *total = (tune_info->fp_mul[mode == DFmode]
    +	    *total = (riscv_tune_info->fp_mul[mode == DFmode]
     		      + set_src_cost (XEXP (op, 0), mode, speed)
     		      + set_src_cost (XEXP (op, 1), mode, speed)
     		      + set_src_cost (XEXP (op, 2), mode, speed));
    @@ -1642,23 +1642,23 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
           }
     
           if (float_mode_p)
    -	*total = tune_info->fp_add[mode == DFmode];
    +	*total = riscv_tune_info->fp_add[mode == DFmode];
           else
     	*total = COSTS_N_INSNS (GET_MODE_SIZE (mode) > UNITS_PER_WORD ? 4 : 1);
           return false;
     
         case MULT:
           if (float_mode_p)
    -	*total = tune_info->fp_mul[mode == DFmode];
    +	*total = riscv_tune_info->fp_mul[mode == DFmode];
           else if (!TARGET_MUL)
     	/* Estimate the cost of a library call.  */
     	*total = COSTS_N_INSNS (speed ? 32 : 6);
           else if (GET_MODE_SIZE (mode) > UNITS_PER_WORD)
    -	*total = 3 * tune_info->int_mul[0] + COSTS_N_INSNS (2);
    +	*total = 3 * riscv_tune_info->int_mul[0] + COSTS_N_INSNS (2);
           else if (!speed)
     	*total = COSTS_N_INSNS (1);
           else
    -	*total = tune_info->int_mul[mode == DImode];
    +	*total = riscv_tune_info->int_mul[mode == DImode];
           return false;
     
         case DIV:
    @@ -1666,7 +1666,7 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
         case MOD:
           if (float_mode_p)
     	{
    -	  *total = tune_info->fp_div[mode == DFmode];
    +	  *total = riscv_tune_info->fp_div[mode == DFmode];
     	  return false;
     	}
           /* Fall through.  */
    @@ -1677,7 +1677,7 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
     	/* Estimate the cost of a library call.  */
     	*total = COSTS_N_INSNS (speed ? 32 : 6);
           else if (speed)
    -	*total = tune_info->int_div[mode == DImode];
    +	*total = riscv_tune_info->int_div[mode == DImode];
           else
     	*total = COSTS_N_INSNS (1);
           return false;
    @@ -1699,11 +1699,11 @@ riscv_rtx_costs (rtx x, machine_mode mode, int outer_code, int opno ATTRIBUTE_UN
         case FIX:
         case FLOAT_EXTEND:
         case FLOAT_TRUNCATE:
    -      *total = tune_info->fp_add[mode == DFmode];
    +      *total = riscv_tune_info->fp_add[mode == DFmode];
           return false;
     
         case FMA:
    -      *total = (tune_info->fp_mul[mode == DFmode]
    +      *total = (riscv_tune_info->fp_mul[mode == DFmode]
     		+ set_src_cost (XEXP (x, 0), mode, speed)
     		+ set_src_cost (XEXP (x, 1), mode, speed)
     		+ set_src_cost (XEXP (x, 2), mode, speed));
    @@ -4165,7 +4165,7 @@ riscv_class_max_nregs (reg_class_t rclass, machine_mode mode)
     static int
     riscv_memory_move_cost (machine_mode mode, reg_class_t rclass, bool in)
     {
    -  return (tune_info->memory_cost
    +  return (riscv_tune_info->memory_cost
     	  + memory_move_secondary_cost (mode, rclass, in));
     }
     
    @@ -4174,7 +4174,7 @@ riscv_memory_move_cost (machine_mode mode, reg_class_t rclass, bool in)
     static int
     riscv_issue_rate (void)
     {
    -  return tune_info->issue_rate;
    +  return riscv_tune_info->issue_rate;
     }
     
     /* Implement TARGET_ASM_FILE_START.  */
    @@ -4307,22 +4307,22 @@ riscv_option_override (void)
       /* Handle -mtune.  */
       cpu = riscv_parse_cpu (riscv_tune_string ? riscv_tune_string :
     			 RISCV_TUNE_STRING_DEFAULT);
    -  tune_info = optimize_size ? &optimize_size_tune_info : cpu->tune_info;
    +  riscv_tune_info = optimize_size ? &optimize_size_tune_info : cpu->riscv_tune_info;
     
       /* Use -mtune's setting for slow_unaligned_access, even when optimizing
          for size.  For architectures that trap and emulate unaligned accesses,
          the performance cost is too great, even for -Os.  Similarly, if
          -m[no-]strict-align is left unspecified, heed -mtune's advice.  */
    -  riscv_slow_unaligned_access_p = (cpu->tune_info->slow_unaligned_access
    +  riscv_slow_unaligned_access_p = (cpu->riscv_tune_info->slow_unaligned_access
     				   || TARGET_STRICT_ALIGN);
       if ((target_flags_explicit & MASK_STRICT_ALIGN) == 0
    -      && cpu->tune_info->slow_unaligned_access)
    +      && cpu->riscv_tune_info->slow_unaligned_access)
         target_flags |= MASK_STRICT_ALIGN;
     
       /* If the user hasn't specified a branch cost, use the processor's
          default.  */
       if (riscv_branch_cost == 0)
    -    riscv_branch_cost = tune_info->branch_cost;
    +    riscv_branch_cost = riscv_tune_info->branch_cost;
     
       /* Function to allocate machine-dependent function status.  */
       init_machine_status = &riscv_init_machine_status;
    

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
