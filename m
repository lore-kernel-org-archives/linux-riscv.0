Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA1C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+SJySXROPybt5zgqavAUiDMsapaWt7rjf03R+pr8Kw=; b=AOBYid0pp/cFlN
	CIvZGAvD56g+uFIhHQX7QNUWc2BJI6LgYh6cPkFzlyCsNLEpkZj9NltEDnsECw+AKJLpV3iXloXps
	7WfIUTODIZkO9MMEORisowM7F8T7UgO761oE7VnQtdgZib5rDUKXzaJijYJWy0rtuAXWDa8Pp7yFl
	/m/hZ0VO2TAclhQH6T7NPfWlRpBSBRtPpUiuQYQlkzKnHb2HknKzsfEKrbnkKQZs3C2NcwROHtZeY
	hzm0blpsor47j53BokR4o9VFRF5SmzerPe7eKmAJ0XsegweiHz5b2LxubvOfMGEKuLSP5pWadjS7M
	aIqpVTwChlKS3RYWFokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBX-000TbI-MQ; Sat, 28 Jan 2023 17:40:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBK-000TM3-4t; Sat, 28 Jan 2023 17:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C74C6B80B76;
	Sat, 28 Jan 2023 17:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBECCC4339B;
	Sat, 28 Jan 2023 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927599;
	bh=KzJQY36H8UTRdV4GA4A94Tvlfy8MJf2bQK7pvin0bDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+0DG6iMUNd/aSmKM3xHy7dAo/bKB3CVzLXFN3QjB/TYRPjxzcStllfQrOorWTdZJ
	 ToqptEGflygaNaZSkU3wJp8JTh+PDzdo+gqCShT1ppZul7j8xcghsFjwkhbqIvDAi+
	 jHLmm4EBtDmQgzdJmJimFkuRJMWf5rRgeMn5ylir11CPQa94F9vApetIInxmZnHli5
	 DoB3+FckRyOSNezDo0qWlex10Oym97tbCNrdMTVL+aan269VJ+uGJvFmJf5M3mXtU9
	 Y6unIz2hyFURp2zxYICWWwg66f7t6ydh5HMYaN1VEwHP7wEL3shcGdaioLZ2jleD5G
	 5Jt0aZWrdkLtA==
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
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
Date: Sun, 29 Jan 2023 01:28:55 +0800
Message-Id: <20230128172856.3814-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_094002_384915_DE481CEA 
X-CRM114-Status: UNSURE (   9.22  )
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
Acked-by: Anup Patel <anup@brainfault.org>
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
