Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48161CCA483
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h+YU6In5WpjVWq8xR9riaGZzCbmhANdNJVcRtNArqc8=; b=GKCKm1up2l44YG
	r/Kdkz5gfLqdd9i1j4SoDdTBnstmDQyZiBlORpnRZlyiRWLbv7dDHeE8uP9ID0mHlgA3Lo98s3GdA
	tzU46tYEYUV2eHWxHt4ruyZTt3nWKgszN3ZN2dR8uvY5NMhgE+p7Io/8/s/TQkiAxdLh/1/cGRQCG
	0iw6CWAjN3GZp3Thfu9q+U7dDA3gGigk+D/AEY06drA1cedY4BbIc87at/GFQ1W+ggKPuIslCQgOk
	g3cWKGrRe+JCvSZUpTIQ0oKaswoeXjwipqqEqUpFm0Ga6OLK7lWNTN92t6hhn1O8vsoxY+hockD9R
	nPubpMPNQyJWhsxJoGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6g5-001loO-C1; Thu, 14 Jul 2022 21:47:21 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6g2-001lme-F2
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 21:47:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso4387213pjo.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 14:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JBraEEF7Pi/rPUlvSul3up/f1rkIrFL2lXpXxABUjo=;
        b=lscc9nAaqk/gLbSr2XL8YrPRs/zyT8T4SiE+UzcwyfJZDejV2V03/Ceml36zOXDw2j
         GSw5Bz+NY1ohcFs2Y+SbhIHhCmrrBRefc9Ctq2tTml3QpKdab/V6fYGRGmiVrgBUngI1
         99Q4DNc0rMuLLiHGkogfp/rrBqI7OQKuhgDfVe9wNw9mtmWkUZ0MuZBbsOMzAVRzGvLD
         9xrGld/ogqVffulMZ1eEaY/hE23kNAH0MTXlQDS3QZykMAvUoMSZwpUr0kXvMYTo6mw+
         feoN81IqGiQNmpkPgcbCkP6v7rV2i5qe9SRfa03yGMJNePPiSyC36JkgtWtmZHn9FToR
         7dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JBraEEF7Pi/rPUlvSul3up/f1rkIrFL2lXpXxABUjo=;
        b=ix8K4DmuVlgoyst0vKMvTOrKnHYsCQfI0fB20PoOQP5DNsyLx5dMiNxwBFrYT18jd+
         c9+7CLLtDf28L0L6S6uiipCsy/t5p3g8ZhFsmH3lm+CayN0u+ZViNwJLc0KIwvej20gn
         htLUG/ZzqRohW4aBFeFV8u777XbxpxItVM2RV+cuqILFh+PC24XYC6TDb4BG9V3pG90Y
         DO+WveKNYqA8QvNI6ta1nZACDBGbfZIawwAM2VkTATQm+E+idbqxr1fjRgbtNwFvtmlU
         JTyg5G5Mw1IDIPUDeYMnZSJLvregShwGqD0+Wv1bX3v9RZEPci7VrpesgWuqY+BvuvS4
         Vxxw==
X-Gm-Message-State: AJIora8EW3I1KGMFktWKNpiofoDKPULIeE8qieIAta8mwPQaHbruS/0q
	XqpOuWXpPPsQ5wy5eJQsVfzsbOhIgz9PmQ==
X-Google-Smtp-Source: AGRyM1v5QC4ANKVLVpkPuuJcTPGQopcKs4QNjHemdLKq1UTYUTez/Vz/d5mLTfj3qgv8jyrxm1KP0A==
X-Received: by 2002:a17:90b:3c07:b0:1f0:eab4:79e4 with SMTP id pb7-20020a17090b3c0700b001f0eab479e4mr3015352pjb.186.1657835237487;
        Thu, 14 Jul 2022 14:47:17 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id v21-20020a17090ac91500b001f113765d48sm145572pjt.2.2022.07.14.14.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 14:47:17 -0700 (PDT)
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
Subject: [RFC PATCH 0/2] Updates for asm-generic/pci.h
Date: Fri, 15 Jul 2022 06:46:55 +0900
Message-Id: <20220714214657.2402250-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_144718_545397_BAEFC52C 
X-CRM114-Status: UNSURE (   8.42  )
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
of pci_get_legacy_ide_irq out to the architectures that use it.
Next, we create the new pci.h definition.

Stafford Horne (2):
  asm-generic: Remove pci.h copying code out to architectures
  asm-generic: Add new pci.h and use it

 arch/alpha/include/asm/pci.h   |  1 -
 arch/arm64/include/asm/pci.h   | 18 ++-----------
 arch/csky/include/asm/pci.h    | 24 +++--------------
 arch/ia64/include/asm/pci.h    |  1 -
 arch/m68k/include/asm/pci.h    |  7 +++--
 arch/powerpc/include/asm/pci.h |  1 -
 arch/riscv/include/asm/pci.h   | 25 +++--------------
 arch/s390/include/asm/pci.h    |  6 ++++-
 arch/sparc/include/asm/pci.h   |  5 +++-
 arch/um/include/asm/pci.h      | 24 ++---------------
 arch/x86/include/asm/pci.h     |  6 +++--
 arch/xtensa/include/asm/pci.h  |  6 +++--
 include/asm-generic/pci.h      | 49 +++++++++++++++++++++++++---------
 13 files changed, 69 insertions(+), 104 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
