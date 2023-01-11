Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8944EC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dmoanyKSM0w4OYlfguTxgNub6xGObrqjKRKoMQMeDs=; b=KiZ0vaSJ0qCErP
	qY7zI8OZlUrJUl4/JX+KPefq8T/VETgNNoyGWoQbrpgJvTmfw/NgE2IntohzN6nCjLH66NwSF7Byq
	tdacVl5mXuM6cXjzz79y1SVaIIYMf4GWK50ShjpEnOp7cHPmsMKVUtA5kvOX7d2VLbArGmu0WbdvY
	IE24PBYSd9QQvn6RWcjQlTI5jjr72nBs6F9QC34QdwrfhWRZCImZleR9D76qrBn7nRlBDgtn8OY68
	WcG37Zldq25sZdbFj/yXlKZM8K+78TxV/GToyMLal800jp2rFj/BkMt7Rw2EG2STJcBSC/ysUGn6v
	k2fTF8R8dKfXKnmF9NVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemm-00CMCj-HH; Wed, 11 Jan 2023 17:21:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemi-00CM7r-Hl; Wed, 11 Jan 2023 17:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C737661D9E;
	Wed, 11 Jan 2023 17:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C764EC433F1;
	Wed, 11 Jan 2023 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457667;
	bh=ZZbNK1MSY8P4rukKkUHVGmvzf9kfXc1zq+8A+JZHFy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1gsJ0ZpyP7xSdrHXOtzajlWsoeDRdoq0kC7WCc/j084lmL33+LWIDjc8kZ+DBFAv
	 7V7nETI9PWsBz6XDcxxpXogkfBxx4BXKXdSuUV8R2mGo5RzRfucP5qxNl5xl5SKDbU
	 AfKARehtE7S77bev8DMfOL5Q367VEFp2vXobvBxiRTVyM+5fvgExVytYF6gVj99vFM
	 wIVEcf2E7iGhjtxCfzW7Hbqvi1Aw8dKOHgz8o9H1N5X9IU+xpz2M89sxgPfAI4oCHv
	 ny6h3H9ejIT1bKEDqADSEYemvJkq/HGJuVSUfTZzyPcFnfQ9U/wxXA3OYLUiv29dRM
	 GfCO2qYI7uyVw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Thu, 12 Jan 2023 01:10:21 +0800
Message-Id: <20230111171027.2392-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092108_642368_5631B1EB 
X-CRM114-Status: GOOD (  10.26  )
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

Switch has_fpu() from statich branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/switch_to.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..60f8ca01d36e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
