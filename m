Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC4C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 09:50:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B90C208FE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 09:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qjt2Nq73"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B90C208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Uo5dmv+ZfclpGiZZKYKbYSZgXAB4cSETXI88HbMrYM=; b=Qjt2Nq73Exv3y25hDjXGZM0d2
	wkmT+epfof3Vbx+VDoSzRvIHIR7v8dhDV35SoaHKZI42aX+EWc4g9y3DiX29zfG3aJj/C7rAZ2/Kf
	KigxherL+zpRHSd2TNU1S5EGuE/PNB/vFVZUbB2oX439nSjkyz4CLp5JwQHjWETJe0YG0/PRPNwsd
	ERKpa5gEjMhauf6f+OUjzqC64kd8foMvdKwPQTUf5eobgG4ogN/hxQUb5iT6tVcMa2jKJzZUzKI3a
	9f37uZkYF+qFA8UhPRyPHfcDl/NJmEQIAAAtiPXkL/YMeTBBiFjm7sUwQGinTjjby3ZvPS61pp47z
	9jLChWJRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBb1W-000173-1t; Fri, 28 Aug 2020 09:50:18 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBb1R-00014B-SC; Fri, 28 Aug 2020 09:50:14 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id F3FFD3C63C4F4B09F077;
 Fri, 28 Aug 2020 10:50:09 +0100 (IST)
Received: from localhost (10.52.127.106) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 28 Aug
 2020 10:50:05 +0100
Date: Fri, 28 Aug 2020 10:48:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC/RFT PATCH 3/6] arm64, numa: Move pcibus_to_node definition
 to generic numa code
Message-ID: <20200828104830.000007bf@Huawei.com>
In-Reply-To: <20200814214725.28818-4-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-4-atish.patra@wdc.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.127.106]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_055014_013822_A513F82E 
X-CRM114-Status: GOOD (  17.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, linux-pci@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul
 Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 14:47:22 -0700
Atish Patra <atish.patra@wdc.com> wrote:

> pcibus_to_node is used only when numa is enabled and does not depend
> on ISA. Thus, it can be moved the generic numa implementation.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

From a more general unification point of view, there seem to
be two ways architectures implement this.
Either

bus->sysdata.node

Or as here.
There are weird other options, but let us ignore those :)

That is going to take a bit of unwinding should we
want to take this unification further and perhaps we want to think
about doing this in pci generic code rather than here?

Perhaps this is one we are better keeping architecture specific for
now?

+CC Bjorn and Linux-pci


> ---
>  arch/arm64/kernel/pci.c  | 10 ----------
>  drivers/base/arch_numa.c | 11 +++++++++++
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> index 1006ed2d7c60..07c122946c11 100644
> --- a/arch/arm64/kernel/pci.c
> +++ b/arch/arm64/kernel/pci.c
> @@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
>  	return b->ops->write(b, devfn, reg, len, val);
>  }
>  
> -#ifdef CONFIG_NUMA
> -
> -int pcibus_to_node(struct pci_bus *bus)
> -{
> -	return dev_to_node(&bus->dev);
> -}
> -EXPORT_SYMBOL(pcibus_to_node);
> -
> -#endif
> -
>  #ifdef CONFIG_ACPI
>  
>  struct acpi_pci_generic_root_info {
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 83341c807240..4ab1b20a615d 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -11,6 +11,7 @@
>  #include <linux/acpi.h>
>  #include <linux/memblock.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/of.h>
>  
>  #ifdef CONFIG_ARM64
> @@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
>  
>  #endif
>  
> +#ifdef CONFIG_PCI
> +
> +int pcibus_to_node(struct pci_bus *bus)
> +{
> +	return dev_to_node(&bus->dev);
> +}
> +EXPORT_SYMBOL(pcibus_to_node);
> +
> +#endif
> +
>  static void numa_update_cpu(unsigned int cpu, bool remove)
>  {
>  	int nid = cpu_to_node(cpu);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
