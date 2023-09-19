Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5154CD54AF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6DGoJjfYxPuJlZZCYwu+TnyFu41M5F4MXa1mpWMrtM=; b=aC+fuDVQa5Augy
	C5q41RjILeiTxUnvXqI/Iaq3vdE9hRhwu557wISc9w1kztvkbBtps+AtUmQDvkDXoDUFmAp0I+hsP
	teKuYICGaj4+lVhdeNRm4hPMwnCJ0zkHRdeElh1mVSqLDDoNJapzybifPLjWgBD585VaWqDnUsVjW
	SXQCRLf9uyFtz3Mla0NMlv1kHKLwCFXiEJRPD7o/Enp17wyBLw853VJAuJX1Ctxz6JiiSYQW9lH8+
	aTMhaFSASXHUkcGOjoGG2JRVo4sAxwLRWlUeEQYJTiykKRl9SpZ3RXj5R65IQpM4QCbdGRJDbOP1A
	RTNj3ALCF9z4VIoTkRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXuV-0000pq-2h;
	Tue, 19 Sep 2023 10:24:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXuS-0000ou-3B;
	Tue, 19 Sep 2023 10:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZB9BH5s6f+1vWNC2c2Ik282bpxBrIN2PmS2ywFcicC0=; b=QFgL+GrLi4spuAOmLz3KFJCeSu
	7JM8L9KKnKdJd3mizqrd7r8XOiJmeFq4ouhF6CtN3jNRYGfxLg15k+cYTBuT7BZSjFu9zVQF8U/CB
	qxcY62BX4iTdtz8TxPGyYqW8R9PtxZRdZm6Gd0YY/iva1tazgUAbLpcGUJM32rZEm45UkyONvMzWs
	Mp0U+xYRw+Re/2wd/EZgoyLCr3uesAioIu99+to9tNugowUvbsi+ux/B43lRIuE/x2tdQaVoO4Cwn
	OKzk1azVmZpkMlOWJfGw9LFPDoFDTEZ5kdmDVEPR5gKaIiaDFlSVebUav8i0+wPxIeqx4CC53O9wi
	X2T6BZ8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48024)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qiXuL-0001gT-1a;
	Tue, 19 Sep 2023 11:24:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qiXuL-0001QG-Gh; Tue, 19 Sep 2023 11:24:41 +0100
Date: Tue, 19 Sep 2023 11:24:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 32/35] ACPI: add support to register CPUs based on
 the _STA enabled bit
Message-ID: <ZQl26YlRnQaKwCg6@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-33-james.morse@arm.com>
 <20230914171341.00006e51@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914171341.00006e51@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032449_026944_DB446E3E 
X-CRM114-Status: GOOD (  19.00  )
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

On Thu, Sep 14, 2023 at 05:13:41PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:38:20 +0000
> James Morse <james.morse@arm.com> wrote:
> > +static int acpi_processor_make_enabled(struct acpi_processor *pr)
> > +{
> > +	unsigned long long sta;
> > +	acpi_status status;
> > +	bool present, enabled;
> > +
> > +	if (!acpi_has_method(pr->handle, "_STA"))
> > +		return arch_register_cpu(pr->id);
> > +
> > +	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
> > +	if (ACPI_FAILURE(status))
> > +		return -ENODEV;
> > +
> > +	present = sta & ACPI_STA_DEVICE_PRESENT;
> > +	enabled = sta & ACPI_STA_DEVICE_ENABLED;
> > +
> > +	if (cpu_online(pr->id) && (!present || !enabled)) {
> > +		pr_err_once(FW_BUG "CPU %u is online, but described as not present or disabled!\n", pr->id);
> 
> Why once?  If this for some reason happened on multiple CPUs I think we'd want to know.
> 
> > +		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
> > +	} else if (!present || !enabled) {
> > +		return -ENODEV;
> > +	}
> 
> I guess you didn't do a nested if here to avoid even longer lines.
> Could flip things around though I don't like this much either as it makes
> the normal good path exit mid way down.
> 
> 	if (present && enabled)
> 		return arch_register_cpu(pr->id);
> 
> 	if (!cpu_online(pr->id))
> 		return -ENODEV;
> 
> 	pr_err...
> 	add_taint(...
> 
> 	return arch_register_cpu(pr->id);
> 
> Ah well. Some code just has to be less than pretty.

How about:

static int acpi_processor_should_register_cpu(struct acpi_processor *pr)
{
	unsigned long long sta;
	acpi_status status;

	if (!acpi_has_method(pr->handle, "_STA"))
		return 0;

	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
	if (ACPI_FAILURE(status))
		return -ENODEV;

	if (sta & ACPI_STA_DEVICE_PRESENT && sta & ACPI_STA_DEVICE_ENABLED)
		return 0;

	if (cpu_online(pr->id)) {
		pr_err_once(FW_BUG
			    "CPU %u is online, but described as not present or disabled!\n",
			    pr->id);

		/* Register the CPU anyway */
		return 0;
	}

	return -ENODEV;
}

static int acpi_processor_make_enabled(struct acpi_processor *pr)
{
	int ret = acpi_processor_should_register_cpu(pr);

	if (ret)
		return ret;

	return arch_register_cpu(pr->id);
}

I would keep the "cpu online but !present and !disabled" as a sub-block
because it makes better reading flow, but instead break the message as
I've indicated above.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
