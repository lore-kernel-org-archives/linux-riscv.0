Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921ECCEE328
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXttY54b9sssUWBQmZ5P5O0PR7jVBDEsF7UBqTux+bc=; b=rffb6ArYPzv2XI
	tfFfeGhnAosTyUHdtcTknpZlYlwPKh/voGl3oL4pi2IEKmTQdrQ+aDKWGEJKvtLuvEWNcFAYsRVLX
	za0IJIb1kkEfBVkc1+jbgi/H1OIPzxM5mqdcRAtuhqNzT2oD1zwbv8vYiBXGy5gnTcRXA2G/dPs8u
	l0H59cFjpkrNugocRlz0ktHW1gnrV4kdDye4/SsSBK6zocxsmpe3s6LaD+uJPDj2++UrAmXUXZsCA
	Vo8GXFwJeqyjus+bYmtya1IbY+Jy1HOBfyc9tfVybQREpWHfhwx8LEjPllk3a3GYKhg3CZCVGVkLJ
	zaHaltX3UjFaFfgsYSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ4O-00000009phL-2f2J;
	Wed, 09 Oct 2024 15:57:48 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYwv-00000009o4Z-2u5K
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:08 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e026caf8bso4522389b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489004; x=1729093804; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=x0cgmo92qPc8MR1y7gAJGg1sCyN/CNSLMfDMg1eW/5U=;
        b=v+PyAs7xiXW4JO4mkqRxca5B0uiPlhu7vlTcAcClWxQSiwpRYSNrqd2aMjIceW6lyE
         BSEhb33/syvmGwMTEj21gasth9MqjcxaWw1k2p+ILICHT3bjkQYDWv1K8aMEWKOY0WJk
         qZBRoYFfJ/TnX2h1+slwVUJVh/pma1Ve3oInfATojFO68zYRmcRFdQvbUyC156ZsROpZ
         8gYvmQlmjikDmsALjECund8ccEIFi7QEL3noF8/t86Z22f7wXdu6OKdXDPodr6JmQzPO
         qV+ND6wRejh0cwSuKNcMfmm26Ez6KcpfTXk+FiZZSljPT/FAsjvSSqoL765HJgvOTDN/
         tJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489004; x=1729093804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0cgmo92qPc8MR1y7gAJGg1sCyN/CNSLMfDMg1eW/5U=;
        b=rKCQ0AJbuRELvgU//f2SllySTcUFRis5A9SoZFMCg3pAUC5YBfuPaZ4/rkSQ1eo8Zw
         XCkI/9eauKALfO6hXOEccT+kdo8xaRf3RZrLxEPtGhVnJvAuk/F3JqajjLtXx0IO/U4K
         PRac1zlTGJvohyXaH77WrUezmHM7gHxeXBl1+peT/jdp16pIzq5S7tMblRd+EB5VxkxT
         JHSOKERQgC7qiOy8bXPKqFJkejp6mU5yy/LkLUp41HGrpNGS+VIUrZZMnRrGoEMDu2P8
         m+AsvE1pQ2aBBk/KcwWaeWOinxtuWqYn8vm60fCH1EXBaNdC6wWMmxvAwnZdp8OEZObV
         PEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2ut8yk2gII8zbWdj6eJeNdbKYRGm3w9ichAdSOOag+8NMMRvYVJEcs6ofDbI9FcnWr/UOJ8dZbSKb5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhLmf0hATzx0t0WaZUeJeAws4kgP7riV6Mnvf/HVnjvPdUxPct
	d/D5Fel+jCI44xI63+gLDU1UYGijks8j/956jue/823S1WtjYOd5ywyukHA1WNimD/9Cdt+X3Un
	MUw==
X-Google-Smtp-Source: AGHT+IERUBPfneULnJ59z0o0A04D0VCwsGKXUdX4SfWVGxtKdYKWNTs8AEtFgRMkbcfSQG42khoM/WAQWlQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:4fcf:b0:71d:fb06:e79b with SMTP id
 d2e1a72fcca58-71e1daa9410mr6141b3a.0.1728489003716; Wed, 09 Oct 2024 08:50:03
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:43 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-5-seanjc@google.com>
Subject: [PATCH v3 04/14] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085005_818634_F377772B 
X-CRM114-Status: UNSURE (   9.16  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Assert that the register being read/written by vcpu_{g,s}et_reg() is no
larger than a uint64_t, i.e. that a selftest isn't unintentionally
truncating the value being read/written.

Ideally, the assert would be done at compile-time, but that would limit
the checks to hardcoded accesses and/or require fancier compile-time
assertion infrastructure to filter out dynamic usage.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 287a3ec06df4..4c4e5a847f67 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -707,6 +707,8 @@ static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
 	uint64_t val;
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_GET_ONE_REG, &reg);
 	return val;
 }
@@ -714,6 +716,8 @@ static inline void vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t id, uint64_t val
 {
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
 }
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
