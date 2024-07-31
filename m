Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B2C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IOc+xJrHwqjP/LaUczlG0LO7bJD1iHY4kJz1FljVm4w=; b=kcB3RyG2sCUwXj
	K9IgOeErZBYFmrTu4lBpXv/9rdmmmy6sbxEp3agH4zpaI+1JVaMAN3QHIKDw5l5bx4nKymDRMBVCp
	4r5iEANxRnUqZr5XwugvMu6XFVt2wX3jwaiQgR3gKEUUKjNpCvvO7za1xi6CvBGuQpEqRlDaUOXwt
	PjcWRBUjRrY046dOj6QVWpkhs73y/Dh9poeO4nnpiW8+unK/S4mLAB5pV4gUFiYF8lwrr6YpOBiAL
	nauGLnEFPcxQKmkbUd0nzb806yrWGtkA0QL1erIunwMNE4Jk5B+EzVxlVwCiwmsz5MwKXGGPGIkEm
	ivqok1HMYd7YAP9+gcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFKs-00000002MVm-2HSJ;
	Wed, 31 Jul 2024 19:50:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFDe-00000002KVq-3ODH;
	Wed, 31 Jul 2024 19:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31691CE1804;
	Wed, 31 Jul 2024 19:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D30C4AF09;
	Wed, 31 Jul 2024 19:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722454960;
	bh=tAO8QCi4eo9UUT6fp7htXBmwR3UKsPSt0znIo0kDNVc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fkRWj59WPz/ugrjjP7itECGAQZQydbP7r8yUrpS54y0rJDh2Q9KMJwOCYEe+U3CkB
	 7RM4vr5QdcbWVAFjwhoUNBxtSfDPixf3YzTSZvA0uyroXQHgisCFzBBVhBVMQnlYgC
	 0fiZZiZh+NDq5tIr6iAYS2HM45GP+utRVuYtPvtQSueBnFAfpxB9qPYaupeXk4WNi7
	 Uvpvkn+2YjE2XJLn/Hc3zS3wPpcPaS+ygWn9Oou7SOKSuIAaiktlJRinFAsA0MAZKc
	 irJqZO7PaHYIuoNA4UeuxxTZdHn589V2VSnkUaZ/8b8P7MY97C/oT8y6Q7WGwd8t3S
	 VIgdLjTEcVmgg==
Date: Wed, 31 Jul 2024 14:42:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v7 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <20240731194238.GA78014@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729142241.733357-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_124243_044143_5F6E37D0 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, Jul 29, 2024 at 07:52:25PM +0530, Sunil V L wrote:
> Add a new function for RISC-V to do architecture specific initialization
> similar to acpi_arm_init(). Some of the ACPI tables are architecture
> specific and there is no reason trying to find them on other
> architectures.

Maybe mention the RISC-V function name as well as acpi_arm_init()?

> +++ b/drivers/acpi/riscv/init.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023-2024, Ventana Micro Systems Inc
> + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> + *

Spurious blank line.

> + */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
