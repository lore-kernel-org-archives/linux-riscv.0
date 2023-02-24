Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7566FC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Q5WYJa4hUiG9fB5r7E/rOREWfsfqUcJp+QAO5CZ1lw=; b=yRQNr2ZcJlIykL
	bmTe7gpBq2VM3RSCwvr6+fAo/6UlUDrSWlZBF61bz4Mo/5SqUVbAbSLcW4SOP+/Ra6H9U5Pbqsf0A
	YFJU/BfevvgKN5W5E78wJ7K5thwxcC5F/zSSFE5tgasl2XWxLYz0WXmIeObRItoYvwJlcMhD+5BwM
	p2TqDjGG4B4Es8KRYcs/ZyVAXhpbaAzbTd8asqZeP190hjzShoJcNUhOzf6LkMUMip4Tmo+TedwBQ
	UMu6JQmZc/cgT/6ieE8EWAlVXt7RXKJ27Z1f3ekR7vcR5ws2TmbsSMU9zElixabpDLti9IK/6GDVp
	xndDbtfSC5KiT/2msukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGx-0030bD-8N; Fri, 24 Feb 2023 15:46:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGt-0030Zj-TX
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t15so14471241wrz.7
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag9w3uN5xzPKxNAZzcNNjHWmc9B6/0KN1QfdLLrUT4I=;
        b=X0PHEQaZmP53LE8a7DLlGp4x5wOwrESCZaJ3bnZ1bvjPXIYfUaAHuk9dQW/97ol0A7
         da/+odcty69PIkLro12xHzyLlZHznZLp2x05/rZBpK1G6LPOjN7e9y8pkgALXOhAqzVB
         STM3tcQoDzjDg+nJadjWMElZYQ37BQ1/cLBkXS3yhz8VdUcPCRGm0EsoTTCd5lg+U1eu
         Byo4etuDBMKfoEKZmXtLi+oxHA5WsFCZxJNtW/e8kTzCb/gmGc5cKac9Dp2TxZd9TSIg
         gUbS/3+0n0vj/Pkk2XJqCcjPvKItAKSCMu89Scwqnl+8X7dcnshZK4K8vBdhwxYXjDuf
         7AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag9w3uN5xzPKxNAZzcNNjHWmc9B6/0KN1QfdLLrUT4I=;
        b=FV4RdRlp42zc1jlR91TEWVMM0GlR5hMTigquKGf1d1NbdlSnTLBZG4VDzkXsDkFf9g
         7RdBlq0osjOci1iYjmClnUUeFRrzCT79ti694OLWhnF7C3Z2iuM2pgUXeIsaQgi2omo6
         y5nT36n8Z9lCWPkhUgSyyyRh9zdH3a/w+jLTMBLXdNUMXWq40/YMFVhtOdYPykUTzc7M
         mPUQ6f2xfKYhF4VtQKLtlYAXvuRaffG3VWGf+JPem+8JRg4CZBxB//NQQYQjmOqi+mgB
         RQXdsmq43Rlhw/5zEJEDwY3gMQp+iWd/XBe9Hcz1LYesc5eePWMPTE3+1/NyOXc7dmwh
         qR6w==
X-Gm-Message-State: AO0yUKV3pXYm+d2eBhlZtJGPsUZr86iweo9U9n1GFbZ8DoL22bWpWw/8
	yy3DiCU7l4G9wSk3JJyFWQsjUXA3lngaBREb
X-Google-Smtp-Source: AK7set9F+q5VE9eYkKTXWQP0zjxHeAv1TMQO288yvx0HRws68/WJTaRj1VVftdrRMWv3WOcr878Gew==
X-Received: by 2002:a5d:6789:0:b0:2c5:5ed8:77d4 with SMTP id v9-20020a5d6789000000b002c55ed877d4mr12083283wru.57.1677253563117;
        Fri, 24 Feb 2023 07:46:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c128a00b003dfee43863fsm3174057wmd.26.2023.02.24.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:02 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/6] riscv: alternative/cpufeature related cleanups
Date: Fri, 24 Feb 2023 16:45:55 +0100
Message-Id: <20230224154601.88163-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074607_989310_E1872807 
X-CRM114-Status: UNSURE (   8.05  )
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

This series has no intended functional change. These cleanups were
found while renaming errata_id to patch_id in order to better
convey that its purpose is larger than errata (it's also for
cpufeatures).

Based on riscv-linux/for-next

Thanks,
drew

v2:
  - Rebased on latest riscv-linux/for-next
  - Add a new patch to reword the help text for RISCV_ALTERNATIVE
    as suggested by Conor
  - Snuck a comment cleanup into the errata_id -> patch_id patch
  - Reworded commit message of the last patch [Conor]
  - picked up R-b's from Conor and Heiko

Andrew Jones (6):
  riscv: Clarify RISCV_ALTERNATIVE help text
  riscv: Rename Kconfig.erratas to Kconfig.errata
  riscv: alternatives: Remove unnecessary define and unused struct
  riscv: alternatives: Rename errata_id to patch_id
  riscv: lib: Include hwcap.h directly
  riscv: cpufeature: Drop errata_list.h and other unused includes

 arch/riscv/Kconfig                            |  8 +--
 .../riscv/{Kconfig.erratas => Kconfig.errata} |  0
 arch/riscv/errata/sifive/errata.c             |  8 +--
 arch/riscv/errata/thead/errata.c              |  4 +-
 arch/riscv/include/asm/alternative-macros.h   | 72 +++++++++----------
 arch/riscv/include/asm/alternative.h          | 11 +--
 arch/riscv/kernel/cpufeature.c                | 11 +--
 arch/riscv/lib/strcmp.S                       |  3 +-
 arch/riscv/lib/strlen.S                       |  3 +-
 arch/riscv/lib/strncmp.S                      |  3 +-
 10 files changed, 54 insertions(+), 69 deletions(-)
 rename arch/riscv/{Kconfig.erratas => Kconfig.errata} (100%)

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
