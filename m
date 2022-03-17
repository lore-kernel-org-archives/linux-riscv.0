Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEC6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hieXk1pMTGmoreWPg37KtvxbIvhKPQTSx1ek5Y3pNtU=; b=D3yUPBChCyExwA
	KQHpj7gyHGyJCkT0WuwmExa/Pq7QPWVzv0xTc8fUpnBjf3ttuw0LJlw/2y1j+jM5oasTtPnsSg9Nf
	ErjNR4rOR5pZBroAy/xzJe9ur4625XBtqwpCzGjBbMo5/N6Xte5SWHBwdJiMUFKb/IBkndOSM3lJ+
	0dACVF+fYJQ53/6YnOnXPbO2rWVgVFLoys/3fmtO4Ko9byq36a9Bzx5iOmQkB30m0L5TqsxCnMI2F
	ge6V/dv7NwGgdRK+YMuZIOcoT0GgcOtA4g44utGIh4QTL7BKSH0N90QgM1TSOXU/AvjAkJuZUEQj9
	ifRmhjBJSdjQotR2dNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUhF7-00ErWu-CS; Thu, 17 Mar 2022 03:56:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUhF4-00ErWF-Ub
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 03:56:04 +0000
Received: by mail-pf1-x42b.google.com with SMTP id t2so5774949pfj.10
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjOHj/8BATPBP0IusStgCkjkvXpEOFe7FfCA17j19dU=;
 b=o1u3cr7gjNAmLIFszokjYtRlBW9YgENKNSlekv8UL8chTfVfPdo6wVkoY6bwpm60l6
 l3jwfncEOHo063kGAFw3R6s40XnNCmp8ZGTK9gz8JM69rP4B5e7w2FewsQG+0kY8xkBE
 VY11XP+IZ7GEHIlyOyh7s8/Rbkdl9MqIsfNeSmI6fiksjsG4xzEalnCm8D4AwuPqOO6S
 uXEKkzZkHrHl3dLpgT9W2dx3xNS3+P6sjXgIYRYKxv6lZ5nlA4sVTQMiGVM2+dLHvn+x
 s9Akgp3UHRCkylI1xF2HXF6cpEaW//VHHRTxW+JxEouHH72oSD9c91epcZkwmiepKuMF
 1+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjOHj/8BATPBP0IusStgCkjkvXpEOFe7FfCA17j19dU=;
 b=ca/zT/PZvQp+f7filAf6ke2NWzn0mYCAsDdgrTUlqVXhQh4SYiDtIfSfZiMy63kDxq
 AMQQuMnMg5EqWOOuV8OEksC/iVwUEt0bwYMHOTwaS4zDvefifQ2MMK1NoHNXsIaJz5Fx
 j7oMe+nyPnsgdZrOvKQXAaOhNGKlKjBcXSVLNdZrLGnT09xAyImdxadjvqHCnJSWul4g
 gi5DVbdQhL4zyVG/P8O5Oyvh2+SfWkvZlm/wv1C4vJvUdqhz5eJlNIncdJ93SWvoQJMc
 SKCy3SE6mIqcawzDkhbIwBDdqmARAM/qGVtpZ6URI59VGfwMG2HKklEhGhm1A5g4J6mu
 uaJQ==
X-Gm-Message-State: AOAM533QA5dFGlPPdwRzYHqkbcj7GqiuMOZ3t2nhKHQrcClp7Im9SzcD
 lFGCkv7/p/USufrCzH7QFnf/RKR/pJhmjQ==
X-Google-Smtp-Source: ABdhPJzI9v1AsK1frl/OfapPyfUjcQq9CI1+CjtXBFdgE2i0TOisHVwLb4aM0S1NFFwVdeouAbr7lQ==
X-Received: by 2002:a63:1743:0:b0:381:42cf:187 with SMTP id
 3-20020a631743000000b0038142cf0187mr2035408pgx.397.1647489361831; 
 Wed, 16 Mar 2022 20:56:01 -0700 (PDT)
Received: from localhost.localdomain ([122.171.160.59])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056a0023c900b004f736d081d9sm5184749pfc.64.2022.03.16.20.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 20:56:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: Increase range and default value of NR_CPUS
Date: Thu, 17 Mar 2022 09:25:42 +0530
Message-Id: <20220317035542.272547-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_205603_013325_6C88422A 
X-CRM114-Status: UNSURE (   8.84  )
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

Currently, the range and default value of NR_CPUS is too restrictive
for high-end RISC-V systems with large number of HARTs. The latest
QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
restrictive for QEMU as well. Other major architectures (such as
ARM64, x86_64, MIPS, etc) have a much higher range and default
value of NR_CPUS.

This patch increases NR_CPUS range to 2-256 and default value to
XLEN (i.e. 32 for RV32 and 64 for RV64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..54f125eb10f6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -274,10 +274,11 @@ config SMP
 	  If you don't know what to do here, say N.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-32)"
-	range 2 32
+	int "Maximum number of CPUs (2-256)"
+	range 2 256
 	depends on SMP
-	default "8"
+	default "32" if 32BIT
+	default "64" if 64BIT
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
