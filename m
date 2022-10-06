Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E1C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gJYHa6muW1A/HZImiNSXMoalBK9gOz05NYEa5gJ1sg=; b=b5SPjbSqfVuaOj
	5alS7LAA34SwN3xKdPT3lHlK2aTQJsKZ6RnwlCrBcD0D/x05fHt+rqe65Ii0Z6MURV9tx94YQ93fc
	fuABdcjkeWc25C09zM9BQSGtnvAyktDBMvE1vpROvvaBa1UL6sR7VapIp+1DiLQtnZTKSffAnNI34
	tOr3t6GISXL0lFQFjn8N12SszAoyKQV6FYIQlTgm0q222PxfsVjUIDPTS2hqM5vT061cQqkpD+/MU
	Ywve56eDccJasT8fBOS6WZ9yKuNulBlulKj1C1WTO9NUiQlMz0p9sCuGEAldwi00aOFQri1KKYpjC
	Ccjzz4gNArGn2fGcow6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8w-000Mb8-F9; Thu, 06 Oct 2022 07:18:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8q-000MWc-B4
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:18:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD6C66182A;
	Thu,  6 Oct 2022 07:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93245C433D7;
	Thu,  6 Oct 2022 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040679;
	bh=wKFyYNU904w6QY4gfev3PhC66aVWe3d7fSVd7HA6A2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvMQNMjl1RwUtGXd+y5DYWQhXF6ovFT1F9gbwYQ9DUCLT/AtW/CpJgEXa6vk/X3rz
	 Hy4AjhLiTYg87LgHGthWRUv5nkOzRHVh0apTdwnVAYaAvLNNB8gR6+Y0KFaMV6ApEc
	 o3fiSCtse9GuAINnXZtMlapzjG/p6XgboIl3mKYEe5U4qJACybcCESPr8PIE0Yxnp0
	 UXpk/y8lEZchG+YtvXgEqSrW/9lIgTNW4hLARQ2VGAZD8VTOd0Ikalby6ndQCFDkNO
	 jgYP+FLhBhHHhwy/KxZoX5AG+P2ngIa6NVh38OTlpb0dnKCy9ZlsDKg4V4KGEgrFOF
	 BIHSryCmYiPdA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Thu,  6 Oct 2022 15:08:16 +0800
Message-Id: <20221006070818.3616-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001800_443523_D3CAC1E3 
X-CRM114-Status: UNSURE (   9.88  )
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

Switch has_fpu() from statich branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
