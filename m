Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF41C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bd4vcmFTzmQSqxrWnlwM8jvUXYVQGQ8CJxKu/GRxXhE=; b=EzDOTGACJnhXFa
	nE43TMdCwZZaoUykhVE/1Wko5Id1A9u4WvndJamlWY+aHbPPcdzOD2sLpIIgopQCAWBMX+wBZOC3V
	6if0rQxuSm40TsSNa6IRDTVFaIALFpT2ZvjYffYnUqL7UzIsrD5WHipDOoDSPmiuD06QrjBY0Jpv7
	H6B8ik3E12eKGM91/vmfDHUCHGTLZWlwLayD1FzfhgTx13Z+ReR5fVKqz5GKZLIa6QjGCvxJrQHEf
	/nq/zM8wMgUbMWe0ySowR3LtByQdR/lwEvC8PVPYEEpQkjOnEkyD+/YKC2NWUNAkelCIF3KRHpaX2
	tPTzvecht94Sm1OprVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osp8b-00Firj-7e; Wed, 09 Nov 2022 17:45:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osp8N-00FigK-F9; Wed, 09 Nov 2022 17:45:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFD19B81F54;
	Wed,  9 Nov 2022 17:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DE8C433D6;
	Wed,  9 Nov 2022 17:44:59 +0000 (UTC)
Date: Wed, 9 Nov 2022 17:44:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>, Chris Zankel <chris@zankel.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] stackprotector: actually use get_random_canary()
Message-ID: <Y2vnGFuj5N9/o/Ia@arm.com>
References: <20221023203208.118919-1-Jason@zx2c4.com>
 <20221023203208.118919-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221023203208.118919-3-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_094507_675361_C5116FB9 
X-CRM114-Status: GOOD (  13.06  )
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

On Sun, Oct 23, 2022 at 10:32:08PM +0200, Jason A. Donenfeld wrote:
> The RNG always mixes in the Linux version extremely early in boot. It
> also always includes a cycle counter, not only during early boot, but
> each and every time it is invoked prior to being fully initialized.
> Together, this means that the use of additional xors inside of the
> various stackprotector.h files is superfluous and over-complicated.
> Instead, we can get exactly the same thing, but better, by just calling
> `get_random_canary()`.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm/include/asm/stackprotector.h     |  9 +--------
>  arch/arm64/include/asm/stackprotector.h   |  9 +--------

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
