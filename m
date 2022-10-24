Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32FBC38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBZPrkztnw4hZVIn9NUH+iy8KToIir5ZvSKmtFHFjlI=; b=OqP87azUvt8vVd
	u96M6ojlqKeCYjxvEt7UJOf7TJG/VcwfKp7D7rSYjO/FdLLMERoBb79+zrgJtXvzrpzn/TggGLb/h
	1mWTc2EKRx1yY+KjHh2d5Kb4W2tDNV4ztyGN05qGbKMk2C85J3Ws/3pmrlEpT7lhv0u1SmzRTzQwk
	XJfGVIvGYo5d5RgpAxymRPaeQhWAHpaIjGTNDeT2V8rLhPAXVV6xkTxQfAkh6+KlGSSe9WLQ1PU1G
	AW+0vawMX6b4henroMr+Cytkz8N6S5U9Mzx+sCFeTwKgo7NIKma970t/PRY+XuqXeh4vYmB/ogrMa
	rfRKIwIfFIIQ8jzXwyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompbf-00H9EG-Vw; Mon, 24 Oct 2022 05:02:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompbU-00H99k-6P; Mon, 24 Oct 2022 05:02:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BF8EB8085C;
	Mon, 24 Oct 2022 05:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757FDC433D6;
	Mon, 24 Oct 2022 05:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666587741;
	bh=oLNeae/g3E6G/Ls0ICeBdFZ3JmsZl6TCaf+9G+ZQyuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r24wFPf2OoXaZUv1hRwUhK0LG70rwvP8C4wk+P2MA2QLtc5OBc85KnMDgO5frfUt/
	 4Ep80Vjk9MFiaue7+edpKlQI7zLMePRUhPgBOsO2uFwBve4/EOVn8iH4PxA2E9Kzkc
	 zxaSOCwadEVS4BIhzeo+C2+7Hb2+R7OTJnv2Kc/s=
Date: Mon, 24 Oct 2022 07:03:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v1 0/2] cleanup stackprotector canary generation
Message-ID: <Y1YckAwiLBh8sxao@kroah.com>
References: <20221023203208.118919-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221023203208.118919-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_220224_395670_D206E746 
X-CRM114-Status: GOOD (  12.96  )
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

On Sun, Oct 23, 2022 at 10:32:06PM +0200, Jason A. Donenfeld wrote:
> Stack canary generation currently lives partially in random.h, where it
> doesn't belong, and is in general a bit overcomplicated. This small
> patchset fixes up both issues. I'll take these in my tree, unless
> somebody else prefers to do so.
> 
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
