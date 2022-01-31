Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A90C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Zbdd3Sn6izg8IvfDQYG49sIST/QKLml9QtRWwObDeA=; b=VvHtYxxvm/jbFb
	RWQ242pPQB7ohDEkem4vQ2soxfgDRHeeyo/V2/4+DOjPoi2Qzu8Dv2QmqySlH3mH2VA9pRlBFVQJg
	ac8BwEgo9/5u0aELrPEq4ibsl+4kTeUGus9zkF3skE2RRNZr5b7xQTcMe5FFxiOOa9D9TkA2XjuAK
	SV8TrVyjcwin9TABkGdcVW/etTS0tfGXEjy+4gLilYlcr31tiqqpmAo5tLlvuzLkvfF50DaRWf/jf
	ci0iJcG73AUO12xEi90oSD5KtH9ktApn4UrjjOUmM8DTJSlUeQqeO2rf/jYTxnGzmbrh6YIULVMAv
	Yrhox9GXAZf/sSqicxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZue-009wAw-0m; Mon, 31 Jan 2022 16:52:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZmB-009uLD-QJ
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 16:43:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id m11so27924562edi.13
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dGzXd4bmmboGJFGFy1MxKhj8GszZ6zAjTI5/EJrHl7M=;
 b=V7VkJnSdtCA2MSqwQCV/OgUVKpPJJFVLpHLlpmCGdeCMGYOIfxLW+xSh99gc1AW31g
 L97vfeoAznwYGzM9xYm8DKUVpJnZjJNSwnKM810XANbRvsNvQ3MbLadhVjeDbhx+LbaF
 vSR0A5p1b5BKr6So34AxFuEsnyFY1azY0f3ai54quZgCEhuOvFRdYd/NT5PEsV+ctn41
 FZPMLTQiHzrHKtBKu2WrAegFHg6I6AxYJSx3Kz0bV5IKu+ZI5SbziI96d4ny+IbR19jK
 L4Fkrj7GnuQUoPukYryJcBYZ7LvjyhLGLqdG84frOYb8AJxIDBTq74h+tIHjxSsUr6s/
 GiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dGzXd4bmmboGJFGFy1MxKhj8GszZ6zAjTI5/EJrHl7M=;
 b=Xon6nTR8Tmsy8qGUNdezXs2taWkD3Kob5F/JI476+fhLHvszCVvjYi17cJdaDfT88A
 XwUmZ4MG+q53Ssn6L9kbYzGvp6PR5OZlqa/M83JlOa5cTjXw29AQadBpJ81Fn3j5mc02
 oGt3aKch8HGeDbLnATAbIs7rpbvMEmZzI6wF1etKNUhjVs96X4Al5H1d5TDk6aXuCLUM
 GkpfFuK3dKa6cBS3drsMyHHOktgCIV5PIB94+/JJ31TmIihrdZhYz4lek4r87Elu/FTX
 Zq7mZZ7ctu6CaV9N6l2Mo0iuvjvvzfN/FsSk5+r9uBqiJmXKstMe61kDw6XBYP6X3SbQ
 lgPA==
X-Gm-Message-State: AOAM533AVPuj60MkSCZceXjroOGEue1X6JcCa+fd6MLRWuVF5DGu7fos
 IjNYFKeTUx6RxgFTFCNO+UTWqA==
X-Google-Smtp-Source: ABdhPJzYdWkwkSl+sy7pLa9G+31Uj79QOFKPDTW0KlbZ9luY+B9Wio5QZgqA+2A07MgpR+4hfI/TwQ==
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr20901972edo.179.1643647409952; 
 Mon, 31 Jan 2022 08:43:29 -0800 (PST)
Received: from localhost.localdomain ([122.167.49.110])
 by smtp.gmail.com with ESMTPSA id m12sm17833138edq.40.2022.01.31.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 08:43:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Fix SBI implementation version
Date: Mon, 31 Jan 2022 22:12:32 +0530
Message-Id: <20220131164232.295585-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_084335_908523_E57A873C 
X-CRM114-Status: GOOD (  10.15  )
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

The SBI implementation version returned by KVM RISC-V should be the
Host Linux version code.

Fixes: c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 4ecf377f483b..48f431091cdb 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/version.h>
 #include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
@@ -32,7 +33,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		*out_val = KVM_SBI_IMPID;
 		break;
 	case SBI_EXT_BASE_GET_IMP_VERSION:
-		*out_val = 0;
+		*out_val = LINUX_VERSION_CODE;
 		break;
 	case SBI_EXT_BASE_PROBE_EXT:
 		if ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
