Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D25FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 05:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrCff9xTNu8vtsPeZSltmOzrO26omaO6BYfYl1ANrWQ=; b=tCvyLVyvjEP4eG
	yFq3CKEZJZZzzboFn9371D+350iM+Yuer/EiihTDK0MtReUHtX71X0vFI7zpay8fGkN5k01h3XLfr
	7AW6xB75jWXQs2Fv9vlDjfWnudx5EVVcNeGK/cdu0aTXJh2O3De74tNY/Ux97M3GEm0CarunE2Sqh
	M9T51rhJQpt0ekZGqk0dUA8gSD/bXKbmP3OZOUASZ7cxS/kUU8B0hkJIhPgiW5MhkExseVuclINZ1
	6vdSbng4AfDMrMseSb1l3XGEXfxWGcxggZRg0zVBodR5j/Ln4u1Eqnqr2kyTkJiBy+opIs94TH/t5
	XdCkQT9ceYPvedfLPxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0zuO-00Ehv6-8Q; Sat, 25 Dec 2021 05:47:56 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0zuC-00Ehke-V2
 for linux-riscv@lists.infradead.org; Sat, 25 Dec 2021 05:47:46 +0000
Received: by mail-qt1-x832.google.com with SMTP id j17so9117564qtx.2
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 21:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gzGDrxyZOUv2+4eFD82inPU+4YJ/HvJmZp3BDWThsJU=;
 b=TslpnrS6WLC/fLdxZRhu/+AwJex/jvZ/fobSXW0t9yBqAYC9pmGhZTZMSuiCLnDWWw
 f4Id4TCIy4o2QGgHc7cxlqWgWeEvD+nc9g4OYQWFn4HtIoZWilF5a71YiGct8liYM7xY
 vYRQK/x1T5ad3LwOU/90x/zVhZTEaRcypapyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzGDrxyZOUv2+4eFD82inPU+4YJ/HvJmZp3BDWThsJU=;
 b=oOwkVi/K65ez7Z3zvIF24Vvdrp80rL+XTh+O37W+HlphKAT1XXu4Y8PaDwftah0mPM
 2McAZVV/18MfDkoJOH1ZK8dBNAPVn/RwwCF85aTkrwF6E+8CMzF0HjupyzFCKjRomY7w
 T6MPDA+MA5u48v6w2XqUp/gqxL2yzRWuFvJTwDQMErxAIjPETBjKg+NALKTWzBDITIYe
 L7SVxL5VnfeqeZOh6iS35lJGL8vsGoOotQgnYwswKYHHZSKZRa/8ILrW0dBUkPw6paRS
 PY0c2Xqyx6BNYzHwKtvUlQfI08jzxJBaXVisw6F2FD/Wl2NhqSxKMHn2IaB3PdrTdpMt
 oc3w==
X-Gm-Message-State: AOAM53032UoQCYUUTGX6ieNgdy2ea/iCw6ag1eAWVNCD67/hSXED508D
 r1FzRitivQKdUF0T4jg1DzPl
X-Google-Smtp-Source: ABdhPJx+6s23SrJkmWFr0dXgfR5PD1eLY5Neyl5g05B/jmIodv1ehtiUksvM1kDS5210VzZBE8aLvA==
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr7815924qta.519.1640411263130; 
 Fri, 24 Dec 2021 21:47:43 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c7sm8492780qtx.67.2021.12.24.21.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 21:47:42 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [v5 9/9] MAINTAINERS: Add entry for RISC-V PMU drivers
Date: Fri, 24 Dec 2021 21:46:47 -0800
Message-Id: <20211225054647.1750577-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211225054647.1750577-1-atishp@rivosinc.com>
References: <20211225054647.1750577-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_214745_040993_EACA139A 
X-CRM114-Status: UNSURE (   7.15  )
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
index 9af529acb6a6..6232ae05e12c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16056,6 +16056,15 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V PMU DRIVERS
+M:	Atish Patra <atishp@atishpatra.org>
+M:	Anup Patel <anup@brainfault.org>
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
