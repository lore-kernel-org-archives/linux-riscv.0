Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E0C46CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 03:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9irDKXR7FhUSvj0Px7oRGH4aLx10AiA9Tm7x2/4pOqk=; b=OoCYhosVs0DTEw
	pEFNzB+rru9ayMEtBa2aeEbq7DVdtBZCNHYejEuL+wASbpB0jMcsRqEoL62YBAMZzV8kGBNxTrPFM
	CJgPRlQkzivbfsHWy0h9+t+qYxwdgi98aZZAIbOelhNvlNDLEP3LnRW67Uk3zu9uDATcsIT5hdknD
	HvHmiE168YwB4h5Ply7rAgchfSoWEGsIuiAsL4BqAD2xMOU+LfTgP1aVnQyegsCVkseypFnDYawSa
	/JHiPDrJBIVQlNUEpGZmk6ydxKJhADdTdHjJ+i4FaH9s9YNjgLZ6WFvttZ/d5OvpyrlQhAv7Pjnap
	9folsHl1EFtBlgAJ7Euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhi8N-00D2vJ-22;
	Sun, 17 Sep 2023 03:07:43 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhi8J-00D2uz-2P
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 03:07:41 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38H37Xt0009951;
	Sun, 17 Sep 2023 05:07:33 +0200
Date: Sun, 17 Sep 2023 05:07:33 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] tools/nolibc: automatically detect necessity to use
 pselect6
Message-ID: <20230917030733.GG9646@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-4-e50df410da11@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-nolibc-syscall-nr-v1-4-e50df410da11@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_200740_689764_BD4864F9 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, Sep 14, 2023 at 06:01:20PM +0200, Thomas Wei=DFschuh wrote:
> We can automatically detect if pselect6 is needed or not from the kernel
> headers. This removes the need to manually specify it.
> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

That's indeed cleaner, I can't find the reason why we didn't do it
like this initially, I suspect that maybe we were having __NR_select
defined but not usable, I don't know. I've found it first introduced with
nolibc commit 28a7178 ("nolibc: fall back to pselect6() on aarch64"), and
the test was made before __NR_newselect, so maybe I wanted to be sure not
to use pselect6() in case another arch would define it.

Let's do as you propose, it's much cleaner and simpler. If we ever find
any breakage at least we'll know how to deal with it so I'm not worried.

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
