Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7F1C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE136197C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE136197C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVM0x4DxiEPfav0hFg/B+/cDXoLmo5iuYh4FUdS7U4g=; b=MGVb+ih1ZNszUWKj8baiyWf51j
	Am4NPl0BOf0UX/HhcWwX0f79lt1CjRfEJQmRS+xmRAHEAsYK7NkzTMxTt4f395ZNmhnW30UNyBhf5
	CJfQfKV5keFJpWVNRKlMwbCtzOIB1HZUoAd7oCtaYe7DD279I8c9FSvAvSWQgb8ZIk7gY98t4y760
	bC1cYUYB1hqetq3fl9u1BC70BsGf1BtnPmaE2O7zE3cWxSorljK0/nSuBo09mJP1jfLo2pjc8cZq0
	CtblKyHCoSXjIjJfcolXhdk/eDtmu3KrNux1L6DQ0T+1XFZuzkeN1RICWEiFjnMvadNXg2xcE3r8V
	an9vlfsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxW-005uwB-9J; Sun, 28 Mar 2021 06:31:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxR-005uv3-QE
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BAC76191A;
 Sun, 28 Mar 2021 06:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913092;
 bh=QzKnPWoBnPHqdJHKCVpbj1BpTP2hO0zRu8JrhjYU+j0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oCRMri96fe/VV+ky4tT+TYgNgYdWWJzEgeXfW1Tvd/axc2XqcW9wem1Jg6EWGepv2
 QjpcK6XDPVTYzlAGc9cBpGJNs76gqhECTTGkJoQEDk+3zXn3vooA/aHijGpPJOqIjA
 KaNg4iVmEpWEVc+v+reBWXGLdp/9vX3UPt6ESFnyGi8C3C85wjhdaSIOc2rHkvEjGU
 q/dKoB5wnBsLvoh7s8j/ZofobGS9h+hH0KO9HHec613wxtdvFuKWgCppj0bO1HPk6w
 BYMnDjrYcXcZ5Cd+KQpevDg06rlgh2/Yp6Q3kReMZDAa8puVTZfEmFJKn+m05xwAZ0
 BuEJgjqjL8urw==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH v5 4/7] powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sun, 28 Mar 2021 06:30:25 +0000
Message-Id: <1616913028-83376-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073134_158540_2B2AF3E0 
X-CRM114-Status: UNSURE (   7.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

We don't have native hw xchg16 instruction, so let qspinlock
generic code to deal with it.

Using the full-word atomic xchg instructions implement xchg16 has
the semantic risk for atomic operations.

This patch cancels the dependency of on qspinlock generic code on
architecture's xchg16.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..69ec4ade6521 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
