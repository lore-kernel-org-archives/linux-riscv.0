Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FAAE7DEED
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAzeJOXXe/JswU7N77bti0uqYbb0GzwrtsCYk5/0H8E=; b=n6cXofWES1Q5CC
	1vcQ4ODPjnu4qjbM+sFTCWnitHm0Mk/y0bgQifUQw8gDK1qdsZNwNvV8wW4TOFz6igViVRnJom+gp
	U67tHutIQNgWIBx/Nda2LlB3MQjNcAQlch3A+34EJWwURNguQViAVEI9zbnnOfe6wth9WaJ5sXBzG
	Ddlk+1zAHqjYcBCg3m29xFmwNOA1dG0Q0qH1y9e3E0Te0dtIIbpkibcJ3MqmofzJ28UHoTH2pAyYZ
	TQ81w6mWjO3zAVJYkTbubUXdlI3hNtKkwLBmv4LwO3p/j8yBqpegITitTRmn7ah4JbIHH6m0TeMNF
	RflKDVhInOeSL5rftL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmudD-000000054li-3u6e;
	Mon, 02 Feb 2026 14:10:23 +0000
Received: from out199-12.us.a.mail.aliyun.com ([47.90.199.12])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmudA-000000054kR-0dJr;
	Mon, 02 Feb 2026 14:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770041248; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=VDIX3268l+YnDqz51gXsg22RmUvUWaRiFAyIjnTGOWE=;
	b=GTa0adEadO9rr7LPJeWUkY2f7Ymlz9/O2uCGfMr1bvni6gAKV6ubEBTbIlbFDY9OJVyy1wClMhvYYDF3YOQFTfDPuF+ayLJAdrE0iIpOGtMrItfU4RgokRXdOjT4v2kiaCCE6VWqnUZ4eRu4LDmv4icxtdr91077aIUCfVKdug0=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyO62Sp_1770041246 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Feb 2026 22:07:27 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v4 0/4] Support runtime configuration for per-VM's HGATP mode
Date: Mon,  2 Feb 2026 22:07:12 +0800
Message-Id: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_061020_501311_926D8CE8 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode)
to the maximum mode detected at boot time (e.g., SV57x4 if supported). but
often such a wide GPA is unnecessary, just as a host sometimes doesn't need
sv57.

This patch introduces per-VM configurability of the G-stage mode via a new
KVM capability: KVM_CAP_RISCV_SET_HGATP_MODE. User-space can now explicitly
request a specific HGATP mode (SV39x4, SV48x4, or SV57x4 on 64-bit) during
VM creation.

---
Changes in v4:
    - Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
      supported by the host and record them in a bitmask.
    - Treat unexpected pgd_levels in kvm_riscv_gstage_mode() as an internal error
      (e.g. WARN_ON_ONCE())(per Radim).
    - Move kvm_riscv_gstage_gpa_bits() and kvm_riscv_gstage_gpa_size() to header
      as static inline helpers(per Radim).
    - Drop gstage_mode_user_initialized and Remove the kvm_debug() message from
      KVM_CAP_RISCV_SET_HGATP_MODE(per Radim).
    - Link to v3:
      https://lore.kernel.org/linux-riscv/20260125150450.27068-1-fangyu.yu@linux.alibaba.com/
---
Changes in v3:
    - Reworked the patch formatting (per Drew).
    - Dropped kvm->arch.kvm_riscv_gstage_mode and derive HGATP.MODE from
      kvm_riscv_gstage_pgd_levels via a helper, avoiding redundant per-VM state(per Drew).
    - Removed kvm_riscv_gstage_max_mode and keep only kvm_riscv_gstage_max_pgd_levels
      for host capability detection(per Drew).
    - Other initialization and return value issues(per Drew).
    - Enforce that KVM_CAP_RISCV_SET_HGATP_MODE can only be enabled before any vCPUs
      are created by rejecting the ioctl once kvm->created_vcpus is non-zero(per Radim).
    - Add a memslot safety check and reject the capability unless
      kvm_are_all_memslots_empty(kvm) is true, ensuring the G-stage format is not
      changed after any memslots have been installed(per Radim).
    - Link to v2:
      https://lore.kernel.org/linux-riscv/20260105143232.76715-1-fangyu.yu@linux.alibaba.com/

Fangyu Yu (4):
  RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
  RISC-V: KVM: Detect and expose supported HGATP G-stage modes
  RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
  RISC-V: KVM: Define HGATP mode bits for KVM_CAP_RISCV_SET_HGATP_MODE

 Documentation/virt/kvm/api.rst      | 27 ++++++++
 arch/riscv/include/asm/kvm_gstage.h | 57 ++++++++++++++---
 arch/riscv/include/asm/kvm_host.h   | 19 ++++++
 arch/riscv/include/uapi/asm/kvm.h   |  3 +
 arch/riscv/kvm/gstage.c             | 98 ++++++++++++++---------------
 arch/riscv/kvm/main.c               | 12 ++--
 arch/riscv/kvm/mmu.c                | 20 +++---
 arch/riscv/kvm/vm.c                 | 22 ++++++-
 arch/riscv/kvm/vmid.c               |  3 +-
 include/uapi/linux/kvm.h            |  1 +
 10 files changed, 188 insertions(+), 74 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
