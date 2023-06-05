Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ABFC7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKt4fvdA6Db6sNMYNG8GlXa7yd/qhqbDLs8HXtlma68=; b=tv0Cpiz95eE+TT
	XCsDZmcAkn1jODMDQKnNR6MD+SSLbI7yYhr9tZfiMeSGsbC5K4evPsnON2S31Mwxrb/BjGc1IPa78
	Oe5TnY4PlsVAE+6BvCitFyuNOMXT3jlwnBJlDnecFLO33HGXlxkgtFEVkLXEnQoG6eZQGWocE23OW
	Uk54FakL1vkF7OIBLrMN53RFz+SHwzfgcbGuyvtrkgnkZ8BFg//TVEWtOsJN+5g5+7e+Hs5/EPMrp
	d4Z//v6EbdUzXgXBgVciNrL0ithFb63/CjfrkZ5VLCIyF7njBpl+H+gxQ+9opmSdoCClgCb0SuC7d
	seJsuj44q7Ex1EErM9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63ZT-00EK4A-0T;
	Mon, 05 Jun 2023 06:20:03 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63ZN-00EK2b-1G
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 06:20:01 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3556Jors005856;
	Mon, 5 Jun 2023 08:19:50 +0200
Date: Mon, 5 Jun 2023 08:19:50 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] tools/nolibc: unistd.h: add __syscall() and
 __syscall_ret() helpers
Message-ID: <ZH1+hkhiA2+ItSvX@1wt.eu>
References: <ea4e7442-7223-4211-ba29-70821e907888@t-8ch.de>
 <20230605055857.135286-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605055857.135286-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_231959_730053_847E468C 
X-CRM114-Status: GOOD (  29.97  )
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

On Mon, Jun 05, 2023 at 01:58:57PM +0800, Zhangjin Wu wrote:
> > What about something like this:
> > 
> > static inline long __ret_as_errno(long ret) /* or some other name */
> > {
> > 	if (ret < 0) {
> > 		SET_ERRNO(-ret);
> > 		ret = -1;
> > 	}
> > 	return ret;
> > }
> > 
> > This avoids another macro by using a normal function.
> >
> 
> It is reasonable, like it very much.
> 
> > Syscall return values should always fit into long, at least
> > extra polating from syscall(2) and the fact that they are returned in
> > registers.
> 
> Yes, I did use 'long' instead of 'int' for unistd.h locally, but since tried to
> let it work with 'void *' before (e.g. sys_brk, an older version support pass
> the errno value), so, the typeof() is used and the same to unistd.h, but at
> last, none of (void *) return type is really used in current patchset, so, we
> are able to use this normal function version without the checking of the type.
> 
> > 
> > It would be a bit more verbose:
> > 
> > int chdir(const char *path)
> > {
> > 	return __ret_as_errno(sys_chdir(path));
> > }
> >
> > But it's clear what's going on and also just one line.
> 
> Thanks Thomas, It looks good and I do like the 'embedded' calling of
> sys_chrdir(path), but __syscall() looks cleaner and shorter too, let's put them
> together:
> 
> int chdir(const char *path)
> {
> 	return __ret_as_errno(sys_chdir(path));
> }
> 
> int chdir(const char *path)
> {
> 	return __syscall(chdir, path);
> }
> 
> And even with:
> 
> int chdir(const char *path)
> {
> 	return __sysret(sys_chdir(path));
> }
> 
> __syscall() works likes syscall(), and the definition is similar to syscall(),
> but uses the syscall name instead of syscall number, If reserve __syscall(),
> the inline function would be renamed back to __syscall_ret() or something like
> the shorter __sysret(), to align with our new __syscall(). 
> 
> for sys.h:
> 
>     /* Syscall return helper, set errno as ret when ret < 0 */
>     static inline long __sysret(long ret)
>     {
>     	if (ret < 0) {
>     		SET_ERRNO(-ret);
>     		ret = -1;
>     	}
>     	return ret;
>     }
> 
>     /* Syscall call helper, use syscall name instead of syscall number */
>     #define __syscall(name, ...) __sysret(sys_##name(__VA_ARGS__))
> 
> for unistd.h:
> 
>     #define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
> 
> What about this version?
> 
> The potential 'issue' may be mixing the use of __syscall(), _syscall() and
> syscall(), but the compilers may help to fix up this for us, I don't think it
> is a bottleneck.

I think that could work. However, please place __attribute__((always_inline))
on these inline functions, as we don't want to turn them to function calls
even at -O0.

I'm traveling today, I'll let you and Thomas debate and decide how you'd
like this to evolve.

Also, please note that Paul is OK with merging for 6.5, but we should
absolutely limit last-minute changes to the strict minimum we're able
to test now.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
