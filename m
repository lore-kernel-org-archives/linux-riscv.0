Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED1C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vxt/gBujm3uprqJZnj+EzaYyAfRTrNot5hdBgTGB8qU=; b=PUQ14C0VhN4Z0T
	LMlVemQe+gttxrTK1uwHtRhhflKByGrkD2FdId9xeQYVvglFJoxfBGG2/FVr/YRk8MfW2Km3KXFz4
	Y2guQ8E3rJOoA94yvdTlX/XPHQWxO83U595C+5UaYWlkZ2tRHtA8ONIGMjj9ihNcw92HNGxL75mup
	1n/vM13FXsFkaHopaVWl6mwhblZehCShcF9W++lpKwQznfxjJbRDfKIIAkGpyFCRfg2fCtX8XIjxO
	jcfG5R/CeuNoue1Z0j7zSTGy5U/lvhinN/fJit2lJQh0hL3Z3vJYvhcNbM9NY/0TCfHww7gKF2X90
	pr++2KTULI//9njlvqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTX-005Z8a-35;
	Tue, 28 Nov 2023 14:54:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTU-005Z7U-1u
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cfbda041f3so24539305ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183247; x=1701788047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5oGoP2GtxpZiKciaDqaxx+4G6dOpwmCS0pkpDHBsR78=;
        b=bjPyoMCxZP6oIVTg0p6eZ2x9sNGtYLQelm2uD5yIdeYQ+nG10sHFO4zB+tjs97i7uY
         kvOqbCmy8DP3DPeLcHoOpm/KMgvcl8ELbEY6NNI6+zQQpyElxbYh0HzJhvmBM3J1z4A9
         lmLlggT6piAa70k4P2YNU6IMSobejBi9h0iffmIwFkrnP8j6UlhMyxwFmK+cdsOTrRtC
         +cCPz4u26u81fQ/syKAbkHRWvoG+c51rUv0WDwRarNfbOirvKypaWIGE4EpDfMlaWtM2
         xbKl+lPFTB66a2aeHVzj/W1O+TgwyX8IbeonRpkl1Rmak5dDNud+p4GbFICmVGigjuij
         tc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183247; x=1701788047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oGoP2GtxpZiKciaDqaxx+4G6dOpwmCS0pkpDHBsR78=;
        b=mm1SYyMV4+iwOm6SJvdBfIzJHsdRP2Rqo02GyqvUSVxGRBzE4BnvjNaza+iogo6M+6
         ZIz6D53wbTGGv9IprNMF+B5UXp1adK28awYnzMDKSm2gwnQlwoZx1I73v+EcyhneoXoc
         T0VdI85cmXxNqyBOFdW/hhfD8JJ6sXtycQs0zP72L4YrVbFR8JKmMsNT9ONKEyR5eY5G
         W4tSGS5eRpTJkhVYAtJd1KfwD+gcdSZXxhDFHpynpZYuXNtC0TYC6SrsmhUAG9g5N3i0
         592xo8/i0jR25Ma7JDj7YFGtyw/U/gs1bijN36NKT/Szii4QGMsJBc7uKbO3cQ24JAy2
         qRKg==
X-Gm-Message-State: AOJu0YxAkscXRpU+HGa5gvLQGFNF9CSDudPFky3oX9HlT/TaJfyUoZIo
	HO72Lep4iAtLVxSFZOfmybUGhA==
X-Google-Smtp-Source: AGHT+IGsBlwznYL+eO1YLtU9utrEhljJYsPZTHdTwczY6ki0/qgSD6wR3fyYBpktQqzZ0f4ggbB5sQ==
X-Received: by 2002:a17:902:e88a:b0:1cf:cf34:d504 with SMTP id w10-20020a170902e88a00b001cfcf34d504mr8424957plg.36.1701183247023;
        Tue, 28 Nov 2023 06:54:07 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 00/15] KVM RISC-V report more ISA extensions through ONE_REG
Date: Tue, 28 Nov 2023 20:23:42 +0530
Message-Id: <20231128145357.413321-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065408_632051_20C43EE8 
X-CRM114-Status: UNSURE (   6.91  )
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

This extends the KVM RISC-V ONE_REG interface to report more ISA extensions
namely: Zbz, scalar crypto, vector crypto, Zfh[min], Zihintntl, Zvfh[min],
and Zfa.

This series depends upon the "riscv: report more ISA extensions through
hwprobe" series.from Clement.
(Link: https://lore.kernel.org/lkml/20231114141256.126749-1-cleger@rivosinc.com/)

To test these patches, use KVMTOOL from the riscv_more_exts_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_more_exts_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (15):
  KVM: riscv: selftests: Generate ISA extension reg_list using macros
  RISC-V: KVM: Allow Zbc extension for Guest/VM
  KVM: riscv: selftests: Add Zbc extension to get-reg-list test
  RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
  KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list
    test
  RISC-V: KVM: Allow vector crypto extensions for Guest/VM
  KVM: riscv: selftests: Add vector crypto extensions to get-reg-list
    test
  RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
  KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
  RISC-V: KVM: Allow Zihintntl extension for Guest/VM
  KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
  RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
  KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
  RISC-V: KVM: Allow Zfa extension for Guest/VM
  KVM: riscv: selftests: Add Zfa extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h             |  27 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  54 +++
 .../selftests/kvm/riscv/get-reg-list.c        | 439 ++++++++----------
 3 files changed, 265 insertions(+), 255 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
