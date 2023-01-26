Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301D1C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QHJnISYK2of9XFy3kQd8tugDvGhX5XJNFeBAhm/Yl2o=; b=pXGkiAR9rZ8Bx4
	6tmLhajJFTodGPWyN3F+H1KXm9RdVAv/nt33C+nEfxo244kC9HzMjQBi+FXhXOQ5/Bm/DJFlw/g5X
	LZZXjuS0NiGgZOpTiTcjichp3skLc2vM+4M3OBWbQuEjdLrMJ07HrKAPhbg67XlHyJkHYnDX5avbG
	qk469S0bVFrVhleA/J6XR5A6RQ36xrwy87UJngCIdOBJYbfEjFO6dc5vgm93KYqnsNmbYcQsVR3pU
	Z56jtLyIKfg5rGqV2aJFII9c0Q/0p25Y8znACAA5NA9FV67fxil7DuHsAE+h9cpVe5kOAeknV94UT
	jADJBYg5zc9+Dr+U1SCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5hg-00Bxgz-4A; Thu, 26 Jan 2023 17:06:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5hd-00BxfV-1w
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 17:06:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27EE4B81EB6;
	Thu, 26 Jan 2023 17:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C87C433D2;
	Thu, 26 Jan 2023 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674752777;
	bh=x1dh74Zz7B/AcbhnGni/ZuDkEB7kGpdHTuvy/SN6UpM=;
	h=From:To:Cc:Subject:Date:From;
	b=idRsfVSw6RJymcT8zExoT0EtgCYd7mQUYU9XmOd0QgQtOcw1bX7Ebhf14CHAK0PEz
	 FhuieMyXFiAe7GeffAofmPGMmIVUgdU1n1MUCMle7YhFLRo5mVz4JvWgbnimq1RLLD
	 jZzR3ejw0vHhG57iAoFlSF4+bcK3jUH9lnHw386BF3zfnW2IlZ6qFdHDQl7WRurFxb
	 75De03jbzRrOKlO/wUYIDsz6HiWgQfIbOOdiKPhrW8sct2dXa380ZiIyGJ7VUZ7/wU
	 kpAnNaasry+ewkXfoDnsx+1P7QRVRmkK0/NetWNi/ZuoORgwFwsVnvatZMyGISIsqZ
	 /BXOF/cHQ7YUw==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mhiramat@kernel.org,
	conor.dooley@microchip.com,
	penberg@kernel.org,
	mark.rutland@arm.com,
	jrtc27@jrtc27.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V3 0/2] riscv: jump_label: Fixup & Optimization
Date: Thu, 26 Jan 2023 12:06:05 -0500
Message-Id: <20230126170607.1489141-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_090621_267152_B3164A0C 
X-CRM114-Status: UNSURE (   8.07  )
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

Patch 1 is the fixup patch should be merged into stable-tree.
Patch 2 is a continuous optimization for jump_label patch_text
atomicity.

Changes in V3:
 - Correct the typo C.JAL -> C.J (Thx Jessica)
 - Fixup compile error when CONFIG_RISCV_ISA_C=n
 - Rebase on riscv for-next (20230127)

Changes in V2:
https://lore.kernel.org/linux-riscv/20221210100927.835145-3-guoren@kernel.org/

Changes in V1:
https://lore.kernel.org/linux-riscv/20220913094252.3555240-6-andy.chiu@sifive.com/

Andy Chiu (1):
  riscv: jump_label: Fixup unaligned arch_static_branch function

Guo Ren (1):
  riscv: jump_label: Optimize the code size with compressed instruction

 arch/riscv/include/asm/jump_label.h | 14 ++++++++++++--
 arch/riscv/kernel/jump_label.c      | 30 +++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
