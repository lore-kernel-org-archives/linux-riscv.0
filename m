Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F34EE57DA
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEdN8ZkzmhGziaDQvsYxhAfxmlrxa0u3bGVSvDy2FdQ=; b=qBwFobw+CsYaP7
	xh2GSHt25Nv4GiRLF5NJqvbxITUgsipBSIs4sEO5p0AVzB5E2XLPp3E5+24H2uCd4A+o4KFJpVBU5
	G8YyAJk0tcxoyxSkP5jFbxjj/qEOrUdpXcvG6UmsAAkPsqNSBilgbgK47MXR8lYh1Gzj4gLhjREsY
	5asGlAmelLjRbFtL0Z6rrJMmNteuBnqk68moRP7hwlRxrcztrSkH5YxlanEAHhYbfHlv3hG+5VI2b
	+W/kAZPp8CRY/VhgtqCcvp+PtjpMeMvItWLF85Z1RkA/1Y994FvBwVz62FbaH7FJ407GOuB76izOJ
	k4fWoJ7EH992hfSQYQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUDp-0000000AyHv-3xMd;
	Wed, 11 Sep 2024 20:45:53 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAY-0000000Awxo-0qtM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:31 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-205514676a6so3956305ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087349; x=1726692149; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSI8dsTyNYYmZluhAXeYyfAeB1n1NlxlB5JW+pr40RY=;
        b=P5UrEw1BbgyBI92+F/30zhwQtRzK78LsAW/mwPicp971AQm9aPQkLwS2ZHIUa9SBaQ
         4rGEJ4Jf4P4voOBPFTjNMlHXvQf5iojPAzDI+K2xJlmZMm/HiMXf/mN7XQNEp20YyXKz
         pGPuzFEJBA6FEqI6+mzF3/9AQ1hvEE5bsyiTM7FPMgPePbEPSSEtHEvc1T08qIvz2QX3
         tA7cZb7d23o/csn0P0hpP6z5IEBkiGRJrYVKyqWICbNbQnwL75SrkZluG+oj8CQ4jQlx
         9tTRJx3pvpml3R4VCJdXaFkg/xryzeByWqLS1g9xbH6Qq40eI+C7SZ4t4OhImrZeEsLN
         b40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087349; x=1726692149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSI8dsTyNYYmZluhAXeYyfAeB1n1NlxlB5JW+pr40RY=;
        b=LQzmq/dsffLNOp6fJbq4hAFh2a4LFXOHdxzXHe+swqFTEN5F6ShChIgjftSF4q4nNs
         9NbN3KwsMsr/r98oEcmlaZrYH8h/tow2VG8SW2L6mKna/mk2hI9HR7ly2iRmZhUIFeru
         NiNdCp4zkocTOVlBMU5pBGFMRHIEisax18/vMSbOKR0WEad+KD5jGL0k55HWMm327TPJ
         UD7cYQo42Qfmc9W9TPRJ1vBO+77Y4lWjOKvrwj/qc7deF1FYI0tZTtRZTMngbZA5wINL
         FT9AfAofDVXGGXG+aCeUwrgGnJ8N8tU1iaiixLMjCkXZ1JG6WMj/wUYtIKd69hol5JuF
         RgrA==
X-Forwarded-Encrypted: i=1; AJvYcCUIlTGqPp5IPcbJpL4EGA2CMutqoNSala3p4WCBDl10Sl9ZiuI0OjvtvQo7SsIVzquy3ign4+gACMlkYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkpS/hDbc/+006gu8siGbuaGbqvi7vRtqrXesoiZBk44e8SY8X
	FOoz9AAsYwS9peNJr++wNZz7huNh6tHI70m2S160s6O4HniwV+kXZ3V6awWw2ivxScHjumfQqTl
	O5g==
X-Google-Smtp-Source: AGHT+IFVhcOXMpYuiCLKMEBjF0GLRF0droi6YIr05t4juUD0iWZSecyCNUnHqr+/fAL8PrR1+nheHNVoid8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41d1:b0:206:99b3:52de with SMTP id
 d9443c01a7336-2076e47cc2dmr175945ad.10.1726087348954; Wed, 11 Sep 2024
 13:42:28 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:49 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-5-seanjc@google.com>
Subject: [PATCH v2 04/13] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134230_267837_B383F1CD 
X-CRM114-Status: UNSURE (   9.39  )
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

Assert that the the register being read/written by vcpu_{g,s}et_reg() is
no larger than a uint64_t, i.e. that a selftest isn't unintentionally
truncating the value being read/written.

Ideally, the assert would be done at compile-time, but that would limit
the checks to hardcoded accesses and/or require fancier compile-time
assertion infrastructure to filter out dynamic usage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 429a7f003fe3..80230e49e35f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -683,6 +683,8 @@ static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
 	uint64_t val;
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_GET_ONE_REG, &reg);
 	return val;
 }
@@ -690,6 +692,8 @@ static inline void vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t id, uint64_t val
 {
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
 }
 
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
