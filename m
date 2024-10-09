Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DED1CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mzr2iiWZHcoCc6YxK+Q0m0AjKNMhjnh848sTMUVGqhg=; b=4DGNxRrwefjyJv
	X+LmyyW2dJssNR7IRQhwMwfGYJVm59ADFNYkSoXcYPsWTVlTArmvJJLdksVlKToXd3KNYm98A47gX
	GtS7DnW9DLzqSbE/sn1VSVSC1avVTafa0oSfA4NYazchuY1FaTZehBa3aj/cX3DY4nAz5vuAOxlTc
	IB4sMDK8fO8YoBRMJTeWUR2t/CYfZqabo3gNR0DCwZ2NYANguVW4k6wYVh3PtCqI427hQxPHbl6/S
	lCOrBv6+znOCvDYdACjxRPiePrDTA/0YBopl5qgHDdjrGn6f7CAcVDk3tbBzD+w7ACcr0dYcagfVd
	h+YlcWtsCc+oPvg2nQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ1m-00000009p7O-0f4e;
	Wed, 09 Oct 2024 15:55:06 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYws-00000009o1j-22Ut
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:03 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so32503276.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489000; x=1729093800; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jVTsixz4sZ4koZFPUtECwdZDuBQDlBcuBCpi0vcsFcE=;
        b=LSL/q5Dc4Q+q/frFy+sc3H93KZHX3UUDkxdn8r9y7QgvSXlkxAkprLwhWAOixgNK5n
         cC6MCXYfEULoSZnknkkbnNOMgBSrUL3OaMDTGfDYraGLu2mJbWkAkL5wsTb53laVBMx9
         9QA3PvnBrUdhZ2Mw12bT3csJoGHX4spyElVmwLidFVFw4cn7gnGF/1J5Cn0TYjfHsY/F
         +zd4DGKmZH2W60uZz7FHvyw/NkWV4ipUXSNcJlJE2XKgddZOZQdZ4TGCUWoWfXdgX77Y
         GuTFZVtKU/8BWn7kNUWgjA0h0r4Xi9kmOCj1oDVqQm4SX5UAU3/+fJKGBeiA3VU5CwdW
         jbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489000; x=1729093800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVTsixz4sZ4koZFPUtECwdZDuBQDlBcuBCpi0vcsFcE=;
        b=NW/0aNfhvA8ZGtzOebe4yME7U+JEQexdiDkjyGXctF0ZwNhkFpm2Yxx/kkC/pCqnvn
         wTyScF9M463LqWA8ZKsCPfS/cCo252w4aVK4HR/0MgE74Wxn5eo3xseiaU2xS7q5+lw5
         m/MjuKT8i+mTY+OPQU2whQyJy2g9aeJcRnk07iIrWaO9Cwle14kh9EdvqIiEsCYIiq/m
         L+taGtRupInhYfGXMGa2GTBdi6xBcapYSHlMGZB93RKP9aov7sWfPbMg20zKvjYLLNYQ
         DSA+YAe3uUFDgfmlzL0fVYr9tmq/EPO7af+BzhKl4wOI0i/EMsYFDhAMBx8qHtyK4w8L
         9veQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1l3YZLuxVbxREXSsysANG0QcFG3k17UT9mNAJmQWdsRc4URUIeYD4s4fZHnCTRnquvPAnKtAyJT+eMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMRnWNlYjRbkhzlps70d4wtwqAlhUf80sS08M+MZHZoGl3zrBc
	QtIcLXefd/EarWhYgkQhhmehFC31iJi1hj+iE4aDK1+UiLbtWT83p8ZTnSqJEyIUzB2plS4WyR1
	fMA==
