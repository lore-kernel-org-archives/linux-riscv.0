Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A53BCD3434
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15R0KjYi1R1Px69bgkf7fGvW0gi0Y1VrZ1iWQRszypo=; b=PwzHQx9IpF0wfz
	IR5JyMqvlEtaj7Zlv33WO1Wz4jG7R1FqaKG6Zoid9VskOGa5DIYAf0+pIvVe6eCPBXhpRDmqwfEcm
	7xE6Z1hGJrr6hZ2EYMUV4bQudLKve1zWTOyUrduePa3s6EcoJ0S77Zra2VpJQtnbfF++ExIhEiXQ+
	tE6/j+7/Tt++I2nj4Cc0O6xWCTa5ASf3rqtmV3fpGDHYTAp3+5neGxF3sc2P2Zh5lcy46yhzVGj7D
	HKtymcXoKw/fK9FQN861r3BW7nQH7rqOcavONIYQ0v4LwABMZ0Z7y0o1A+J8Vl519OpzU18xjCgVd
	7oWzM1qj0zah9ybERblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRom-00Gqxx-3B;
	Tue, 19 Sep 2023 03:54:32 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoj-00GqtG-0e
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:30 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-565334377d0so4292922a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095666; x=1695700466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfvmhBSCKy1EtjBZwA/dMnNMj/Sq3SnHobn1iIDa23k=;
        b=PD4qf7F2oGXUFc6COPckEaqWDD9sglOJWG8m0BdWMFh88Xor/SUle2uyF9zke2KJ6g
         hl/3ka9wR7VBIm9gcILOM22kVFh0O8SF6qIKUCxddI8HmgTA9zaUJkoqlySwfeUzwSoI
         4xtG3J0+nkAEX+z/ZJ+ahbRBez5EGP/OEAQWIfjR8GB8yIHpFOrqvxVABI6dcHN4RWxR
         CNkS2Kdol7ym/pV/xHWOG+1Ew6pUGYQ//LXy9tDeSMsN5tXg0dvawppgzvp+l3VxSEWE
         UVzKCJJ6tcqEM0WvvjjsZMtyNE0GjEDhcskSdj4VKvqD7ad1O7P1ARJipbIu2ohHFmIz
         rnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095666; x=1695700466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfvmhBSCKy1EtjBZwA/dMnNMj/Sq3SnHobn1iIDa23k=;
        b=L0AkzYjR0ilisNIP99XwMG/OVvbw4+PtVXN/rzorjOv6G535a24ClHKLrcOmFl5hcf
         FxH03aoAASvlWDBQhl6t/aOy98iq+0QZTdsxOyLVTivd3upadArWzE1SfCSQeWqpPnMD
         g4HfUtSTpx3mjLrDW+L2qDddviwTo3rCK780/B8lJi4665LCPnly/hNw1soKnidJtA6w
         0bo5miD5iZf00WVC2sIRkJ4fmJEjyzlNfNfhJ7YbjtEncPGrQCtPjHNYCevoqvp/9WWb
         abmWQiPPeLSB1ecjAwawySdhipUGI39iHdzM/60/zRBNnqgPigx30x4mxVjziPAr2Cw3
         oarA==
X-Gm-Message-State: AOJu0YztgacMCnHstGXXFhMRURsr1G415py71FR6k/PMTYBD2Z6PXqYX
	1jnJOtgqzUP+dkLwQppPKuT3vTP1Sc3R8VEZZ8eBJQ==
X-Google-Smtp-Source: AGHT+IFWOuCFmAAL9BpJh0Ux9/VFPokWaaBfZihC75JvOcaJslymvgs6sdUGv9tDlKZqw185zQ04Vw==
X-Received: by 2002:a17:90a:4e81:b0:262:f449:4497 with SMTP id o1-20020a17090a4e8100b00262f4494497mr9895737pjh.2.1695095666229;
        Mon, 18 Sep 2023 20:54:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:25 -0700 (PDT)
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
Subject: [PATCH 5/7] KVM: riscv: selftests: Add senvcfg register to get-reg-list test
Date: Tue, 19 Sep 2023 09:23:41 +0530
Message-Id: <20230919035343.1399389-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205429_248199_0E777C82 
X-CRM114-Status: UNSURE (   9.72  )
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
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 85907c86b835..0928c35470ae 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -209,6 +209,8 @@ static const char *general_csr_id_to_str(__u64 reg_off)
 		return RISCV_CSR_GENERAL(satp);
 	case KVM_REG_RISCV_CSR_REG(scounteren):
 		return RISCV_CSR_GENERAL(scounteren);
+	case KVM_REG_RISCV_CSR_REG(senvcfg):
+		return RISCV_CSR_GENERAL(senvcfg);
 	}
 
 	TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
@@ -532,6 +534,7 @@ static __u64 base_regs[] = {
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
