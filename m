Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FEBC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nB0NFzaIuGRiR9ujWI8ATW/QrFAhQDEwBqY9XZADJYc=; b=DVgkVjGKlVJWmX
	aJWs6XGqDZhIjuJCzIMMrHK/B2Hagy5YiKR2mhJua+QudMj24cHTSPeKs3ueDHOQXSQ73+EsyL6Fy
	zzoTMoKul0rIDwIZnbB1FadP7JbZhRsIT36yced64QdGVz7xVJoqxEnLTUjnPBQmdw7teIxjBLgLE
	rPXXedZmUHFeKuqFY+GiuuyQrTo5EXvlG/OwBz4HC+yaJuqtrtqgqbcUK4ZvGoOMqWcQP/TZQLHtv
	4t22JlhS6WjegmWSsGafqU/MQ/6/pHtwY2oI6wTdo5rxoXv3ULE/QWH8JDjlW6NbblW+DlcjWEMqB
	WGN6cJEY/oOQuyQ96PnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpB7-000T9g-6y; Sat, 28 Jan 2023 17:39:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpB1-000T3g-PV; Sat, 28 Jan 2023 17:39:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64356B80B88;
	Sat, 28 Jan 2023 17:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EB3C433D2;
	Sat, 28 Jan 2023 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927581;
	bh=a+5QZf9cRg0N2ZzfrrrGF2H31LP1zc5XIp+raVH9xP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCOcZ4V9XDkJ5wWljeWU20Sde8cDhpniyQvi/aZWm1g2Y7jlYc4p11fL5Ie+we9ye
	 CP8+Nluu5rOSahshmseQnNNFzEGH39khv+vGHVqcvkAvVZ4O6i41qg6FZFkpHwpdoa
	 cvB4Jv/tlRWg5YxXtIpYv1g/ZU987OyFHVY4KeJJfKHmws9hJnSIFRamg4oOC+ZiOA
	 /WcqKlKqc4hT3XrZTe8GH2BDWqzFPSyYORVkwvGNcuFM90s2z5VRvFbq7rbbw0D1ep
	 SI7ZL1nI5C6B12p7Qso3JURdQQ6rZs2rxKSpqmnfPTFiU/TTxA9RhyYF37hmGR9ilm
	 IK+0MTYUX1ptw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 06/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Sun, 29 Jan 2023 01:28:49 +0800
Message-Id: <20230128172856.3814-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_093944_021263_3D48FDF6 
X-CRM114-Status: UNSURE (   9.57  )
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

Switch has_fpu() from static branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
