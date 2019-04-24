Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E42DC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F257C2183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/jTZKIW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I3Jwr286"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F257C2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwAGPUz6NFg/1Dv2krzZTJv1ZUXSZ/Vi1UoLBEWwQM4=; b=X/jTZKIWWjYfxq
	JZ7RAVPr6VHqxuQMAOcqUVlltZzmIf7b31FJOKxY9w9cTxSrPhufYbdJX/eIOoaLUw8/f9XydXRC4
	SPFPYM+LcLT1cQLvfxqmqMHfRJhYMuSNkmbo7ah0I6dX9tcu+lpZOYF/VK9W1kRtAJCS+ddYKeyGC
	Vt+yFFV+D57l5cimuozMP6SPEleWOYQPbXrMO5eH0XA+CgpB9ghdgPkcbX37mHHfR9AeLtwEWIdnM
	+ByaNuMIqO1aohyg96SLMGCcU1ju3sMeOBYGYIxl+qO7Icflttk4VwIBnKBWIvGPHX9K70LqtCGcO
	1Ht7O/jR/ajt74L9666g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJPkd-0001AI-Ds; Wed, 24 Apr 2019 21:48:23 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJPkX-0000zv-K1
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 21:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556142497; x=1587678497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eoJvuEAlEQu53EigOZxTNOMHIT8YN9ACuKN9mjmCeQ=;
 b=I3Jwr2863IwvTyt8rIesT5B4EmUN6ZSp9+nE03iCMcHrjBZdHlSmspNb
 dH8q+N4S2CI6Dd6uBU7T/cHP7zFQi3T6MPevN0oJkrcPPZDLoIL6LECOd
 zQlJM699JJ2oahSnsVTTynuCsJua3RVAGNApG+SKPz48UtqOqI/CZfcvc
 7o3NtcX00RoLEZ8ya9e4LFTeJDyDRpp7idLhOU+Rwv4YXj7lpWwOlVz8c
 CtuJcBbJDNe8fhunXKgvcXvqtWEJgZjGRK7/b5iU6Kuo9/72yS3CYUbQ1
 7Xg0DPemV/63iMJwFHWfpM3jVP65tZBGd+q8SGSO3h7kAgm38tniEXkno Q==;
X-IronPort-AV: E=Sophos;i="5.60,391,1549900800"; d="scan'208";a="212581735"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 05:48:17 +0800
IronPort-SDR: TJuS1WCOBVYuUYtHFSBCKQesB1Clo8zQed/I1EYcbRJlgcR1BKc+rxt85Eommls0G786/QpcoJ
 Th8SnQX0j10G7So75YZ+DvuCdOpZWVkZJ9fqyaHS2TCkhc+Klkp/CEHmRQEtkmeW5Q3kaTQ5ho
 unsBkd3oxF5DFMAaO58QIMmp6cJ+hFCk4WQQCX7d0OMGPylwSAMPOHnWE+MPZX9xq20XFc5ynk
 esS9W02I98bJhBBIJ2wRY04ZaIVIrz+xlqWYS+wsFXisu/RoXkbpFScf9RATHwBgWP2idbES8W
 VvrB1YivInhPyYDoz42tVTa7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 24 Apr 2019 14:24:48 -0700
IronPort-SDR: cA8Pn8xMaeGPLKD0hC4+vltHoBCtchkGIiqudpnESp8NmKBaTjoiXKS41bTiOiNWrzF7vWkZ7P
 m8Z0xCcmbaR1LRGGoj68XUI7WmCKUQCNpEKcom1TGicssBlz1FNCC4nSu3sRDZE8ePpKOjrG1p
 kZAqSRIqoIgjihiiuQjlAyo/+INIAK1vY5MnN6vr4QBnvjRCjM2OON8m/g6eCQnjO0Gx7H3hbQ
 r0WTx5mjEwHSukDLGK/tUkbMz/RfhbGRlH0QGYAGQWbEiTjr9Tl7el00az5DdhISI86+RvmW7H
 KrY=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2019 14:48:17 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] RISC-V: Fix minor checkpatch issues.
Date: Wed, 24 Apr 2019 14:48:01 -0700
Message-Id: <20190424214801.18880-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424214801.18880-1-atish.patra@wdc.com>
References: <20190424214801.18880-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_144817_942000_8AE744FA 
X-CRM114-Status: GOOD (  11.20  )
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
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

While working on the patches, I found some minor checkpatch issues.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 89251f8ab754..0115db1368a4 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -42,7 +42,7 @@ unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
 
 void __init smp_setup_processor_id(void)
 {
-       cpuid_to_hartid_map(0) = boot_cpu_hartid;
+	cpuid_to_hartid_map(0) = boot_cpu_hartid;
 }
 
 /* A collection of single bit ipi messages.  */
@@ -53,7 +53,7 @@ static struct {
 
 int riscv_hartid_to_cpuid(int hartid)
 {
-	int i = -1;
+	int i;
 
 	for (i = 0; i < NR_CPUS; i++)
 		if (cpuid_to_hartid_map(i) == hartid)
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
