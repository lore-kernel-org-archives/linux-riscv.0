Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F0CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKnNzB6R2F5lIpvEdvWmBWA9uaSk1lTwKBEsHQoqCHU=; b=JpG60+oSHDyn/y
	JBdRfOfql2/11QCJQ2585//NZ82MsN2mVsrgDnOJkGVV7SCU4XxFDBae13rJcEI6SFqeKMgwRglYA
	4GoCnd+r/Ie48tvnRt1DVh0lkKUaEqzjKSMNNSYZ736SB4cRSLFFNtdBzJmmV2Iy/L5p/sCAm6wWb
	Lfwx6/09/v+2CBqx49MHe6f9RxVAkSgZgliYT3QsSXVRWQjv5FcSv41ru3t4Zen9m4tv5mDfn4upb
	ypgQ8IMxOwGY8YEeXejB+Yrd8rBT9ADQOAzxSaQJALVvCUHoMA0TFEBXW5YTc+M3oEgEEmPwvbYoo
	5V7f1fHNqxICDwHLeLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ9n-00000009rFn-2qET;
	Wed, 09 Oct 2024 16:03:23 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYx3-00000009o9c-15Yo
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-690404fd230so59402567b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489012; x=1729093812; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BR1gG58gw5F7E+LpSzoPu+wX+wiyja7ptJ1fl5K+zYE=;
        b=pQGIZ8/ItOX1aLlfzAYEKKw0hseHlQKP7bZ4BB/xdCVUeF+Q3nKQCVbfV6pIhe9LP+
         aKVr1xFsMH461/3W4I4k5rw76xRannLf1ITyH8tp5ztNK1A7EqZ9//0/s72xKzu2DYZK
         xxP9/iUVA9vxVxDVkIU0DWlkW2P5UGz9Ma6rjdiCCDTQM6KhJmrFJJ3jqp9NYm4d3yTk
         GwwqYxpt+nolONzBi0Z8wsuuvS0ahC+i9ymgKfVxnY8vWBYHmUYu8l4VGianNrVc4j+Y
         Kgl4V4+6Q+GSgwW0BCY/KVUB4CQYkKg5MJg32Ujl7eEh2ZQDIalosLV5ynJs3OiZrPI0
         pTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489012; x=1729093812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BR1gG58gw5F7E+LpSzoPu+wX+wiyja7ptJ1fl5K+zYE=;
        b=VdxMftgxBhpzkT1CNfcT4rRWCVRywpZleJf7au4rcHx0aAijaNClQ+PV3vjjpaAwF8
         pERVTolf2AR6eFyREptMDdjT4LhKWhmQYoG44CHfG4flSnHD+A+BXNLHgvdlmgwKyziN
         d020K40MB4gPwYT0wcktn4zQbEUKGqJgtEy0iRbse0ARdxMiSaCCK09jPi+oG8IPCwIQ
         SjxpkzegMgfJDOMQX/OUsl46scxmSBri/46c/bROPtJj8nRrAh4y6s9AvXKZtTNpyVXY
         /lPhxrRyspPbyViCou7ZUL1bf0PSZwyvBG1BuzV5Yi9dqMZ9XUYqJ1qYNJjHqriD3t4b
         V5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWZGgB7c0cS33douqcBDqPm8tL+i6rYHEDOoFrVAYph6ZJVfM0uhfooXijjzpIZYxhKGodGJCSMr/5Syg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfT1h9wRhHagY1o/VOhO4EGGuZKbvB++rZJrudgAHZ92IwZ8Hl
	b45gsfLnIT/jHkLP/0WUvQs6Z/NOt2ndVLmvSXLbAJabkmUkcGlAB94xJvfTb80Xz/nBNex25DL
	Qtg==
X-Google-Smtp-Source: AGHT+IHLwQuTuSKn2K83jzMORxhmnJG2QJIDSetKispH+vrqgQjqJfiOQ3+gOO6ZQgZWYqSyd9aEi5B6J6c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6948:0:b0:e29:6a6:ed83 with SMTP id
 3f1490d57ef6-e2906a6f043mr903276.11.1728489011277; Wed, 09 Oct 2024 08:50:11
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:47 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-9-seanjc@google.com>
Subject: [PATCH v3 08/14] KVM: selftests: Compute number of extra pages needed
 in mmu_stress_test
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
X-CRM114-CacheID: sfid-20241009_085013_509322_10642D66 
X-CRM114-Status: UNSURE (   9.25  )
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
