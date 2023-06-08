Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6FFC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 23:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqXIzhuN6xnKAyEzqogJ5O0v2L5XrWHetNAM5lHRfp0=; b=ADUNlyEXASJ93n
	fqpWXGqB92ydx6O7TCADMsnMLbSDBdmK0oQ8SXckQR3+iYYwckTelUZomJiwp3JQ4ihhk45JmCC8r
	YgMWSJdKK0q4OG097aGS0+9tpDGjaO9PAvtSsCSxNzfHflecCSSw1a1FaIaOUKkA9SzeyN6FDI8tw
	THil5w5H59wrOkwhawOclD95s1vNBpWuTYMHUj4X0s68WqTrp5l7AU5YRu5rpFQJhyRBf//3sv2lQ
	tFIm1gc4cJmlcbQTj4rkHixwL7BeNaVA2a/AZt10acmH0HfUsJISz/7BcO27bxBZ8jIg3uuiPjcka
	ktH8GU5TDSwmF/JivSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7P8t-00Awjf-0B;
	Thu, 08 Jun 2023 23:34:11 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7P8p-00AwiI-1X;
	Thu, 08 Jun 2023 23:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686267247; x=1717803247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sN7dvQMQ+/TpXG6CIcwf0XKyIcjODwPRfKZrLnuiPSY=;
  b=TwP2UxFQTd5AeGClwQldkGSAJ2zOQ0c8puLmSI32uwqeDpspYF8zyoHT
   aOLlfjZ2JVuNBUWAM94laTYzBBUveJiRuCULdrl/SlsbEKTDYRvbwoeyu
   caMAtmERg3n8MA3ArEe9km1PbV1vAJhEdIiR9ZOpYfHVCwPMkjIacYBvY
   AjInmhD5N6da5sPD4NT4az14uqjLckgatZgSIPTUoLtVM92KG7mbCMuvO
   +lwfRfG1hVglciiL7UkZeF7WZvkzb0iKmnXO6BSCvrAbvoT1D7AI0cPRU
   RuOUOfpBvGGGqAX9aoO1vOJeIFbghYEbyTNxDH6UO6UZVD4J4BF7o1rnt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337097740"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="337097740"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822822455"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="822822455"
Received: from yjiang5-mobl.amr.corp.intel.com (HELO localhost) ([10.144.161.97])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:34:03 -0700
Date: Thu, 8 Jun 2023 16:34:02 -0700
From: Yunhong Jiang <yunhong.jiang@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Message-ID: <20230608233402.GA3430@yjiang5-mobl.amr.corp.intel.com>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6rujdvl.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_163407_552373_F9B60B47 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, May 30, 2023 at 12:46:22PM +0200, Thomas Gleixner wrote:
> The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
> work when invoked from the 64bit trampoline entry point:
> 
> trampoline_start64
>   trampoline_compat
>     LOAD_REALMODE_ESP <- lock
One possibly dumb question and hope get some hints. The LOAD_REALMODE_ESP is
defined under .code16 directive and will be used by 32-bit mode caller also. Is
it ok because the instructions there will be same for both 16-bit and 32-bit? I
checked
https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_16.html#SEC205 and
don't find much information there.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
