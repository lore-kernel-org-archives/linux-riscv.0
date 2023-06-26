Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77159EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rq4hhUxV2XGabj0/t+MIWYLbqnreeDciY5QF8fnkt48=; b=nLInCkzKXwtoyj
	zoFgvI/dE5zGuA/oIXIr9KKq4idInC6pDN1NCqfkkbJs+ZvEl6Y1xYG15LQSBh+FY/sjTW6UYfTwN
	Pe0aCt5imU0a7cSlPAA4URlg1WaBiADmbkL70oJzu9poi0jJW5zyA+35wwnwlAlNBBFDy/tF2RVu8
	5wD+yWS9XC9cdRCKUFuZwHFxAT3Bb4U0Qsvjo0SrlgpywodLhnONVOKLKXU4AgXduckVpX6RcGqso
	rDEsitdw7/IxYmmDVR1FBDieDjy9emdscI+mOoDi0Ww2owqRhl6qr8gtd7TocqMgtN1VTZeeFPYng
	OckJ8Kzl0/8jPf89xbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoyy-00Adio-34;
	Mon, 26 Jun 2023 16:22:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoyv-00AdRl-0a;
	Mon, 26 Jun 2023 16:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6LUH4ra8Yl1TDl+4XlqQ5U8p0CDLO89uve3Fr0Kil4w=; b=aahUR+KLg6KR/ffBfCW3f0faE4
	VhUU2i+bfpTo53kVwnECUFjwpF1EGV+Gx9CskK7sGzgmpCGABJvbXoa+RkeEc4un1fvySa27Y40qi
	fjXCivPyV9Mcyx+rc7jA3Oyjl9f+aiUZoiZIE3/oGx1urWhrCUUZDGaqZcQu/BYegttXt8r+Pk2P7
	fyOyanSohw66Bp92VtuMcFMdWp1kW4PoqsDzIWleylfE2wsWFAS+fUZFEJrLRAhWYz9lDFUDY5P9X
	RALSI8H3FOncO+4t4XcD2SzaVKfw24qCDZneUGP5tZpnJqY6swVzkk+VlcLeWsHchgPLv31AgsG1o
	EoMKBeww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qDovx-0003A4-10;
	Mon, 26 Jun 2023 17:19:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qDovh-0004oC-LQ; Mon, 26 Jun 2023 17:19:05 +0100
Date: Mon, 26 Jun 2023 17:19:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	geert@linux-m68k.org, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
	frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org,
	samitolvanen@google.com, juerg.haefliger@canonical.com,
	arnd@arndb.de, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
	tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 01/13] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Message-ID: <ZJm6eS6LiSApYVTC@shell.armlinux.org.uk>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-2-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626161332.183214-2-eric.devolder@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_092225_238531_F70C14FA 
X-CRM114-Status: GOOD (  14.97  )
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

On Mon, Jun 26, 2023 at 12:13:20PM -0400, Eric DeVolder wrote:
> +config KEXEC
> +	bool "Enable kexec system call"
> +	default ARCH_DEFAULT_KEXEC
> +	depends on ARCH_SUPPORTS_KEXEC
> +	select KEXEC_CORE
> +	help
> +	  kexec is a system call that implements the ability to shutdown your
> +	  current kernel, and to start another kernel. It is like a reboot
> +	  but it is independent of the system firmware. And like a reboot
> +	  you can start any kernel with it, not just Linux.
> +
> +	  The name comes from the similarity to the exec system call.
> +
> +	  It is an ongoing process to be certain the hardware in a machine
> +	  is properly shutdown, so do not be surprised if this code does not
> +	  initially work for you. As of this writing the exact hardware
> +	  interface is strongly in flux, so no good recommendation can be
> +	  made.

Is this last paragraph still true? Is the hardware interface still
"strongly in flux" ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
