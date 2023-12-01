Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F3C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNYcnIG+gMtRWlBmPykyFSdNgBpxI9PMCpbZQ9Cnc2Y=; b=x7eibRzbmfXx5M
	wVDSLuaTKNU4zMo2C8O7Co6zKPt3tSDmwTAt5dIhvKIimmvIecjpMZNvHGSo8NKvtBBbpmTvQ8QYW
	bMIfZa8+B3FJ5xYU0SNCAq4pTETq4qGfnx3TAmJawhBXJQBOtLm1Y1aakDk/i2+zJp+RzqERfPctw
	jIWgQkv6SR7RIbTqpLzyXFjopSh3Npgc4S3FVVO9tG50sIE3n4DGJkSAHkiDbPNx3668sA9UQBNeI
	jAaXnVcYv2VoHs1x3LsBGe0UqbpZJyvC0DpkQ7mteXbHXYjrfKKMNHj8nyoq5xqbpnveyqWS+aCPo
	pb5W+oLt/iQvucwXweNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r91ek-00DK0q-0E;
	Fri, 01 Dec 2023 11:26:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r91eg-00DJzQ-1Q;
	Fri, 01 Dec 2023 11:25:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701429955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kTlhtH9a0LDiJlYkT6vgajK3kHtKUEVv+qg/KTKk4HU=;
	b=0+ilR1tNhs5VaMIv76WOvkPT0qv5Fi2xLMjWOd8iwpKFF2e1rQLr8de2mbc/bHnkaNjaQe
	LbiC5q4mkGd+Sj/kPhd1ERxWAS9+FoWokpwkA65PKVnzoPGIz6d5oLfQpSLkrkRNE3pzdQ
	//bcpn1X9PhQ9O1fXMhZdr1auoP18Z7eHjeOjyN9GFUebTn83i1KnnfcKG5x+dss03Xtki
	ttU09OzufBNos8ljNL69jCpLD5yOQ+wCs/EozGUtX5kcJ5FgGKvheIIRatcpoYJRoVyDnr
	D0DygGmWcdNwEcac6KOaBeh495U3limq2zXQEY3QChB6Uu522eK6w17xZwQlAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701429955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kTlhtH9a0LDiJlYkT6vgajK3kHtKUEVv+qg/KTKk4HU=;
	b=EXq/pPMbI6sA6TcIEmqxncJn2e32OeM2qAllVTE4SFvTjeMaTIOAzfm4oL3PcYAI5mDcr2
	IYeKQ7k9Tpe0HrBQ==
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
Date: Fri, 01 Dec 2023 12:25:54 +0100
Message-ID: <87plzqxiyl.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_032558_628223_4CC4A072 
X-CRM114-Status: UNSURE (   9.11  )
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

Russell!

On Tue, Nov 21 2023 at 13:43, Russell King wrote:
> This series aims to switch most architectures over to using generic CPU
> devices rather than arch specific implementations, which I think is
> worthwhile doing even if the vCPU hotplug series needs further work.

I went through the whole series and I can't find anything
objectionable.

Vs. merging: It does not make sense to split this up and route
individual patches.

So I can pick the whole pile up and route it through tip smp/core unless
Rafael or Greg prefer to take it through one of their trees. For the
latter case:

       Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Greg, Rafael?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
