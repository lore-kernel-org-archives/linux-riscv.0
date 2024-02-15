Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2EDC4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NLcMaXToIFos/appxu9wgfKtMMtGmM4xj/6aEsI4p0=; b=KPOH+brpNm+XMQ
	qistWsyYP+PlTejdMtt8JQk0YVYpXkxppI2rfkBZc47dtAk5HMUX7wBEKp+76Mm4XVIO+3lisaQkq
	pB75obTcXK9vlJf2sMRVLUAvlKTic8qToDmPERW7hFwQe+5hHI6+lidQUE6uVgmiZhi7IjGgkCgjP
	IhojGI9gKcf/x/BJKcCsR4BRq3ORvc3chmrC4GyE4w13wDMG5AvL9/K9Y7lsksYUN2C9dieLwT1Bi
	fHqoHdihfguHnzN8H+ff6tg6GN4peByy/UP9uQ5mMUzKUMnHnuJZn3WlM7FSTW82QE8sA6kBJFS4N
	IQAUE8XUX5w3t/MT3Bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZtq-0000000G25n-0dEn;
	Thu, 15 Feb 2024 11:27:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZtn-0000000G24u-32KT
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 11:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121CF1516;
	Thu, 15 Feb 2024 03:28:07 -0800 (PST)
Received: from bogus (unknown [10.163.74.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CDD43F7B4;
	Thu, 15 Feb 2024 03:27:20 -0800 (PST)
Date: Thu, 15 Feb 2024 11:27:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <20240215112719.ciq7nrh6tr2ksr5j@bogus>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <72ef475f-513b-4e33-ae85-f7e693a0cd38@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72ef475f-513b-4e33-ae85-f7e693a0cd38@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_032727_825793_41488059 
X-CRM114-Status: GOOD (  14.00  )
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

On Fri, Feb 09, 2024 at 12:11:11PM +0100, Pierre Gondois wrote:
> The code looks good to me, so FWIW:
> Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
> 
> +Sudeep as this touches cppc/arm in case he didn't see the patches
>

Thanks!

> On 2/8/24 04:44, Sunil V L wrote:
> > This series enables the support for "Collaborative Processor Performance
> > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > 
> > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > enable this, is available at [2].
> > 
> > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > 
> > The series is based on the LPI support series.
> > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> > 
> > Sunil V L (3):
> >    ACPI: RISC-V: Add CPPC driver
> >    cpufreq: Move CPPC configs to common Kconfig and add RISC-V
> >    RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ
> >

Looks good to me.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
