Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE9FC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P2epdcd57KFEVvKWa8EOUUNRLJ/GFjsReOPG+s8Q/3I=; b=FupfmjFe0ds+o/
	V93ZQR1BS5ph6K7l1VJsaPzjZkHglm0VjjXi7Hq3vRnusAzxHFoSU3UeCY9mtHRfs/Hxj3SUZzhN+
	1E2cg3KWGqFmJd5XGI5OhdDEM99t4ydY4f98fSts3XHHNCarN4SN+OBh5UV2cxSH8pDluDYi4yDh0
	FhBcnhi9aWN1ed1ocOjziOlYDds/qdynipc0aBW5bE5lL8wyoa2IFHHZJq/3xAlaY5Rj/8LF3KOWJ
	GEetk61Rj/FzJr6uSZEe25Lz4yynFmM3xA1RBoQbaYUCmyrCRrIYdr5nWw9vROokWDiSEu7j0iKxc
	idG+2qQWK/OdKY2DowUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbNm-0000000Fep7-02fG;
	Fri, 20 Jun 2025 13:02:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZgV-0000000FRHg-2nWy
	for linux-riscv@bombadil.infradead.org;
	Fri, 20 Jun 2025 11:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7+9nhCOVGIzCFiDtp94CVoN8wnMB/5TEpBypcppi+RM=; b=gAgTPb5yF/heQgw0R6dE1JTvW4
	hcqTeeL26GDueUCF1hA5EUIZYJ7ZHMr8sOgHtCKCZipNr3Un1ENKwwRwYDayudpDBM/oVtiACRcrC
	hw6Nru/XjUNy3r1l57n93xBcrHm2eU+yDuxbCHrVCl5i+U8aBjkJHhqXj8I5eR3tWeKfLJjA/Zte7
	tXHlhMeyZNbCGehDu70auOMFkhEibcoR9uXFoDFlGlVLPvxIEDSZyL4eh8qLWiAoO6cXb0o7nhS35
	9w6/2G2h2ouH5yhtyDbB4EZH9ZOhGyyv5NIqzCTWC9DNqScj9NbmC6RK15Jpag74IxphRZhvIEgQq
	SvaryAlQ==;
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZgP-00000004hlA-3FPl
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750417983; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7+9nhCOVGIzCFiDtp94CVoN8wnMB/5TEpBypcppi+RM=;
	b=lMK6RirjUtzEuGygCrGFiZTxN5mdO4gx94jTavoL1p3GP3MDDN8YzKslxS6bkehfT/nwixjALg2s0H7Kb6vyUxDvb5bbsyXAWbBXdR1w+FMf96aPQzPmYoOcopPiUyIBuPYXv7qJ520c6FUVAEJyjHtPEpX6UGhoxeEvgxoo2aU=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WeKdP2w_1750417960 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 19:13:01 +0800
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
Date: Fri, 20 Jun 2025 19:12:17 +0800
Message-ID: <20250620111219.52182-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_121322_866853_9D25BE70 
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
