Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E2C55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GcG3y5ZXSEHLC7bYxQB8wPXlsz8LZAP37GBuR6cpM9U=; b=hvS
	+rEU7G5Xn6eXWsfxWjOr5m6hmFS7L8IhQCxkPxbYVtLDu2zj4VnXAot2f/AkX0EUU+ek/dT7+ytUy
	RN1kHSWVXY4SsFDLFzzP68HR6icrksiYFdgv1RlZIBdtqkYBv2Heo7dEfznxlbMN6EtzrY9yotVhd
	rrdTw+6FcFejCdAKOgIu60eFsmbsLt1FbGMdtfZmtDUavQXEZ6jEw9jtRuQymjUlCXrC/LrO2IOyC
	9CXeLjDK2dIHwO8kbNdMnLTQu9Fty1+rH2zDhw7WMhPPaxTJbNwd+dLUFO/WGZJCmrCtPD6wAVQK9
	Yqv6OebgNoLL6SK+qnJ7nc4WZMWvlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNK-0000000510v-1vIV;
	Thu, 06 Aug 2026 06:14:42 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNI-0000000510P-363f
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 06:14:41 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2ccd1958e8fso32748075ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 23:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785996879; x=1786601679; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYXnFOSPBEsqMlo6qdtElP2t60AdKc92rixKtDYU8E4=;
        b=UPee6QW+frF1Jmy3xaO0oI3C6FTpao6G1haBjbqz7SKlNxs02pTbGi6QuBLO5Q+d8d
         IsP4G/eGp9NH2Qc34uIImiC6uufLTNvPK4eKFXwDtnrmedVO2H4A4XDdoeC+uMaIdkdK
         KbR0GRTFu7Zw2mHLVC6R3ubYa88In0qd0zQROqt2dm3a6O5Cz989+DEwGs37e8YvpQ/e
         pPIf7PdfPFrkOD3OsNtpEdBwfbdXadfuSkNJ3GI6q8cYtn/xmjcfr7bQ2b86kAfM3F1s
         WIP+tT70sI6xkHFA5S7eooO2h+lJRfTBUd7prtF4vS0L/r6edwCTC4Q64Pl9tIs+zMVV
         CaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996879; x=1786601679;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYXnFOSPBEsqMlo6qdtElP2t60AdKc92rixKtDYU8E4=;
        b=g3AGtr5wXOJsyPP/xnECodGGY6KaPwkPf9pJ04dzaRHhgyr+rcWv77RZmPtEMdEypE
         7fjV7jayCa79rnYpOAd2aUzIt1EFYb5xHuYMP8iE7qwt97bpi6uTR/+AhBacDlZafa5R
         1jktszxC5UaDfti8yqAXnyoJCaY0rTLfAYwwZ2S/dKDEvN5TozvWeu4L5a2YpDE8lsqw
         o7HcQnE3QjHOrpJq6Kskb7mU0TT5g5PEqZkZz4ZovJdRB0C7tOyxe0pfUSzWsw9H/G+6
         mm1uO3VVk8ePKRsrEdnjUmOKO5P3CBy2AM1B5WmOFeXQhLtpwWFOKTCknRimOovOJoli
         zxGQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ZYceb6w8xQLeckYpepmo/zra7aV3HNEgKvxWk2m04TCOWuHFwVag4wN+nrf0Fanl2hnq9mCyxXjDDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfBlCtvr+BT2WHbctr8ET3hXfhpxDMJ8ykcPlva+J1jYXlGMxr
	FZr5d0yy+rLqyD9V7gpc0q2DX1k9cWWlyH6i8AjVsDwjRMHdf07B3yoDNAS6tq9W3iX4Oksx/cF
	I9WFqGBliIA==
X-Received: from pjbct6.prod.google.com ([2002:a17:90a:f586:b0:383:bb4e:85a5])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d52:b0:38f:23d6:b4ad
 with SMTP id 98e67ed59e1d1-3903c5433damr13479620a91.8.1785996878609; Wed, 05
 Aug 2026 23:14:38 -0700 (PDT)
Date: Thu,  6 Aug 2026 06:14:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806061429.474992-1-wfelipe@google.com>
Subject: [PATCH 0/3] init/Kconfig: generalize config COMMAND_LINE_SIZE
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_231440_776949_DE6DDF78 
X-CRM114-Status: UNSURE (   9.09  )
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

[Note: Resending the full series to ensure all patches are delivered with a
 unified recipient and CC list across all mailing lists.]

This patch series promotes COMMAND_LINE_SIZE from arch/s390/Kconfig to
init/Kconfig to be generally available to other architectures.

In some use cases, such as netboot kernels, rootfs configurations, larger
initramfs setups, require larger sizes. While for embedded workloads, it
can be reduced to save memory.

Since COMMAND_LINE_SIZE can be larger, it also makes sense to allow
INIT_ENV_ARG_LIMIT to be configured.

Wilson Felipe Pereira (3):
  init/Kconfig: generalize config COMMAND_LINE_SIZE to all architectures
  arch: use CONFIG_COMMAND_LINE_SIZE across all architectures
  init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable

 arch/alpha/include/uapi/asm/setup.h      |  4 ++++
 arch/arc/include/asm/setup.h             |  2 +-
 arch/arm/include/uapi/asm/setup.h        |  6 +++++-
 arch/arm64/include/uapi/asm/setup.h      |  4 ++++
 arch/loongarch/include/uapi/asm/setup.h  |  4 ++++
 arch/m68k/include/uapi/asm/setup.h       |  6 +++++-
 arch/microblaze/include/uapi/asm/setup.h |  4 ++++
 arch/mips/include/uapi/asm/setup.h       |  4 ++++
 arch/parisc/include/uapi/asm/setup.h     |  4 ++++
 arch/powerpc/include/uapi/asm/setup.h    |  4 ++++
 arch/riscv/include/uapi/asm/setup.h      |  4 ++++
 arch/s390/Kconfig                        |  8 --------
 arch/sparc/include/uapi/asm/setup.h      | 10 +++++++---
 arch/um/include/asm/setup.h              |  2 +-
 arch/x86/include/asm/setup.h             |  2 +-
 arch/xtensa/include/uapi/asm/setup.h     |  4 ++++
 include/uapi/asm-generic/setup.h         |  4 ++++
 init/Kconfig                             | 15 ++++++++++++++-
 18 files changed, 74 insertions(+), 17 deletions(-)

--
2.55.0.654.g21b8a5bc05-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
