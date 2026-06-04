Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9FCD6E77
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RaiEDoSKrxhvC2jbDvTHFehKGtPOm4BQYycgV8pMDp4=; b=gPC1YG91jnZrjw
	NSwmt9Iwnmx0Uq3oE5Tj9bQo4uFfXA/uW91TXVVtfoNnK0LQ6ldAzemAb3Vfs4xYtj5pGtqP2HUcP
	fWXy1SBbn69W8P5lxLPtg/kffEtXm4HTnzA8GYQAeUL3z4TBjoJww61go5JEEXQyQHlZyfKhcZtR6
	GvqPiIZNWJVSqWbbYACPNb8nGl1Qhtdz7VI37Hz28IaTW4gU4DjAJJkF77rboxXXDECMJ37S3xGzj
	kpMBHImTb7lMBRUrieweiUkfrxf3y4w6Qn4zHLiJMxh4ceQ9kq7RCwhlGae9a4NpIB4I8CIQ+sbgs
	bE4oEd/s7neJAQmGDEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7V-0000000HQeJ-27qt;
	Thu, 04 Jun 2026 23:05:01 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7S-0000000HQcf-1YUG;
	Thu, 04 Jun 2026 23:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=31
	aVyHUumnhXwzCExpLEJUIkTMuPZna46h2rihqSFBc=; b=PHwg3m0fzy5cEX1++E
	LczfKuSQNhaelLXuY8+tJtZY4N16853GJZAhl4Yxs/x1BrOaFN1ByNUIJeToOosh
	yhSpxfCXVa7zvPGSQDungnI3sIj79g5Psh21b83a0ad0uGiQu7hAbVF4xXD5z2hj
	rbQrqiuvlgPnWcp05dfYR1Ow4=
Received: from wufei (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3H9tJBCJqsfP6BQ--.26783S2;
	Fri, 05 Jun 2026 07:03:44 +0800 (CST)
From: atwufei@163.com
To: seanjc@google.com,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Wu Fei <wu.fei9@sanechips.com.cn>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] RISC-V: KVM: Fix skip of valid pages in gstage ops
Date: Fri,  5 Jun 2026 07:03:13 +0800
Message-ID: <20260604230317.30501-1-atwufei@163.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CM-TRANSID: _____wA3H9tJBCJqsfP6BQ--.26783S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyUtrW8Cw4fKFWUKF47XFb_yoWkKrg_uF
	WrJFykCwsrXa4xJF90k3s8A3s7WrWj9r4jvFnFvan3t34ftF1UJa18uFZ7XrWxX3yUC3W7
	u34Y9r18Ar1SkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86wZ7UUUUU==
X-Originating-IP: [240e:38c:8516:b200:1f3:8926:223c:5bc8]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/xtbCzhA42WoiBFDygwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_160458_822052_5985046A 
X-CRM114-Status: UNSURE (   7.14  )
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

From: Wu Fei <wu.fei9@sanechips.com.cn>

The current gstage range walker unconditionally advances by 'page_size'
when a leaf PTE is not found, e.g. when the range to wp is
[0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
returns false and page_size is 2MB, it skips the whole range, but it's
possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
only [0xfffff01fc000, 0xfffff0200000) can be skipped safely. Both
wp/unamp have the same pattern.

dirty_log_test intentionally sets up the unaligned guest physical
address, after riscv kvm enabling KVM_DIRTY_LOG_INITIALLY_SET, it's easy
to trigger this bug if there is a larger window for guest to write more
pages before first collect_dirty_pages.

v2:
* reformat
* drop the patch to dirty_log_test, which is replaced by the one from
  Sean: https://github.com/kvm-x86/linux/commit/4e0fdd9b0d7d

Wu Fei (2):
  RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
  RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range

 arch/riscv/kvm/gstage.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
