Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933CDC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TTpkFMgmqOvHE0stI2ElHicTmXI9O83Bvjd61xBu2Q=; b=G8niTOktkEIYM+
	mWZ03wOSrnWAuoODRxe+WKnTLCsKAzsrJyxa6eUJ737wdILvikP6gtRUU2SSRRtExItmV6WFf1fuk
	aA/C+AuYPmi+jvEY0pmf1iOrVOGFvAgT3siJ0iSW0IX6JBSEf7Pc0ij+/Af6za8zUZov/5nbC+7rj
	5XLeCNaocv9JZ9RLQr5tz95+IGPD5zbWA62k3q82COMsGrwq2ayb8tXuro9E7p6Avqk9Rv9hCUae0
	xeVWIMFUKqDKZhb8y2b3GWEqOGRdSp5TOf0Z8wmVgG7yo4XJMnrQ7WUn8GLDNw/o+cTdBZLLhTKy4
	bs8c9LrWWUWoBSka/9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV1r-00GWKV-ME; Thu, 03 Nov 2022 07:52:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV1o-00GWI6-Mc
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:52:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 272C461D9A;
	Thu,  3 Nov 2022 07:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1799EC4347C;
	Thu,  3 Nov 2022 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667461963;
	bh=ePRIEbfh2FK+8Vi6mmFkfLNcMAL4qY01TOTMEoLzQek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5N1gQV6eCaNMfYMEzcic0MZuFFkZUgWijvKflhcaKrBQ9tVfrR0Yxsu0HKDbZK9g
	 cOaIEy9GqWYfRwhBH1byh0nnj137yo9Rrt9ik9ftEkJq+k6/Go8TLJk1dxfvfZK0LP
	 vkesDkJIqAe/vN3fFN+I7IsqUQlZ/X3Sk/2/xGQ1XfHPz2E5zEdII3QYOQa35qYMDK
	 8/5giMWEOQAkmjtxA/HBZ2RbPYnvLE6/QBV0vaxeuM3G7VDJeaFr4tEjxoCUZWTHom
	 wIqZ8t+C/6EpB0i1EVw4CTaV5HH9+D+AzXfbrHVTbljbGbxHcIYnFjtIJld4B2s3sB
	 fcGiqiGZtGHjw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V8 10/14] riscv: Typo fixup for addi -> andi in comment
Date: Thu,  3 Nov 2022 03:50:43 -0400
Message-Id: <20221103075047.1634923-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221103075047.1634923-1-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_005244_808062_15183B80 
X-CRM114-Status: GOOD (  10.73  )
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

Correct typo for addi -> andi in comment, although the immediate[11:0]
are the same.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9864e784d6a6..03655577e26f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -138,7 +138,7 @@ ENTRY(ret_from_exception)
 	REG_L s0, PT_STATUS(sp)
 
 #ifdef CONFIG_RISCV_M_MODE
-	/* the MPP value is too large to be used as an immediate arg for addi */
+	/* the MPP value is too large to be used as an immediate arg for andi */
 	li t0, SR_MPP
 	and s0, s0, t0
 #else
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
