Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7EC04AA9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpNcfW+2a4kyz80Tea8Cttq+lUl77TTRnaDehzjwjR8=; b=S9QiF6Y2ET2ayK
	ZVkK1XfP4l2pO79wGN1nbXnglDD9xnvlLs0B/D9/CXTmc1F6mFW2YQECY60/XmKu3/d3aoqTd6w5j
	3wzxdCsDjhDBIbwGr+WCjQlSlTcRmxpKnBCV/gBscLVq5SRAQOtaQGie3sDg/c/dyU39Xb3gE0W7t
	3zsgS3EFhQZHSRf9shymvoJp1Zx2z4a3CjsWy29Pvti8M7gK4k0WsFvKN0b4WmhEzlm9HQOtRCKbD
	zjVoI+VUM1q8KAFQJgZhK8zMtIcUNgHOblQaaRC6aJxM4G6YjbLKevS3IkJYEQgYlJL1GEslWgwZC
	+CahF5ws4SKi7Zlbb4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPI-003XkP-12;
	Wed, 20 Sep 2023 15:46:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPF-003XiS-0u
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:46:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c3d6d88231so56010525ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695224784; x=1695829584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HIC1z+Y5X7nE4BXr1975QA3QvmpInOTVPTiyv7G4DQk=;
        b=YlRfkr6korfvSLurd3+Cl2+ZONeEyeHZAId8Uuafb3yLT2zTrMD5vqpzJ8upm9wXNz
         kNXwKdcrtZ3StmyBXm1PcHmKrM/IpSncQDkxiwG2N9lrsPnZdOfusrSXHylcnviCnnu4
         C3ObkAKCluAIyyIaTEAWQKQc25uMK+RkyO4mC+lhhLNz9/ArMcplke/O3O/VGoy+p8pC
         e6uBWJC7Z+7+iGHU6b4b1qeHwEP9yE2rdsc7rXCMYN1DAUPaN1kY0wuwMZEdPmZxrgev
         yLHv3gj35MQnfNovEZTerJH9UxkLcKqX+VaQZNNTmGupWzZQkmFMmbnaH0GhC6VrBDRC
         H7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224784; x=1695829584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIC1z+Y5X7nE4BXr1975QA3QvmpInOTVPTiyv7G4DQk=;
        b=G6DYJUTQM+QmuKRCoj9KO71Pwh1cyS6rhjUXK63Y/+eeIpih9fOK+fZQPPS00Op4Cp
         xurziRiw24E1IdlKJSxq8KjFa/O0FwLAFuA+e0mbKm04xqZgSCzz7HbOSr8lbsVB0wO/
         vozlB5KZnFNbZHuxNQSlLSyCsCIg4OOF5OrnN53n7yMYTApFLBNe23rKMEl1rU3xhwTe
         JXdfzbBQY7SQmFQwENUV5/ITcXnqiRFaFkboyRRnbtJeAbcrTWwYnPHvAAnQcQkbbnDs
         kcMS8WCxBaNoSocO1ksNbZiRBfJ6n4sWMGgJqxmyvouK4Tv9HrS6sgLrfElru1tSffen
         6HKA==
X-Gm-Message-State: AOJu0Yy7Dr9tAyY/w+qeXCNQSYkT3QES4AugIDty+50fJzGoJns/iCFi
	a2qeTIQLthfvFSXDZqlwzWAWHg==
X-Google-Smtp-Source: AGHT+IH3EjLrv/byDVEUBKjQ6K2VTEFNBFwq6oAb2NPMTHvNIVpZJ/QjFXRiSyjLYbNycwjvDS1j2g==
X-Received: by 2002:a17:902:dad2:b0:1c4:c92:2320 with SMTP id q18-20020a170902dad200b001c40c922320mr3107163plx.31.1695224783665;
        Wed, 20 Sep 2023 08:46:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.109])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001c0de73564dsm11995153plx.205.2023.09.20.08.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:46:22 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/4] KVM RISC-V fixes for ONE_REG interface
Date: Wed, 20 Sep 2023 21:16:04 +0530
Message-Id: <20230920154608.1447057-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084625_320269_87D78EDA 
X-CRM114-Status: UNSURE (   6.45  )
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

This series includes few assorted fixes for KVM RISC-V ONE_REG interface
and KVM_GET_REG_LIST API.

These patches can also be found in riscv_kvm_onereg_fixes_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Addressed Drew's comments in PATCH4

Anup Patel (4):
  RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
  RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing
    extensions
  KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
  KVM: riscv: selftests: Selectively filter-out AIA registers

 arch/riscv/kvm/vcpu_onereg.c                  |  7 ++-
 .../selftests/kvm/riscv/get-reg-list.c        | 58 ++++++++++++++-----
 2 files changed, 47 insertions(+), 18 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
