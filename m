Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E951BC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRKWSOu0On8hb8LOSUjnj4HpXlkbwwjzCw1rHj7sB9M=; b=XMGO73fHRzlRm1
	22NefCUW3gyT+1pxqtdk+wr1WY2IN4nyaD9I2AEaqtKh3ZRAC9V5R+n6weWnDgcfdTKtqvmwzSCpF
	M/NPKShMMhi77F+rAHFgTm3wSsnhvfKAwm9TdkPbOH2OsBnFinMoQ4K3yVslEgjtOK0+IQOjiKxzn
	6bMRSoQ9MQnYQw93s5Eeh1wuaeUIQmbOqDaAvBFZ+2p6lKEKircPZIFPgCf8h2l+iy7GZD0Ln3OWb
	8snRylCGap0bsUfr3NcPahG+jKNcFO6uKgkcmgjMUxMBBwggqKb9GXHf4xOjLoYubq0x0z1NkYuza
	qrreBaao80jqvX65HcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFen6-00CMct-1n; Wed, 11 Jan 2023 17:21:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemx-00CMRc-D2; Wed, 11 Jan 2023 17:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE0DB61D7C;
	Wed, 11 Jan 2023 17:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B50C433D2;
	Wed, 11 Jan 2023 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457682;
	bh=iakCU13SXpMb3pcvjfiiLXGeB5RnCPEYfg/spzK7YxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QyqAUwJGdNtBpzR4nntbs1iPUTkBKiOHAmXK9MifYRWMELikATG4WriMLqpDgxpov
	 cHYLSZFLH9EHn+oPMBvxgIhq8JwB69mMxlGzCWFVKKq5oUvR6NH/KoHX0MPpkBDaQu
	 j4Z0J//elt3BJwT1UORJJ0DODp8Jh2NMZOlPbOeTRciGJfooU/7fF3FQLKz3+7BxtO
	 YHcf4fCfc5HvTlUc8IQlW1PW5Nemzwft1lPPwWrdHYdLhltZif8x69g+9WgKM0ezE+
	 kjAConnZz54KiT8BYnQ/k4YcSufpdk1aw3s3x0HWqArA+muds8k8lw81cVsfeS4DLU
	 XT5HZ9ozU1fdg==
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
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
Date: Thu, 12 Jan 2023 01:10:26 +0800
Message-Id: <20230111171027.2392-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092123_517566_B35DD327 
X-CRM114-Status: GOOD (  10.22  )
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
