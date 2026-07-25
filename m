Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EA2C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYeYRi0xCm6DUOERL4NbkeN7cMrAKPlUtfkSb1AsRKw=; b=AtrAx4XaqWUzci
	/MViDoItPRWDRlNfvZEbeNntvJsrbE2q2Jn7bE+kXmWSIrzpmPSMjjmlbU+cY6yl8ueQNzRUc3Z7o
	wltsR5Ol1wJG/0GNJQoEuHsxqneIphgfh4zrtzwD7lxwaX1CNPDEF8AesvEFpC8gNcO3G/hQ7j34n
	x9PkYEFWz59LTLBPdLYzgzv/L6HnOFPpT5Ja6eHzuDX/PylsCSDyX9zAprCOrte1yr1ocffvPZXdE
	eAj0EkOsUJSTdWMl0KbmyMQjiVo/Po5qs+Jovt+PiEa0XkLK77AFvQCr5U7vnZc+WNtwcF+zxk029
	OPxtO4MbfRQ4dUgqJhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5X-0000000HOlD-3Hpj;
	Sat, 25 Jul 2026 00:17:59 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5U-0000000HOhS-0I1y
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:17:57 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso461111eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938673; x=1785543473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp95ji71yx5ijk4WWlK6BpNeZFgyjxf4GIIG9MMM6c4=;
        b=YHb5/2gHPUXHIZj2kEZd8clRwz0Z3kpC9mc/1BCs845odhGOThW/4cnt1jYucLmi1r
         mHkfUDjv7J+o7oQ0nfyyR8jU1KFkGU3AoyWZvwWjO5TjtrwRijuPZetOMUcFdLHP/B6Q
         UA0m32aK/oUrpSzoYB9uNONxQp3k3WFICITE4VfMxsntwusdiU7ToH0DMvslNwjJ6tmb
         UOMuaTSYL7CGGPfsf42Ealenm0ZKP8J5ZGg3+cUJs1mekJkug/xX1OPotgb9KI1/mDzA
         TQuVJpijyrKnGF/wUiFg8sTkDcJXsOLDhXprXoTt3GEy+euyz6PtO+LpVav9SiPkWisr
         4Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938673; x=1785543473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp95ji71yx5ijk4WWlK6BpNeZFgyjxf4GIIG9MMM6c4=;
        b=ItUSd/QzSb1RM1NDXy/CTSaWn4AybGyDXtXfcaifmnKVilvRnun3qm3GVGIjEQwI8t
         iZOsTbwmoq0s7llvl5QPZz01X1jKY0Hr7GSsSjbGMaCk7CZ/nvXJisoivulBn0WDOCUD
         WW6vFCcYi52AvPPupfNGybCLBUxObM24wYTWU7ZIeuiphvd1IdOmarz3kzbDi6J+Qt5e
         qPg7FiSLFUV4KQvcBYmXny/ZO5hN/UoRGF15ioXBG7EeC1s5mjsClpxqRYuD2X1wcXHf
         uMXODHoY8g0P9ZZFyDO5F08ZXgz/vwZXCt4EOqcuf0DZ2/NSN/mp3PzAVJfEm9PSNWVc
         A/2g==
X-Forwarded-Encrypted: i=1; AHgh+RqhG3T089Kr270IqpHt60+PYKMY4+pAnphZPqmk5OVOcLLpa04uhIn3LhPK56IzqxdWJ/jjMQkkmNK4AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/PelqBpEdDNuGzuInnixWcvEt2PunV4BuaOUxb73bIdeId9gW
	hXsYVtN6bJKXNdbv7o/+r6+4vcl23cTuwei2qkE9wlLMFXP9Me67bKzIkWfCDomqImU=
X-Gm-Gg: AR+sD114NyJZrk789lCplZjhQrhbdgtWmtR9Y6awjfM4MXYjE9fiFKZpQDwho2raWFm
	vyeOPpyGf9ZLLYhvkGC/cy0lB2oQHAeNCrCK5KMIo5LLHL6kbMr9627el1sMntVMEnShgd/hH5t
	dYlQRq1jF0U01CPdyU0x0AiJqKYPuS232GPLVAHco4uPmmRuxcH5rMU2hkCBOdoYpua8B1Vtoq7
	x4cEeeZAP8eItIUavFtGKgLejle3UDCg4DbrOWrpiU54Ckw+cKyJIkQl1WVseApIvePR98tqaL6
	uqmvnY09z4kzHb8qsDBXdmgpwDfAFiyXL9K9y5pgGUosxMSLYQl1RYnLoIHtdFrst79kOswYEDb
	OdAht6QsM7pRwrmOY/PT8rlj6bM/3rwGKxp2NNelMpGHlryStVQcR0e6SimOHCxb6Cizqs9cq2u
	hyVgxJf6WpNsVEd1GddnMiLtbUfh31z0PZNXw=
X-Received: by 2002:a05:6820:4b07:b0:6a3:7760:e42 with SMTP id 006d021491bc7-6aaffcb794dmr504992eaf.35.1784938673499;
        Fri, 24 Jul 2026 17:17:53 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm884057eaf.7.2026.07.24.17.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:53 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v4 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Fri, 24 Jul 2026 19:17:39 -0500
Message-ID: <20260725001749.2579274-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171756_379975_CFD9FF15 
X-CRM114-Status: GOOD (  10.32  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Patch summary:
 - unchanged patch: 1, 3
 - new patch: none
 - modified patch: 2

Changelog v4:
 - Include a header to solve a mid-series build fail (patchwork ci)
 - Drop preempt_v_started test in may_use_simd (Sashiko)
 - Link to v3: https://lore.kernel.org/all/20260724165001.2317788-1-tchiu@tenstorrent.com/

Changelog v3:
 - Limit the export scope for {get,put}_cpu_vector_context()
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document flags added to riscv_v_flags
 - Link to v2: https://lore.kernel.org/all/20260715051629.1169645-1-tchiu@tenstorrent.com/

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  8 +++
 arch/riscv/include/asm/simd.h            | 16 +----
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 80 ++++++++++++++++--------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++
 arch/riscv/kvm/vcpu_vector.c             | 22 ++++++-
 8 files changed, 131 insertions(+), 40 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
