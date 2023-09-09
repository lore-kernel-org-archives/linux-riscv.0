Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2321EE57CC
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kJ6x+DDjJPeHPha+RR2KD3s9RE2Axub+F1KKp+TKTIA=; b=ILeqe4ACZf8n2q
	rMSR6/H3TTv7mW35puRzmc35yiD3g43HR+KWE59nYoNpYNmmyXOUKQs2+YTK4K+C/8IhhMCx6avpj
	CvBX9HCdwe48D2px9MO92Ht40oKoX0nEZBQwsD4TxsBivUCpQwmiKGgtSEpc8cIpZ03ez0CtrdVkp
	9CvmHVK+RaYQO4sQEBjFbxTsLxxuS/f3FI8vPczQDhYOBeiTZB4wVTobGob4hAkOm0Fia9N1FO9Mx
	2f+mL3zsyJM4/WbsE1OTKOsX9dFsy+/Syh/sF7quqZsMEgdtV46I/b8DGQ9sKlfNAibAjchoCG5eb
	MclHhoMuMyT80Hto9XOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Ob-00Fkn7-2V;
	Sat, 09 Sep 2023 20:17:33 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4OY-00FkmW-12
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:17:32 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 18E023200805;
	Sat,  9 Sep 2023 16:17:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 09 Sep 2023 16:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1694290648; x=1694377048; bh=Hk6wknAc4l
	ZaedMTDgYmfaNUU/MhXW2aKVUzRRXMt28=; b=Un7Tv41Q3wdz3Wgm5HiIlxYwVs
	fN3illv7SBD32AjBR5kPcRLA0EU11tC+qB4tUulBOWf6XuMeJE0ztUW84a/JMkhF
	q173Gy0q1doHfPxubc7XGwsdlqYM9KsnODCuvcjAg1XMsHL47AU+EywUDw+K4rVu
	Jldiw3fnL0elu9DCclKPboPwVuM+Y9kkUGcUVLqJP+3nVOi/RumH4DNTdoOYiKxb
	WpfG/mRepO8ztaVWCUoG8WWTYOyof5rZQ38FLro5P2hSCzU/Nevm/Rbgr7F57kQk
	34EsberygQaG7NWy6Y8peTpUI66l0mAFMFa3cUGK2o5aYPi78CaaAuk+rW1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694290648; x=1694377048; bh=Hk6wknAc4lZae
	dMTDgYmfaNUU/MhXW2aKVUzRRXMt28=; b=o8/vTDdesjQJE4xdC4uKNxUKB/bdx
	3g4BJc8uRX0CprZNCnhhKlY8I4wNh/2SGaFl2RwNgFQAQtF0iPp82NyIwP4YbclO
	rVuZfBt6KriLmiYkTbT3upJcQYL2qT/MyiWWknuu293+SWFNZRHY++OnZ5VYB1+G
	pg6nCofyBtxcOp58ON2CsFQyrqRFjTaZVc4UoS0nwFHhL9GDLkaFd3OOo8+qLYR0
	UU0RfMltu+h4UD8/fHBM+VP8Y14a5N8bIW+sg6ynZDW10DDQWWjgnkDV1Yu5qVtm
	3IiQEaCGUrfv6b8yr0RcefGR6rmix0EcQm+8Um51up9iRH/pOieQkb14A==
X-ME-Sender: <xms:2NL8ZDlswmi7zLKrN8eboJYF5zwdvDwDLkolqNpsu2eq9ZV0WiUGcQ>
    <xme:2NL8ZG1mhcIJwNw9vQRXxsLP1cU2FF2uEM7NEt7SCIHZ9FoB05IvbL9iWVamkDR8R
    v01aSYN1hJWdrV4uw>
X-ME-Received: <xmr:2NL8ZJrirpbtqbIpRmlnyb_ua4p7fQ36CeOv5JwaziUAvj5Hdl3ZZWrxHv3rUFvcrQZBaFq7dKd7C04x2UMQfGdCkXFm1TRbNsjorWELlAtuYY2Zr_kbQ0eg4tjOBcFJppyUbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheel
    vddvfffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:2NL8ZLlD6P4BP98h7HGLqexLcqWO4yRv1tk2vy6c00aeVvVma4xKUw>
    <xmx:2NL8ZB3QjE6rgPcchM1XTdQdgT3HIrN24YiiR-JCeY5zYb4JycjRqg>
    <xmx:2NL8ZKtGkXb97huSsxoPLt3NWo4sQrTn8jvgcmXbKGKhYII9Iw-Ifg>
    <xmx:2NL8ZMTuSAloKitZByflDMPX7tELBBD58pJd1wh6vVHwZ4ZfwkRVnA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:17:27 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/7] riscv: ASID-related and UP-related TLB flush enhancements
Date: Sat,  9 Sep 2023 15:16:28 -0500
Message-ID: <20230909201727.10909-1-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131730_395911_17F52DA6 
X-CRM114-Status: UNSURE (   7.81  )
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

While reviewing Alexandre Ghiti's "riscv: tlb flush improvements"
series[1], I noticed that the TLB flushing functions mostly end up as
flush_tlb_all() when SMP is disabled. This series resolves that. Along
the way, I realized that we should be using single-ASID flushes wherever
possible, so I implemented that as well. This series is mostly
orthogonal to Alexandre's series, though it does remove the non-ASID
code path from tlbflush.c, which turns out to be required for
flush_tlb_kernel_range().

[1]: https://lore.kernel.org/linux-riscv/20230801085402.1168351-1-alexghiti@rivosinc.com/


Samuel Holland (7):
  riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
  riscv: mm: Introduce cntx2asid/cntx2version helper macros
  riscv: mm: Use a fixed layout for the MM context ID
  riscv: mm: Make asid_bits a local variable
  riscv: mm: Preserve global TLB entries when switching contexts
  riscv: mm: Always flush a single MM context by ASID
  riscv: mm: Combine the SMP and non-SMP TLB flushing code

 arch/riscv/include/asm/errata_list.h | 12 +++-
 arch/riscv/include/asm/mmu.h         |  3 +
 arch/riscv/include/asm/mmu_context.h |  2 -
 arch/riscv/include/asm/tlbflush.h    | 41 ++++++-------
 arch/riscv/mm/Makefile               |  5 +-
 arch/riscv/mm/context.c              | 26 ++++----
 arch/riscv/mm/tlbflush.c             | 92 +++++++---------------------
 7 files changed, 67 insertions(+), 114 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
