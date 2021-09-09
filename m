Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD47BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 13:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8D961059
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A8D961059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nQwOgkVeeTbEK8JS4S/JJ3ygJ5lvwDw3v2HgA7LQcaw=; b=RHPG8mmnuEyzAq
	+jMmT/3obCDzA49M8J7sqfOIpyZsdH4+wWOFb51CCEK2hniny7NUwJud/2/Zw1qhVjfhXTVsGvG8e
	rE1tgZsHqiYGN/XSiojpI3ATw31vdVxe/NrxdD4Jc+ML2bLJ7K9ibSm+6Y0kozTHxJcB4iS8Cl15n
	t+LB1u6aOfdmRj4UknGyYk5dGmX+9mDuHqGPfGyBjq7ap2JEdtOzkw3Uj5g+qDS7rvMHB5qfs4VAn
	bcuqNg5m9Bya4rHqpY/LlpTqpEBTkmFDS7UJZTevKJGMgsv9tHHMgf0iD/X+sNn0pNV2HeYw4WPAC
	2zC82LlkbdENODQSpIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOK6H-009rnT-Li; Thu, 09 Sep 2021 13:28:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOIn6-009FfT-8F
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 12:04:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u16so2204009wrn.5
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
 b=G9Aqk2QIyaP4NStdJlI2W+jYyFf2cxdEkKsatz7oGDFsfmYZi9tBWCduPA4+jE5p7U
 BOuY6gqJjmyV8v5QQKYxDwuzwKGa/5XhOO/tgHUHlhmUEBmh3zMhoy6pH4jz/X3mqm+B
 aiFLyQdZrtcHXPQq/wBywud/Lta/EdrBpbrZgbARYUg/fOO/ZsAxLyZc7yqfUK2jqcg3
 720naMUmXaJh+2jyYDvtsgc7dQDFDjt/gHNTBax++79zSiiVG4xnl5N2SAU6gkjrhJJm
 w9rVyMGtlv9iW1cuSRn5jzCsOgqZnJRO0L04W/ii+Is7cQG1OlyTaPAzvogxQD1BYjMN
 IkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
 b=xb1is02SnIMQgTGr7+L1Or0JzwPqPuB7BQ0NqztgBcWD3aLkz5I/jb8P7NFrc/yDW9
 whw0FXnucTwTRIooZj5ur7MhpVmBjCAgRRv56AhMHkwpGSQBDYSKkngDg09NQM6wYavx
 9A95NMS2rimHErAW6l0rY8RvPS2CTnkLl/bZ83TycNfWpIMKvcvASDBAteW89C51eyKF
 Lj7XyJW76Ux2Ez+mhqB9vyKARo4lijtRTgmPCRa2KFfe2c+iNagOZOredk3ftvU4Wth5
 m1/7cJxthYgVhVH2vd/zmOCpC0YIIoDUhzesjWBGO41xlzMjHUe9F+1PJNuNH4MyeMYP
 NLwQ==
X-Gm-Message-State: AOAM5334ro0s6MKgaKSszUaTfHUj4dr/y3BMV2uh956YmMCUzZXng1eV
 bNQDnco5OmiXIGLvt4jLZrLJKg==
X-Google-Smtp-Source: ABdhPJwXFzB1KuSRyctCLMeToyBav6moCwvyVSJSQ2wA2Una7A66/qiHNzLd3gX+GGFxN1qUveWbMQ==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr3133483wrl.413.1631189065464; 
 Thu, 09 Sep 2021 05:04:25 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.201])
 by smtp.gmail.com with ESMTPSA id n66sm1437498wmn.2.2021.09.09.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:04:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Chris Zankel <chris@zankel.net>, "David S . Miller" <davem@davemloft.net>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jeff Dike <jdike@addtoit.com>, John Crispin <john@phrozen.org>,
 Jonas Bonn <jonas@southpole.se>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>,
 sparclinux@vger.kernel.org, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Gleixner <tglx@linutronix.de>,
 uclinux-h8-devel@lists.sourceforge.jp, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 0/3] power: reset: Convert Power-Off driver to tristate
Date: Thu,  9 Sep 2021 13:04:18 +0100
Message-Id: <20210909120421.1313908-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_050428_366521_8A255544 
X-CRM114-Status: GOOD (  12.69  )
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

Provide support to compile the Power-Off driver as a module.

v1 => v2:
 - s/EXPORT_SYMBOL/EXPORT_SYMBOL_GPL/
 
Elliot Berman (2):
  reboot: Export reboot_mode
  power: reset: Enable tristate on restart power-off driver

Lee Jones (1):
  arch: Export machine_restart() instances so they can be called from
    modules

 arch/arc/kernel/reset.c            | 1 +
 arch/arm/kernel/reboot.c           | 1 +
 arch/arm64/kernel/process.c        | 1 +
 arch/csky/kernel/power.c           | 1 +
 arch/h8300/kernel/process.c        | 1 +
 arch/hexagon/kernel/reset.c        | 1 +
 arch/m68k/kernel/process.c         | 1 +
 arch/microblaze/kernel/reset.c     | 1 +
 arch/mips/kernel/reset.c           | 1 +
 arch/mips/lantiq/falcon/reset.c    | 1 +
 arch/mips/sgi-ip27/ip27-reset.c    | 1 +
 arch/nds32/kernel/process.c        | 2 +-
 arch/nios2/kernel/process.c        | 1 +
 arch/openrisc/kernel/process.c     | 1 +
 arch/parisc/kernel/process.c       | 1 +
 arch/powerpc/kernel/setup-common.c | 1 +
 arch/riscv/kernel/reset.c          | 1 +
 arch/s390/kernel/setup.c           | 1 +
 arch/sh/kernel/reboot.c            | 1 +
 arch/sparc/kernel/process_32.c     | 1 +
 arch/sparc/kernel/reboot.c         | 1 +
 arch/um/kernel/reboot.c            | 1 +
 arch/x86/kernel/reboot.c           | 1 +
 arch/xtensa/kernel/setup.c         | 1 +
 drivers/power/reset/Kconfig        | 2 +-
 kernel/reboot.c                    | 2 ++
 26 files changed, 27 insertions(+), 2 deletions(-)

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: David S. Miller <davem@davemloft.net>
Cc: Guo Ren <guoren@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: John Crispin <john@phrozen.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Simek <monstr@monstr.eu>
Cc: openrisc@lists.librecores.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Rich Felker <dalias@libc.org>
Cc: sparclinux@vger.kernel.org
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
-- 
2.33.0.153.gba50c8fa24-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
