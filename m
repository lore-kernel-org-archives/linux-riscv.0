Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769D6EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/19GYGqnIFZfsddAXJUSMmx73J0YWdY+FvhVvd9GKa8=; b=20EcWq8MYbFODO
	o0OvGtwB2AnRCWla54diyADKCOVRNzkMD4dFyS9lwCfBF64k4WMxG0I6XIE089Zkd7qAYbTKDKhbH
	NaLcuAluDBZ4OW1uUBhGWxV+DheIQpYPp3qdrgD24Hrb6URX6GmUGmG0fs5T3pwroqp/iqqCL+0MR
	zUI2XKXJ9Pr/tx/F4y9BwqyD4wV+oFquBeThrky0RBPjeOKZA8NGJN3+LVGBQbz89WsjcYde/PQ5x
	OWJK7QZv0hSIICgKGE3uJSIoYsVl+tYOF4az2Nprez+ah1ZcIipev1RS85jFz9AiFgortR22wuUzD
	1niXkRMWdIjYeUYygzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkwV-00Aeo1-1H;
	Mon, 10 Jul 2023 07:04:19 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkwR-00Aenb-16
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 07:04:17 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 36A747rJ018067;
	Mon, 10 Jul 2023 09:04:07 +0200
Date: Mon, 10 Jul 2023 09:04:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v6 13/15] selftests/nolibc: add mmap_bad test case
Message-ID: <ZKutZwIOfy5MqedG@1wt.eu>
References: <20230709091547.GD9321@1wt.eu>
 <20230709183322.96859-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230709183322.96859-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_000416_362932_7AF3A714 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Jul 10, 2023 at 02:33:22AM +0800, Zhangjin Wu wrote:
> For qemu-user, I have rechecked the following version:
> 
>     $ qemu-x86_64 --version
>     qemu-x86_64 version 4.2.1 (Debian 1:4.2-3ubuntu6.18)
> 
>     $ qemu-x86_64 --version
>     qemu-x86_64 version 7.0.0 (Debian 1:7.0+dfsg-7ubuntu2.6~backport20.04.202306190332~ubuntu20.04.1)
> 
>     $ build/x86_64/pc/qemu/v8.0.2/qemu-x86_64 --version
>     qemu-x86_64 version 8.0.2 (v8.0.2-dirty)
> 
> all of them work well, as a comparison, what's your qemu-user version?

Spot on! I ran it remotely and had a different qemu in my default path:

  $ qemu-x86_64 --version
  qemu-x86_64 version 2.7.0, Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers

I didn't notice but it yells at me during the test:

  qemu: Unsupported syscall: 332

Locally with this version it's much cleaner:

  $ qemu-x86_64 --version
  qemu-x86_64 version 6.2.0
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
  $ make run-user | grep status:
  143 test(s): 141 passed,   2 skipped,   0 failed => status: warning

So we can keep it and blame my environment for that failure.

Thanks for checking,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
