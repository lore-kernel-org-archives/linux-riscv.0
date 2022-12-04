Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41740C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkZMPIz6WlEUrUDEsM73fPi4rAIc04kVfg1acIYc1qY=; b=YeuiiIYFr+q0Q0
	8HXVEVSfAu2WWUQIEvZGUTV2dr2DayDImaG6Ljj2QAtM66WyReNTef1eHCk4I7+a5mRjr+aTMtokO
	ByM98kiZMpWq8E8kJIG+t/pWiC9q9UFo3qC2jUEy4+Z5A8uKvWxW8N6gbnK1bu8Hm/2Cj385UIauj
	ZkrqXRAxmVHASJzd8DMsxVwVz3Ttv+/efwkzTiO1HpimMhy7r6+hsTq62F4F9vz/fr1YvXAP5Dav/
	sSnLd1oVMHmkzHqXTYgwufQ6HGZre/hLMQOdYL6B+AVRNB9zmR9MPULtaieQTonUGntRIqr7rBppA
	UqYIWrsnpmi3crlvKE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHY-00A7Rp-Tt; Sun, 04 Dec 2022 18:00:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEE-00A6bE-Mi; Sun, 04 Dec 2022 17:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6798DB80B90;
	Sun,  4 Dec 2022 17:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC64C433D6;
	Sun,  4 Dec 2022 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176597;
	bh=3s4zw9FUbpvcvaIrDkMgw4j/arxcyKwTzaA9Yi50abg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAlh9b2i+JZ2ERHbdxOsdG4Hn4RklDiaqzlP1NAa2p1TtwTD/T3S48w+97vzyBMnC
	 kLuDLORO6TwtcT/igy8awF+4+wQkbvZTgdZAdSP/rolXNn3nXaXcu7gbPJjdx80j9L
	 xQICvqBMZ9As2pe/gkhltiMEox4aXp9Sjkhw/GlgqFH4Cb4InSMUMhrLRlnVfplBa6
	 wXJxgLBcnJC16Azl02dsmIg/DYCrTof4qfvsbf5vsP6jSwbVm16qJyE6sgbZNMP6FZ
	 9iOBDh5UxwPV1ESX+U7uw4LaMSJTB4E//x4e35tiaMUKhpc5MXwu57ly28J28J0gfK
	 EzfUGwUWKbf2Q==
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
Subject: [PATCH v2 03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
Date: Mon,  5 Dec 2022 01:46:22 +0800
Message-Id: <20221204174632.3677-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095638_896724_2264FC80 
X-CRM114-Status: UNSURE (   9.36  )
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

Now, the riscv_cpufeature_patch_func() do nothing in the stage of
RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
boot" stage earlier.

In following patch, we will make riscv_cpufeature_patch_func() scans
all ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 364d1fe86bea..a4d2af67e05c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -305,6 +305,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	struct alt_entry *alt;
 	u32 tmp;
 
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
