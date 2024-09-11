Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B6BEE57CF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBp3AOPZs/+WG8FOIAzf/6Q1emaQWVrJDJsZZKb4Tug=; b=EBRxaf2PpNhD/e
	xwUVLSOg4bxP3RIwGigvPV3pw0AqBtuOH7X2kUO5ItfizV+XPJO3O4grBVW/iUvZ0BACqPrSkpDBx
	Gc6UJ3WS2Vb4Kk6SSvuYG1tKjMMV3i13pkZ43h56POzWZDT7Su83cK26dww5GJAKxLbzcXTSw43zN
	QGUP+/lH6kqFol3aRTxcrNp0Yf05iS9yjNpH8pxfFxW8tqYb/APzfzdVzMKyh4/vzSHfc8/XHd1TE
	1REDXWd3CsyJVSbU32a4X15J5qCTzKIzfSvJwQqDq1L3crt9ouRlNltJCWdeN0kxM3baHYPl0ga9d
	/WooFttuoPUPh7Ks5vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUKG-0000000Azn0-2rzf;
	Wed, 11 Sep 2024 20:52:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAg-0000000Ax4L-33aI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1a74f824f9so704798276.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087357; x=1726692157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=47BQJJiikboIPrV2PD33si1kPUmickrZ0k1m7wYEIK0=;
        b=ShO1z0gbrTzxwxPIXcB2vEdq3+csHFir46p2yV3MQ/pIJ3TKj4LuHdhq1K55MEX0Sx
         1FwQrQr044cBq8PwvXMFMFrdbl0Sj79dbgYtg1E4NWVH7S0d19ug2aX3244OhOrfmZsr
         FRRQeKhWjqQcPEU1g0H9aXMM0GxY4JyixdFVlmYkLMkdlirT3NpCzlzHHb6NBXD3cPDH
         B3gzzQzvMxgNRVPYdkrbPBPPwaWBsPBY6wbc9c7xWy1bW8PL5oaTi9M1bl3BGlijgBRf
         5QQwAZRCU6wC4IgBsoc9qcaVcnuNa8fIUrOuFLCgTDtbsCEThXZSsO2Zx92WHiylMOYr
         x7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087357; x=1726692157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47BQJJiikboIPrV2PD33si1kPUmickrZ0k1m7wYEIK0=;
        b=Tqb/Q0J+zB8KItqd7BozjfC1VZLBOADnP/wCBsSYrDA12Nh+6+WIO8P9RhvWc1UJbe
         EFC8Lq68OanuZE8WCQ72TFoWGaF16t7nSAsE5rz6E2dxtgi1FlI4fJBkYSMBDEMkh/vU
         tlrXT4PSlc8Z2kE59aDaKLdiwTkun31yQQ6RliQiOuImYW0K/CLMHoWp0qwN7/7wbEob
         KEuG0qk7BoXan7xVCM+JQ7dLElXw5LRypXCqtOJPOu/wMg7h4nGhM0yOxfu/6nnJOtvz
         f5ubPk+oZ56hEDtqSMQ0BHpDKUMhBQcE5kgu+ItzOn0ianAknpIS4hHC1NooylQ3phfT
         SIbw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFBTXGzZmn5UZXeHd91+hPlpnAy+E5bEB8vPKG10NL/uQoZ9WxhLll6kmGikr4o7qIPTBTGRxnSitSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmiCrOJxMZUZ2atrXpmXcZSuf8tRQvJxJHpnB4+wcjSkdByDW
	iC0C86NA3+HCj06Y3K4zg5WaN+FekdHTQxPo2spuC3yunKBpfbAQ6KX6KPgacd4TzZm46JvYpQN
	zgg==
X-Google-Smtp-Source: AGHT+IGKCOrdvuPh1JFZJTD4VhxgbmNdEtpijYplyDxOyPTYxT/JV5RegfErX1F5y84KkH5DsNf+hpV7TUg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c206:0:b0:e11:7039:ff92 with SMTP id
 3f1490d57ef6-e1d9dc6f379mr708276.11.1726087357418; Wed, 11 Sep 2024 13:42:37
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:53 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-9-seanjc@google.com>
Subject: [PATCH v2 08/13] KVM: selftests: Compute number of extra pages needed
 in mmu_stress_test
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
X-CRM114-CacheID: sfid-20240911_134238_842431_3C17D9ED 
X-CRM114-Status: UNSURE (   9.02  )
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

Create mmu_stress_tests's VM with the correct number of extra pages needed
to map all of memory in the guest.  The bug hasn't been noticed before as
the test currently runs only on x86, which maps guest memory with 1GiB
pages, i.e. doesn't need much memory in the guest for page tables.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 847da23ec1b1..5467b12f5903 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -209,7 +209,13 @@ int main(int argc, char *argv[])
 	vcpus = malloc(nr_vcpus * sizeof(*vcpus));
 	TEST_ASSERT(vcpus, "Failed to allocate vCPU array");
 
-	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	vm = __vm_create_with_vcpus(VM_SHAPE_DEFAULT, nr_vcpus,
+#ifdef __x86_64__
+				    max_mem / SZ_1G,
+#else
+				    max_mem / vm_guest_mode_params[VM_MODE_DEFAULT].page_size,
+#endif
+				    guest_code, vcpus);
 
 	max_gpa = vm->max_gfn << vm->page_shift;
 	TEST_ASSERT(max_gpa > (4 * slot_size), "MAXPHYADDR <4gb ");
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
