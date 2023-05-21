Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C735C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwGJ2kp2zTdsdp0sTbgr2YDEjg1sVbYqEg5cPaQyXEQ=; b=u7NaJ+DuQKk5P3
	xd4w9f4/ZXr/Ee2FNBNUNdi72/e18e4tn1mFdgMB3fxNpKo0Q+XKazvnIYg9ga910TmOsfRTJeFfg
	gYRA3DuaYzl2kOaIU0CwP02r7QzyUrV4n9F8twvFryuCDMfZg9PZg/whQhOf3TIk52Jk1rTGA064Z
	g//CD2/4P+srA3+TbEcu7wQVmZjQkWEgYbPLOnP/ITHWhnXneMj637XAzczV0jxBtw1XNrK5wOFcG
	7jusawyBoaipxGFJRqQLnVnCpyEV7HH+QRBhqagFnBRA0BAK5OYEKj3Yxo/CLd3ukVJuMiJ6L3jmW
	eoXsW1Up7dOF+bTMF6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fzQ-003Yac-1o;
	Sun, 21 May 2023 10:08:36 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fzM-003YZT-15
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 10:08:34 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34LA8IGS029413;
	Sun, 21 May 2023 12:08:18 +0200
Date: Sun, 21 May 2023 12:08:18 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/7] tools/nolibc: autodetect stackprotector availability
 from compiler
Message-ID: <20230521100818.GA29408@1wt.eu>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_030833_319726_EA25A5BB 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi Thomas,

On Sun, May 21, 2023 at 11:36:28AM +0200, Thomas Wei=DFschuh wrote:
> As suggested by Willy it is possible to detect the availability of
> stackprotector via preprocessor defines.
> Make use of that to simplify the code and interface of nolibc.

I have just had a quick glance over it and not tested it yet, but
overall I really like it, thank you! I'll try to give you some
feedback today (or simply merge it).

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
