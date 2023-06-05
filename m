Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4110C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 03:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gH1lDEUh6AxYL2Tzc0a7tGpmwg5zRNvxACP0qmoH31E=; b=yalMdjiZ9i+t+h
	ZsilkqV5PQxpafV4GLTcvgqFffSJQTwWYa7WEzKVx8W9kuc52Q5WZ2gili3g2pLVKCIg1+vDo85BA
	4A/s4AEfTA3pD7D9oabiTw4zofoHWTppqWJPJzOSfn8Pe/OdnuuruD5Ph1IZh4jvuQHymP+DkGUZi
	iSsJ4Hp8RX5m/CnLtOxq/pomtpBYqpzvBoKJWUUVc0NkPW9EjclVO3N8P5vbydHBxwPqq3qQHPt7u
	rk2E9JAIp2sYKvarSq/m/lVY/0paqustIEpQptK+ywVl3KaNODUz8jwEwWfB4HnyAqRWdz5JIErsu
	k3BrtVvMsI4PTc94I2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61CU-00DyBf-1l;
	Mon, 05 Jun 2023 03:48:10 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61CQ-00Dy76-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 03:48:09 +0000
X-QQ-mid: bizesmtp63t1685936864tb85kr9l
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 11:47:43 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: eSZ1CZgv+JAkiW0WLlTVnyFb8aBGqFeHrro9ClP0k1VxgozEONHr/tXivy85R
	HUv28Cvp7643DzPRmHEbPpzEwOQV9Z9tBBtKCDbOb29+KGVRSn9wfzT+gCDCsJ5Ih3huCBW
	eEXSb4BCadz2oEgqMRw/29I7mphtLJAZwfWNRUtz6vk49DieJSejoLiAe6Rdu6PHvI7TDS0
	Ut3aA5ew8QyHGRi3xcrBqzFBEH+4adLWIvbkW21EobAH41lzogm1YU02S8f4ZEjtYGT4prL
	OlY3upYzrhDgsptlTj6MUL3uglgEemz4vPVwQJx+38zfDoLw1/S+yUC3UzGVask8ee4M3GO
	eXBBI94Yz87Ebt8CGw+eDSOxBsfXA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7225117020602651360
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 0/4] selftests/nolibc: fix up and improve test report
Date: Mon,  5 Jun 2023 11:47:41 +0800
Message-Id: <cover.1685936428.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_204806_507121_427A2403 
X-CRM114-Status: UNSURE (   5.74  )
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

Thanks very much for your merge of the v3 generic part1 of rv32, just
tested your latest 20230604-nolibc-rv32+stkp6 branch, everything work
well except a trivial test report regression on the 'run' target.

Besides the fixup, a standalone test-report target added to share them
among run, run-user and re-run and allow independent test report check
via direct 'make test-report'.

Best regards,
Zhangjin
---

Zhangjin Wu (4):
  selftests/nolibc: add a test-report target
  selftests/nolibc: allow run test-report directly
  selftests/nolibc: always print the log file
  selftests/nolibc: fix up test-report for run target

 tools/testing/selftests/nolibc/Makefile | 30 ++++++++++++-------------
 1 file changed, 15 insertions(+), 15 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
