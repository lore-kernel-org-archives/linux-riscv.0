Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5217C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ict5lyDkheTvDBG2qanKkbVazNiyYnmRALQRjE4Ng2k=; b=LhWXUC4xpal0k5
	VQX5pIhy0H4Vx6lrJ5AIVFeTP0YRuLHUWokdlEkSJyOA/lUbrJxqJbGsklYUyRPW1fp71+3Zm1zWA
	jCEOajQFO/Fy+5PBn9gphEdLV/xCUH8B6hn5fbpNaLpP5mjVKshYIdffcCsreGt26C3NRSEVQDt8u
	7aSD3fvdBbjU/dhz3LR7GALlRK1PdMHfZ1ZwCn6dD97Ao6dmAnrVrwrhBok/RBnV2+2uaPrsuFBAj
	vKzUHOdvE5N9U4NAZtdpNKAIprRc1sIFaYEICmZc8erFdTxa8f6TCG/xd1EA6kHOzQS8KEbFxRPNF
	hZwxSByohhnLs0t719YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fyt-00Ap0J-0d;
	Thu, 30 Nov 2023 12:17:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fyp-00AoyG-09;
	Thu, 30 Nov 2023 12:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xIf2EIwYoaPmQHLlqFmW3VwET/3yB8a9DutsaY8oDIQ=; b=FTaxNY5GHJeGYAg7/aa/E7lEd/
	qMw/ks71XLrE4Bikt/adHddh5szYMLLdqLILVIoymEpf5KLJY/ZSGWp5z+h2+KcPnlMq6o3g5NWi7
	3AGeSuQJXa9Q2v+zt/g3yAjTIqWEuEAHozw87psltN3EBDWDqpfqkbu6wZfiB+vZxAbAQrsEZpgj5
	W+6vQ6f8QcXiyrk/svKx1p7iaymf3R1GcGn+28pZ2dVgiuui26ig2MUMpUcvwPLi/scVVp9UgUHMj
	4JmE+d2GQQoJp9dJcG2viQ0Slymk3v30atTHyckCNO5LeFIbPt8H2F4M67roxt80LrXWWDypoY4u8
	czJBEcXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34218)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8fyg-0001gn-2D;
	Thu, 30 Nov 2023 12:17:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8fyi-00050h-6g; Thu, 30 Nov 2023 12:17:12 +0000
Date: Thu, 30 Nov 2023 12:17:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gavin Shan <gshan@redhat.com>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 10/22] drivers: base: Move cpu_dev_init() after
 node_dev_init()
Message-ID: <ZWh9SMOGSrmaNidw@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
 <095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041719_083497_0995A449 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Nov 13, 2023 at 10:58:46AM +1000, Gavin Shan wrote:
> 
> 
> On 11/7/23 20:30, Russell King (Oracle) wrote:
> > From: James Morse <james.morse@arm.com>
> > 
> > NUMA systems require the node descriptions to be ready before CPUs are
> > registered. This is so that the node symlinks can be created in sysfs.
> > 
> > Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> > are registered by arch code, instead of cpu_dev_init().
> > 
> > Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> > can use GENERIC_CPU_DEVICES.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > Note: Jonathan's comment still needs addressing - see
> >    https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
> > ---
> >   drivers/base/init.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> With Jonathan's comments addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Can I assume, given Jonathan's reply later in this sub-thread, that you
are happy for me to add your r-b without the referred comment having
been addressed - Jonathan says tit was a "nice to have" and he's fine
without the requested change.

See https://lore.kernel.org/r/20231128150017.000069eb@Huawei.com

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
