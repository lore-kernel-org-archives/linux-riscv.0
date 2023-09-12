Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72FACA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SX3bMc0JZadVUYapejfwIVyqUQVOKgZppZ4fto1nvqQ=; b=14pj2XeFS7BieB
	E0F1p8t6OsE3UsJrhZjUm5Racqri31pLDKPZS561ZYU/sF8WY069txckDRtp8jrIx7OegoOnApxnN
	JYAn9yjTIkta+y/+fIrIYI4xUqT0UlT7JFve4f7WE6acNUJ2aGu1Ki91K0W7WDs7TRglr9L5VQjSt
	6FT9roRYo/A3ofsLE02iDLQsYNXp7t+ezAA6Q+TwWfUkwPLotx/Y3GbWgN0uBTPNBiMse6PAIsNla
	3aYXb6Nuc3BFRv/SN2XWehaY6wnbBqUi5GuBLwsPASv680vveN6+rPkNl3FJ7NicxrYQ1jKBE2KoX
	Jq60jyNW2qJHX4mO4xlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxse-002PEU-2S;
	Tue, 12 Sep 2023 07:32:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsb-002PD8-2j
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:32:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4F4BB81B64;
	Tue, 12 Sep 2023 07:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD38C433C7;
	Tue, 12 Sep 2023 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694503930;
	bh=dMC0uSI27EU23WMp3+VJekGrCo9Z7fUubo7Y54KD6PA=;
	h=From:To:Cc:Subject:Date:From;
	b=uMqeMhsFfF7qQk4qNvUPNkwD+uwtLp2ZVAY6opjn/00PYa5feL3Y/B1vpYwN6NvOg
	 G1v27iNKMk90tyKqKSHX67y+aj0MEXKsmKFtQ9r7MBuOPyxjwjQdNN/C2oemo+x0cZ
	 GTDe/O4NxjCmgc07dvV+FiVhJCUls7YGEepPqGxQb1LpRFQ9mC4TfxHEWCvrTBrLl+
	 d9MNsf/nsuC/jjgc7MvVB3NuEtI2sceSq2PsHI8EJZMiGbdqHGRHthLuCsqNb4Cmkp
	 fyra9qzFfLtFnkhM7wWNzmWTcfT0MoBXYeCC302azW+vPPuhRADrnPIF3qTKe/GQVi
	 +4zMG3Q+ry7Qg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/3] riscv: vdso.lds.S: some improvement
Date: Tue, 12 Sep 2023 15:20:12 +0800
Message-Id: <20230912072015.2424-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003214_048276_1E2543C0 
X-CRM114-Status: UNSURE (   6.79  )
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

This series renews one of my last year RFC patch[1], tries to improve
the vdso layout a bit. 

patch1 removes useless symbols
patch2 merges .data section of vdso into .rodata because they are
readonly
patch3 is the real renew patch, it removes hardcoded 0x800 .text start
addr. But I rewrite the commit msg per Andrew's suggestions and move
move .note, .eh_frame_hdr, and .eh_frame between .rodata and .text to
keep the actual code well away from the non-instruction data.

Link: https://lore.kernel.org/linux-riscv/20221123161805.1579-1-jszhang@kernel.org/ [1]

Jisheng Zhang (3):
  riscv: vdso.lds.S: drop __alt_start and __alt_end symbols
  riscv: vdso.lds.S: merge .data section into .rodata section
  riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr

 arch/riscv/kernel/vdso/vdso.lds.S | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
