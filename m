Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B184FEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4g82BY5VdOkaxFKp8tvPc3XgpaWsGkGJHr2doqMiSU=; b=F92ToZEghc6gpG
	3xQAcqLJN7+NNw01cS3gRkMcMiGWGyXbifqlf1GAknMtvq4eZZffbx5HOPb2GK2R8wYmbPZCRIX6k
	dRpbb6lMQgu1PH4NXwE4BRXqkcIemZfveUDy0mVo4jT0IO4lSJJxIGuzTZUKDZo+dhDNw1gjLDnR6
	7JdkXmZiXdhF5vjKEO5TPxv1e3T5ZSTfNvE2wbX8kGxiRu7VO3rgJFZT+5lDHXDDcqjYFUDnqo5nq
	bz/1qRj1K+wL4+84UjRreyeIzrsZxX69T0t201lyp1preBoe7PwTJWajR6WFee92fSSrssP9v/0kG
	Ww03Jamn4RtgbBDxEI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIQXe-008iYF-32;
	Sun, 09 Jul 2023 09:17:18 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIQXc-008iXK-0v
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 09:17:17 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 3699HAGp018537;
	Sun, 9 Jul 2023 11:17:10 +0200
Date: Sun, 9 Jul 2023 11:17:10 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v6 01/15] tools/nolibc: arch-*.h: fix up code indent
 errors
Message-ID: <20230709091710.GE9321@1wt.eu>
References: <cover.1688739492.git.falcon@tinylab.org>
 <469d9d15a506a58dca5f8ecdcb83c660ee0485c9.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <469d9d15a506a58dca5f8ecdcb83c660ee0485c9.1688739492.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_021716_619276_87253DEF 
X-CRM114-Status: UNSURE (   7.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 07, 2023 at 10:50:34PM +0800, Zhangjin Wu wrote:
> More than 8 whitespaces of the code indent are replaced with "tab +
> whitespaces" to fix up such errors reported by scripts/checkpatch.pl:
> 
>     ERROR: code indent should use tabs where possible
>     #64: FILE: tools/include/nolibc/arch-mips.h:64:
>     +^I                                                                      \$
> 
>     ERROR: code indent should use tabs where possible
>     #72: FILE: tools/include/nolibc/arch-mips.h:72:
>     +^I          "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \$

Another option we could have had would have been to just delete these
lines since there were in fact empty lines containing only an aligned
backslash. But that's fine, I've queued it as-is, thanks!

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
