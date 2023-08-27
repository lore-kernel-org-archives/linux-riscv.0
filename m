Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FDCC83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rx4zu3ryrLF5PnOKMc9TYW78KEP5J3ofgZRwXJzu7kk=; b=IongmLBYJVHzIh
	3I8VoQudhaFe8o0I6zLR/g5ZhUz4/zRHyIxxJpYukc1eAkamUu17dwnZ8fb62N02Hp/8RXL1KnXAC
	/k20ywhJ3jbNeNSAkWLgQX/PzRNfClxSrYXoe0zMC4Dgs5yFEcdjSW0VsdhlYa6Sm5c5siwArHgOl
	0Qp48t2L80SNCXS1KWWZRSWoRmrHhFklRi4uyoY5ApXqK3ee36AeC+NTIkAdBOmDeelPjPlnwltQd
	+Jz2Dffb39gBZMbbH0cq9klzwQOYpKY4zTKKe0Or0AIi3U9RHtep87thPoQVHgYQHIKNxlIqklH2X
	9w8JzIAmihOnCEin2E6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBwM-007ico-1z;
	Sun, 27 Aug 2023 09:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBwK-007icI-1m
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EB4160F16;
	Sun, 27 Aug 2023 09:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB91C433C7;
	Sun, 27 Aug 2023 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693128011;
	bh=lJYorIVcx536GtzJ3KF/sKB2zw1hE7/RD53xYbdv9mU=;
	h=From:To:Cc:Subject:Date:From;
	b=dw2RQQm0M2ed8Q21whUMu3KnZhYWM+ImII71/0xNRHz0WkbPSJmFOeTd/HmXPiqfW
	 7CiL1W54uzpxiIUiGsKkhQW8447gI+iu5wkk9AbF03GX+2yeh5wBODgcxlCSfkksgO
	 XKE14xB93xgTLeDdvVcetXHvVNU9kirv0GYtOxbyZ+synRtcJUo7fyu3sK5NJq/k4p
	 DIfcj12ZEmBYeYrI/qc02hgb6b8FLKav+rFgE6F0CW/lUgetuJYOv/GAEgmMKyGmew
	 CUshTBOa53v9ZbbV80dqfJUiIpfFA2r2No72fM4/WKsf5vFDELAJ/OkfTZ1Xy92pNF
	 s88a7rY94tCdg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: errata: improve T-Head CMO
Date: Sun, 27 Aug 2023 17:08:11 +0800
Message-Id: <20230827090813.1353-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_022012_638372_7CEB19F9 
X-CRM114-Status: UNSURE (   5.65  )
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

This is a renew of Icenowy patch series[1], patch1 is necessary to
make T-Head C910 powered SoCs CMO work correctly. patch2 is to name
those instructions following thead-extension-spec.

Icenowy Zheng (2):
  riscv: errata: fix T-Head dcache.cva encoding
  riscv: errata: prefix T-Head mnemonics with th.

 arch/riscv/include/asm/errata_list.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
