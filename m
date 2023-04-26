Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890F6C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RIFc4kplh3GmE+2RBLajm08vVUWn4uTOeYQdwlN8MO4=; b=2nx1iU9MeB0Bo4
	3No7ia6e8uUxAUl3Lj9Ux001Jig8cjBnMC6RRoKsxSkq1BbIfdYvDc3I+gPGIYySUOSuXetHydYIT
	6xrVgq3m9QXjqa6W4QZvc5Nuysh87klBKkRFU7eqwEVC9LZ7ZSziuwp1hOXO1tlFnG4G3rI/5zqoi
	v36++shahLxEK2ec8oBigIwQDSgxgXVaGgnhiJEs0sN3rW9jeH/kie+7w8aL6FoRdiBalHGcs50Oh
	9Cu7zm7BQ/H7kH+O9d3GP9femunU9GhqqkahTGldId48AVsBGgkbNSGi32m4QJCnWFY2sxwb5l720
	jXXrWx+WFEaC9l/l6V3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prftv-004AJ3-0r;
	Wed, 26 Apr 2023 14:13:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prftt-004AHu-0u
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:13:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1957e80a2so154392605e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682518419; x=1685110419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LHVKBtQv48LRoqvVXa8YO7czF2Cs1L7zHECgcSFHKRY=;
        b=ltZSFhAkgQSswzIz9rXwXkJqu+Rovdtkw726j0f/GekGpV9KvaBN75KrfaEIlyJqsi
         xL3R1deWmlh+JBNhbzH7a6RWM4ua/LGoC6DtIBE0bE9yGDftUl87yIDIffu7m94PQt3a
         rCoCcqqnA8LHYVmK6UhS2nGofVIm180PPDC2eJb0R3tG/OVqjl157lZkRZRRv9ouEX8l
         B0ueZ1BSJcgn2KsBIPmgJQpXPswGNMVE84FJvrkk8LnsCI4J8w5SUi4eqTz+ii+MDAV/
         WZQbyW03bnydf0gHdEGGxgDKoguPKROHctMXyEnKdh28JCskHmxyAAM5Z4OhHSeHLWkl
         3IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682518419; x=1685110419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHVKBtQv48LRoqvVXa8YO7czF2Cs1L7zHECgcSFHKRY=;
        b=INpd4oi/voxRqWl5Eq595mXuWlJXcjV+P02k+GhCAge7cWDhT7sljLUpbvM1sV3rCA
         qO7YZSfkvsK/2fCFvkDCxAg7TCbVsHci8VfQivO23sUOCNC+weWsKKDCll/T8tdNAdlI
         hNS+JRKY6LtTtCnI4uah02tb3tMdSLFokBaFVxPfqwD6/8+n0E0pHIkPS2ZGYycdjJNP
         Zm1L0P2jK7h6zDnYHlc6MJzVZZiTr+3iEj/S14HcdvkyCsAy4fMikn9hTUNHRQSmrxFg
         fqX8hBlp7qARG+eEvQefZeIL6JG6NkBXmW14sVsfXeSYyB9CtNjZdgl8Hk4fZWZsMEeT
         LBDQ==
X-Gm-Message-State: AC+VfDz+Cj04uI1RrNsAQHK2m0rshUKeZALOjeWAXk4MUll4FQMsvYjM
	F+2oNerWWqwFn5hUh1E4VUtP6T5DfExejIPhZZ8=
X-Google-Smtp-Source: ACHHUZ6m/gNpldsqNDINTcD+jLIee7DOTV1Apz3wVgMG/thtxanWKYtygyhc4K0zTW79DcZ4oIPoDA==
X-Received: by 2002:a05:600c:190e:b0:3f1:96a8:3560 with SMTP id j14-20020a05600c190e00b003f196a83560mr1913184wmq.10.1682518419565;
        Wed, 26 Apr 2023 07:13:39 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id hg7-20020a05600c538700b003f1940fe278sm14728499wmb.7.2023.04.26.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:13:39 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 0/2] RISC-V: hwprobe: Couple fixes found on late review
Date: Wed, 26 Apr 2023 16:13:31 +0200
Message-Id: <20230426141333.10063-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_071341_316707_63FA77F9 
X-CRM114-Status: UNSURE (   6.81  )
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

I didn't get a chance to take a close look at "[PATCH v6 0/6] RISC-V
Hardware Probing User Interface" until now. I spotted a couple issues
while looking and this series collects the fixes.

Andrew Jones (2):
  RISC-V: hwprobe: There can only be one first
  RISC-V: hwprobe: Explicity check for -1 in vdso init

 arch/riscv/kernel/sys_riscv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
