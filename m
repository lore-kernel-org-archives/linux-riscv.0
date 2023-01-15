Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C4EC677F1
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRKWSOu0On8hb8LOSUjnj4HpXlkbwwjzCw1rHj7sB9M=; b=zO64jrK0Objvcl
	m1wJf9lCr2kPvSWgU+P6YBLlVGYd1GLVSQngpQxxJ4QcuLRJm2T3M6Pv2WRBnlJArSUVauW7PDmaD
	brLA7FWF5gaxTIliVrD6Kj37AyD++PJVvorMEfT0OJLLotAUEFFqCPxbbewUJ8KaQhaGRH4oSV1oX
	jjqaTOFw2iSAaqj8ercvMj7eV3ugNl+NrWciLQ+EBWymrHGzC1+vZW0jVKP0BM+OuPKJUVms8b2Pv
	drrvMh2/AxnJYLfetXFLhb/3JHFzas9vzZ8v48NvEGhsZJBCeDrem1tIgQJZVL4HsH5xUZBlUFbLQ
	uapKKS7GMWlpRxaJ/SVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5RR-007cNJ-KO; Sun, 15 Jan 2023 16:01:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5RE-007c8l-UR; Sun, 15 Jan 2023 16:00:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8640EB80B86;
	Sun, 15 Jan 2023 16:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734EEC433F2;
	Sun, 15 Jan 2023 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798450;
	bh=iakCU13SXpMb3pcvjfiiLXGeB5RnCPEYfg/spzK7YxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YFsX2798RH2/WfNI9HHQCYXHNW1bUf1ArkkBSr69Rr2lJJvWGOiPDtVLiO1odYcFI
	 FiRlgOJJT+O3oSBPJ0I6r1UGoc11hDm4rE0KR/E09DmoKqrEr431OKEhw7gc7TdqLE
	 I+8EUgZEsz+2n/Fy1K+47j4wdpGdf3R3GIGQcEBmI5mUSKnqgll3HNaoritJ2htdTs
	 smqYlOT8WyotGQQDOC0I95gTulbUA63Tybo2OrIMd/dmjJdqTay9YPa5H9wwI5sTOe
	 J4BBsV4XlnNSpCaPkijrjtGIrRyaXWOcNa4JZ4p8HZggjQr6u7OvDiW90QeLe2aCur
	 CqHDyLBzZgEcA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
Date: Sun, 15 Jan 2023 23:49:52 +0800
Message-Id: <20230115154953.831-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080053_161939_334EEE53 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Switch has_svinval() from static branch to the new helper
riscv_has_extension_unlikely().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kvm/tlb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 309d79b3e5cd..aa3da18ad873 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,8 +15,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 
-#define has_svinval()	\
-	static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL])
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 					  gpa_t gpa, gpa_t gpsz,
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
