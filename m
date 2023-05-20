Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F0C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2EcQys8ujyKzH+m30E9zZKCZKEklPAIW3CYQplOyEc=; b=K+pGdNFRiatbWR
	WDwWT0lON2mhsP1O9WhZq4jL8grps4+lDihsxrEQl3MkzZDTui83+ZfC4MlLBKtpF56N46J7RDZH6
	t80bbSpnVRyHJGpoxaMF9Bntf8pKooG2uYhFnlJxxHFSAR+dAUwQe6GF4YIFfLKjE0NilXXkJV/io
	VLlHuEL1hE+8mGrwlNHvIWPN2Q60VMhzDFn8+83iEJhti53i13lMRQEw2xygEtTZ6mKkINHv8eHXw
	bxgL+aWnSmen5xzpRvqaddCeT+dRfAUAL79J6bMNgJHo2RTRPLyPaSyQLG+6IB8td79B1oE8et3wC
	JlnF3bXYMH87rFElqGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Jhu-001Eho-0y;
	Sat, 20 May 2023 10:21:02 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Jhr-001Ef8-0P
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 10:21:01 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34KAKMGF027329;
	Sat, 20 May 2023 12:20:22 +0200
Date: Sat, 20 May 2023 12:20:22 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@rivosinc.com,
        paul.walmsley@sifive.com, paulmck@kernel.org
Subject: Re: Re: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store
 instructions for rv32
Message-ID: <20230520102022.GA27326@1wt.eu>
References: <20230520093307.GA27287@1wt.eu>
 <20230520100510.31605-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520100510.31605-1-falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_032059_647201_2D9413CC 
X-CRM114-Status: GOOD (  17.82  )
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

On Sat, May 20, 2023 at 06:05:10PM +0800, Zhangjin Wu wrote:
> > On Sat, May 20, 2023 at 05:11:44PM +0800, Zhangjin Wu wrote:
> > > Hi, Willy
> > > 
> > > This is a full commit message for this patch:
> > > 
> > > When compile for rv32, we got such error:
> > > 
> > > ---
> > > 
> > > nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
> > > nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
> > > nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'
> > > 
> > > Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
> > > rv32 use its own lw/sw instructions.
> > > 
> > > ---
> > 
> > That's fine, thank you!
> > 
> > > I will send a new version with the above full message for you, wait for a
> > > while, very sorry ;-)
> > 
> > Don't waste your time resending, I can perfectly take that one and
> > put it into the series.
> >
> 
> Thanks very much, just found the first `---` is in the wrong line, please
> remove the '---' lines manually ;-)
> 
>     When compile nolibc application for rv32, we got such errors:
>     
>     nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
>     nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
>     nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'
>     
>     Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
>     rv32 uses its own lw/sw instructions.
> 
> Btw, I wrote some new comments for the 2nd __NR_lseek patch, it is:
> 
>     riscv uses the generic include/uapi/asm-generic/unistd.h, it has code
>     like this:
>     
>         #if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
>         #define __NR_lseek __NR3264_lseek
>         #else
>         #define __NR_llseek __NR3264_lseek
>         #endif
>     
>     There is no __NR_lseek for rv32, use __NR_llseek instead.
>     
>     This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc.

Many thanks, it's indeed better this way.

> The preceeding 4 white spaces are not required for real commit messages.

Sure ;-)

Thanks
willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
