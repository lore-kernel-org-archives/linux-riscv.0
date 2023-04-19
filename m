Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFECAC77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pvc3oxKfVz3JF63OspYCfSBi2+qeISA7xGUDkHSBOuw=; b=2lDeM0xvNWy3Wy
	Q2UDdjvpsWcFn2v4o0DECNx9ULHYzVchWDBGS8kzgH+1MTlA3iufhsbR7rJKFmZcoHGWcw7/nEe/Y
	GWLouYGS6F5q57lEnZFsS6lWlaE2BuMrtmo+6K3iMQ2HM8RO6XTUSE7FWc500kB/a4dPfFaj6Tgl5
	qx3dqu3kcauQY1a2oGk2/GQoy32jhILXsjnbN0RqR30G5m4aKKHJVybAoSktBkj6n4u57K1liP7Xj
	u8SeMlAgCtvCn2AITmTJN6D1tMxbSYGqLLclf37tPymNvDI4K911EI5nZVUwGGshs2R2qszBWJkAq
	c+STf8JV7w21HRl+yoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGA-006eaQ-1r;
	Wed, 19 Apr 2023 23:30:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8T-006TRq-1z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a6ebc66ca4so4213645ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942725; x=1684534725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V944izAfHfvPXt2SodYy8axfAv3FUhh/YjA49qCII3Y=;
        b=WToiBYM90+kXSHR4f4lcMC2do7CnNE609AkBJ9ILRsQSAqLQhvGE4fka9RZc7XkmOV
         nVSgbPgR0g26+R9aOz7prZ0ZYw39dV9KxvmHBGDvRgR8MR74QfL1ZHIt8XSWqAKcLN8r
         0f6Tq006zXgK2g4OuuillctnBCZLY1xVWuRZMqYQdfd3ybKvutxZLqu19QqqHmXC8ODS
         KoYa4jRQnyk9O92MghnQdSKIAU/AWL4fTpgXKATBvPLDFP59BwJ0oeGTqTbRTShwnDj2
         1+Ojob0S1CfD+/Tznk4BIbXVZIp9qmP+FcBhkm6vxxe63VSq5U1n2NJ31boDb5/Auf9y
         qI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942725; x=1684534725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V944izAfHfvPXt2SodYy8axfAv3FUhh/YjA49qCII3Y=;
        b=dET+de0cU07gElFVNDtbh+mcefv5RSPiCE3hR2XDpLMoGwj2wsqr3+8IapBx82rGrh
         lwOTvXlMcJ1JL9zJVFxR5KWqLzzZl6UWEKXxedntNM2fcpeRmLt+JGWeubBBDtrHD9sE
         o5Q5VlzuCX/G1ESTFLphtZYI/61ZlZ4l5zASaGzoT9osZXaMYaNFmDFeUTQnE/A89N4F
         Y2c5GFLlvHZgo2A2BDtEReI+A/lE3vNr1wYKcCRksbvrrCyDFSqET1tJX/t6Ai6KLyiP
         xiRYwfHRAEse9CoqLbnuKxCvrOJjV1fZxXl6czqCwuffi4qQydjPMuwAQ6CWcqQ12qhA
         D8uQ==
X-Gm-Message-State: AAQBX9eZEBEnCnZ9TwPMDmxl/dPupWviBB+uqhdg+pxpxw3tJZLQzhwu
	80kXXGaxsDC0mnau8LyTf7DKHg==
X-Google-Smtp-Source: AKy350Z1qByMTGJhiqV3zdWqTg/zhHnUn1VfTimSG0DF0as79Rscca2Gz4ZKZ2NL/Pi2zbK61ibEFw==
X-Received: by 2002:a17:903:2409:b0:19e:839e:49d8 with SMTP id e9-20020a170903240900b0019e839e49d8mr6224177plo.59.1681942725072;
        Wed, 19 Apr 2023 15:18:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 34/48] RISC-V: KVM: Initialize CoVE
Date: Wed, 19 Apr 2023 15:17:02 -0700
Message-Id: <20230419221716.3603068-35-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151845_656506_96A38FF3 
X-CRM114-Status: GOOD (  14.60  )
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

CoVE initialization depends on few underlying conditions that differs
from normal VMs.

1. RFENCE extension is no longer mandatory as TEEH APIs has its own set
of fence APIs.
2. SBI NACL is mandatory for TEE VMs to share memory between the host
and the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 842b78d..a059414 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -102,15 +102,12 @@ static int __init riscv_kvm_init(void)
 		return -ENODEV;
 	}
 
-	if (sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
-		kvm_info("require SBI RFENCE extension\n");
-		return -ENODEV;
-	}
-
 	rc = kvm_riscv_nacl_init();
 	if (rc && rc != -ENODEV)
 		return rc;
 
+	kvm_riscv_cove_init();
+
 	kvm_riscv_gstage_mode_detect();
 
 	kvm_riscv_gstage_vmid_detect();
@@ -121,6 +118,15 @@ static int __init riscv_kvm_init(void)
 		return rc;
 	}
 
+	/* TVM don't need RFENCE extension as hardware imsic support is mandatory for TVMs
+	 * TODO: This check should happen later if HW_ACCEL mode is not set as RFENCE
+	 * should only be mandatory in that case.
+	 */
+	if (!kvm_riscv_cove_enabled() && sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
+		kvm_info("require SBI RFENCE extension\n");
+		return -ENODEV;
+	}
+
 	kvm_info("hypervisor extension available\n");
 
 	if (kvm_riscv_nacl_available()) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
