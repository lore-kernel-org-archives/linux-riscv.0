Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB2C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZYGR6yB1sS2otDOpSFWy1N6GXsKX2qrMDJ2nxGdSzQ=; b=H8Jp+wzhA9+PTZ
	wNdPGr9WSueRuseErPzol3zVW4rjEHjX4tCZUqe2E+oH82RcvhuoCTukHPbScWJneBlH0BL82RCoR
	wvVXcCygFhcdlx+wwMVnFXSryiJHOPVDYX5p2HiXsFsCptXMXRvQYtMFz1Xt62c7h7UxVjCq2Rqzl
	Fa5+NH5bd9XDohXOyYZ3EOSpb7efqhrgnE+eH9jZffJg7M8RMiwLuk5JSR0YG5IcuPzt0aunpLtM6
	cXYAkNYjcAAFKCPAvUD/oHHMBS4PnPRQC134jADKVDKv6wHDhEVTEzuF7P04uUF26DfQ6Vm6i/ogv
	w7EINfMiw9n1QIPbFarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWj-0000000AEYs-1C3E;
	Wed, 18 Jun 2025 13:08:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr54-00000009xcx-1Lf1
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23526264386so67415645ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246549; x=1750851349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=SCVkw2T4lZsvn6r5BgqJfd/+oV1/9qdk7gJAAsMUVpY2m5gm3+bnRMX9rRo8CL6dLg
         OWOrjXAbLMXC95ueoP66uhL6rSr2+wrKPLnB+OF4fIwUmXs9Jgi61KKnzef78LGqkGmd
         HKk7sfsE3FPR8tBcjNMJgr+9J3mygGguH3jw0+WDlLyIFqSO94PLUeO8PaQ7SXOWakTi
         89j68muB+QEaj36127JXytHT8xVnvodRE9cHwEsbSbZGQca1h5nPAdS4i7S1oqkFZcso
         3gwOVa+bfZjSVg3PAzNOk5vlxUd4ajXQpQVNZ29rYCWFRQB0JzsAeqmS4XFwaE6EhRQ/
         638w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246549; x=1750851349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=k69FXIJm0BBtEhwh29r9JRa9Jgq8o5/8Gu35Z+PiZgrU9W4JcBo6eNcDf6FVWnZ3RU
         EW7dWQ/A7A//iwXEQ/H6J1Fyy+YELW0R34LzYZ36/A7pzPD4EePuIML702e06lZTNz24
         X6OZyDvVU732G1UcHOT/MYUHQa7eigcJTQjcDZBQ8sb2hdXhEHt6KJ8eWpZnMSEJQHZx
         T2fasEJbFzy8jwuTgvBO4f2YauUYUtk19FMxq6khPjjXMh1SM1R9Ybxk2KkiQCPu4l2H
         Je12CrPUcgeahU0Gl3XVsY0jtgkkV+VTj/9lzcnYTeLHHoBHUi458IoxxvvP83e8H/qu
         BSHw==
X-Forwarded-Encrypted: i=1; AJvYcCWliCrqsYpAy96o5PnJFZV+zYlHo3YFWBmz4QaFFOkUCqZ8y1djGXw9F7L13m2PUnST2jKtcstIcnfVfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/YM+/zKEolm1hQd1dijMR81Zn0tKSW8Z57LaP+bCOYL8yNpH2
	uZlboJHzNEQAHi6lQi2TInBpt1yEFGS/p0T1oajh4iBOxMo42rI1DFOKKAQp8i3MkMU=
X-Gm-Gg: ASbGnctmvk5OXM9ao8S3e6bERZcocEU6Kc/X1Z1JMlt6A+HZh9zuMeky5YuS2SmLzRK
	XuUvWF+PrkuFkXXIjFDrccWHbxiVGwF01sHzX4xzFUrXq20DakyCKbmSDheugvEnZPj3o5mZrJq
	PKJLTRscHTiwCeQMs1Mx00JXL/RmWqeIH3+h8cP3YR5Xwh3+A8G8v4zqp5urXf1+xlTfMn/kYRO
	7rlo5kjlUSTRdgRP83ywvF86wzU26+8S4vYAd4xGvKokxcM/2hd1P0d+Vqm2pVeB1Ak7K37S7lA
	/M/bBBfa47Ti+jrvn+Rq2zIux1+g3KLgPnyuma0kM/RZMUe/OooghoIseSk/hz8OxA7oARqXo8j
	AZOD8MbE7gIXndedSqg==
X-Google-Smtp-Source: AGHT+IHpQurN4dARXEVEkELnBd1/eFKHOQXO7K5ZeHZVbZ7n3gcsWaLN1FmavIalixJDtUnrPtlsSQ==
X-Received: by 2002:a17:903:b8f:b0:234:a44c:ff8c with SMTP id d9443c01a7336-2366b329f71mr223770515ad.18.1750246549511;
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
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
Subject: [PATCH v3 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Wed, 18 Jun 2025 17:05:21 +0530
Message-ID: <20250618113532.471448-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043550_351862_F58F62CC 
X-CRM114-Status: UNSURE (   9.84  )
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
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 303aa0a8a5a1..b467dc1f4c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
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
