Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3347AC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P2epdcd57KFEVvKWa8EOUUNRLJ/GFjsReOPG+s8Q/3I=; b=jAc4k/0IryCWfU
	I0Ok700PF5XC1ibqTmbfy4EqELRG9OlJb7Sfer7b3bDNH3jt1ptn4VWCEXXd1RYUAMSXaG9KMmfry
	aVJA5UDDeAB2L1GG5p8xhHMQUao/yWOW0r+18xkvTIAQ5fVVVNp5tUyhUxPCt3+iKUXiHvKVAQYCY
	C1Aw3yA3AsAz9F4GuSDIbz5aPHQ1kUfApBZ3+ZBD6mp7Yz1SR1xnSqR7eD8WVQdF/Mk/dEhDBKnf8
	I6Ezt9O2HeKOuWcOs2FJet7eRNSvCkGrLEgJAwQdXg3bthnFuKJh6BbkOLjdbq55X2RIDNG810Uy5
	o1+jdwINlja89BRMBwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaIf-0000000FVcb-2xVF;
	Fri, 20 Jun 2025 11:52:53 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZjj-0000000FRf4-47Z8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750418203; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7+9nhCOVGIzCFiDtp94CVoN8wnMB/5TEpBypcppi+RM=;
	b=Lo3iUJSWr7hPj1EoPBHEkMvz6pQdsLSsdSfGlAudVIAdiQ6V2NJWZlTNLOLmn2g0kGUTQPbeK8oiRH0AyDVD5QNn61LARZXwzn4N6pmy4O//Canfd4blfP5xGAkmV+Y/S6mP7HjeC0r4RDZh3laB2LJA5Ndpyo3l/1lyjuPwnGE=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WeKdQHt_1750418195 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 19:16:41 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	arnd@arndb.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 0/2] Implementing bitops rotate using riscv Zbb extension
Date: Fri, 20 Jun 2025 19:16:08 +0800
Message-ID: <20250620111610.52750-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041648_159215_CB27ACB0 
X-CRM114-Status: UNSURE (   5.89  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

This patch series moves the ror*/rol* functions from include/linux/bitops.h
to include/asm-generic/bitops/rotate.h as a generic implementation.

At the same time, an optimized implementation is made based on the bitwise
rotation instructions provided by the RISC-V Zbb extension[1].

Based on the RISC-V processor XUANTIE C908, I tested the performance of
sha3_generic. Compared with the generic implementation, the RISC-V Zbb
instruction implementation performance increased by an average of 6.87%.

Test method:
1. CONFIG_CRYPTO_TEST=m
2. modprobe tcrypt mode=322 sec=3
Different parameters will be selected to test the performance of sha3-224.

[1] https://github.com/riscv/riscv-bitmanip/

Chen Pei (2):
  bitops: generic rotate
  bitops: rotate: Add riscv implementation using Zbb extension

 arch/riscv/include/asm/bitops.h     | 127 ++++++++++++++++++++++++++++
 include/asm-generic/bitops.h        |   2 +-
 include/asm-generic/bitops/rotate.h |  97 +++++++++++++++++++++
 include/linux/bitops.h              |  80 ------------------
 tools/include/asm-generic/bitops.h  |   2 +-
 5 files changed, 226 insertions(+), 82 deletions(-)
 create mode 100644 include/asm-generic/bitops/rotate.h

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
