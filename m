Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA291EE57CF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SCABIBiUS2nRqTzV4FB3i20uqC4BfrzMn+Q311lIlw=; b=0va/TEDovbulQb
	xHIPTEf14VFwxYjSOYu4ceU0fOXhdfEQlqurrMP+LkSx0vysWOEkmYPMa6pOaOcvFVPMlyFzEbmHS
	tnTQD2xH5F0GLQvdRDJ8AbCPw/NBNDVa4rf5fQIegh4saiUso7FhmhdBURss4L7bT2iAyG1Mw4nLF
	40pxKFqSnIDOvou3EXOTBh3OODVzq5mm0YDUOoomlM4tvbiXMgta0T/1dD6LyooeYqge19FvPOyzD
	F9dlu+jiwZTH+5dDavjrf+6jlqWo3WrxY9Gf80izY/MUtLjpIeHwDInKZ4sEeYhQSRZnAcT0sKosX
	U2ceyKSAxFkd2lmZnLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUI9-0000000AzJj-04gR;
	Wed, 11 Sep 2024 20:50:21 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAd-0000000Ax0O-0KXp
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7d8ad26df06so230004a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087353; x=1726692153; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/zCwfp6P0Cp/T+by076ZLxu5O+Esa9Wy3+GZFib04b0=;
        b=aqo3UT9b0KP+eZCGU8qPWMSJ6dRsAMjHoU3NyKFSOkFi/VUIVoXv1y3nQyWSVEmb//
         FUXUSHKuGjQLoV5/5wYQJGbFuk3CfQMn9AsfrefIGdHJHw81zahg42/djXJucO5c3279
         kxSuyVJEdP1RaRT70WzVnxw8K4L7ViobQY855gLPM6jiar5u3lI6NSG7K/gEUiscJ28v
         Sn5Uw8D6ESBIqypL2D+D6zbDlNlyTOqLKAL8XYDCos7iwOwkCx/Ho/kqbirqYkuOvTXp
         Vgrj/e2+oTzv93BKZtYzDYPfM1EgjVPlZsFgCvorg2W3FmnmL6JOtkvJedthM+OSlODk
         za7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087353; x=1726692153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zCwfp6P0Cp/T+by076ZLxu5O+Esa9Wy3+GZFib04b0=;
        b=xD0VqzAcpXVlvTY+5LjpUk8Zt5Ja9v/ivZL4teGbB6ffRiPdpeK6Nfbp02YQIrbcu4
         OI5rjoEAL2CQL5X4bsPl4LFjAHP2OJtY8QVuLNkcp58BS5AgAqGtyCw16q8bfyE1Ir1y
         w03jgIw2Pc/FGDheiJjjRpSC2K5a1+ggEh5juSsuf9yRcNTyyKN2nYwPnQF7PPhOOOXC
         nQmdXxGfsS5v0H0JRZO/kWIuPjqTGkD0cfSBi9M7KE0v7B+NOcOEx8b15kamhX2IvAcd
         YH3BKNvmGQTzRdR6q3DJOMzBAslUpcMEA6RicuWiWaeYaegju+r4vCj+SJSm7v3yNI2I
         +fPA==
X-Forwarded-Encrypted: i=1; AJvYcCUeY5MpiBwx3mTW7A5eQO9VXcUPbvZhQg9iXequmLlyb2h+x10ZQMT7si9IvxKfVc0Vlwx4WPuRObwBJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk5QZnKnxnSfi/myByqVEHQkUGFClA1s4LbzfmVQjlV5nrM2na
	/SBnoGeITLS4SSIkZNwYP1qQzeXzlQujrW4bTGoVrzoq1i5BUIuTlg4K1NB6U9NDESx+9MpLcvd
	FxQ==
X-Google-Smtp-Source: AGHT+IGUai264jNYdPregUs2lG6efJQ9mB9ec+8i+QUzJ8LDBnAP8lzvYrxYOQMf2YPIMJvqww0dvL1st/8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f68a:b0:206:c5ec:1445 with SMTP id
 d9443c01a7336-2076e44b9a6mr10485ad.8.1726087353017; Wed, 11 Sep 2024 13:42:33
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:51 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-7-seanjc@google.com>
Subject: [PATCH v2 06/13] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
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
X-CRM114-CacheID: sfid-20240911_134235_139088_61BE6E9D 
X-CRM114-Status: UNSURE (   8.75  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile                            | 2 +-
 .../kvm/{max_guest_memory_test.c => mmu_stress_test.c}          | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 48d32c5aa3eb..93d6e2596b3e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -138,7 +138,7 @@ TEST_GEN_PROGS_x86_64 += guest_print_test
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
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
