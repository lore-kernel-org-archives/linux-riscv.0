Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007B7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t82Q6h0Hcxd4hFF5pp9JkgSesLjE7XsMF9YiByqcEvs=; b=aaf+VDPQQSgb1x
	UwMQspm7dFJEgF9KR12cFsZGyZq6P4a5u4BvZEuMEI/JcKM/+RQuvmNOS0o1XylgiQuJC1GgJaN+2
	AsSS5S1Lf/uUHKV8y95Q2fLjJ6GlnPlZ0w4Dhuem0YqNuhQxE4ixwqkElKuvVRGfC9g1bRyecRlmf
	0JtCIGa8eflJBhAQcCyI2WfWQlamJkzGYpWXb1BxcxQVobFKeMtj2pCDVzB3+AeeFiNI8TubgwBov
	AeUrs08nHgzz6F6dPQpG/wgo1eb+WHbmbOnDRSxaLYdAMnCwhZ3xVjI95dGHgvC63+pLyyPq1i3d2
	dub97N70+SUtDCbkGJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXwy-003vmB-1t;
	Mon, 30 Oct 2023 19:29:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXwv-003vkb-1j;
	Mon, 30 Oct 2023 19:29:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698694154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okhxQnUhQwZrbcdUo7XXc56UihUKqv6O8qJ7nxX4PVE=;
	b=OvyHHOlBlpoVLw3xBWs9oqxtW+DXUQgwbbHbDbUfNF/MjfJs5bWPOU8I21CIumHlkp0uPz
	5ZkiCmUvyIM5ITCYjU15vSbdzkoIOQAnrNLVHdJzkOUfToXjY1WMmUsPke3zwZKHUCO9fI
	UtYzITvFTF3nlnm+WD5jBWNGfFPpU8AMut0ABL5tfyRWUR/XBuJ0FRwWcdE9BBLsMQjL0r
	ale9RlO+OeXn67AaYYokAGjJR97Zg4Etah8s4XQzXOtJwRhaOaHgXwoOR0szhF1UpCkx4/
	alkoCjUyP5TlAmmgcYuaYzYxYK8j3ZgTEgQwUuli6ov3DrOeN0uTx5PKsH/avw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698694154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okhxQnUhQwZrbcdUo7XXc56UihUKqv6O8qJ7nxX4PVE=;
	b=zFOsaRvRMQAnYrWgBRCI2JmVbPJt7TDD6BVd6QW+l09Vh+xA2ZroG0fVwI53jasucJNFWr
	/3KnCuuhvsW6sQCQ==
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [RFC PATCH v2 11/21] PCI: MSI: Add helper function to set
 system wide MSI support
In-Reply-To: <ZT/t0UY5rbudhjfH@sunil-laptop>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
 <20231025202344.581132-12-sunilvl@ventanamicro.com> <87a5s0yyje.ffs@tglx>
 <ZT/t0UY5rbudhjfH@sunil-laptop>
Date: Mon, 30 Oct 2023 20:29:13 +0100
Message-ID: <874ji7zz7a.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_122921_721431_BB96BAF3 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon, Oct 30 2023 at 23:24, Sunil V. L. wrote:
> On Mon, Oct 30, 2023 at 03:28:53PM +0100, Thomas Gleixner wrote:
> Just noting related discussion :
> https://www.spinics.net/lists/linux-serial/msg57616.html
>
> The MSI controller on RISC-V (IMSIC) is optional for the platform. So,
> when by default pci_msi_enable = 1 and the MSI controller is not
> discovered, we get stack trace like below.

<SNIP>

> So, what I did was, by default call pci_no_msi() to disable MSI and then
> call pci_set_msi() to enable when MSI controller is probed.

Your taste sensors should have gone out of range ...

> But I think Bjorn's suggestion to depend on PCI_BUS_FLAGS_NO_MSI may be
> better idea. In that case, we need to set bridge->msi_domain to true in
> pci_create_root_bus(). Let me know what do you prefer or if I am
> completely missing something here.

That's definitely more sensible, but as I said in the other thread, Marc
is the one who did the PCI core/bridge setup magic and he is definitely
in a better position to answer that bridge->msi_domain question.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
