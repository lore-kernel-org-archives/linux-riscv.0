Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB1C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:33:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5165D22203
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiTMQpuX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zTQBpnFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5165D22203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=laotnOTYfDJHERmIkKDjfFhlhfNUPyqey03HAZ/lyWE=; b=HiTMQpuXgxQQbPt46uFtUqDH5
	+81dbACqavSoA0lAzcUAd922rfHmsrdLTTy2eIb7lbrf918bQ08DtaGEufjT5F4tXHu8oJ4fKq13e
	mka6rEiPOORblAPPGNRnLZG/Advrs2wXfZiRO4159wyCkRbkyy/9Isry6aIsqT7y15/jF4MBQVfrT
	7H2pUjUMlD5m1mLJx0K/nNguQODR/ligWLtQGqSr0+sjgcykZR9477Hal3j4vjBgwxsSaOC2gzAaf
	EPG/Xo8Rlt779D5qYPfy/c5JZ3wDAw8sAlVCIUMipuquklhGURlplM8v5mdbKzVE1QP79V00WfNcf
	3zSbLc+Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvJBH-0001kh-Em; Tue, 14 Jul 2020 11:33:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvJBE-0001jf-LH
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 11:33:01 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93E8D22203;
 Tue, 14 Jul 2020 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594726379;
 bh=xtlPS16rUP0cZpPl3xHF2nG2TcZJBkhS95GJ/HsuOQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zTQBpnFEX2pPCkEykFECtnPpIeKK4NCUdJCau7L5YFva8nbkZp88ivOiqjtv3lwub
 zmDz4QV045BTzWzonZdhcb2ZBR+Pax1ADo0Rt3/xW8MryhlDSjCyZv6Mrda1wMgRE3
 Xod5/7cZYzljtqb6Y4GXyouBwTTpvg4IpJWa+CRY=
Date: Tue, 14 Jul 2020 20:32:54 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: guoren@kernel.org
Subject: Re: [PATCH v3 3/7] riscv: Fixup kprobes handler couldn't change pc
Message-Id: <20200714203254.aa34b5c3f50c881e29ecf7a8@kernel.org>
In-Reply-To: <1594683562-68149-4-git-send-email-guoren@kernel.org>
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-4-git-send-email-guoren@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_073300_803301_F58E10FD 
X-CRM114-Status: GOOD (  14.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, oleg@redhat.com, zong.li@sifive.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, bjorn.topel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 23:39:18 +0000
guoren@kernel.org wrote:

> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The "Changing Execution Path" section in the Documentation/kprobes.txt
> said:
> 
> Since kprobes can probe into a running kernel code, it can change the
> register set, including instruction pointer.
> 

Looks Good to me:)

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/kernel/mcount-dyn.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 35a6ed7..4b58b54 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -123,6 +123,7 @@ ENDPROC(ftrace_caller)
>  	sd	ra, (PT_SIZE_ON_STACK+8)(sp)
>  	addi	s0, sp, (PT_SIZE_ON_STACK+16)
>  
> +	sd ra,  PT_EPC(sp)
>  	sd x1,  PT_RA(sp)
>  	sd x2,  PT_SP(sp)
>  	sd x3,  PT_GP(sp)
> @@ -157,6 +158,7 @@ ENDPROC(ftrace_caller)
>  	.endm
>  
>  	.macro RESTORE_ALL
> +	ld ra,  PT_EPC(sp)
>  	ld x1,  PT_RA(sp)
>  	ld x2,  PT_SP(sp)
>  	ld x3,  PT_GP(sp)
> @@ -190,7 +192,6 @@ ENDPROC(ftrace_caller)
>  	ld x31, PT_T6(sp)
>  
>  	ld	s0, (PT_SIZE_ON_STACK)(sp)
> -	ld	ra, (PT_SIZE_ON_STACK+8)(sp)
>  	addi	sp, sp, (PT_SIZE_ON_STACK+16)
>  	.endm
>  
> -- 
> 2.7.4
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
