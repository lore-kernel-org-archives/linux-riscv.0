Return-Path: <SRS0=Vlvd=DI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14B2C4727E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 19:05:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951A6208A9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 19:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJFd5daT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CfISXXez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 951A6208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBTvDMaA8j2jP2svNTmnkglfRxvIQRsvj3bKbidj2AU=; b=jJFd5daTybho8PA2PrXmn9YEny
	veYsA7QZ5PQFyfDWZIeQTvDM5rgrGi5hM7W55DiA5nu6fT3S04MhabGkLP7PmM/7VTlFFSRs5yjjf
	heZkztf3iaV6+3SjRRNJe4tfeBvd+mvtoyoTZWDJ5kj2OPJXafr2LgzGODorRBjGe5vLLDDhwP8kk
	x9a2bzhxpuM2VYhT5Ookb1OUc0NR+kCtr5lsihkNXPTRupatE6at4Q1ytzXVKTm8bt/h8A/pk7CXN
	n//F8bpKnApg+x/Ik1oM2xcWnVNzD93MWDNm6GHuP35fie8Ll8KJZHLx2b+milB7YsQiNCT3KG6Xr
	SdqR8azA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO3tC-0000Qm-9e; Thu, 01 Oct 2020 19:05:14 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO3t3-0000O4-OF
 for linux-riscv@lists.infradead.org; Thu, 01 Oct 2020 19:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601579105; x=1633115105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mvG+0a31TUnr2CleZRBwC1uO2SIRLdp7lGvzolLznks=;
 b=CfISXXezmJfQPFCvZtONcW1aqYwRHJAcRq91Hlak/bPzMjMvFA6MgD31
 nCyee579G4odsx0TCcjZMp2oGG+9Nuy/ndofNijpG7++5Eh/qNoClyMlc
 o2+y82PSo8lvGQZ2/+qiJRfYlNl8y4R7sJhGhFXfrHdzCxA9BffyCh0A3
 dVr2R9EGL6YKjgkA2L2F1YrEry2OSe3NGfYlz171obA18CgIvSkxQgRKB
 PHcIv0gr7D4FdoDCmYca3z3Wom7fySRoDn6vsXJJzP/UtpWlX4xMz9Dg7
 oZKtG2J+UUpHu9Z7MlDxbsVcni3b+yseXL4ZaZxMSt4oKQOww7KxFARUE A==;
IronPort-SDR: HU8FZTXIOQnW4v1r1S73gwkZyDA3jJcan5GdiLrS+MeHHvbmBSumkiXV6p7hZZz/DM+tfob3hx
 2hNb3gJLoLqwJMWnRXBW0gU4z+vbcQARhIzCybvB58o6eWMTuIqJR/YozkLQBSPcrezU6tlFOH
 RVnFjPm0k5Zp98L4GpWP385QYvw2pAJ+eo/J7AhEgSSqDhMBIgpwgGgu3smZ4cYk+7cpnAJLLq
 TkQUkHYsWzClLbsHxlA1BwhrC1lsU598nAdJ/pZJsLg/4QRHoq9i35VvifwSStJYDMxl8MA6JN
 fRM=
X-IronPort-AV: E=Sophos;i="5.77,324,1596470400"; d="scan'208";a="258592832"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Oct 2020 03:05:03 +0800
IronPort-SDR: 6wU11ppVzx4s4xbGgUkGFyMD3O7CdARSdvSJXA6DcQTtLZthzqeplzgEuVvMC79maNY2R13hRZ
 x1NhrDF5VkFg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:51:00 -0700
IronPort-SDR: ANr0iEXCHrjkkstTEh+kleISfOPOrgEc0i+HKg80Rgg/9bBuEMNWDj59/ju9D1TYggD0hpBPNn
 st5KEKQTthnQ==
WDCIronportException: Internal
Received: from 30tyk72.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.249])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Oct 2020 12:05:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Make sure memblock reserves the memory containing DT
Date: Thu,  1 Oct 2020 12:04:56 -0700
Message-Id: <20201001190456.2860155-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_150505_971563_0F8F003C 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, the memory containing DT is not reserved. Thus, that region
of memory can be reallocated or reused for other purposes. This may result
in  corrupted DT for nommu virt board in Qemu. We may not face any issue
in kendryte as DT is embedded in the kernel image for that.

Fixes: 6bd33e1ece52 ("riscv: add nommu support")
Signed-off-by: Atish Patra <atish.patra@wdc.com>

---
@Palmer This patch is applicable for v5.9 & before. This fix is already
part of the "RISC-V: Move DT mapping outof fixmap" patch from UEFI support
series. That's why, this patch doesn't need to go into for-next.
---
 arch/riscv/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 564e0be677b7..cabf1697e748 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -510,6 +510,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #else
 	dtb_early_va = (void *)dtb_pa;
 #endif
+	dtb_early_pa = dtb_pa;
 }
 
 static inline void setup_vm_final(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
