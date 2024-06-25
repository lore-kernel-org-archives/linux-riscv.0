Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B1DC30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qhb+tjDCBWZ6lrCBTEJjOHYDKp90VvLY36//iNUvYQ=; b=iAKgiC+UCwnM9L
	zthWwvyeP/k2bLBRYgga4SY3gOrVCoB67SgS9W1RJcIVrL7ab9dPjfFCVaYpvkkNVTxDQkHxzkrbP
	+zDrrH2k6ThP2+/1qdUAMB0nT5ane/fPm4MrXtaNcKIybjKgkzSuaOVJONqcu/+2hmx8M6dJKewNu
	hkURY0hOgEfbQgtUWMpAEustYMCV7XU5xnffCyotUb6X2F3OLjfOwiC9mGEVVoKcO+PHBJ2JXEYd0
	HtaDLa6CmMyOMxUz2kqHObIPxsDD7Ui0NgUTcw53o3HqyUM6hUHgBVYJk38baqfbxi4HHWyxaiezJ
	TvRDIRS+YiZszAGrGk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0YZ-00000001xiY-1Hcn;
	Tue, 25 Jun 2024 07:25:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0YQ-00000001xdp-0Ey3;
	Tue, 25 Jun 2024 07:25:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719300324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lbM9+X7lQHMtCd9+f5UahNU/0eZ7QOoLWzJWZWNqVH8=;
	b=NgMgMb2JTCsUYPLOwbJdeNIErCWElIL3im8v3aHkfMZrzDiafPyOHz2ZQihqzTZ59feUZI
	Ph8GKIjDgaGD3fXranxhg0jog/omT47YnESkhPBfZYeXbIutaovJ4h46ymqAOe0w/vObtQ
	VAmIXZt60RmMYm596wr4gT0oa1Q5nXqkVZVUIagqA0D4lGFhgPTPJ8udrrTUjHf+S93zJK
	+wZXkqyAEgtttXeUcPfEiN9srR0V1lxTI/minAq/ggs8/RrCLiw1CV//KQH6z6iRPnsBjt
	Wq6RLW6LZQmqqcZ+Sq9yBw1m4BTlyXefGqZ59SkNO9ZPEoqmyjOKtwBBWmpRsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719300324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lbM9+X7lQHMtCd9+f5UahNU/0eZ7QOoLWzJWZWNqVH8=;
	b=et5PWOAoB6bFhTt4xdB92o5jth/5tAlsTrRR8UenmF/PZcTUGdlGchhMt2EvKAp/MhhBQx
	vz9Mlm/0DoVUKsCg==
To: Sunil V L <sunilvl@ventanamicro.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v6 00/17] RISC-V: ACPI: Add external interrupt
 controller support
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
Date: Tue, 25 Jun 2024 09:25:23 +0200
Message-ID: <875xtx7acc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_002526_260761_A7D16874 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 01 2024 at 20:33, Sunil V L wrote:
> This series adds support for the below ECR approved by ASWG.
> 1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
>
> The series primarily enables irqchip drivers for RISC-V ACPI based
> platforms.
>
> The series can be broadly categorized like below. 
>
> 1) PCI ACPI related functions are migrated from arm64 to common file so
> that we don't need to duplicate them for RISC-V.
>
> 2) Added support for re-ordering the probe of interrupt controllers when
> IRQCHIP_ACPI_DECLARE is used.
>
> 3) To ensure probe order between interrupt controllers and devices,
> implicit dependency is created similar to when _DEP is present.
>
> 4) ACPI support added in RISC-V interrupt controller drivers.

So this needs eyeballs from the ACPI people and a strategy how to merge
it.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
