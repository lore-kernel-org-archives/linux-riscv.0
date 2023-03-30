Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA17C74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=45r9FM2AOxMJeFcZmFXjUqzVdz0zh5FsPZQcl5BYWuc=; b=S2Eo0jweT5EWHg
	kxPoe0KkH3IYo/+RAkZ9i04Pagtd6FbAeZ70tIc2hfIznVo0WXSTqLmjiUNPxv1IkcZwymulV8FGv
	CnKMAELGMOwdeqJjLPGm1JsKRjo52+uppm7iGEz/kt1De5nQKyJdUh3PJtJml4kKWiKpDSoIYEs60
	0p0Khyxn3j0SkOdIrLXLkJYUzk3PW+ce0JCLy1HE8OIXKr+OyQx+grldtW88GJ78hUJnGGSlLHFCZ
	1eDKOdfzMvgvy4RSjs8vN7iO+A/iTSymoZpjuIsIJL6haiY2yCSbmq6tWnsxJGrq0Vcs239tV2NZL
	duXAB0BvI/VDJd5pzooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phkt1-002dsm-23;
	Thu, 30 Mar 2023 05:31:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phksz-002dra-0I
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 05:31:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id ix20so17078983plb.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 22:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680154303; x=1682746303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk1AZy2qFEyjvylQLY6jxHy9mB3bZFdpUzr5u7mcFDQ=;
        b=LVbSIGiTJLdBhYVCuUXDk99DIBOElZogkYo2xlFsP/RJY8AMviKhoOOc6Z8UxOlCe/
         ee6g7h23GyiqgeLSIz0eDl9GlgOAQi4AaAoIxAvX68k36p34gHbsf7RXLBPnGErK2Uwc
         PEBEc/zt3NmI8z44N9+Ra3hsk7OnH+FzACwfOsRvaaXfvhkjUjRrpmhCSqCeIumHy/Ro
         5KQtd2fEFaWlKO9N+io09140YeGxYMJY8g5NMDjMAympJYa1jKJm6QbeDkpuBZEboUm1
         xBVHMGwEDXRWRbynlkl6Bx590NxeURzo0TxSYSG90C6G7mLRqU0guWGjxCAoiCql/y1B
         oK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680154303; x=1682746303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk1AZy2qFEyjvylQLY6jxHy9mB3bZFdpUzr5u7mcFDQ=;
        b=bTBjh4hEhPKN8NVpnE9qGrjJ/xbRMNGwtV8tD8CCEPvjgDd5QKGlyVpdjlQRg+fAJq
         PeYs/CzWsJtaXHrupXcieHsq5N0QB+JR61rx962mfpnH8e4lKBOyTkJxXJn9FVK8Wo4l
         vXQ3UksmmqbTGEuBRCzOUqynvfuX1vTGb6vdzHpH8UPPA64PPL+y6BXsAdCUATpowePY
         /6x0gqZ70YxEOPfRAGZRmQ6cbu3ogXiiPJbsQ8l2+yMOJvkImc0+HtwL+uRJTVRQ8a/9
         i4V1yB53o5Q1a4+Cp04SmuKG0rQZZgWYsC2sBv7jruGUvXkSnhmiibnAEy0Afr9ycxBM
         lTog==
X-Gm-Message-State: AAQBX9dP+YxX2pc2iMI5Fprss/kWS23Spf9I178OEAXdiGpyDlGYODyD
	0GCl0nTOoEDRebxwGDZrSxY/bA==
X-Google-Smtp-Source: AKy350aE7bdngjg5IIgS1UxGq8xDzvhDrXgy8lFpylzU6iEo9v1FLV/Nozx4DDYBl1fLzkcYKTfkAA==
X-Received: by 2002:a17:90b:1e08:b0:23d:1118:4e98 with SMTP id pg8-20020a17090b1e0800b0023d11184e98mr23520185pjb.23.1680154302983;
        Wed, 29 Mar 2023 22:31:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.30])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902ee5100b0019339f3368asm24045679plo.3.2023.03.29.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 22:31:42 -0700 (PDT)
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
Subject: [PATCH v2 0/1] RISC-V KVM ONE_REG interface for SBI
Date: Thu, 30 Mar 2023 11:01:34 +0530
Message-Id: <20230330053135.1686577-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_223145_156918_2D57404B 
X-CRM114-Status: UNSURE (   9.15  )
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

This series does first does few cleanups/fixes (PATCH1 to PATCH5) and
adds ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Dropped patches 1 to 8 since these are already merged.
 - Rebased on Linux-6.3-rc4

Anup Patel (1):
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  20 ++++
 arch/riscv/kvm/vcpu.c                 |   2 +
 arch/riscv/kvm/vcpu_sbi.c             | 150 +++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 163 insertions(+), 19 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
