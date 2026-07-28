Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F04C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d5bdiiG2z6GAU60kboH5RVCWKJsGCkf1QUM+UB0GGww=; b=ERlEkYDG++Nzl2
	mxX19vp6lLRQc+7mKqWxhQzx1z3eT8rsR6tf2i3cb2LFTid4uK+StSOKUXAOPsHwFOiY5Suhqmbvw
	r4lY3++cCAYYMrykP3fmQx2CdPG1BaUPrsFOJJulHm0+DvsutwG3ns8aeDtZ+udZET7oCKTZ/nq+I
	InEkdOf0BHZUvqFGK0cRdzT9B2RF67IEx0Wc/vrLhvb80EwVNbtaJX+j5CcnNAdORSUjNdezV1lU/
	Da0aPTBHEXCmtzPybaZNnS79kdA7shHwlwqIxVFAvR1P9tmDlw0paIqhngqCW8S19DsCqDjs7QxTb
	Pc0gwTeD2uyjlMHwPTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokt7-00000005r6D-2Wyc;
	Tue, 28 Jul 2026 16:42:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokt4-00000005r56-46iM
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:42:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c1f758014b8so3272166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256956; cv=none;
        d=google.com; s=arc-20260327;
        b=s4TDTcOGXxVEKZqnlVpp3WfUiRoc6tK4KGsDlRCpr2m1vRGKajTzGpmkm/J3ZNHzxp
         m19B/o8dWWgE1MQ70V37qJo+2wukpxXkMEtU2qiMg9Ltf/EgMcO5q5wsRpj1uTd0p5ma
         dm7eRvgYgfs3vENk+tnX/YxtRMusqbqAX/1eBRyPkHnuObP5k1m9hVmUwJ/QumppHKGX
         NXsE7Au2wXNV6r+8vxl0O3OHXKuw4WN3EXV+qpvqiznhVa2sTe2zuujolGZaX9TU70MF
         LNXJ473cmssgxbaJPP4y+ewh6dDhuhH0fD1eV8u4rWQ14QccPD5pMGn2hB2tN9Sz2o2B
         weqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        fh=DlpUWULucbtblqk1DAq3I+YjCaRGR3Vo0nd6y6O9AGw=;
        b=Dp66bLim7HaxjZ8BJpjsReC79TKFlmRFIZkyMFYT5Xw/FtQAit0NPlNYKwNZtKoBSH
         pp50ODaXE7BqHmT64HPnu2CLiGOBXBZ4jIcLmlumFxGAq9P+xcfVH2uS9hFC7EoL0HLb
         nXD2UbQpSuIPKHR0LyHR2I0PM8wRp7f8iNBhrQ21Z2V2oSnwnAsIIoweYTFahIWdPUh+
         4OWLOq/Ka3FRSmJQGi/jKRbi0AsJ2rOkubQtVEmSKWuPkrlASyAr3WtgvdYdDFg2oRNl
         rknJtPG2G5hdNfpsS1qCpZvjZJ3WMOPj44/zEEYAFxQB5rhkxfrxsQnsrHtDlMADAp0o
         duUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785256956; x=1785861756; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        b=qHASxXhKkKAbhxngeYDQ0AeCQBd3qEmQUSQDQ4SAQfFG0yNaS/6pQ3hARYCcYPHm4E
         9WJDi4Um7wcdgnvPb6v8LQmlBmd6A22Xv9eg5T0xq+8Z2Dp1K7RR6kMzHMQ1CvC90L+2
         uz7uAl0kuHV0YKCWd6zS7tQFt0T8D5E7m3nYbKhUwTLs4x3AEDD/wgMilvPuXwk2Oidz
         BE+6PVb9PZqRZ+3iYzt6wAQbqzr801BNIaKl+9yuVenv07EOmPE5AU5nG5awE2mvYiZT
         qy3Z6TUIg3YBZPCKXU5Nhq6bd+e9vvZco5Mx9oFlTaNFzWrilGBv6cjAT9+eScCpLS5S
         ch2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256956; x=1785861756;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        b=dATAJxrqo7wPMfJnTbPuTkKOo4/TmbGS6VJvPcWrgIlx9N15Or6F+iAwRJbqrA4t5T
         VdpouHmac7UFHG2RN1Oz0FS3Y6Qm74SU2/q5LjaEZwxz1SEqJsfAjQPXAmIgUuVLIpPc
         W2Ikx0oNWulVitsZW+Jp2pmSsfdedpSCF6IvPUIb1x00dj3w1rvE1wV3CQ7JKatAfYB/
         umKHMPlH1OU+cT6YdJBHHXCMuvC7i6tgby8xvHbR/7Eg7RkirTMgVrNbiCiZsnWUnRY8
         NkO9waYu0Nd5C1WXDQkR1WoKjEtvDnxaYctESsXARkm+BLDVx/Y9fyLxLtk/LJrnOt0f
         NUYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOac6r2XtO7iVjwy6zG6UDDgHERPI0Lu38CMHxnyCEsVNmt/RIrt783l13VNEVQIBZ2UM/8wTtJP0nlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRxTDx1wQmHRcadw+uAhkkx66nPYA+elhHLLhqa4NdnTuJH6ca
	8Ce7IUm1xOCKcxW5YTCuSHkBVq8T4SVK9lTf58R6k+MCufqVXKoFooMY3F9hQtpcc6ktEy27Pvu
	yFWX46lY26CJPY8ciSuWiW8oYRp1aQvij
