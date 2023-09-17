Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE45EC46CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 02:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLEY4WMloDkQIg4jeeNn96LjXtAqJtTwXaU43REetbk=; b=pzhaCqHZKRPLEI
	mx9Q5s1xytnH2j9MIAuR92GYJnqftcFXdj3TRmtSFBEBCG+a5HL9H6nr3oHvc2qUY6YTM9DwvM58W
	01Tg7q0pAZLG5WCkB62ugr7hbDdyl0CjZDIbPKefRnhZlQEliRBi2rnUuRZpzwFUWKw7V2azrZQwN
	JS+ogN94X+qsbdhNQr1nmCfvHOrl1ERa3L0Cl66Bh+CJde5A9XpXAT/kDjqzphvIzW7rN6+wdDpVi
	/3iMCILryihl1Yxtthy1QM5lMWGpEpa58qfQPAapWaFZEUli+iQ5Lq3NiFWnNaRfdYxdmLQb0Y2L1
	Isj7jR1x+Uqp0WUtyv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhi02-00D2M9-0R;
	Sun, 17 Sep 2023 02:59:06 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhhzz-00D2Ln-1T
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 02:59:05 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38H2wpBv009880;
	Sun, 17 Sep 2023 04:58:51 +0200
Date: Sun, 17 Sep 2023 04:58:51 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <20230917025851.GE9646@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_195903_969801_7018A22D 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 14, 2023 at 06:01:18PM +0200, Thomas Wei=DFschuh wrote:
> The ENOSYS fallback code does not use its functions parameters.
> This can lead to compiler warnings about unused parameters.
> =

> Explicitly avoid these warnings.

Just out of curiosity, did you find a valid case for enabling this
warning or were you trying various combinations ? I'm asking because
I've never seen it enabled anywhere given that it's probably the most =

useless and unusable warning: as soon as you're dealing with function
pointers, you start to have multiple functions with a similar
prototype, some of which just don't need certain arguments, and the
only way to shut the warning is to significantly uglify the code.

If really needed, I'm wondering if instead we shouldn't have an
"no_syscall*" set of macros, that would have the same signature
as my_syscall* to just consume all args in the same order and
return -ENOSYS. E.g, consider the following:

  @@ -934,6 +960,11 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds,=
 fd_set *efds, struct timeva
   #endif
   	return my_syscall5(__NR__newselect, nfds, rfds, wfds, efds, timeout);
   #else
  +	(void)nfds;
  +	(void)rfds;
  +	(void)wfds;
  +	(void)efds;
  +	(void)timeout;
   	return -ENOSYS;
   #endif

It would become:

  @@ -934,6 +960,11 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds,=
 fd_set *efds, struct timeva
   #endif
   	return my_syscall5(__NR__newselect, nfds, rfds, wfds, efds, timeout);
   #else
  +	return no_syscall5(nfds, rfds, wfds, efds, timeout);
  -	return -ENOSYS;
   #endif

What do you think ?

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
