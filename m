Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6428C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E+5/spt8W7jRwbytA+fFe0X/uY0+X4Jqz5ZZx8NiABI=; b=WQ+3rcFdB4g9Es
	0wieJJCJGhyTPpHykDBGu+nJVO9XBNj08lQhoeS4NuxuI7X/CjPo8XOdkAfXYFNnMskVfvnmStqv0
	GdsDdHzVlNoOmH8tRK2INC4UOMPXZAZ2LE0S3Py6s5clt8Wt8qcna6LQlJskiERR+xJ3poXpaPaWb
	UBtpLMk/R74uUY0XeQs3kB2FJ+zI+ZKzGTo5Ms3258+pMLI7rCBjaqxZZ57TrKndbMjfMm4QAr5IL
	qn8Ux4B9r72tuQXAXcfhnqNPNnFpoIbHENeJPKFGAjz6YioXDCepFp+KGW8CYnBCK3w6lrDmzuazk
	3Wfsmv4RXhgmU31+DmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rM2-005eLi-13;
	Wed, 07 Jun 2023 11:29:30 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rLz-005eKL-0y
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:29:29 +0000
X-QQ-mid: bizesmtp79t1686137341tbhfj5g6
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 19:29:00 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: q+yjhizk/eL77uWPsAdnep0mzHEQMbth2xOfZxpWL32hs5VqgL/zmKwk14/Wu
	i9q8XPfvyhdXG9+3oacVYSQr6FunSQbFvOVbwZwjQv24RB6YKbMH//08rrGS+LL+BSbrRqZ
	CwnbEjY/+7z/JMzsKqgv6sbEgj0I452l0mX23xA7jCjrQIbCkImtOj7EoGL6pyYUt7UkshA
	mWct2lQuEKCpcF6JthwUcMbUeXZmqiBPya1w7LlWWa2RniMpOLmdCMGYKkdpMIdFoR87xBT
	zyVt0HFh417TKiCcYhGJVjDY+gvn/0l9+8eHCG/KlDx+j6PvBTx4Y+0SVn6yaSZXvaY5j0m
	QAJRD4PQlmSCcB1jJ9qo7Maw3XVxr15+CFbQOZhB8hlaYSTTbAJE1ybwp7nzPPkcOY8DcJL
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6806432981910364890
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] tools/nolibc: add a new syscall helper
Date: Wed,  7 Jun 2023 19:28:58 +0800
Message-Id: <cover.1686135913.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_042927_682128_4B654992 
X-CRM114-Status: UNSURE (   9.78  )
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

Willy, Thomas

This is the revision of the v2 syscall helpers [1], it is based on
20230606-nolibc-rv32+stkp7a of [2]. It doesn't conflict with the v4 of
-ENOSYS patchset [3], so, it is ok to simply merge both of them.

This revision mainly applied Thomas' method, removed the __syscall()
helper and replaced it with __sysret() instead, because __syscall()
looks like _syscall() and syscall(), it may mixlead the developers.

Changes from v2 -> v3:

* tools/nolibc: sys.h: add a syscall return helper

  * The __syscall() is removed.

  * Align the code style of __sysret() with the others, and use
    __inline__ instead of inline (like stdlib.h) to let it work with
    the default -std=c89 in tools/testing/selftests/nolibc/Makefile

* tools/nolibc: unistd.h: apply __sysret() helper

  As v2.

* tools/nolibc: sys.h: apply __sysret() helper

  replaced __syscall() with __sysret() and merged two separated patches of v2 to one.

Did run-user tests for rv32 (with [3]), rv64 and arm64.

BTW, two questions for Thomas,

* This commit 659a49abc9c2 ("tools/nolibc: validate C89 compatibility")
  enables -std=c89, why not gnu11 used by kernel ? ;-)

* Do we need to tune the order of the macros in unistd.h like this:

    #define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
    #define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
    #define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
    #define _sycall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
    #define syscall(...) _syscall_n(_sycall_narg(__VA_ARGS__), ##__VA_ARGS__)

  Before, It works but seems not put in using order:

    #define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
    #define _sycall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
    #define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
    #define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
    #define syscall(...) _syscall_n(_sycall_narg(__VA_ARGS__), ##__VA_ARGS__)

Thanks.

Best regards,
Zhangjin

---
[1]: https://lore.kernel.org/linux-riscv/cover.1686036862.git.falcon@tinylab.org/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
[3]: https://lore.kernel.org/linux-riscv/cover.1686128703.git.falcon@tinylab.org/T/#t

Zhangjin Wu (3):
  tools/nolibc: sys.h: add a syscall return helper
  tools/nolibc: unistd.h: apply __sysret() helper
  tools/nolibc: sys.h: apply __sysret() helper

 tools/include/nolibc/sys.h    | 364 +++++-----------------------------
 tools/include/nolibc/unistd.h |  11 +-
 2 files changed, 55 insertions(+), 320 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
