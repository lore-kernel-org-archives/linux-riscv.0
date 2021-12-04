Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230EEC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+2x2zBWViuQVNovOolOj0xWx5DaLgqqFrq/X+ciwj8=; b=KITkSQsGh00Vze
	e7EnP/o4aCgaoRfAIDPP8+U42S+XYgzpDcXYaDuS5yTP8cS/PZrlgjfouskRoCOQaqa1Ik0LfBkZz
	FhVeeFz6Xlgy3SYDAFxgTJITAQYEIyUKajL4jVHA52sfPdTxxaf483q61cN7YxlTutVu47n5JnIYG
	64hpy4erXkfo4vw3nv6T6uGRrCIjDZBCkby4g4lrMBNapawX5WUOwLyWeVptKeEDJn0FyuaiAaxjO
	GwoF/op9HpSZ0mgqgtzTgVppiirQexLnXZT8qZm3XMgw2OcQvLf6nmXen1AFC3tGmNydB3co8mdjU
	zovJsWtXexbQ0UJMcyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtInf-00HI1D-93; Sat, 04 Dec 2021 00:21:11 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtInO-00HHmy-R7
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:20:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id x7so3543443pjn.0
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJAWGyN2ukKDyc0b6Q6InF5r+fpRoS4WfU0DlLi+X9g=;
 b=dxW+Y28b9awaqqn5iIDBZZbxrk00KGdXgECE7UWSWVREWXo1Wo6+HetRqB5M+HjnQg
 kE8axc+TqbkYfzRZQdWww9AOyKD99J3TTlIkVzEsU5L1TNThRnFUzPp3nHA4ATVDBEdK
 EXaN9gam7rZ4bIXjA3/lhihzMuiJIsdV1QMcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJAWGyN2ukKDyc0b6Q6InF5r+fpRoS4WfU0DlLi+X9g=;
 b=Tmd0NyhoXZWxaDfrjGQgudUDBIJbDrXAQBxfCz45vWKdz+Jw04BqK79hEnfDC/MXvw
 FsKCo+rZ62wMfK/zsxT+7KDA1S0u2TsVCLPBTesatkdaqYnOPDyH2lO+BfSPSwi+6CL9
 KLfvKGDxN+QKaPNaRMzhQxGqR7GFR6wUI4F+zw8a2/UF8PbAA6AOpC5RPryae4bQyso4
 DD7H28JdfAIVvslpi08ghMxRjAVbL6TDbO3B++UhfDhxU2iooHcDc6NKWJAw9ssYZxZU
 wTdQpoAjNEx70b4da8mRSvPDizbH3Dpuv8jqIIXBEVB+iCFxwdZVvtg4odjNLFGZ/rxy
 mc5A==
X-Gm-Message-State: AOAM530w0QgY41dKiKwctUxsSyPNwV7jwJJkO5GRJEzoWJ4n8aAAPJK9
 FqfgkYKmh3PB3vysQLyjs4gFeEDxyG9SN+o=
X-Google-Smtp-Source: ABdhPJx4oXb7ZqmUdLTVCOjRGup8Ps6bBDW/hMP8BcfERITtOLCXbjbwk6dJ/bmFcfokuhg4ARByAQ==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr17765302pjw.158.1638577254030; 
 Fri, 03 Dec 2021 16:20:54 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id r6sm3272402pjg.21.2021.12.03.16.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:20:53 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [RFC 2/6] RISC-V: Do not print the SBI version during HSM extension
 boot print
Date: Fri,  3 Dec 2021 16:20:34 -0800
Message-Id: <20211204002038.113653-3-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_162054_967444_96B494AA 
X-CRM114-Status: GOOD (  10.43  )
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

From: Atish Patra <atishp@rivosinc.com>

The HSM extension information log also prints the SBI version v0.2. This
is misleading as the underlying firmware SBI version may be different
from v0.2.

Remove the unncessary printing of SBI version.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 1985884fe829..3f5a38b03044 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -38,7 +38,7 @@ void __init cpu_set_ops(int cpuid)
 #if IS_ENABLED(CONFIG_RISCV_SBI)
 	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
 		if (!cpuid)
-			pr_info("SBI v0.2 HSM extension detected\n");
+			pr_info("SBI HSM extension detected\n");
 		cpu_ops[cpuid] = &cpu_ops_sbi;
 	} else
 #endif
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
