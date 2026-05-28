Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6F1CD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LsNaS61a9LnVFpdLjb/JXVjfdS0W4zOUZdPE2+A659Y=; b=fqPtCLWNEwIAsi
	VKOoClhH4Bjp3jC3pNJQN9lpBhIcnsFC0YxiXIC+l3LnURcRu7mkiMezEUk8rZ0m7AmZuYxaHZ+rN
	CYcV7fATbNYMgpAQHoCrmMzYnnaIF5P0/SWP+THujMemHXbr0OZ+wm7jMWYyrcOZ4g8JKDvB9sBY0
	076LdQhaERXUohYzskgk1piDQfb79WU7/bsjXsgLpCvIkzesveoK3c5feYYIGOYccpwDDFpEqUYtV
	vhmnns1k5E3h2fwTGVTYxpj18kfLHP5iwLWNYR61kseA4CrcnrvA2uJ3RtHKIs4a/dBImAnrx4cU4
	+IIuxToKqotCA+6bBWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi22-00000006OAd-0Hrz;
	Thu, 28 May 2026 21:12:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi1z-00000006O9M-1wqu
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 21:12:44 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780002758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vbn1ysewc4dPhC75UO+Yew2aAizs4+TdppDNkIGId4Y=;
	b=1krzi4LVD+omrvBDVNDsoOaSJks7HlS8grhV6eYUaGF3nsEZofvN8YU5XMhbkmiYHPRg3T
	vGA2uJ1JbhySJpDe5Gio75XLqwqqn69kFIuag34m9Czz4scmAIhwGdxo1z5XfWZZT3Ujp1
	WFnJp8BYhfjGb9z1HQPYSQfemNUtBCjZYNOYwRCEH7lx7lox7R8I3hhTlv4hDZIXogDSOB
	LyV4IXHbPpIpSsZM3MDPe9JtXcLzN1EoR1rFNdCdrUu2i9NvBLFYuEaBeZEPa9mztiXugk
	jF7T2tbQfdfhfifBTKGSy+QevrfmxhHx1L37464mM/sBGEkng5hNWJiqCbUR+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780002758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vbn1ysewc4dPhC75UO+Yew2aAizs4+TdppDNkIGId4Y=;
	b=zDr1SP9RK3PPGR/NPqlZRnja++Hb21WSh47Y1ZuTYkjq1+l7yOTevq33ZrSQZ5/bSUt9Jj
	p5PxeYaMlsYEpMDQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/2] riscv: Some misaligned cleanups
Date: Thu, 28 May 2026 23:12:29 +0200
Message-ID: <cover.1780002199.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_141243_645633_5D13C92B 
X-CRM114-Status: UNSURE (   3.39  )
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

Two minor cleanup which affects performance. The first patch addresses a bug
causing improper initialization of fast_unaligned_access_speed_key, affecting
performance of do_csum(). The second patch remove a redundant access speed
probe in CPU hotplug.

Nam Cao (2):
  riscv: misaligned: Fix fast_unaligned_access_speed_key init
  riscv: traps_misaligned: Avoid redundant unaligned access speed probe

 arch/riscv/kernel/traps_misaligned.c       |  4 +-
 arch/riscv/kernel/unaligned_access_speed.c | 69 +++++++---------------
 2 files changed, 24 insertions(+), 49 deletions(-)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
