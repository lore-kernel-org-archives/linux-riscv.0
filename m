Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE8FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPQfo5Hh1edBjoURtpe5mS4fcECyldv+P4BVwZnkcZc=; b=SHM4AhwqdWwHBV
	ZY3He5PRxBa2kfO2A/4XpLU5IszY4HkD55wdJP8jvW6A7YXyLMfvVxI0piFHHL8Wyl42ykCKFSdpz
	hdsdAIMWs4/5Kmoy9nUNbGMeMoohU3ccfNEA5bgVJNvFxXO5dYsjm8uTS5zk2fthumJSrJj8YX76m
	O3cXN03vpBxYfynZjycw529ZYWpyb0cxtb90qkfPPzv8njTU2H8GrGgFq+F3dNeP8mzrWRQjg2twg
	8qs3Wn162mWjoVz39YZSrwCpbiAIi5ZNBfofF4Uszaj7zLoTx4cdzjDeSEzUaMj6yshr0NzVy5KWU
	/9Lw+DfxprWmBxIU6ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zH6-00D1M3-1T;
	Fri, 01 Dec 2023 08:53:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zGw-00D1J1-2O;
	Fri, 01 Dec 2023 08:53:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701420794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AsSuhopWvqk3I522fxQ6ooSX/rywsngW1wlaL3r7/7U=;
	b=rPEuIkBJ8+ySLg//CUXlWUdvWgl2gX9GyTR9vtkIwcxNKJI7DKlqMpvFlOEkC31c410v3N
	RtBVDpI/K6AnA+eWN5mwI2AFlv2FHP54pACmcrj77DstChyu704ex9o15EnIdhJOvxqxVS
	pjfj5G9UQjUiqVzyQWik+YmfX2xxEB8dl8M0qxkrZ4PQLniFTbsPeyCCik6wXwAq8jwi0W
	SyKHyeHvlDqWBTzuTSI5RF5MTYE2moAzq4SPm5J6znLxG8p4+tegHmvDJRVi69lqcgZJcC
	RyOzFLfC8u2r30n17ECgvuv2bywn9k6in+STOh4hMyUG+s26WrhFK8d4JpXu8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701420794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AsSuhopWvqk3I522fxQ6ooSX/rywsngW1wlaL3r7/7U=;
	b=k3lhqCWbYvJz0Bi9J6xDfIkYCKnBYBQV6tpu4jDjNakRVSGUK5S46foplXONrFPARA7GXL
	VrY+PwiLWS/RqKBQ==
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, James Morse <james.morse@arm.com>, Jean-Philippe
 Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, Len Brown <lenb@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter
 Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Salil Mehta <salil.mehta@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/21] Initial cleanups for vCPU hotplug
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
Date: Fri, 01 Dec 2023 09:53:13 +0100
Message-ID: <87y1eexq12.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_005321_100716_834ED002 
X-CRM114-Status: GOOD (  17.99  )
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

On Tue, Nov 21 2023 at 13:43, Russell King wrote:
> The majority of the other patches come from the vCPU hotplug RFC v3
> series I posted earlier, rebased on Linus' current tip, but with some
> new patches adding arch_cpu_is_hotpluggable() as the remaining
> arch_register_cpu() functions only differ in the setting of the
> hotpluggable member of the CPU device - so let's get generic code
> doing that and provide a way for an architecture to specify whether a
> CPU is hotpluggable.
>
> This patch series has been updated as best I can from the comments on
> its previous 22-patch posting, but there are some things that I have
> been unable to address (some of which go back to James' posting of
> RFC v2 of the vcpu hotplug series) due to lack of co-operation from
> either reviewers responding to my questions, or from the patch author
> providing information. I have now come to the conclusion that this
> information is never going to come, but there is still benefit to
> moving forward with this patch set. I don't expect that anyone will
> even bother to read this far down the email, so blah blah blah blah
> blah blah blah blah blah. I bet no one reads this so I don't know why
> I bother writing crud like this.

You lost your bet. I always read cover letters completely because they
tell a lot. There is correlation between the amount of blah and the
quality of the series :)

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
