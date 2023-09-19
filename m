Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C3BCD37B4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nnbcrKJEufZIKFePgmE1AOoSal8jagtwR/6I7OOz1U=; b=GcTmSG9GAiSrHs
	5R45izdM5UuVgSjHRCorT71oag8zvKdG/ftYL1RyHQsh2g98GGRtnB7ksHZhI4qM/nUfHkZJtQ2CH
	CkC4j5+jojFViYzbfoHN+S1OTXYgGlqNHz12/kN1B1OaWbxiSJXZNq2BN7O5kSQE9cRx/TM8mvFgr
	SqXBdEq7ntdPnQRGLtjuHB+Lq9Yl6LR1jRqYde2gV0MFgOVb1rTXKP9MxYU9LSMQks8LAHfluKOyq
	kaEjTySuzZ3lDM3y8diI8uviCz7OZrB+ibwSsI+67b5mMRnMSNMIVEsbn/v5KNg+vKNt/cSu6Nvm5
	BR0NA2il/WHOuGJSlV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRox-00Gr91-2i;
	Tue, 19 Sep 2023 03:54:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRov-00Gr4O-1I
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-274d1a5c90dso1820134a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095679; x=1695700479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8aNxqk/Fio7uz5AQcGG5V7O/R7HCZdIqvfTNBjv5gM=;
        b=GwpE7pJILpGBBenwm8GJraKdkb/Fd0+S0GwORJqnofZVStvwNJfRmEinWtC7H82fc9
         JEkQ2VFZcW84OXu4rwA27nbHC1PPEZxPbdKyhSito16KcwLt8lFjQP0/lyb4Q7POraEb
         i7opPTgBWlmq69wOmhJo3RQHQsLpnybW2FAUXSSoJ86kc57wU2zBZsemRY6sT64jXAp1
         Bt4BW7NJqJjudeKKS8D2uKGLHAlVVSUDm7wfAJCE8X04g/WzpBiKI6Fj44Ha33jrW16b
         K6EIWC4bbIeu6BKMk7H1iW/i2Un3EmGlNy+zxgTINCnrGSG5Qs4mBgcM5DxlByo4fm6G
         aNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095679; x=1695700479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8aNxqk/Fio7uz5AQcGG5V7O/R7HCZdIqvfTNBjv5gM=;
        b=MD2DQAcw5dVZubbRjjZGJiGy/BFhS1W/vO1CTeU8o5QxLF7LZhAJ8XnXVNraxd+Ury
         Qwt9xeOoc5uiG7W2BZDxshjdwSY4mSPnF/rfoKnhKs394oYa9O93ueMXRrWeW9UHOKbG
         0EE3GxKQLJ0QkFfTrPzTBrVpYEsVpInI15wGNQP5TB1HnHxQEV1XZZZpBB7fXQu4+wBW
         vAYrTD9ApcfoMLZlv6Gr+sC0MwrqwKPfIVfaFRH1sQATFE4ugsheikm683ZZFVFhdjCn
         ctEGxOQ3iUM5Lq0KstwHnvRUW78ZiNH9N46529ZiykxtBsnjw+4hpJmzKok0VF6FuHNJ
         CFzg==
X-Gm-Message-State: AOJu0Yy4gojKTlowX0EYSpcA8HVlW4zTHMTO5beOT02o1VGh3tY0VZil
	wGPdeRtufuTrhsoMxt9AXr26ow==
X-Google-Smtp-Source: AGHT+IEiYF6goUFLSD0qNIvl8mZDssbeUh0IABgs8W5u4Ug/kGe3A2Yvna7zl18arf+5N6NDqFqfWQ==
X-Received: by 2002:a17:90a:5901:b0:268:b7a2:62e8 with SMTP id k1-20020a17090a590100b00268b7a262e8mr10313711pji.7.1695095678874;
        Mon, 18 Sep 2023 20:54:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:38 -0700 (PDT)
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
Subject: [PATCH 7/7] KVM: riscv: selftests: Add condops extensions to get-reg-list test
Date: Tue, 19 Sep 2023 09:23:43 +0530
Message-Id: <20230919035343.1399389-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205441_449909_ABD0320A 
X-CRM114-Status: UNSURE (   9.47  )
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

We have a new conditional operations related ISA extensions so let us add
these extensions to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 9f464c7996c6..4ad4bf87fa78 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -50,6 +50,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -360,6 +362,8 @@ static const char *isa_ext_id_to_str(__u64 id)
 		"KVM_RISCV_ISA_EXT_ZIFENCEI",
 		"KVM_RISCV_ISA_EXT_ZIHPM",
 		"KVM_RISCV_ISA_EXT_SMSTATEEN",
+		"KVM_RISCV_ISA_EXT_XVENTANACONDOPS",
+		"KVM_RISCV_ISA_EXT_ZICOND",
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
