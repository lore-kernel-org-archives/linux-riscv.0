Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE38C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbXXBaeZsmimwLQEpe/dc+Q32GV23WeQM4AQo/JB0rk=; b=SFuCYFC986rPI8
	arUTJQjem5qu3X5TmAvLKR5XLUmayDjFdjVPSye3pfDFPXjZV91lvDvO7drIUWOjGJYc9mE5zRgW8
	qm/v09VtI+n8hc82HypZpmQWSCWeLnNzFTJeVUc/9bdKH2uExD1SReMHXaScVsn507wxMrtR/Zftk
	vHZkmaufXc1KOKUPCsj3RUiPme3FPmaHaHIFSe+NL1wJmeauUvsYIODvGFMbDlSuinsk/LOGSWE/k
	xWE1soVu7WffTBHIJuztLLndaoc/EhRJ10FY+F5Wz7MgwisDrbdeRmnaj+IEOj1fr/nq5YXhUmC/w
	ahK543ukjNWnUTSgHEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBRY-003wIW-1H;
	Fri, 15 Dec 2023 16:53:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBRU-003wGt-0s;
	Fri, 15 Dec 2023 16:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+PVeYh/iTAy0TD4XWRLYPHR1++BtvN7+emQiyKeSGnE=; b=Z6jxuPbSIKcX2/MUaMkU27ths5
	nu8me4ipMjapFn5PoBkOThifLqS9RvwtMFR5RP3FzR1VyOgfLKyq9TSNlVfgOiFx1qiL4dROUVQ0u
	hpSm7gyOvURjhX/xj2XLYUKJ7ZjYL71/HZlzdHLY2z0k9q5sSGLPFtPtpJTT/MmFRCF6kCPsDc7ys
	6aVSbz3535TDuEpLoRS4/8i/xCbeTUW/Ys4kguCoZJQACevf0NcdrvlDuzFb1D7aJMPGOMuYfdR9p
	As1u56CFgfGGaTIyfqCrOn0rwpCX3d4mxIoBy26UjlbIlT3Xxo0zLfn62sVRmuC1vi3ciaDtnkrhh
	hkvph7Sg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40980)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rEBRI-0002vl-22;
	Fri, 15 Dec 2023 16:53:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rEBRI-0003mr-4I; Fri, 15 Dec 2023 16:53:28 +0000
Date: Fri, 15 Dec 2023 16:53:28 +0000
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
	James Morse <james.morse@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH RFC v3 13/21] ACPICA: Add new MADT GICC flags fields
Message-ID: <ZXyEiHLFBsoUkfNI@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgs-00Dvko-6t@rmk-PC.armlinux.org.uk>
 <20231215162322.00007391@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215162322.00007391@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_085340_607972_87FE50ED 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, Dec 15, 2023 at 04:23:22PM +0000, Jonathan Cameron wrote:
> On Wed, 13 Dec 2023 12:50:18 +0000
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > Add the new flag field to the MADT's GICC structure.
> > 
> > 'Online Capable' indicates a disabled CPU can be enabled later. See
> > ACPI specification 6.5 Tabel 5.37: GICC CPU Interface Flags.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> I see there is an acpica pull request including this bit but with a different name
> For reference.
> https://github.com/acpica/acpica/pull/914/commits/453a5f67567786522021d5f6913f561f8b3cabf6
> 
> +CC Lorenzo who submitted that.

> > +#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
> 
> ACPI_MADT_GICC_ONLINE_CAPABLE

It's somewhat disappointing, but no big deal. It's easy enough to change
"irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs"
to use Lorenzo's name when that patch hits - and it becomes one less
patch in this patch set when Lorenzo's change eventually hits mainline.

Does anyone know how long it may take for Lorenzo's change to get into
mainline? Would it be by the 6.8 merge window or the following one?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
