Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42760C2BA1B
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrrVY0CvEs9s57Z9n6kPtlWbMMhH3Kj2rrxkcjVRbLs=; b=4Gkm2djCZn9lgn
	tFrWza3BQ3LVE6Bp6g+ZKHWRCoZ1VvPNIBncYHkCDaqW5lReIAQe/z+jeKUUzjE/4PC2TzooUcD5j
	8L3fOWeExfQJL0ho+igvx1f7ioiPDSDNOC9VyHT4pvQKZvyO54gN1PRyoiM4P1NxUovYqqn2HJpPv
	b8R4p8iHV6j09O/iFPq6ByiBmjvgEyQA13W0arnqD7pTI7EIy/bGdBS0Xs5WK2tH1n3nIXFlbHFsL
	84aFWJ179xT5PmCf9+v/CCi7ZifOqPoIjMpQ2fUGK88qQgt3PZv1Yyos0kzL6EfzKQqg9dVfsXH24
	mVz518cupbEOz16td9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhi0u-00D2QT-09;
	Sun, 17 Sep 2023 03:00:00 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhi0r-00D2Q7-0Z
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 02:59:58 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38H2xjpm009886;
	Sun, 17 Sep 2023 04:59:45 +0200
Date: Sun, 17 Sep 2023 04:59:45 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: don't define new syscall number
Message-ID: <20230917025945.GF9646@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-3-e50df410da11@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-nolibc-syscall-nr-v1-3-e50df410da11@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_195957_508674_67F211D8 
X-CRM114-Status: UNSURE (   7.56  )
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

On Thu, Sep 14, 2023 at 06:01:19PM +0200, Thomas Wei=DFschuh wrote:
> All symbols created by nolibc are also visible to user code.
> Syscall constants are expected to come from the kernel headers and
> should not be made up by nolibc.
> =

> Refactor the logic to avoid defining syscall numbers.
> Also the new code is easier to understand.
> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Yeah that's a good point!

Acked-by: Willy Tarreau <w@1wt.eu>
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
