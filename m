Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C942EC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 00:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIQuw4dambX5pkfFZCJvVhhhIdmhOa6ufPwTEiev2JY=; b=ixJ3bmBasHynCC
	dAwxbVkzdhura/JRDeNwp8mIuw+wu+a0ERw4+kWrJ67s/xKCdsumXynlArup7RQmsrS5mwo5Z1bxT
	a0gCDuR28n628bcfHWgfhzq8P4ClB/jx68Uz0coqFfsL1gZoLvUO+T+INOTEJ/4pNWbrekgdf3rK3
	4efONHe1oylHPQUKDymrSQb8DqnKyY5JqZZ17J0X2alG2MkhxGWonpAthGAyuwNLfg5EA14qBKwJz
	uN8iXsJp8XD8G5zlL8geUguTlqgn4qo5D40T4n1xAQ5aTcQjKXh2jfJ5ocqhG8TDSBsSy/FLpeeES
	OsWamADR9WE83O7MeeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLDua-00G0XM-79; Sat, 19 Feb 2022 00:47:44 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLDuM-00G0MB-OX
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 00:47:32 +0000
Received: by mail-oi1-x22c.google.com with SMTP id j2so4886309oie.7
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/0FNgv5lUN8jWi4HV9B3F/rz6WuSHsRs+ZuBRv8FFI=;
 b=ZiY0wwJ0SqisQuu6ArfKe03xg+2W+PovMKQyGMyksKruK698BV0tgUOmJQQczbB4Xy
 es5RPo++t4bQEgF6wzMapiJTWPReNgRTwNNnnpyDJCfbCrFvTWOcPHowU1Vwl23ky6QG
 DLN4/uaRUwaGd6Uiy3y+l0wMQJpMBa9ezEV3oMztup72dpEC+uY7NTrt5/fnJI8q9SwT
 XepPFmnUClJGgK/xmhL+gQhVMQdh5nP1IFVL0PN3g01vJ0kc/FXov1ooooas1J6O8XfN
 UX3AvR6/Kpz7g0WdEIyp4lPJ9SKAa2nSDYRPLrxuhBE571zxzuyKjTZXPQkW8/0ZFDVF
 Btqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/0FNgv5lUN8jWi4HV9B3F/rz6WuSHsRs+ZuBRv8FFI=;
 b=6TfgDX7veUALcCEHWED9cfykKDGwHRrbsKgAMXOmYP1NR/2xKsQ6n2pZpQfqnBWmUg
 C5GLtD0XOIhZNHmSdn1O4CP9y3w6T0vYMf9sjhouLD3SkR3sNYrDP4h9W5RLoZXhsiln
 RWS3C9WxRB3oH2qKVt3LSlaLpBFy16n0gayTLkBHUdxCU7AX0MQRsa6vAC36dcT9RaKL
 mrH2FObIK+L0mcMGHW4BCOqYAGRQR5A/cJgunlHJoJu6EnFg1Nx+MPCol85zTMO7Fy1M
 r2WxBHR1jbirHFokFcPYOhrnv1lh0/6ef1oEz9ZkWPnY3PkSduKzUFy8eJHX/fGJv6e8
 z5DA==
X-Gm-Message-State: AOAM532d4CUvH79u9F1LII8CLtJSLdnCTTYUm2YubvXAwjAamYuYEzPR
 wbhhe4stxlOKuAqOima/Mz3R0A==
X-Google-Smtp-Source: ABdhPJzRQen7NvHhjcQNsc8zdzkieqqweNi8Zrd2NfXxhR0scCdRCj2ZIJPPYhXkW27QcvKyFYXfyg==
X-Received: by 2002:a05:6808:190f:b0:2d4:b3c0:193a with SMTP id
 bf15-20020a056808190f00b002d4b3c0193amr1760730oib.229.1645231649091; 
 Fri, 18 Feb 2022 16:47:29 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n11sm11360794oal.1.2022.02.18.16.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:47:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [v6 9/9] MAINTAINERS: Add entry for RISC-V PMU drivers
Date: Fri, 18 Feb 2022 16:47:00 -0800
Message-Id: <20220219004700.1973682-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219004700.1973682-1-atishp@rivosinc.com>
References: <20220219004700.1973682-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_164730_827418_2889F2E2 
X-CRM114-Status: UNSURE (   7.72  )
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

From: Atish Patra <atish.patra@wdc.com>

Add myself and Anup as maintainer for RISC-V PMU drivers.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fca970a46e77..101a07728d5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16596,6 +16596,15 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V PMU DRIVERS
+M:	Atish Patra <atishp@atishpatra.org>
+R:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/perf/riscv_pmu.c
+F:	drivers/perf/riscv_pmu_legacy.c
+F:	drivers/perf/riscv_pmu_sbi.c
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
