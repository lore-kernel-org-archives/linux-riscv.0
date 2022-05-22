Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB06C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nWygbGHa6GLrKt5wffCj+p6iEdnLHh85HtlPgpFl8LQ=; b=SjMeU2xAKSSVCk
	g6fCWxt05mW4Io65ZtU8WGyfOUfKUQUBBHg6vYvL4JzzpJU3y56HihXtSImZp51skN6CmzK5DmmiR
	fhg/mEqFPa4G5+W4T5jefhfJDRf8em7kAYRVj6VDzPcL19jAgMyMiEE5e0kFTHheWuOlwBjMK4SpM
	ofB8baf4746AX1UvN8/ZHaRenR2dy8xB7jGIPWaIVFY/qpNio0PdOJIwZQMmGI2xrcjFo8adSzOPZ
	qRwqHskfCMraH7LpZpfPdK92Jh41MTkXe2eDEk3VvplHZiuvW5kIFUoi7Diaju69AlfJmG7pEtP8v
	qnwbOISa0poidPVBuRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsnko-001bbd-DB; Sun, 22 May 2022 15:44:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsnkl-001bbF-Te
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 15:44:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDDA760FF8;
 Sun, 22 May 2022 15:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64598C385AA;
 Sun, 22 May 2022 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653234262;
 bh=CPNC12uceBtIeQyvRUTPv/UYyC2ND+l4jhk3iSdDZH4=;
 h=From:To:Cc:Subject:Date:From;
 b=eG8Vd5gLFwRA/AUWAQKkSxcx5rGuM2sg3+5whCD0+EzCdhPETdXJXE2Zn5TYunoES
 oPrJsSZzjyO7EjxaqRfxnFP4JBYWmdLPfwc4A5qRzvP2gbgvKMzBOXHoJtoIQ2eC7I
 23VpxiZajsJkUU80RP/ym22/DbrqCuOhMKdRfCU7daipkrBi4W5XqWG8MnJY6D+dgZ
 0+eMNeTH7y8zjf6qiGCkQnUCdbolnShHeou42Twaoz/dDiC4FKwUa/CqLtobilNiRY
 97TFGKk+i+pT+a7hG6xSPrpmGk/CWSHxAGYYRhJAgIanHx6uBn7aPRVrBPlUopoOPE
 Q4qJ7yXymKDKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] introduce unified static key mechanism for ISA ext
Date: Sun, 22 May 2022 23:35:41 +0800
Message-Id: <20220522153543.2656-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_084424_031743_AF7B1BEB 
X-CRM114-Status: GOOD (  10.39  )
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

Currently, riscv has several extensions which may not be supported on all
riscv platforms, for example, FPU and so on. To support unified kernel
Image style, we need to check whether the feature is supported or not.
If the check sits at hot code path, the performance will be impacted a
lot. static key can be used to solve the issue. In the past, FPU
support has been converted to use static key mechanism. I believe we
will have similar cases in the future.

Since v1:
  - fix typo, thank Atish
  - remove riscv_isa_have_key_extension() instead use the isa ext keys
    directly as pointed out by Atish.

Jisheng Zhang (2):
  riscv: introduce unified static key mechanism for ISA extensions
  riscv: switch has_fpu() to the unified static key mechanism

 arch/riscv/include/asm/hwcap.h     | 25 +++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h |  4 ++--
 arch/riscv/kernel/cpufeature.c     | 14 +++++++-------
 3 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
