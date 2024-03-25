Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87317C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neqGN8FIlQR94nTtTbRFdk8TU+iZ6opRszcFMYGU11s=; b=TrwB/++ZsQwmD2
	v4DdYnyHn5M5B0UCdmPU+R8bWFAxlZAPKh+4Vh74auwZ6EHj1kxzhYPs2Mp+D1F2BsLq2s+v8o6HJ
	s9SV94Gi96Tr5Xo98Xk5su7061XaYOpzDEYMR3ufblIh2fRVfJr/Vui++YsLUCbaPEqW/CCm1jOSg
	KDZF7v3GkcL673NszgWY2ep0AdCBNzpeq9f2Tg1u3DXWfge3/0wGS5z0gq3TI44CGe/dBGt6DZnN7
	5qv8PCLQ1DKIO+mTJq+URmsMqtLLQUtKdUAG5JuFmCo0fYHTsYvEdDjf8MVRknUs/BpSBHi+ndVXX
	cfAsRDDRuvTS5VKwHhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosch-00000002APn-29bo;
	Mon, 25 Mar 2024 22:16:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosce-00000002ANs-12u7
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 22:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 880CC61212;
	Mon, 25 Mar 2024 22:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3090C433C7;
	Mon, 25 Mar 2024 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711405011;
	bh=OXhGVZPdG3D/LddT2Wq1BEL14paCWK/DFyKMWaLrsZA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UxDMNdWQkRpfuq/NE9RO36csB0eXkWTvW9/ekSSg/CAUrs1oVq1JezifL7/4ZMVy/
	 NL3vHYHuOyNkfWTwOn9oYOiyjQmOPWg6Iqx5LJZhshKTUJLpnow6aK4MlG/l29Th7a
	 x44I1AaMRFq3AQYlaThm1A2FWuqpEBXw4QlusUwsAMyMd6nFjcaPX446CZZtqz7pDr
	 dk6MHakJDWI9VAx3n3tYIlqn8bnQ6H2qGd4hxekUHuch/XJnvBQVDeskPB3Pzo+IY1
	 HRxizaNEivdeN0OvdCOHeZPJlpWDIkQjqLhFoC0PYehzOQMC3lWoNIoDbUBmJAYnAl
	 4z7N0ASHEujjQ==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 00:16:46 +0200
Message-Id: <D036FYBQUMIX.L5TL0SUCAO49@kernel.org>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <D036AJAEAOUF.34494O217N0RI@kernel.org>
In-Reply-To: <D036AJAEAOUF.34494O217N0RI@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_151652_688726_4C83DABF 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue Mar 26, 2024 at 12:09 AM EET, Jarkko Sakkinen wrote:
> On Mon Mar 25, 2024 at 11:55 PM EET, Jarkko Sakkinen wrote:
> > +#ifdef CONFIG_MODULES
> >  	if (register_module_notifier(&trace_kprobe_module_nb))
> >  		return -EINVAL;
> > +#endif /* CONFIG_MODULES */
>
> register_module_notifier() does have "dummy" version but what
> would I pass to it. It makes more mess than it cleans to declare
> also a "dummy" version of trace_kprobe_module_nb.
>
> The callback itself has too tight module subsystem bindings so
> that they could be simply flagged with IS_DEFINED() (or correct
> if I'm mistaken, this the conclusion I've ended up with).

One way to clean that up would be to create trace_kprobe_module.c and
move kernel module specific code over there and then change
kernel/trace/Makefile as follows:

ifeq ($(CONFIG_PERF_EVENTS),y)
obj-y += trace_kprobe.o
obj-$(CONFIG_MODULES) += trace_kprobe_module.o
endif

and define trace_kprobe_module_init() or similar to do all the dance
with notifiers etc.

This crossed my mind but did not want to do it without feedback.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
