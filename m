Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855BEC54E76
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rx0FSOsw3QsHe94yP6qEPxdlL8P+fxtakjvAb9ZqgLg=; b=Zx0Q2RxQEULfa5
	7hccMCBQpSDUSteCCki7XzKGTQCipe2yCzZWBuVe3jKAlh8erlaVfbVCTruqjiKrI08i05F2rpeEW
	Mowe287W4j/+HRH+CKXxPbrNMp7MgkAC2itWCI6Mpb/rhE6/wB+qVQuPYgH3kBrnV7KXhdDMHd1A4
	pOdJt7ZZrimdMuh5u6goToDQiSMIpFemsB5nElsTnrwo4aHKbz5xve944vefrobqY+YAA/K/5Ia9P
	hlSf6iRyJyq8UUzrp45dkvz1hARjItwIRLaG3exhL+fCbx01YD4tYxXkccMEpNjo+Bo+9FIYTFlWa
	CisSueXhtDmoQHaKtNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r50WV-00BdjX-0L;
	Mon, 20 Nov 2023 09:24:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r50WQ-00Bdgb-1U;
	Mon, 20 Nov 2023 09:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VaLCPpptCPl4dd3HPwfC9h62KXrs4QNdYGscUChirrc=; b=Y7u3kRAFMUjm3/j4LodjYSA3LZ
	VC/v4Le7llOshhtVIeZgByL9Ta8EV6wWiKc32k2oFctq/SRATcfURY2PKHwM1fQ3e8O0y94oymLQc
	xUrw2kmBGd5PWCfen4xrhtknxW1A3VcIcPuln0pl6/3f9+djfDci/m0DmbTJbLwDqHwz9uzkkrzpc
	n5mOUp+mG/7fnMgC/NdjC9qKdJiht8DNMXVImILTIBATOw8lyvNOwlhTzaZeudVzzfnwbvVIrj3yR
	uYAf8x/ctMS3iNKwDTV/DFOkBJ4dwsZmpT9F11ZEBjlVG0bZ2GIoNmwdcP+kaiqwUeH0SI0NgvPw4
	bHPb0sAw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49586)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r50WD-0005DX-2m;
	Mon, 20 Nov 2023 09:24:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r50WD-00033Q-J2; Mon, 20 Nov 2023 09:24:37 +0000
Date: Mon, 20 Nov 2023 09:24:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jianyong Wu <Jianyong.Wu@arm.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Justin He <Justin.He@arm.com>, James Morse <James.Morse@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 34/39] arm64: psci: Ignore DENIED CPUs
Message-ID: <ZVsl1ZQ9JRXPf4qH@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <E1qvJBQ-00AqS8-8B@rmk-PC.armlinux.org.uk>
 <DB9PR08MB7511B178CA811C412766FDBAF4B0A@DB9PR08MB7511.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB9PR08MB7511B178CA811C412766FDBAF4B0A@DB9PR08MB7511.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_012450_538396_FB1642E2 
X-CRM114-Status: GOOD (  15.25  )
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

On Thu, Nov 16, 2023 at 07:45:51AM +0000, Jianyong Wu wrote:
> Hi Russell,
> 
> One inline comment.
...
> > Changes since RFC v2
> >  * Add specification reference
> >  * Use EPERM rather than EPROBE_DEFER
...
> > @@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)  {
> >  	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
> >  	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
> > -	if (err)
> > +	if (err && err != -EPROBE_DEFER)
> 
> Should this be EPERM? As the following psci cpu_on op will return it. I
> think you miss to change this when apply Jean-Philippe's patch.

It looks like James didn't properly update all places. Also,

> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c index
> > d9629ff87861..ee82e7880d8c 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -218,6 +218,8 @@ static int __psci_cpu_on(u32 fn, unsigned long cpuid,
> > unsigned long entry_point)
> >  	int err;
> > 
> >  	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
> > +	if (err == PSCI_RET_DENIED)
> > +		return -EPERM;
> >  	return psci_to_linux_errno(err);

This change is unnecessary - probably comes from when -EPROBE_DEFER was
being used. psci_to_linux_errno() already does:

       case PSCI_RET_DENIED:
               return -EPERM;

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
