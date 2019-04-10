Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35C4C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3206217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csNZr0QY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AXO8YCmw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3206217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woJe0eJU8HK8/hQo6u9x7+C9JlhYkY2/aJIb63caRnk=; b=csNZr0QY54+JqJ
	jfACjkxY+5ZxDPX8GShKDSjkJ3lVeK8sa7hoWVRIUTOO46ZiCgthvfzXjGN6zxkDtQ4R9Yduk1yFn
	9C2qRRaolEaHdqLBUgAeOppp3r0S5LWEohHGSFSiHkGAE7vUY4nH4InYR7Rurh4IwrVY+A3sJ4Ue6
	8wvgJfKVmhaDox1IMEJb69GHD45ifY1YanE/YZSMlJJoveCCU9i0J4YwTPwQTa+cu5/j72sCDxsdx
	Pmdn5RO9zy3UxpW9nuZ/OSGbvM4mvYhdoBfX/oCu8dhoOUMvrxqs/U9KwEmXESQhRrPA7wPMxKnGZ
	fKV/v7UDkIAeytvtIDYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMHC-0000Oq-Mr; Wed, 10 Apr 2019 23:05:06 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMH6-0008TX-V6
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 23:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554937501; x=1586473501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lvVtI67GMwWJ9cv03bHsz1eiddUW1dTASmv1umxV15U=;
 b=AXO8YCmwc7n0WlfaUZxj77/4e1cD+Quf1vokqvOovg5OylXmVxjMFWLo
 c0WE0tI2I8Y/GY7flmHfk700Oit7HNWhl3nZU1J/dHgi7K+mKXHcAkd3y
 2yg1mb+aB8MnMpBjSJRn19+UACkl1XmdGFkmGWjpS2PW988MorfebmYZB
 Wka8E43T1SKuNXqefELA8nprV4ojCTPaQWdpie5pS9u1u3lqxLGpzEr4h
 KNDjEtKs214ORdEknW7lQh56VhGZJwdfBVWbTRPFEBHvNhpWiQRTn6xc/
 +x+Av9TcvB1Eg/+cpfscT0tl4saXYTZcOU4yCSUjSjoy3LSIs9EwR5QqD w==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105472265"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 07:04:59 +0800
IronPort-SDR: mruatJKT5uT8dCjmV4BdbJRl1lzsPG1XRs6lxWyIBnBHal2XScmyokpqIOu0VluX3mM6TYNaGO
 C2q2du/akpJvhO3jGbCbZcxLE2eUndD+veQb44PHUTzUat5MmCEJIcJpzVRZut5i9GbbI1BDEP
 T16EQ1iVXjgqd8pd2EcNKemU3qnACoP3olTUkerzn+uJ0F1wgZNjYDzcobbdqxU8IIy6b4s6LJ
 TCn/+26RGDw+USKbB72C5KnJCZDzKJ2Bkey8QKttucOxwlL3N4IDq2I7ven/fTmqXice2p49xn
 rC93Jg/CDqz2+4vn0v9ZAyRZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:41:53 -0700
IronPort-SDR: R4DRtdzTOmyurz1EQPBXhM/9XFWc6CUxuf9v2Kp3b0td5Fqi+tavjBieLnUnPi83A7TUW9nk13
 EPtUWgMqdDypcMSLBXazloG+RUgzgHu6pTEfGFtQum21oOx0s4MGpFkL368hDcuq7k3c6037Xt
 ixdOeDXxtTYkxtywJEthG4scVYWjjC6xcpDo2biOqG9CK1q37kmmVQfkgAB7XX+kHNXpLZYafa
 Nwsr5DjYuYPISre5O5vChK7pL93OKJl3eyqE6aD92ebSCwcvEg9rj/0Iq9b/8oZqLp7ypwch4F
 ffk=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 16:04:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] RISC-V: Fix of_get_cpu_node usage
Date: Wed, 10 Apr 2019 16:04:41 -0700
Message-Id: <20190410230443.15729-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410230443.15729-1-atish.patra@wdc.com>
References: <20190410230443.15729-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_160501_066180_0368666D 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org
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
index cf2fca12414a..c8d2a3223099 100644
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
