Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A997BC25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1qNAwwvo/CT55X9b3YlAqiZMZYDn/pY88fahmLUGII=; b=uo8wNqBRrMyOgu
	1rbzbAeOOMPen7BsKt/2TB5d090OI2kqXajPGQDM3UzG5FMXQWGhqtgDBXkUl1gQNY9DvgxVXA7Oi
	6zn54mGpz1fml/zt7KPZRnyl0f59r1rR/ELVrzIg+pcFNONxFGWzM6F/xHK22GTN5SmJMA3hjWHjh
	W+GMN4TgjN+XcPdDw1M2r98khL2Jok5tBtVXWwWPcB6+7KGSUNf44Kk/XQQ2Ta03+DxMsZLaB3fFc
	vd71/3ry7ytP6ewX2IW0lTBXyCBTscpTc1/1tUaNk+qcCETUDYQGDgouSCHA1DmER8WOy6ki1Bu+O
	5g2w6DfzM4vYZZ3ao2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQu0-00Gqk5-10;
	Fri, 27 Oct 2023 17:45:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQtw-00GqjI-1k;
	Fri, 27 Oct 2023 17:45:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698428739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCF2sTMjoJARe87DP7lAD8rcZvlM4BFzZKH7cV3QuU8=;
	b=xXX2ovs1OHhXbwDuZac6CP8IsOrVj54bZeD5nyxWlPUBOXUniX1BJWPV+PcVr7obtLN3eF
	I6uPBnLwqsSeXJfTpISEjW/ksbeWDMkDlGhuSLkQd0gwCvAm+Ogc1qakMhd99FaKFmFOz6
	1GIjy1E+N/YDe03TxrnRIU53J4jidS28NuERCZkDyMkX8X5wFJu/OtV20oF773goJYLcMm
	/ktLuCbvSshkq1Zxca8OxoWF8VJ4zqw5Ohr8CYTRGpLm9x96JuE60jmezp5gm6X3Yn94AK
	7ns6idG1lqprpc0Y27+8vH0y0yrCC8o1DwW3zTycAy/bFh5YoXh4wv0+CbwiwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698428739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCF2sTMjoJARe87DP7lAD8rcZvlM4BFzZKH7cV3QuU8=;
	b=WWHizKPPbjghvXPvf1/QyrM9sNTsNYrmVq6GoM+JMN89I9M6CgHAYJRHoOSGLIiqmVpfsl
	B+qpDGnW7YiT4hDg==
To: Bjorn Helgaas <helgaas@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>
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
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v2 13/21] irqchip: riscv-intc: Add ACPI support for AIA
In-Reply-To: <20231026165150.GA1825130@bhelgaas>
References: <20231026165150.GA1825130@bhelgaas>
Date: Fri, 27 Oct 2023 19:45:38 +0200
Message-ID: <87jzr82c3h.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104540_726286_7E556523 
X-CRM114-Status: GOOD (  13.78  )
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

On Thu, Oct 26 2023 at 11:51, Bjorn Helgaas wrote:
> On Thu, Oct 26, 2023 at 01:53:36AM +0530, Sunil V L wrote:
>> The RINTC subtype structure in MADT also has information about other
>> interrupt controllers like MMIO. So, save those information and provide
>> interfaces to retrieve them when required by corresponding drivers.
>
>> @@ -218,7 +306,19 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
>
>> +	 * MSI controller (IMSIC) in RISC-V is optional. So, unless
>> +	 * IMSIC is discovered, set system wide MSI support as
>> +	 * unsupported. Once IMSIC is probed, MSI support will be set.
>> +	 */
>> +	pci_no_msi();
>
> It doesn't seem like we should have to tell the PCI core about
> functionality we *don't* have.
>
> I would think IMSIC would be detected before enumerating PCI devices
> that might use it, and if we *haven't* found an IMSIC by the time we
> get to pci_register_host_bridge(), would/should we set
> PCI_BUS_FLAGS_NO_MSI there?
>
> I see Thomas is cc'd; he'd have better insight.

I was not really involved with this bus and MSI domain logic. Marc
should know. CC'ed.

Thanks,

        tglx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
