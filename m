Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FA7C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WnUM9lIewJS6NBsCZa3Uo3yasRKt08JdC6iMcdF1Vgw=; b=QfxQkBgaGsJy7F
	7vQPrTJCCzVuUbO232IVgqnL7gMD6cBNOFO06DKwiLwNy6nB/lK8OO5iDo3xjk7QEJB1/I8O0/6JA
	ukxwVV507GGiHWr+drk6ffRECZED3YDE8p3fKlwzLRZD+NFYG9zQGMidAPpGK3AMChzoSSKa7T+8I
	2wQL04yuT8rJa7zNLYgfxtLuyCVa9cxjsDPKmQxz9U0uhafXK5e6oYT0zwDFQJNgRglrKpdgmftEq
	kt4Yz4G69oOIfSQDcHdXP/91ea4ZtSPF+wkUyZce440v7i11RGrBUl/Rt9LkeW9GlA5MqWRXkD4MW
	sqLh7xEXOKQtdUU0bvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uLP-00Cr5E-3B;
	Tue, 30 May 2023 08:04:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uLM-00Cr4R-03
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 08:04:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso43022355e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 01:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685433874; x=1688025874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjdcHakCzRp2uDPOf1QJOq47vmihq6bx2AuDxoEXfOE=;
        b=FDmwQIBU+rDZiJvbW1YTb6Nvtv32CT3waSZraGR5m0N/Ms1Hp4lSo9Cjsgx0SEuSex
         G7kgDEEDswd6pBtrVkoYvLUf48IXqIoDPi6HcJa672ZxeKgNQe3jKbnlg7nS5ZbJAErG
         BcpjlO6WedDL2jJ7QGURxWfRh+kEtQi4jrqUn62BBZtLnjtNq86oWP7St++e9x2zSpgO
         GSMJmPalS5q7PHUPPtpjq9yxF1mDEMvYcyMsFNK33+vhn6r/xi5uMhiLsm0BvNGhHWpa
         fAnVIfUp5JI106rZE2MESeh4Iw+o2yHf4TdOtfMeGL7HqA0daZj7wo5o/gPK8jDUKuMK
         +DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433874; x=1688025874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjdcHakCzRp2uDPOf1QJOq47vmihq6bx2AuDxoEXfOE=;
        b=lhv+QYYtlH3oLB3Bd+lr3jpAR26VBOvbV1sia4dLa5ZMQJKMKkfgSgvTKHQXo9OPFf
         8ucaH2rnFsk2gxOYJmjYaWui6/cDivjQ8CruxoLUAPZMv3pydrcuz6So/WhrdwMh0E5h
         7yYrfAMIN41HeCRza0o8dNxz7COtRiqCjrELYhulKmVV6+ScW1bekqBqsg8XaZBsZtgE
         Xelplr7PUECMbSnSPZ7KV2MYqy6Rt02O3XRny+0zGo47nhmNsjC+Qe7euDgokrsnTZuK
         CJXC530XxiREASim5Ktgdr5s/cu2xYE6bG8ekaYw01j0k3Itp8/k5A39/9kkrsTue0do
         +8Xg==
X-Gm-Message-State: AC+VfDx71YDFGqMJapwfd/op5wwpAUswVZbHMR4j9aBdTCTUf7MCL9dl
	MOIkRoveY8hcyDVAumqhjAWelw==
X-Google-Smtp-Source: ACHHUZ4EXH26JifnRLV35t73W7c9aZ6OsRaB13FCf0u1UgCoCH3BzpbjGhbi2O2/JVao2KQatBmCug==
X-Received: by 2002:a7b:ce96:0:b0:3f4:2174:b28a with SMTP id q22-20020a7bce96000000b003f42174b28amr1280948wmj.15.1685433873743;
        Tue, 30 May 2023 01:04:33 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcd0c000000b003f601a31ca2sm16762193wmj.33.2023.05.30.01.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:04:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-pm@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [RFC PATCH 0/1] fdt: Mark "/reserved-memory" nodes as nosave if !reusable
Date: Tue, 30 May 2023 10:04:24 +0200
Message-Id: <20230530080425.18612-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_010436_265891_AD2673AE 
X-CRM114-Status: GOOD (  11.40  )
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

In the RISC-V kernel, the firmware does not mark the region it uses as
"no-map" so that the kernel can avoid having holes in the linear mapping
and then use larger pages.

But with the recent support of hibernation on RISC-V, we noticed that
the hibernation process was trying to access those firmware regions
which are protected from *all* accesses (using PMP). So the hibernation
process fails.

We still don't have any "specification" regarding the naming of those
firmware regions, so we can't currently target those specific regions
(they are described as subnodes of "/reserved-memory").

I think we should actually mark all those "/reserved-memory" regions as
"nosave" since they should not be used by the kernel (see the
documentation pointed in the patch), hence the RFC since I may be
missing something here (legacy, other usage...etc).

Please let me know what you think!

Alexandre Ghiti (1):
  fdt: Mark "/reserved-memory" nodes as nosave if !reusable

 arch/riscv/kernel/setup.c |  2 +
 drivers/of/fdt.c          | 77 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h    |  1 +
 3 files changed, 80 insertions(+)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
