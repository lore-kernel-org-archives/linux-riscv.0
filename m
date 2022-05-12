Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACA5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnrvvzTa6fRpOlPxPSenuxOiLogWzieYhPXn5upsXbM=; b=yCgLupAzCw7J+1
	V9s7CnrQm4djVeGMCha6AooTzGOhJCO96aGFfYflmX006qxncOZhuougwA1OPMXQZu+W1fMjAe1e/
	K8P5O9dhLHjROfcx3wJ+opNwH/0iV/g8RyrMv+OCJFPn7XuxEUbk7IBPBKZR/kXYOQxXjL4fnCwY/
	MOxjHqnblcyT37XsDAFLD6ripxm2xjtYogr3w1107tSLe3kFOUWqOTd40aFn1pI7gQpzMkHO6U8cK
	QXhcPBAGRWUB4H97TuGeAysKHWomZZ5XOf8CHRauT+e/0qmmRW4NZfq3Q9SWQ64H/PLlXH7/bBhkP
	3G7pJS0O0ZtweVD0zswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9Ym-00CHTk-5Y; Thu, 12 May 2022 14:12:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9YS-00CHKO-66; Thu, 12 May 2022 14:12:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DDD5B82855;
 Thu, 12 May 2022 14:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7DCC385B8;
 Thu, 12 May 2022 14:12:31 +0000 (UTC)
Date: Thu, 12 May 2022 10:12:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Li kunyu <kunyu@nfschina.com>
Cc: mingo@redhat.com, linux@armlinux.org.uk, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] kernel: Ftrace seems to have functions to improve
 performance through optimization
Message-ID: <20220512101229.7886a798@gandalf.local.home>
In-Reply-To: <20220512063017.57412-1-kunyu@nfschina.com>
References: <20220512063017.57412-1-kunyu@nfschina.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_071236_391685_945D033A 
X-CRM114-Status: GOOD (  18.33  )
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

On Thu, 12 May 2022 14:30:17 +0800
Li kunyu <kunyu@nfschina.com> wrote:

> At present, it is found that two functions could be optimized, and the
> performance may be improved.

"may be impoved"?

Have any numbers? This changes a very slow path. I do not think it is worth
it for the "optimized". Also it's a weak function. An arch may be added that
wants to return a value.

> 
> Signed-off-by: Li kunyu <kunyu@nfschina.com>
> ---


>  void ftrace_modify_all_code(int command)
> @@ -2804,12 +2802,7 @@ void __weak arch_ftrace_update_code(int command)
>  
>  static void ftrace_run_update_code(int command)
>  {
> -	int ret;
> -
> -	ret = ftrace_arch_code_modify_prepare();
> -	FTRACE_WARN_ON(ret);

Currently no arch returns anything but zero, but this was added in case
something wrong did happen, and the FTRACE_WARN_ON() is more than just a
WARN_ON(). It will also disable ftrace.

Now, I'm not totally against this change, but not for the rationale in the
change log. That is, there is no optimization here. But as a standard clean
up with something like "There is currently no version of
ftrace_arch_code_modify_prepare() that returns anything bug zero, so the
check is not needed" is a more appropriate reason for this change.

-- Steve


> -	if (ret)
> -		return;
> +	ftrace_arch_code_modify_prepare();
>  
>  	/*
>  	 * By default we use stop_machine() to modify the code.
> @@ -2819,8 +2812,7 @@ static void ftrace_run_update_code(int command)
>  	 */
>  	arch_ftrace_update_code(command);
>  
> -	ret = ftrace_arch_code_modify_post_process();
> -	FTRACE_WARN_ON(ret);
> +	ftrace_arch_code_modify_post_process();
>  }
>  
>  static void ftrace_run_modify_code(struct ftrace_ops *ops, int command,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
