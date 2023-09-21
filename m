Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516ECE71068
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5Ppkv48U+yE2gtFreozAlmaqi7OxyU0lM8X4C+xZJ0=; b=hELpkZhy+b3ny2
	bpWokt/tgll5CyAmOtzLxY9zZc5CzQyqx2py9wYNykr+p2BtD49kgDeU3rZsxRM2z4cB96xzIx5Pb
	4WOCjrkNX7bY77SxRpMEHF2jFX/Fm7C58GHeV+mCoPJJRrlWNh0C6t5zKzpr0EAjtA5QHIdbgeq+G
	lzuMnIQvm52KfkCYLJZkVRMWnGcJVVfyZm/TbK8I3MRIHGeB4Qbp+xd+9sGhn4aShmJ75VHomyFzO
	6XxC8K9HakOGzaQme6bGaYA0mCVyNmtQxO/fmaycfVxaYWh+wTb0zfMu2Sf7k7wwX9qpdktjHVNqq
	hLDj63jZhen9fUt13Eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDQ-0064Aq-2G;
	Thu, 21 Sep 2023 12:55:32 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDN-00649T-2I
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:31 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so849116f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300926; x=1695905726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idwTTp5Lya7wqztrKsyNzkY8PmsRdpyE5x+O/k4qLnA=;
        b=oEUY7h86yJLRGNDhkraceqF8QjMxriDPR+DPusjtr6891DuEA8IAwpfWNvCNNxOxou
         ch8W5RRSVft343O/3wr6PCMBDf/mbQFTRJ293AoPxL7VOBZU051RAm4QeOync1orEAyu
         BPNy1Pw3DnTldifkFcgsXI2SnJPUO3/ZkCjhwZDNg2HStxjqaSCvu9MDG0pi/J5dTGYZ
         AXNcfaPUEcAbK6q5/u/jCYzAjIscOQWP4XSCxCo1Q5iX2puSyaCC/nasdVk7Qn+w0iql
         LPUhy0rrexozmNnzXTfeQkl9tmaJyUdulI3zkM0nDCITegto52kaFtlJS61HmtVFQU5I
         XCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300926; x=1695905726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idwTTp5Lya7wqztrKsyNzkY8PmsRdpyE5x+O/k4qLnA=;
        b=Vu6TMmC2EWO9F1YcyuHftZl3rWMOUfSEGc12R5rRyQrMXYPeuDgSTgdW6RIpOF3sAQ
         RVwy5j1enXWTB5+P4pkI6goV4L8xEug8lWNhxWc98yEFtq5XpwYiEEnxlVEMBa2NF3zT
         ZX13LSUFkWPYtLkHhJ5/HUkpsrrczyyDNZINhGyt9UCT7whPjarKiKqTKNPVjGK89Bre
         kleFhh2CoN7WYLHveaZpmuTMr8k5rkHt4CDp2bQaZAWK/EQje7W0kv8pOjO/4X7cR3kM
         boLng8qw8qzn+vFgnj8cVyTAUd0Z4ICjfRxrISJXmTgcbrgVYeAlvKE4oeSitseTL33S
         rHxQ==
X-Gm-Message-State: AOJu0YxLxGh2vVwzoSundT4TVhHHa0VU7o9x2gN/TtX2pGokj8epjrWh
	0dOOXk59nuucKPvdHfZLOBbZQRHdqdos5dVy5LE=
X-Google-Smtp-Source: AGHT+IHX022KpB0rCfWfH5vQwK3pl7eJADYGr3mkNitHW07LlTFRJF/gsb2uDbg8XrGWUKCAcToz+w==
X-Received: by 2002:adf:f741:0:b0:320:77f:a982 with SMTP id z1-20020adff741000000b00320077fa982mr5102265wrp.45.1695300926795;
        Thu, 21 Sep 2023 05:55:26 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w10-20020adfd4ca000000b0031762e89f94sm1697606wrk.117.2023.09.21.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 5/5] RISC-V: selftests: Apply which-cpus flag to CBO hwprobe test
Date: Thu, 21 Sep 2023 14:55:24 +0200
Message-ID: <20230921125518.175428-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921125518.175428-7-ajones@ventanamicro.com>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_055529_747683_790B9B29 
X-CRM114-Status: GOOD (  11.57  )
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

Now that we can efficiently clear cpus from a cpu set that do
not meet a key-value criteria, apply it to the cpus used in
the CBO hwprobe selftest, instead of looping over hwprobe.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 26 +++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index 50a2cc8aef38..375a343bc2c6 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -135,27 +135,19 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 {
 	struct riscv_hwprobe pair = {
 		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
+		.value = RISCV_HWPROBE_EXT_ZICBOZ,
 	};
-	cpu_set_t one_cpu;
-	int i = 0, c = 0;
+	cpu_set_t tmp;
 	long rc;
 
-	while (i++ < CPU_COUNT(cpus)) {
-		while (!CPU_ISSET(c, cpus))
-			++c;
-
-		CPU_ZERO(&one_cpu);
-		CPU_SET(c, &one_cpu);
-
-		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
-		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
+	memcpy(&tmp, cpus, sizeof(cpu_set_t));
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&tmp, RISCV_HWPROBE_WHICH_CPUS);
+	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 
-		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
-			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
-					   "Use taskset to select a set of harts where Zicboz\n"
-					   "presence (present or not) is consistent for each hart\n");
-		++c;
-	}
+	if (CPU_COUNT(&tmp))
+		ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
+				   "Use taskset to select a set of harts where Zicboz\n"
+				   "presence (present or not) is consistent for each hart\n");
 }
 
 enum {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
