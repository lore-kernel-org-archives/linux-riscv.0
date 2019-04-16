Return-Path: <SRS0=kGhb=SS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EB8C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 17:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E803206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 17:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L8NdR3+E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UPXo+6HR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E803206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZKsT/UczleuQD5A5GfeNc7ZN4DxDyIJKwtWe8bw/oY=; b=L8NdR3+EBqyv23
	msZ9NqQhhKvSGUoNS+va5e+VA2v8k3ECrFKzmaK4uY5pmqfZMi1j+0HufKf4I2rclYI3GNCk4zc8B
	v8AEEthJmpR9wOiZSaGiZA0sFSxN5Zc8DwrMc1iAVavDIWT9RBv7LfF7P83t7VxiGcd9lF2AWrmuZ
	TCbsA3A3W+LcIWs6JvjhWlKjWLix0ah2QR3JiAbmUHpLJZae6silHzfe5gYS8dRdYGzg6Coo43WLf
	i5Q6Etv42UNuJfcomW2KqR9kQ0aJ1icefxq+vyt4K4DWATHjv12Fq6zRbBGmQCKUzOA1VLn4rgUg/
	UkoyxUtGl7YT3OH3XYqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGRpC-0000RY-PE; Tue, 16 Apr 2019 17:24:50 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGRpA-0000RG-NA
 for linux-riscv@lists.infradead.org; Tue, 16 Apr 2019 17:24:50 +0000
Received: by mail-pl1-x644.google.com with SMTP id f36so10668617plb.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2019 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=YpGvq/4oL3U/yzzNTEZXc9rKkrlrHrkxbsUqZXLRLyY=;
 b=UPXo+6HRHxeuvNJHDbiyIH+rrtLJeWbMcNTKdu1SG0tj0RUml6cLQTHWcUn6eRMZ9o
 Iv35M8aWqk7RUHlxmRwcDa6LExTPkJqUD5D1OUdJciIomLGLZOnzhqqk9zs2o7L0xraB
 48i/5m0t/welDxRxCCKZqWdAwx71UFSp0LwKhvvvA25Q0m6P0N57480Pv/8QF4CheGya
 EHwB1R4tlnIjHpSK18YP9lkD60pC0bsKqjzButcyR1/0gfFjDUI/GXB0i6IvDz0bGRW+
 xfGQR35LtG6xPbh0Y57+CHBqOb1LvK87Y987vac2NabhwfEbqc4Heb0D+bPHocvV7TEL
 OuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=YpGvq/4oL3U/yzzNTEZXc9rKkrlrHrkxbsUqZXLRLyY=;
 b=hGWuUiCtaR+FabJaI72q3dNY1qt49C5gWGITwd4vb34fqEyo63bUyzmNJJivRlHdFA
 7mm4ziWIOGNcmtsrURSlGUeziauCfsji1H2kzYHsAulsOvfwDU7gjkJMDCXB2MHH7IF4
 DUTdxWkkwyrJ3IMQs/XGfDG9BaoUW76TYioQW4hZPJNlPiC0RDTzR6P16ssJ3L5SlOIl
 IHlhj3JBPeQEHYKF15EIELrSEtBcVr8XzojkWEaJFL9LOTOk6kOESCOvJ/0KZQOlw218
 VDxUwXD2/APyic5EvyXrwUtIxxGBpRIS9AACQ1Ri41oIrRgRdfyPFNubhfS0+Rvj5+lX
 IoNA==
X-Gm-Message-State: APjAAAWI80+lXyb2gaYjE8wMyU9v9szpKsXgIqrCj8oj6Q3LcGBcHsyg
 lUmUxBdbeTJWg88aJA2y9LvI+WsQ+ai+Rw==
X-Google-Smtp-Source: APXvYqyfPj3ItENNvOHVzcT++xfVwXSuMHxRiNKBvmjDPjKPS8nha4+oikPZojs8BWiNh/M3j+QaCA==
X-Received: by 2002:a17:902:b94a:: with SMTP id
 h10mr84224398pls.82.1555435487369; 
 Tue, 16 Apr 2019 10:24:47 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c18sm142471563pfc.0.2019.04.16.10.24.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Apr 2019 10:24:46 -0700 (PDT)
Date: Tue, 16 Apr 2019 10:24:46 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Apr 2019 10:24:43 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for 5.1-rc6
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c5019c5a-5f6a-43a2-b376-6a29a824e260@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_102448_777683_C7FDE76A 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 15ade5d2e7775667cf191cf2f94327a4889f8b9d:

  Linux 5.1-rc4 (2019-04-07 14:09:59 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-rc6

for you to fetch changes up to f05badde4e20d2e0f8c39d07a6873b2bfb0754f8:

  RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit systems (2019-04-10 09:41:40 -0700)

----------------------------------------------------------------
RISC-V Patches for 5.1-rc6

This tag contains an assortment of RISC-V-related fixups that we found
after rc4.  They're all really unrelated:

* The addition of a 32-bit defconfig, to emphasize testing the 32-bit
  port.
* A device tree bindings patch, which is pre-work for some patches that
  target 5.2.
* A fix to support booting on systems with more physical memory than the
  maximum supported by the kernel.

These work for me when merged into Linus' master from this morning,
which has no conflicts.

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: Add separate defconfig for 32bit systems
      RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit systems

Paul Walmsley (1):
      dt-bindings: clock: sifive: add FU540-C000 PRCI clock constants

 arch/riscv/configs/rv32_defconfig             | 84 +++++++++++++++++++++++++++
 arch/riscv/mm/init.c                          |  8 +++
 include/dt-bindings/clock/sifive-fu540-prci.h | 18 ++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/riscv/configs/rv32_defconfig
 create mode 100644 include/dt-bindings/clock/sifive-fu540-prci.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
