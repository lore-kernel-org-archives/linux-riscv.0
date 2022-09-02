Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF39ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 00:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSN1zTIq7vRHmWKSSNRVioRcHPVikuLHMu0iKVeijYQ=; b=xgMS83NmkN3KhQ
	Y2fzkQx7DipZUqitXavCjz3FbSrjrO7NK8jZ+K6O8oCNU3xTH2xcwvda9G1vxblall+IsqURKuUWn
	DCYFB4/mGT0KDA+GpChzvOr/kQVsZOy01HfWtUSxa//2znjRo22EvafajQPAcpfep58sKjfAykHBJ
	EEdzX9BSnOfQ1CtWVpBU6at8LBFuhsXRXNqzMZ7efZkZHM1qBc2Ii8SgKndb5gpqjbvDi1/afKw2P
	HTnlm3ZkIK3RQIG+MaS1QnMJg2Oh3s7rSVtrx1DC59iL5HL3ljkWVcT8mpyJ9MjS6+tLCAGb2zX1r
	mzyvoxYRbqC9wf1eRrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTuJs-00G4uM-As; Fri, 02 Sep 2022 00:14:00 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTuJp-00G4rK-13
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 00:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EsucP7zXtT1s2puFStADOK+ntllkhPbc1VqqCw1HoIk=; b=mjAWJamtj0wrpSi6hSFAzefcbd
	JrsaWUi151GxKTxNiHzJ74AZGaLaKzPaIw1mH7Y2usj1l82lrbddX78G7fSDgAsBjIYchAWmrMrhT
	xL5hwE/lUsxNq/XZRkGNiI4Jx8+Gs7V3674C6B6abfGOgfuU3wdQ1EA+gg1PGHwqD9qSGh9F+9bnK
	5nlXTTiQyrXCkQTbDYqgwFikReCuG7UMnFro69AkDbe4PP+CGfJ+rV4kcnLdUyyJRtvZ0qlL6Gug8
	cWzT5vj0+eSzuLT2Ff214Zq2xUR/akm4E4l7O1Y4LHZBrhzlmScNoi3ADloCIJkK4Bz+MU3USXtOf
	rtTS1WOA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oTuJe-00B9pb-Uf;
	Fri, 02 Sep 2022 00:13:47 +0000
Date: Fri, 2 Sep 2022 01:13:46 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-riscv@lists.infradead.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix a nasty sigreturn bug...
Message-ID: <YxFKuhw9ZGB8f/Ne@ZenIV>
References: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_171357_091766_C24D35AB 
X-CRM114-Status: GOOD (  14.81  )
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

Ping?  Does anybody have objections?  AFAICS, the bug is still
there...

On Fri, Sep 24, 2021 at 01:55:27AM +0000, Al Viro wrote:
> riscv has an equivalent of arm bug fixed by 653d48b22166; if signal
> gets caught by an interrupt that hits when we have the right value
> in a0 (-513), *and* another signal gets delivered upon sigreturn()
> (e.g. included into the blocked mask for the first signal and posted
> while the handler had been running), the syscall restart logics will
> see regs->cause equal to EXC_SYSCALL (we are in a syscall, after all)
> and a0 already restored to its original value (-513, which happens to
> be -ERESTARTNOINTR) and assume that we need to apply the usual
> syscall restart logics.
>     
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index c2d5ecbe55264..f8fb85dc94b7a 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -121,6 +121,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (restore_altstack(&frame->uc.uc_stack))
>  		goto badframe;
>  
> +	regs->cause = -1UL;
> +
>  	return regs->a0;
>  
>  badframe:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
