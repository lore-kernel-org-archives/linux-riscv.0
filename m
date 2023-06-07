Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7592C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HAA898VbIfAGRk3/tHdX7EgRKsEu7zFK7p1Siw8qtw=; b=2CSjzCdJQHJQNi
	gb+zR9JLpcYnSYMOL0GT4ScTIffqJWRd7zV907Umllgc4wy2Kir5dgrmceW+22elzQh+UccSv8e6n
	rHPkqM1yYEYic/Aoowedjg4H2bHMaTrrNxq3c4OklaK6yQrGktCJc/aYfil24tzyui9Schzeg0ZKU
	IcRSG9Y8CgILK3r0QGjrCxcmUo6ck2C2nLsAwgxeVsDdN3rt3ySZN3/WvKFiaUqr0mXCXA7JgzGr6
	Md/dgiCzNlooxtYO14JWEz/1MdqwHbiw3CVKX35jj0mRnDDTCHLHpqUAfmK5mxm+Pgs4r7djFI9Aa
	NecYVYJhS9GWjkRS2GxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pkW-005KFK-1m;
	Wed, 07 Jun 2023 09:46:40 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pkS-005KDn-32
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 09:46:39 +0000
X-QQ-mid: bizesmtp86t1686131182tizfen7e
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 17:46:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: I8hG9CuxGDJk1fb1IN/SHwwA7W3iabws+Ljo1O5lGLOabbtj4wHDtc/pIMsVD
	K/5K4WpXf8Bjmy/z1AokS/VELvcZm8oZdJ0D7hKtcx4ZbZd1k3hSFXS/KGoHmc+6CiIl92n
	yFR9amAcb4g777EfAWm7DFivWENOYmuR6NDo/JIs+3HKMNvvChe1p3uZxFLqqK+t7x26bAh
	QLHHPc8qwVdqxF7lGiqzZIEXqULfWrh5GYLklTHOg0Gfc4+PhLLGe3GQ0VKOYaD2SB+dRdb
	FOxv/JUNmGfJAeWr7pTQPT2fwYuFJuEcwHRLU14vCNLXUT7yIhkDwcmlokgb/WVbGwOFliK
	zfwhB+ri1vhbd07NfeieOivOuZ4i3rwBu5xBryvtuieuotZ6K41wH8CFCtS4D0JM0XMgSES
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11605753545439782903
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
Date: Wed,  7 Jun 2023 17:46:15 +0800
Message-Id: <20230607094615.792013-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b80f021a-30b7-47e9-8455-3844be157cc2@app.fastmail.com>
References: <b80f021a-30b7-47e9-8455-3844be157cc2@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_024637_295474_99665CAF 
X-CRM114-Status: GOOD (  28.24  )
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

> On Wed, Jun 7, 2023, at 07:19, Zhangjin Wu wrote:
> >> On Sat, Jun 3, 2023, at 11:01, Zhangjin Wu wrote:
> >
> > Yeah, agreed, we can clean up them one by one, If split them to their own
> > syscalls, I have two questions (for Arnd, and Willy too):
> >
> > 1. do we need to add the corresponding library routines at the same time?
> >
> >   Use llseek() as an example, there will be llseek() and lsee64(). If off_t
> >   would be converted to 64bit, then, they can be simply added as follows:
> >
> >     #define lseek64 lseek
> >     #define llseek lseek
> >
> >   Or something like this:
> >
> >     static __attribute__((unused))
> >     loff_t lseek(int fd, loff_t offset, int whence)
> >     {
> >     	return lseek(fd, offset, whence);
> >     }
> >
> >     static __attribute__((unused))
> >     off64_t lseek(int fd, off64_t offset, int whence)
> >     {
> >     	return lseek(fd, offset, whence);
> >     }
> >
> >   This one aligns with the other already added library routines.
> >
> >   Which one do you like more?
> 
> lseek() is probably not a good example, as the llseek and lseek64
> library functions are both nonstandard, and I'd suggest leaving them
> out of nolibc altogether.
>

Ok, agree, as the 64bit version of lseek may be enough for nolibc, if a target
application really require, they can add the alias themselves.

> Are there any examples of functions where we actually want mulitple
> versions?
>

For example, the following ones are related to the syscalls being added,
all of them have similar library routines in current sys.h:

* waitid, https://linux.die.net/man/2/waitid
* ppoll, https://linux.die.net/man/2/ppoll
* pselect, https://linux.die.net/man/2/pselect6
* clock_gettime, https://linux.die.net/man/2/clock_gettime

The similar routines are put in right side:

* waitid --> waitpid, wait, wait4
* ppoll --> poll
* pselect --> select
* clock_gettime --> gettimeofday

For the clock_gettime, it may also let us think about if we need to add
its friends (clock_getres, clock_settime) together.

> > 2. If so, how to cope with the new types when add the library routines?
> >
> >   Still use the above llseek() as an example, If not use '#define' method,
> >   We may need to declare loff_t and off64_t in std.h too:
> >
> >     #define off64_t off_t
> >     #define loff_t off_t
> >
> >   Or align with the other new types, use 'typedef' instead of '#define'.
> 
> If we do want to include the explicit off64_t interfaces from glibc,
> I'd suggest doing it the same way as musl:
> https://git.musl-libc.org/cgit/musl/tree/include/unistd.h#n201
>

Thanks.

> >
> >> This patch is a step in that direction though, so I think that's
> >> totally fine.
> >
> > Thanks, so, can I pick your Reviewed-by for the first two patches? I'm ready to
> > send v4 now ;-)
> 
> Yes, please do.
>

Thanks very much, just added the Reviewed-by lines in v4 and have
already sent v4 out, welcome your review on the revision of the 3rd one,
it is almost consistent with the original Makefile now.

Best regards,
Zhangjin

>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
