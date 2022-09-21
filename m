Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D80C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6IJVhBLOL/ozLi9fZga8I3Sttnr7e7oMvGyokmDUFo=; b=N4VDIseu9ci+cD
	0b8QXrl5i87KUV6bgMs/rIUHwwMUZjG/v9EsDUHA5OSkGUg91AGcSi32M1pLzc/FLNlH6MTajs6Ny
	GXe8U4mRLmL5jt+rZXC3ahnGbemMneimjkRzx8TzMdenCbILVgRWVoRcBpJiZryiFaOpNtkKvvBxZ
	+0lawR8Ph3bf5Q6CXzs6s1jwespH6/WxVPnswzYdq3dzRaS6y+vNfE1a0cy14mW0a/eAIj3zTOdsn
	iuxVf2cxV7AIG2keL9iNLrFT8iHY4be5Qe/1Ugf6Ot97cTV4TSHcuEVPiK4lINrPDSsyxsH5MBkja
	jddUx7u5RWAsEjQbI5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqjm-008efu-Ry; Wed, 21 Sep 2022 03:49:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqjj-008eel-Jm
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 03:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 455C0B81AEF;
	Wed, 21 Sep 2022 03:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AB2C433D7;
	Wed, 21 Sep 2022 03:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663732161;
	bh=jZgvA9rdGIurOcdhOjRWdFE+IHV1sRomNrMvYECgE60=;
	h=From:To:Cc:Subject:Date:From;
	b=WDjCyeszP29zz4rNsQUtHcqKhQDvtEilDHWUjPD7lhBOeZo0fOnYKmmibY4kSZ6C2
	 bcwG6I27T5LIN2s9iuhFzNT8F3Pizy1U8WSjvPJOfVOW3KNTcXcy4podgyAYFxNhzk
	 9tVez2zab/sDgYJMaUMvZE6gVXlvMwEGh3fdWCrvnZhiWKUktPbW+A3+G2QoLTG6ct
	 eSpGR0H0Q07xyMF8oL6zu/7OSi7JciJetGLku755XH9FGKhOacUk+8oR3Dhlhw9qyd
	 hZhFGR9cERHHD4Mf3Kjue8z/MlqtchzG1bVz4R63CPZ7u1c9j0dkWgeVanAHR0U8mo
	 xW9LeVUgxzcWw==
From: guoren@kernel.org
To: arnd@arndb.de,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com,
	palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	guoren@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/3] riscv: ftrace: Fixup ftrace detour code
Date: Tue, 20 Sep 2022 23:49:07 -0400
Message-Id: <20220921034910.3142465-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_204923_812937_D1031340 
X-CRM114-Status: UNSURE (   7.88  )
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

The previous ftrace detour implementation fc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT") contain three problems. The
most horrible bug is preemption panic which found by Andy [1]. Let's
disable preemption for ftrace first, and Andy could continue the
ftrace preemption work.

[1]: https://lpc.events/event/16/contributions/1171/

V2:
 - Add Signed-off for preemption fixup.

V1:
https://lore.kernel.org/linux-riscv/20220916103817.9490-1-guoren@kernel.org/

Andy Chiu (1):
  riscv: ftrace: Fixup panic by disabling preemption

Guo Ren (2):
  riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
  riscv: ftrace: Reduce the detour code size to half

 arch/riscv/Kconfig              |  2 +-
 arch/riscv/Makefile             |  6 ++-
 arch/riscv/include/asm/ftrace.h | 46 ++++++++++++++++++-----
 arch/riscv/kernel/ftrace.c      | 65 ++++++++++-----------------------
 arch/riscv/kernel/mcount-dyn.S  | 43 +++++++++-------------
 5 files changed, 78 insertions(+), 84 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
