Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9846EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSCRjkOl+C4TKvtCdTFkkI/8aoeNiGLIksWI0TAuLxs=; b=moO+CgIA+5VzRN
	ptJyRzCARywZS+vb0yRW/+WKqyp3it0o/iBQb/crXg7UjfQ4gnveEzyEYaU3N6IKuFB06Yohg/xps
	naJQYMEkIyzH4bjQOobLGKaNJiw8xgFveIBhXMxT5FIs+lsk1cwNZJVPzwjtyRCb1qsp76RaQvLcS
	oM53NNl9PL+W88Coin1DNhgaat9u7UCONRFy0SA2kxQ3zQxqttnSJEy/3LgJ0HNCsQtxenniOmwnk
	RsYPBtphaAX/fZa/bQl4lmuyggi8TYKmh2BLxWu3p678SO+51lV9GC6tEK6ZOeadAzxOHJth/I7nN
	wzSZkGb6oaej5b1JiJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQu-00B55M-1A;
	Mon, 10 Jul 2023 09:43:52 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQp-00B52S-2h
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:43:49 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-78372625badso205900539f.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982225; x=1691574225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWvqokmp7r4qpLb1zZr/K+Grf5K67mplcBtMET9ZvCc=;
        b=GuLbKlzbbm4+IQ1CE2fG/Sh0nv+IuRFqdVmE9lHlCnzZvCYcJ+fNJwYSnPgIzs+2LV
         0IumeDVWpjLHWIAwGn8ZjRZ0r1R1/9vJRUN9TaFiD3zMurfzY5FyomAvdQdAftRrvSlC
         72NrgVLlgcFtJggqHFSs+M/7UafyA2H+VYl6h8Yf78Hd3q4y5NOQ7MzGdq0rbQXFNHYo
         1NHVjpf9Dy3tZWu5EWaO88c/SG2Q7jQlqvSa6npE0kZuPIOt2Vl03C8cwLz1ojq3wVsL
         lBJfnTyUc+N4gS4/WzoxhxqCjVAfxLl19R5srAdH//IlLNZqP53SsgxbqhNDM/8ZvGcJ
         eWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982225; x=1691574225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWvqokmp7r4qpLb1zZr/K+Grf5K67mplcBtMET9ZvCc=;
        b=VbhP2P5/C1/A76eAYVAA6Bfjg1ML2EJ8Bs3v75jkg5DAGFyGT11l3H8ASHNVkeU0H8
         JFCiWntDZO5Jjebbf6GyO9C/JnHk+liOxzwEYMuOswoIwLupGvZbRqiBO5UE+bLCBKt2
         dI4FNtRhvS9MkFHjLGIDcqX1D4od+ANsmYTtp/RFQDHgJqlxDLA/6P6/UErl/F/bbMmn
         AcqMFyLEumxDrR2byJ/9gVD9lc8OnpyaXxWSK99Wv1OI2/Yf5LRYD33P9u/Wi3f0hUEX
         bT3dAu11TiXrH9mezz0JvhxYNH3FwX9DZzn2MbblwESMvAgT3N8PcSFaHgyPya1UYFVd
         gSHA==
X-Gm-Message-State: ABy/qLanrw/GzCy7azuQ7xATIbWHeS2oau1kSgVOcjfPgEP4t3tN68+s
	hm4tE1L9cdfOW8VoPBDQYMUcjA==
X-Google-Smtp-Source: APBJJlFEyLkIuL8Wq3Jqu7Z6swRF/VIvMb80OEnwDuIryYk6JE6AjqCkbB4cESzshC7MW2kIN8b3BA==
X-Received: by 2002:a5e:df01:0:b0:786:fff8:13c2 with SMTP id f1-20020a5edf01000000b00786fff813c2mr5491462ioq.11.1688982225538;
        Mon, 10 Jul 2023 02:43:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:43:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 1/9] RISC-V: Add riscv_fw_parent_hartid() function
Date: Mon, 10 Jul 2023 15:13:13 +0530
Message-Id: <20230710094321.1378351-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710094321.1378351-1-apatel@ventanamicro.com>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024347_879904_ED242CBF 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add common riscv_fw_parent_hartid() which help device drivers
to get parent hartid of the INTC (i.e. local interrupt controller)
fwnode. This should work for both DT and ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  3 +++
 arch/riscv/kernel/cpu.c            | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..39dc23a18f88 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -81,6 +81,9 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
+struct fwnode_handle;
+int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid);
+
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..9be9b3b1f333 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -96,6 +96,22 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+/* Find hart ID of the CPU fwnode under which given fwnode falls. */
+int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid)
+{
+	int rc;
+	u64 temp;
+
+	if (!is_of_node(node)) {
+		rc = fwnode_property_read_u64_array(node, "hartid", &temp, 1);
+		if (!rc)
+			*hartid = temp;
+	} else
+		rc = riscv_of_parent_hartid(to_of_node(node), hartid);
+
+	return rc;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
