Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E613C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 18:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB3C214D9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 18:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olaWqLY1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TAu7rNMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB3C214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=m9XeXk/jaHeSiZYoPBEeDV23qmGyyz/zJbKy6s+YXak=; b=ola
	WqLY1u9doJ4Kjfb5f7/TXrFwsDGGLZ6BXDhJBde8gziLBBYLS2kMxWPEWEjNOTsZ3us5VXSVZc8rR
	Fu54WRdaehb3vRVgoOjgJOGO15f3X0wJ8y4QbP9WJxvBKh2mhtJudT/+9o4MbP9YipBessA8GrT+A
	oIS9r3iIy4dfPg+6csjOcf4h0NNBrf33HzQ5wxIpIaGErW8d6mVNNcH4FP6xP5H6WijTMK2vzaaQe
	58zUmzEUBoLwVkoERmGOTa42CjbnkYnESdBw0BXhZ47ljKiizVQ7hAxHTCMrFvHuVvLVHbm+L9Xcl
	7CDILGyWJteF9fvUxwthqN8mXw4DAwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPX0x-0001mJ-Pn; Wed, 21 Nov 2018 18:14:15 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPX0q-0001Pl-Ex
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 18:14:13 +0000
Received: by mail-pl1-x642.google.com with SMTP id x21-v6so6603485pln.9
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 10:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=/Fq2fZ3g4tO8cLi7l7ZQnzHDNqLRx8Ri8AeakBIke4Y=;
 b=TAu7rNMvZOz+dAfY7VOO6wo4MaKUyzkVlvi7XwDgUzEJpBPqpACQswSNxaQPr9deXF
 Cc5mbBOHpheHFFlzYFqJoNHn+mIWPxXOwU3P6vZlSHCtK759jWZg7m86E9AuHEoHRB/J
 bDZIJf0EhP7a7FanRXUZILQ1V+W1g007NxfwWI7xDP+eeMUNZ4/VRxfhRo+Spm9GOrYl
 Za5emsYW6DYsBD7Rv4Qokws5dLpqjkh0JeN1lc5u00+AEUishxFBPZ0OkFq2Ogt8oPfp
 UV0Zbra+8iH/eQ2+8GBMwHC5IFGJOZ2g+s0J6JPXMMHDjVU1hnA1ZDnLbfvQhsofVVTq
 3C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=/Fq2fZ3g4tO8cLi7l7ZQnzHDNqLRx8Ri8AeakBIke4Y=;
 b=oUFEPcRckJEIrlYXEBFw1gl8kSbuy2U4qNesspmiMcQ3FKDj6x5sejWZQDgII/Qi8n
 Q0V9pOGt9fZD+bqK+X883dRB3DP8vPYCulUnJeM0l8WXQbXL3dYxH0UZ5tD4o7/vv7Yl
 xVLHBS8nOmHvlKhQfbqTTLrNYK3fmHQMUfd625zxVpX6WlHUTaK9cUE0X8l0r0t/WUcI
 QK7jM2hPfbJjB5euknok38pIgZR1Qzine4uF9H05+EmOv9w5/YjUK0pKN5ONCDH/eDgO
 OGMOWVSF+btmkdyOizDVWSwkSG5SkNHWWxaGJiviZZ0QTrjH0k3bAzq9cJftlWaoVx2a
 0GaA==
X-Gm-Message-State: AA+aEWbfMvmechW93J5cyxchi4ZKjw0pN+34+wsv0oTJrMqR2mzy9sUr
 UMaELwo4T93zQKfyB/ssBS8LFF0ZI2c=
X-Google-Smtp-Source: AFSGD/WEDz+dqLew0yjC7vh8MzyRJebqlOA3c7LdjDfLKji9H8yQPJTDFXgmk8GPsMJbNlldyq4VHA==
X-Received: by 2002:a63:ef0b:: with SMTP id
 u11-v6mr6919965pgh.283.1542824036770; 
 Wed, 21 Nov 2018 10:13:56 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e14-v6sm52821336pfn.46.2018.11.21.10.13.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Nov 2018 10:13:55 -0800 (PST)
Date: Wed, 21 Nov 2018 10:13:55 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 10:13:53 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for 4.20-rc4
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-a497ffb9-2b54-47e0-8764-51bd22e470a6@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_101408_497990_33300991 
X-CRM114-Status: GOOD (  13.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129187834080966778=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121181355.6NrwZx3Nxy3FEs1JQIzsh9KNKVsKqk6g7AzClA49dJ8@z>

--===============1129187834080966778==
Content-Type: text/plain

The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:

  Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc4

for you to fetch changes up to 5d8f81ba1da55210123b9595e87b913c79579d02:

  RISC-V: recognize S/U mode bits in print_isa (2018-11-20 05:19:28 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.20-rc4

This week is a bit bigger than I expected.  That's my fault, as I missed
a few patches while I was at Plumbers last week.  We have:

* A fix to a quite embarassing issue where raw_copy_to_user() was
  implemented with asm_copy_from_user() (and vice versa).
* Improvements to our makefile to allow flat binaries to be generated.
* A build fix that predeclares "struct module" at the top of
  <asm/module.h>, which triggers warnings later in that header.
* The addition of our own <uapi/asm/unistd> header, which is necessary
  to align our stat ABI on 32-bit systems.
* A fix to avoid printing a warning when the S or U bits are set in
  print_isa().

I already have one patch in the queue for next week.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Build flat and compressed kernel images

David Abdurachmanov (2):
      riscv: fix warning in arch/riscv/include/asm/module.h
      riscv: add asm/unistd.h UAPI header

Olof Johansson (1):
      RISC-V: Fix raw_copy_{to,from}_user()

Patrick Stählin (1):
      RISC-V: recognize S/U mode bits in print_isa

 arch/riscv/Makefile                                | 15 +++++-
 arch/riscv/boot/.gitignore                         |  2 +
 arch/riscv/boot/Makefile                           | 33 ++++++++++++
 arch/riscv/boot/install.sh                         | 60 ++++++++++++++++++++++
 arch/riscv/include/asm/module.h                    |  1 +
 arch/riscv/include/asm/uaccess.h                   |  4 +-
 arch/riscv/include/asm/unistd.h                    |  5 +-
 .../include/uapi/asm/{syscalls.h => unistd.h}      | 26 +++++++---
 arch/riscv/kernel/cpu.c                            |  9 ++--
 arch/riscv/kernel/head.S                           | 10 ++++
 arch/riscv/kernel/vmlinux.lds.S                    |  2 +-
 11 files changed, 150 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/boot/.gitignore
 create mode 100644 arch/riscv/boot/Makefile
 create mode 100644 arch/riscv/boot/install.sh
 rename arch/riscv/include/uapi/asm/{syscalls.h => unistd.h} (53%)


--===============1129187834080966778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1129187834080966778==--
