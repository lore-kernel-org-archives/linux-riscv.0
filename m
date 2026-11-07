Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341D606A32E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XNYyUi8Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ9RywFF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M6DZY3Q6YtyvGVOplqO8pEf4Ck8N2KsMpdmrWtEBUcE=; b=XNYyUi8ZnWwMqk4UD3GiCYPhHY
	3jqT9byJNg40Q7kMAOgcT3L1kHFnmGhY5LqTH+xGo/WMSsCajb+gMX5E5MubD7vsxL1Gv9STHiLT9
	9F29p43oIpYyx7iAWPTDP1GlikWFsgDP2wR8MlOKL/8aAbqpu0sF9LmQfl1hiSi7ojUqykQFXrWh4
	IZRaJ9FOn5f4aT64FwH/yjPABMb2tPMOYqjrcyfhVpS3tej37RYc5itD0v1sF4H1tPi0gKTZFMH2/
	sH85LQICJKdQy4bxum7L7MetwGzEPMI/8BiJLqUJnjMSgOgowYzztlY1rogha7hlWMz/h8AdDNmSV
	KAFNaIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPayJ-0000000EKwY-1iAR;
	Sat, 07 Nov 2026 07:36:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPayI-0000000EKwS-0QmV
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 07:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AAFC60A50;
	Sat,  7 Nov 2026 07:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B676C1F0089F;
	Sat,  7 Nov 2026 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036977;
	bh=oZqXdr7vxG0HTV9d7pT+1eNUsi0QIN/Z/13bF1ZyXrs=;
	h=From:To:Cc:Subject:Date;
	b=MQ9RywFFMoLuwpibDZWeYeqi8yO2oej5qUS8pVZf+qonrJox/YzJ8el747ZJ6+mM3
	 K8oONomkOFlKgaVj0LfyGhdPzx4o/6pMURA9+DanadHo5fZq8RPQnu1TI1BZAq9NQA
	 vQ69rIj2KrIsGWG2y3bH8kOII2+m60HSZkvql3viY3gHeBmhySXc9EcK6Kyvw2EhIt
	 FWh77sy8tReGd4d4os1Zyj3u/NYeamTdyzyQYn1ZfgX3jQQh9TrKu7+GjjK+CJEotO
	 YjN/UU5FofNIJDyJH9vwQe2wDPsaBxBE6LHuIAwpZxdTQt96t427quYZvdfD4lsDWQ
	 AIM2MufyuCGSw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: Keep helpers used by noinstr code in noinstr text
Date: Sat,  7 Nov 2026 15:16:03 +0800
Message-ID: <20261107071605.17536-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A plain inline annotation does not guarantee inlining. In particular,
size optimization can cause helpers called from noinstr functions to
be emitted out of line in .text. Such copies do not inherit the
caller's instrumentation restrictions.

Use __always_inline for the IRQ, idle, stack-check and vector helpers
reachable from non-instrumentable entry paths, including their nested
helpers. Also force inline arch_exit_to_user_mode_prepare().

do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.

Build-tested the affected entry, trap, idle, stacktrace and KVM objects
with GCC and CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Inspected object symbols
and relocations.


Jisheng Zhang (2):
  riscv/traps: Mark do_trap_misaligned() with __trap_section
  riscv: Keep helpers used by noinstr code in non-instrumentable text

 arch/riscv/include/asm/cpuidle.h      |  2 +-
 arch/riscv/include/asm/entry-common.h |  4 ++--
 arch/riscv/include/asm/irqflags.h     | 14 +++++++-------
 arch/riscv/include/asm/processor.h    |  2 +-
 arch/riscv/include/asm/stacktrace.h   |  2 +-
 arch/riscv/include/asm/vector.h       | 16 ++++++++--------
 arch/riscv/kernel/traps.c             |  3 ++-
 7 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
