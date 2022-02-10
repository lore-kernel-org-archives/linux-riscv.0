Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsX4V0cEvlhi3sjeZ5MipFCenLiHR4yKnGpvryfFhCA=; b=Ysw+/L21fsGJ1s
	3xKjcoaamGgjH8efvGuOk8M6tpWfNZTtwCEQyBiY8dHJ3a/Bekb9oKePfnuiR3O/zZSUait74HhZs
	BmT75wAmHnJzQB+fjSXTuP+iaMktt/zo+qmUbDHzRt8PbwYIspU2tVVRuIOYnSg5JSizImlikEjjJ
	a9ViimUenOH1+asNqfkemiE/FRbp9QWqkH3213ye7paOZy/pXUPko5n6jRHwcl/TX3avQV4ILm25Q
	KYT0h9AakMRxPFW942t9ZFY/FC3/GFiHpKfYeOb/mJT9sXPWIWlHXja9K/uTW9vKt+e7SseMlKX0x
	sDlJXZa9/p20akSoagYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIBcu-004Fve-2S; Thu, 10 Feb 2022 15:44:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIBcr-004FvG-Fy
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 15:44:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC5AC61B6C;
 Thu, 10 Feb 2022 15:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6947FC004E1;
 Thu, 10 Feb 2022 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644507892;
 bh=yNnHCPnRLaN2yOM6XrRMec/8b28E1NUTOd61qm0f4wM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+eVS5p+V6geTrly47Y4rMEYAqalEcF7KX2b1jzmd9o3aWa9fTxdhdFfaWi05+vtm
 w2IvA3ScEv2DV5ijXIjK8syFqYvzCsjfpvhNKy7NYmhR8kkDw5h8+CoTlcnjnpMB0u
 ZyqhmLLk1ARjt8W9DcrS0uGUiC4LLVwak04E9V3bgSnW5MesBoA+Iu5XHgtHS9WzFn
 NTtOIAJkPPTWQx87+uoQE7ulGWLJm4Qncfzau5qCE5sLSqr8qQ77Odvx/VP6kl4/g5
 0qFiGByX/mRtmLnZE2yzpwDokM/rifthcvpxUEVt06W++2TlXnvnNmra5FKZ8yu4ct
 GIlDSNVaIto0Q==
Date: Thu, 10 Feb 2022 23:37:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <YgUxIgMJRhJD6/GP@xhacker>
References: <20220129004226.32868-1-changbin.du@gmail.com>
 <YgAEb425uqy5/dw1@xhacker>
 <20220207123850.l4r5qjswaegwisbx@mail.google.com>
 <YgE7XRE/Uc6gTCWd@xhacker>
 <20220208003502.62gi5xhyg6bk2t2h@mail.google.com>
 <YgP6y99LWFSoxjHg@xhacker>
 <20220210133758.yzebffln6j76zme6@mail.google.com>
 <YgUuzZp/eiNoXejK@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgUuzZp/eiNoXejK@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_074453_598737_0F160213 
X-CRM114-Status: GOOD (  21.56  )
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

On Thu, Feb 10, 2022 at 11:27:21PM +0800, Jisheng Zhang wrote:
> On Thu, Feb 10, 2022 at 09:37:58PM +0800, Changbin Du wrote:
> > On Thu, Feb 10, 2022 at 01:32:59AM +0800, Jisheng Zhang wrote:
> > [snip]
> > > Hi Changbin,
> > > 
> > > I read the code and find that current riscv frame records during
> > > exception isn't as completed as other architectures. riscv only
> > > records frames from the ret_from_exception(). If we add completed
> > What do you mean for 'record'?
> > 
> 
> stack frame record.
> 
> > > frame records as other arch do, then the issue you saw can also
> > > be fixed at the same time.
> > > 
> > I don't think so. The problem is __builtin_return_address(1) trigger page fault
> > here.
> 
> There's misunderstanding here. I interpret this bug as incomplete
> stackframes.
> 
> This is current riscv stackframe during exception:
> 
> high
>  	----------------
> top	|		|  <- ret_from_exception
> 	----------------
> 	|		|  <- trace_hardirqs_on
> 	-----------------
> low

sorry, the "top" is wrongly placed.
 high
  	----------------
 	|		|  <- ret_from_exception
 	----------------
 	|		|  <- trace_hardirqs_on
 	-----------------
top

 low



> 
> As you said, the CALLER_ADDR1 a.k.a __builtin_return_address(1) needs
> at least two parent call frames. 
> 
> If we complete the stackframes during exception as other arch does:
> 
> high
>  	----------------
> top	|		|  <- the synthetic stackframe from the interrupted point
>  	----------------
> 	      .....	      
>         ----------------
> 	|		|  <- ret_from_exception
> 	----------------
> 	|		|  <- trace_hardirqs_on
> 	-----------------
> low

ditto

> 
> 
> Then we meet the "at least two parent call frames" requirement. IOW, my
> solution solve the problem from the entry.S side. One of the advantages
> would be we let interrupted point show up in dump_stack() as other arch
> do. What I'm not sure is whether it's safe to do so now since rc3 is
> released.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
