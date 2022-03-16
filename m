Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561E8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AygNGREPu1pAnjdPLN4Xc+dQciZI9RxUMLazlaB8dAo=; b=wyQ1TWJa24sFH7
	YhULwvBvkjN1eJDRKUf0oFsK0agQYUUzDLKqgMEl8LaoK5H6jCV8nQ6wkBtPzjaugwoGkck2bQQ/N
	evhH/ybq7roQcyO5AK1dE7+/MODT/86ztrcPuRFZV3QVSD5iIB7PjcqGzsf7n+togUW2oMSOi+iNJ
	BcCVkdH+2CWMP8zsb3AyLq5b/bhS/hEvcbeLh2Fa5RAPDBiFTO38l8Z2innNpWD35TPV6H7aDRFZp
	Gu71KlOxwPSMqght27Da1S1uYwRXhafSbVzmZGXtEJNW7Zv0dGYt0Lht0uLxxk/7WmlfiKbhqp22j
	Tt8ZEjnt33OggB5bpcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUny-00DIPw-C8; Wed, 16 Mar 2022 14:39:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUnl-00DIN1-Pa; Wed, 16 Mar 2022 14:39:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5B04DCE1FE1;
 Wed, 16 Mar 2022 14:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B930C340EC;
 Wed, 16 Mar 2022 14:38:55 +0000 (UTC)
Date: Wed, 16 Mar 2022 14:38:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: guoren@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Guo Ren <guoren@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2] arch: patch_text: Fixup last cpu should be master
Message-ID: <YjH2e4bfTl+0/+yc@arm.com>
References: <20220313012221.1755483-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313012221.1755483-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073902_042967_E14BA0FF 
X-CRM114-Status: GOOD (  20.22  )
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

On Sun, Mar 13, 2022 at 09:22:21AM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The original idea: When the
> master CPU patch_text, the others should wait for it.

I couldn't find the original intent in the commit logs (at least not in
the arm64 logs). Maybe the intention was for the CPUs to wait for the
text patching to complete rather than the master CPU to wait for the
others to enter the cpu_relax() loop before patching.

I think your patch makes sense anyway, the master CPU would wait for all
the others to enter the cpu_relax() loop before patching and releasing
them with another increment. You probably wouldn't see any issues in
practice unless you insert probes in the multi_stop_cpu() function (or
we could mark this function as __kprobes and get rid of the extra loops
entirely).

> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
>  	int i, ret = 0;
>  	struct aarch64_insn_patch *pp = arg;
>  
> -	/* The first CPU becomes master */
> -	if (atomic_inc_return(&pp->cpu_count) == 1) {
> +	/* The last CPU becomes master */
> +	if (atomic_inc_return(&pp->cpu_count) == num_online_cpus()) {
>  		for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
>  			ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
>  							     pp->new_insns[i]);

For arm64:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
