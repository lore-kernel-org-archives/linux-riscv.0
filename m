Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F37DC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SVyDE2aqY37NIXivRWQ83oyODG3ssb8GP2+YnwLS90=; b=MBq6pWGZ6/m3Gg
	T4YgIrQzCcWBKdZA/EhDeB/7u6uMAG/fLCJB4h+eWJvsc4ARQyw3WNyvqn8Scbdicff6vvipTsbdk
	R58Di51hQsZwXTC7XPHMy3g0EVF9mGx5riQgFn+X/jFiuXcavoJrshDes9U8VnB3KQsvgAyZaDKm8
	2AjAPyKkjwAWaw6ktjuvWV5oyZVHKf2PnthP9VWtuoaL52Jdj9NVsSsOQkLl/RlTlZnMVVHwO+KlO
	HcK46OFx/iXDXPDOCbc2s4xbcsy5w3ZXUVl4kWCBIiS+FkjgxCJlNyi0QNcSwzvIUn9UfKfn9A3b0
	SwVG1ea7+RyNxcy88x1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0JSv-001D7B-0k;
	Sat, 20 May 2023 10:05:33 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0JSr-001D6d-2G
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 10:05:31 +0000
X-QQ-mid: bizesmtp77t1684577113tzgluc37
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 May 2023 18:05:12 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: 9fp+MOMfZT3nNzi64cDEIKQZuSnUQMcYiosHj/oz5jZi8nbYcnhUm+jT1v6aO
	FU2vhY+7Dzu4qX4YoY/K2ZUCAQUxbmRjCjj5gdy8oxBv/sGdjx21pPUSgARxj7z/gsfs+PF
	Il/v/HmDTS+LzSf/aDwp7ujHBmP/mr4omHuYa55vYs7i7BAbdIkBy0VsuK8XpJmtpiY9+V9
	mBI+4koVjkh7GWZZ6jI2sPyMEPEQcNcynYslQyhJM4KHAGMhNlWo1jlwzuZJYuHsf+CA85O
	teIcmSCYzc4xYZYKwYmtBlIV5nvIu6+jJZqEq2JQD310+D6QtvO8eXraXXMGDViLLn/lHgU
	MIiS+ZovwVIRliavvVjPSEPGYC2Hpae8VNIZdNPfK+jh/7bxxs=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4523727069941875416
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: aou@eecs.berkeley.edu,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulmck@kernel.org
Subject: Re: Re: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store instructions for rv32
Date: Sat, 20 May 2023 18:05:10 +0800
Message-Id: <20230520100510.31605-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230520093307.GA27287@1wt.eu>
References: <20230520093307.GA27287@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_030530_044022_5822D7CC 
X-CRM114-Status: GOOD (  14.71  )
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

> On Sat, May 20, 2023 at 05:11:44PM +0800, Zhangjin Wu wrote:
> > Hi, Willy
> > 
> > This is a full commit message for this patch:
> > 
> > When compile for rv32, we got such error:
> > 
> > ---
> > 
> > nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
> > nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
> > nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'
> > 
> > Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
> > rv32 use its own lw/sw instructions.
> > 
> > ---
> 
> That's fine, thank you!
> 
> > I will send a new version with the above full message for you, wait for a
> > while, very sorry ;-)
> 
> Don't waste your time resending, I can perfectly take that one and
> put it into the series.
>

Thanks very much, just found the first `---` is in the wrong line, please
remove the '---' lines manually ;-)

    When compile nolibc application for rv32, we got such errors:
    
    nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
    nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
    nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'
    
    Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
    rv32 uses its own lw/sw instructions.

Btw, I wrote some new comments for the 2nd __NR_lseek patch, it is:

    riscv uses the generic include/uapi/asm-generic/unistd.h, it has code
    like this:
    
        #if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
        #define __NR_lseek __NR3264_lseek
        #else
        #define __NR_llseek __NR3264_lseek
        #endif
    
    There is no __NR_lseek for rv32, use __NR_llseek instead.
    
    This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc.

The preceeding 4 white spaces are not required for real commit messages.

Best Regards,
Zhangjin Wu

> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
