Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CAFC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tV+7ZG3KEUSZeAULJLyi+Hd8fzr0VtozV7el/P7IA/Y=; b=bwBxRfJAmDD61i
	ADWEwYD6zxmpZC2vm+5DGSWK3O/o8v+n8EAjzhdObHtnEX1zQzlYDvMdMOqdLgOmGWD9vZkazffx6
	cBejpOzs+4h5vF8QDc4QxrYGHYCKbeiKDfIPE7NAtFf1SHrWGOBk+QPL5g7zmdscSBi0yp4jc/S3n
	gr+cYm19hTzLL6YZm1RLg45CwU8ks8NBfWX16rkBMPbKi0YWEyTdWQEoWlWgKP4oCotbLJYEW3Ed+
	EJMe+yDTfmHR/OzwH0Jvw1XAJXaNz4xg8Uu6A5FPXt0bTh4zLEXn0hXEraMq7KMNpKT8Y8sFAmPRC
	xigWy4dvIlBOLl1M0Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGZU-00A50Q-0h;
	Mon, 03 Jul 2023 10:14:16 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGZQ-00A4wl-1I
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:14:14 +0000
X-QQ-mid: bizesmtp62t1688379232tkl6910g
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 18:13:51 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: +ynUkgUhZJmRgMk64lNbZvav6NA7MhEGUtOANAStIGSLiFHATIZ01J/qbTMxh
	LmahML3fuiEGq78NrYI0qrWi3uraDQj5ug3lHYzbbD+UkEaXq4Z6jAdLvi4oFizHTmcsYqI
	/CeFtQP9xAEC+AqN0RjhrLvlnyQIFvB9VQ9QYMH2kAKIzyP0cfpCGMYqrbhXz9IULKrXSRb
	y4ql2CbfJm05AoLvNgwLPLAhLtB2hl7u0BoytYsfTgQp3BcJIAh8PBaRBhp3+pIyPgEoBSK
	AeyQ4J2yP3bRHATN7W+Vj95Q9nKpsshpSMoBjJvO5iu4p+0QAUXTYgDLwlJoBuaBRlW01JW
	J+Gq4DqT40KnfFje70Jfh6W6kANcVjTRLyEWRet+y61442zeerDCNanTNmbHZmrIEjK+1mJ
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13818321821494681635
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v5 09/14] tools/nolibc: add missing my_syscall6() for mips
Date: Mon,  3 Jul 2023 18:13:50 +0800
Message-Id: <20230703101350.493374-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230702185549.GH16233@1wt.eu>
References: <20230702185549.GH16233@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_031412_759945_593E87D0 
X-CRM114-Status: GOOD (  14.26  )
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

Hi, Willy

> Hi Zhangjin,
> 
> On Wed, Jun 28, 2023 at 09:37:29PM +0800, Zhangjin Wu wrote:
> > It is able to pass the 6th argument like the 5th argument via the stack
> > for mips, let's add a new my_syscall6() now, see [1] for details:
> > 
> >   The mips/o32 system call convention passes arguments 5 through 8 on
> >   the user stack.
> > 
> > Both mmap() and pselect6() require my_syscall6().
> 
> Very interesting, I didn't manage to make it work previously. Did you
> test it to confirm that it works ? I guess so but since you didn't
> mention, I preferred to ask.
>

Yes, I'm curious too ;-) 

we did add the mmap test cases and run it for mips, as Thomas
suggested, we pass a none-zero pa_offset to mmap() to make sure the 6th
argument is used.

I just re-tested it for mips and printed something like this:

    44 mmap_bad = <0xffffffff> EINVAL                                [OK]
    45 munmap_bad = -1 EINVAL                                        [OK]
    46 mmap_munmap_good
    pa_offset: 8192
    length: 1
    file_size: 12287
     = 0                                          [OK]
    47 open_tty = 3                                                  [OK]
    48 open_blah = -1 ENOENT                                         [OK]

And I also checked the mips support of musl, it evan provide a
__syscall7, so, it should be ok ;-)

The only difference is, musl provide a different clobber list for
'__mips_isa_rev >= 6', I didn't look into the details yet:
https://elixir.bootlin.com/musl/latest/source/arch/mips/syscall_arch.h

Best regards,
Zhangjin

> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
