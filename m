Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26367C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b32uP0o1IvLL2k69yYW5xMGzpYL52I6LjJsLCdhfL8=; b=I+bH0WtCfYb0e+
	279wG2tMBcVGjSHf+saFQQy+j9Ignt9BE9ivQsy1bRDr5ejsOE7/U0l/BHtCAfRyXAuPlf2JeW63q
	IbCWMcw6yCfgvESLifAEBNVSVh4jDW7j6mEfjidXiILoULNBc7C/gc54uXpgQ3hR9J5rLIebG7NTp
	ULYF0o1CyjAWnwY3S4O8yXqrOS/qSoUe1s+pI++0OwgRSkH9ZV4mXVPnJRXd95AgvQwfbGC5Sh4Kg
	r0mRjjoR1Bx0dGzI+0UALABRG3bmYuykoYVTz2DILu9Vl5tJGiSf9/zmxVd4Ko1aKPpb7/duU5rcf
	g25nUQeSG2FXEzRDpcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfha-00Gr3s-EF; Sat, 15 Oct 2022 11:51:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfhX-00Gr16-Ig
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 11:51:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2102A60B10;
	Sat, 15 Oct 2022 11:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD418C4347C;
	Sat, 15 Oct 2022 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665834694;
	bh=fh15OHJHy3R3yR29pio/F1HO3nxfSUxW0UFKeoOvuqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jvax/d0VnemxcgAQYxdfl97c3+5pwbgiw0RwzL1R6BR3JazB1Iv59l9B2SqfZ20Pv
	 3zHqItoiWniPZhIPqC0P6H/O1FOrWHMGmC9VFSWE1MPrk0Nvd4OLYkRQfobrQDTYU9
	 uKLaIQ8uz2dZoQXFuOw6BGf3zMNFnVQ01/vqdJPMX3529Jq07eSFzvyjOqSjapTSx9
	 bbcecYUxlwPnDnCJBb7CY0aemxRfQiPl5Rf+ZTDzXcEasdA6eyZYHSh2bTm83PseeX
	 sZY3w62Cglk7kvL8gae55OpoOtOxlpzF0fMmWz0fY1hdgwnoqNQKR1qrt6zjJITvVU
	 y5Y5Xo6psV3Kg==
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
Subject: [PATCH V7 12/12] riscv: Typo fixup for addi -> andi in comment
Date: Sat, 15 Oct 2022 07:47:02 -0400
Message-Id: <20221015114702.3489989-13-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221015114702.3489989-1-guoren@kernel.org>
References: <20221015114702.3489989-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_045135_696200_03FAFACF 
X-CRM114-Status: GOOD (  10.34  )
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
index 167ae41ae4a8..b1babad5f829 100644
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
