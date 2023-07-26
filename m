Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71870C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SX3bMc0JZadVUYapejfwIVyqUQVOKgZppZ4fto1nvqQ=; b=lzLLdpKR13ZO5Q
	CHL+mxNbNapfIGgu9lRlax2QmhA6Vhae4vAGXt46uCPr1bBEflzlHHYImGVJGG24rmofYTe+wx1i3
	Bk+KcYs714/i7mcRC+dr6oKQcq1jjjzKFljhk8FkPjLGpImfdrvN9iLOqXprXCQSILp4LVDpRUBEG
	mPnBmS5PsxtUUBY9womJNdA7L4Kah2kM4YNtOy0FLdtW9P1MwVKTDWL5c1tNjZL+L95WbZCkSam0k
	TvOgRbcmNoL3xMcTSsbFWfxvfA2ZixhYZ89dilFhzKbIrd+yUvKdED/w2j5BJbzGU2yQNi3omv6/H
	Pk1ZIIJVzIBH2NKOlRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWR-00BCP8-2Q;
	Wed, 26 Jul 2023 17:42:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWP-00BCO3-1H
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:42:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A279F61ADD;
	Wed, 26 Jul 2023 17:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE632C433C8;
	Wed, 26 Jul 2023 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690393320;
	bh=dMC0uSI27EU23WMp3+VJekGrCo9Z7fUubo7Y54KD6PA=;
	h=From:To:Cc:Subject:Date:From;
	b=UhLvcZHN4xJmXgD+c0TELRci4mIYAjXQUSdPuSKlpunL1yhtHSoXQ5GOEGtJLE8oS
	 M47JXYUfn/4jeQiWRCUhfTs2ZIlyi9AMqvZufysykqUl7kBg/RiyGhJDDcRqLigUWo
	 0igZkZxbU3Y14nU0ttNNpvs2tTl+xpGcB8Ngj/ZoCReBmz/Tv0u6tS+aS1fnGHQ79Q
	 GsQN/Gk8sA4Lzt6AqjmRPwAjCPTvjFoDB0VUWgeAVgQLrOTIsuzcEb4F+x28RC+Pp7
	 7FWX88/bSamgO6NiFBdrJYTjJzEsnhG8PEwCZPVs5zzT6FVP7Lxw+mY4r/Wdw7V81x
	 eL7LSaXuFASYQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: vdso.lds.S: some improvement
Date: Thu, 27 Jul 2023 01:30:21 +0800
Message-Id: <20230726173024.3684-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_104201_478711_C2AEE685 
X-CRM114-Status: UNSURE (   6.59  )
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
