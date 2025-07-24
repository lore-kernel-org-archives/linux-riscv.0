Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60769C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PjUILhrkhlSO/tFdJ7Z0PJCTqzGcU78CtNl4dIGe7+8=; b=yQB
	iR+TJbOoUCpgrSFpJNFc/Ri0fHRkYkJRhbfXCPgQFXrRvV0UtdWaTFgJe7CvmR+25NLVbzpejPLPx
	QCnt2/BilKZAQgFgT8+VEui3TTbDj3kV7E3/Aley0RstB25Kjcb/ZyalmpXN9xw/Au4ZJYS3juF9J
	mqM5uxnUCEkj3qURnyE2icsxN3e3uP/gpgbQE7LKL6xyIlVE+unlPvcFsm0GM3myhh0IC7XYNAKH1
	+oDrw0+nyPYeYpaFZ4ke+dUWdZqRKE8bby0Y+PDFgAC/r1CJ6aqQVmKVNiKTF3/OA85EmZV0jRe/r
	+todOKz98PHDj00vdHFeOLNOqLHzWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XO-00000008VCu-1WYT;
	Thu, 24 Jul 2025 21:31:38 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XM-00000008VCF-01Jj
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:31:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b3beafa8d60so1998318a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753392694; x=1753997494; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoZKgCIOrO9fiaHmGjZ2KQUGK1Rfay/CIlSycJOy6hU=;
        b=un8PNLCxip8hoTSitPy6dfIGJp37MsidrQHB9sSpoH/0Pf4QPkNv2RTdLAWeAOYu98
         +pnsJZ5jkR8cNFPd1IzcCyDRn6P3ms8kB5eL6FaXQRMO+Dt6BrJA+fHobPEzDfSNuIK2
         5kNJmBNUWBgcAFMKPX67VK6pwlSnPczyAXicUHlYdVwvmKcnUKYHr+qhyF7aZVpCs9tA
         lbCYJBhIINo3SDnZs+GVVsR4kk6b0fgD0Asq5HA4A+cW14N1X5j2Swk6KBkdrJ+H3d5S
         XzLvvfdSAf/ClwYKZGipvXX2KW6XnphY7oBFU5pSjaXfDO0VRMbHFGUVi4vLdPKzH3x7
         82DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392694; x=1753997494;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoZKgCIOrO9fiaHmGjZ2KQUGK1Rfay/CIlSycJOy6hU=;
        b=WxJCgTYpeCsM0qwTy/2uVTCqWAnb0SVVizggNThvwoDtdY97ofSanri6viBd6AUym6
         PcGhysFtIis2c56uD5bgecBvJF2Hw6geelk8HSUz0L/6CHnwpud3DEwZ1BWJi+b4M8Cw
         vyf2Httr6zTOFrsnzoOxx/6GojwYUrlXGvzv9xGnAJ/sdyPQA3cZkw8QlnhPCP5XK7FX
         pNK+nGlhcTSyodkuk1A9bGS1nWIUnr2KQoZPft6JJ0iAVtBz2k4++FakF9k/3UU+nMlE
         NrhhteJmZCNqoNBTnp+eMRHLxlpkbDkVHRD0QQWlB/6zgWa9XLJr+XxgHF5Egh6HNArQ
         7mtw==
X-Forwarded-Encrypted: i=1; AJvYcCVC9Cu8I0LOg9djGNtUpSc8J1Wq4gjkT3YjBTJH48JKsnNwqzVrK4CC+koEzChjIFECL9yfKeo8S3aZEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbyMZATaW8CQI4mrkX3OxjrpxlwF7wY4z4lGAGey/SD3qvTVrP
	qTh+b+RZhHVQcOcamp9L3JOI/xOr3c2tX8WhcW2bJdwpcMatX5FYOjHnDWGM9cDyEXEoFBKAm4V
	kjVl8vFfZJje1Dw==
X-Google-Smtp-Source: AGHT+IGa4HSIvnJk8xlqcYJbo+CMkm2iwXvpM9aLGNVhXmeXjm7wBYtftdzXI2DPlbRHTaPn9OI4bV2dd7uSvA==
X-Received: from pfxa12.prod.google.com ([2002:a05:6a00:1d0c:b0:741:8e1a:2d09])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a125:b0:23d:45b2:8df7 with SMTP id adf61e73a8af0-23d491c0514mr13047162637.34.1753392694322;
 Thu, 24 Jul 2025 14:31:34 -0700 (PDT)
Date: Thu, 24 Jul 2025 21:31:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250724213130.3374922-1-dmatlack@google.com>
Subject: [PATCH v2 0/2] KVM: selftests: Use $(SRCARCH) and share definition
 with top-level Makefile
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143136_058293_5C3DB541 
X-CRM114-Status: UNSURE (   8.15  )
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

This series switches the KVM selftests Makefile to use $(SRCARCH)
instead of $(ARCH) to fix a build issue when ARCH=x86_64 is specified on
the command line.

v1: https://lore.kernel.org/kvm/20250430224720.1882145-1-dmatlack@google.com/
 - Split out the revert of commit 9af04539d474 ("KVM: selftests:
   Override ARCH for x86_64 instead of using ARCH_DIR") from the rename
   to SRCARCH

David Matlack (2):
  Revert "KVM: selftests: Override ARCH for x86_64 instead of using
    ARCH_DIR"
  KVM: selftests: Rename $(ARCH_DIR) to $(SRCARCH)

 tools/testing/selftests/kvm/Makefile     |  8 +++++---
 tools/testing/selftests/kvm/Makefile.kvm | 26 ++++++++++++------------
 2 files changed, 18 insertions(+), 16 deletions(-)


base-commit: 79150772457f4d45e38b842d786240c36bb1f97f
-- 
2.50.1.470.g6ba607880d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
