Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B213DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh4jBxiOHILCt0kZ81oSSz4eIvt9Qhonr2m55xvviD8=; b=ReIVPAZruQRE4Q
	va0pKD6HJ1dDVV2WhexijOtPLQPWjRQhQa3iPdHjzoLdy+eqF1/Cwt9XDbK3beO3+NhyH8Sm+yoAe
	WRBJ2kpejSVuev1XaigJqC7Hp47KC7v9PdBmPbwrGEqYGKfuauf10t9CntESJjz6pxAGTw1R6Eg/Z
	via2loIzKaxinlxaend0gL8IVWo+5IWLzOsINMDbwgpqtoQ02c1VGfaQAQ8lQ/N4lLejkYs9vXeUq
	fVX715LkurVffY1rwC3fbg/JZye8J0/YvEsLKH5u4aCwqjI64H75k4JTqRzOp9LSZQoqpEXsCmsJj
	EQjUri8zjBOzCHC5UU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9UbA-00FXYy-VS; Mon, 17 Jan 2022 16:11:12 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Ub7-00FXY9-8N
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 16:11:11 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jcxj127Sfz1qxHZ;
 Mon, 17 Jan 2022 17:11:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jcxj11LGyz1qqkB;
 Mon, 17 Jan 2022 17:11:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Q6HIU5Zbaqg4; Mon, 17 Jan 2022 17:11:00 +0100 (CET)
X-Auth-Info: WBIdWVkrdSiGmO+QDBQxoTmVr79e6qe1UsEYV5yN1imGIbBKMcVHNSoaZeLM3kUt
Received: from igel.home (ppp-46-244-183-111.dynamic.mnet-online.de
 [46.244.183.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 17 Jan 2022 17:11:00 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 1E58D2C3ABC; Mon, 17 Jan 2022 17:10:59 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
References: <20220117154433.3124-1-changbin.du@gmail.com>
X-Yow: Where's the Coke machine?  Tell me a joke!!
Date: Mon, 17 Jan 2022 17:10:59 +0100
In-Reply-To: <20220117154433.3124-1-changbin.du@gmail.com> (Changbin Du's
 message of "Mon, 17 Jan 2022 23:44:33 +0800")
Message-ID: <87czkq7370.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_081109_492100_2A2AE151 
X-CRM114-Status: GOOD (  19.35  )
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

On Jan 17 2022, Changbin Du wrote:

> I tried different pieces of code which uses __builtin_frame_address(1)
> (with both gcc version 7.5.0 and 10.3.0) to verify whether it works as
> expected on riscv64. The result is negative.
>
> What the compiler had generated is as below:
> 31                      fp = (unsigned long)__builtin_frame_address(1);
>    0xffffffff80006024 <+200>:   ld      s1,0(s0)
>
> It takes '0(s0)' as the address of frame 1 (caller), but the actual address
> should be '-16(s0)'.
>
>           |       ...       | <-+
>           +-----------------+   |
>           | return address  |   |
>           | previous fp     |   |
>           | saved registers |   |
>           | local variables |   |
>   $fp --> |       ...       |   |
>           +-----------------+   |
>           | return address  |   |
>           | previous fp --------+
>           | saved registers |
>   $sp --> | local variables |
>           +-----------------+
>
> This leads the kernel can not dump the full stack trace on riscv.
>
> [    7.222126][    T1] Call Trace:
> [    7.222804][    T1] [<ffffffff80006058>] dump_backtrace+0x2c/0x3a
>
> This problem is not exposed on most riscv builds just because the '0(s0)'
> occasionally is the address frame 2 (caller's caller), if only ra and fp
> are stored in frame 1 (caller).
>
>           |       ...       | <-+
>           +-----------------+   |
>           | return address  |   |
>   $fp --> | previous fp     |   |
>           +-----------------+   |
>           | return address  |   |
>           | previous fp --------+
>           | saved registers |
>   $sp --> | local variables |
>           +-----------------+
>
> This could be a *bug* of gcc that should be fixed.

Yes, it would be nice to get this fixed.  The riscv target does not
override DYNAMIC_CHAIN_ADDRESS, thus the default is used, which has the
noted effect.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
