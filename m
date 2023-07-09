Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C20EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGPcCKL32m1wY43P0FqNF/LDPpIr48pw/cDBjPO5sT4=; b=Tj6mGhbeM9tRbN
	TvXzLFhTrxj+Nn0rMQ/8qSIgCIJ7t6MPrgmdixv8gT9NoLBBUUp4TIC1Z7NuIyAx3S516lS5D7W8m
	8QPh3VJns4GyX3DEeRavZp97MMvux4KxBa2DwVj8r0vtVQCzdDGJU5HTPpM7nB7ArfhG9dCZQjqiT
	2G3eEwN4NhnCb+oXdPSvJwiCTykqKYQ+qYBO+yKE5P0Y46tVYAncX2HJP141v0VWL1UXxH+tNv1D4
	EiScDamFMiTBdh4xp6QC8Hk+yG4XKbx7Lo13AYUiSPh4WiE2LxXy7dJQoQ3/Q9dz8nusVbRieG6Ur
	lN3MAA1OqUbdkWYteuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIQWi-008iPE-1O;
	Sun, 09 Jul 2023 09:16:20 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIQWe-008iNU-1k
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 09:16:18 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 3699Flap018530;
	Sun, 9 Jul 2023 11:15:47 +0200
Date: Sun, 9 Jul 2023 11:15:47 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v6 13/15] selftests/nolibc: add mmap_bad test case
Message-ID: <20230709091547.GD9321@1wt.eu>
References: <cover.1688739492.git.falcon@tinylab.org>
 <fdc400ae881aa3819978d43cea7004df7b276551.1688739493.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdc400ae881aa3819978d43cea7004df7b276551.1688739493.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_021617_575300_08DB49A1 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, Jul 07, 2023 at 11:05:49PM +0800, Zhangjin Wu wrote:
> The length argument of mmap() must be greater than 0, passing a zero
> length argument expects failure with -EINVAL.

This one doesn't work for me on x86_64 kernel 5.15.112, qemu userland:

  46 mmap_bad = <0x0> EEXIST  != (<0xffffffffffffffff> EINVAL)    [FAIL]

This EEXIST actually is the errno from the previous test. If I run
the test natively it's OK:

  $ ./nolibc-test syscall:46
  Running test 'syscall'
  46 mmap_bad = <0xffffffffffffffff> EINVAL                        [OK]
  Errors during this test: 0

I'll queue it anyway for now but it would be nice that we figure what's
happening (even if we need to adjust or drop the test if it's a false
positive) so that we don't get used to "ah this is a normal error".

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
