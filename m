Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F9FC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iionDCYpJNtTVkfcWw6qEtMtLdgIGrTOOxlaI0z2KgY=; b=Ejs6xouoYCiPDJ
	ixTerTyOG7WwlIWdJnvXzO29C/R1lhI9el0v5AajBOiIsVPNz2vlswRd8+uDW/Riy2GQs60xjI4Bd
	4NsTKSSNrblXewuwW8zuQ7J+fpaaDGpfztOzeMcpG+roszqa3kWiEYUHRTkZz6GIig0z6vK9qG0n0
	o4uCJtXoYY+GOTEbE7SJTtaRGJHPLB56b9HU9VTTQLtfi6jv9NCwwDbBrIo8IuEs5qhGMRF4KMoMR
	IfEuIqdVSgM4GB7QPdkLsi2tVgABS/6hi+DgYHrXNgtGNX3utXdcEmNNhMBc7HzHC6ggsmGyiAxug
	9ie3a1T2NCzDDqflcCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8du-00000002JTc-0fAG;
	Thu, 25 Jan 2024 22:56:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8dj-00000002JM3-2FC0
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 22:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 134CE6237B;
	Thu, 25 Jan 2024 22:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD65C116AB;
	Thu, 25 Jan 2024 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223366;
	bh=gyCTtEy5PbjNvE5leNKdfOXPtZtPUb3cK4c+4fo9cSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b+5uAyWQjhVltyJThWXdiRTZFOBrbBcADIyK1nXaGYW6yKEUyCLs+nV1COVJqLtwH
	 iz2glq9GdAfqgs93croz40dlgnxZu6xoBNsn34+MVamoQr+Uacvxqw1ck+Vj0XMVUC
	 gVqeFfL1kyD9HSQHm9LcHhnzxzdR4QLWtAdN6D5XKp7zvzA5pxYKYK16kDzCc6+goq
	 YsaKCBjU1GYrFvI6I/vDUUUvw02Dfh1OMbjFAWrvqB/eaaN0NM4PU3PFwZhhe3jWSS
	 4jriwKyjQiTRC369pjnW2Dit4ttKVL5kJ2pBM1+CFHWEXa1tTSvpN5MWuZxYAO2nfo
	 CtmixarE0E8KQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 15:55:14 -0700
Subject: [PATCH 08/11] riscv: Kconfig: Remove version dependency from
 CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
MIME-Version: 1.0
Message-Id: <20240125-bump-min-llvm-ver-to-13-0-1-v1-8-f5ff9bda41c5@kernel.org>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
To: akpm@linux-foundation.org, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gyCTtEy5PbjNvE5leNKdfOXPtZtPUb3cK4c+4fo9cSY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbnv071LT4ru7uzV6rVb5Z6r34Ps/2UlJJxG6j4rkfJ
 vb/+1Li21HKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmoiHL8E/7SNnxB+EG5R7d
 E5heTxPWT5G4/t8kmePN+4aytLDrCasZGe7fbYuPipjZzKZlyuzUe6Lo22/h8Ls82+4WJ+xU/fO
 ghx0A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_145607_674872_CBC48294 
X-CRM114-Status: UNSURE (   8.38  )
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

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 13.0.1, this condition is always true, as the build
will fail during the configuration stage for older LLVM versions. Remove
it.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu
Cc: conor@kernel.org
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 69d24f513922..00edc4ff589c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -174,8 +174,6 @@ config RISCV
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
-	# https://github.com/llvm/llvm-project/commit/6ab8927931851bb42b2c93a00801dc499d7d9b1e
-	depends on CLANG_VERSION >= 130000
 	# https://github.com/ClangBuiltLinux/linux/issues/1817
 	depends on AS_IS_GNU || (AS_IS_LLVM && (LD_IS_LLD || LD_VERSION >= 23600))
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
