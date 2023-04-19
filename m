Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45907C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCIMz2Gc7AUZNN4gRy1X8Ck5sXnv+LeX+06Frjt/tVM=; b=mPF2bgSY/aAncJ
	kBqLqUO5K432nYfcH6nWxB25JVhyuOXPYhzG9DnRQ33+QOaiLMluR8HWNrHF4ux1/rn0JXE7lba3+
	HUxfAbYXlLG/rWjz98yZ3jRrO6nkMNKOc70HKYXyjn+BsBZXAI2preMQSfjjaWh0QdDctcnLfTZxP
	KEdM02AbevSV3ZLeyTkjYJl5QcxrsPjH1B/ljS0FfAoOrqv/3nohMqrD0DcbDcdl+UfATWXFbTRzb
	SV1mobZBiWcKT8P2AcWEnidE+KnvhPm3g1AmH0ogker7n6jXLgozbjS/XE5kELakI0UBiv5uKroXw
	akAW1UGyaZVYUNXTJB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDf-006Ud4-0X;
	Wed, 19 Apr 2023 22:24:07 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDd-006UaK-0H
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-246bb512038so200194a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943044; x=1684535044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXsqDGUR1sIAzl083YrDdeF8Dcz5MG5TcoJ+FCFYQPE=;
        b=ohOEHO7BV/FHEqjDiY6pG/sbPPkvlHxUUXDxUV7dZqgZIIWVcpKe0qvs+coh7D9ZRh
         B9hkxCLFKh8o9nAC2rlRn7bMm1mBtWYtjnNK9pkEtJDD583cXnspj2Ze6kFtPx4sD05T
         M0i9ezLAErgLCl4r/YZAwl7ub1kBW72A2bCM2VN+GllxhNlhbw4174U5Fs0Rqs8lwuLx
         6dFmv6DPhfk7Q0h+47Fu4cY06lgOcb8Yfc8WZoxCPJavUfQg727zdhXtl53U+ZG5ga3H
         Ua4k+o9Cp2yjV6jziSpH7zmCITKPG2JXN/AwelqUy5IqPzKZ18t594Y0qlAjZCJGwgwu
         OUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943044; x=1684535044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXsqDGUR1sIAzl083YrDdeF8Dcz5MG5TcoJ+FCFYQPE=;
        b=LGlSmP8eZHQCrs7b9o9kIkupL89i5S76Tw9KbJbQNBP/1ok2nAqHq6e50Bhpg7z1sc
         Bz7YdXi0BjgJEVB57IBk78vU+5T8AH1WAFF/1K9ZS16fzqocdZTpeFF2pUkrKsllVeyz
         pbyQ9Xtji1ML78gjLARlz3HJNlyawTcHJ6aO2H0TqVoBuBiA1QuE5ec+f0U4wgFB6zoH
         bLlj7ZrZdRP3G7hT63GeXq7LYH8+wCHRYW5d/9jOciIZtzuHn9yx2XbaQ+/OCinrkNlk
         5wyP/U7w0sEYpAW2D5D0bTGgUjdtV0LF5P1lsLj7lccp4I5FV9uulL0jUk60V+ftU/zX
         he5g==
X-Gm-Message-State: AAQBX9dn2uxmPHGnKHCskMV2ucPeSFVt4VK8LUYAghg6lzSZPGtjJktL
	O0nGntKu6PqXNm5xVsAH5+ZBLw==
X-Google-Smtp-Source: AKy350ZHJJEltFWMtiEqeoirE/coBcaQIIAAD+T2dcklEUVhjT2GbyU5FBvkRUpdkDap1R/DwivJLA==
X-Received: by 2002:a17:90a:be01:b0:247:1e30:5880 with SMTP id a1-20020a17090abe0100b002471e305880mr3727645pjs.38.1681943044256;
        Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 01/10] riscv: Add a CoVE VM type.
Date: Wed, 19 Apr 2023 15:23:41 -0700
Message-Id: <20230419222350.3604274-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152405_121969_83ED3ED6 
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

The KVM needs to distinguish if an user wants to create a CoVE VM instead
of a traditional VM. Define a RISC-V specific CoVE VM type that can be
passed as a VM type.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index ba4c4b0..000d2b9 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -911,6 +911,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+#define KVM_VM_TYPE_RISCV_COVE  (1UL << 9)
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
