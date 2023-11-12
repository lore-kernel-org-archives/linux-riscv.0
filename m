Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACE0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEuPUnp4l2/+essfhGfLnOAxI3ArwUEYL8gzaftSqwQ=; b=ZGh3M1D2svHUvD
	qMlVUcb5ua6s5V92XcHUNGO1iAOtbRlkhpAO+BXk5iLFcwwted07XxBgPB4er0ro7PTO0pkckwGxj
	HLoEJMNaJaeWo0chUT5bVWsiTNGYtrWM9Nuigda/iZVYHDK4zXTa5EKMVnu8DhIya6EaVxlbN2C49
	aWU0BqZ/8Jro97zJfEJKiWwEf/kva7vSjDVuMYmikRIQDeSCWeXu5HCIU/DuKyYGDJt7CR/MRuoxV
	+QFohYqsC6sTx34KqGD8DorE3YMBoS6vX3ZljCOA+E9iUfHEMRT0jTCiSmkyShJVrzgsIv4XIPP80
	mcViXSe5svltkkrNNciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oC-00BlMw-0w;
	Sun, 12 Nov 2023 06:19:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23o9-00BlJs-2d
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38C71CE0E8B;
	Sun, 12 Nov 2023 06:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE88DC433CD;
	Sun, 12 Nov 2023 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769935;
	bh=AwoQnmBHOr8wX0BVa478M177ccT62CL+qVUXJhTICuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJXr4K7CMCXTwmO5X1pmQnRLyFyMAWwG0wfgQ3IgYD0i9bjqWX0shBQhZKtCQsnIA
	 v4K4s+1F6Ic7Y9U7q5L0ZO3sGGyTeu/F4hGL2KKPl2fTc17E3FOorTcARLkRvgK/ni
	 B6AR82CJfxt0k+42b3M1nzdqY3B9+Knf0yrg2DCUxkRgdLWPwGhTOMjWD0+iZLTK0t
	 mcIYpcO9Kkxyg5pkjKS9UnbhajiDqAdiJ4C6a5PTfaV4PcQjP7+QLva36W6RF9JN8q
	 GLdQ1t9VZx/UzjEDXZtEfagDjw9CwcKjFswIm+AugiUmEqxKBVunP9X9y4kJg8muBa
	 OxEwx3teBIcTw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC PATCH V2 34/38] riscv: Cleanup rv32_defconfig
Date: Sun, 12 Nov 2023 01:15:10 -0500
Message-Id: <20231112061514.2306187-35-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221858_022469_7C751960 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Remove unnecessary configs to make rv32_defconfig have a minimal
difference from the defconfig. CONFIG_ARCH_RV32I selects the
CONFIG_32BIT, so putting it in the file is unnecessary. Also, there is
no need to comment on CONFIG_PORTABLE; it should come from carelessness.

Next rv64ilp32_defconfig would like:
  CONFIG_ARCH_RV64ILP32=y
  CONFIG_NONPORTABLE=y

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/32-bit.config | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index f6af0f708df4..eb87885c8640 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -1,4 +1,2 @@
 CONFIG_ARCH_RV32I=y
-CONFIG_32BIT=y
-# CONFIG_PORTABLE is not set
 CONFIG_NONPORTABLE=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
