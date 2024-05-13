Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E874C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTw7v/QpUSdHG7ifWzq2lcTMVCV+8xMRtBvKRHkSing=; b=JvKZYLPZVTprvWw2Chz914gen1
	yTOQsDbDSLki9lj/I/NNlj4oWMRYu32D0uK7q1dD0bDdngpG18JgJxMZXk+WkFJQkOnQsZ8kWFVcj
	ZENQH37slE9VRDqjPVC5Q8UmrneKC+X+sq+xXOjOAUiSabChjOsSZMNNlnfvQKKBkJCwV49o9s8yj
	XPbUyXYd/HhBBJnasGAYHtmLzrCPfEZuHxhcN98xh5RPxlulKIqpakr6AYG9bt8jRq5Mq7EafrHsT
	ukqzCdfCje0NuyJEKSOX9hYraHtmxtD0foRBAw5bvGr3wSYuj9Jc1Lu9kOR7M3Y1p7pw7pciG6b8m
	Ecn5DZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aST-0000000DsJj-2Kbb;
	Mon, 13 May 2024 18:31:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aSQ-0000000DsGl-1TWf
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 18:31:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f47787a0c3so4248116b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715625088; x=1716229888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lfxB6TGC4fu8lY9DVlJ3Uo04rJaZ2CFPzF6bJyMTII=;
        b=tJTd4QoeZCZKQctnmBnLmRzMVxnnrzJJeVNpgMA7JDpjjOHHuV+kcALyfJG+mv74DV
         Yk5h+LDHdlz/oLbhw3E2qxl7vWXMQm8Lym76rA+Hwhr/8oWbUUL/NVlXJj7xIrMc77L5
         E8p4VGJlzyzB9tflzQu90iSzBWzgEoDGGF/6e5DoblCPiVOKZjlwXDFbIq0DS1EfC+2e
         +YHwbKua5X+YgGAtaDwApuunL7cO4f/sJfSgb7rPiebQzhvjMnd3N0eb4VSAhPf8fXlV
         Cmyy4IIGcQOksoOk0HTpM6irFR49+CrcwbhktYR+9YeH97ndHCvCGgsf6Mnn+yAKd+qd
         Foew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625088; x=1716229888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lfxB6TGC4fu8lY9DVlJ3Uo04rJaZ2CFPzF6bJyMTII=;
        b=DqVThHfNxxfNTprzQzDg38UQN4rd8WXdCdy6Y83ifSqWVsCBFAIr+A3lbn7pM/nOl6
         s2IiynEDn4lWe5D+Gz/+CIeeQF2MwVvJUIGX+T4hv0myE/O2uhYZSgcM/O6hKgE4yorx
         nNKrgecihb+iNz6/KknpjSURgQzqbmtQOY/rS+uByyd5PI4B7WvKZpzAnyjqqRHprPLF
         KTZx+2K5LB+M70FOyvnVkAyQMq8Buf77HuYpg2JTRLGR9nNbVhZ+xkl3xe6G7iJeMoLu
         7qCeyTf4f6BBfGcFr7LLqlwSRmnhw8mvq9PC9jHnHm+J9ceOEpGg0WLj26bYU9iCxX68
         KsHA==
X-Forwarded-Encrypted: i=1; AJvYcCXgZTAguGYxxwBdMIpBJ1DDk5LsfAaOjxva/p9rVwxWRi8gRKbdiINHDjss8QYoavlKYYt3KeGzYTsbIpHJLx+YtZMi73XhXOt4K2Yf7D6p
X-Gm-Message-State: AOJu0YxGjFoGT8URWmMWF0XackijQq1hwJ67iGXUuzyQrwltquZ9FEtF
	fltHWQuk4xOVr7nXr8gxzgAAbXJN86GmNIhDVrzAEzUTiLlXMPA4OU6WqkTu64Q=
X-Google-Smtp-Source: AGHT+IH1OSRQPwx8UUxBA+2NIldqGQBfyQNuOaQuzBWIoDTXDv4FJlctQ5Ean61dJ4G8ZeTtENbZeA==
X-Received: by 2002:a05:6a20:8428:b0:1a9:d9bb:acdc with SMTP id adf61e73a8af0-1afde10df02mr12897298637.28.1715625088408;
        Mon, 13 May 2024 11:31:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340b48a152sm8067572a12.20.2024.05.13.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:31:28 -0700 (PDT)
