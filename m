Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A0CC4161D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 18:13:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D3820685
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 18:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8sIi3zp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Xfoqh7T7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D3820685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Xah8RwK/xewWdGS7aQ8MapnvhVJZm4IWSAlVgfvbvrA=; b=U8s
	Ii3zpQceXuPlpCtCLr0vFyq8y/zf585/Qs8zgACU63q+Uv0higFWCKKeM5hG2uJ+FHRpgd4AxetKc
	JIN5+Q/GnDsjy3I1GE52mSg2lFNCpU5iPHGhfZypkbb94bn7LYeRa7co12gd8dNdvgm6hTLHb/INF
	C7OLZeni/F47TTeS8AUD5is/eLxXVsskZpaTdhNrp+J81b5uigEGxaRpO+498FlqzZUK/u2cy9Gyx
	iR57LUbJYbVMdJ8KB0F48TWyqvHrTIwXWK3nnLQnWRmZ5oD5GCUTaZa4gKJlDdNPYtZyOylXq5LQD
	Arl0RjFMGYoST89koEi50MFiVJ6hx9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPAWW-00072y-IR; Tue, 20 Nov 2018 18:13:20 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPAWS-0006rt-SH
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 18:13:18 +0000
Received: by mail-pl1-f196.google.com with SMTP id t13so1456893ply.13
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 10:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=/Fq2fZ3g4tO8cLi7l7ZQnzHDNqLRx8Ri8AeakBIke4Y=;
 b=Xfoqh7T7EZgUWy+Hy/5wzjZ2FNC9eBX9FQ+07qkV7Xks2fX1uCpvW28X9MgSoFjFCQ
 +sVY8YNdvPfUqcnv5DfQfRdF7h55c+dYJU4dYx6odvDtiMCp9qmAG+P55z9Y9glSZIys
 rgaRL5oo+6TzSesFQZM0ybW2gKGnbtUWxo3/7jKkSdNBkJl/FOb7ZxqrCUhWwpNDHZjy
 j+zNx7JvBKndg5QrN08xew4Ig4DJpixAhiiH446JM5r6zuudgovQdw8G/wJueSBmHCGu
 usYk/EJdDs5lSWcjGzGkuX+Gr9qbWFrjJvb392mZ40Fj0igQATzfj8y1izlFqgnRrJ6J
 Rcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=/Fq2fZ3g4tO8cLi7l7ZQnzHDNqLRx8Ri8AeakBIke4Y=;
 b=td0p2CTas4D7mGOVxpNe5bU2EW7IDWxGVZpWPaVq/5SCL5eh9ZE3XazO+Nm4FhNOeq
 rvwQzQR37MlycVnFqS6OnSQK59JdaEgHqfBykQG+abIBQFS+EAxStdRvOTP1evOy9oqv
 4Q628lRzUoc+Klohc+Wi2v4XHEEM7DGGTy+5gXVSAo7sdp0OkN0asTsNbgirl2DdGh9Y
 zR0vauo7lniFxuKnuBr7DboxqfMD2cTvSGhROtWurc5dGN0wOfbYRJo5KFh71p1Kg/Zp
 +7k+9iPnv4j2xRsOYb7PqGaItK4QQxmoWsla9O40MmJEjgfQnKBbBY2TR7Fl4L+L1VV1
 +VQA==
X-Gm-Message-State: AGRZ1gJBiVkcqQMsNRwC6AeuqLt14y2mvhksLlslYuyJWcCz9/2t8a7n
 5rq3XrB/zg7BZaYvBAoFmBS1TMhKHag=
X-Google-Smtp-Source: AJdET5fTNTngQs/+5oy2HLA+uyo/HohekStOLRplO4cFmuDMl8iii2JoDgaL2S6McrS20GHUwGB4Yw==
X-Received: by 2002:a62:42d4:: with SMTP id h81mr3198051pfd.259.1542737405094; 
 Tue, 20 Nov 2018 10:10:05 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k129sm51840213pgk.29.2018.11.20.10.10.03
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 10:10:04 -0800 (PST)
Date: Tue, 20 Nov 2018 10:10:04 -0800 (PST)
X-Google-Original-Date: Tue, 20 Nov 2018 10:06:41 PST (-0800)
Subject: [PULL RFC] RISC-V Patches for 4.20-rc4
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-c4f4aebd-afe6-42f8-a2e0-a0c6ff3dc001@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_101316_979164_5012F089 
X-CRM114-Status: GOOD (  12.89  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1014266635812450242=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120181004.4Ds5sejlgUtbG4WQK6wYwSUxtQQzB478cOAXkQuEOXo@z>

--===============1014266635812450242==
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


--===============1014266635812450242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1014266635812450242==--
