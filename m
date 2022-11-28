Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3718FC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Grbd7T8EoNp5w1d7V8sOoKDvzODpeWLDQWVr7VDTvUM=; b=3Z0Q3M6ZeOZsRR
	bo9lCOKQ1Gmw207zqkk7PzMQF6dHRLaoqmJfkcpB8isb0j7uNMdtuT8ABxkiLw+GNBbE044kB+6it
	EZnDp+vxxAf0rwEgHgO1LbnTCopvg+tqiyBCImWhFKyylaJBm3eu0mDW/LhYpokbn+ix0pZP1Ui2U
	dppf+0Q6NH5kqiV6gbFrJ1GKC/9N3qgiYpv7iZg40VtyCKH7DDzVOxv1yr6I5I+NpAFBcYk1h8Q1L
	QFWWJ5a7KwolcmWHIOYIHKxbesMz8+Xfi4rOtHfrjvXD9sIeJ9gldMZHn73K3tBbWuZWAKA0SQEdu
	QrQtjP1IqGOCFXzINshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmU-002izt-3j; Mon, 28 Nov 2022 16:14:54 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmO-002iuG-Hm
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id mv18so10003771pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7x0oTKpsWp1eBMVcd2HvR7GLV5FrDh1MXNEuBtWibU=;
        b=GdZOldmSeoejY/4MEdz+TDxR+dEPbxAHB2nFoU0GWyxVoxQhUERCL+ZxaQCp1JkRK0
         KhzMcM1nrUYd9KYVlLYnbC17ODw/dUbnRoGsYGB7y8iw08CP2OMlbZ3Tdu9Ag7j8rSoN
         QOUXNtJ7qcbTfXaMrwQ05eXW3JnpLDLGReoYynXAGlFdrLOjgPNGnBBxxoLDR2kwPy2B
         vD+qzpsMtpHy8F1xF7IG3RsR+xK1Ofxq2aXVIUqCjhZC8W0HpDEbv39lHq38zVTbxttZ
         rDWQtzL4WRfsED+a1UfPwP1DqwSyIvz7n72G4HGVBcspcAQCONIAtb+597M9SqvswxVw
         GmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7x0oTKpsWp1eBMVcd2HvR7GLV5FrDh1MXNEuBtWibU=;
        b=sH44yFsePoiNDD3AgNvkPByeqXQtpKODy6O5XtU6A5a2MHxI5pgn21jNQpevIG4k37
         RmTR2+xc0i4wEktcVmcByJODd+n4dZZTTtXq3FpN7Eksik/7r9nXRrNw594wBqTHzBPV
         /SnohClmvHKVjDbrGKkhgygBav9qBCuEy3RMTSh/oqb1/1vUkTY5CgvtP62zqzIQa04f
         Kr7+AS8q8zUhM6IhXcUAPwqvuPb099x2Ml1j6cGfDdp2HNTl+V9LzPZklT5EZ83VbZKw
         94psdvYIOoihfhb0neSDay4xH/zskkfn1iIhB5LN9Sh40rY7+zQWGNiEkcaUEQW4ezko
         AdZQ==
X-Gm-Message-State: ANoB5pmNKcBf9tOKgxniBTA3oN7JrnXTZwNVSQl1b2u60w9uQ9tK07eA
	cjvrbypL7zfOmf4+A/yXQ5ry9Q==
X-Google-Smtp-Source: AA0mqf6a4nNMoI9Pp6ntgyunakgkDq9LNUMsEe3B51BBv8WT18Ot9XuFrO2+cmOg/sKUyAgU98S8SQ==
X-Received: by 2002:a17:902:e886:b0:188:fb19:5f39 with SMTP id w6-20020a170902e88600b00188fb195f39mr36071752plg.21.1669652083071;
        Mon, 28 Nov 2022 08:14:43 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/9] RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
Date: Mon, 28 Nov 2022 21:44:17 +0530
Message-Id: <20221128161424.608889-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081448_623774_BC346C98 
X-CRM114-Status: UNSURE (   7.89  )
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

The asm/kvm_vcpu_timer.h is redundantly included in vcpu_sbi_base.c
so let us remove it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 48f431091cdb..22b9126e2872 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -12,7 +12,6 @@
 #include <linux/version.h>
 #include <asm/csr.h>
 #include <asm/sbi.h>
-#include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
