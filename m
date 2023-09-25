Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C94CCE7A95
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxlXid/RWKEb9iwU10mylFGwqwsu/fJwmMOdUETDl6A=; b=F7GSEbIozG/G+I
	ocETxogGGRRHkZBh2/MV5ubQdDE98bDrgiIb5+pt+DPAGXiGhPkUPsvI+9K9BpNS7TreQ4HQCV98Y
	hYLaIlizqPRiYQju8AUTRADQd8wITvlRMhkflGCGYnjpOFgCNyvoQ9ldwnq9LXp9T3/p5p6Hq8NI+
	qeGhlu39eh6/XE3bTE1xKVrM7mFntUXHm8jvRPiCFv+52wtSSdj27QZTHMWWiZI8mz0itaUEbGK9s
	4qgoGVYF0hm0XmLOMVqYlPocCyoTTeP23QmGtzhsnBHuhkTDbRHJn2RLCLEN9YbfWBqJLpd8V0bzL
	fjGL3EONPWan8OG9hvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklog-00EMUR-2T;
	Mon, 25 Sep 2023 13:40:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloe-00EMSy-1f
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:40:01 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bf55a81eeaso42691665ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649200; x=1696254000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPmuiSFVvpuLv2dpw8j40AU0MURCdJR8iWnmtgcJS7I=;
        b=FfPA9pUbRlA0wC357xMx08gvAbdh1dZUwRRMJJfk2b9APqUUznF6W/OuXtbRuS75cn
         RiRoF7xq3iRZN8iYv62nSDNcaIl4I2dFEYh0ft2PisK8mCs/aYH5o90A9OBbPKf7lp4I
         pmb0imFpR+FZXBAjr+CsxtlCaCKH48mUXSF+k6JEq/v4ZSdPrEgVkDOmyZxvucljAesa
         6s79/STkanYcAB/WClHbvjsMQqqzkKjgkovQUF5fajrt6l09bPN/+WR8FzDoFxxa2/8a
         EoMSOBhnBf2AekF07su5kR/DSOPX2luuVzqaWzxet9y5kRRRO4u/0agixyO4ArN1iQhP
         zKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649200; x=1696254000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPmuiSFVvpuLv2dpw8j40AU0MURCdJR8iWnmtgcJS7I=;
        b=C4+02gsblCYzqfx+jCKb0LjpM/XjAKXBk0tyJpczG0xWL2iWYC6O0YQbowzdi21h7J
         ctUexNlw4OtEebHBXqhMK1wlMiAdAlIyydW1E9NXPQJiLqoowjU/La/9Dswxw5VdcaGe
         1ozkGqAa2zDwbxr/usC8YyEm4/s5arZlRWPsplkEkeso6sC6bE5YsO4w3xHQWf9QsMEB
         AGao+CZ5/37RDkzeK5Z8JdpA99FMeoyPwSD0xIgw5NCetaW4v0UJ1GHH3m8t7GpC7P9m
         9+9rrGHkVcbu7ljo9uT9kIjxlpvyY4c8DzDYhXJCl2K3fFdQb/arNXob1iMMpb7zaFf1
         hv0g==
X-Gm-Message-State: AOJu0Ywuv4CwmB02FXTBy2MS1o7ZqX5dP8+n2IH4/gWypmJMn5K5qcG+
	rPjHGGUStwx1t/lKjbH+YySFRQ==
X-Google-Smtp-Source: AGHT+IFcuHzEISHYsqsS06loJdvpvAdx2H/wZhHiDFd7zyQzTLbkzrgn8lJvzMwd/tIHrKUQmQk5+g==
X-Received: by 2002:a17:902:6941:b0:1c6:124b:6158 with SMTP id k1-20020a170902694100b001c6124b6158mr2189641plt.30.1695649199941;
        Mon, 25 Sep 2023 06:39:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 7/9] KVM: riscv: selftests: Add senvcfg register to get-reg-list test
Date: Mon, 25 Sep 2023 19:08:57 +0530
Message-Id: <20230925133859.1735879-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_064000_559943_4F444BFA 
X-CRM114-Status: UNSURE (   9.56  )
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

We have a new senvcfg register in the general CSR ONE_REG interface
so let us add it to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a61b706a8778..6cec0ef75cc7 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -211,6 +211,8 @@ static const char *general_csr_id_to_str(__u64 reg_off)
 		return RISCV_CSR_GENERAL(satp);
 	case KVM_REG_RISCV_CSR_REG(scounteren):
 		return RISCV_CSR_GENERAL(scounteren);
+	case KVM_REG_RISCV_CSR_REG(senvcfg):
+		return RISCV_CSR_GENERAL(senvcfg);
 	}
 
 	TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
@@ -540,6 +542,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(sip),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(satp),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(scounteren),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(senvcfg),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(frequency),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
