Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ECDC678DB
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htwQiqaqyvjjGqwUiNgtGqXfARLt3fImQA6aUXx9QPc=; b=zzKG+Jwgb9Byn9
	cmuqzSkr8zpWL32I7MEdxAq8mKcGpeI/iaYxQ0NVxW9vvc2DKL9Dod5qppW7t7enG7EzGByXRZy2l
	G4OkThK0CpvzYlnLqXTbr2wqHB8u4nY5sgxdxiM6Rp+zJglupzrJetNH8v0WnqxSeqN2ZceDwwIca
	eqVQQ2k/tvnr74edjSFYwt2P/Bcx7VR3iZyZTRYzruEzJrAsCwBIsm2UxWIPFFOECJ/VDvFn6aWEr
	yTqFWS8aj1hbHoPRkT2/cMikVhSB8PaoOhCKXBKbZ7hvgh4IPj6Hb4wYf1ZOaUx8Ww175FQgCNg4M
	pB5ENyNcuWRF5v+24s/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRq-003fWT-Gx; Thu, 19 Jan 2023 05:26:50 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRn-003fVO-G1
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 05:26:48 +0000
Received: by mail-qt1-x832.google.com with SMTP id g9so818081qtu.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 21:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsB+ZAHP0UyJS+bDbLK2xtr95teDUp0qaZq/1qRa2dk=;
        b=k8nvF0Wqyi+Gza6qaaqQmNjZC11DVCO+D8huJe7wIcHQip3kHeQTBh+/rpIJclS+qP
         Pgkmgk4HEnAqqpD3GFG22fLpbxPWgT0+RPImCXM0XhRZNONSo8A7HplGRAJ7KePm0X3t
         h7xcxYv+e1H5SWFcO7rH+/qEcpj59m8eGAIvjjapYOExptWEKvlF0C9E2DGRWBRhCVY8
         zn77yhBdxCYTFYnQFuMYyZX8ZPEAwniL4nn1BXLh3jndqDy2tHe2VPWXPiqubZGKvK7o
         VWkuf/mBaV1sG5gySWDnAONo/3j1qqJDAPP+rYdh3FII5av2ESMQ8Mg2Q6HAL/kkSri0
         86tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsB+ZAHP0UyJS+bDbLK2xtr95teDUp0qaZq/1qRa2dk=;
        b=BJ498MWU0fRPaZ9VjPn8XOZMhN+f0A90MHiNfbvHVdCYlz/0RsRSE9FQp2n0OPHFFn
         /fIzw5ipYrXzUESuaMJmIqCJroX9/5jXbbAXokVVT9GjUmOguIAJeO6iOEqTYLr1zi3v
         1nBIboH8it+lq4iI1qQW3v5Y5KEP8XNq2kA/ZPSADbU+z6srMqdbf+1qHZqJwJZAVu2B
         vIV5+YWZ6wKUKTCPulI5WOuQocfQLeuPoKVTfyMl1e4pClTl1utiEi51bQBG1B38Gshc
         0kTuKRbdI3Gmq3vxJ6W9/ip3HOv+8DepPiKSoKAPGwn+JakH+w1+HXJohenDa13q1Xt3
         RoZg==
X-Gm-Message-State: AFqh2kqn01TVJavINIyxnmAL7tR5tqiv1tSqNwutTr9HwdjyoAOIX4Y0
	CpzVDfxv0CAsUUQYFhiZX99Hh94E4hnXYg==
X-Google-Smtp-Source: AMrXdXt4YenaJqPXzMy5Lk1pmM9H273b2GNx/2gZB5XvTELWHefqkI7+CsRcyyl0aI8AOb/bDNd+AA==
X-Received: by 2002:ac8:13c5:0:b0:3b6:3044:4cbf with SMTP id i5-20020ac813c5000000b003b630444cbfmr13849110qtj.23.1674106004284;
        Wed, 18 Jan 2023 21:26:44 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id v21-20020ac87295000000b003a5430ee366sm507330qto.60.2023.01.18.21.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:26:43 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v1 0/2] Add RISC-V 32 NOMMU support
Date: Thu, 19 Jan 2023 00:26:40 -0500
Message-Id: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_212647_572218_F02946A7 
X-CRM114-Status: UNSURE (   9.08  )
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

This patch-set aims to add NOMMU support to RV32.
Many people want to build simple emulators or HDL
models of RISC-V this patch makes it posible to
run linux on them.

Yimin Gu is the original author of this set.
Submitted here:
https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html

Though Jesse T rewrote the Dconf.

The new set:
https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html


Jesse Taube (1):
  riscv: configs: Add nommu decfconfig for RV32

Yimin Gu (1):
  riscv: Kconfig: Allow RV32 to build with no MMU

 arch/riscv/Kconfig                           |  5 ++---
 arch/riscv/configs/rv32_nommu_virt_defconfig | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/configs/rv32_nommu_virt_defconfig

-- 
2.39.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
