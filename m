Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59CCC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qFAM7KNs73Inb1aub2c18le4hrYiUeN0d/TAI5bhm0=; b=WY0d0wfCXI4jBr
	tOYn0yMEh6JdLIXFY1OjMt02LlsrD2J8LY29baB6XpgvQ3Ibv3E9iwCRntK8TCLv8hpAk33Ejo6kJ
	D9oyzC3JVsw/avur+M2ybCM1knt+pbSw53H/C8SnZvisMx3BllbcmZSl8x0c9G8xfEj8yITXWNPCt
	3+9kSICKi5+pWJLMT+tHzy5ZB9Wt2jW+bHTzGxZYGzDQ1EkYK+sQd/dfpNBu0zKHaDqvl6wJBE+Zz
	4/ffvWUllfKCiyYMcGgILUJoGKpocD7U1WdgvPdPtyjD8Yv3EtpEs+Eb27ch+mANLWIPnFyRW9aPg
	IkCpSsLEYLrKJPt8JosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rR-000kRf-0e;
	Mon, 08 May 2023 14:29:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rO-000kQA-0K
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-643846c006fso4908740b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556145; x=1686148145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCnijZqZqbTFwmvqbOqYG9D3eO4SsXuxft0NUX8zz8A=;
        b=nsRbPLksBMxCFlI4Dk5W+JxUo5zwuNx1VEvGmsPZxoLBxbf7fhQP9i9unfigIlTOGz
         yBuJmPoM8nOnC5hnhATZOfDLAyouQ2Q7WduLsqd07D9e35BWU5kpZVAKtyHp/i3vATYz
         rjmsbzldIuJctLEnJmHxe0Ab8RabRHamwkH1Y2UGs20FDaQ+aPapOVNTV11A/sf8VxTF
         C1uahOKpgwutooogbk3seey0VKk8V0YhVIHz4k77bIvMfaA+CDPWhyz7WP87x4LYfU2u
         94KStMnCfY6REGFJu8024uIkI9tQIuItHRT+VxNw3MnYO7oXswuE1gHKFDBl/FPRvUqX
         wy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556145; x=1686148145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCnijZqZqbTFwmvqbOqYG9D3eO4SsXuxft0NUX8zz8A=;
        b=RpfEDVJSTtA9Yq3PaGUryo1H8cWB3LEdtJFR70K2OCpdbuPhIJCnCHQE+Ka+bBc/Bi
         wZsvflsz0AlQjEvh3aMSuYDfdeaNo3MUSreCJHZVNjbARC7xK4P0Yn5bd4d3uonfe0gR
         xUgd4dAP2bu3UrVfVgYzrUigK14/CUl5fjpUFyPoIAx3Le5ZXig9lrSf1YRhqbJIdUCO
         0dFScY4gdktTkYanad9u94pMgAUeJ/NMCNoG7MrILv5XJ2xlcwbdrB/3WnPy5gm8ln1c
         EIg0T2tBiu9vW3Hio/kntJkMb42DTVarkPH0KDbOcKoL9Lqd4pWf5pKbozzcZ8XTIBcz
         E/LQ==
X-Gm-Message-State: AC+VfDzOF9DuS0m1F2JxeklnW4WpVs6pHixHlpaiRAInUtLjDbWrv5ta
	njgJK836l4lk9BRcWEkJVBcCAA==
X-Google-Smtp-Source: ACHHUZ5kRlrVSUMiHnzrjpy2wrojD8fr8xn1cSzxwM+Vk7Xk0AkQUAUDShOnn3rSFg9njNf6VATOLQ==
X-Received: by 2002:a05:6a00:a21:b0:62a:d752:acc5 with SMTP id p33-20020a056a000a2100b0062ad752acc5mr14331891pfh.32.1683556144804;
        Mon, 08 May 2023 07:29:04 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:04 -0700 (PDT)
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
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 01/11] RISC-V: Add riscv_fw_parent_hartid() function
Date: Mon,  8 May 2023 19:58:32 +0530
Message-Id: <20230508142842.854564-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072906_140164_13AD3881 
X-CRM114-Status: GOOD (  12.23  )
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
fwnode. Currently, this new function only supports device tree
but it can be extended to support ACPI as well.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  3 +++
 arch/riscv/kernel/cpu.c            | 12 ++++++++++++
 2 files changed, 15 insertions(+)

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
index 5de6fb703cc2..1adbe48b2b58 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -73,6 +73,18 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+/* Find hart ID of the CPU fwnode under which given fwnode falls. */
+int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid)
+{
+	/*
+	 * Currently, this function only supports DT but it can be
+	 * extended to support ACPI as well.
+	 */
+	if (!is_of_node(node))
+		return -EINVAL;
+	return riscv_of_parent_hartid(to_of_node(node), hartid);
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
