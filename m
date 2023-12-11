Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD2C10F05
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJYDsrwAc0lTkJ3Uu6X9uXn+t1TB1ZUad1fOx6rp0A4=; b=XWwQejKvb8R3CA
	PuN38skw3UiOiizwF0qTyFg8dvu24ehf8VBAQl/CixHG7MX61Gc1tCw/fjG2wSrexlztWsB6WYBRz
	EevqYazV2LNQSbJ6wg2Ot313l7PocgVnnBXqi9htV0CgcoSEoyU8PPrZg/8lSMUOE7IsO454z2SvB
	EaAj0Ef9+K9TI3JXaNHc0U0LR9zfhUe2yUD4x6p7Pk4PBWfzLtniOcK+58FSjSZAtTOoByWdtHXGf
	UiMcJ19l73z3ihSIRYqaWO1QegH5Jg67GLEeVribQjmh9r2hQVMb0FHInXN4MuWil+iS798X1BbIi
	tNtqG/n5XCXYLAzQ/ENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgER-004wb0-2P;
	Mon, 11 Dec 2023 13:21:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgDX-004wNN-1O;
	Mon, 11 Dec 2023 13:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E72AB6127C;
	Mon, 11 Dec 2023 13:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BCBC433C7;
	Mon, 11 Dec 2023 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702300862;
	bh=q1SgpAHgTb9yNjf1ijuF/WsU7ziWgOtp9e+gjYp9MJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtVmf+id/i3jL+CkVLVQSKAM+su33w9usY4qz6ohe9ikJJaAELtzij3VYjgA9Ewp8
	 IbjgnPDTmFzYLzisW9RoqzCM+BlinoHFZh9dn8c3DWcsxaE7n/xlIFYd5cNd5iiZYM
	 xn+RGUNrzobVTZmgr2G/YPkzYJMxadR3JbLDRVmqIeguYU5M9B/epx6dLNTOKngCI1
	 MfqbPSRfjDDI0mZH6L+x+WiFuG5bmPQYYmqls0mwsWZmq8aHN3nwqrQ5zwoWRasUBO
	 t0AaPcL5MZAHJ+qrn0787/YMKkAZKw1LM4Ra/RYRDixl9gMGsxMV+U5fiYp+UkKYuN
	 EBTvml+3hP+1Q==
Date: Mon, 11 Dec 2023 13:20:55 +0000
From: Will Deacon <will@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 12/21] arm64: setup: Switch over to GENERIC_CPU_DEVICES
 using arch_register_cpu()
Message-ID: <20231211132054.GC25681@willie-the-truck>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3b-00Csza-Ku@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1r5R3b-00Csza-Ku@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_052103_534415_93206880 
X-CRM114-Status: GOOD (  17.81  )
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

On Tue, Nov 21, 2023 at 01:44:51PM +0000, Russell King wrote:
> From: James Morse <james.morse@arm.com>
> 
> To allow ACPI's _STA value to hide CPUs that are present, but not
> available to online right now due to VMM or firmware policy, the
> register_cpu() call needs to be made by the ACPI machinery when ACPI
> is in use. This allows it to hide CPUs that are unavailable from sysfs.
> 
> Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> five ACPI architectures to be modified at once.
> 
> Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> that populates the hotpluggable flag. arch_register_cpu() is also the
> interface the ACPI machinery expects.
> 
> The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> it to use the one GENERIC_CPU_DEVICES provides.
> 
> This changes the CPUs visible in sysfs from possible to present, but
> on arm64 smp_prepare_cpus() ensures these are the same.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>  * Add note about initialisation order change.
> ---
>  arch/arm64/Kconfig           |  1 +
>  arch/arm64/include/asm/cpu.h |  1 -
>  arch/arm64/kernel/setup.c    | 13 ++++---------
>  3 files changed, 5 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
