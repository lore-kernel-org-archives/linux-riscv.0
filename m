Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD4BC5B552
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMgaxndo/zrpS543BqaFHMf8kqJLKPcrRJRjVUscDBo=; b=bxJHNbQCTBvN15
	fUFgOXxevW/CXgIR/A95lV2debm41HHDyzFmmjZXF5p/fn4VHr1DO+94PljvlDryWrYDSrbtntEFo
	JHPAD+85dLIq/UhN+GvgLp5ix1B+VP0sD5L1eT2Ws3zuXa5POW2YBIMAQffNxHXbknSr2WEfZ/Ceh
	b6KvP9fYuQN2nzu4eDrPJYYttr709k/BiWRCGfm4IUALWgiwKERLh2QAvuOwNA5MGrgIOnz353vId
	QPABeTFSYt8+PPS7IRkNr5hD0rFwWFE0EnkKLUF7+w2YKIyqTw79+7AvpXu5m6ZhAdXN0mKWZRrZO
	p/tzbYJPbfU9/sUTivYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sq-0000000EovR-3yzU;
	Thu, 05 Jun 2025 06:15:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sj-0000000Eonl-3xUB
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3114c943367so718118a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104117; x=1749708917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=XwOs533xbJaD9NJ0QsRIhPNJVLFG9hHsM2FWZ5C7LqBOFIGMlfQhM7/8D9wQ/bjC7S
         4ecs2vIKYmDQDiOChTC33ECOFUkCvc/ytt5AgLt0EXErm2IyHciMXJ7etq+hd+zMRiBI
         7ZEH1yiJOPieg5o1DrqUfPOp6gjxmKLt3oAe0fDc7K3qYfK2LDXqECOrw9U+8t1tcAcY
         E/ipIT9EONRiiTooo1sI1gd0oP79LIsOt7nvTR9Ozxcb73PKKF3z0h0NFxT9ejcLvgRe
         OoP/2TFMLSI2GGA87hICHdzwBzY6jqFjVPusXBjnar3X8GxCLPxMAcT6xjfw7w82KYWi
         VyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104117; x=1749708917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=if1lzmrSUs8pkPWQ4LJ8W3IoD+M/4CH2ukqYWCRLUK4znlENPEK8Xjg/pnJ6jKP83d
         TptzTRHcOt4vmQAXLo0KFXxfx29s2ZoG9JYOpE05+VkMv3cQmtZMSxW+OsOiifv1WhI8
         z6zIye8q78ytjK2FQOh8pJvc0/q1fYxBvRq2w84lSEt5qlArFdUFOblqweSDidOf/i/B
         W7EOpB+wJ5t+JSwejzf4+wdGrGOUMmk1nh6xHYHlldFX3vY0ERydMpkF/GeO4AZw1ymJ
         RbYMPcJuZKRwzZEnaI3JtQ7v3sG8R+pq2uTKzEdoiMM5NAKADodgdMyLSb7BVHn3DtRH
         fAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1hstnrG8b8AQTcYatLWDpz+defkwpPucIioPXUHPfwaxCVaJobZvITyTGcRgfD9/+E8aud/HlDy797g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2PBsrsf/3P38KaE5uf92Yis4OMf/qOr1wxQRalhEyEoDLx4si
	wYQ2Ljtu34KmDCd3WUXeCARt8LL7c/5uBYOWCxv4l8kPHXTnrJR3lyoxkQlPUdnKguw=
X-Gm-Gg: ASbGncuOcGLa50eNjpdj5IcyQp7e7U8OhWs9sL4NIOImoUPQKp3bJCTDWTvm4M5OFAD
	PKx7IKc2b6IK1zeV67B1A8vPZvQaIG3JCMJIELpmnI3OCrVAZgwK6YaQtr4pH4Rb+me/pky8o7n
	lcSqB5sDUu1KAQhC6d/grcq9dHTomeMbYp8CDg6WT5Iy+zqLpk5Vu4GrWVKbME779kf3GwINFCE
	r7nIKt+KZtIWZzCoT9gZqeP2AygJV5RI0b5daRqY43yiFYwb/ix+xlyFw/mnAS8SyIvQq6Zmhbz
	ZWonSuFK056JtDkG5YBb7v00V9muzGklKGxy7w3DAK1S2X+IlZHf5MuvZS4/N5RpmmFJqXAsIrd
	mPqixQ2NDhxupRbqwoF8OXZirICY=
X-Google-Smtp-Source: AGHT+IH+eTAD19cy9DJlja/MN5YACVJ9sgwSL2k4cnnE8LZ5kPurak1nzFsWixYBq+aRFevEKulw1A==
X-Received: by 2002:a17:90b:5587:b0:311:f99e:7f4b with SMTP id 98e67ed59e1d1-3130cd6d86bmr8229933a91.28.1749104116821;
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Thu,  5 Jun 2025 11:44:48 +0530
Message-ID: <20250605061458.196003-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231517_989993_43605429 
X-CRM114-Status: UNSURE (   9.21  )
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

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e0a01af426ff..6a1914b21ec3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	/* Setup VCPU vector context */
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