X-Google-Smtp-Source: AGHT+IFJReZxJVdNM9WOc4CTIpT8xwBaol9zgUnZweoXlrW7QgctCL6Q+XRwMroT/XXO2vZfV7gZvg3Vxc0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4ac:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e28fe4426b8mr2248276.9.1728488999652; Wed, 09 Oct 2024 08:49:59
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:41 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-3-seanjc@google.com>
Subject: [PATCH v3 02/14] KVM: selftests: Disable strict aliasing
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
X-CRM114-CacheID: sfid-20241009_085002_641434_1DA617EE 
X-CRM114-Status: GOOD (  12.28  )
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

Disable strict aliasing, as has been done in the kernel proper for decades
(literally since before git history) to fix issues where gcc will optimize
away loads in code that looks 100% correct, but is _technically_ undefined
behavior, and thus can be thrown away by the compiler.

E.g. arm64's vPMU counter access test casts a uint64_t (unsigned long)
pointer to a u64 (unsigned long long) pointer when setting PMCR.N via
u64p_replace_bits(), which gcc-13 detects and optimizes away, i.e. ignores
the result and uses the original PMCR.

The issue is most easily observed by making set_pmcr_n() noinline and
wrapping the call with printf(), e.g. sans comments, for this code:

  printf("orig = %lx, next = %lx, want = %lu\n", pmcr_orig, pmcr, pmcr_n);
  set_pmcr_n(&pmcr, pmcr_n);
  printf("orig = %lx, next = %lx, want = %lu\n", pmcr_orig, pmcr, pmcr_n);

gcc-13 generates:

 0000000000401c90 <set_pmcr_n>:
  401c90:       f9400002        ldr     x2, [x0]
  401c94:       b3751022        bfi     x2, x1, #11, #5
  401c98:       f9000002        str     x2, [x0]
  401c9c:       d65f03c0        ret

 0000000000402660 <test_create_vpmu_vm_with_pmcr_n>:
  402724:       aa1403e3        mov     x3, x20
  402728:       aa1503e2        mov     x2, x21
  40272c:       aa1603e0        mov     x0, x22
  402730:       aa1503e1        mov     x1, x21
  402734:       940060ff        bl      41ab30 <_IO_printf>
  402738:       aa1403e1        mov     x1, x20
  40273c:       910183e0        add     x0, sp, #0x60
  402740:       97fffd54        bl      401c90 <set_pmcr_n>
  402744:       aa1403e3        mov     x3, x20
  402748:       aa1503e2        mov     x2, x21
  40274c:       aa1503e1        mov     x1, x21
  402750:       aa1603e0        mov     x0, x22
  402754:       940060f7        bl      41ab30 <_IO_printf>

with the value stored in [sp + 0x60] ignored by both printf() above and
in the test proper, resulting in a false failure due to vcpu_set_reg()
simply storing the original value, not the intended value.

  $ ./vpmu_counter_access
  Random seed: 0x6b8b4567
  orig = 3040, next = 3040, want = 0
  orig = 3040, next = 3040, want = 0
  ==== Test Assertion Failure ====
    aarch64/vpmu_counter_access.c:505: pmcr_n == get_pmcr_n(pmcr)
    pid=71578 tid=71578 errno=9 - Bad file descriptor
       1        0x400673: run_access_test at vpmu_counter_access.c:522
       2         (inlined by) main at vpmu_counter_access.c:643
       3        0x4132d7: __libc_start_call_main at libc-start.o:0
       4        0x413653: __libc_start_main at ??:0
       5        0x40106f: _start at ??:0
    Failed to update PMCR.N to 0 (received: 6)

Somewhat bizarrely, gcc-11 also exhibits the same behavior, but only if
set_pmcr_n() is marked noinline, whereas gcc-13 fails even if set_pmcr_n()
is inlined in its sole caller.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 960cf6a77198..6246d69d82d7 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -241,10 +241,10 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
-	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
-	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-	$(KHDR_INCLUDES)
+	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
+	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
+	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
+	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
 ifeq ($(ARCH),s390)
 	CFLAGS += -march=z10
 endif
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
