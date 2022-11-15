Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9172CC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1ac11b6wxGv4auAmglaYs6DZJv4yjnyn/hiWrF8xHo=; b=EWA5aYqiW6qn1k
	FxtAem57ISAXNic03hqGaFaTLw6m8jcwbtEuMWRfEizsKw5rPjnuWa+NohnCRDB1rlhpEx33euXcT
	Ppn1ByHXo1+wdyMFHgxhkEMoc+Ov+3wVC664tehLlLtJZH8aYCkHyzbZvnnfDtbr30Ba0CeiXtV+w
	yOJfio5LGGaSMMmfwtIRWc2YsR2ILCnCvsgxcHHvcIYMUI6dHbQhculy0+fm5CWNzi8rPIaxTvEe+
	KJkTcY3rDyuGON2hluS/5JB6mTkiT0FyxCAGWzT5rrlZosRkwNCNZlNijcqeA81q50aLEFSZNhkJ7
	8IsWjn6e59+grYQzO6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouphw-008HAu-VD; Tue, 15 Nov 2022 06:46:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouphr-008H9J-UM
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 06:46:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id f18so705250ejz.5
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 22:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z333HxX5gPy9NORJdJPh5x75FiRSYhz5BQverCzuReI=;
        b=BYRZsjOI09drJblN+gA12cyZBzdAun4cC1h8zEf9GkrquLLMRX5ayWTEWN4Z57waV8
         fZTQI8SYKDcH1hwG/vI80csxKDACqnq9pIdyenEKFyszXO0zpb0aznjEeN6ATWrSJa5J
         39IjedjKi5vX+cqOPa1k62yXGUgoyfU99WawtDeq3GgUT2t+7TpHG0oTvg63Kw6gEHXj
         MZfj9iq2QZ2ZbDdllTg/xG5tohiRZ6eQMcKjlkqno0b/ChQAa6dzFQy56Ei8eSTnq9cS
         Q2bmrElYaYn1MRm7XA5m32U6IyixhXIfHbvstxc73nGgmt5e2/0WniuznEoG6gMZcoks
         C5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z333HxX5gPy9NORJdJPh5x75FiRSYhz5BQverCzuReI=;
        b=SPmG9c1yyeXUsyISMBNwwYUSWIYfAujNAzwjf0eAjQJ/gS4dHXuNnIHLM4QUS0Ew/m
         Qo6ydeR9tsnhwDbLk5E9BJcOKGruqYxW7578YEvMi7r49cT43dEhEUSWMwXBt3HGK72u
         7uXB6YfZhBX1MK2jiI2wIN5A7CrKd129DkYYea8LONMs/H2xPjLt8AGtWICZiaG4LkGj
         H9kYG8Q5rAfX7WNhpjIzcqs0y3fHc8Mhy2oUW3vQjdOfE48ViotHYVwfuPQdVK3ZnH1t
         JifkBuDECOJhrFd9q2+B096fYJ5SuJ18fzHRlRZ8a0hNsqjQrSK6q7RpwbEZE7vD13dp
         AenA==
X-Gm-Message-State: ANoB5plzjt6dsPb2PoduP0bBdt3P+33FMOXRRXhyd8OCkh/1h28qHX/x
	tLiAF7x912zTItXnFsyCByIElQ==
X-Google-Smtp-Source: AA0mqf4yokm7ojLEsAwKwb1SgOwx50ag245MHJ+A0ANJfRzFd5AidpHQIt6v3wBKwQUbXnMnqCZAug==
X-Received: by 2002:a17:906:ae8b:b0:7ad:9892:921a with SMTP id md11-20020a170906ae8b00b007ad9892921amr12324383ejb.506.1668494761825;
        Mon, 14 Nov 2022 22:46:01 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k17-20020aa7c391000000b00467cc919072sm2809748edq.17.2022.11.14.22.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:46:01 -0800 (PST)
Date: Tue, 15 Nov 2022 07:46:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: aou@eecs.berkeley.edu, jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v2] scripts/gdb: add lx_current support for riscv
Message-ID: <20221115064600.e6jzigbl23hwpuzi@kamzik>
References: <20221111195938.1499148-2-debug@rivosinc.com>
 <20221115012917.1781185-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115012917.1781185-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_224604_007279_F05DCCA8 
X-CRM114-Status: GOOD (  25.99  )
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

On Mon, Nov 14, 2022 at 05:29:17PM -0800, Deepak Gupta wrote:
> csr_sscratch CSR holds current task_struct address when hart is in user space.
> trap handler on entry spills csr_sscratch into "tp" (x2) register and zeroes out
> csr_sscratch CSR. trap handler on exit reloads "tp" with expected user mode value
> and place current task_struct address again in csr_scratch CSR.
> 
> This patch assumes "tp" is pointing to task_struct. If value in csr_scratch is numerically
> greater than "tp" then it assumes csr_scratch is correct address of current task_struct.
> This logic holds when
>    - hart is in user space, "tp" will be less than csr_scratch.
>    - hart is in kernel space but not in trap handler, "tp" will be more than csr_scratch.
>    - hart is executing trap handler
>            - "tp" is still pointing to user mode but csr_scratch contains ptr to task_struct.
>              numerically higher.
>            - "tp" is now pointing to task_struct but csr_scratch now contains either 0 or numerically
>               smaller value.

When is (csr_scratch != 0 && csr_scratch < tp)? IIUC, it should always be
zero or >= tp.

> 
> Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py

Please wrap commit message lines at ~74.

> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
>  scripts/gdb/linux/utils.py |  5 +++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..fd818d7896ce 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,21 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_tp = gdb.parse_and_eval("$tp")
> +         scratch_reg = gdb.parse_and_eval("$sscratch")
> +
> +         # by default tp points to current task
> +         current_task = current_tp.cast(task_ptr_type)
> +         
> +         # scratch register is set 0 in trap handler after entering kernel.
> +         # When hart is in user mode, scratch register is pointing to task_struct.
> +         # So when scratch register holds higher value (negative address as ulong is bigger value) than tp,

Please wrap source lines at 100.

> +         # then use scratch register
> +         if (scratch_reg.cast(utils.get_ulong_type()) >  current_tp.cast(utils.get_ulong_type())):
                                                          ^ extra space here

> +             current_task = scratch_reg.cast(task_ptr_type)
> +             
> +         return current_task.dereference()
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
> index 1553f68716cc..ddaf3089170d 100644
> --- a/scripts/gdb/linux/utils.py
> +++ b/scripts/gdb/linux/utils.py
> @@ -35,12 +35,17 @@ class CachedType:
>  
>  
>  long_type = CachedType("long")
> +ulong_type = CachedType("ulong")
>  atomic_long_type = CachedType("atomic_long_t")
>  
>  def get_long_type():
>      global long_type
>      return long_type.get_type()
>  
> +def get_ulong_type():
> +    global ulong_type
> +    return ulong_type.get_type()
> +
>  def offset_of(typeobj, field):
>      element = gdb.Value(0).cast(typeobj)
>      return int(str(element[field].address).split()[0], 16)
> -- 
> 2.25.1
>

Besides the line wrapping and the commit message clarification this looks
good to me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
