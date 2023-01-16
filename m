Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A622C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FOmIXODm6hI/rJo3gAaDkHJXFP/oAYrivoptZj5mfA=; b=WIWUNrhaA/7Cso
	0+u+eWNxcnqkHOlSsTBM3CRrMQJUBwDXd5LEb8XiknMe5Bx5955IgCnpfncIO84XftXo6MFtuYD2E
	zCFX+dK78BSRmNsdjAUHqFQsakB+udnN/iRVoqzVDHPxnFmiQpb1COE6fbqETMHpWTwKZ7Qdvnfi3
	r7bwTrsmYtDXSpeZgcwKUBZfGoF6mbnGfcqfxc6Ke2691FSj8AUa1/7JXm1yUjeLJaWr3PnnvSjPK
	E9OgnDzvm+rMs0FX4gnpBOwa21+Pjhkeg9rz7lRuPiM3O2h/yTQiIs9jMGxi7EQBKWlT6Y2T4CD6v
	fsmH8lE6mmkww4kgi+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQVB-00AuiB-Pm; Mon, 16 Jan 2023 14:30:21 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQV7-00Auf3-3P
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 14:30:19 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id D5CCD341AA0;
	Mon, 16 Jan 2023 17:30:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=vWd/LpY4Wt0wtd5KU+
	HY7W2xBbe55ngU+VcigP+6LOE=; b=E7uYm3OwkP26acuKBBf1MYHaf7cXvDIiQ2
	4K6ms/qUhU+2KIavPp9bvTDkboXUjrRSFQxYEWRtMEVnfLBiLFHr8E8KfkfWSU2G
	FCfZdHg7bruCANZp1bkQqajt+OhTxJ7iGjidd9oVbzxpMnUfK76eleYPYlyLPGFR
	rp/fbXy7E=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id C4322341A9E;
	Mon, 16 Jan 2023 17:30:14 +0300 (MSK)
Received: from [10.199.21.212] (10.199.21.212) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Mon, 16 Jan
 2023 17:30:14 +0300
Message-ID: <a83dc6de-8fda-439d-b2dd-d05786e642eb@yadro.com>
Date: Mon, 16 Jan 2023 17:30:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next V7 6/7] samples: ftrace: Add riscv support for
 SAMPLE_FTRACE_DIRECT[_MULTI]
