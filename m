Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C807C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAA6217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKjOWEfk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="r8wLxPQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAA6217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmmL5yh07q3t0RUJrDte3IWcNvcJHjjNEz+yr6yLNRE=; b=JKjOWEfkvSsirh
	ryOhVvHdUMw2/uphxo6sk8OlJKey46ZH54LMDi5DgGDtb9R5azfhbVW5e/fTM1aIrsFbqF++YkyBa
	9ADpJlz9aCiPlP1ZV0E5sZCStw5s8HHXm1Xa1KsiRKxzXcOMqxyMoCutXJQD3XId/YTUC1bI2wh8f
	jDr2LzxojxkWuWHgWizCquFMh/lmn8fkl5ASLsTuER+FgCIzoKns6ZJVHjLOsgBBTnJNLa+uye21R
	qMJoRGzYDzysT8OCe96lMBYlZfM4MQTOZS7zA/PJcfLSqRF3GSIwbN0nUQsKrh1YszXshN7A4wgCq
	I34rdMj3kkcZhpjR65UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6N6E-0003Mt-Bv; Tue, 19 Mar 2019 22:20:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6N6B-0003Kc-Gw
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 22:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553034044; x=1584570044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JHyZqNF9UsH7+ClJFH5uWEO14tdxMwlKOp4HiqDbalc=;
 b=r8wLxPQgh+JsAfoBlUbCWvjJ34DCPU3b1XMoc4nWrKsFiD9H1QuLG1/K
 dTTSQ4vvhxgNDT2+nqGRCh4abED7hkwelf8h9EwSJ3gIMQvFzJ6qSvXFa
 h5MqWiWkLMXig3AZUin+K10XS3Xikr93I3FabG9jqEfneYYPlsoLEqnl9
 U8Nvy2ht1b7Z5thGYPHdWqyeEwr43B0r2N/IpkriSzf2VZulZ28vmXlNX
 j5i6MfLsr8G/vvFsuDVIYoAhcOSRGE2Ur+UVeEtzTO0bb/7udJzdv4hFW
 7VeHrhW4Id6bVQa+hLUUCW7mvjK/ru0Pejz5lk7NPRNCNVp+55VrDKLgI Q==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105129862"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 06:20:43 +0800
IronPort-SDR: oU7LW156C8n/Utl1BlQOTTegMCUKO3+xrgJ/4yncZvf0oapMJJzdIUfm0/2kVQzkjDyVLVThw9
 sIDjekReKtZFe5+SFM0jvqgcS9KhBp2RCodAdcu940vdJAvIEYXgUtDKevOntvl3XSzjE8xUdc
 NuqSSXVa0vZDKOuCeAeRIR40PFmC8Fh/t54uGm6aMCC073KZYc7xvdz7Pg4iqMe16day5eZ9+g
 VWyPQjJk8msupDWDZwn8reXGxr23gGxUnrOP++/g4ZyXjMsLVAf6R7BEc2XUH+w28b8R6VMpWB
 BfPYyTnNtQODhmmhoQL7CspE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Mar 2019 15:00:22 -0700
IronPort-SDR: S/UjAAnMnYpTs6jw+2waR06og3vocMTSGYhml767rgnlKG6Me1JB88TbVoMAk17uXmElwqXLaA
 gI4TXxJd1JDa65Y2Bq/3HjT2BiVEMRBwAWuhKY0hh9C0dQM75Fy4eAPBB42p1sm14vdcOJSIp6
 cH8FQfT41ZIQw3GTWW+6CRUmPTyjza1E2p85LNIeZy/EqtO82bpQv5Wk1FJKFJ13KgivPq1SDq
 QdsxQB5aMRkfQ43vPujqsRVFIPbwqmIGRza9NhQTmbO2aFNY3wosWgiWP1AwcUAmYMUxrQf5zP
 sSo=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 15:20:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v1 PATCH 2/4] RISC-V: Fix of_get_cpu_node usage
Date: Tue, 19 Mar 2019 15:20:26 -0700
Message-Id: <20190319222028.4293-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319222028.4293-1-atish.patra@wdc.com>
References: <20190319222028.4293-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_152043_794833_DF8D1852 
X-CRM114-Status: GOOD (  10.48  )
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

of_get_cpu_node expects a logical cpu id not a hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index cf2fca12..c8d2a322 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -136,8 +136,7 @@ static void c_stop(struct seq_file *m, void *v)
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpuid_to_hartid_map(cpu_id),
-						   NULL);
+	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	const char *compat, *isa, *mmu;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
