Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A5DC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YODRhcXmrNjXrCDfVhKYqNsTByFTDPEOfKOZao+u+EI=; b=36o8B4kTNES7lY
	va4UmF79fCrftv4bxjLHTz8Yq9hDSo15jznqmFqQC4r5Xlh+4RZrATE/yD+Logi6FrOFzUEiO/2j6
	PIzMmbokLy9HbdJGHf/CWnNN7Vf3fbs+vs73ScvWJfMHK4PG//qaLHMmEiaHDXvLEbrYNK10zpRoa
	U785Dlq8JRNMivwNeSVpkSJwkKPMdHXL4WgmXqHchzgzrFEDSjz1mQcJOKWLAfmA1mifd+EiWVF8B
	iqdG3ZFwkN+UXztFsDDeXEZgvDKQbcfyc1WmmVsf+NxSHMYUC0+vnQzS/6jKSAEkX1MeaqPmtrJhl
	w0mpcoH4kGOeGT5fC/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSp-00Atse-0q;
	Tue, 23 May 2023 17:06:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSl-00Atr5-0x
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:06:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E20EA634C3;
	Tue, 23 May 2023 17:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7886FC4339B;
	Tue, 23 May 2023 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861578;
	bh=S1v3epwjKPZhhmwrrwdqziIQP7+cuuUHEgza9tY/ky4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VroAEK5OljQLhXtHf6feHA8/FP9OXYl6sjuMlhJsY8l8KPby6JgzKKo6wcnYW31kk
	 7699dMhJ4mj/3Sez4d4jeyXrd9ERwFEGrqRI4zLewef48JVaieRPxC68pFZq3gnrG0
	 QwLsevTvH5HQg2BMVx3o/K6NDABDbh/+eAmtHw4GRUCBfZkUonc6oKYSTltVEvG2ei
	 wGp8bjpvxifPQIq+Vr3n/eYYBZuKYC77OR2xuYa91Vrd6O0cZDX3KKmKqEfPF3jLBK
	 OXdEs3T9UefBk5W3LeStb3eKkp+/XzUWYJ/awKpJCTvSoEsiEa17E2YSrtqZ4j32yM
	 2VuLUKy8tPE7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/4] riscv: vmlinux-xip.lds.S: remove .alternative section
Date: Wed, 24 May 2023 00:55:00 +0800
Message-Id: <20230523165502.2592-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230523165502.2592-1-jszhang@kernel.org>
References: <20230523165502.2592-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_100619_370885_B447A625 
X-CRM114-Status: UNSURE (   8.92  )
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

ALTERNATIVE mechanism can't work on XIP, and this is also reflected by
below Kconfig dependency:

RISCV_ALTERNATIVE
	...
	depends on !XIP_KERNEL
	...

So there's no .alternative section at all for XIP case, remove it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/vmlinux-xip.lds.S |   6 ------
 1 files changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index eab9edc3b631..50767647fbc6 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -98,12 +98,6 @@ SECTIONS
 		__soc_builtin_dtb_table_end = .;
 	}
 
-	. = ALIGN(8);
-	.alternative : {
-		__alt_start = .;
-		*(.alternative)
-		__alt_end = .;
-	}
 	__init_end = .;
 
 	. = ALIGN(16);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
