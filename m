Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB949C77B7E
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5X8UiPqF/Z+bmAvIq/Fk4+2NMGuLlUwoeQ9p6aBMyo=; b=wrRJJZrF62SFW3
	LaRp4vqXbR1fj4BBexsVBny0eldtipDiQJ+63Z/44TSXi34pWn88kcCx1A3GhkhpkiPghuZq4Sd7E
	BvoxjQ8hJNzZxTcomRgjqd0M0xnMx8g2GA7MYT71Ms5uqrI5v8o/jUJeXiKan+h5SF83mJhoRM4sP
	E4YFonGE/bvLjunWzlF/+DeRb/IG2Cvo2gdhYGSE9Eaz5VKK6HsOmJX1LiW1FX/V98/rbPGhqMsRV
	d8uLriMt/m6B1/4/Y/fPjxrq5RYk2o/0t7EAVK374eN2oGuIqTB6QfdIzjoL77NlwpUPfX3iEbGN1
	6LDQuNqnvbi519KIAQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3BJq-0079F4-1F;
	Sun, 28 May 2023 08:00:02 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3BJn-0079EC-0n
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 08:00:01 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34S7xt8x001992;
	Sun, 28 May 2023 09:59:55 +0200
Date: Sun, 28 May 2023 09:59:55 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, thomas@t-8ch.de
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <20230528075955.GE1956@1wt.eu>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_010000_150898_7B3D36ED 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Zhangjin,

On Thu, May 25, 2023 at 01:33:14AM +0800, Zhangjin Wu wrote:
> Hi, Willy
> 
> Thanks very mush for your kindly review, discuss and suggestion, now we
> get full rv32 support ;-)
> 
> In the first series [1], we have fixed up the compile errors about
> _start and __NR_llseek for rv32, but left compile errors about tons of
> time32 syscalls (removed after kernel commit d4c08b9776b3 ("riscv: Use
> latest system call ABI")) and the missing fstat in nolibc-test.c [2],
> now we have fixed up all of them.

(...)

I have read the comments that others made on the series and overall
agree. I've seen that you intend to prepare a v2. I think we must
first decide how to better deal with emulated syscalls as I said in
an earlier message. Probably that we should just add a specific test
case for EFAULT in nolibc-test since it's the only one (I think) that
risks to trigger crashes with emulated syscalls. We could also imagine
dealing with the signal ourselves but I'm not that keen on going to
implement signal() & longjmp() for now :-/

Regardless, in order to clean the things up and relieve you from the
non-rv32 stuff, I've just reverted the two patches that your series
reverts (1 & 2), and added the EOVERFLOW one (3). I'm pushing this to
branch 20230528-nolibc-rv32+stkp5.

Regards,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
