Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F22C761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEI0mhYDvq5XMHUk7APrLLknScPc51ZaB++YcIMqwaA=; b=0MWw5I+UgP7K+0
	DbTCwLEmwdXmtpEdQ/vjv71xJikYJU7rIf04yeBDaq2qahhkzOJ/K5AXwPHgBA4hAbZ0po6eAq72z
	MDFEMiOHrFM+mn9HG7EH+lNGJKiu4FEw9O5IXwL6IY7o1rgcQoK/8saIR4Wknun66F8CKRyunnLeM
	eZTlXKQKSUBrizQds+renSdmqEApsunygz2v9RuLapgS2A9bxHIWNrUXmNEuZqr7KdaTYu/wicoUA
	3kkLGHqgikbk7QqJKppd4tOBCHNg/Alww0qZyPTbTckHRstlji6TvDef4LEcpBPhCS0UkAinrIIIF
	LhMgbW6f4c46BAkFiMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE2O-007KsU-1i;
	Fri, 31 Mar 2023 12:39:24 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE0G-007JUX-06
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:37:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so25220778pjp.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680266229; x=1682858229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WubBxQcFlbrCivsI8ygmIt3wyTH8vV0otzELm2BxuY=;
        b=S8SEwMexthg418jcoc/l0ZCHyde7NLs7axCIcKNjXn6/pDmhwVH7MN1pRPCb78KzNa
         FDVWax2ZvK8RuMsbxJ9XKNWUkQDiXGIfqxohzOe3qHDrdZwZTqMl+J89OFKRme09kbun
         5ZSa23mTHJibfrCSRY2z0luvXS3fkAqg0B4rjFpGnOUGPnQBReNCO4bYrpRSW0GYmJPK
         en1NRd3WTFXOB0T0egm20HwRfpWcMnspTvUc0tcufRTjHCDCQ/hFGn2QKMIXn0/a9082
         HclH91MlF0fbpypjtJh9lqtcA6+52YstOjrNZ+KXLwD1896ipDTHN6Ixdn3a+V1Ym1ku
         q0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266229; x=1682858229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WubBxQcFlbrCivsI8ygmIt3wyTH8vV0otzELm2BxuY=;
        b=HEb0/8LlvUv2zSulM0y09/2w55lye2eGVBpJrnIyQD0XOklN6D7mXQFuMTzN1VZ9Bc
         B4Ot6Aapot7oKkBxaNKlg4IX6hSFz6VHrzGz48rtrC23bnykxLmP1IZAo3evzy03WZwb
         TnkXPIHfwcLVyG9UTpkwLc2IeCDDerRzYfvhFQyuFlNYTDrVG57e+Sz/ZvHV+M1bCSBI
         yPNDxs5KuvWQ922OTK5TGVYKTQ68TcoP7Ks1TRk5xGxkxf4ceto3bXjtSg2OZXgrFaQC
         YrdXP3GaGwv9B6NT/PJxpgLP/dBqpnbV+BL64Gru8OO2SxjtMVDN2LIXRFJLCc0hnzla
         b7+Q==
X-Gm-Message-State: AO0yUKXMuC7DuXLV4AuDDHnoTHmwWauLpbALf5raGogEhnbbax+HzJ99
	ieB/kARvdu8NBGxq3gkv8Hin0Q==
X-Google-Smtp-Source: AK7set8oJnl1XWMelKBd0trRwj/ADq3c2QeaJ5pMHFOAmAusZzI9flMITHfHrm2lvXn9Zm+3OMJV6g==
X-Received: by 2002:a05:6a20:4c2a:b0:d4:f108:d8d0 with SMTP id fm42-20020a056a204c2a00b000d4f108d8d0mr22359696pzb.36.1680266228643;
        Fri, 31 Mar 2023 05:37:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id c2-20020aa78802000000b005a8a5be96b2sm876470pfo.104.2023.03.31.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:37:08 -0700 (PDT)
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
Subject: [PATCH v3 0/1] RISC-V KVM ONE_REG interface for SBI
Date: Fri, 31 Mar 2023 18:06:54 +0530
Message-Id: <20230331123655.1991260-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053712_077875_D0364371 
X-CRM114-Status: UNSURE (   7.95  )
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

This series first does few cleanups/fixes (PATCH1 to PATCH5) and adds
ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Improve ONE_REG interface to allow enabling/disabling multiple SBI
   extensions in one ioctl().

Changes since v1:
 - Dropped patches 1 to 8 since these are already merged.
 - Rebased on Linux-6.3-rc4

Anup Patel (1):
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  32 ++++
 arch/riscv/kvm/vcpu.c                 |   2 +
 arch/riscv/kvm/vcpu_sbi.c             | 245 ++++++++++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 270 insertions(+), 19 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
