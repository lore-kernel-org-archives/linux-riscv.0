Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51411D6D251
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 01:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wQ5tlXaDLo56HhaBKKjr0HWKkuqIZehbcbe9enP0Ec=; b=R17ju2tDzqsplk
	CCzmc2fsDyRaziZa/ZowR8Ons6u05PWB5g8l2v+7E6Hcg3UjmWfDNvMYyBSiTwk+1ISAkyyaCqivN
	p78IsoFnNCtjq9zWgDE+DdSQu0TmRE12CGVJ3YeDq64PAH1cdw23k+jV5NN16qvQFYwKN8SPQ4fsY
	BQ3Isj4G4DR7nAl8INoFAPuhTxk8v8gE5qzPz61bfXBs4dV/S+2qanBLO6pMkaI5JxTvnpHeTEAp8
	IOBNzYiIAtbV7U5w8nUYmnIBsQkqIm65MMUs0J6UN9MSHSWERmLCpYo+sxkaSh1ywCFcOMq3SQMO+
	8dXLOwkKCcaEKmpvCCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSum-0000000EO2c-2iFv;
	Thu, 28 Nov 2024 01:01:52 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp5-0000000ELqV-2nnz
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:01 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-724e57da443so437729b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755359; x=1733360159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp0x5jmf6wCt1OmSFixie+OQOct6OMtePnY0hHC3FqE=;
        b=vXG1TsEY4MyTtnSbC7GZOYIeuRF7oNuAcr8WdHNvClitQaU3tfZjM8qzOc5w4C9i/x
         YCmli0SswK+FliO51jWVuAeCGK05tQfIVHBC9eXv9QnVzlQ5g/oe92YYRALr1l4dokzV
         klAcC3swn5qQsJ7MFXMLPu4sefW1bS7wV6oFbV2DKwjTZp8IXFsx0MURp1s2EncmTxhw
         iGGa4riwrsOhhg7tYTHhJ36wGHWMknnlJp4Gab87XDgXFDEDUFo0x1u/fINg7/mpm/cy
         /Xs0bHN32vHHU+OpxGhsS0mUiqYzZuE7WQS0azINZN4aZtmRrimKTpkZb7emkL6i7Ce9
         /nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755359; x=1733360159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp0x5jmf6wCt1OmSFixie+OQOct6OMtePnY0hHC3FqE=;
        b=U24W/ZjPdN9XMIDGaOhpoCzX/r4ql++3IHWUlInpIv0ivT04hamGYwBEppMhM9t51A
         1SbLUIiKlknyB1j+QHRZGCylrH72I/PZQuHU8RWZzp2DbAlG0vY4xYty6fgmUA2wxI1e
         VfrA6GGQvBsHHb12RsrueveRGdRR5eVbw8+bPzBwrpy/CxZoAWMBwPQm5a3o6N//6eL1
         KDgzjqeyDOlGE/oBhYSUq4kYpqxyK3Bf4MwSPzk1oQDJnKxiQZ9CZ739wUPUaTh4pHHf
         xdTWSpEy6pw9rBWxXtJmps5WxbAZMkPqEbYHu0guwUmczl2CiDFl0gc645w82a3clnp8
         Slig==
X-Forwarded-Encrypted: i=1; AJvYcCUinCWHDyzQC5Fypb6NGO1035WGfQkDtxEEqbqZW5b5+hrfynz/5jzVRjX2R6TB2+I2sKH+6VkQJFm53g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxExOHp0aPr72uP1XZVwr32ecKV80nufNg3VpRTT+qs2wAdb9Hw
	uCNep/qZByPMpOiY0iiIyRp6HDD5y2zVL7Mq9pdfr9Gi5p41ZvRMX2DI/7dX32fu4XUCPAXeCvy
	whQ==
X-Google-Smtp-Source: AGHT+IHRct+tg9si6FXkj3XDfvATucfZZx/pmM1rsyJ2yuaIieXkck617uTZGF3kPo5jFFwMAZ2X8QIv/Kc=
X-Received: from pfbjo14.prod.google.com ([2002:a05:6a00:908e:b0:725:325e:59d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1492:b0:724:f404:7101
 with SMTP id d2e1a72fcca58-7252ffcbf80mr6785726b3a.1.1732755358707; Wed, 27
 Nov 2024 16:55:58 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:36 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-6-seanjc@google.com>
Subject: [PATCH v4 05/16] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165559_737272_E8350EB6 
X-CRM114-Status: UNSURE (   8.00  )
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

Rename max_guest_memory_test to mmu_stress_test so that the name isn't
horribly misleading when future changes extend the test to verify things
like mprotect() interactions, and because the test is useful even when its
configured to populate far less than the maximum amount of guest memory.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile                            | 2 +-
 .../kvm/{max_guest_memory_test.c => mmu_stress_test.c}          | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 41593d2e7de9..4384e5f45c36 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -140,7 +140,7 @@ TEST_GEN_PROGS_x86_64 += guest_print_test
 TEST_GEN_PROGS_x86_64 += hardware_disable_test
 TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86_64 += kvm_page_table_test
-TEST_GEN_PROGS_x86_64 += max_guest_memory_test
+TEST_GEN_PROGS_x86_64 += mmu_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_modification_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_perf_test
 TEST_GEN_PROGS_x86_64 += rseq_test
diff --git a/tools/testing/selftests/kvm/max_guest_memory_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
similarity index 100%
rename from tools/testing/selftests/kvm/max_guest_memory_test.c
rename to tools/testing/selftests/kvm/mmu_stress_test.c
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
