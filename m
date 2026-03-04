Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA44EDEC01
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 03:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yBpwEsBo5zF/mOukuCpK1aj7Tub9bc0TZItvr3ZIYUU=; b=Ah61fdN1qQSOLf
	pgcNXLFH3ZlUtnvazrc3uJrOx7EJ5TtUOUAUnSflHN6cRaRQiebu7m6zPdl1XWpMS5ig81KinbGfd
	Bbg/SPMu8l5auZJpuQOy9CqR11LAJsPPspqMpfj3kQMFgUVXJLRPUr8y7/xoVrZRZdMG83DyLzEzr
	RRI8oKIDRekVFalgaDCBiqcYPwQ4HUDA08GVvbC4EKJYeP9zxAUMkm9xQvbS3/NXzr/g7v7mtJyEM
	nsX7B+amyubcZImV1K0A+qQ+JYNfglOGLVUZEsxzGXK9E2UKOaht7WPbl1xImKy4Fb/AGjIDGQ1LV
	qoqSWleqIj4OMLPb7TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd04-0000000GNUL-1T9b;
	Wed, 04 Mar 2026 03:34:16 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd01-0000000GNT3-3rby
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 03:34:15 +0000
Received: from hwang4-g16.bbrouter (unknown [120.238.218.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7198440036;
	Wed,  4 Mar 2026 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772595250;
	bh=6EiWw0AcNcyhsQhto/0AAab0OTPn1ZYHHxDgcCF0pu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=nKi704/bGbIY3CDWp4/QMWq3P+dv2xeCbxoxcOxxmxKidj4giFnAjgTY5J6E1ygXm
	 oRvgwkUxm3YQf7nmvKmhkm1Bt/9h319IKJ+h3aK5fiy55qhHJnTZ3Y+mypHFh/V/ky
	 qZLde2p1HTawOENSSxiOzK1aGZuY2waitZnnQO6uBxLaPelEETRdrdXl7FeJLDoCma
	 os6Ly//titXsn/C3pN3TaFy8ij67f1dE1UnP7NgyLwt+hrlVgArHcRky6DxrDfupMI
	 oHWTXv/gcwEeWBG781KvHOqlQZLtHiZdSJlvF7dyrPp3bjHIePVu3ZwQZyaOKyR4v7
	 /0pNsq3ZzsigIG+5HwAuIuGLofa4nsULilVb7rOp34A8YO+efR+HsYZAB8HoN8Xs+V
	 a1sbiCutyazVsErCG1jOeWGGlDzrZusrykeVIEImoMGUpAaLi30ehrvR9nDyY+Bfbg
	 KFBe21rWaaQMHlgUYKkcaKhIF/04PhzC1ZxY7hgjAf4lLROVHHSyOMRbz38LBUbgw0
	 COIYHW4f0b8aauEJFyCekV2aMfVIDqhviikoNEe4HRz2SXYGyvqRNpIKyDFx6AN+Zy
	 8QdChKLuxAXu4SYjZOuugN5h9BTeplHNHzpA+653Q49jI+5SEx+4Ra/gpS70raclc+
	 9yUSb2cCOAwG0DXnSRDAnSpU=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	danil.skrebenkov@cloudbear.ru,
	ajones@ventanamicro.com
Cc: hui.wang@canonical.com
Subject: [PATCH 1/2] riscv: remove redundant check for CONFIG_SMP
Date: Wed,  4 Mar 2026 11:34:02 +0800
Message-ID: <20260304033403.238012-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_193414_346423_1928F5A0 
X-CRM114-Status: GOOD (  10.53  )
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

In the arch/riscv/Kconfig, the HOTPLUG_CPU depends on SMP, hence if
the HOTPLUG_CPU is defined, the SMP has to be defined, it is not
necessary to check SMP here.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7ac80e9f2288..0ecc67641b09 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -105,7 +105,7 @@ static inline void riscv_ipi_set_virq_range(int virq, int nr)
 
 #endif /* CONFIG_SMP */
 
-#if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
+#if defined(CONFIG_HOTPLUG_CPU)
 bool cpu_has_hotplug(unsigned int cpu);
 #else
 static inline bool cpu_has_hotplug(unsigned int cpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
