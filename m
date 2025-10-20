Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2DACCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6OguXbEOXspU/Vl8mLqZLrZaistetEeqXGpjRHgKPk=; b=nKVBxLOHUifKXO
	gFyqcxCqCqlFaZ3URRg3O6bgPGv4g0CYt9ufq8TafFLaT4ejSekDVcRho2ftC/afWw+7gi8pqm9Dx
	uINUay7A4A/eHqLZZrrz1FVyDWWjhX/bUz4n8YL/qLvLXwSV8Qr6uio0q03mT/QKSh76orkrPZA22
	hCGBOmo3nuQnXzk96iqQ85cor+eQMPKyXXWDepnJ5zlgMNnz9Ntc1hBj9XaqxQ3wsEjcXoOdouBmO
	SgZysSMdXUoqp5hfoGGAo+xcSJbgMOW0rKGsHUfVnzRIRl2j0Xr4wkWwFw1cOWh09f71Q5EMpYCoI
	cHQi2v/Sy1g1qZ++Pa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtwO-0000000EX7b-2ZAT;
	Mon, 20 Oct 2025 17:45:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtwK-0000000EX4T-2vy8
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 17:45:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760982296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5nLyOLxW/yZHAWixRniPvYdKNsJsg26FMrw+1O2HHQ=;
	b=y+d2pJ0ZdEqudmxQCJZi43gDWG7GBPQuOF2BgYQSmyQI/iSouL601cj4GbfGHGp4wlYyAz
	tSbzx+0di4OZKfmRzvI40dyQmYJaklm9QhhPpnbiHO5hfxHvkCExHWe8EkO+S6ag3jPzYC
	B06MBMsud1Zem1+lNIpd99KlcH3ktOXsoBW+o0uArrTBw42YmJK2GOPKBd5Lhh26MkFUhj
	N7KSU7IOLpj59ZEKCvTWGyTYOOjVhVvXWfM8+4McYFvA8gIZOSenZv/HVrUtFUj/Gmg95Z
	e3uGlHtb3CGV1amdoX+7OUAM1usBpP+ZR7/DTm/bDoQd352nAYP8IB8YFZVdLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760982296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5nLyOLxW/yZHAWixRniPvYdKNsJsg26FMrw+1O2HHQ=;
	b=GFYwm7eY7qOlZEbF48OLPgnfFsyAlxEg/Nkxo/hWMQgnXWjR+Ra52dR2A/eSzQmJ38jIrj
	HUHuepe36hYeWvBA==
To: Troy Mitchell <troy.mitchell@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Troy
 Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] irqchip/sifive-plic: use hartid as context_id in OF to
 fix AMP conflicts
In-Reply-To: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
References: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
Date: Mon, 20 Oct 2025 19:44:55 +0200
Message-ID: <87bjm1zcvc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_104500_890247_2E6C6A52 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, Oct 20 2025 at 11:49, Troy Mitchell wrote:
> In asymmetric multi-processing (AMP) scenarios, the original PLIC
> driver used the context loop index 'i' as context_id for OF (device

Which original driver and when did it stop to use the context loop index?

> tree) platforms. This caused multiple contexts from different harts
> (e.g., core0 and core4) to share the same enable_base, leading to
> conflicts when initializing the PLIC.

When did it stop to cause the issues? And if the issues have been
already resolved, what is this patch about?

> This patch resolves enable_base conflicts on AMP platforms while

# git grep 'This patch' Documentation/process/

> maintaining SMP/UP behavior.

There is zero explanation what this patch does to resolve the issue.

See also:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

>  
>  		if (is_of_node(fwnode)) {
> -			context_id = i;
> +			context_id = hartid * 2 + i % 2;

This is incomprehensible and will cause head scratching 6 weeks down the
road. This needs a proper comment with an explanation what this is
about and why it is correct under all circumstances.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
