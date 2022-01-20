Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A348C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGuQmZNoZy7TpnkgZ8GRG9KY0gXhVo7Y9DMupbIyTn0=; b=V+tnNNHqqwgeBG
	FosB1Z11SABCwDePkmOqhTFY7iVsBWerEx7Viq11FiLep929t/F+lOd7S4cOQ6OBjBaXmWQnVyOiN
	J3EakGpvm89t+cvLK6I7DrkNk3MoV7+38q2sf+hQUWywrC8YpT3vM6uKMvF5Rtv2GnEfpQOhwktyj
	bg3a9fxWjs1a4T96s52ygE6rWK9KDAWHMPGLjp20U2UsZ5RA9UdwuSuhknHQHtLMe3jx6K35wjXX+
	K0YVh5lYNZlw1VrjQfRSIVTgV0ui1rO2gN8jJiR6afaQoBqrz9TnhNAaIonoi52F+6p86wj9rPBUM
	V4S1AkTSzLELCPMXqJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATSh-00A5lC-Iv; Thu, 20 Jan 2022 09:10:31 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATSc-00A5ed-Bz
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:10:27 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so1603996ooc.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+IAqNpU/lnPqWK3TEofTL9vxuilP6qFdfM1IXRzrKls=;
 b=YlaKAt0l+QJSIqgI5xDd9Hf6MUCwIUZeatvp69K+1vmj9ubvz7CPImHTo4qvV7PO4i
 FTz9q1B4D1wzQUJ9zvMiM8ojdbIeF4GYstbSq/JBu0w9lR0SQmp+vQaNVSSrfWXw3gcv
 R9m8/teaBTJP2xFpKKfkuNwOTkYuNo/sMNk187AQF9DMDp/AIBTM0bvRtzUFpj55Lazl
 dSiRSOl02rMwVx2jDIzopZvN5bbh0dlQ0ggITtCZHSu9A6hpMHZG+SsP1RoporVunWs0
 kexAz3ub3liRlTcFMV+993rpPanD5k1sPEryJdr+2g2TRsAx3cvJpdLzOfKgfI05sF4T
 lWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IAqNpU/lnPqWK3TEofTL9vxuilP6qFdfM1IXRzrKls=;
 b=PBWnp8bd0VHsyWDUEph2a2SbCoWb1DWIsQ8bE/6HsVBsXP4ElzrZBDz07D5uy3fuha
 nf21b57yEgxnsEps3c7l6IPtes/Ur6FwK10tBOm0KPH3A/f1y9AVqpKalpWL2yMhpXtB
 GC0l+OftYBn+aoiK8/avwrqVgsKPzTrbRJDZQdTDmGYHGneOVjbffQ0NkMyryLjgk+ZR
 hkhh9oaXV1qmHATGExG/H8so/ILxo+KxvHo7djB8e51S88CAg+QNPBXQwEvfkdJmOLF3
 S3lxzeGcNUJB0wnmW43J9JNtJz7kBGZiI09yCA0+qzUL2gWVQa8pw8+svLLzPDwjjiQI
 Z3uw==
X-Gm-Message-State: AOAM533HVvXR365m4cz2y49TX4b/FxbUIubqsyrcOnOKrUzbsKUR0ONj
 ec4Z3BvvOQFWhRFzHgssPQ4CNQ==
X-Google-Smtp-Source: ABdhPJxKhWmSu87uvisFKjzrDNqX8ZXpJ7jVCqt36JTa0SHzHga8/EWNXXbcQbTi7VTRLPePVXAjJw==
X-Received: by 2002:a4a:4994:: with SMTP id z142mr25066046ooa.78.1642669824764; 
 Thu, 20 Jan 2022 01:10:24 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i12sm944766oot.25.2022.01.20.01.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:10:24 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/6] RISC-V: Do not print the SBI version during HSM
 extension boot print
Date: Thu, 20 Jan 2022 01:09:14 -0800
Message-Id: <20220120090918.2646626-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120090918.2646626-1-atishp@rivosinc.com>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_011026_427829_461B84BE 
X-CRM114-Status: GOOD (  10.61  )
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

The HSM extension information log also prints the SBI version v0.2. This
is misleading as the underlying firmware SBI version may be different
from v0.2.

Remove the unncessary printing of SBI version.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