X-Gm-Gg: AR+sD13o+aATWufiC5PW/HVVtZrk2DsA1E/zmlmrtCe/PT6LJShBCO0SvuMnRgoY0A6
	jiUTI3SMVTByf5rxBwWLaeKVTRqvScnpXjXNkCXOV1djZdr+6qr7liXlt2K9ijVyEmc44dGjK7Z
	SnDiurTST9jIJUNHCF3pjQXzjtsaOZ8hy6nmGbtuYFbG3ywcMkEjYdRw4cRE0tP7WUiBJKPKpM8
	c9hhqX+Sb08Mlyj5YM+z4JDaS3gnxMp+kGZWhAXl37h0UJ6zv53ZvjBcT3imSF4u+jsIudJwNxJ
	OcNzWqeOzLgO4xJ/4y2ITtanL4oNi3XwiWPXBUNnMezhMsrng5PVaX1le/KVkKQAB3FfrEdKcnL
	3OtKE0D4=
X-Received: by 2002:a17:907:a04:b0:c16:2d90:68a7 with SMTP id
 a640c23a62f3a-c1f71e568ffmr173688366b.26.1785256956205; Tue, 28 Jul 2026
 09:42:36 -0700 (PDT)
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 29 Jul 2026 01:42:24 +0900
X-Gm-Features: AUfX_mzY5IhTWpi5crtF8mrU7J89TXc4_WGd_VuJLT6iuHP5tbvLAPaufRqw2FM
Message-ID: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
Subject: [PATCH] RISC-V: KVM: Synchronize hrtimer callback during teardown
To: anup@brainfault.org
Cc: atish.patra@linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, security@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_094239_054335_2A7EC928 
X-CRM114-Status: GOOD (  12.16  )
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

The non-Sstc hrtimer callback clears next_set before its final uses of
the enclosing vCPU.  If teardown observes next_set as false while the
callback is still running, kvm_riscv_vcpu_timer_cancel() skips
hrtimer_cancel() and kvm_destroy_vcpus() can free the vCPU before the
callback enters kvm_riscv_vcpu_set_interrupt().

A guest can arm the timer with SBI TIME and request shutdown with SBI
legacy shutdown or SRST.  A VMM that honors KVM_EXIT_SYSTEM_EVENT and
destroys the VM supplies the teardown side of the race; no post-launch
host ioctl is needed to arm or request teardown.

On upstream master 62cc90241548, generic KASAN reported:

  BUG: KASAN: slab-use-after-free in do_raw_spin_lock
  Write of size 4 at addr ff60000005e58898

  kvm_riscv_vcpu_set_interrupt
  kvm_riscv_vcpu_hrtimer_expired
  __hrtimer_run_queues
  hrtimer_interrupt

The object was allocated by KVM_CREATE_VCPU and freed concurrently by:

  kvm_destroy_vcpus
  kvm_arch_destroy_vm
  kvm_destroy_vm
  __fput

For deterministic validation, I added mdelay(1000) immediately after
the existing next_set = false assignment.  This only widens the
existing post-clear callback window.  A no-delay trace build naturally
reached the callback-after-teardown-start/before-deinit ordering in 12
of 200 runs, but 1,500 stock-kernel stress iterations did not produce a
KASAN report, so natural reproduction is timing-sensitive.

Always invoke hrtimer_cancel() for an initialized timer.  Preserve the
existing -EINVAL result when the timer is no longer set, but only after
synchronizing with a running callback.

With this patch, hrtimer_cancel() blocked for the full widened callback
window before vCPU destruction.  KASAN reported no error in 100
fixed-and-widened runs or 200 fix-only timing-sweep runs.

Fixes: 3a9f66cb25e1 ("RISC-V: KVM: Add timer functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 arch/riscv/kvm/vcpu_timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

AI disclosure: I used AI assistance during the audit and am treating the
issue as public as required by Documentation/process/security-bugs.rst.
The reproducer and full KASAN trace have not been posted publicly and
are available on request.

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ae53133c7ab0..a2cd277a4059 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -61,10 +61,13 @@ static enum hrtimer_restart
kvm_riscv_vcpu_hrtimer_expired(struct hrtimer *h)

 static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 {
-       if (!t->init_done || !t->next_set)
+       if (!t->init_done)
                return -EINVAL;

        hrtimer_cancel(&t->hrt);
+
+       if (!t->next_set)
+               return -EINVAL;
        t->next_set = false;

        return 0;
--
2.47.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
