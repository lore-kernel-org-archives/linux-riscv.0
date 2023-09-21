Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAD5E706FC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fR6ecLuefQVPF/2/qfZMItQ6j5fsmdOLgZjmwT/3600=; b=aSDr+78AFx7+pB
	eJTZhF7MjwUc4CVFxAs4W31vM/Rfi9Ac/KZTEmgly82nsH4+ReUkQC7D5uCJmDQZIE8bhP6jZOuA/
	QIUcTCT1wcOsZN9aLPFRl8rz68DCQAp20mZjvS2EhJOqsfaaHXNzAFr7t+9blur0NnmhwZRsbtcTD
	4P7s/CyOJP3LaPyJ0VCJJSb8ME/fZHWIaYIjZHt8WSUrjhVXDzkbnrFqtD/FZRTk0t+Wr68n2cwxL
	ZOiPMlc4BXupo0TGTQqizCpiwoICwKSbKFekrBtdPnBjEdmjcf5WkOtL5dHOJV4296qh9rzvT0zLq
	38RhS9yq/58IETcaimBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGE9-005cd4-0u;
	Thu, 21 Sep 2023 09:44:05 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGE7-005ccA-1N
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:44:04 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so11484161fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1695289439; x=1695894239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bnRaCddT87p/KTPHMcCblcFY4CEmmrLQIw4UVRv9/9k=;
        b=JY72tUzA0AZ4O0+RGanbM4UIJraH2zToA7z9h7s31RkI3AKIbMEBY7ETporiVrjmJM
         jxzYx223e8K2NOjVGL0XvZmB9t8N08V69MdkR3e3Z52+t+oPykz9miQM8dl7JM1K//Qm
         LxWadhL3NtSN0LHAiZCDBOEWGIrSduHPWwpJzO7BB9GqEcrW785xuDI1CZFKL46GRN4L
         5drhnRmxozQ0WeUjjMd2Ma/IXfkWFO3x71NXJaS6UENdt88iKMpCoPUJhIGww7+8Ntwr
         jTZR7+y/m7gE7vxAtu13+eji3vqaItYt8Hh9W6m0Hdl2ASUrIfiM8cMc61q9n7OaoKDo
         m7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695289439; x=1695894239;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnRaCddT87p/KTPHMcCblcFY4CEmmrLQIw4UVRv9/9k=;
        b=tfNyT4d8RuH4UPSe5+7lVeez6Sn101EQP00JL/jX0zV4vyF4PTUwzlI4OfAD9vJw22
         yYX271eHKTCV6lPK56/KEzhChZlF2EGuXMUI2YNOgaLriIUmvhcKXOdXayrhr+JMem58
         1qmmEhY5SEccgVMr7u+qaL2rb1wqp9Hd04QVlXkwqEFOlvpAAdQrQwjGd/4sdGoq0P7l
         BNigYYnn9Yjp8b5llR5L37mr4NeMirGKPXy4Lp1zgQuO0rlJHwtzKxdJHOpP5ZpCRm4L
         nEL+AxosXP2Z+hnB9KtzIvNh6DdeHL2bcnEaL5WHhHOOqeP9DFw1IvMfkt2/QU5yhPJ0
         po2A==
X-Gm-Message-State: AOJu0YztPg7oIyhhxgxH4vcLnVINl3HUpZ1Bl7otST8UDuIGNCq+EpBu
	haz2Ye9x0jmYfNss/TTck9WHrAOtXKCVGvSfSosWNQ==
X-Google-Smtp-Source: AGHT+IHOwtovTmgwsWby+OJoyDY5AP80lEelm3HPPd28DmjZCPyC/5yiOXdj9uKZ7G/HXWgyBFm1cKA1bFemo5pLBa0=
X-Received: by 2002:a2e:7a18:0:b0:2b9:20fe:4bc4 with SMTP id
 v24-20020a2e7a18000000b002b920fe4bc4mr4081500ljc.40.1695289438673; Thu, 21
 Sep 2023 02:43:58 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Sep 2023 15:13:47 +0530
Message-ID: <CAAhSdy3dL1JBSsu3yrQtJKavAkqMva=YotoV_y_+-kt0S0oVNA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.6, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_024403_657305_4BF49BE7 
X-CRM114-Status: UNSURE (   5.27  )
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

Hi Paolo,

We have four ONE_REG related fixes for 6.6. Out of these,
two are for kernel KVM module and other two are for get-reg-list
selftest.

Please pull.

Regards,
Anup

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.6-1

for you to fetch changes up to 071ef070ca77e6dfe33fd78afa293e83422f0411:

  KVM: riscv: selftests: Selectively filter-out AIA registers
(2023-09-21 15:04:05 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.6, take #1

- Fix KVM_GET_REG_LIST API for ISA_EXT registers
- Fix reading ISA_EXT register of a missing extension
- Fix ISA_EXT register handling in get-reg-list test
- Fix filtering of AIA registers in get-reg-list test

----------------------------------------------------------------
Anup Patel (4):
      RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
      RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing extensions
      KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
      KVM: riscv: selftests: Selectively filter-out AIA registers

 arch/riscv/kvm/vcpu_onereg.c                     |  7 ++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 58 +++++++++++++++++-------
 2 files changed, 47 insertions(+), 18 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
