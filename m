Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65201C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y51mzK75xpECNi6zWxnFEVWNghyVLKWxe2pZ6a68Ygg=; b=osGAEIgJS8JOny
	bRRUhd0vS9ETp/zMs5oK/KTBizdP2ZS37Q4iuZ3QX2p9VJW0k5T5PmObB6mJJ4Ci3P2uaX3skhvPy
	3GeIcd6XHKgb7ATYxCOtujA5rutcwhzV/hacdrJiyGlaC3RVTVlk/mkB6N3lSqODKvc922Lu99bB4
	7kJ6eDOI2dA87LSVdHXBdqW9fApB6EK/i1z9aeI8x1hvUiRJDEAktDeh53GfxPiq+oGXnIgGqACHi
	3jJDlq6HKbO0WdcwwJHy9soQ91RuOOylF6MmY33hSGBXq9ArFYyCilwO6DmtOHy6HOJu5f0kguymp
	i6kzjtBeA77cklx+0f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tBu-00666F-1y;
	Wed, 07 Jun 2023 13:27:10 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tBq-00664S-1w
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 13:27:08 +0000
X-QQ-mid: bizesmtp79t1686144406t8q8sh1i
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 21:26:44 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: gSGF8h2+s1IeuyvNvsjPqo51c92Oei+VMiWk3neliuJycIgEbNKvZYuLZeUAz
	lFnZwQGxKatqDuzMJQohZXLRw7ojULNOb0uySR+PI0K0wz6TMCdQK5KMg3dv/ZBa7cf690j
	F3aLIkjJfE3lX4ajZr1YhoqbesoV5tm1xPa4dgHqPRx4tnlNdb6/oenJsj48MaPH/aQufsD
	Sp37ssx34gS5ZLeJOCeKoo5c5NvhJHhx8r8CLz/vloLE2w420Q6cPe+pfk1Nc0dUfNqTu1N
	bTMFDwxFV3/+1jfMLT8XM9JJBvPv1sXabROdq0SdWbp1kI1zQZpLo2ym5FGUTuy7u2kcCrp
	vmlng70HKM3MPHoViSeRec/NWnaWjkBVaCo2c1qQ8V6lsgomCqO0G6+7IgnbvNrTd1PJFeS
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11098037038039291754
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
Date: Wed,  7 Jun 2023 21:26:44 +0800
Message-Id: <20230607132644.824792-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <635d1aaf-3982-4404-9c05-05e51800691e@app.fastmail.com>
References: <635d1aaf-3982-4404-9c05-05e51800691e@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_062706_974516_F46BBFF6 
X-CRM114-Status: GOOD (  29.83  )
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

> On Wed, Jun 7, 2023, at 11:46, Zhangjin Wu wrote:
> >> On Wed, Jun 7, 2023, at 07:19, Zhangjin Wu wrote:
> >
> > Ok, agree, as the 64bit version of lseek may be enough for nolibc, if a target
> > application really require, they can add the alias themselves.
> >
> >> Are there any examples of functions where we actually want mulitple
> >> versions?
> >>
> >
> > For example, the following ones are related to the syscalls being added,
> > all of them have similar library routines in current sys.h:
> >
> > * waitid, https://linux.die.net/man/2/waitid
> > * ppoll, https://linux.die.net/man/2/ppoll
> > * pselect, https://linux.die.net/man/2/pselect6
> > * clock_gettime, https://linux.die.net/man/2/clock_gettime
> >
> > The similar routines are put in right side:
> >
> > * waitid --> waitpid, wait, wait4
> > * ppoll --> poll
> > * pselect --> select
> > * clock_gettime --> gettimeofday
> 
> Ok, I think these are all useful to have in both versions.
> 
> All four of these examples are old enough that I think it's
> sufficient just expose them to userspace as the bare system
> calls, and have the older library calls be implemented using
> them without a fallback to the native syscalls of the same
> name on architectures that have both, newer architectures
> would only have the latest version anyway.
>

Ok, Thanks, I have already added parts of them, will send waitid and
64bit lseek at first.

> > For the clock_gettime, it may also let us think about if we need to add
> > its friends (clock_getres, clock_settime) together.
> 
> Yes, I think that makes sense. We also need clock_settime()
> to implement settimeofday() on rv32.
>

Ok.

> Ideally, I'd love to extend the tooling around system calls
> in the kernel so we can automatically generate the low-level
> wrapper functions from syscall.tbl,

That's cool.

BTW, I did something on dead syscall elimination [1] (DSE, RFC
patchset), a v1 has been prepared locally, but not sent out yet.

It also requires to work with the syscall.tbl or the generic
include/uapi/asm-generic/unistd.h, welcome your feedback on the RFC
patchset [1] and you should be the right reviewer of the coming v1 ;-)

The left issue of RFC version is finding a way to not KEEP the exception
entries (in ld script) added by get_user/put_user() if the corresponding
syscalls are not really used, such KEEPs of exception entries reverts
the ownership from "syscalls -> get_user/put_user" to "get_user/put_user
-> syscalls" and blocks the gc'ing of the sections of such syscalls.

In the coming v1, I used a script trick to drop the wrongly KEPT
exception entries to allow drop all of the unused syscalls at last. Will
clean up them asap. But it is a little slow and looks ugly, it is only
for a further demo of the possibility.

In v2 of DSE, I'm wondering whether it is possible to drop all of the
manually added KEEP operations from ld scripts and use some conditional
attributes (for the sections added by get_user/put_user) to build the
'used' references from "syscalls" to "sections created by
get_user/put_user", this may need support from gcc and ld, welcome your
suggestions too, thanks.

And that RFC patchset added a patch to record the used 'syscalls' in
nolibc automatically ;-)

[1]: https://lore.kernel.org/linux-riscv/cover.1676594211.git.falcon@tinylab.org/
[2]: https://reviews.llvm.org/D96838

> but this needs a lot of
> other work that you should not need to depend on for what
> you are doing right now.

Ok, welcome to share any progress.

Thanks,
Zhangjin

> 
>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
