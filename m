Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DE1EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83iKeANq24Ad1h/7Z7snwIywSvvGkH9w0cIFoFEfkjM=; b=fwhibXoRRovTV5
	Tgsg1+l62ucgb5HhDuWBlHua0eiPS9usMs2XtpAS+yqTwKl6Bw1bhQbMs10N8Rt8gO8KjB2mUgsQS
	2DSzRpZzhGcky6u37MPaMwdDNM9fPl9ItNn7Nlc8Cwne6XxsusAU4oSqci3pA2e1n/7hh55yhAVQK
	YL3L7QLXbJpW/zP9JNZNNPdhbF5s4MbFEF+QELaput4C/n3iHZFsNwlaamo6q5Mhf+G+1mzrIf7HQ
	Y/aBVEMgHh+PlftAbCaQsR36VhFCiP4Rduk4KBc2ELEwnYByCAvzXM2laLDXoA48UQhA1/tB7LvTp
	Zwlqxf9cbJe5DiiaN7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0k4-008Bdq-1i;
	Sun, 02 Jul 2023 17:20:08 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0k0-008BdD-2R
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 17:20:06 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362HJxGJ017048;
	Sun, 2 Jul 2023 19:19:59 +0200
Date: Sun, 2 Jul 2023 19:19:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v5 0/5] nolibc: add part2 of support for rv32
Message-ID: <20230702171959.GE16233@1wt.eu>
References: <cover.1687176996.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1687176996.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_102005_089335_FA380EAA 
X-CRM114-Status: UNSURE (   8.35  )
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

Hi Zhangjin,

On Mon, Jun 19, 2023 at 08:22:43PM +0800, Zhangjin Wu wrote:
> Hi, Willy
> 
> This is the revision of the v4 part2 of support for rv32 [1], this
> further split the generic KARCH code out of the old rv32 compile patch
> and also add kernel specific KARCH and nolibc specific NARCH for
> tools/include/nolibc/Makefile too.
(...)
> [1]: https://lore.kernel.org/linux-riscv/cover.1686128703.git.falcon@tinylab.org/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/
> 
> Zhangjin Wu (5):
>   tools/nolibc: fix up #error compile failures with -ENOSYS
>   tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS

I already queued these two ones to relieve you from them while we
discuss the arch customization.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
