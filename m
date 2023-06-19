Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E41EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yg45Qns0r8OvoPY8RWE/cU+Ax3QC9fRi2nggXTgTXeU=; b=wLWK/YRfNlN7tc
	AKgYlk8HPjNrS46IofbKruv0TzpXpgBtFeSGNgbcWsJ3DJChkItfEqw0isrQt3j6Dn5aPO6Ut+KKV
	YIw/t3hA6UGSLYvFrQVifYCAmMMtQQ1zJxUu+X8P4nQptSIbZXqOQshz03j2chWtuZDwNJprBNieh
	SkQTrh9wa9TC4mbBx1oDPyuC72fYaE4W03S/dDYSFZzar6zB1WujSTA4vXb8C10/nI5963EtDK+yn
	zp1CAptmPpqFMvzVnCOtAmfCPwRXaZs+MLXs4CKAW4fsV4qWKrOoXL5gpDhshhug03/lim89QoUcd
	nMO2/glUHONrrXt3exlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDvg-008TJF-0v;
	Mon, 19 Jun 2023 12:24:20 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDvb-008TI5-2a
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:24:18 +0000
X-QQ-mid: bizesmtp84t1687177368tfq88rp0
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 20:22:46 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: +Fw3Sd5mYDVy5IXdeJE6BIovvKlOnc3GNN6uMuvLeGf2lVehdl147neDdZAXi
	k+b0AfWCP7jJa1yW7vuS3V2NarADU/1SM6jqM/pESBtccHbLq/RLRa/Fl9zyl7PnJ63sMDH
	leUW3mRppM9T0ZdKdznzbdnsmbr/7Tq/CaZzj8VarQ9ZxoW5wmqkVVTHWC/ksz1Zi9mAGfe
	gyca9dSF5Xxo/hqh9ALn+aki21so5d64XUVsvDdnK6RH5LV1I0PDqvMvzh9A5LHOPVK59o5
	btlLHuuuHfAgY4X1GSlBc3NjMdl3aWccB5vyIkR+OvBu3iR9pJ0Lf1J521GQMedrxna1x1J
	uUCCNbuAOUr7XVZbmcnsGfmx2Llhd8rguT46ekwwqZLpqpygtw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10358423973123995557
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v5 0/5] nolibc: add part2 of support for rv32
Date: Mon, 19 Jun 2023 20:22:43 +0800
Message-Id: <cover.1687176996.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_052416_154652_9E9B33F9 
X-CRM114-Status: UNSURE (   6.55  )
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

This is the revision of the v4 part2 of support for rv32 [1], this
further split the generic KARCH code out of the old rv32 compile patch
and also add kernel specific KARCH and nolibc specific NARCH for
tools/include/nolibc/Makefile too.

This is rebased on the dev.2023.06.14a branch of linux-rcu repo [2] with
basic run-user and run tests.

Changes from v4 -> v5:

* selftests/nolibc: allow customize kernel specific ARCH variable

  The KARCH customize support part splitted out of the old rv32 compile
  patch and removed the one passed to tools/include/nolibc/Makefile.

* tools/nolibc: add kernel and nolibc specific ARCH variables

  Pass original ARCH to tools/include/nolibc/Makefile, add KARCH and
  NARCH for kernel and nolibc respectively.

* selftests/nolibc: riscv: customize makefile for rv32

  Now, it is rv32 specific, no generic code.

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/linux-riscv/cover.1686128703.git.falcon@tinylab.org/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/

Zhangjin Wu (5):
  tools/nolibc: fix up #error compile failures with -ENOSYS
  tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
  selftests/nolibc: allow customize kernel specific ARCH variable
  tools/nolibc: add kernel and nolibc specific ARCH variables
  selftests/nolibc: riscv: customize makefile for rv32

 tools/include/nolibc/Makefile           | 18 +++++++++---
 tools/include/nolibc/sys.h              | 38 ++++++++++++++++---------
 tools/testing/selftests/nolibc/Makefile | 18 ++++++++++--
 3 files changed, 55 insertions(+), 19 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
