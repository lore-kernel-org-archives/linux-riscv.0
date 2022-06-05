Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F6BC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liz/KCf+ihAAe/pqqQVKoUO189aBy+K/aWx7+wqrEmQ=; b=27J8RUw6QAePYF
	ImYkVMlm6YQGb49sHtY4C7dzFH+qe7r8U+tF2dIz4JlpKLW53FulHx47+/qNF8I9J19sjlCnI5r93
	BaUM/PQvENUddbcyBKve/GN9g6gUFnOfaPmZSmdpXjjsNUeiuBABoHFeVpUSHuV7EF0GLJZ5XzhjD
	OVbg/WiZk3OwjOFZfPBF3Zk5w2QSC5ARIdRuWFw73FtxHGlPdJCUP9w/maq61KNPwKC/g0I5I/AEF
	o9oTW4O3F7ifrSl42pAGr5dpJvo2RlYoeWgtSnkf2s1TfHXQf212N8vDpyRTUDALJ8D2HFJHtr4FO
	s92dSxpWGIyANL/9Hm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxsu0-00Eshe-83; Sun, 05 Jun 2022 16:14:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxstv-00Esen-1c
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 16:14:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1ACAB80D9C;
	Sun,  5 Jun 2022 16:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621DDC385A5;
	Sun,  5 Jun 2022 16:14:44 +0000 (UTC)
Date: Sun, 5 Jun 2022 12:14:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, mingo@redhat.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, guoren@linux.alibaba.com,
 Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH riscv/for-next 4/4] riscv: ftrace: do not use
 stop_machine to update code
Message-ID: <20220605121442.668ee5ca@rorschach.local.home>
In-Reply-To: <20220529143315.3678563-5-andy.chiu@sifive.com>
References: <20220529143315.3678563-1-andy.chiu@sifive.com>
	<20220529143315.3678563-5-andy.chiu@sifive.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_091451_285761_928E7AA7 
X-CRM114-Status: GOOD (  18.12  )
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

On Sun, 29 May 2022 22:33:15 +0800
Andy Chiu <andy.chiu@sifive.com> wrote:

> Now it is safe to remove dependency from stop_machine() to patch code in
> ftrace.
> 

I wasn't able to test it, and I don't know the intrinsic details of
risc-v, but from the change logs and looking at the code from what I
could understand, it all seems reasonable to me.

For the entire patch set:

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/ftrace.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index d4bf0e5255f6..e7b8bf0a699b 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -12,6 +12,11 @@
>  #include <asm/patch.h>
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +void arch_ftrace_update_code(int command)
> +{
> +	ftrace_modify_all_code(command);
> +}
> +
>  int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
>  	mutex_lock(&text_mutex);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