Date: Mon, 13 May 2024 11:31:23 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 17/29] prctl: arch-agnostic prctl for indirect branch
 tracking
Message-ID: <ZkJce/hix5kRhubS@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-18-debug@rivosinc.com>
 <Zj6tzxWFj4H+250p@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj6tzxWFj4H+250p@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_113130_494285_A93CD84E 
X-CRM114-Status: GOOD (  17.82  )
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

On Fri, May 10, 2024 at 04:29:19PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:35:05PM -0700, Deepak Gupta wrote:
>> Three architectures (x86, aarch64, riscv) have support for indirect branch
>> tracking feature in a very similar fashion. On a very high level, indirect
>> branch tracking is a CPU feature where CPU tracks branches which uses
>> memory operand to perform control transfer in program. As part of this
>> tracking on indirect branches, CPU goes in a state where it expects a
>> landing pad instr on target and if not found then CPU raises some fault
>> (architecture dependent)
>>
>> x86 landing pad instr - `ENDBRANCH`
>> aarch64 landing pad instr - `BTI`
>> riscv landing instr - `lpad`
>>
>> Given that three major arches have support for indirect branch tracking,
>> This patch makes `prctl` for indirect branch tracking arch agnostic.
>>
>> To allow userspace to enable this feature for itself, following prtcls are
>> defined:
>>  - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
>>    branch tracking.
>>  - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
>>    tracking.
>>    Following status options are allowed
>>        - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>>          thread.
>>        - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>>          thread.
>>  - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>>    tracking for user thread.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
>>  kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
>>  2 files changed, 57 insertions(+)
>>
>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>> index 3c66ed8f46d8..b7a8212a068e 100644
>> --- a/include/uapi/linux/prctl.h
>> +++ b/include/uapi/linux/prctl.h
>> @@ -328,4 +328,31 @@ struct prctl_mm_map {
>>   */
>>  #define PR_LOCK_SHADOW_STACK_STATUS      73
>>
>> +/*
>> + * Get the current indirect branch tracking configuration for the current
>> + * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
>> + */
>> +#define PR_GET_INDIR_BR_LP_STATUS      74
>> +
>> +/*
>> + * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
>> + * enable cpu feature for user thread, to track all indirect branches and ensure
>> + * they land on arch defined landing pad instruction.
>> + * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
>> + * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
>> + * riscv - If enabled, an indirect branch must land on `lpad` instruction.
>> + * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
>> + * branches will no more be tracked by cpu to land on arch defined landing pad
>> + * instruction.
>> + */
>> +#define PR_SET_INDIR_BR_LP_STATUS      75
>> +# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
>> +
>> +/*
>> + * Prevent further changes to the specified indirect branch tracking
>> + * configuration.  All bits may be locked via this call, including
>> + * undefined bits.
>> + */
>> +#define PR_LOCK_INDIR_BR_LP_STATUS      76
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index 242e9f147791..c770060c3f06 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -2330,6 +2330,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>>  	return -EINVAL;
>>  }
>>
>> +int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>
>These weak references each cause a warning:
>
>kernel/sys.c:2333:12: warning: no previous prototype for 'arch_get_indir_br_lp_status' [-Wmissing-prototypes]
> 2333 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>kernel/sys.c:2338:12: warning: no previous prototype for 'arch_set_indir_br_lp_status' [-Wmissing-prototypes]
> 2338 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>kernel/sys.c:2343:12: warning: no previous prototype for 'arch_lock_indir_br_lp_status' [-Wmissing-prototypes]
> 2343 | int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>
>Can the definitions be added to include/linux/mm.h alongside the
>*_shadow_stack_status() definitions?

Noted. Will work on a fix for this.

>
>- Charlie
>
>>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>>
>>  #ifdef CONFIG_ANON_VMA_NAME
>> @@ -2787,6 +2802,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>  			return -EINVAL;
>>  		error = arch_lock_shadow_stack_status(me, arg2);
>>  		break;
>> +	case PR_GET_INDIR_BR_LP_STATUS:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
>> +		break;
>> +	case PR_SET_INDIR_BR_LP_STATUS:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		error = arch_set_indir_br_lp_status(me, (unsigned long __user *) arg2);
>> +		break;
>> +	case PR_LOCK_INDIR_BR_LP_STATUS:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		error = arch_lock_indir_br_lp_status(me, (unsigned long __user *) arg2);
>> +		break;
>>  	default:
>>  		error = -EINVAL;
>>  		break;
>> --
>> 2.43.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
