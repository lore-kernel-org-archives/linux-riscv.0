Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E1DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 04:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFA160FF2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 04:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EFA160FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2JDWqorVFWjRmf9rWks2R2YB7p8xBACfg7l6cx1EQbg=; b=pMM9McT4qkA75e
	aYGK/o7T8sD00VLr3of/D/4nHes73RsyfSEjiUur9ZD+d5soXJepyEzsoTWmvvSxmh7RJQY+PWRhi
	AROPZmdKfC6qpzmy6j8wqUivwY7mmOIOonVi6WujLl9MLTv9uBH7Fp7zvFr2iJezCLfKViCia8jzC
	Xu+31V/pFY6P5dKyT+WhdsRO/veIyYqNrQlWuTxISO8dpy+B9XkiHk+ZdnGwJhXvo+2bh5R6wuG4d
	KmR41YbF+cGbBuXhVFtNChuQueqz83/b/sXke2YnAN3G/YBJF42NI31kfVIFP4OCFVHrFZafTmADc
	9lldsPKwU+INR0oHf2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgJzO-009pTN-Ja; Fri, 29 Oct 2021 04:59:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgJzM-009pT3-12
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 04:59:37 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 367B63F174
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 04:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635483570;
 bh=OJg5Riv5SEPQHw6GUzsRnRLEnZCVPUrqTKYKL32qSlg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Ojjjrddck/GH5h+kjVnTgx3R3EttqtMURgCHtLnZFTeGZphUA2BFWcNuMXU0I5+CJ
 pCCC3sJXwC6d1gzsmiIAwbChVh18oqxBj0KUz0O1wnqzguharDpFLCVy5/RHfaAzE5
 PzpCLLlBfzTuTR4Y42CI3+44HYZgebC+P3y5JhyUgSG7wrJOl12k9ArGKlZ//IkU42
 VaWZ60uSITI2U9Sb+mWgf5LMj0135zYkHtpk8DgEwKzxH88k2aRAs55ZamZR+GV6T+
 mS20jKkQS9xsirJUWVAJ4nGwDHC41vRoxABFuTUhcnfr03cElnR3DMpRdX9TlzyQKW
 Q3E2utzWCeNDg==
Received: by mail-wr1-f72.google.com with SMTP id
 u15-20020a5d514f000000b001687ebddea3so2967924wrt.8
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 21:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OJg5Riv5SEPQHw6GUzsRnRLEnZCVPUrqTKYKL32qSlg=;
 b=QGebOMSgPbWZf5RPbtyvqeecF8MAcgKMRA4UDTilZzlmHVXEbgl0T/jZ9Cu5sAQDv8
 V8AvCbh6MiOe//u/5q11LGuy6frXIapK9KwGelNOUcfdAaT8Z1VMuQE1BLJ09UYIEJtl
 OpH/9B/qgaRlj/w3ez4ZoLDG7Hx4PNfA0Unqkr0Yo9NLcSq3lii5xMztu2Hb1lcAZxRc
 mF7P5dhoBNBOyRHkA8cdTjQs8B4zFtXHBYUnBc510a4oZ6KlV4cg6sbINr+bUtxfFtqa
 zSCLBKv2/xR+Zlo2gHkMUA8UjTx1VP4v4mFrE1lR/+J5V2yOI9U/H3pbbyuUXxhnqRRt
 GqnA==
X-Gm-Message-State: AOAM531KEJz2VFlpnhpEFe6dd3NmHbr5efXkFHSiARTXdhRjm9ShakE9
 tSkTfuN98rbZCu+CkUDQsWy2J0RZM3w0cQW/RgcmoYT5Gt1wLNSkrsgjKEAlNnyiWFIpghqI3SX
 ntXuotNby0Ly5qHnAQeJQQWXqjrU1EUcgh4/+DLHQTT0LtA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr8777202wmi.69.1635483569963;
 Thu, 28 Oct 2021 21:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoSjAtlbuEhehndrjjwCsmEUDmuBiMpCGgdYwnt+96mQvDORVoOvrvS1DNJy40R3xBZiwCEA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr8777186wmi.69.1635483569839;
 Thu, 28 Oct 2021 21:59:29 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id n12sm376620wmd.3.2021.10.28.21.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:59:29 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 0/2] riscv asan-stack fixes
Date: Fri, 29 Oct 2021 06:59:25 +0200
Message-Id: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_215936_360268_FE3D7BE4 
X-CRM114-Status: UNSURE (   7.43  )
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

This small patchset fixes asan-stack for riscv.

Changes in v2:
 * fix KASAN_VMALLOC=n
 * swap both patches in order not to have a non-bootable kernel commit

Alexandre Ghiti (2):
  riscv: Do not re-populate shadow memory with
    kasan_populate_early_shadow
  riscv: Fix asan-stack clang build

 arch/riscv/Kconfig             |  6 ++++++
 arch/riscv/include/asm/kasan.h |  3 +--
 arch/riscv/mm/kasan_init.c     | 14 +++-----------
 3 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
