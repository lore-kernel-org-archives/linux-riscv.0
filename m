Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B139DC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 05:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OHTKyJEoPQChAX1E/mmpiE0yXxQBj+eg4efevZxmAg=; b=FUXMKqUfe0s03/
	Ba41hUcKaIzSpNg/daGk6MECGBPZ6T3umI37ntYttoSh78DpZfozrGLThJnJof0qU1NIqz5QAvlm3
	7dgG6r3qTbReTjI38YQovjjR/wNkHL6ln0e/whZRm+vwoZQwFbw6GdXmOJNSBfa4J1XZ7yQQf4cTD
	TKLBdvxxEDw71GrKMs61lth+GKW5bwpESJqb6rhLEZ3ofu7zz+yPxkZ/3ZmsN65Khydi1VHUL0nvg
	XanTqpTM+IzwpyagVJ0Z5NJGB1hRYV7uZHL29EexQRev+nz9Skhk+fU3Ug5MqnJTx6AGgH5iAn3FQ
	dknBr1RQJ2PXmTBY1QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6laC-004PoS-0A;
	Wed, 07 Jun 2023 05:19:44 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6la7-004Pm0-0z
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 05:19:41 +0000
X-QQ-mid: bizesmtp71t1686115155t27gq16b
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 13:19:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: G46xFj+wOV9ykUVNNQSk0ai1FCe8wBOCLmMzZ7Pq9KMAMo+Ve+JiiOCA59xXL
	LB+wGdNEQ5CzSFxziqNgxV9VzBrE8HihejgKfwc/We1fHyyT2wAfikXPh26ziGGx97VgxAR
	83s5NEOIzdP0+/C0LsLXZqD2C7eJw9tWBBvEWyf5wILHUYui/R4KysjOnWWAkUrkyPZ/Ain
	/+3yOZNyyrP9hKwwUj2867Yzp2MSXS7ySdlYuMGqfzxJjNZk6lj3LtDpHpadq6mIp1P4snf
	A6h3q1T1eI1OCqfzYqaS17X89RyvzKsGlHkm3d0GjyktR60s98HEBmzD8vO+VKCUFK095h+
	VO/5+WyaSOTdsgTnCHpjrCpEsbn4EmrUgfyPFlWN4JnWE0tQxvOotFuzblVkx648JDWe2HX
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4025936494722067388
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
Date: Wed,  7 Jun 2023 13:19:14 +0800
Message-Id: <20230607051914.667047-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4fcdd08c-e6fb-40b7-9f2b-77f96e798b37@app.fastmail.com>
References: <4fcdd08c-e6fb-40b7-9f2b-77f96e798b37@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_221939_665246_9CABD7AD 
X-CRM114-Status: GOOD (  21.92  )
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

> On Sat, Jun 3, 2023, at 11:01, Zhangjin Wu wrote:
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link:
> > https://lore.kernel.org/linux-riscv/5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com/
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 856249a11890..78c86f124335 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -124,7 +124,7 @@ int sys_chmod(const char *path, mode_t mode)
> >  #elif defined(__NR_chmod)
> >  	return my_syscall2(__NR_chmod, path, mode);
> >  #else
> > -#error Neither __NR_fchmodat nor __NR_chmod defined, cannot implement
> > sys_chmod()
> > +	return -ENOSYS;
> >  #endif
> >  }
>
> I think the most logical would be to have each syscall (chmod,
> fchmodat, ...) have its own function that returns -ENOSYS if
> that is not defined, and have the logic that decides which one
> to use as a separate function.
>

Yeah, agreed, we can clean up them one by one, If split them to their own
syscalls, I have two questions (for Arnd, and Willy too):

1. do we need to add the corresponding library routines at the same time?

  Use llseek() as an example, there will be llseek() and lsee64(). If off_t
  would be converted to 64bit, then, they can be simply added as follows:

    #define lseek64 lseek
    #define llseek lseek

  Or something like this:

    static __attribute__((unused))
    loff_t lseek(int fd, loff_t offset, int whence)
    {
    	return lseek(fd, offset, whence);
    }

    static __attribute__((unused))
    off64_t lseek(int fd, off64_t offset, int whence)
    {
    	return lseek(fd, offset, whence);
    }

  This one aligns with the other already added library routines.

  Which one do you like more?

2. If so, how to cope with the new types when add the library routines?

  Still use the above llseek() as an example, If not use '#define' method,
  We may need to declare loff_t and off64_t in std.h too:

    #define off64_t off_t
    #define loff_t off_t

  Or align with the other new types, use 'typedef' instead of '#define'.

  And further, use poll() as an example, in its manpage [1], there may be some
  new types, such as 'nfds_t', but 'int' is used in tools/include/nolibc/sys.h
  currently, do we need to add nfds_t?

  The 'idtypes_t' and 'id_t' types used by waitid() [2] is similar, both
  of them can simply use the 'int' type.

The above two questions are important to the coming patches, it may determine
how I should tune the new llseek() and waitid() syscalls and their library
routines. very welcome your suggestions.

> This patch is a step in that direction though, so I think that's
> totally fine.

Thanks, so, can I pick your Reviewed-by for the first two patches? I'm ready to
send v4 now ;-)

Best regards,
Zhangjin

---
[1]: https://linux.die.net/man/2/poll
[2]: https://linux.die.net/man/2/waitid

>
>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
