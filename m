Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D7BECAAD4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IpyaBpeXN9iCJOfGh3ZA2Rne1GK7PDu4dsJJuMwgBc=; b=O6P00VBMC50pnz
	I8Vaw8JGw0ODN3Wnqpmt3Q/dF31VdtGltm3zxbUTDuBc2JGHSViMsXEhyJ4fD/TVxBKWyBnh35XdG
	7FD/5faf5c2IAgcVtzU5s7SMlzx5oOrxUr4xx23fW2tpnBaJIO5KSkCEtxG+oqI1XrXyDd2To0DKH
	nOktWCKzDRqdBN8ywZqy8d17WnfOyBu5AUwxdOvuwcoHccpL+rpQuII2wVaHUqxkCl3jObptSme95
	B0QoSF8XgtBc3Jd6A8MRDkmQnqj0bXQp/5g8yWG5fq41tboQmh2oBxMB8EsQsBEqAdDK5f8YH82RP
	afZY3Z880Zeb9J3TUWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8z-007VWg-45; Wed, 31 Aug 2022 18:08:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8v-007VT9-Sg; Wed, 31 Aug 2022 18:08:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61F6E61C19;
	Wed, 31 Aug 2022 18:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6625C4315A;
	Wed, 31 Aug 2022 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661969329;
	bh=xbjqcsHpZLXZwlNWH/Cbgm5wue/oCBT8GsMoqoWOFtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+7gVi8yFm3V3RD6T/WGbR/vDUeIq5UBo0A6wNESq7DWzBVB49wILZoyuSgVzOCC2
	 rnTa20DoLo7rRkJf7myG6HugA48VHkmLvis6NZ1Du7QSESk/umgnpvf2vXrs7hpfcP
	 XziZDBydnKYKqmsb4lkoXqCo2YzHqfT3Vg0KKLdvBdR5n7ok1oBC20OV/2Jy0Nx5Xf
	 GwT4E8whMUzEmE0dNxJVmU4FC5YW2MbREEBOpLoURCWb9WNrb4TYuXnisoNDUiVuJk
	 gFIP+/fH7hTgzzjajJqKIIqqNdpoYbqnV6RrydBHArpNf5A7DA3vEeTsrx1Cfv5TuP
	 g0duUCmddN/GQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 5/5] riscv: Allow to enable RT
Date: Thu,  1 Sep 2022 01:59:20 +0800
Message-Id: <20220831175920.2806-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_110849_992234_EB65E0B9 
X-CRM114-Status: UNSURE (   9.47  )
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

Allow to select RT.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9f2f1936b1b5..69cdcb3cf251 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
