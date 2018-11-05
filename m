Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2344FC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E657120827
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SFf3fZd7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YayVZZsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E657120827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USVcvANE5SVd4cS0PpPWLMfy228Wn7DEGmI5vmdzcn0=; b=SFf3fZd7eGmoiF
	jTEM1Qp84gQ7F/LQVL6h0lGhUyYEqzBtGNu/66Imn2HuBcm4DQws3T6wVx1A0kcP2sxTwev+xiSTH
	4q2siZSnY1QEYMmagZ53viVspZ9FpItIHL/bwXHC8vYANKRuR0N/gaifOx3PPYEOMEtbl3PYYO3d+
	xF9D6+dkOzbxNieUbFFGjqppteSdWx6lzG/596G/hdg9Qf7vTWRNJF3d8wA9qaH7dS1HenP8bbK4x
	Ojd4hNDrZKNPLhluWiDKSFxnNxlvAGF/y+G5mZwxkH+HB3DP0Bl8ZQNeDKhRBw9/nPpwaaH9iVS0g
	rYsOw+p0yZ8HYYT3f7kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJlvC-0003gP-EB; Mon, 05 Nov 2018 20:56:30 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJlv9-0003ff-6Z
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 20:56:28 +0000
Received: by mail-qt1-x844.google.com with SMTP id g10-v6so232690qtq.6
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 12:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8d4NEiGrNkVi8cUcqMimSdQ7N/AwNLqD624fNDd2IK0=;
 b=YayVZZsLIF4xtmlVvlHtSytY4oOLL5cMFW668Wq0oDBxkcJOrDKGnIctr8zXyX9j8s
 009wbHuD2WxfzUHXibkSdOt5abd6Fc0O1kkCgq2bbEH/qtW6VjvL/G0B19/15mhV8Lcu
 sRQekWv7+avY/Xpz7Q2G2/Pe9ur74hGM83BXhczI+mUroVNltasJDnSwcHL5kX8XOq1/
 qWwOcZ3ZagwkaKtc3IDtkUVEvGcuzGkpBNl+EeH71ryD2d1nYNf5ymLiAqEhnIf5KKmz
 6c6vAH7G6No21KPowmdE7u7U9nuFzx6Qi2T8T1jy9Phoc/2uXKMxdRyvt28oVf2sXPIb
 S/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8d4NEiGrNkVi8cUcqMimSdQ7N/AwNLqD624fNDd2IK0=;
 b=K46o9+E4BtQBdbBL8QAgwkfNIq9SokUNBfXi5WI6K2k8Ds0w9AlMf7wu2aAMELP6Jv
 2N5tECTp833HcJqn/wbm6QOymSu/OgKAs72vWG6iwoce33GxSCkNaH68KjKqROpE49S/
 6PXFg19IXs+wEclOspzXBDJwdkkiL4J/ewWY4P1rw1vpRvBHabNfhjI5btFN8Gyc6afc
 6mNcS2rK9Awekp/l8ElI+ASNts1NVGo++Gf6oaCJIF/87voy7tiymcdvgffolo+TrO4n
 bx/tz6JHqSqEY8/DP7a+/NRvKhO8z4kseBHOI+umdN4E/Pwhqhrx7cH3kmD2QSAMLNg5
 Fc4Q==
X-Gm-Message-State: AGRZ1gJEa26GjrgCsrzqWdYvQ4qN3abPhRUr8+pffBJroMFo/xvQtqMJ
 afiTGr2F9FXIGXRsUtwFzMmPZWLQsN4DwekuKRg=
X-Google-Smtp-Source: AJdET5fJ0Mz29/8KinlPNPpCOqxGWwbqgBLp0Ws4W2FQbrfpS6yPh62k5qoBzb30e3nduZxSdOjS/GoO0Dm4SZwHKx0=
X-Received: by 2002:a0c:d992:: with SMTP id y18mr23780816qvj.161.1541451375901; 
 Mon, 05 Nov 2018 12:56:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:9881:0:0:0:0:0 with HTTP;
 Mon, 5 Nov 2018 12:56:15 -0800 (PST)
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 5 Nov 2018 21:56:15 +0100
X-Google-Sender-Auth: GswIWNI4QiZGtCzUUGclOt-oTnA
Message-ID:
 <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_125627_250206_78FFD2DA 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105205615.N9D1wTrNKYnehtYoq_3dWZ1TL1JKuyZtE6YljLHGrcw@z>

On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> Marcin Juszkiewicz reported issues while generating syscall table for riscv
> using 4.20-rc1. The patch refactors our unistd.h files to match some other
> architectures.
>
> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> - Adjust kernel asm/unistd.h
>
> So now asm/unistd.h UAPI header should show all syscalls for riscv.
>
> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> generated asm/unistd.h UAPI header thus user didn't see:
>
> - __NR_riscv_flush_icache
> - __NR_newfstatat
> - __NR_fstat
>
> which are supported by riscv kernel.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Cc: Guenter Roeck <linux@roeck-us.net>

Thanks for addressing this, your patch correctly fixes riscv64, and
I should have noticed the mistake when I originally merged the
broken patch.

However, looking closer I found another problem with the original
patch that your fix does not address:

__ARCH_WANT_NEW_STAT should only be set on 64-bit
architectures.

For a 32-bit architecture, we only want __ARCH_WANT_STAT64 if
any. For 64-bit architectures with compat mode, we still need to
set __ARCH_WANT_STAT64 from the non-uapi file so we get
the syscall implementation.

If we don't care about the riscv32 ABI changing yet, we can
decide to leave out __ARCH_WANT_STAT64 here, and require
glibc to implement it using statx() like any new architecture.
stat64 is not y2038 safe, and statx replaces it because of that.

> Fixes: 67314ec7b025

That line should be formatted as

Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
