Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F76C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9J7QqQu7FaFfChhlO9p8KVDf6Ek+prq31XnoIAKfQSY=; b=EPghpPHKoDPLmz
	Z42sf+S4Xth4REHSk2DIngzFR75rhP2Oik/ARBgJgATHlAhYTjHSrSVHUHSEUjxoDDnoJMNB/+fbP
	Ju+1LMgbeZlNLndaxVWzAFapTqF4ZNOrK8w0UiKGicgWnfYHLHw3Zl5v+Y8V2wwGviFEeoLgF1Fkp
	Df09fG7ocRkbeVaafynKHxoVfg0bhXXGbbkylvaNlVeCPLtFeu6ngraFV/VCQ+8U7dIqq9MJ/DUSr
	8gRQnJHENxRbQKMOlC+ElJgZsyik9CvCYalT4GOw6oyj6MYUmlqLjenUo+NHmL4nEkmwcnJvGXQ17
	HGgXIFaZL18oO1zDdEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6T9-006S7F-0H; Wed, 06 Apr 2022 14:17:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6T6-006S5q-3I
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 14:17:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C33D2B82425;
 Wed,  6 Apr 2022 14:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8C6C385A3;
 Wed,  6 Apr 2022 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649254625;
 bh=OMfx41/031A0MP+RHm+KFwlRg5XT4Op6fvW1GZ75ZuQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ie+v5zV3XbfY5P59UHcq+VjkI8jYwX+M798YCErKW4mWwv0QnMTzYY0jffAZsFU3G
 NlvREmST3Mo+7tk9Vp8tFVLhFCiuSyJIkSpUxz6C4lQp7KkFTVq4pylTTO7CbyOB8b
 qQtOHKG+zvk0IRBtTWkeqALBoUjyzccmtfUr63v+sODqL7mIXCl97wfuhgbOegKmjx
 SrKL4NSIwcwdfxICNvyal+YIFKmN+GtAtnmrPXerskHsKWm1LUkZ7REub0s/5tBAkg
 paiu7LCYgtynayD8d832/BWLmBKdP9cKgoHq5Bdon9dXOufgzpTLpqeIsn36OZqjYH
 /rQKYtCcfkKVg==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org
Subject: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
Date: Wed,  6 Apr 2022 22:16:49 +0800
Message-Id: <20220406141649.728971-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_071708_341488_E0390B3C 
X-CRM114-Status: GOOD (  12.71  )
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

These patch_text implementations are using stop_machine_cpuslocked
infrastructure with atomic cpu_count. The original idea: When the
master CPU patch_text, the others should wait for it. But current
implementation is using the first CPU as master, which couldn't
guarantee the remaining CPUs are waiting. This patch changes the
last CPU as the master to solve the potential risk.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
---
 arch/riscv/kernel/patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..765004b60513 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
 	struct patch_insn *patch = data;
 	int ret = 0;
 
-	if (atomic_inc_return(&patch->cpu_count) == 1) {
+	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		ret =
 		    patch_text_nosync(patch->addr, &patch->insn,
 					    GET_INSN_LENGTH(patch->insn));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
