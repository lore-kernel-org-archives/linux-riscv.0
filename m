Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087EBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 00:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lXZsIj9ldD6LdFMoAuhUAfJ9MJAmWQ+BRMhheP6rNMk=; b=r6cps2wEHiBIZL
	jj2+KQlvS02zEzDuZSpPVsdrHga2C1RKWWXWcRwCaNO9hNua4HN0wT40vZUocj3TL3LoWbyfGz5oK
	bFo19TqzTkmh1nzniZpYbNgbR6V6HqZ+jiVpDNR8QmF7Nq2rAIU8hy0V4siPSMpuu2igCuwkt7K1I
	kX3mPJ7UxEPSc9biWrnTBYlv50YXQYLpel6FLsdNpL03cYxx38RDJWDw0IXWG6cC54TeOLQn3SKPC
	OKSy2lcAvi4713WJ0ODaW9N/3shKzj8FPto4SL/fps3cgywWH5gYuJ9bGBjgyIWMhGhCM53mulObi
	FIqstNSOZRh7rLdAjJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDEpE-009Zoq-S0; Mon, 18 Jul 2022 00:41:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDEpC-009ZnN-VY
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 00:41:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so16668926pjr.4
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 17:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9cFK95jUJ/VEHOa/R8FTtdnRjPaJWSBWfAQkMz6g64=;
        b=gfzCKqBjbDBR8zsSfs57EcWDuLzHUloNR32b4bZWlu7m3tVcsDsSrF6WVpARw2GbYy
         6mQCTWmFrIgEUEhv1x46fmN2FoDnRT5YM/vhynbFe1lP685xTFuUn2k8H2E42ltbfZw+
         pCJ3vqcB6hYabbj43d4qHHR/Q2VMIRUBRWU3iEWlAHC4ti5h54l/2EQI3dKZbqYA4jLe
         33p6ZhtGkHVV6pxD2IOcdNZahAFjzEdVct8Y/PgBDqDwowLPYwmYsNKpxsbQ5F/BoQMX
         BdAtU+ICy4+n+xOSK5p/3S5cI5abd4xA4Wle52EeqaGBVrD605yWNUMb26VpQ0A4Kh4s
         E7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9cFK95jUJ/VEHOa/R8FTtdnRjPaJWSBWfAQkMz6g64=;
        b=7bQ39gCBatnXuTA26NTlJ9VQPnzaQh0AUgK8D7n/5pL3ykZicufH/L2fC02vSxiPHb
         JG6Ws14IqSfkLjzIDZOlDtLCFoPiVaHXIyche77QTpmzCcQNvGNpOQDZXdYKYSJtVF+7
         UDuObhx0FNkyWPoUN4fZTvsyM4FmKCAXf+Q3RbGt9NTdKTZq0f1c0J1JE3/P4xqLHx8f
         KtsD0EH+JVIW4D8dJXKDH7owvbX2yJfU78pmh1KUrY2XiAxd2BoYHVyN34oG2yDJeXSv
         Sh+tSPqNd3xc4jGQzIpZzC68BMpSmLzsNGTkS6xKMBUGmX4vUSkJwUQ5s0yGHaxT06VH
         VwHQ==
X-Gm-Message-State: AJIora/JOwe18eHuTnH4aDPaiS4Plv22YsQ4D03MIIF6O5ESVzwlY/nb
	4+9JVL3UFI2O5nkSCG8L/2M=
X-Google-Smtp-Source: AGRyM1sCUiFZMu5spy7h3aBwSkuHHCzPAj9rfWSz61VtJtlmq1sl10bnEhwEFfaF/9C0SByYzafGgg==
X-Received: by 2002:a17:903:c5:b0:16b:d8d5:5f14 with SMTP id x5-20020a17090300c500b0016bd8d55f14mr25534716plc.18.1658104883939;
        Sun, 17 Jul 2022 17:41:23 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id 64-20020a620443000000b005289a50e4c2sm7842627pfe.23.2022.07.17.17.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:41:23 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH v3 0/2] Updates for asm-generic/pci.h
Date: Mon, 18 Jul 2022 09:41:12 +0900
Message-Id: <20220718004114.3925745-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_174127_038152_AF34DECB 
X-CRM114-Status: GOOD (  13.51  )
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

When reviewing the OpenRISC PCI support patch Arnd suggested that
we avoid copying arm64 and riscv asm/pci.h and moving that to be
the new asm-generic/pci.h.

This patch does that by first moving the old pci.h definition
of pci_get_legacy_ide_irq out to the architectures that use it,
this turns out to only be x86.

Next, we create the new pci.h definition.

Note, for the series, I am working on these fixups as part of adding PCI to
OpenRISC.  If the series is accepted I would like to merge via the OpenRISC tree
with the OpenRISC PCI support patches to avoid having to coordinate upstream
merges.

Since v2:
 - Remove pci_get_legacy_ide_irq from m68k.
Since v1:
 - Remove definition of pci_get_legacy_ide_irq on architectures
   not using CONFIG_PNP, which eliminated most.
 - Add ifdef around PCIBIOS_MIN_MEM for consistency.


Stafford Horne (2):
  asm-generic: Remove pci.h copying remaining code to x86
  asm-generic: Add new pci.h and use it

 arch/alpha/include/asm/pci.h   |  1 -
 arch/arm64/include/asm/pci.h   | 12 +++------
 arch/csky/include/asm/pci.h    | 24 +++--------------
 arch/ia64/include/asm/pci.h    |  1 -
 arch/m68k/include/asm/pci.h    |  2 --
 arch/powerpc/include/asm/pci.h |  1 -
 arch/riscv/include/asm/pci.h   | 25 +++---------------
 arch/s390/include/asm/pci.h    |  1 -
 arch/sparc/include/asm/pci.h   |  9 -------
 arch/um/include/asm/pci.h      | 24 ++---------------
 arch/x86/include/asm/pci.h     |  6 +++--
 arch/xtensa/include/asm/pci.h  |  3 ---
 include/asm-generic/pci.h      | 47 ++++++++++++++++++++++++----------
 13 files changed, 49 insertions(+), 107 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
