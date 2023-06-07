Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8559C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54e4qrhwdjZYBy9mL2JTm1PahOIcrQhpGxsMAH4CV2o=; b=BXmMZYsHCv6UG2
	gf/mtv8wWtUR7vHSSLFK15EmBhrMfT0hPp/Xe73t1q3uWhIiJUiuYm64imEaxRbiZKXPLzGuqfL67
	0qQC8HcymEASkT6hEmQY4hslhDKYnJIhS75Iz0HgE5EG3FOduLHBhbOWRwEMSS9WN9lnH3kcdocP/
	FXNnHZ7xcoulI9XcV23UkVSycsE9dDcrRtMjTbqjVi2jqRGUwwEOZPlwSnrClnUbLmxfZDIesZ9Y9
	Fx2qtsK2yVP1TnMNk2LPaNc84vIXACp0mcgAlz/7rnmEbUYSRfqgaaQVcNEhcHqXrm5Sk5OFxhBD6
	E6KWQ0bi0RpeHsfe3aBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pOE-005DsH-0C;
	Wed, 07 Jun 2023 09:23:38 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pO9-005Dps-2N
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 09:23:36 +0000
X-QQ-mid: bizesmtp76t1686129784tl9oaodx
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 17:23:03 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADIFM7iJZj/3G7Db0AryQR0jjbOpzlxnxKCoLoFzk5a9wv39TaYWu
	ORYSoDohQWzfiO2HMD9c3nIiwV7hU7SvXXsgjVVEgIKzzWzlIEj+SIIOgeMWIhK8gieeJqj
	El0KIX7ZCs4DEV4VU8uoQg4sGFiOSRnDWIX15ZHeVMSaA2vNR03IXhOavencDcqiA/FXcRV
	gSN5OkZFthKYp+2Y3EkQGbcFAJt+uj3xYqmlNOiFWm1Qge73AXDVlTBMS30VJc19M0esJCS
	blGSJzEItp1FH42FFapLAV6sUEFBgVPR+rZOP/9/So1cNojn7EJgk6dD5r88UNv2WYjL+cy
	3ufanl8BnMM1Ej2IbElHh/5IxP7Buw/5pA32TbbCeFJVevY0TKat15DKUdsL7LqipDUbRwJ
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10563508675985585977
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] nolibc: add part2 of support for rv32
Date: Wed,  7 Jun 2023 17:23:01 +0800
Message-Id: <cover.1686128703.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_022334_095179_1C8750EB 
X-CRM114-Status: GOOD (  13.69  )
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

This is the v4 part2 of support for rv32 (v3 [1]), it applied the
suggestions from Thomas, Arnd [2] and you [3]. now, the rv32 compile
support almost aligned with x86 except the extra KARCH to make kernel
happy, thanks very much for your nice review!

Since the 'override' method mentioned in [4] split the whole Makefile
context to two parts, it may make the code not that easy to maintain,
so, this patchset goes back to the KARCH (suggested from Willy, before,
I used something like _ARCH) passing method, as suggested by Willy, we
also aligned the KARCH assignment with the other variables.

Changes from v3 -> v4:

* No new changes in the first two except a new Reviewed-by line from Arnd

* selftests/nolibc: riscv: customize makefile for rv32

  Do it like the other architectures, especially like x86.

  The difference from x86 is, the top-level kernel Makefile doesn't
  accept riscv32 and riscv64, it only accept riscv, to make kernel happy,
  a KARCH variable is added for riscv32 and riscv64, and then passed to
  kernel with ARCH=$(KARCH).

  Since tools/include/nolibc/Makefile shares arch-riscv.h between riscv32
  and riscv64 and there is a headers_standalone target who called kernel
  headers and headers_install, so, pass ARCH=$(KARCH) to it too.

Did compile test for aarch64, rv32 and rv64, include run-user and run.

Note, this is required with the default config from the
20230606-nolibc-rv32+stkp7a branch of [5]:

    diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
    index ce02bb09651b..72bd8fe0cad6 100644
    --- a/kernel/rcu/tasks.h
    +++ b/kernel/rcu/tasks.h
    @@ -1934,11 +1934,13 @@ void show_rcu_tasks_gp_kthreads(void)
     }
     #endif /* #ifndef CONFIG_TINY_RCU */
     
    +#ifdef CONFIG_TASKS_RCU
     struct task_struct *get_rcu_tasks_gp_kthread(void)
     {
            return rcu_tasks.kthread_ptr;
     }
     EXPORT_SYMBOL_GPL(get_rcu_tasks_gp_kthread);
    +#endif
     
     #ifdef CONFIG_PROVE_RCU
     struct rcu_tasks_test_desc {


Best regards,
Zhangjin

---

[1]: https://lore.kernel.org/linux-riscv/cover.1685780412.git.falcon@tinylab.org/
[2]: https://lore.kernel.org/linux-riscv/d1c83340-af4c-4780-a101-b9d22b47379c@app.fastmail.com/
[3]: https://lore.kernel.org/lkml/ZIAywHvr6UB1J4of@1wt.eu/
[4]: https://lore.kernel.org/lkml/20230607063314.671429-1-falcon@tinylab.org/
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git



Zhangjin Wu (3):
  tools/nolibc: fix up #error compile failures with -ENOSYS
  tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
  selftests/nolibc: riscv: customize makefile for rv32

 tools/include/nolibc/sys.h              | 38 ++++++++++++++++---------
 tools/testing/selftests/nolibc/Makefile | 20 +++++++++++--
 2 files changed, 42 insertions(+), 16 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
