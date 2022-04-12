Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9474DC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muexY+eNaWTtKvAfOM6aLZY/Mre0gC6DfQEQwDB07JE=; b=cpmLwHpPvqzt/D
	da6MKvlY4IgSNmLzBsFvDFdw+tGoq7JTpXZ2uqSyiwIVaX89dX3vz/VKs5odoJolhcDrnXeZBFg1O
	wcuYzJfGfW2ky+toWAxs01rdJ0yc/M8M7LOtf8LcW3aNUzYHpoYzweVLABMMc/fKKKDxr9MiD3Oo5
	4QpRIjnJLOlbgowd/v8NOORhRoVmO0Ev3IiIX0dVZBSQJWsU8l5UIuixa/sww97MYGNnw4BLoF+ha
	brTuKXLc6cZipNufNltEhPyMijC/ZGo8io+zvQNnOQZaHW8gySNthRgtSnBfNFs+0Gwy+sW8/2Wtf
	iX+EKrUpPppfSiVLv8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDSa-00DAzz-GC; Tue, 12 Apr 2022 10:09:20 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDS6-00DAfN-0k
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 10:08:52 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so2327917pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/lhXgecBDWrQwrmi3IwcGDaw2Q0aGQ9eYgSFA2SGhM=;
 b=h96ap3yBa7UWyXmUVI8Mn1cCYzFKS822KyCaO1ta5E/N3e11l7Mas1O1ootLjyK1Nw
 YySh+UsQ7SE9/6Dg7T+QDaeYVPIJDN5moEr1xxzQ/b1HtxmmSf6d+vRD5MSWGb4piamq
 WJDoHbJ6lqSi1YHB4Z9WylWlnlxJDrOKpfkduxm17Vrv5eTD10KEB8dTKmDt75Jpd75h
 zgj2QNBIBQU0ddaJxo4GCxiNQSx1xTArtxUqzJ7IlbJrgqjOKVMD3lOsjURzagezx2HY
 Yz3TNu3a8OiEIiUFyF3EdSKTsKxPnQLZ9gVkugQ1mVAT+atXCXdE6bjFL5ikeMKjDXvX
 nWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/lhXgecBDWrQwrmi3IwcGDaw2Q0aGQ9eYgSFA2SGhM=;
 b=Xa/0KFMmR4ezMlGm4rE4TFuinNDvfzKE5qn9xOk7AF1qJJOIRue7A9txcX2QiI41iU
 jQ2Sf5YWyraeJe+nyAZmwydNU4cB2X7cpep9r6SsE8PytDynVCuVpa3BjnJpzesLJeP4
 znyRB91MU4BwCrmQW2AIcpOfuCWHsSsZWyM9OLR4I14vYvQTdqW8AuO3m+fMK3GXOAmE
 V/ENidm3on2EVckpcgc18wRAtG19JBtaO8D9uG2NLahRb0J/qsqHXEEaljQSyv+1NTqz
 5ZI/YztFHeCSVEmyYbRyeNaT3jqv8FUfR2zZvRzyXvRkKA0bUNeb8H/wWMhs9Og2CX5E
 UgQw==
X-Gm-Message-State: AOAM532uwaTbTB2DED8kSA1fbNzyl1bTuBr8pc7Wrqt+r4FX2FV1nKRL
 mubiuRHxUTgNCvQZwng/2aUVKA==
X-Google-Smtp-Source: ABdhPJzfzwvBiu8Li0ASK1JZWYVvOBz4tGixFxoLswx6dav7qX6DPPIdLdqcrCA/FeYV0cFPx+7lZQ==
X-Received: by 2002:a17:90a:7f94:b0:1cb:1853:da1b with SMTP id
 m20-20020a17090a7f9400b001cb1853da1bmr4096478pjl.14.1649758127854; 
 Tue, 12 Apr 2022 03:08:47 -0700 (PDT)
Received: from localhost.localdomain ([122.182.197.47])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm37515088pfu.82.2022.04.12.03.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:08:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/6] RISC-V: KVM: Reduce KVM_MAX_VCPUS value
Date: Tue, 12 Apr 2022 15:37:12 +0530
Message-Id: <20220412100713.1415094-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412100713.1415094-1-apatel@ventanamicro.com>
References: <20220412100713.1415094-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030850_116585_6DBD1D4D 
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

Currently, the KVM_MAX_VCPUS value is 16384 for RV64 and 128
for RV32.

The KVM_MAX_VCPUS value is too high for RV64 and too low for
RV32 compared to other architectures (e.g. x86 sets it to 1024
and ARM64 sets it to 512). The too high value of KVM_MAX_VCPUS
on RV64 also leads to VCPU mask on stack consuming 2KB.

We set KVM_MAX_VCPUS to 1024 for both RV64 and RV32 to be
aligned other architectures.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 806f74dc0bfc..61d8b40e3d82 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,8 +16,7 @@
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_timer.h>
 
-#define KVM_MAX_VCPUS			\
-	((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
+#define KVM_MAX_VCPUS			1024
 
 #define KVM_HALT_POLL_NS_DEFAULT	500000
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
