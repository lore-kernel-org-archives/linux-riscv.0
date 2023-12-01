Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A85C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdmhplaL8G387bQvw0zHJGSxq8jT5AxHOFVHoPMGC2M=; b=KkOa1KWFz6A+t0
	ECsgI/apkfErwE1cn3V+pQOIZLcPpMvvvw+6JeJa7mrUDAfGcTQv2CUBXRxq4FBU5m9amJpCuAslI
	t2WrPaPsrHUvLlIA7VUPzp7yGSLmMMpxDkufeKoyHBwgH2c9/9tT0VtgI9E7jdtEivMhwHh0+Upz2
	Rb+HheFdFNCkME8mavE3EAng5+evLvLKkJRX15R1h9v+7nbW91dXhqtaj0TDlZIFEJx/KOtEBDsY0
	cojyC1q+XTzizsWZQgZ3qn8Dlhf6gg97RCnNvNw4RDWQ15IeIS/XPFFeycJf2wtlzm6mvxj8Dz8fH
	9Qbp7T7sEaS4xQkGW2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r964s-00E7Ty-0D;
	Fri, 01 Dec 2023 16:09:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r964p-00E7Si-1L;
	Fri, 01 Dec 2023 16:09:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701446951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uKxRp/dNJ+BlEYqlGWZid2nfWI8vIHVdIFhT+RiI/qw=;
	b=PulDj90aXiRlz0KIPhVWwqgHjbNY+GfW1XmvAqmiTU2UUTadptMLOgWxpw0sglnecWPxm2
	h3pQxvz/efyUkT0DzR6Zifyj/teIVv7LRNanyfOBCaopUgzyOdYP3BramvDqzLCaPgyMXH
	G2oUSl2ZtKWMTHxX9On5rvWRR93FCNkui+7QBPmn1fSY/iCGndY24luM31PjHukQxZY+ND
	QsyOE8crYC1sCWSj2foqen7+kQNVXcV4Jw3XBAzPRS3pU5nlDBmFRtVCbC4XYuwCPsNN5g
	EAnr8d8MCcDefPToBuDYeCdDAC+tenJqC5OG0gxx1dEo831rwsbpRsdF8dDGDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701446951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uKxRp/dNJ+BlEYqlGWZid2nfWI8vIHVdIFhT+RiI/qw=;
	b=MM+my8yufzTM5emNEOVfJBfSeaclWykJ/U1d2msgD5/TqhIRuKqH2clFiM3a1nH+LeR7kF
	F5zFA8wjF+8cUiDg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Albert Ou
 <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo
 Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen
 <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, James Morse
 <james.morse@arm.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 jianyong.wu@arm.com, justin.he@arm.com, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
 Sudeep Holla <sudeep.holla@arm.com>, WANG Xuerui <kernel@xen0n.name>, Will
 Deacon <will@kernel.org>
Subject: Re: [PATCH 00/21] Initial cleanups for vCPU hotplug
In-Reply-To: <2023120131-leotard-deprecate-4e27@gregkh>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk> <87plzqxiyl.ffs@tglx>
 <2023120131-leotard-deprecate-4e27@gregkh>
Date: Fri, 01 Dec 2023 17:09:10 +0100
Message-ID: <87jzpxykex.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_080915_623570_8C1E9FC2 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 01 2023 at 12:28, Greg Kroah-Hartman wrote:
> I can take them, will do so this weekend when I catch up on patches on a
> 14+ hour flight...

Thanks a lot!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
