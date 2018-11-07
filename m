Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B0CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4508C20827
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/gcWnJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tf63N5w6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4508C20827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4ELpyXnchGI/Us4FTtpk4hw3JH/bngcFkNTPN2U9/w=; b=h/gcWnJ+s2NZIE
	UuHCNsBASrfphIq+6KvKBLLk8Qo8MLH6m4rGHLpOd1kjZPGQk/eussy6lGqMJm1ULKuW6HXbgeuvX
	7ZFnK9eYK1XWw9pFurHmIhNnqYkklst/8hC3vLiIMpnNWfeX4wSxAXz4TcVqj7eNbleyL2s9e+hb6
	HydGTqVNSJLFYTKrfF/Qo3TaCQLmBx6biGEOHG9O52MayThGDV9BnzpDvbc8LEOMQSyb9Uv2wjW5c
	sTzMPK6/yqJIE2s0JEnT0HaKTwJjt8GB7f4eSomiSxqap/6wOHQvbU0zWLcRl9Bfo7GJTXxuZmQyg
	JDCGUXMHTXS0LhtI5awQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKSb2-0001JP-Ea; Wed, 07 Nov 2018 18:30:32 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSaz-0001J5-LA
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 18:30:31 +0000
Received: by mail-ot1-x342.google.com with SMTP id g27so15677434oth.6
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qir1mi0hHMJAP7Lw3MalCFm49tn0u4t4BKJWHobqbRU=;
 b=tf63N5w6VuBPxQ5zlL67xSUas37DgpssM1ymwWH8FHvyqVEyDKUi07Bl/GuhLFwUgg
 GVUpy8VcxftGvoxCFgW79pwkbwNDdeAiVqnaaXrwjHCOksE2K86wrnJX5D3Ho3ltSDmC
 4/HMLfwUBlYzWBbdYcWV4yxcYny40OA9FQjJHK5SBFoWI9EjM8Li/Hjt+2tY1uqaLtZE
 29SGGSWyk1INmti7hgzlczMdLs7oOFsLUWKr48fFSIsE8eb5k8H14CEQAmjXJLPc9rJC
 gPzGZ+sD1ZwLz9o/3kzIHZSyXXuwID0jCt0pGLprucdiJKuQz+2g7cHulGjKtYSflwOt
 Tqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qir1mi0hHMJAP7Lw3MalCFm49tn0u4t4BKJWHobqbRU=;
 b=APHaz01mYTAXNj1EC9feN7P2aUWzblzX/gCd1P5y6/e0e520NBO9yX9IcQCC3YmAHa
 zr/HI5MpVlWLtTTUzIzVTsfsTqlSLWkFZWVy1kA2gfJABS893vIn5pd35v2yqd2Dg9am
 HDvCm0EPmWwFbKkFuIxVhJAePltrSLq/4GCHB3G2dMWhh8CKB/aIFTSZ/x2XQ91yHLDB
 +Xgo3uJH8XbXRMnPGKISY3HgUc+0uF3Pn8nZfnvhUJmmcae9AaZosHAHS9NaXQn/ho8e
 D3Lv7AwpNueiMLDwnqrwqBBTZ+IGC0BLyuFqqj72g0NK9EIA1cf7eCr3tcZX02gw5hSv
 CvAA==
X-Gm-Message-State: AGRZ1gK6qmj5LMCSfPpkYvVdfOcIAIIiWU5lbJJo5jWvT2a2QJyoiog7
 OzyW0aj/C4UnNp2g8+y7te5qgmngmXkNpsLfD3SWkzoQryg=
X-Google-Smtp-Source: AJdET5eyLcDef4rT5eB0yX0yy1wcNuyPIlm5Dz/87B7r7PWdjK9fjnAsG61hBTBHGfmuU3wpInEFiLAOJI/sDeDB0OU=
X-Received: by 2002:a9d:2ea9:: with SMTP id w38mr756772ota.99.1541615415219;
 Wed, 07 Nov 2018 10:30:15 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
 <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
In-Reply-To: <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 7 Nov 2018 19:30:03 +0100
Message-ID:
 <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_103029_719262_CAC92946 
X-CRM114-Status: GOOD (  25.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107183003.dQyi3Bsx9vCUNl9FOMsOlsCiwnxoO458Y2vh87jUDf8@z>

On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
> > On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> >> Marcin Juszkiewicz reported issues while generating syscall table for riscv
> >> using 4.20-rc1. The patch refactors our unistd.h files to match some other
> >> architectures.
> >>
> >> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
> >> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> >> - Adjust kernel asm/unistd.h
> >>
> >> So now asm/unistd.h UAPI header should show all syscalls for riscv.
> >>
> >> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> >> generated asm/unistd.h UAPI header thus user didn't see:
> >>
> >> - __NR_riscv_flush_icache
> >> - __NR_newfstatat
> >> - __NR_fstat
> >>
> >> which are supported by riscv kernel.
> >>
> >> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >
> > Thanks for addressing this, your patch correctly fixes riscv64, and
> > I should have noticed the mistake when I originally merged the
> > broken patch.
> >
> > However, looking closer I found another problem with the original
> > patch that your fix does not address:
> >
> > __ARCH_WANT_NEW_STAT should only be set on 64-bit
> > architectures.
> >
> > For a 32-bit architecture, we only want __ARCH_WANT_STAT64 if
> > any. For 64-bit architectures with compat mode, we still need to
> > set __ARCH_WANT_STAT64 from the non-uapi file so we get
> > the syscall implementation.
> >
> > If we don't care about the riscv32 ABI changing yet, we can
> > decide to leave out __ARCH_WANT_STAT64 here, and require
> > glibc to implement it using statx() like any new architecture.
> > stat64 is not y2038 safe, and statx replaces it because of that.
>
> Thanks for pointing this out.   A while ago we decided the rv32 ABI was
> "slushy": it can change if it has a good reason to.  Right now the only planned
> changes are the y2038 changes, which I consider this a part of.  For some
> reason I thought we'd already done this, but since we haven't then I think it
> should go in sooner rather than later -- that will help the glibc guys get
> everything lined up.
>
> The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> That's progressing well, with one last blocking issue related to some of our
> floating-point emulation routines before we can submit the port.  This should
> give us ample time to line up the ABIs correctly so everything works.
>
> So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>

Then if you agree I could do and send v2:

+#ifdef __LP64__
+#define __ARCH_WANT_NEW_STAT
+#endif /* __LP64__ */

Cannot use CONFIG_64BIT as in user space nothing defines it.
Alternatively I could
check for __riscv_xlen == 64.

I found _LP64 and __LP64__ being used in kernel, incl. include/uapi/linux/rseq.h

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
