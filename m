Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBB2C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unKrW2uXxf8Kg4548LK4kP+JV051jhTfLMlrzrBmFbU=; b=T8SC9X4S0pyXDl
	5emuQMkQY+OGhcyOb5RRi0pRc6b8hg7P3Zt8Lkno7Dk8BTJkDq5Xu+1KlRJNXCXSPWou1XILvYX5z
	URQ9z7BuOUXTudQS1HMMrtYKXQeR8ZSkHq8Orlv9J6InmKz01RkieE7EKe3foKY0vjmm9DIv4JRlU
	X2Jmmk5QZj1k28t9sP56n9icI7xRRY/ZutmUF54rUo3HxFoRfhJgbYfWPt16v6Xl7L1Y3ZBFDhxZo
	tPbUPZjRMFDE8gyD+TWHwGCGjXOh2KctodzcdwlsETsZyvabezhqKzjoylYf5qXbFkxa8T4BHQ/zT
	FdhohfkoHsiUH0zboAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Yt-00000009cLa-0Luk;
	Wed, 01 May 2024 12:59:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Yp-00000009cKj-31dk;
	Wed, 01 May 2024 12:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6128CE129E;
	Wed,  1 May 2024 12:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A68C4AF18;
	Wed,  1 May 2024 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714568383;
	bh=KxstT7yaWo1HV/VdY87oK/SPbrVfRoguXq0JxrzWNVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRiju2N6FSf6SmX8/SeiqxqDPVUn58NouaFEjSc492GjsVq4LUVMxAbS8dWnH+EOS
	 NNvZWiF33xtYtN0AMZ/wOMIZBhl9LzLBvpzq04+5viXGioH02aT1aqueLlUGeTAsdM
	 bevXE43WHP0/R0GnK6QMm88pTy7hn66rPkS4mlV1/0atSqvc9CF/t+aC8qAta3BZsI
	 //c6VwQ+zBloA+jYaSXYVQUA7E3ie3k1NbdK8HBck3G7AUQlbIvkWcqwnZJRENxiwv
	 9uIJBgNvmE9nr+qDv4ZZM2RRjByu9o2FhpZR9aikuuH2Go/7bd6e+GprMLjydr/dpR
	 xRW1NZVyGuhVA==
Date: Wed, 1 May 2024 13:59:35 +0100
From: Will Deacon <will@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 01/17] arm64: PCI: Migrate ACPI related functions to
 pci-acpi.c
Message-ID: <20240501125935.GA15380@willie-the-truck>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-2-sunilvl@ventanamicro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_055948_038283_F34B0067 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, May 01, 2024 at 05:47:26PM +0530, Sunil V L wrote:
> The functions defined in arm64 for ACPI support are required
> for RISC-V also. To avoid duplication, move these functions
> to common location.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  arch/arm64/kernel/pci.c | 191 ----------------------------------------
>  drivers/pci/pci-acpi.c  | 182 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 182 insertions(+), 191 deletions(-)

Looks like a straight-forward move of the code, so:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
