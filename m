Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24644C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtCnji/JQCsBQaoClcuPqyvGBCSt22wkPA59JWxVx/A=; b=r6TnsOroduuA2+
	CDYliHjZchb7gI1IIal9dCIuV9Ot2tIJTNla+9L1bz6QiYRr8c6Nj22S4Gn7mIEnBfcUtHQVHDXZ9
	zWfdTw2pmcJx3IaXiEgsfpSGQliQv+xWS3U07pz+g34AnKr9oNwXGt7TP8ZjgG0WymN3txEhc7h9G
	3qz2R/7Wcz2Hvj2VobJHu2Ea4li5Pb163pZCD1+dX2r8mwkbBLKw0PYkfjw991aqJIO8YHlzek7WT
	CgojE5VBLD6CKOQlxYO/I6jtvQiaOP9/DLRXtJ57+fsufuxvdQjqbFtWVWatrWPGxrZp69f653BqX
	JQxzqFI1UInaVe5z1ETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Aw-00FJaB-0Q;
	Thu, 25 May 2023 02:58:02 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Ao-00FJVu-1r
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 02:57:56 +0000
X-QQ-mid: bizesmtp63t1684983441tzej1xdq
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 10:57:19 +0800 (CST)
X-QQ-SSF: 01200000000000303000000A0000000
X-QQ-FEAT: X3kNTHUrKMRJlZyT+2O5RdJGnxa2VEocmY9T2Ec5y4fHeQHbTKNAZHig3qVRw
	ugOfN+JUwaPDLD5af5iOZUA1gZW0bTB+xogyUz+29+XMpMp/y4kkGtYkNMmSkqAankJ89tN
	7rgEUUJ0S9TNc6bW7ZlBlE9bhf0lPjRcvNwD9pygpsAGuM8Ad6FRxbZX584iCgA6tMj9jXF
	YlfaPcuPTXBBlSzNvxE5t7dWdzrB9dTSJ9QMQDuirSJ2rD6501e7T61GKiZI67m+vt2wS1n
	VjK12Xz12c87qvD9joA+8u4n3BOR84XIQPfGK6v+6Pe3CpKtgheeMeLjGb6A1/XtJfFe6iF
	uDRqZyUxoZQDgVORNOxbTtMN4GKhH08Y/8WJp9YyHLgm2ZEcMq6KJoi9GDRC/PWoD/vIVob
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11307094136493837363
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	pcc@google.com,
	wangxiang@cdjrlc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/4] xtensa: hibernate: remove WARN_ON in save_processor_state
Date: Thu, 25 May 2023 10:55:55 +0800
Message-Id: <20230525025555.24104-5-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230525025555.24104-1-songshuaishuai@tinylab.org>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_195754_914063_A502050C 
X-CRM114-Status: UNSURE (   6.95  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

So remove the unnecessary checking in save_processor_state.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/xtensa/kernel/hibernate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/xtensa/kernel/hibernate.c b/arch/xtensa/kernel/hibernate.c
index 06984327d6e2..314602bbf431 100644
--- a/arch/xtensa/kernel/hibernate.c
+++ b/arch/xtensa/kernel/hibernate.c
@@ -14,7 +14,6 @@ int pfn_is_nosave(unsigned long pfn)
 
 void notrace save_processor_state(void)
 {
-	WARN_ON(num_online_cpus() != 1);
 #if XTENSA_HAVE_COPROCESSORS
 	local_coprocessors_flush_release_all();
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
