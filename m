Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B938C4167D
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=E1gwJzjNd3GcqW
	AMgACmCLxObL8xrAt0s6L3B9PI8Bu55gg5dLux10iLZM6xTR7HR6ziQfOaTcypKYB+6Sv/jFKlumf
	qM2Yw055sMIHBV7BDOK1867M1VFLSxIftVjNsZdnSuhhE4mgcUStvYsF++fcv5lFpv4QN7Y8hQGzG
	dHFIqBoQiatGl/zlrZp1sT/YJiWextmvmkWgJjCnumszjOT6miaYEmMEMXNof59XtQfXuC7Y6x3Tx
	pWr2LDJ131Ntfj50SyM8yVPJhz0DhHOBnhBfnHy71t4RLFnri59x8s5Dku5yXjbiQUR+J0sscInhn
	ZwrpwL0Nvr2EgjKYy+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKwnm-00D506-Hy; Fri, 18 Feb 2022 06:31:34 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKwnj-00D4xt-4m; Fri, 18 Feb 2022 06:31:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3037768BFE; Fri, 18 Feb 2022 07:31:28 +0100 (CET)
Date: Fri, 18 Feb 2022 07:31:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de,
 mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com,
 mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org,
 jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 12/18] uaccess: fix type mismatch warnings from
 access_ok()
Message-ID: <20220218063127.GH22576@lst.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-13-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_223131_346557_9CC7BC10 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
