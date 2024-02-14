Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB43C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qiaef5VeykVG1BCcjlroIvD41DmGwNe8HwAVR0qbLDI=; b=4jtuZ8p4BYRBbu
	zUKUULIOtanceY49vH86Cb9MhyhRoa/qN2XX3o6ZC58W5RYdKhpoqUBnzaVv7YNc5tFBodxDlzzua
	suoEhP1RTq2Y/ZRkOouHzAE8cTdJ1GjppgYokMiAaPTlaf4EsadzKPpm9JbMko1Y8ibR5XHKl065B
	1gFZcP2Jm+TKI18mvK5aLdngfL2mULWNeramvflEcdNljsdjD0Ac6BUzVcfuOIzxf0UyBrCoMxmJb
	1OYBZ5POUZ6x3sDEOa8OUKEHhJRu4jl3MI23vgDElLiQB+SAmT5FMJmNVLcES4MH+Y30Ht44wuqpE
	FwFz0XrkXVC6E/ot79aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWp-0000000Cr94-04M4;
	Wed, 14 Feb 2024 12:38:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWm-0000000Cr7F-2Kxw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1db562438e0so5551845ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914295; x=1708519095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48Kvlzn+su9jY0Vm4vzOkE0bGPI59LwwBJsDVuHcE+Y=;
        b=cr8a0B3IK7Y7Gpqc8pRxwlLMwxE4INOVz8WJTq+To6nSg6EN+XQk9MY0w6mWgTHy7z
         uU647ChP+Dzbj6iJPRz+SbaXZN3T/ayRApzu+9/3LP08PBpBYkZOdrvRRy0+msbjWhIs
         V3ARiRWVyjAMC5EYyGM2iG8xSKv9N5RVdi9puesE82D1G2U0b+pSok5PMj+nxHfNNvJW
         hnlB4LYnRccvPbIpkNHDSnxjMdz43/iQp8Uk8vPckes/SNIYRZLFZ9jJD8W1/CjUf3ji
         XHkR7vHNQKbRBPv/1wU8HpP+dwFypAkuMaoPZuwTI3SGdNcAAMPI9Nr1YytUXI95pVOn
         C3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914295; x=1708519095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48Kvlzn+su9jY0Vm4vzOkE0bGPI59LwwBJsDVuHcE+Y=;
        b=TlWhczkfgiCR4RmCqtM9Zepoqb4Mkt/QskUJzRj4LgpLHhTfcYH1Y80ZMeT3/+MJ0w
         diE+GYaF6Dpl2z7ASAKSDwbmSizFPYReo60Bky7lw3h0oi6HvZbqzDQ+aP7Orzm4VY6Z
         LT64Oz2mg9uFs2Bspg5YodjXv4GUXcBd0o9tY6X6gJNk04Nfu6L4RXyu/fr4SoxK2Ky5
         xkA042BR/xYR1QSgCu61uK/rH7Yre10R3t16AvHd8Cbep6stVzKc4ps8aT7eRva/z/w5
         Vt0KEo01lNSqfs5t0OT5yXw413ijlNCrBWnsy1guRudKMhUbhi2YaLYbFZR/4sQXd8CY
         J/aA==
X-Forwarded-Encrypted: i=1; AJvYcCVbNvaSJSjETKvOS03chlUXKKnyKIdCyrYuZI9mz7lpSU90KqDNmvEu4wwGZvUtbyz0l5FxW29WCzpRIT0Orgzu9q3NTv4gUFpprvkGrgfy
X-Gm-Message-State: AOJu0Yx2zUsRUm48w8PmaxNTe8g+QD45x7tyYRYZSdiqq2y8akzmGNns
	9BuRKZtkOM6Yi1+3fBwiKZaBILysecbSxnbPCxI4WcPvjgu3W5PLM3Eh6vbLFcs=
X-Google-Smtp-Source: AGHT+IHBBqpiWCuJIjRqRSpJp+W5dWbQ/msDnFRpAixpKjNS/H5nLpSvKlq1jB9lqsMLcmMLqvQUCA==
X-Received: by 2002:a17:902:6945:b0:1da:1d3d:7937 with SMTP id k5-20020a170902694500b001da1d3d7937mr2048287plt.34.1707914294910;
        Wed, 14 Feb 2024 04:38:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVki2Z3WrTpY40NRvm8tEbiYTni2BOP+Vz/m0jnkq1LJ5nIO+BXlYi1+YpL55P6nAAeZ70tS6rcQ9FXBc3LngUk1k5rap6lkZDxjXcts6p25eXLJDfrYH7vS9egyGB4UHfdtL/1enUDxsGQhB+OI80ygbonY7xSQ64wveTP7NsHYgjG5ApUhwmP3Rhzv+qeKdHkfrgeOQHom7tgaE6ui7DbZayXPXniP3TFPS5Uu7E2sjC02J19Jd+MMwctwL9ae1I2h7DIr9BCekEbCMx/1AiUv4xIM/eYG2FTJJPp/HKszsYT8lcYdkaCYxNlCgP7Pq60zX306awYmLYC4LXuI6hvQ/LWXp4r16jEs6NgAfdlLjGPeotzI52MIwUqO5jWp1uTmrPuRVKHejbViJrghAPCZryiembfyb62EeNV7B5Z1eWNyeJDtBjasn0tww==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/5] RISC-V: KVM: Allow Ztso extension for Guest/VM
Date: Wed, 14 Feb 2024 18:07:54 +0530
Message-Id: <20240214123757.305347-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043816_669184_567AD706 
X-CRM114-Status: UNSURE (   8.28  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Ztso extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7499e88a947c..f8aa9f2ace95 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -166,6 +166,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZVFH,
 	KVM_RISCV_ISA_EXT_ZVFHMIN,
 	KVM_RISCV_ISA_EXT_ZFA,
+	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 5f7355e96008..38f5cf286087 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -66,6 +66,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZKSED),
 	KVM_ISA_EXT_ARR(ZKSH),
 	KVM_ISA_EXT_ARR(ZKT),
+	KVM_ISA_EXT_ARR(ZTSO),
 	KVM_ISA_EXT_ARR(ZVBB),
 	KVM_ISA_EXT_ARR(ZVBC),
 	KVM_ISA_EXT_ARR(ZVFH),
@@ -141,6 +142,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_RISCV_ISA_EXT_ZTSO:
 	case KVM_RISCV_ISA_EXT_ZVBB:
 	case KVM_RISCV_ISA_EXT_ZVBC:
 	case KVM_RISCV_ISA_EXT_ZVFH:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
