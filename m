Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C268C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SZ1457KEMj0OEFcqyPHTuLWcS1moRjwiG3oMGyPOLEw=; b=kiHKd6+eBi5DwF
	SuXfAZXldBdOMQLA4iYQF/3ameyvxeXQZ7QgvWWKZkMD/+pBuls3heuyPFOBkRFQuJJHOR8EMpmrT
	Q95KqUlcf7TO/FilFZyIJ5lPP2x1OpC5UWPtDQDhsljp7ronbehQH+WAMk7ur0QWlWO/UmQ1AN48Q
	oLKpduglbfUCCSESSQJFLwbS+ZlPnv56kliSJq60tm67qArfw9g2umY39uTdY7Z2yP920iPHZ7vGE
	mFIM8yRib4EPxrp6ZXWzVOpVqRI0hDeC+jCGsTSw70N0I80rAUXACpzMRnfNijFIeNyFggOqE45gN
	dIl/TYj1kh2o/2eLmEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEa7R-00As2c-W6; Thu, 21 Jul 2022 17:37:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEa7G-00AruL-5I; Thu, 21 Jul 2022 17:37:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86212B824FE;
	Thu, 21 Jul 2022 17:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7EEC341C6;
	Thu, 21 Jul 2022 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658425055;
	bh=2AWWnE4tIrpJ8SBcVy69tEqxyINDzFIjNPSFonICTzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YlgQcJcxhim+W1ssq5nFy9NNdDXmnUR3+Fu3aU2VsxEi88lU0u99Pl8k9aQIhb7le
	 lHSWW87lwcSMrSMVWEzXOAI73VPC+hzhbluy0iofuobXEShdi4FkBi37ESFcbF9ywC
	 IIIywpkDc9UmSWImxOqrB10k9vMhDtylfqJfnNvdE/RifTHHZenoLcS2PlB5yeQxQk
	 UtRxmmvJ5ynXbzI1EfKgwa4k+5IX5/5rMD+KQhtMhDFNMN98whd1A3m6XufrgNvKWG
	 LYZJhLfCXnnCRitqdQFVyQN2e1Yska1TPVoFWQlyIpWJ2+XW38ZQeNxkEAdLzBfA6V
	 62z9Hrd/awSMA==
Date: Thu, 21 Jul 2022 12:37:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Message-ID: <20220721173733.GA1731649@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220721134924.596152-5-shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_103738_526472_F52F6F68 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Jul 21, 2022 at 10:49:24PM +0900, Stafford Horne wrote:
> The asm/pci.h used for many newer architectures share similar
> definitions.  Move the common parts to asm-generic/pci.h to allow for
> sharing code.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v4:
>  - Add reviewed-by
> 
>  arch/arm64/include/asm/pci.h | 10 ++--------
>  arch/csky/include/asm/pci.h  | 17 ++---------------
>  arch/riscv/include/asm/pci.h | 23 ++++-------------------
>  arch/um/include/asm/pci.h    | 14 ++------------
>  include/asm-generic/pci.h    | 32 ++++++++++++++++++++++++++++++++
>  5 files changed, 42 insertions(+), 54 deletions(-)
>  create mode 100644 include/asm-generic/pci.h

> +++ b/include/asm-generic/pci.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_GENERIC_PCI_H
> +#define __ASM_GENERIC_PCI_H
> +
> +#include <linux/types.h>

Do we need <linux/types.h> here?  I don't see anything below that
depends on it.

> +#ifndef PCIBIOS_MIN_IO
> +#define PCIBIOS_MIN_IO		0
> +#endif
> +
> +#ifndef PCIBIOS_MIN_MEM
> +#define PCIBIOS_MIN_MEM		0
> +#endif
> +
> +#ifndef pcibios_assign_all_busses
> +/* For bootloaders that do not initialize the PCI bus */
> +#define pcibios_assign_all_busses() 1
> +#endif
> +
> +/* Enable generic resource mapping code in drivers/pci/ */
> +#define ARCH_GENERIC_PCI_MMAP_RESOURCE
> +
> +#ifdef CONFIG_PCI_DOMAINS
> +static inline int pci_proc_domain(struct pci_bus *bus)
> +{
> +	/* always show the domain in /proc */
> +	return 1;
> +}
> +#endif /* CONFIG_PCI_DOMAINS */
> +
> +#endif /* __ASM_GENERIC_PCI_H */
> -- 
> 2.36.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
