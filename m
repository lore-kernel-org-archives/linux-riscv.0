Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F5C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B58218FC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPhDAk9q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NUcg/hWc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B58218FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7hx0GWuwGJ0WOpvfzvlZGFBg115fZjICXT84Ha10gg=; b=jPhDAk9qCC171I
	JIq4zfKFIwuu3wpJNPxacfB8SNzKFxpA1zmNrsvvZQhJrWoz7afXTLjZdGswqX31EPfRTTLgne523
	hvkPTuantStIxAq6VJAGfKD91UuCKkd3ThhCvyhRZIRlOYwq/kQsZ5ceDbbSJ4sso0moGxouAlmM1
	olI55m5GlSaKwICOFA1qDB5oRcbgv19lComB33P9Igr786WNb5jRlL2MVdWE1q/6lyQEhmW/A++Ts
	eZVKlw4b9rtkmOWJze7DXc+xNQbkzSzy+EJBkKZnoNfAhszxz3wMZQ4ZKoDB2YHoihDAsKlHHQciF
	pgTv/oagMwTZWXE0uMWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ5Mt-0006FP-49; Wed, 24 Apr 2019 00:02:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Mp-0006Bk-OM
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 00:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556064190; x=1587600190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TsI1Vv+BQuc7zHn+F6+ygwuhtzAPsWvsEfC04f75S54=;
 b=NUcg/hWcMD6524noavwA1ijWCxNReYuTw3nmuiC7hMEpdrk7zyuZDcmf
 NcmT6CU71j95F/Vrl08TSU/wcY1odhlyS/E0IVhZC2MN2vYKDE/N5DSRO
 21T8qKtRR1I0zkCMjCu8hTUH9BbE5hLVlLJ9yJ8wbeEa0N6XtU02DYUtE
 kdCOxLWunUkaRlaV/9nSwR75df7VxAV6PTRLfmtoNcjChM6sA4mG85yAX
 2UVIEax7FdDwnmDItztCecRM+J09uQiNdGcqwfXDwwEzBqvFveyF0HOaH
 H0BJ/CfpLEwoGlXlHVo0dMnZRqpIJlC9BrOAuNy0aTMrrN0mgRGHfMmJu Q==;
X-IronPort-AV: E=Sophos;i="5.60,387,1549900800"; d="scan'208";a="205772514"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2019 08:03:03 +0800
IronPort-SDR: 0QAZuZpTKvJuZ6f7s8RSALPfkHIIwaQPryM9dNFojfNWP98Xc9ECTvzKO5UizKJ2MVpwSrox37
 GTeNOI2C+ZMcqmxdzHAlqFKEAfJECaB89AKN1nMd4fb5b96tberQyRG7YR1PD3Z8MKqprGnpbr
 OClcGcCJwY+MJjCWeiwUunjWO0oYDPEdJpdvTPh08TM4Da18E3pulPj2BaoIijL+vSqGZx3m3l
 pn5TJBIM7WWCNRhSdOjIhxL4+U921H5yDGAeeC9s5YZtkGweF9xmnA7Soi2X4ZIYChZL+dCyqG
 mmrfeHOq0+DxDzFKZ/Rm702g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 Apr 2019 16:38:55 -0700
IronPort-SDR: 8ArrhRcNMCh7vFl00ASwZSp12erSVVdrGP6n/aHcpXoKHZtU/T5W2OuihEo8qL7IL/sR7DAv+m
 MYNs19kwKsXUGXf9q/W+N+aKrK+nWIDLWENFZiX2A6jCUDCwzqnPoC7QD4w3WLbM04CEzl16mh
 Q2EzSHZoikUIXA4VjiBbCp7SIh5I5Ssh0/XLZrmvXFrrvP3pi/X8NuTjjVO0WH7dBNV/5ZkGUv
 oyAU4MrGda9tYZ1yrmHAq/cqy8rFt8k0Z0jlMqbMaGn8UiDY7T2+l8Gm0PtWa8ErXb5mJDKYQY
 0hc=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2019 17:02:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
Date: Tue, 23 Apr 2019 17:02:25 -0700
Message-Id: <20190424000227.3085-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424000227.3085-1-atish.patra@wdc.com>
References: <20190424000227.3085-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_170227_840019_77487B4B 
X-CRM114-Status: GOOD (  11.05  )
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
 Johan Hovold <johan@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

OF/DT core has a hook for architecture specific logical cpuid to hartid
mapping. By implementing this, we can pass the logical cpu id to cpu
node parsing functions.

Fix the instances where logical cpuid is expected as an argument in
of_get_cpu_node.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpu.c | 3 +--
 arch/riscv/kernel/smp.c | 5 +++++
 2 files changed, 6 insertions(+), 2 deletions(-)

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
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07ec281..94db72662f60 100644
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
