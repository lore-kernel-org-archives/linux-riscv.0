Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8642CC46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jBtphTzjbgFGkIWDvJ4lZdlwBfG8MX9jvaN0Drz1/u0=; b=XY/W9tQ0ZMict5
	I/1wAcj0gabdAZhFCL2/LaIF2zJTIBLT4oY9Fvhztqu11daDLOz0lveZ8Y5+snMIPqqtbxlXYtMoD
	E3txm3/Oss1oW6WFHl/LUuz2QkTWacOH34/29P68Rj1/Be+e22h0h3sw/wOky11tPvciqGLiusfNH
	x5TCfixeIr1ZVVcmX5JOkm1XT8NMtN+GPfj0hJahqyEQXVg7whYiuDIJyiX6N+4WIrKGy7+pjKhFZ
	jOaqNeMyweEK868LLnDz9owDPND8341FGpeus/2ZnRrxJgfY9qXYqAhbxG5ekRRF00dVn5lynLKKB
	7/8srTkfPITAMkH1WdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIHHU-00DgVV-1V;
	Tue, 26 Dec 2023 23:56:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIHHL-00DgTX-2c;
	Tue, 26 Dec 2023 23:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAE7460ED1;
	Tue, 26 Dec 2023 23:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152A4C433C7;
	Tue, 26 Dec 2023 23:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703634964;
	bh=eeVVPhs698tzJMKPnsN0mOMee+NQ/JOkzljbDzyuvrk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WDqRFliWt4+s1yPPXM6G//iGI15rQXGWKOoUX9AIRwNDaC0lerFygACxFF/fWG8UX
	 7377qOSvMf1ojfixahrgoBVMCNh2axBW9diJLgSXOmFFD44/BywBakydLB+MWjHgL5
	 mcyWv1sr9WIsGT3uxSd9hmIqw+qcct4UCnQBwBpYpTrN+pQXdRFE4E1CzvrFtBDQ5c
	 z1GO4icvo2Y4Wo28r/5iCAASXkZWh7Oo2fCFahN5CR2C6yyLdMqVIzajysf6kA6N+s
	 YjJ5KSiJlV6v4FEXtbo4KrkqAc2CI01/jvlM3wy0hUDYJjlpfDTvLEKMKDsU+FlOMr
	 U1H3Z20ISE+RA==
Date: Tue, 26 Dec 2023 17:56:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anup Patel <anup@brainfault.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v3 03/17] PCI: Make pci_create_root_bus() declare its
 reliance on MSI domains
Message-ID: <20231226235602.GA1483795@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231219174526.2235150-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_155610_364515_340C118E 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Dec 19, 2023 at 11:15:12PM +0530, Sunil V L wrote:
> Similar to [1], declare this dependency for PCI probe in ACPI based
> flow.

It would be better to refer to this as 9ec37efb8783 ("PCI/MSI: Make
pci_host_common_probe() declare its reliance on MSI domains") instead
of a link to the mailing list archives.

The git SHA1 is part of the git repo, and git can tell us where that
SHA1 is included.  The lore URL is external and doesn't say anything
about what happened to the patch.

> This is required especially for RISC-V platforms where MSI controller
> can be absent.
> 
> [1] - https://lore.kernel.org/all/20210330151145.997953-12-maz@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
