Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D5BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F0D2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MDLp3mOs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="e6P852uX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F0D2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urlIsUpkeyjMlx67y+X44wDkYVsVjOO3Y0wuPnd0UlQ=; b=MDLp3mOs68EU+1
	9TUf9iXEWL3KHSCVjfx+3la72owULInnQO+oQl/5wNw2KrRzfNv6oOcD5AolzGSO/uEN9hG7xwjmz
	izdgIl1hOtw0Rn6K64jyIg5/LoCd6hQ0sHvcGxby/OTMtLubHL7Gk28NYRA9JaIqVeW42KSUeyGNr
	CnTeanJQc3nfgUgqAPalrL49GZURgnmH8Wa/j5i6zmUi29djrd/27ZrfOwmDajvz+fSBKz1cL/iLy
	66uP2EcC+KQQ2HXYJ7uOBGnzAsJLpJ7M+m44b0uV8ligl2/msViydK81hvnTgJCdCy10Mhxm5m9PL
	tkFoqUGihRoLkhnvNMzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6N6H-0003QI-9q; Tue, 19 Mar 2019 22:20:49 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6N6C-0003LS-Ry
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 22:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553034045; x=1584570045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zb/1pIZ8wgWkzLDrZtCT/oGYWbugSzEwVSqAOP9Qfzs=;
 b=e6P852uXycUGyLHTrKaVBtOoVaDdaPgoNoq4dao6tDayfRm6Z48x23SX
 66vSMAbESAID2nOeV3GKyLOmG66m0SWKOQyU4o2YVl9ZExZ6karqX9Vnb
 PdpZyRFj5LiFRI8DutEECZqJZxSczimTnSBW3wFwObaqKkXMwcmIh+hd/
 QJLzsuOPSrnvR1o8hfcD6RH9413bb5AsCEWyfbvEPfOlxgcocpvvCB+Zq
 1dD/CbMHcxMgl97uocyxqkkUmq0uosSfcZ02ED4c/TrA9dKPDgEn4GRt7
 vgWH5qrvwwcDquXVEsx4P59MOE575/QwB+XqiQEhGNvEVzJ1rSuBCQW+V w==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105129865"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 06:20:44 +0800
IronPort-SDR: 60Kn9YRkAIXtmXRZ4Hmk57inSkPaFwKJR0oL3eeMs8V3+qc6/X5jj7YgqclbbXaoYKsO/X6Dx6
 VJOvo2GulPx67dZWasiKUSGfdRGutmIancdcRyup3yP7ZWfj4NLfy0HpSGk+efnFoPk9owTTif
 oEiihspIHIGazzBf01s8HebmRrnVULT08FwneboVWC4r6gvUHMgaR/PF7Z7X8kVRpiuu5E0ndQ
 KEnnrVYfJaDdHoulJUZvIZ2cvjUFdRpczJvYWHkJYHi/aEQdf7vgoCnGIlOJoA1dmIempd4lr3
 92HbHQz07TwRuWn9cyNlIR/T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Mar 2019 15:00:23 -0700
IronPort-SDR: ZqfseJXtlCgxX/y9yOpnz26+OVA7vw79c8S5Wvk4id9ZnGowhbkrLDNUyeARLOrwKE9xABFfUj
 pMybza0z2dYmwZCVImxV21rq0LoVslWT0Y8pmVyJdqXdA4AJTdnsfvirXteY/M7n3gr0dXR+OQ
 MfC6/JToQILOUi/MuYUu6V0sJzeDB/+uRGS0iavAvtCZbp1seqPk9o/iUR/sBO2jkFgHaTmObK
 UBWS13K/ValG5+qOWcR88c6yjcREHCPc7i+nASzfgg0Rqz4zOsTlsGjeFPoAJ4Z6DefdQ4IIvs
 wuw=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 15:20:44 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v1 PATCH 4/4] RISC-V: Support nr_cpus command line option.
Date: Tue, 19 Mar 2019 15:20:28 -0700
Message-Id: <20190319222028.4293-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319222028.4293-1-atish.patra@wdc.com>
References: <20190319222028.4293-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_152045_011679_E367F5E9 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If nr_cpus command line option is set, maximum possible cpu should be
set to that value.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 609475c5..a8fe590c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -86,11 +86,19 @@ void __init setup_smp(void)
 		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
-		set_cpu_possible(cpuid, true);
 		cpuid++;
 	}
 
 	BUG_ON(!found_boot_cpu);
+
+	if (cpuid > nr_cpu_ids)
+		pr_warn("Total number of cpus [%d] are greater than configured via nr_cpus [%d]\n",
+			cpuid, nr_cpu_ids);
+
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
+			set_cpu_possible(cpuid, true);
+	}
 }
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
