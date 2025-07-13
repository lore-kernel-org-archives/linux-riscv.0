Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C080C83F17
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=igUN9ZBP0r8yukqHh9wBwxE2ZBgG5UiLPLRgee7B60Y=; b=fAA73f75dAAVZS
	nw3BxeIAmvHOclF5C5YG25gIlkzqlLHGFFvrzmew34Z+9TgT2PJeICEC+L9iijUn5lmQVVFKUL588
	e1c8I3ai2d89JyJnQw1u3uutGvwfMLFDMmJfh19VXoOBgDChiGnn/pQLduRFU+NWrJoYltseq5r3U
	ObDZIPozTTIDyVjKc95UXW+LrPS7ofzdEAD9m/mDK6jO1JMzjancHFbUxwTBg1lD5q/5IYBv0m75H
	r9maEIYdGUyMANEqB6zMLOGhcSwGb8wtxxy2IKc8obwLEoavYmHx/7/s6yYORC1Dm4cMLg7vrn6Jy
	LWB6X95aMZtOwgnl9QlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaz1L-00000000LCs-382y;
	Sun, 13 Jul 2025 15:53:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaz1J-00000000LCW-07hF
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 15:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B53FF45E99;
	Sun, 13 Jul 2025 15:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A31BC4CEE3;
	Sun, 13 Jul 2025 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752422019;
	bh=KW8diOD7GzEBunJn+RKzPhWkRLpgAYo3gtaKrpFxmgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MlFbZxFf5xje9Atzw5RaEYBbqIntMtaMQQRbp2F2byiMXOo6J9syOSFc01a4I5VXp
	 8mQuBO0E6qJLNjhgMPgtMlYdjHDAPg4fHJFmjEiEjfPHIRLkhIm6JeSLf+WBDMQyhu
	 4FRc9xCGmVVItWx6ZVzv4TzCgYe6FdcqXwsHLJ7ofufwnjvHxA/EQCDv3cQUuICj4A
	 AOyZWKF3+E3QDyl1kE4em8dyuDhtX6czErConFw7SNXBWbHX2UQitZoIzDA+uwbB4Y
	 +GyGSqMfOLIRXCiEZU+ZzEfLnmJU/uJYLBawAaLkdkZX3PdjessxgydkQscQl05GxQ
	 Px9QsLpGOpHsA==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com,
	paul.walmsley@sifive.com,
	bjorn@rivosinc.com,
	eobras@redhat.com,
	corbet@lwn.net,
	peterlin@andestech.com,
	rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Date: Sun, 13 Jul 2025 11:53:19 -0400
Message-Id: <20250713155321.2064856-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_085341_090631_102A137F 
X-CRM114-Status: UNSURE (   8.34  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The early version of XuanTie C9xx cores has a store merge buffer
delay problem. The store merge buffer could improve the store queue
performance by merging multi-store requests, but when there are not
continued store requests, the prior single store request would be
waiting in the store queue for a long time. That would cause
significant problems for communication between multi-cores. This
problem was found on sg2042 & th1520 platforms with the qspinlock
lock torture test.

Changelog:
V2:
 - Add new header file for errata_list_vendors.
 - Rebase newest kernel version.

V1:
https://lore.kernel.org/all/20241214143039.4139398-1-guoren@kernel.org/

Guo Ren (Alibaba DAMO Academy) (2):
  riscv: Move vendor errata definitions to new header
  riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup

 arch/riscv/Kconfig.errata                    | 17 ++++++++++
 arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
 arch/riscv/include/asm/errata_list.h         | 19 +----------
 arch/riscv/include/asm/errata_list_vendors.h | 25 ++++++++++++++
 arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
 include/asm-generic/rwonce.h                 |  2 ++
 6 files changed, 99 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/include/asm/errata_list_vendors.h
 create mode 100644 arch/riscv/include/asm/rwonce.h

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
