Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C54C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE412082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0acWiKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE412082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adpdpb1/tY2xY+zXwdhXhonyM3qfuUPQRYh3eJt/RHY=; b=I0acWiKfg99zl/
	KV422NJ6iiyPT56v6My0zsJhYSMGcuRCo3T5viHnxqWUATVloya6Caw/iumcRGEe5GsUM7Aa/QUwW
	DyAPZNa4tau8cUpHc8N30mz6LiCknmWVe6aEjXBltSLTAIYsxxbv37RtHZL0LL4EkySC3cVoQ3Vji
	AgMRZGwf1AAtF2EhSWiBG7mbt9pNSp3FwUaTnGNWDLUFsLXoCtiv+D/PhXlk4pD0t+PN07b/Jhw+w
	5SRgYgmmak9nU/mfkt2mqTcUrcG/I2J/TFj/aAH42MKwtM/nK3TTGX3zE8jI0vbC7ZhRPyQGsL7my
	LQ/ZPbwg0ZrJQ3UhcuEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDz16-00035H-8g; Fri, 27 Sep 2019 22:47:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iDz15-00034z-CV; Fri, 27 Sep 2019 22:47:11 +0000
Date: Fri, 27 Sep 2019 15:47:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH 4/4] riscv: remove the switch statement in do_trap_break()
Message-ID: <20190927224711.GI4700@infradead.org>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-5-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569199517-5884-5-git-send-email-vincent.chen@sifive.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 23, 2019 at 08:45:17AM +0800, Vincent Chen wrote:
> To make the code more straightforward, replacing the switch statement
> with if statement.
> 
> Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/kernel/traps.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index dd13bc90aeb6..1ac75f7d0bff 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -124,23 +124,24 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
>  
>  asmlinkage void do_trap_break(struct pt_regs *regs)
>  {
> +	if (user_mode(regs)) {
> +		force_sig_fault(SIGTRAP, TRAP_BRKPT,
> +				(void __user *)(regs->sepc));
> +		return;
> +	}
> +#ifdef CONFIG_GENERIC_BUG
> +	{
>  		enum bug_trap_type type;
>  
>  		type = report_bug(regs->sepc, regs);
> +		if (type == BUG_TRAP_TYPE_WARN) {
>  			regs->sepc += get_break_insn_length(regs->sepc);
>  			return;
>  		}
> +#endif /* CONFIG_GENERIC_BUG */
> +
> +	die(regs, "Kernel BUG");

I like where this is going, but I think this can be improved further
given that fact that report_bug has a nice stub for the
!CONFIG_GENERIC_BUG case.

How about:

	if (user_mode(regs))
		force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->sepc);
	else if (report_bug(regs->sepc, regs) == BUG_TRAP_TYPE_WARN)
		regs->sepc += get_break_insn_length(regs->sepc);
	else
		die(regs, "Kernel BUG");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
