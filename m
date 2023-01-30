Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CCEC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2MCUt+o4//9Aoe6E7Dk8yL8KCjiIqS1iM9JNOEIac4=; b=eGh9WpTjsbjO9Z
	kkSssKjdFX3ggpTAWpGMlANkYFUYEmKcTcz6nWg/j2lyaFThSXvwujabaD4UhWU1bhqYHNyKuGwS0
	/Ypl6GEIAMS3h+/s1EY0TRy/7gBkS5mib82p6ePpEjaKRKHnAIIdU0EbgpzOJ6ZjH9ClkqQirLBK2
	3Q9o5ObBz60VSZs1XMrOaOpye3CFpozNMd8KZuoAEi8oY7MGG1gCGSC5IURh+Cr2biguAFjuZJUnP
	kaZ480soI4vnG/oNoGNjgoetBLv8qB5k2uhZRn1RocbBpuBgMQbcw/UwMhP1T5LzO86sO5j+F27l3
	ppp1+uCv92aGVowvPo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYsv-004zoO-CN; Mon, 30 Jan 2023 18:28:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpI-004xUG-Dh
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so11350980pjp.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GmsS1bMG3vhs9nYaH5ehvEVh7IMrCbQji3r9uemxws=;
        b=FdQa5Nr8gTa9dhRoHNHv6DLl9MMrt0b8LGra3FlgdVR0HXDLToZe7M4Vw8FA842bxO
         ANogiCr8CkEluK5rksyrobBwZAKJ8A7G98bpLiz8xri62Tumhak9vvXobe/T1z4+dIij
         Jlqnftn2IXrjlaveSNTGwhALA2SpVI2d8kvV9HY86Y4JMm+idqkTZW4FJJkA1grLa2sm
         x0PYL9hJD9yklIp6Iu+3fct8g4Ub4r9NHKkc2cqYsfctvGHE+Vyr3INej/nu/6q7BWpl
         03u7GIFOwrw/uDqPq7+wghYTYt8n5mYmkRz3QQNQr2axPeRxPYEMQorPSn4SyB0vyC3z
         ggHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GmsS1bMG3vhs9nYaH5ehvEVh7IMrCbQji3r9uemxws=;
        b=RQVW179CnMXvlnBRGxVYtIKoDlmU4EGIvLWUBVl50BQCq93/ZmPpil5r0MuLiLsH4p
         45aIRtM1JP6gzbHsD2Lfh01ABAvNNbzkw+OfGHpQJ6DGRkocrlbjlPrRz+lKy5qqXJ74
         flmaCY/r48g/6igBysN9sh2Ux4Au5iqANxytxTSbte4EKYapEDDEzHtoDqkzec2YndAX
         UG6dsQzk3KkxyoRkCvR5LEwr+OLReCP+0UCARYi2H4S1o6PyY5XECTwUUN9HOEgByZCl
         wcuHB2/OUGwBkbW6133rVr3S6pn8486anwVlJlBaKEExHdcVMntj7MO4vsYKJrKacjNe
         2J+A==
X-Gm-Message-State: AO0yUKVBiSQ/SuzVgE7IsM0mW1EpE/ELjJ6XZy4rY1+x0v4SdYsIRmPX
	tA6BPAujvqm+vvWElwtOrFzA4A==
X-Google-Smtp-Source: AK7set/NaUdxXOXi68TuA9LtTnJuAZDAOVCnERp8kT07lTkCp48tqSeuSCZp3ML1m7atqGjopshDlQ==
X-Received: by 2002:a05:6a20:841f:b0:be:7d46:e5 with SMTP id c31-20020a056a20841f00b000be7d4600e5mr4161873pzd.56.1675103059928;
        Mon, 30 Jan 2023 10:24:19 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:19 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 23/24] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Mon, 30 Jan 2023 23:52:24 +0530
Message-Id: <20230130182225.2471414-24-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102420_499152_CCDAAE5B 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPI defines few RISC-V specific tables which need
parsing code added in drivers/acpi/riscv. Add maintainer
entries for this newly created folder.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5c25c20d00..b14ceb917a81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -450,6 +450,13 @@ S:	Orphan
 F:	drivers/platform/x86/wmi.c
 F:	include/uapi/linux/wmi.h
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/acpi/riscv
+
 ACRN HYPERVISOR SERVICE MODULE
 M:	Fei Li <fei1.li@intel.com>
 L:	acrn-dev@lists.projectacrn.org (subscribers-only)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
