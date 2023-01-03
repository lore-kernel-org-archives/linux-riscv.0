Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09904C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjCN/Ply8bmJrsQCeVAlqZYI4/zNM/8aO9MxbbFjPrc=; b=Ys0zPSeiZBGffu
	/iHrU2+CQFEB1Zihqcqoi/U2PbvQLpWWvM46lW+fCvv8XpCT0geY6atHixTmO+y3RtNwZNwQs58E8
	kODMhDevbUxyZTeMoaReCs9elrWoH+Ck75wt7iIRwrwG48mvbyIJkV3DTZ5JmlhfPAKXeWcI+bJlg
	u+NxmuBBD3pHYeCH9x+tliLmGj9oFJiA3CcwCPaog5LERr5lVlf+RyEZzu9Qr7Oc1cPUyEP5AaUba
	asm2C50lpoagc+ZOmlub8rAf5MwQE4rQFC2Xs7JiXQBEu+x2KrAIGouL7hjGw2xKDSTxZ4wZhgq/z
	brEJhaOcBXVnZunfq0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkmt-003Fyh-L5; Tue, 03 Jan 2023 17:09:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi3k-001rbQ-GN
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id z7so14946680pfq.13
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjWQ9F0LaanvIi9SVaFlkrqw0WGzFdxUF931tj4YTWo=;
        b=GZYVbitECZoAD3ey9QrMfJLiWi/l3+YL/cWg1JzO1nEzdeiaUZkCF3gCUl7Tk0Z94k
         ABJ8gC8Q0sOTdWpEXCrp4WrrKo4DeeWMs1QMADuHyb0qhckjOYD6zeVCYqL2BvVBdTUy
         uw+FLxBFbVQearylGjJ9Pl4QIjAAzRkUwDK7iZrV4N+d78BEHyeLkaP4bQfvLaO4dofJ
         HtFaNK1XxPw7PDSfRRkzFQU9IZroxEyfXEFqwQaj6dCk1LF/oAvKIT4gpf4zePI/8ijm
         4nbgogtin1Cod/6Ae5EXr62dRm1YRLLUC+36silPmflY8kwSkKK5bsfW8Kso7k3Akexq
         gpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjWQ9F0LaanvIi9SVaFlkrqw0WGzFdxUF931tj4YTWo=;
        b=rkLBjd8oGKxQX1P+q5vN4KzePJp845WoOsmpTkZxsxY1cN0q05+zIu6UvHpSrYlXB+
         hqMtXUNSfKfejPiC/0b+2QytQkCnGvnMGXQT+EBQA6TTUokAqT4/pxsVBkb2E/Kacv9x
         7xlstLLpF7dc5eXGPrTS/K+VzR7/tlDbymElWRNf5P+K/a8DsyTyBbZu8xho8wGinDRP
         XoFw37pXB3N37OeY/pPsS9zq09bNY/oKAa+tUcd8cAWXuhpXhwvkqs0L/C+BFKKkLptz
         AmTXotHr9Cp5tiVpXgIDrL3yw/OktQ3DAT6rImnaxG/oaZY9E39jjvBZuiYOjE0bW55u
         pJfA==
X-Gm-Message-State: AFqh2kodx4UN8UR5oNLlnBGJhZNW8I+0ka3C0gNGgyHukRxWh39Er6wf
	fEKyxI6YBZDqNPkqTBb8FrQqvQ==
X-Google-Smtp-Source: AMrXdXvf/gvvn3/oN9lIhKpzGY3lwKjFoI6A82HnYpIyBCDuDPQ3CtXCyMnpDhbny2VDXnNqlYISDg==
X-Received: by 2002:a05:6a00:1d9d:b0:566:900d:5af2 with SMTP id z29-20020a056a001d9d00b00566900d5af2mr47650556pfw.34.1672755268316;
        Tue, 03 Jan 2023 06:14:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/9] RISC-V: Detect AIA CSRs from ISA string
Date: Tue,  3 Jan 2023 19:44:02 +0530
Message-Id: <20230103141409.772298-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061432_683325_CB88E2A8 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 8 ++++++++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..c649e85ed7bb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,10 +59,18 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_SSAIA,
+	RISCV_ISA_EXT_SMAIA,
 	RISCV_ISA_EXT_ID_MAX
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 
+#ifdef CONFIG_RISCV_M_MODE
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#else
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#endif
+
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..a215ec929160 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
  *    extensions by an underscore.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..3c5b51f519d5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
