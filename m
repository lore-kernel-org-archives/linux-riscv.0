Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79F0C7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+DxBwsp2UKW2dJuZO3iOXsX5Z7MkwSrQnJ9a5u5l7XA=; b=eiznZzn6b5V+LG
	DEGHua727fkX5NLSrmWryj3N8amEigE/UskNmp3DvxY2fq9yrl2im3xXwpJfI9MzwBwSz4yzbcdeO
	/2maAW5NcyyZSuQiGk+zc3c2oTDFK89yqkq4qfshjZkfHog6VeNllyNtnDvLxUCZnNSrrWmYTgo1h
	UDsXbw5NwrW8HduCv6RU7EEQMIEVcx9fVz1U2t34j/Y+apGrikMDHCCm//BEWDqVuxEXUteXx9yj4
	qeqktg0XsgJ/GHp+YvcR3w+T0+ALSXMNA2qqVqB7BqXnCQZtydEl8tWYHVorz1AOaQuSayiekgl96
	7bkEasolk5jHtgrLPuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5N8P-009A61-2C;
	Sat, 03 Jun 2023 09:01:17 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5N8M-009A4F-0U
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 09:01:16 +0000
X-QQ-mid: bizesmtp81t1685782850txqcbj5y
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 17:00:49 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: dS+JUNSIibdBnc+tIJt+WeMytSH2tNEkxCjMCD4VPtHgoFNxQaIPNyyj3VrsU
	L4aLi7UZjLKSyXCsxEAGLpykcZ6lpcX6vh29qsvV3MwdwXcysQei3DXLoqvZ+mmyI684xYV
	O+/wRohKUsF5llCCmjFXzT9kBRTpbSwE1lTy+dEL+VK+pelCK942/a+1IQRs3HuKn1WVhrM
	iLVKUx7SJjng4ljrg2pEE5nnEX/ep0Rf1Uj55k3Vbd8T6hlaTlXLxnCX3nWZMu3gLWqn1gI
	4I7kD4JLMmWN7SNnGdqjup9qSn1ctiNC0mlpSYUp4EthY61wFhAwe+/rH8Jsx3uQ3yf4pUb
	fl6OniGg++MT3GHMVagj8FpoPyXXK+Z+l1yKfSlg0y0+KtwVTOPP8PCdFNQrFhUS/qOt+EM
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15397238080264048337
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 0/3] nolibc: add part2 of support for rv32
Date: Sat,  3 Jun 2023 17:00:36 +0800
Message-Id: <cover.1685780412.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_020114_491358_C6910C37 
X-CRM114-Status: GOOD (  12.58  )
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

This is the v3 part2 of support for rv32, differs from the v2 part2 [1],
we only fix up compile issues in this patchset.

With the v3 generic part1 [2] and this patchset, we can compile nolibc
for rv32 now.

This is based on the idea of suggestions from Arnd [3], instead of
'#error' on the unsupported syscall on a target platform, a 'return
-ENOSYS' allow us to compile it at first and then allow we fix up the
test failures reported by nolibc-test one by one.

The first two patches fix up all of the compile failures with '-ENOSYS'
(and '#ifdef' if required):

  tools/nolibc: fix up #error compile failures with -ENOSYS
  tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS

The last one enables rv32 compile support:
  
  selftests/nolibc: riscv: customize makefile for rv32

The above compile support patch here is only for test currently, as
Thomas suggested, for a full rv32 support, it should wait for the left
parts.

Welcome your feedbacks, will wait for enough discussion on this patchset
and then send the left parts one by one to fix up the test failures
about waitid, llseek and time64 syscalls: ppoll_time64, clock_gettime64,
pselect6_time64.

So, I do recommend to apply this patchset, it allows us to send the left
parts independently, otherwise, all of them should be sent out for
review together. with this patchset, the rv32 users may be able to use
nolibc although some syscalls still missing :-)

Or at least we apply the first two, so, I can manually cherry-pick the
compile support patch to do my local test, and the other platform
developer may also benefit from them.

I'm cleaning up the left parts, but still require some time, I plan to
split them to such parts:

  * part3: waitid, prepared, will send out later
  * part4: llseek, prepared, will send out later
  * part5: time64 syscalls, ppoll_time64 ok, will finish them next week
           (It is a little hard to split them)

Best regards,
Zhangjin
---

[1]: https://lore.kernel.org/linux-riscv/cover.1685387484.git.falcon@tinylab.org/T/#t
[2]: https://lore.kernel.org/linux-riscv/cover.1685777982.git.falcon@tinylab.org/T/#t
[3]: https://lore.kernel.org/linux-riscv/5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com/

Zhangjin Wu (3):
  tools/nolibc: fix up #error compile failures with -ENOSYS
  tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
  selftests/nolibc: riscv: customize makefile for rv32

 tools/include/nolibc/sys.h              | 38 ++++++++++++++++---------
 tools/testing/selftests/nolibc/Makefile | 11 +++++--
 2 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