Content-Language: en-US
To: <guoren@kernel.org>, <suagrfillet@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<anup@brainfault.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <heiko@sntech.de>, <rostedt@goodmis.org>,
	<mhiramat@kernel.org>, <jolsa@redhat.com>, <bp@suse.de>,
	<jpoimboe@kernel.org>, <andy.chiu@sifive.com>, <linux@yadro.com>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <20230112090603.1295340-7-guoren@kernel.org>
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <20230112090603.1295340-7-guoren@kernel.org>
X-Originating-IP: [10.199.21.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_063017_375532_408DF9C3 
X-CRM114-Status: GOOD (  16.29  )
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

Hi,

On 12.01.2023 12:06, guoren@kernel.org wrote:
> From: Song Shuai <suagrfillet@gmail.com>
> 
> select HAVE_SAMPLE_FTRACE_DIRECT and HAVE_SAMPLE_FTRACE_DIRECT_MULTI
> for ARCH_RV64I in arch/riscv/Kconfig. And add riscv asm code for
> the ftrace-direct*.c files in samples/ftrace/.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   arch/riscv/Kconfig                          |  2 ++
>   samples/ftrace/ftrace-direct-modify.c       | 33 ++++++++++++++++++
>   samples/ftrace/ftrace-direct-multi-modify.c | 37 +++++++++++++++++++++
>   samples/ftrace/ftrace-direct-multi.c        | 22 ++++++++++++
>   samples/ftrace/ftrace-direct-too.c          | 26 +++++++++++++++
>   samples/ftrace/ftrace-direct.c              | 22 ++++++++++++
>   6 files changed, 142 insertions(+)

The samples were built OK now, but ftrace-direct-multi and 
ftrace-direct-multi-modify report incorrect values of ip/pc it seems.

I ran 'insmod ftrace-direct-multi.ko', waited a little and then checked 
the messages in the trace:

#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
      migration/1-19      [001] .....  3858.532131: my_direct_func1: my 
direct func1 ip 0
      migration/0-15      [000] d.s2.  3858.532136: my_direct_func1: my 
direct func1 ip ff60000001ba9600
      migration/0-15      [000] d..2.  3858.532204: my_direct_func1: my 
direct func1 ip ff60000003334d00
      migration/0-15      [000] .....  3858.532232: my_direct_func1: my 
direct func1 ip 0
        rcu_sched-14      [001] .....  3858.532257: my_direct_func1: my 
direct func1 ip 0
           insmod-415     [000] .....  3858.532270: my_direct_func1: my 
direct func1 ip 7fffffffffffffff
           <idle>-0       [001] ..s1.  3858.539051: my_direct_func1: my 
direct func1 ip ff60000001ba9600
           <idle>-0       [001] dns2.  3858.539124: my_direct_func1: my 
direct func1 ip ff60000001ba9600
        rcu_sched-14      [001] .....  3858.539208: my_direct_func1: my 
direct func1 ip 0
[...]

If I understand it right, my_direct_func1() should print the address of 
some location in the code, probably - at the beginning of the traced 
functions.

The printed values (0x0, 0x7fffffffffffffff, ...) are not valid code 
addresses.

The same issue is with ftrace-direct-multi-modify.ko.

Is anything missing here?

> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 307a9f413edd..e944af44f681 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -112,6 +112,8 @@ config RISCV
>          select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>          select HAVE_REGS_AND_STACK_ACCESS_API
>          select HAVE_FUNCTION_ARG_ACCESS_API
> +       select HAVE_SAMPLE_FTRACE_DIRECT
> +       select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>          select HAVE_STACKPROTECTOR
>          select HAVE_SYSCALL_TRACEPOINTS
>          select HAVE_RSEQ
> diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
> index de5a0f67f320..be7bf472c3c7 100644
> --- a/samples/ftrace/ftrace-direct-modify.c
> +++ b/samples/ftrace/ftrace-direct-modify.c
> @@ -23,6 +23,39 @@ extern void my_tramp2(void *);
> 
>   static unsigned long my_ip = (unsigned long)schedule;
> 
> +#ifdef CONFIG_RISCV
> +
> +asm (" .pushsection    .text, \"ax\", @progbits\n"
> +"      .type           my_tramp1, @function\n"
> +"      .globl          my_tramp1\n"
> +"   my_tramp1:\n"
> +"      addi sp,sp,-16\n"
> +"      sd   t0,0(sp)\n"
> +"      sd   ra,8(sp)\n"
> +"      call my_direct_func1\n"
> +"      ld   t0,0(sp)\n"
> +"      ld   ra,8(sp)\n"
> +"      addi sp,sp,16\n"
> +"      jr t0\n"
> +"      .size           my_tramp1, .-my_tramp1\n"
> +
> +"      .type           my_tramp2, @function\n"
> +"      .globl          my_tramp2\n"
> +"   my_tramp2:\n"
> +"      addi sp,sp,-16\n"
> +"      sd   t0,0(sp)\n"
> +"      sd   ra,8(sp)\n"
> +"      call my_direct_func2\n"
> +"      ld   t0,0(sp)\n"
> +"      ld   ra,8(sp)\n"
> +"      addi sp,sp,16\n"
> +"      jr t0\n"
> +"      .size           my_tramp2, .-my_tramp2\n"
> +"      .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>   #ifdef CONFIG_X86_64
> 
>   #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
> index d52370cad0b6..10884bf418f7 100644
> --- a/samples/ftrace/ftrace-direct-multi-modify.c
> +++ b/samples/ftrace/ftrace-direct-multi-modify.c
> @@ -21,6 +21,43 @@ void my_direct_func2(unsigned long ip)
>   extern void my_tramp1(void *);
>   extern void my_tramp2(void *);
> 
> +#ifdef CONFIG_RISCV
> +
> +asm (" .pushsection    .text, \"ax\", @progbits\n"
> +"      .type           my_tramp1, @function\n"
> +"      .globl          my_tramp1\n"
> +"   my_tramp1:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func1\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"      jr t0\n"
> +"      .size           my_tramp1, .-my_tramp1\n"
> +
> +"      .type           my_tramp2, @function\n"
> +"      .globl          my_tramp2\n"
> +"   my_tramp2:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func2\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"      jr t0\n"
> +"      .size           my_tramp2, .-my_tramp2\n"
> +"      .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>   #ifdef CONFIG_X86_64
> 
>   #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
> index ec1088922517..a35bf43bf6d7 100644
> --- a/samples/ftrace/ftrace-direct-multi.c
> +++ b/samples/ftrace/ftrace-direct-multi.c
> @@ -16,6 +16,28 @@ void my_direct_func(unsigned long ip)
> 
>   extern void my_tramp(void *);
> 
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>   #ifdef CONFIG_X86_64
> 
>   #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
> index e13fb59a2b47..3b62e33c2e6d 100644
> --- a/samples/ftrace/ftrace-direct-too.c
> +++ b/samples/ftrace/ftrace-direct-too.c
> @@ -18,6 +18,32 @@ void my_direct_func(struct vm_area_struct *vma,
> 
>   extern void my_tramp(void *);
> 
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-40\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   a1,8(sp)\n"
> +"       sd   a2,16(sp)\n"
> +"       sd   t0,24(sp)\n"
> +"       sd   ra,32(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   a1,8(sp)\n"
> +"       ld   a2,16(sp)\n"
> +"       ld   t0,24(sp)\n"
> +"       ld   ra,32(sp)\n"
> +"       addi sp,sp,40\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>   #ifdef CONFIG_X86_64
> 
>   #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
> index 1f769d0db20f..2cfe5a7d2d70 100644
> --- a/samples/ftrace/ftrace-direct.c
> +++ b/samples/ftrace/ftrace-direct.c
> @@ -15,6 +15,28 @@ void my_direct_func(struct task_struct *p)
> 
>   extern void my_tramp(void *);
> 
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>   #ifdef CONFIG_X86_64
> 
>   #include <asm/ibt.h>
> --
> 2.36.1
> 
> 

Regards,
Evgenii



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
