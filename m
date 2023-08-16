Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA95CC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8DRVhrFDYfIP5Jbf8z/8uquADwavLp8c3peI+b4MzIs=; b=tvGcW/urtHQRRY
	leKvvjSXl7b5fm/+sS70b6ZI0xwLwP/aHPHEvZWHgA2K9fpDHOyM1OmDZPCPCr1xc2doCr+QDMxi8
	ZE6lVsWnNFgz62oH88vgA4ybCpsukg+n0v/dkp7uKZMd5tUmeg5cEwyJgnTTl7GNFnThnckfXK/pa
	SPKLUytbgBwxs+mufjjB9ZcTJpkN5IlNmcUlvJeF6wqwLyLUWXi85oYFmg9hayLwa9+WD+6ra0nxW
	dzXszKboxz9bYYKt18Nq9hH8oS94AD+nWz/TSA6Kt5Qh8pegUf4oqajtrg8gbszf7ANKDJex5+f4T
	MXU+pMPY71f+NWNTJDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrj-005A9o-3D;
	Wed, 16 Aug 2023 23:23:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrf-005A8B-1l
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 23:23:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-318015ade49so6280202f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692228224; x=1692833024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgdXOP4yR6ZnH/y1qGFKmHKWNqRrRuobjN/2x4b+FbA=;
        b=WEB4xO5LWij5oKfwGh1OEk4FXjhCGsMXw/ewx7R6a0QjvqDafEoSNlCkRtFivEPFen
         TLR8FfJ6EfvqoNSpjp+UlLgLKbHENMneStqXnyRRfQ/MX1+zGq+MIaqXmVITtO7AnLBB
         6wgS2VYD3PZxXGqdMPzVw5YO8XpveYZZYBUMicCNZRSpqU9+0avSQ4edpW8fzJySwGps
         D46siM0ztdasxWVy1ROb7n/oytocnGykiUrW+1zzTSoVokhEMB+/RKb+ZL6R9bmJ2DLX
         9zVRSB0ExIhEmvCeXAk9SooDtsu9BtzefewFaDXf/8agZccM2E5kxe+eINljjw/4ikJl
         CiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692228224; x=1692833024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgdXOP4yR6ZnH/y1qGFKmHKWNqRrRuobjN/2x4b+FbA=;
        b=dQJMJ9edEaaRmrotYi4H8J5JvaK4CXNi35zrBj3tZyw3h4wYiu7+nKEhscKE7bFE5O
         lp26cBhfT4zm36YLIzZxhEUJiaMGDdLUf3zkApPRRDPN+AGki3steYTJDvfmsO3+Itp9
         dCrxNrb5hL2Tg5fExfk4EA1E0dY+cz8mAP48E5l1fUZ4su9LIHfZiw82KAtXk5Jx0jmQ
         vIz04z7QnuHWB7Pzu110qSiwjyKTLNzNPdlJILHk9JCAmRlzNuq9zVAlF/uoGBT24iy5
         oqXtyGwDrdkHk3eyxogG/bAcOs1l17sjnTlyyvYDE02te/IHdRMa8zzgKOcUiIhVXZ/m
         sOkQ==
X-Gm-Message-State: AOJu0Yw5ebY9UiT/sIUIH5fZIXmNfE3oojL13AazEdSKykFgz1/yRxxZ
	nM59jP5PY9yBz4tGEyfhoZM=
X-Google-Smtp-Source: AGHT+IEOsLQXTtu9Ww1G9TMwF+CJtQ5zAjl4dANCkwAMo4lC/cxbVGxVfQfn4ev6QwpY38US7Fbrmg==
X-Received: by 2002:adf:db48:0:b0:317:74ce:3e27 with SMTP id f8-20020adfdb48000000b0031774ce3e27mr2422087wrj.67.1692228223853;
        Wed, 16 Aug 2023 16:23:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:aeb8:832b:ebc0:1bbf])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b003143c9beeaesm22752617wrr.44.2023.08.16.16.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 16:23:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] riscv: dma-mapping: unify support for cache flushes
Date: Thu, 17 Aug 2023 00:23:33 +0100
Message-Id: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_162347_590396_2D8F7D67 
X-CRM114-Status: UNSURE (   7.50  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch series is a subset from Arnd's original series [0]. Ive just
picked up the bits required for RISC-V unification of cache flushing.
Remaining patches from the series [0] will be taken care by Arnd soon.

Cheers,
Prabhakar

v2->v3
* Got rid of dma-sync.h and included the changes directly into dma-noncoherent.c

v1->v2
* Dropped others archs
* Included RB and ACKs
* Fixed checkpatch issues

V1:
[0] https://patchwork.kernel.org/project/linux-riscv/cover/20230327121317.4081816-1-arnd@kernel.org/

Arnd Bergmann (2):
  riscv: dma-mapping: only invalidate after DMA, not flush
  riscv: dma-mapping: skip invalidation before bidirectional DMA

Lad Prabhakar (1):
  riscv: dma-mapping: switch over to generic implementation

 arch/riscv/mm/dma-noncoherent.c | 60 ++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 9 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
