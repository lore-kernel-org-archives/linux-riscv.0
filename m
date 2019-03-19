Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE30C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAEB2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="giZTWWYD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hW+iLtQu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAEB2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYHz0gTg7PR434LFLE3+6wxULUfdevmBJoQUxH2vkYc=; b=giZTWWYD6sFEt/
	jn3XB7gZl/nxFKJzkxEdOAVFSiqZEqH/R3Q/7L7RdpZQu5A7LNIEKVSTLFN8voSrUMIGJhI+32Uta
	MUIEwlYrsfdkMz1CpFFO3612m5EBzRsJ7idOOCkmsNUEb60GTp+bd7sRdMPtoOMhT2l95/JoXGerW
	aX+tZljN/awcEj87anmqkvWvEgNexnyDSZTxXfOZlyz50Ys5NgP1zKxNbMtsibuYH/fwHKHpR+YIQ
	67MfLmxsGZfrlMBdenE/Nx16KPxUCp7z6ttDk89UfcKDZlom/by/csqY24jlfvGxMWMBGP0PsjQJl
	DqLTB6pdehv7fpAxERpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6N6D-0003MN-KP; Tue, 19 Mar 2019 22:20:45 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6N6B-0003KZ-Bt
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 22:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553034044; x=1584570044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k5J6+qgl1gVFESf4xZxUc40mWhR5uxNVP8yAnN65YwE=;
 b=hW+iLtQuYptUrl1YlU5mKEw3pHYE+P1cbPWAUqNbbi+jbziZHL/2E+Kf
 xZ77klASAV7EGROhjnRmseH1JY+MidCZI3R3kWZxVhv4OKXni4aVUGvFd
 qMnUiCACGSt4d9AmhIKQ1fZ4miPO7wcrlkBvJXJ6exUq4jXsRF9Rrza3A
 VT9mfBqeJHpcDakuFohAnuzv8JH0vd4YrZ8x4MzARyjVxV3xDY1s5x+0U
 6PMG216PXc+9d5FDF84RwQpPxOyt70EfY6JYTPS3ORfviiffpqRIUG73O
 0jOHG0wnw233INZ4zv1VEafeNZwqIh23i+JIedtU7iI/83JK4nZCNBKxB g==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105129860"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 06:20:40 +0800
IronPort-SDR: yurOmEFR4ub94mvxTxyWyDnFZ/g6eBZd/0qHoCbzYJ5dajoMagvxKFmD3Fs9tqHnRYM51EFABy
 PskokzM8N9zHXIEkl0z0dMvu8U1LcJPvBKdc559+onjXdVujNaObhAxyZ0yLXSVsNzJ3W8jbgG
 LFTHfJlPgMY4qfPgeN8VksHdsUcGZDO3b1ET3TJrOFljS7Scby3AF/xP2xtUnmWsngaH81ucWo
 ru48pirHLamBNKWwez8Cmu0ZGNPZw1aTiL5fcwgMnk8v7u6eEU+I/th2fufw7xfhdCzhLuIVld
 m9EXXjJayEzsrijsgsEpvFzL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Mar 2019 15:00:19 -0700
IronPort-SDR: iJF5s9z2RM1Gs19kaUvUD5unDJN293ZLp/MqfQP3gOIefu9Ty5hAtL7oTZ4jpOqI1rPcrnkscw
 D6Z6Kex/Y8Px1wAl2xc6DRa688BM+FO6ZQL370tlwMjC14HeL8ePhTagAubF2I/GyjgI3EQH0l
 gzpf69KuXQrrgkMu6KhIJobF4JaxTybKdBfK5izQxnQXLqOkP55+CnSv8arb8fxZS42zhY0126
 dUWJLTgESMXUV1AXh3l9AsieAIeuOsEIRE3u+zSkmPqioAiOvU9Jo9znCgZBbpuwpSXr7aEkkT
 VxM=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 15:20:40 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v1 PATCH 1/4] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
Date: Tue, 19 Mar 2019 15:20:25 -0700
Message-Id: <20190319222028.4293-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_152043_540760_1983FB72 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

OF/DT core has a hook for architecture specific logical cpuid to hartid
mapping. By implementing this, we can pass the logical cpu id to cpu
node parsing functions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07e..94db7266 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -70,6 +70,11 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
 	for_each_cpu(cpu, in)
 		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
 }
+
+bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+	return phys_id == cpuid_to_hartid_map(cpu);
+}
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
