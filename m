Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0914C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYZfPmBPHB/CHKdCPeGtNt9qjWJXSGGTkPvlGEtK28o=; b=ZNfz/vc/+k9EDj
	4i3/moZKqnzV71fumkqZB7I6r0AxEOs1RZ9X3CRxHJ36PzEBhV2nVyTRHZf/PgdH92zOOyyO7F7Uk
	tQL87xZeEVrg6ZQtLj65+tVpuTrY0dhyGOBCAiuK3JckZ73OwdcQhG0Aj2AeVPKtpJvhrKdd/PrJk
	o6DubqgWHr9c6rSezNkMNUEJz0VvZZB7GpmgqvAtwHmawuyAOdZntumXONSD/BlUrnkLIyQLcgYqV
	EfL6fLIhgTI20t9EmnYh0xZ1gj5IcSJAvzkBp82ebP8Lk1ZJqbXNK27DmENSne2ji5wPXqKyYMxrg
	W+sHi8V/d6SNjl/6k5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJo92-0001fn-Km; Tue, 15 Feb 2022 03:04:48 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJo8y-0001ew-VG; Tue, 15 Feb 2022 03:04:46 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJo7z-001r4A-EX; Tue, 15 Feb 2022 03:03:43 +0000
Date: Tue, 15 Feb 2022 03:03:43 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 will@kernel.org, guoren@kernel.org, bcain@codeaurora.org,
 geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 14/14] uaccess: drop set_fs leftovers
Message-ID: <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-15-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_190445_019668_475B528F 
X-CRM114-Status: GOOD (  13.09  )
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

On Mon, Feb 14, 2022 at 05:34:52PM +0100, Arnd Bergmann wrote:
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
> index b5835325d44b..2f4a1b1ef387 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
> @@ -99,7 +99,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
>  	 * our gateway page, and causes no end of trouble...
>  	 */
> -	if (uaccess_kernel() && !uaddr)
> +	if (!uaddr)
>  		return -EFAULT;

	Huh?  uaccess_kernel() is removed since it becomes always false now,
so this looks odd.

	AFAICS, the comment above that check refers to futex_detect_cmpxchg()
-> cmpxchg_futex_value_locked() -> futex_atomic_cmpxchg_inatomic() call chain.
Which had been gone since commit 3297481d688a (futex: Remove futex_cmpxchg
detection).  The comment *and* the check should've been killed off back
then.
	Let's make sure to get both now...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
