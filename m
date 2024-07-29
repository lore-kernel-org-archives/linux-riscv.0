Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE947C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf1ipNTKcTMbelWYZ+qNHEvltlNI3BXWnArY3rd7DfU=; b=xYM+u7FvHDbzoc
	rco4myensgKoGhh2I3U+0tYv6LDJAWtQ7CM0t+eDgxoOwbMV8tsRJlxYdx0ezrNUwHkpeY2NTJ0NV
	doZU2ww+FJ3ESQPPVvHz3qkWLWMmMRXc9fKMVK/r2Rl2tEPMwN0QjoH4l5VYzXnK5qy+kKPkjq0OS
	YhKqoC8/OYRFGTg1iUkq6WTtbxQEDMKaQBlhNJP52dJnq82NCdiqNVZkYBqsQrwOKkA7SmUPbTZrV
	YL03wJYO1T7/mPW0Pvb4ss3npHEAke5KUeqLMqyRWhaYJUFmqrq110hnCx6wTIOZAy2FHFs8WNyM6
	yvnKW/V+TKGel57n/gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYOLn-0000000B1BF-1Jmp;
	Mon, 29 Jul 2024 11:15:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYOLM-0000000B16w-1sFY;
	Mon, 29 Jul 2024 11:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hd5f5qnrIZWu7RKgPSX6OOXWMRFjvTGBPlhsF7CF4xU=; b=wpXzLqRcHVgMqa9bTFgUs+s9fo
	7qTLLtiRecHWm4Q3FIDpErkilaSQ6qIfST1F5JYodi1CB6YiQrw3d03v6BBWdy7ukm0jFeo3tv+3o
	IPTRcOUOn4zX3jbvbdOYVdNaDDVO4teviZP3Z46RWFCOek+yqL/vIAX4BwRw+TmcGh79WKiEKPVQV
	asqUZxffJEzLCoW/cR55Y67yWvIewlPTS0H7AXwSfFiiF+YtsRa1gi6rs4BBh/GC3Pd4P//T8RiW7
	JTdhCTpHJYi11CU2qXHdLYkkCBGPT+BeZvXN4iwPWy0TAC2bdgbbN0h7KneO6ukura2PYjQQpcPfX
	/sNczz2A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60836)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sYOKe-00040L-2h;
	Mon, 29 Jul 2024 12:14:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sYOKc-0004H1-VH; Mon, 29 Jul 2024 12:14:22 +0100
Date: Mon, 29 Jul 2024 12:14:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, deller@gmx.de, javierm@redhat.com,
	bhe@redhat.com, robh@kernel.org, alexghiti@rivosinc.com,
	bjorn@rivosinc.com, akpm@linux-foundation.org, namcao@linutronix.de,
	dawei.li@shingroup.cn, chenjiahao16@huawei.com, rppt@kernel.org,
	julian.stecklina@cyberus-technology.de, rafael.j.wysocki@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ARM: Fix crash memory reserve exceed system
 memory bug
Message-ID: <Zqd5joQ/hB8wfebg@shell.armlinux.org.uk>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
 <20240722035701.696874-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722035701.696874-3-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_041508_511530_BA6495D8 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, Jul 22, 2024 at 11:57:00AM +0800, Jinjie Ruan wrote:
> Similar with x86_32, on Qemu vexpress-a9 with 1GB memory, the crash kernel
> "crashkernel=4G" is ok as below:
> 	Reserving 4096MB of memory at 2432MB for crashkernel (System RAM: 1024MB)
> 
> The cause is that the crash_size is parsed and printed with "unsigned long
> long" data type which is 8 bytes but allocated used with "phys_addr_t"
> which is 4 bytes in memblock_phys_alloc_range().
> 
> Fix it by checking if the crash_size is greater than system RAM size and
> warn out as parse_crashkernel_mem() do it if so as Baoquan suggested.
> 
> After this patch, it fails and there is no above confusing reserve
> success info.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
