Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BFBC48BE5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 01:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB70601FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 01:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB70601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQPNECLEeg5l11J4SJ5+4rmy04yfROkP1yJqz17cblA=; b=vYTuqQCvg0VoWD
	RRh0h013nyG0Bh8MUrXYplm22imQ1MOrhIRmWTR/zPaHk0lvXna2sozAq/qWyHDtpAhtSM/pfB4Zn
	vooMPJxtBGl1kqI9H7a4lejaZ42sJ4ukIvCJNBQ/jvAwdWBcPnC4HOchXXtCKjXnzswJpIE54bXSk
	99K6UfN3Rpkq8zXaL+4XfEEicUIAGr412radi9ar4pK4m+SYfXdhUUcswT7uJ/UrmHLwM+PcXjFwR
	B5leWW++4FZxrNDSPjNz5XHMf0BUE/l4hSUFmOgB7Kcy62Fh70lOfvO2KzG8502qlp8jpBscHaS+k
	9KRrygfhfIPQ1QdPJuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltgmT-008P6y-BE; Thu, 17 Jun 2021 01:25:17 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltgmQ-008P6K-Eh
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 01:25:15 +0000
Received: by mail-ej1-f41.google.com with SMTP id ho18so6828586ejc.8
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 18:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=77paSv1vfUnmhsAZFukXy1zk5MAOuc8TBznUAIk9l+0=;
 b=TYL7hq9OHylhSpD+57TNr3tGu8rfSUSnmciRRKAkxKDxWWB38TpRFL2Ob7+GASYfjs
 mSuZspDqpOKsRo/VZW7xYtFKvk82V6MMEvSC5WLwdDG2m83c/NCJiNv8huS2aDkxkhyl
 b4b2rRHcUD92NcalJAgzJ3ykmszdLTI7CC493DDDI43/QChc2sGAJhZN9AoBioGjHpXx
 chcebx9W1QY/5RIzwCudjVUp67YQTktF+ruS5nAgRG2tKm6kcbYLpsKNRuUW3TkVlVtu
 5EJBV+wmmGYzBrDQbXClDpaQrMLALaSomFvXOIArhqWnUH5t8lWYzjUzl2hyz9+ommiM
 5LgA==
X-Gm-Message-State: AOAM531HOYYjvw+FGG7lUsCeEmqxIjlLT97N3lydX9fSXA9C5hsv9gA/
 bm3IDjby4LCrRCUhOAhbr4Z/LMWt2AHagw==
X-Google-Smtp-Source: ABdhPJzIDqhwqbWaknEWaMKhzG/aVdOya/Gu7PhYtIOmdbXoWZZbJ0up5/cW8MXQtJo1WIlrq0OsGQ==
X-Received: by 2002:a17:906:dff2:: with SMTP id
 lc18mr2364636ejc.371.1623893112431; 
 Wed, 16 Jun 2021 18:25:12 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id lu21sm2624721ejb.31.2021.06.16.18.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 18:25:11 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 0/3] riscv: optimized mem* functions
Date: Thu, 17 Jun 2021 03:25:06 +0200
Message-Id: <20210617012509.34265-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_182514_554540_76F1417A 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Matteo Croce <mcroce@microsoft.com>

Replace the assembly mem{cpy,move,set} with C equivalent.

Try to access RAM with the largest bit width possible, but without
doing unaligned accesses.

Tested on a BeagleV Starlight with a SiFive U74 core, where the
improvement is noticeable.

v1 -> v2:
- reduce the threshold from 64 to 16 bytes
- fix KASAN build
- optimize memset

Matteo Croce (3):
  riscv: optimized memcpy
  riscv: optimized memmove
  riscv: optimized memset

 arch/riscv/include/asm/string.h |  18 ++--
 arch/riscv/kernel/Makefile      |   1 -
 arch/riscv/kernel/riscv_ksyms.c |  17 ----
 arch/riscv/lib/Makefile         |   4 +-
 arch/riscv/lib/memcpy.S         | 108 ---------------------
 arch/riscv/lib/memmove.S        |  64 -------------
 arch/riscv/lib/memset.S         | 113 ----------------------
 arch/riscv/lib/string.c         | 162 ++++++++++++++++++++++++++++++++
 8 files changed, 172 insertions(+), 315 deletions(-)
 delete mode 100644 arch/riscv/kernel/riscv_ksyms.c
 delete mode 100644 arch/riscv/lib/memcpy.S
 delete mode 100644 arch/riscv/lib/memmove.S
 delete mode 100644 arch/riscv/lib/memset.S
 create mode 100644 arch/riscv/lib/string.c

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
