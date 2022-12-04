Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F31C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yzNDHFgw7kVGPWgdAduZcIdLNdHtsJetG8i7JY9vfs=; b=uVEuoroAelJCgZ
	jsNWriAUyKWfZJCxyCb9mATp+osQGC/DGkj6NMqNEncURwHNwrnVc7I7aHXV1kl/DhigobluutOzm
	aCEW1GDDllqzIrMVhudJdMPjeSl/RraRXW3QMo16wN/r/IdldYH0McBLTTaHfyjkWxV6h3wRnXLRl
	gwzqb/15gpSgBEFNPqSNybIy0vTdL0Z82J8rrL1N+5dUHWxocKiN1Ng4f7QXyrXTYKeemTKcfGpGB
	ss+rBxlm/ELk4CRd436uBimo/kWdjZKSqOEb+5gVa2bWmiCQ38Ke9ag8iVFxvct1jFWYTAE3okemh
	xKQb4cAsV8WdUkEEjd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tI6-00A7y5-DJ; Sun, 04 Dec 2022 18:00:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEd-00A6jm-1Q; Sun, 04 Dec 2022 17:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A175060EB7;
	Sun,  4 Dec 2022 17:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88B1C433C1;
	Sun,  4 Dec 2022 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176622;
	bh=qOV0A82uSGScKXzZE+xjnxD5QH+BqBXG94TMk6hBrFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qei5qnSYgp6jPx00+NjGmGdMA6LmMOzfkJZVAhQBA6SEjChCX79an5V3M4Qg0XoRp
	 Z9xlnjgoQtJUBG1+40BwZEpfPZXNNjPwYBJ4D+O15zsvUMxu7k/Vavi0Tclyl5nwgz
	 GIyj9w3Z+PYgDxyI0EdlF37fjD6YaceD01cn7psahs+S1ZfFv/BoNz0ymKyK4kw6pQ
	 gc5441t5xL4/IRdmOWgBHOt3Lq6fOlujQrg7Ye4kVAvPZ0fXxb3svKCHJTjP8cop7c
	 7awyHZNGbktkmIymvPtyRHLflRYdhmQQgazbjslMNcFml6ApxOsu8u352lOkVX0eVn
	 Vm9y0yOx3EYeA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
Date: Mon,  5 Dec 2022 01:46:31 +0800
Message-Id: <20221204174632.3677-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095703_136741_1793B2F8 
X-CRM114-Status: UNSURE (   9.59  )
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
