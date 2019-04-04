Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDB9C10F0F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 23:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924CD2184B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 23:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEkm8KBr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X85PTrta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924CD2184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o7wFfQCv/kqDnJF0PDttlrjj3AdqVfPYv74BAMJN1g0=; b=DEkm8KBrFVGE4j
	w+ZDlNNg+q02cONYHMRytE3nJxpyyxcpjAPAPE6eOCwpI7+AsQ69FbtyaCoKiHWkiWNmCyXgTlyzz
	fekZ9jiMoUrxbigom2pkeHj4r+mIl/8Cotl2eIaqGQ5PTqB/j5uJEPxtb1GJaAzyhx7IZYPiaPDel
	eD/xQEqvC32WBUR0OARjbAf+ksRiB937DeVvVDeN2PwGlW+PciyBkZA2KKTdsO8ZQ8JbmHepUbOxW
	SL6vzFjwK716xAjXTyHsFzVQt/eulvxTAWGVDGSaSgcvcEHddeWwvJaOxF4izseae96LqOfrdeDsx
	EXIBiPwa1I0cFaeYoAiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCBnp-0000Dc-Du; Thu, 04 Apr 2019 23:29:49 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCBnm-0000B0-BF
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 23:29:47 +0000
Received: by mail-pl1-x643.google.com with SMTP id w23so1955082ply.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2019 16:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=ysBJe5T5Y1DNorw+ljzDdrTof4pVRsltKWZ9RRcQ+JA=;
 b=X85PTrta713pYoHXMV8rg4P7tAx4rI5qrMQGY7EJD1vjQnluwEfFjvuw7CE/jKuayJ
 lxUjphJC2kisV9ytsTUcnKRAsAHoKz+hxDhcaq2X3eDbAAnhCVY2usuzooUVSNB4VCCH
 61BW8fyKGzPqX+fnlR5x5j3dnR2KW+MXVzeqYZnF42MOS5OTxRPFzyxWJ0dOPatW9R35
 Lw2ADcF4LisunURbSbRHfgllgTreWWIJuxjPIg86xoeoa4yZdAKlzW7mVz4Zv9CaK5bT
 7SNhF/2jqtMHIzZQiotQAUdVsq7pufTUlPrCcytQSGWuLKqMfU5HuoorROhWzi70X0GU
 02bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=ysBJe5T5Y1DNorw+ljzDdrTof4pVRsltKWZ9RRcQ+JA=;
 b=EdcMCH1UfMVRakpwrXjCXe88ACr26L8SRq67veupYp9sQWhVQ3XqAD3S20yupsYLXL
 3ylp5qsZUldJSn0NqgRhywBMSqMfgWzmK3stx87uHfj5BCauocG50ZbND4mqm80JnJol
 aWtSlRS1v8rfiHjI+nAI5DWisteqAbmMCHlTQKUQA7qb4xL4UCu7o1/7XxgNk+TqLCCa
 wK4tlp+LM94iZLws4xMua6wc5JjB/nYPCkyocxMJTPAgTyBAW3PK9hJZxQvND/RVCmVx
 wfYsaXLfUXy97FDCvRxlRoi2qrahjSEH7MRJ11Ab6CtuVRhMZhjyVqB/J6rafTrosX8l
 IINg==
X-Gm-Message-State: APjAAAVoJNQsMGSNaih/gwQtxcYSEaRCFBxins50cSHmgTWES6a3RjFq
 bfDU7ObShy2Hj/n9z7Z4n6Z8H6d0B/F+IA==
X-Google-Smtp-Source: APXvYqy+Pr5PD8r7eabECAPPq8z1YqCN0boq1W2Nd0eJsQ7St2yoK3qNiN2e0uXlDzIETFAmlqa2dw==
X-Received: by 2002:a17:902:e48f:: with SMTP id
 cj15mr9275505plb.256.1554420585422; 
 Thu, 04 Apr 2019 16:29:45 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g2sm28586872pfd.134.2019.04.04.16.29.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Apr 2019 16:29:44 -0700 (PDT)
Date: Thu, 04 Apr 2019 16:29:44 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Apr 2019 16:26:00 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for 5.1-rc4
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-2bff106e-098e-4cc8-bdb6-48f05d1065d9@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_162946_387206_87183E3D 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 8c2ffd9174779014c3fe1f96d9dc3641d9175f00:

  Linux 5.1-rc2 (2019-03-24 14:02:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-rc4

for you to fetch changes up to da4ed37873918eeb4e8db7f0cf55e0a7e18788c3:

  RISC-V: Use IS_ENABLED(CONFIG_CMODEL_MEDLOW) (2019-03-28 23:18:51 -0700)

----------------------------------------------------------------
RISC-V Patches for 5.1-rc4

I dropped the ball a bit here: these patches should all probably have
been part of rc2, but I wanted to get around to properly testing them in
the various configurations (qemu32, qeum64, unleashed) first.
Unfortunately I've been traveling and didn't have time to actually do
that, but since these fix concrete bugs and pass my old set of tests I
don't want to delay the fixes any longer.

There are four independent fixes here:

* A fix for the rv32 port that corrects the 64-bit user accesor's fixup
  label address.
* A fix for a regression introduced during the merge window that broke
  medlow configurations at run time.  This patch also includes a fix
  that disables ftrace for the same set of functions, which was found by
  inspection at the same time.
* A modification of the memory map to avoid overlapping the FIXMAP and
  VMALLOC regions on systems with small memory maps.
* A fix to the module handling code to use the correct syntax for
  probing Kconfig entries.

These have passed my standard test flow, but I didn't have time to
expand that like I said I would.

----------------------------------------------------------------
Alan Kao (1):
      riscv: fix accessing 8-byte variable from RV32

Anup Patel (2):
      RISC-V: Always compile mm/init.c with cmodel=medany and notrace
      RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area

Joe Perches (1):
      RISC-V: Use IS_ENABLED(CONFIG_CMODEL_MEDLOW)

 arch/riscv/include/asm/fixmap.h  |  2 +-
 arch/riscv/include/asm/uaccess.h |  2 +-
 arch/riscv/kernel/Makefile       |  3 ---
 arch/riscv/kernel/module.c       |  2 +-
 arch/riscv/kernel/setup.c        |  8 --------
 arch/riscv/mm/Makefile           |  6 ++++++
 arch/riscv/mm/init.c             | 28 ++++++++++++++++++++++++++++
 7 files changed, 37 insertions(+), 14 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
