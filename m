Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B363EE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dZ3wGQ9j+4YdMYF4gI7QNmNN+dCIXnVywrx8xL28u0=; b=snggN+G0wQuZeQ
	C/Ept/5qXoaeUB90LOy686d5AP62IIApmzR01MnnaxhIru4tW5aRoxuq6DGIaBKrzLfj+dg1HkGQP
	P0Pdgznid6STJj9Dv2r+/UNKIHUromkabmLo49Cl/LQP+c52Dg3z5cAN8s5FOf5ahpA13lsNetHZq
	C3MCu4slkMgM9pZs78UNgtMms1jpurCoS59eBr5gxjlCK0UWkEKnZ4qtGPEQEtJa/p+gZwe7xn/LG
	vCW2E0/9Pb4f9A8Ggob3WoyAUp/0+ZqXn9ahJ6iAv4jgQb9iP0hAgmpIM+Xbz/lZG1qtBAsj87QJA
	VIN+rHT6UiEcf63GvJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUDo-0000000AyGs-2dSs;
	Wed, 11 Sep 2024 20:45:52 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAX-0000000AwwY-1M5Y
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6d9e31e66eeso12606517b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087347; x=1726692147; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I5+MRLsHgDUkEu/213kX3+YnOYKTSZyhH328nXdj8ZY=;
        b=f40fbNZIBg6BvaXVcjzM0neQNzah369hwjge3Ul3g73tggJ04Y5m9jqqy8wULkzJNW
         oBxbu7ErMK3+zZav5IZQLXUYPNwpTyzyAtAsjvGJLL9W6ljq/+8r0/yITwGhvRGYChtS
         acIjkedmEcWdCxr5+zylCxGBJTyMMpHvKEpm/WXJGCnwsIGp8oXpen36lY/OOJSwZ5TF
         fFoCXvmU0wwg+32Ybl0TFhnG9XZqkWrXD2Ckt3pzBqvseNJTHZr8X7XTaocTCyooc+FO
         DXr4lwvIJ6ypVe4eDRHZdHgq9oDEMy2wXS0J4KGDIFhD7V3TjcJGvrqBuLFdlVo4vVP+
         PxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087347; x=1726692147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5+MRLsHgDUkEu/213kX3+YnOYKTSZyhH328nXdj8ZY=;
        b=SCj/3fprpE2BynX/JcnQbVNaC+WlWDakyDtI9lpJDjYzCgS5qQFzGYDwtc4Z5QP9DB
         AZEZZcJ/ZY274VCIpjg1zbowwsSjHfaqnTxsKAi/eskJd9SGaX4s9F4/p6VX6XP+HD3v
         Sh4Rlqo5p6xGfLF85cBDGUO8WnUJKncYC/D7M0iKQBSbTc7LZUg+NAO37anOqnSutVj5
         Y2s5s40kbdGyXZ0WycqLUMjWSAWE7Fisp33R0AbyXUimw/OfcvqIQCqjJpyeoEXMoaK1
         D8oYHM02Xh5Qf6VLuUKl7q1MjiYemGty/G7HptVUQdjwpf12P6JVpw53viFEa+w1Agnp
         WCzw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4kT1019/XUPpNZ6cDPWAoZA9cQa07i0HWW3Bsbzae0whS2VQJ6AZpZLMjiEruqfD259QGcCyXvEYHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXhIYOPKIcoW6YUdWJKVknHQMN1LVD+Ax0dYtQ0FSRgUAh0ld/
	y7kJmlY0OloAZsPr617ef/2IpMSpOm0RQjesh/L0lPxMj1NliB+KMFOQnWEJBB6j7pL3CW+dMS5
	ovg==
X-Google-Smtp-Source: AGHT+IHjCnU+25WZuBONT4gBCIxwCF19WEi2vWiBq4GXfH9hGN5Xz3FJR6dlFxBZ6NyYinSbokZ9vN2oU0w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4983:b0:62f:1f63:ae4f with SMTP id
 00721157ae682-6dbb6abce79mr220417b3.1.1726087346868; Wed, 11 Sep 2024
 13:42:26 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:48 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-4-seanjc@google.com>
Subject: [PATCH v2 03/13] KVM: selftests: Fudge around an apparent gcc bug in
 arm64's PMU test
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
X-CRM114-CacheID: sfid-20240911_134229_431848_933EAD73 
X-CRM114-Status: GOOD (  14.82  )
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

Use u64_replace_bits() instead of u64p_replace_bits() to set PMCR.N in
arm64's vPMU counter access test to fudge around what appears to be a gcc
bug.  With the recent change to have vcpu_get_reg() return a value in lieu
of an out-param, some versions of gcc completely ignore the operation
performed by set_pmcr_n(), i.e. ignore the output param.

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
       1	0x400673: run_access_test at vpmu_counter_access.c:522
       2	 (inlined by) main at vpmu_counter_access.c:643
       3	0x4132d7: __libc_start_call_main at libc-start.o:0
       4	0x413653: __libc_start_main at ??:0
       5	0x40106f: _start at ??:0
    Failed to update PMCR.N to 0 (received: 6)

Somewhat bizarrely, gcc-11 also exhibits the same behavior, but only if
set_pmcr_n() is marked noinline, whereas gcc-13 fails even if set_pmcr_n()
is inlined in its sole caller.

All signs point to this being a gcc bug, as clang doesn't exhibit the same
issue, the code generated by u64p_replace_bits() is correct, and the error
is somewhat transient, e.g. varies between gcc versions and depends on
surrounding code.

For now, work around the issue to unblock the vcpu_get_reg() cleanup, and
because arguably using u64_replace_bits() makes the code a wee bit more
intuitive.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c b/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
index 30d9c9e7ae35..74da8252b884 100644
--- a/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
@@ -45,11 +45,6 @@ static uint64_t get_pmcr_n(uint64_t pmcr)
 	return FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
 }
 
-static void set_pmcr_n(uint64_t *pmcr, uint64_t pmcr_n)
-{
-	u64p_replace_bits((__u64 *) pmcr, pmcr_n, ARMV8_PMU_PMCR_N);
-}
-
 static uint64_t get_counters_mask(uint64_t n)
 {
 	uint64_t mask = BIT(ARMV8_PMU_CYCLE_IDX);
@@ -484,13 +479,12 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
 	vcpu = vpmu_vm.vcpu;
 
 	pmcr_orig = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
-	pmcr = pmcr_orig;
 
 	/*
 	 * Setting a larger value of PMCR.N should not modify the field, and
 	 * return a success.
 	 */
-	set_pmcr_n(&pmcr, pmcr_n);
+	pmcr = u64_replace_bits(pmcr_orig, pmcr_n, ARMV8_PMU_PMCR_N);
 	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0), pmcr);
 	pmcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
 
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
