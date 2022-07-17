Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C3C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 03:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lb2FLKQm0OFYmjDA9hX+CE6ribUU9JyvwjOtBFPvWDI=; b=OhSWXNm/qYfAWY
	IXsiBcYRHJmfNrP9eCs4iAFDGFVFR3EmkqMz9qQ4hNJKqpUrx2/t/7ZfVqrcWUvufNFBSgH1HSQEn
	3dZdbDJAMsng54OdllS8Ph2/p3ow58/qpOe3mhwzgK5c1Uf9ubwhUd+pAT/5wgh+6qjE4ktTy49UZ
	agejU+XyncipSeqlKups/hIWkcvK42jMD+MluxqKUcFuPAV2ljhMd2sjuCBT1IpDo7Jo8P6cPsRbP
	yDilCWNfzx2uztIdOY2No1/bz+GCMdR4cZrHSLAcZxLYeLh9SaKgGADEK1Y3kJ8mcS0EsU5l4pVbf
	Ah9esCxEDJwSHsw9OBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCv3i-003E9I-Mq; Sun, 17 Jul 2022 03:35:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCv3g-003E2g-Az
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 03:35:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id c139so1624781pfc.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 Jul 2022 20:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TP3NuknBFwR+HMAb9EGFICsetJYvdp1cQE+vF2pIYIY=;
        b=Y3FoT4HNok10kBgoxv8WDEwn7zhDTYRu388hTCVBTmj3jFmwNCRlF4dFGh7oEuyIwg
         uyNyNXTrdUMFb3CX3qqX9H8uJQru77P34dUuQ1Rho9F49MWYkMmzHApFpWXNyJKWTuvx
         zZztno86ZjOJejUTStftEwZCSIuea95+j1XZjUQ3IpsXo6oPd7y/IdOjGpnmxfOm9lq7
         lx0UCoTTCxI1SDY+i2kudzu/sdz2xI2+IQqP4HjKSbPOm+MTfusHyARBWdPMhmWgJJXd
         PP9qEI/xJn3afWmN0tvIbMlAseNKnvLFFzV8Pj/W+Eo9xcXbO5KCPWqrqdO2m+Jfx7Si
         Ps/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TP3NuknBFwR+HMAb9EGFICsetJYvdp1cQE+vF2pIYIY=;
        b=WPxPWgf6/xhUPj5P6xQefppDDKtX3AjmTHuWmpddVWe5jxv/XvTsXTDy3zpvglSvYn
         +Pp1YLxMY46cwW/6unkv6qzOkpSj7ghWB6pJgLa3kKlbh3Quk5U1SkkK5qKWi/LbcIMP
         aFAIRzsUzvKgHaAkLn4R3gTcR9nxBjWndKgpJ8jo7TgOThGYNPMIFwtg8AmP4HukuCuL
         NbIoGWvjK3gXlybyTTDJIsxmTlmaGxDGczE7kcqytfqGXqOKtsqII7Bc5IOuLam5gSDB
         mughPAMSzcC40cFYJp362kakn7lZDTaAKCGpip07WzbPWgqHhhXQe4vzFxt4KUMW2UZz
         69BQ==
X-Gm-Message-State: AJIora/Ns3JUhNWUUbVL6fsqSST1QktmuWW4wOag/yDBuOfrQxtluuuW
	jMMV0VN1BRWf2GoC18nYP+M=
X-Google-Smtp-Source: AGRyM1t/uI3R/Ju5pJaOnhwS3KjJr/qvycAbzjW9qeofLhqpJX8p8oQBP/Bc/1a/jJEWz6DQ3nWzDA==
X-Received: by 2002:a05:6a00:2484:b0:52b:2be0:2191 with SMTP id c4-20020a056a00248400b0052b2be02191mr14476822pfv.51.1658028901844;
        Sat, 16 Jul 2022 20:35:01 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902650f00b00163d76696e1sm6275909plk.102.2022.07.16.20.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:35:01 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Updates for asm-generic/pci.h
Date: Sun, 17 Jul 2022 12:34:51 +0900
Message-Id: <20220717033453.2896843-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_203504_418482_2EFB248F 
X-CRM114-Status: UNSURE (   9.31  )
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

When reviewing the OpenRISC PCI support patch Arnd suggested that
we avoid copying arm64 and riscv asm/pci.h and moving that to be
the new asm-generic/pci.h.

This patch does that by first moving the old pci.h definition
of pci_get_legacy_ide_irq out to the architectures that use it,
this turns out to only be x86.

Next, we create the new pci.h definition.

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
 arch/m68k/include/asm/pci.h    |  7 +++--
 arch/powerpc/include/asm/pci.h |  1 -
 arch/riscv/include/asm/pci.h   | 25 +++---------------
 arch/s390/include/asm/pci.h    |  1 -
 arch/sparc/include/asm/pci.h   |  9 -------
 arch/um/include/asm/pci.h      | 24 ++---------------
 arch/x86/include/asm/pci.h     |  6 +++--
 arch/xtensa/include/asm/pci.h  |  3 ---
 include/asm-generic/pci.h      | 47 ++++++++++++++++++++++++----------
 13 files changed, 54 insertions(+), 107 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
