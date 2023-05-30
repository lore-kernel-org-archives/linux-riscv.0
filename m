Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD800C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/Q9kaqlFjLOhpimnfy5SRNmbLBo2ebm7pE53KqzBnM=; b=uGOrHwZaMQuWUD
	0cGYGUnXpyl6qF2U514SWJeVMxKtaFDGuMN7id50pYshIHuXPZqqcQhCeYYlDXTZ30z+h60smn2BQ
	Dl8SHqaE6MjbeirU/3wA1KiLggXrTGY6579Xu20G4r0zHJ5bvDLo+mbiGSuJ3dgWbWXDYYuGZZlB6
	COdtpADE9W0kl8p0R/mfmDtD10D1R8qEH2KKVcLLIs1Q0QvOBBdLKCxkBdMHNCWkLb6QvuhoLdAdd
	d23iMfNsag9fELtQSlg2nDXzfw8Ol5S4+wzckJkuH/l90vnmeLlMj3zKpqT+SCUkI7wNAHYYltwD+
	GyDKq0FXEaXVUJDXe6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zoR-00E7Jr-03;
	Tue, 30 May 2023 13:54:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zoN-00E7H6-2y
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 13:54:57 +0000
X-QQ-mid: bizesmtp67t1685454874tcbczm6n
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 21:54:33 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: xwvWJGGFd7M6Lf9NrCrasfk6SUbNPheOBSL8ua9DdJsxRZlXQL39nTjnTvL+d
	XLdpGp9SJk9zYuni6DU/NAh7tFSEqaWm7zDN6JJbcoR9OmNKi9eEzB8kiWo06NR4+QJwJek
	E07Tsl/YYyT5/LMOIPqhsXJaey7sesek4fBbqIZJjUpPPCWiF/nyzN5OQFsNv0/EVNAfKEA
	tiOsJO2gCV132ZfqipSRr17DV49vHO0GcMmZsXh1r1ok7mw8jjufV6jL00g3s1kawQ4aCMd
	JRF+DFJ8gSGzm9bI0ZTGRTuepiJIUBs7L+9IWBple5DQXdVqYQmTgbjkgNEHBXU4JMXKFpn
	AIEZI3yhqlGyRoKT96g9LDL1yqF719Sphr20qfdQ1JWK1TbhJm0kAwMwj5wUf1heIRNNMOT
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9011537490340992174
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH v2 07/13] tools/nolibc: sys_lseek: add pure 64bit lseek
Date: Tue, 30 May 2023 21:54:33 +0800
Message-Id: <20230530135433.405051-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com>
References: <5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_065456_274129_E8378796 
X-CRM114-Status: GOOD (  24.64  )
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

Hi, Arnd, Willy

> On Mon, May 29, 2023, at 21:54, Zhangjin Wu wrote:
> > use sys_llseek instead of sys_lseek to add 64bit seek even in 32bit
> > platforms.
> >
> > This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc and
> > src/unistd/lseek.c of musl.
> >
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  tools/include/nolibc/sys.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 98cfa2f6d021..d0720af84b6d 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -672,7 +672,17 @@ int link(const char *old, const char *new)
> >  static __attribute__((unused))
> >  off_t sys_lseek(int fd, off_t offset, int whence)
> >  {
> > +#if defined(__NR_llseek) || defined(__NR__llseek)
> > +#ifndef __NR__llseek
> > +#define __NR__llseek __NR_llseek
> > +#endif
> > +	off_t result;
> > +	return my_syscall5(__NR__llseek, fd, offset >> 32, offset, &result, 
> > whence) ?: result;
> > +#elif defined(__NR_lseek)
> >  	return my_syscall3(__NR_lseek, fd, offset, whence);
> > +#else
> > +#error None of __NR_lseek, __NR_llseek nor __NR__llseek defined, 
> > cannot implement sys_lseek()
> > +#endif
> >  }
> 
> This is not technically wrong, but I think a different approach
> would be clearer: Instead of having a sys_lseek() that works
> differently depending on the macros, why not define the low-level
> helpers to match the kernel arguments like
> 
> static inline __attribute__((unused))
> __kernel_loff_t sys_lseek(int fd, __kernel_loff_t offset, int whence)
> {
> #ifdef __NR__llseek
> 	__kernel_loff_t result;
> 	return my_syscall5(__NR__llseek, fd, offset >> 32, offset, &result,  whence) ?: result;
> #else
>         
> #endif
> }
> 
> static inline __attribute__((unused))
> __kernel_off_t sys_lseek(int fd, __kernel_off_t offset, int whence)
> {
> #ifdef __NR_lseek
> 	return my_syscall3(__NR_lseek, fd, offset, whence);
> #else
>         return -ENOSYS;
> #endif
> }
> 
> And then do the selection inside of the actual lseek,
> something like
> 
> static __attribute__((unused))
> off_t lseek(int fd, off_t offset, int whence)
> {
>         off_t ret = -ENOSYS;
> 
>         if (BITS_PER_LONG == 32)
>                ret = sys_llseek(fd, offset, whence);
> 
>         if (ret == -ENOSYS)
>                ret = sys_lseek(fd, offset, whence);
> 
>         if (ret < 0) {
>                 SET_ERRNO(-ret);
>                 ret = -1;
>         }
>         return ret;
>        
> }

Yes, It is clearer, thanks. will learn carefully about the kernel types.

> 
> For the loff_t selection, there is no real need to handle the
> fallback, so this could just be an if()/else to select 32-bit
> or 64-bit, but for the time_t ones the fallback is required
> for pre-5.6 kernels.
>

Ok, will test it on the pre-5.6 versions too.

Hi, Willy, what's your suggestion about the oldest kernel versions we plan to support? ;-)

Best regards,
Zhangjin

>        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
