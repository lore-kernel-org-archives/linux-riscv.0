Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23369C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4x3Bx+PGIbV7yf/wl+N/OPJRGA4YAjAhPhgsoaW33E=; b=kbDiB8KHIcXrgG
	rcopIWKx+3Pa4Cb+bkaBUznjiL0dO5LBHdS8BCZsCCT3GgiLzKzkFlpJJbPTsJV4eyWhPMcarRLE3
	FSTAtbfZT/ifAxmJVJrX3OFoTeZyzbaNZguE/FnAFoGQL2OJ+NDmaTxHH0DPew7y51dl2wC0HzdRm
	Z7bzL5F4kRHzysa7qUiiho/3loqQbgdLhh4PatlcxCT2oqMb4LddF72Iv4sNqfThnvXX1VQmOLy/x
	bwVdvHyp57KO9SBYkId+2K3NlRAOSdPW+WwEu8/qU2EJdvuN0YyhaIjn9+UJlaijzUTGTukbQQ6DI
	dmLGqNANce9tjg424skA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDq3v-000zpE-0B;
	Thu, 14 Dec 2023 18:03:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDq3r-000zoO-30;
	Thu, 14 Dec 2023 18:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=az+3j+x28e0MvEnutvjaU0xgwYkokn4xM04tjgXdKPA=; b=phbhpdMhqApnRG8+xq5SsWLNms
	MNH+uNHn31DAvev+yUe5VGnPqUaT9bPvubmCX3om2ul0kSEB34STohtRy7PXweQ4YPCipcktJSMEO
	EBmq3tDRmt/HEh2JuB5zU7YMY+rQShiO7J5+Z0TXUhAfd7WWhZG5STwBTj2gxUJ9dTu2ipDGzRQgg
	dT15U01Mg3344Q2FfLVMrKt74o4PXNfCDyX/lfc30yk8prE2s4X4N+PrCMYciv5V+Bgw52q1Hrg9u
	3qABnwM119UdNsI38XnYsRQ6trF/eq3eQX7ofT+05+xvQecv/9GT3PQyQELGxIppvwV6yuwfsmlCH
	Z178ezDA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42168)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rDq3l-0001pA-0r;
	Thu, 14 Dec 2023 18:03:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rDq3n-0002l5-AY; Thu, 14 Dec 2023 18:03:47 +0000
Date: Thu, 14 Dec 2023 18:03:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 07/21] ACPI: Rename acpi_processor_hotadd_init and
 remove pre-processor guards
Message-ID: <ZXtDg1TdetEqBA8S@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgN-00DvkE-D8@rmk-PC.armlinux.org.uk>
 <20231214174337.000042a4@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214174337.000042a4@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_100351_969152_EAC4CAE8 
X-CRM114-Status: GOOD (  21.32  )
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

On Thu, Dec 14, 2023 at 05:43:37PM +0000, Jonathan Cameron wrote:
> On Wed, 13 Dec 2023 12:49:47 +0000
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > acpi_processor_hotadd_init() will make a CPU present by mapping it
> > based on its hardware id.
> > 
> > 'hotadd_init' is ambiguous once there are two different behaviours
> > for cpu hotplug. This is for toggling the _STA present bit. Subsequent
> > patches will add support for toggling the _STA enabled bit, named
> > acpi_processor_make_enabled().
> > 
> > Rename it acpi_processor_make_present() to make it clear this is
> > for CPUs that were not previously present.
> > 
> > Expose the function prototypes it uses to allow the preprocessor
> > guards to be removed. The IS_ENABLED() check will let the compiler
> > dead-code elimination pass remove this if it isn't going to be
> > used.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > ---
> > Outstanding comments:
> >  https://lore.kernel.org/r/20230914151720.00007105@Huawei.com
> 
> If it's not caused a build warning yet, chances are high this is fine.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> >  https://lore.kernel.org/r/b8f430c1-c30f-191f-18c6-f750fa6ba476@redhat.com
> >   For this comment, we use IS_ENABLED() in multiple places in the kernel in
> >   this way, and it isn't a problem.

Yes, for both of these comments, I think they aren't something that
needs any action - these patches have been published in my tree since
October, and that is subject to the kernel build bot which hasn't found
any issues.

So, I'll add your r-b, add my s-o-b, and remove the "outstanding
comments" from this patch.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
