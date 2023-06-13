Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C599FEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9WhNXrjfnR5Rcb1tyW/FRHijMUfJSbY+n+iuKCR8W0=; b=vdorHQAdlgGFdw
	YiTyxUGOmskdFjE5fc5gO4ncHu1yFcp9TvblbsqXQbMaFFxlz5zSwJqkOi0EZvCq7lPQRDyqNG+et
	z37nfTvltHNmqOHYzk2UsptMS04TGEC8P0xYgalbBgjd2RrG9O2V+4w40K7vfSCggBTzgH8qS/XYS
	10u3i1oBWNWiZSets6XnPYnFN6W/VgTwkzDcipEc+eJSv8lWfTXs3ObyOq5KEzpM5IIxQWgsnfFcs
	8bgDBqrxSIoV3b2/3UTvx1aORSYYBSK+4xcxOTy1ySTK5ci1zok5+rKkVWuncD4PjSSI/4jCngnsv
	oNQEFpJN2ZTfXt1Sp6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q962h-008Tq3-31;
	Tue, 13 Jun 2023 15:34:47 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q962e-008Too-1l
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:34:46 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b296cadbffso3041884a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686670480; x=1689262480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaKztkphf6Bxk7epVR1Wqf3vysiYNPTt+hK5SRnwDA8=;
        b=oeYO7hapZBlaFPJX1SWGXlckvFpmgvdEQoR7Hdm+8KE+HpXFwmSrfNfkCAR9rHgKHk
         tT3q3cYy257vFWErU6BWhttTkFNTnmi39WE5TJXcJ8/IuT2xmK2orgTRvmsiJXVcIXnB
         /HRCq16h0pKYGI01r/NNH+vtdIEBQiPOof4pXJVqdaQkw/86ifq5mKgtffxZHwdPVE7k
         UoYfVnqTiE5i8yAeJe8QWotssx5NiHuyq13oMHjW8lubXHGzxkvTgfeK9aiP79UaZQtE
         5emH1jKV9m0myuqPez+BXC+6wvubfxpN7p3PF/54FyqRj3hLSVh3gdp2gFDTxdyBvUpl
         egWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670480; x=1689262480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaKztkphf6Bxk7epVR1Wqf3vysiYNPTt+hK5SRnwDA8=;
        b=BHCzW6pElHLU5dZUXHBX8CQVOy1ZIJVopokbNjgoi1He9nfYOFdhZ0v/HBwWDXM/P7
         Tf16q0Wbugqvis9CPwiaX4o5c9HuESJZuBtyxzurkHi2TP8Vmny48H9PoHOKNau7zKBw
         2Q2joP7tS62Kmh8YQV0wVqI4i0+BlBOc/jcmL68V59+dPjY/54xACYPL+AwA8GKcjrNT
         fSTqZo4FMV2+aug22qmioPGFwsj0yX6NZBAuvYuJ0K5KG+VNpOKWO5DTTIzaoutlyUls
         ouBNVFX5GRCasBZlS6WQUKmiANd35YWOYNSCt5laqSJcDq27JM15tWu3tL0c3ezw9fAI
         tZmQ==
X-Gm-Message-State: AC+VfDxHMI17k9cQZhG2DRwUiAp2TZNsc3TAiPjj3j7+b4md0K9t0bFG
	wo7l8+yn7e2rhkGaxFwDOZ4j8w==
X-Google-Smtp-Source: ACHHUZ5bFvT8beTRSpq/IpBy8h5mVYBspjf+Wsvpe0B+YtIFMJxpp8SFXQt2G2tf2Mp5NyW2jc9/NA==
X-Received: by 2002:a05:6808:87:b0:398:f48:eb4 with SMTP id s7-20020a056808008700b003980f480eb4mr6986593oic.36.1686670480558;
        Tue, 13 Jun 2023 08:34:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020acabd02000000b0039ce305ea4fsm1630807oif.14.2023.06.13.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:34:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 01/10] RISC-V: Add riscv_fw_parent_hartid() function
Date: Tue, 13 Jun 2023 21:04:06 +0530
Message-Id: <20230613153415.350528-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613153415.350528-1-apatel@ventanamicro.com>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083444_588237_F8F53428 
X-CRM114-Status: GOOD (  11.02  )
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

We add common riscv_fw_parent_hartid() which help device drivers
to get parent hartid of the INTC (i.e. local interrupt controller)
fwnode. This should work for both DT and ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  3 +++
 arch/riscv/kernel/cpu.c            | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..6fb8bbec8459 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -77,6 +77,9 @@ struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
+struct fwnode_handle;
+int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid);
+
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 5de6fb703cc2..67b335789b22 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -73,6 +73,22 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
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
