Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CA9C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z9asRomc6M+XKi4belOPryoAaeQtIjJ0gunNOMx+8gI=; b=T7ta8wsju5c8Xc
	EZkhBi4vKZFx8Xm9TyRdfX4ssdsISQb+VzcZD3/ITfc+rogFXXYemEDIcR5zJ+4LbQMNLeHoTuXaO
	Q7FING9u54q+e84rCj4Gsycn/OJNJ8b5P9M1BJ191H2mreoQvb8whlXZXINNZLVgEjhd76uRQL0Qo
	eibgcRNzFFMqruiYfT3GW/RXd2BWMaewDHBybIICNuJbtyt76IpDs1lfV/j8ddtD5jfsdtFdGduxS
	/JTGZWresUb4RRbHbQ8siexoUQsaJVj1YhWYAEnPlfaCMy184I3xNUX+1sGQ9W06ajW9DulZM7EeQ
	zxxQCh0VNmrutogCxWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiF1-0000000GyCF-0KnX;
	Mon, 25 Mar 2024 11:11:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiEv-0000000Gy73-2t07
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:11:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86C16CE13AF;
	Mon, 25 Mar 2024 11:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FD3C433C7;
	Mon, 25 Mar 2024 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365098;
	bh=akb0Xkda4VBBWXx+01f2VRfBJMybL/xPYRcZVbT0RVE=;
	h=From:To:Cc:Subject:Date:From;
	b=O/stS8ao4dr5RdcoD4k0KOBnLcHUDvYt9Cuu2EZpewlYVEZxvx9z4k8CvwcBT2TFV
	 wQ7s73BYayarwRGmiEEV0Q7zmZEF2mz7SsMZ56BJ4U+rj6vn6Zrb/p0xk2a4kK1l6d
	 uILbXVAsRM3oiigJ7PbdxTyCz6OhpUS82NkAYnI6zbEJcnirMHz4D6v5XsdP6I45qn
	 MMbcvz8ZmhSFY3jITAaxki2mLXOPk9ZksLkX+shs97VsKcn/jOWmji9arhuUMOTKTd
	 nKJNf6sIB0WC/GwHFLm53hBvkXQww/NCiKiM8I8B68GZllVWRXZ3nJM4GplivGrgVH
	 5XoDP6nHfcSEQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 RESEND] riscv: select ARCH_HAS_FAST_MULTIPLIER
Date: Mon, 25 Mar 2024 18:58:23 +0800
Message-ID: <20240325105823.1483-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041142_132777_11D9247A 
X-CRM114-Status: GOOD (  10.46  )
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

Currently, riscv linux requires at least IMA, so all platforms have a
multiplier. And I assume the 'mul' efficiency is comparable or better
than a sequence of five or so register-dependent arithmetic
instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
speedup") for more details.

In a simple benchmark test calling hweight64() in a loop, it got:
about 14% performance improvement on JH7110, tested on Milkv Mars.

about 23% performance improvement on TH1520 and SG2042, tested on
Sipeed LPI4A and SG2042 platform.

a slight performance drop on CV1800B, tested on milkv duo. Among all
riscv platforms in my hands, this is the only one which sees a slight
performance drop. It means the 'mul' isn't quick enough. However, the
situation exists on x86 too, for example, P4 doesn't have fast
integer multiplies as said in the above commit, x86 also selects
ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
which can benefit almost riscv platforms.

Samuel also provided some performance numbers:
On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for
__sw_hweight64.
On D1: 8% speedup for __sw_hweight32 and 8% slowdown for
__sw_hweight64.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

Hi Palmer,

Similar as the pgprot_nx patch, this patch missed two merge window too.
Feel free to ask me questions if there's something need to be done from
my side.

Thanks

since v2:
 - rebase on v6.8-rc1
 - collect Reviewed-by and Tested-by tag

since v1:
 - fix typo in commit msg
 - add some performance numbers provided by Samuel
 - collect Reviewed-by and Tested-by tag

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..aba42b2bf660 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -23,6 +23,7 @@ config RISCV
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
