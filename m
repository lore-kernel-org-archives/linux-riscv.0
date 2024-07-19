Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B8C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLrrN1SCu5RCCtw31++kJVF3GUhzuTEG58HDl/h8qEk=; b=2kbW+/VHIhaqn1
	eBszzYdqbIQL3/EQuEkTEKKUOX6QyV4ziGGwt0/WCxBJQVBPMjoK+bbXZ7dHTQjrHOOsKLMVjr8AV
	5aDzzkcjSOia0fWkWqe1GUZMkr3r5+MzchAmbQXncV3ykq6gR+qGPDCs1kEuaW26aq0t8eo6c2fu5
	3ljZuXKG0kShpJbZRbS2bAQxowBDB+VspZYUJawxeiic/A/uLeqtOSGgEr2eJe35EcPnyoeFvxMY8
	hw6lQafyOrEPD0Cp+ZZrJ/EupwVaJtQN+ABOoMr8TLuuR8NQJVXnkjmPGy8DpYjXvUWC+eZWQy8KB
	vtLSG6CxOxe4UuUoPmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAm-00000003B7u-39AP;
	Fri, 19 Jul 2024 16:09:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAj-00000003B6G-3GBq
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc4fccdd78so14282975ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405368; x=1722010168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4afLvyEEC8RtJCW4UQr1WFckvidc7t8VQbZfjqmPCBw=;
        b=GM4IfbKoYR5NhSsxwRbmON73o++Ylw9oXrf2eT6kF3g1XkT3/FkswaBJohVwHj7rdC
         WVKLfJGNm1788mGCEZ/Lf1WZB6iffF3Hv6IcvvrIJcvmGOCT4u9QovTTHzRQFgLZmT6f
         8JWEbJWF5F+xbZI+QsLN8nHdRxuk58dEz/alMW2xS0PGewSV7uTnxBaaSd9pMoyJSEP/
         JQtJGJqnM7nxOUpbcmX1TgogPYjJdFyr4/ig0wzaDTTswqesixeKM1r+Fm3dA6+LO4Z/
         tXZXUC+eegZrhxWvLv0SAmiUvEWnSfqRc69oVenVZsZCI4ymUKzABD535TAEjm8GfiUF
         Gp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405368; x=1722010168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4afLvyEEC8RtJCW4UQr1WFckvidc7t8VQbZfjqmPCBw=;
        b=VDCvWdnTKoXQT2lroYghlAa8sKTprRRCN3sn3nsp1zcCjs3glsWA6uC+SjSsg72GFf
         y0H8k8aiM4bN2I0L5vID9kJ3ukXz/fJUH9Q4/QYwlsoj+SPBCH6eUSk0eb1PvFo/Mehc
         Y3JP0fon+sPXdKuSEeETeOuT+vFldLWxXfW3Ra/HI5cYXTfIYBhOrScLlj44cpUTxHmv
         O1+rXVEO5jzPmFM1LDoxQMLQZyA83sdAA8z1i1GTX88AF58ltiGQ5TJhKuGxZfawcied
         pI8XAb9VYb9gt5M2rpwl0qBgtHk1hF4mh/vWbxPlHuh0GHCkI4+YiTL78AM3SwrDy3BV
         aKvg==
X-Forwarded-Encrypted: i=1; AJvYcCU4RyHmu9qkINQaQLqimMbCZPWzMzDQd2YA5SxckB37TMZ+V819lImILt7E6MI8v5SWOZn6dqTOa83bpYI05wAMdyD4CT+ts0pDhNR+7F1R
X-Gm-Message-State: AOJu0Yx6ql4wZptZqBrTWjg3YX1OWh07Tm0wnnC5vT5J1+t5eiOixUdC
	T8abfxPlLlJVMmABDRAIxuNl0CyZLNrEGiE1k9qSN/ETOeRgogMS9J/nT/Ch6eU=
X-Google-Smtp-Source: AGHT+IFvnzeRYXUnxpbkoVZbtYpLHtISa8TDnsAJ4DZ27uwiHvkB35LGFVFo5pBDK1eTxYFOHUVg1Q==
X-Received: by 2002:a17:903:2306:b0:1fb:55da:c3d with SMTP id d9443c01a7336-1fd745637b5mr4123095ad.25.1721405368211;
        Fri, 19 Jul 2024 09:09:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 01/13] RISC-V: KVM: Order the object files alphabetically
Date: Fri, 19 Jul 2024 21:39:01 +0530
Message-Id: <20240719160913.342027-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090929_838116_6019FA1A 
X-CRM114-Status: UNSURE (   8.12  )
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

Order the object files alphabetically in the Makefile so that
it is very predictable inserting new object files in the future.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/Makefile | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c2cacfbc06a0..c1eac0d093de 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -9,27 +9,29 @@ include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 
+# Ordered alphabetically
+kvm-y += aia.o
+kvm-y += aia_aplic.o
+kvm-y += aia_device.o
+kvm-y += aia_imsic.o
 kvm-y += main.o
-kvm-y += vm.o
-kvm-y += vmid.o
-kvm-y += tlb.o
 kvm-y += mmu.o
+kvm-y += tlb.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
-kvm-y += vcpu_vector.o
 kvm-y += vcpu_insn.o
 kvm-y += vcpu_onereg.o
-kvm-y += vcpu_switch.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
 kvm-y += vcpu_sbi.o
-kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
-kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
+kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_sta.o
+kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
+kvm-y += vcpu_switch.o
 kvm-y += vcpu_timer.o
-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
-kvm-y += aia.o
-kvm-y += aia_device.o
-kvm-y += aia_aplic.o
-kvm-y += aia_imsic.o
+kvm-y += vcpu_vector.o
+kvm-y += vm.o
+kvm-y += vmid.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
