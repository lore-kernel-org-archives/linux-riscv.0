Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A0EC388F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 18:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC3A1217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 18:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKn8SlFc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="S9o1BssE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC3A1217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atblaVSfk6uUtrBTmIMJVBG9eZqZcfOwY+nhE5nvLkw=; b=aKn8SlFcOL+q8c
	8VCzWz2NCkfyCyvUx8fP4N0iAfftmjtq6bK1Oq53I8NYqZ8Js0OFFDbE7dmZalOoeDkqnETjbMhbB
	WpTP8R6T/kGGDxs3erfwfihenm6gfHk9YH4FmRFbVb6ktVU8BifvShsKRCtpe+OGJlZdUJ04qv4Sr
	KwbyRL6+t+YHbvh75ZuLK/3ygWpGILxvqzFAoHyXb6LUlldenEWwRkuGyN/eMbmSyKanZTd0H5NLS
	z/lU8lqF/JCHpijBs3UwCPtEPA+abSGCQkiw9JS58IorSmSOBNvlTozHXF57AO5fmOWC6O5hnOTvF
	0C/kPb7Fqu/utiMOXe5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDuvf-0008Mc-OJ; Fri, 27 Sep 2019 18:25:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDuvc-0008Ld-9I
 for linux-riscv@lists.infradead.org; Fri, 27 Sep 2019 18:25:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id n14so4250390wrw.9
 for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2019 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=ILyYK/RyFSznwVzkPBcKhiT8HPwbfb9Jo/boI1cizIU=;
 b=S9o1BssEg46wqpVTRWJVH0DuDQdCRBiTBnhb600zFmYBhAWiIfq3By9eUgU6SbMKd0
 /pnnnBkVUSxgg5JjB9Ska3G7vmvzp1dmUHbhNedoqPE3K8ndqDP8U0qJqzjH12s4qy4u
 8XqdZtvI5xHKroydSrGjBVqTHl5EOltqb3ioXGj1TH4DqwxK8NNo8X2uhHjpfTnDLVOW
 n4aYTst7l9b0R4vgxGmlh972Y/TyRH5xy7ZhT/YCyHBCqqlyI0u6gnU+oqja1lwnRuZg
 6+oRwQBY2XbCnJJK43B3G2n8OwxDIDBQRAIITZB6OJizVRy11WO7XfQUcRiZ6e6vPiK5
 L1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=ILyYK/RyFSznwVzkPBcKhiT8HPwbfb9Jo/boI1cizIU=;
 b=IhLi+8Ov0SwvTaT9wpGjPLSTBxZMLRvGAWHTgdWKV4/+1oojvEzR5wbLRyfWo4tviP
 fSNZmLgm0XeY7LSXStjGf35u4+05HGnTF63h1D9wpbdAFzhw38Er8uXMfWeAgGxwDtmv
 DFiq/pj46kzvYlN5/EY50BwNVEiVZKqD+GMe6ePBgKTG7dVX7cpk51s0oiLHLrHGg1A6
 ZYMahOe08b9ufwVGBGpLPV33Cea+7+X3lbi/y+OaxuLxB3gHPWMlyQMu6MEeJH6+n8cm
 tTdBMeGQVKBpIeicBXW5BhASu7R++nRNTOUpQG1iiJ9RUAahSQmZ3YzEMQgAmp9TYIeb
 5GQA==
X-Gm-Message-State: APjAAAUzjGORCf7wu8AYQa5zhq353KzEJmzRYkT3UFQzO9t88L6SeQjm
 Eg4OxTZADI02ySiKi5fdtVsAKA==
X-Google-Smtp-Source: APXvYqz6qVaFBt7XT3TUgHDF4YZhVzJCpdIiKfIOmy7VkWX76KlB8NIB36WxA7SH24DIw5NikJN4jA==
X-Received: by 2002:adf:9c88:: with SMTP id d8mr4050027wre.364.1569608714352; 
 Fri, 27 Sep 2019 11:25:14 -0700 (PDT)
Received: from localhost ([81.255.46.201])
 by smtp.gmail.com with ESMTPSA id b7sm3500756wrj.28.2019.09.27.11.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:25:13 -0700 (PDT)
Date: Fri, 27 Sep 2019 11:25:13 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: torvalds@linux-foundation.org
Subject: [GIT PULL] RISC-V additional updates for v5.4-rc1
Message-ID: <alpine.DEB.2.21.9999.1909271123370.17782@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_112516_383433_D0D06EE4 
X-CRM114-Status: GOOD (  11.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit b41dae061bbd722b9d7fa828f35d22035b218e18:

  Merge tag 'xfs-5.4-merge-7' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux (2019-09-18 18:32:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc1-b

for you to fetch changes up to c82dd6d078a2bb29d41eda032bb96d05699a524d:

  riscv: Avoid interrupts being erroneously enabled in handle_exception() (2019-09-20 08:42:34 -0700)

----------------------------------------------------------------
RISC-V additional updates for v5.4-rc1

Some additional RISC-V updates for v5.4-rc1.  This includes one
significant fix:

- Prevent interrupts from being unconditionally re-enabled during
  exception handling if they were disabled in the context in which the
  exception occurred

Also a few other fixes:

- Fix a build error when sparse memory support is manually enabled

- Prevent CPUs beyond CONFIG_NR_CPUS from being enabled in early boot

And a few minor improvements:

- DT improvements: in the FU540 SoC DT files, improve U-Boot
  compatibility by adding an "ethernet0" alias, drop an unnecessary
  property from the DT files, and add support for the PWM device

- KVM preparation: add a KVM-related macro for future RISC-V KVM
  support, and export some symbols required to build KVM support as
  modules

- defconfig additions: build more drivers by default for QEMU
  configurations

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: Enable VIRTIO drivers in RV64 and RV32 defconfig
      KVM: RISC-V: Add KVM_REG_RISCV for ONE_REG interface

Atish Patra (1):
      RISC-V: Export kernel symbols for kvm

Bin Meng (2):
      riscv: dts: sifive: Add ethernet0 to the aliases node
      riscv: dts: sifive: Drop "clock-frequency" property of cpu nodes

Greentime Hu (1):
      RISC-V: Fix building error when CONFIG_SPARSEMEM_MANUAL=y

Vincent Chen (1):
      riscv: Avoid interrupts being erroneously enabled in handle_exception()

Xiang Wang (1):
      arch/riscv: disable excess harts before picking main boot hart

Yash Shah (1):
      riscv: dts: Add DT support for SiFive FU540 PWM driver

 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         | 22 +++++++++++++++++---
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++++++
 arch/riscv/configs/defconfig                       | 11 ++++++++++
 arch/riscv/configs/rv32_defconfig                  | 11 ++++++++++
 arch/riscv/include/asm/pgtable.h                   | 24 +++++++++++-----------
 arch/riscv/kernel/entry.S                          |  6 +++++-
 arch/riscv/kernel/head.S                           |  8 +++++---
 arch/riscv/kernel/smp.c                            |  1 +
 arch/riscv/kernel/time.c                           |  1 +
 include/uapi/linux/kvm.h                           |  1 +
 10 files changed, 74 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
