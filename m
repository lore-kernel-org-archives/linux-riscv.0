Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F54C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqfOLCr+xwvuVM+Fi1Eb8AfqarjjVM8zfgL8vYXLQ6s=; b=EC3XyzlfFnsE+N
	H0V4VMTEgAYq/2dMBBXoehE7PeRa0nyqwgImnO3akerQxUYIkA0jpqVpIzfiMOORCE2ppsQzBBBHl
	49ZkMic6YmEUoEl51wQKztDjaCBXMfKNm/HRFlIudMHSZGyA4NcOJg6tM235tWPlfjd2vGihRL3hE
	5HYhg4IW3sQnfE0X7VLkN+kLoLoEXukW8GtBFWwA9LTcTJ0VpLNUGce48H1kFkjTRuFg1s1oetyXV
	eo74f1eOTQWUrvgrIF/6NIJUxiuNaWDj7jGTFWf8lNE91BlsgOqfnNNrwlJXdVy9kjMkY/g+vh+h+
	NLT1+pEjC38VJd4SqBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3sw1-00CaCN-0V;
	Tue, 30 May 2023 06:34:21 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3svx-00CaAB-2f
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:34:19 +0000
X-QQ-mid: bizesmtp89t1685428435tjs88flb
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 14:33:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: ILHsT53NKPh+Vf4xMsr6y3bHBEHWUUnRi1ghv9wT/qGSSt9pNLNvHdozNDzCX
	1FIgAFiE0Yuz0+3Hi8+4nJEwsdFBayeit8CoSC67DiiD01jczO+8TMxkbA/h/eOj1LDd/Ay
	RTH//UIXABuBugm7tsryWGYk7G14ra0YGkbCqjK0p/KAxjctuOzFukamVxjPRQDdbqSrkpt
	TuWxj54BJCiltXLehhYKZBwb4XpffeeqWh1WVXmU3qkkldsXghlh6PVm/WXVJQ6p3xPmdqA
	9TgsdQ0PoP8nokkAlZxWrV7QxEyW1TjtXov4T3XGiUzy9ntWo12jNAAnUiTsuH+ATT6pbBo
	UPjLBj7kxAZ0DNvmg4L2ZBWFLklu6diSKqOZuexEdyJuZB2/jQ=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1304149608474469896
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 0/2] nolibc: add part3 of support for rv32
Date: Tue, 30 May 2023 14:33:51 +0800
Message-Id: <cover.1685428087.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_233418_179993_B9E2BF5E 
X-CRM114-Status: UNSURE (   6.43  )
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

These two patches are based on part2 of support for rv32 [1], I have
forgotten to send them together.

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/linux-riscv/cover.1685387484.git.falcon@tinylab.org/

Zhangjin Wu (2):
  selftests/nolibc: add new gettimeofday test cases
  selftests/nolibc: add sizeof test for the new 64bit data types

 tools/testing/selftests/nolibc/nolibc-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
