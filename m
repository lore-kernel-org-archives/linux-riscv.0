Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DABC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=va/rgdD+HDqaOSLBReUUHCjdRebUts1qb0MZDxtuePU=; b=szQbqoWpRoVUdt
	w2ORFYiHezNLeJoFRoKK7n+vc1qR7i+m/FKN4NDV/0/Xl4MkLEG33wkvaAubpThFUd1QCspMz84Dr
	b9Ole9H5znFDQoOjoF8AXVMxNxv8Hh94W5mRTYe2n5E9QNycHr14wcPBHgGsGDMhhNBXFVsw19fZv
	LckSZhejGsDp20QAdxoullb1Vp+P5JHJO/tb6Vr+kbQq/3kefDE2sGNjF4Tfg3DaYJC9w64YGm4ro
	n3eezlqD0HO4xGXKEIGPr3jRypFk9AZ0ULhrSlj/cB3ujZaJYzMDvTuLDUXPPmDw8nC7PFbZS6VlM
	si5/0P7eUbnXpssB+Duw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh7p-00DaQC-1s;
	Thu, 18 May 2023 17:09:13 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh7m-00DaOS-0G
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:09:11 +0000
X-QQ-mid: bizesmtp74t1684429236tgelvkjl
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 May 2023 01:00:35 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: pauNAy/IFzO0FaQLOne96cFwWdA59Rv4ZuUqOLkZM5vji7bwoCZfS5oHPCMNR
	48M0RE4xcp7ioGHPUTFDmgZNOj8L11HPDeSMZPI0b90K7Jv+Nh32m0kmQ/2eJDuBvjU0nqD
	rxRFk0z2JlwsVGj4O80PV9hisxKncI9YGz+2lJz8YJD6bD5Y9UciT6oVEee6jfpaq2bfKEA
	HrD0t1VI81q3uNLbr20tgc4tHuur1dy5sG9LiLuwTGWsdB+Ran0iTH52kg5yFFbiLmaHExg
	827Tca72h1Yfy+ko7CRNn0mNtrcWNhrkvV0LKlT9CQZGKoU3nBQ6UtJRYrfJm5RWfHgD2cs
	y77EH3kjkfWGDxkRos=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4878818344533688938
From: Zhangjin Wu <falcon@tinylab.org>
To: Willy Tarreau <w@1wt.eu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Date: Fri, 19 May 2023 01:00:18 +0800
Message-Id: <cover.1684425792.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_100910_426879_B3D4CDEC 
X-CRM114-Status: GOOD (  12.01  )
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

Hi, Willy

nolibc for riscv is only tested for rv64 currently (see
tools/testing/selftests/nolibc/Makefile), this patchset tries to let it
compile for rv32, but still not pass the nolibc selftest:

* The first patch uses lw/sw instead of ld/sd for rv32 and verse-vice for rv64
    * This patch may conflict with the stackprotector patch [1], because
      both of them changed the _start assembly in arch-riscv.h

* The second patch adds __NR_llseek based sys_lseek implementation for rv32
    * There is no __NR_lseek for rv32, see include/uapi/asm-generic/unistd.h
    * This code is based on the version from glibc, sysdeps/unix/sysv/linux/lseek.c
    * It passed the two lseek tests in nolibc selftest (write a test case manually)

* To let it compile for rv32, we still need to apply one of such actions:
    * Revert the kernel commit d4c08b9776b3 ("riscv: Use latest system call ABI"),
      but it is not the right direction, that commit has removed all of the time32 syscalls,
      and let C lib (e.g. glibc) provide the same C APIs based on the other time64 syscalls

    * If not really use any of the time32 syscalls, defining __ARCH_WANT_TIME32_SYSCALLS
      macro will let it compile, but this is buggy for the current implmentations are based
      on time32 syscalls!

    * Really implement the C APIs for rv32, based on the time64 syscalls, just like glibc.
      This commit c8ce48f06503 ("asm-generic: Make time32 syscall numbers optional") shows
      us which functions should be re-implemented.

So, the work todo for rv32 is:

* Rebasing all of the old time32 syscalls based C APIs on the new time64 syscalls,
  but they are not simply mapped one by one, glibc is a good reference.

* Add standalone rv32 test support in tools/testing/selftests/nolibc/

Best Regards,
Zhangjin Wu

[1]: https://lore.kernel.org/linux-riscv/mhng-1ec176a9-ec5d-470b-a278-a4e9cec728a8@palmer-ri-x1c9a/

Zhangjin Wu (2):
  tools/nolibc: riscv: Fix up load/store instructions for rv32
  tools/nolibc: riscv: Support __NR_llseek for rv32

 tools/include/nolibc/arch-riscv.h | 14 +++++++++-----
 tools/include/nolibc/std.h        |  1 +
 tools/include/nolibc/sys.h        | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.25.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
