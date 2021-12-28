Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCAFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGscnzKuEVqTDJ4UM0TfcAwV5SEqWq3H0SCZenbnLHk=; b=JAHAPhGVTIQjKQ
	bay6DX6++LPnNHJdokHtF5csfv6xD/2glUObcj/zRZ+GANoNo0sshYsDiVQKbVlpXnDG1SbFdDdOG
	yfp5d/qkEPvtu5J0s9v3vLwBiuU18Ft7spk1gBVdIpYKnB1pdbMenuRfAk5LtDf2vKeNtBFDwyX2A
	BhDHh7RY1xiAUfUP04XH3KDnnyIbCtB9ifyrULaBloIB/wMBTuwKzuzDNwqdn4n7WRHvG7GcnELdT
	wxqR+j7iiG+39RJ0B36jXiPzJyVvP8UtvN6Ny9KgSbdUiaRqosVWF3+v3iw8cV6J1W5mux6v74OoZ
	6UAQeFw+/+KXshrPPh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26Ht-000HFP-2o; Tue, 28 Dec 2021 06:48:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26HA-000Go6-C0; Tue, 28 Dec 2021 06:48:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A173B80D9B;
 Tue, 28 Dec 2021 06:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B461C36AE8;
 Tue, 28 Dec 2021 06:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674077;
 bh=/VO3mwMyYHdNKGu6mJrX7t4r1f7trz6vaxvlX8LEffY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u0Z+gaFu9yOEolHHZSFm2vC77NNXpU8xjLgXD6b4FJiGxM1Z3F8p4yIfmKGhcMK91
 c8PLQD9tvX4Vg+Amr6L5JmafWBZWsCg/tgGBq5Op/3c/UhiGsQbIs2QaMzQvfYLX4v
 f5NpaviTdxFF6h7lhOG6eaGArgZdxhtLG3IXNKVtLZbEgU5hMamvgYTSTUFpA9Ufm9
 cQK/Zh7Iqs61G1h8A0y2sfFQ9bIX9cluLqoPFbvwvY03VxQWX7bPXQFQJaiNg2PWzV
 90Vguy4HU3WZiTkU7cvBWYm9D/8VbW12bd3v6dzjd4YkZOSr5o/2Ocs/0GQiEr6X4S
 oQEyvHOuTZb5g==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 3/8] sched: sparc: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:24 +0800
Message-Id: <20211228064730.2882351-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224800_580461_992285DA 
X-CRM114-Status: UNSURE (   7.48  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/include/asm/processor_64.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index ae851e8fce4c..628349fc4cdd 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -27,9 +27,6 @@
 #define VPTE_SIZE	(1 << (VA_BITS - PAGE_SHIFT + 3))
 #endif
 
-#define TASK_SIZE_OF(tsk) \
-	(test_tsk_thread_flag(tsk,TIF_32BIT) ? \
-	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
 #define TASK_SIZE \
 	(test_thread_flag(TIF_32BIT) ? \
 	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
