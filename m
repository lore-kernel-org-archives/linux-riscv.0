Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07C3C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3eNtfQm0XZfLHJ0+82jcJy8Rp8+Id82YUYkqgbs5V2E=; b=CUSBIFkLDw5AsA
	jCDDDPem+K1EyJ1U4Rtya5jU28AqGDwn1T8ShjVfLOiJ/KGQuTtDDVz3gJK9K2a2W51dmGfh4KJKI
	MIe3gxPK8sAcrx3ZjZd+Y72j0roWa8YaLghbgmCM0dtQKhoVyvXGit+O98j4f3twq4DHlnxJ46894
	KPsUaHDbFGXJUYCOap51mlQao4jNGmVH8h6TAyLwmqY6B1teyUnx0oaDo8RlqD9oqVAlE3sg2QUOP
	tHKAzqSu4UhwWWSirayV7KWDHClEqrPC3g94P66vsl1BmhoKVJaubhfYJMeHgVITf8ekIdjGgupjP
	JrtuXNM43o7qgCkbcSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MBI-0092co-2Z;
	Sat, 03 Jun 2023 08:00:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MBE-0092ZN-2O
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:00:10 +0000
X-QQ-mid: bizesmtp74t1685779178tv1c2476
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 15:59:37 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: iDzLjIm7mlbPeIpKhf0L/FoYc5sBCuLlmD1uXZ6PLTeLTNqoaWw5vVBt4RZJB
	5nE1u/X8VOHe4a2rR+f7qxdPnaataTsBE75Oo4mGR2USddqN+9RQQPyA/5wd+P1RNg+61hT
	T4ihHHsbzzkJRV4iR5QslKSjQPbWr51ZPYBKeCRHy+oGzp323hJBYRC8MJJxxsCRic62xGL
	ITChxxvvC1tCoY2knphq+S5rHgRqy+N1sUTxEzMkPMc4Wc6gKtQFPqVfzGFhF0AMi3yem4B
	IKCZuEyBe2QNxxuKAHqKATlXoBfkF0tk216ifnrEK8YL3kzCnQLRs5Cbn2P/6+hCCQjQ90i
	YcItibezI442FD77p6lUKtGFX33/1dqqP10oZvk
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8921411248983777273
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 00/12] nolibc: add generic part1 of prepare for rv32
Date: Sat,  3 Jun 2023 15:59:29 +0800
Message-Id: <cover.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010009_102080_2E1EDB92 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi, Willy

This is the v3 generic part1 for rv32, all of the found issues of v2
part1 [1] have been fixed up, several generic patches have been fixed up
and merged from v2 part2 [2] to this series, the standalone test_fork
patch [4] is merged with a Reviewed-by line into this series too.

This series is based on 20230528-nolibc-rv32+stkp5 branch of [5].

Changes from v2 -> v3:

* selftests/nolibc: fix up compile warning with glibc on x86_64

  Use simpler 'long long' conversion instead of old #ifdef ...
  (Suggestion from Willy)

* tools/nolibc: add missing nanoseconds support for __NR_statx

  Split the compound assignment into two single assignments
  (Suggestion from Thomas)

* selftests/nolibc: add new gettimeofday test cases

  Removed the gettimeofday(NULL, &tz)
  (Suggestion from Thomas)

All of the commit messages have been re-checked, some missing
Suggested-by lines are added.

The whole patchset have been tested on arm, aarch64, rv32 and rv64, no
regressions (the next compile patchset is required to do rv32 test).

The nolibc-test has been tested with glibc on x86_64 too.

Btw, we have found such poll failures on arm (not introduced by this
patchset), this will be fixed in our coming ppoll_time64 patchset:

48 poll_null = -1 ENOSYS                                        [FAIL]
49 poll_stdout = -1 ENOSYS                                      [FAIL]
50 poll_fault = -1 ENOSYS  != (-1 EFAULT)                       [FAIL]

And the gettimeofday_null removal patch from Thomas [3] may conflicts
with the gettimeofday removal and addition patches, but it is not hard
to fix.

Best regards,
Zhangjin
---

[1]: https://lore.kernel.org/linux-riscv/cover.1685362482.git.falcon@tinylab.org/T/#t
[2]: https://lore.kernel.org/linux-riscv/cover.1685387484.git.falcon@tinylab.org/T/#t
[3]: https://lore.kernel.org/lkml/20230530-nolibc-gettimeofday-v1-1-7307441a002b@weissschuh.net/
[4]: https://lore.kernel.org/lkml/61bdfe7bacebdef8aa9195f6f2550a5b0d33aab3.1685426545.git.falcon@tinylab.org/
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git

Zhangjin Wu (12):
  selftests/nolibc: syscall_args: use generic __NR_statx
  tools/nolibc: add missing nanoseconds support for __NR_statx
  selftests/nolibc: allow specify extra arguments for qemu
  selftests/nolibc: fix up compile warning with glibc on x86_64
  selftests/nolibc: not include limits.h for nolibc
  selftests/nolibc: use INT_MAX instead of __INT_MAX__
  tools/nolibc: arm: add missing my_syscall6
  tools/nolibc: open: fix up compile warning for arm
  selftests/nolibc: support two errnos with EXPECT_SYSER2()
  selftests/nolibc: remove gettimeofday_bad1/2 completely
  selftests/nolibc: add new gettimeofday test cases
  selftests/nolibc: test_fork: fix up duplicated print

 tools/include/nolibc/arch-arm.h              | 23 +++++++++++
 tools/include/nolibc/stdint.h                | 14 +++++++
 tools/include/nolibc/sys.h                   | 39 +++++++++---------
 tools/testing/selftests/nolibc/Makefile      |  2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 42 ++++++++++++--------
 5 files changed, 85 insertions(+), 35 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
