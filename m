Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7BD68B34
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjdXJtJiQtPMNyjlrAtiFrJcUIYnobF54HsSgC0ikg4=; b=LvNn2FL7aiPf8k
	tNp5TiFncvX5pnPQvg1UUlOFMqZbo01gMZuVrxn7Y+jvsAdyPUb7ms3Dbk4eU6pohC57iZSF3oh9F
	I5OJG9dkx9ln6O4pXFYbqevLfXiD2KIhVFM5MW8NB9VvPipt5+ATGB40n33Rhmf5wiQlPer14o+LE
	0zRl5VrlyNrRr0U1XrOVMgKQd5pGy5w8SO3G0AnGuoTf3lgnL5SnMec8zy6KrYsdVLDUMn5yDlQz5
	jVdArofXyPy718x9j87rAlL90shTpxjZ2y/W9mTthdbvbeCOwlzSH9/wzrygiPJRiM+zXzBmdeJ4c
	PN4TEi1JQt095fsde7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYr-000000005OO-3ql4;
	Thu, 14 Nov 2024 16:19:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYm-000000005BM-1TOs
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53da3545908so857830e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601146; x=1732205946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftdmF/h5yhFV9hvEqaih+NCLoaifWjggdlhRka1xblk=;
        b=hheHi4J/uOizJDcnC6f1IfueP9eejFxwnn8sYauhXxOka0oGgBnF3VvptReSnr9yE5
         XL30EaKNAk0xYL6FArLQCzUS+6fAZjyICMeaGGEl0jKfsDxENIoWQJ/LXcmT+E/01iGm
         z+NWUMBVZRyuJvThc2Ahv22rTdZ1IL8ZyIaeG08yw/I26DZGcH+JP91b/RTlx1sISfx3
         eSQgdulvhc8EZ0JfH+FkJQtt4kcjULu46hpeGAv1zleVH7Bc8CW76bu1jXVtFuIxY3tB
         /E3SNgJ57Pku34r/BPsNzIGgA2IMZjFdHz42YFf3av776FFv8kFxY5438lFDR8WAL48h
         Ur5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601146; x=1732205946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftdmF/h5yhFV9hvEqaih+NCLoaifWjggdlhRka1xblk=;
        b=bxHEpoEZktkCGQfeJjDSm71iGOa5klRDeWqsDti0aNdva6veY30qAXc1cV906dq21/
         srI/TrtS1hY54DXjIe9t39k0CkrPnOC72w6plopVDATgA6kM5lQRG6bHMnXwJ3ZEgG1k
         1akEsrsFf0xfERRkPxyVxvk7IMMsi+wDpQF4TkFn/v1SqsVwSvrBbjPFkclVmBCwEH93
         G/UE8FXr1qpDgU/EMst5j5Ik0Hlg/kalesoX/jq6WfRVmuqgmVLGzEXRQxmh57OSexC+
         FYV8Gd1YZix05d3q2YZtlSHd1+86jRcceKF2D32FLJ7Nf677naHYBbpRvRhRyu0fWp6n
         AyRA==
X-Forwarded-Encrypted: i=1; AJvYcCWdqxT74LWHJY1VONVSkXsw87+O+rFPbFa9jgLzr3DyUT80kDU4CVEC1u5bm9kkJND4N4cUdcrVIvdGFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9YdxtTM6fNsxH2tfdUuTd/8Z4hlJw+S+ku8AhOD4padmjxxFW
	oZFaivt3CXTS88AiuHcGIqIHHKvRy9KQyFLzff3UU6E4hyokjyzjSVGKpk8NBAM=
X-Google-Smtp-Source: AGHT+IEJJHbd90NQ7GNwzK7jz3We2gQcoeU/8zkdAd9xuaV8q/ybA/J9tvQBrrlFpg45NfoyESG9lg==
X-Received: by 2002:a05:6512:39c2:b0:53d:a99e:b768 with SMTP id 2adb3069b0e04-53da99ebce0mr590942e87.25.1731601146055;
        Thu, 14 Nov 2024 08:19:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm25510275e9.10.2024.11.14.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:05 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 11/15] RISC-V: Define irqbypass vcpu_info
Date: Thu, 14 Nov 2024 17:18:56 +0100
Message-ID: <20241114161845.502027-28-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081908_438858_62B12537 
X-CRM114-Status: UNSURE (   7.06  )
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

The vcpu_info parameter to irq_set_vcpu_affinity() effectively
defines an arch specific IOMMU <=> hypervisor protocol. Provide
a definition for the RISCV IOMMU.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..8588667cbb5f 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -23,6 +23,15 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
 
+struct riscv_iommu_vcpu_info {
+	u64 msi_addr_pattern;
+	u64 msi_addr_mask;
+	u32 group_index_bits;
+	u32 group_index_shift;
+	u64 gpa;
+	u64 hpa;
+};
+
 #ifdef CONFIG_ACPI
 
 enum riscv_irqchip_type {
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
