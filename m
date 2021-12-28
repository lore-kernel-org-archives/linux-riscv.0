Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0FAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz6h3oWCb+fZ+4w4Qo/8UesHA/M7BubHc+4DS7JX9NA=; b=z/egymFvCwbeNf
	ajCKXziVTygxtLzOVgzubPRbwfbHWbZU/HXzhP+a8zBxhLuAeXUYeT7oVDeo5k6Cd741Bre5Cuek1
	u5Mx74gwqs+1rilHNqy+uKp8hlqJ7nN2gZmcrZZ4Y0vZP0XzHC9CEC+KXhMnhEikDkW4jy62WnWCG
	RUTvAZDwCBt38t8fOJbIrOwltBefVVRm+wI3yk8kU09B/FBaqkUwWtkFYcODQYmZDB1ldPKYgOlcM
	zUrEbVhMuIqEVk8/J+yphiTMZJTKFofP8Zkiqj7DZV2qJcmaWkdujGDpgX7K6mqpceZ24LZzdT4Rl
	K2PIwV8lt3ZGojbdE1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Kzw-001vCw-RU; Tue, 28 Dec 2021 22:31:12 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Kzq-001vAF-8G
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 22:31:09 +0000
Received: by mail-qv1-xf34.google.com with SMTP id kd9so17567783qvb.11
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 14:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWDZG+O5QMw6Gx6H+DMlU7as2a1pC5H4fQ/YCHQ2l+Y=;
 b=U/S1I+cSe4mLRbGLbnq4cgulAqcxT4UxPOeKVkGJIoCCB4Ox6b7ZqNFQ+mBduOHFso
 t4rMObEyAMJP2eHp98k1yahLu6fxxuwUYzyoiHOhxkCTQ18/9uqbi/pGd65ZcsTKVF8Y
 cWnVa+D3BOjNqJf9FtbztZaJhuE0jFQeKTSn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWDZG+O5QMw6Gx6H+DMlU7as2a1pC5H4fQ/YCHQ2l+Y=;
 b=4QC/NFE4a4hGjiQbHEp7j0D9LRdU4fp3PLtU7meEVfmIY+d20xSBXCn8yOy9/FHN/E
 Yo+Nc1GydAGWVO99iC7H91m5h0Kn22/Bap/ZMkpnwI6wYzR7rjFpQ2nphEeJbDKzEgr8
 2+8E3T3OJ97rUIFzc6ZIFyE5SsCS+4lRWFqJbZ8NH4kL05OBr5LdK7ScZifP3UaQzhjr
 KrpFVfIsCn+CMrTimU3Y+7iU61ec64SZvWyGoTg/TJVWEG+5CRz64oFQhiJLiekiR9w1
 GtzcbN9Dszzp0sm3SfZlMP/o1w/UTIwS1EYvMWsHexyHoV/W24tEtwb/kImZhQm6o84r
 gQoQ==
X-Gm-Message-State: AOAM530VSJK859/N1f1NoYic1uD4tgbV48a4wSO7C0IAhbadgwI70T79
 CPDbsX7R+yxROAGq7zmFkX4V
X-Google-Smtp-Source: ABdhPJyUZ5+HZnMhHNyj8B9R04F7Fzf7ePbGliqWg3h7IItwupJdQhrZvoSq5lZqaUU1hC+U6l0B2A==
X-Received: by 2002:a05:6214:226d:: with SMTP id
 gs13mr20887535qvb.75.1640730665263; 
 Tue, 28 Dec 2021 14:31:05 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i5sm2738407qti.27.2021.12.28.14.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 14:31:05 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/6] RISC-V: Do not print the SBI version during HSM
 extension boot print
Date: Tue, 28 Dec 2021 14:30:53 -0800
Message-Id: <20211228223057.2772727-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228223057.2772727-1-atishp@rivosinc.com>
References: <20211228223057.2772727-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_143106_314352_FB550A10 
X-CRM114-Status: GOOD (  10.36  )
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
