Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DFCC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wdYuYIcnxNsXiKy1p/UulMEDIb9z1lZnkcgCt0ILF74=; b=HnwTJn7gnDyi8f
	Oa+BRckYV3lHZfJkiYZCY6m1bNVse4sGTF/5elH7Ra/o1591cDFC2zkgTHQDtFS+HqEeGlmFizVEs
	6yUgJm8w0NDa+AozVVAfaABOe/t+bHIsUPhejrFdT64jqaxmdcuiSRgkNh00z9jmE36oUHhnPKoN2
	UKkg0RVwSersvmT2SJM2r2o7G7CaafWyw3Ygzn3DBlw0mFCkFFwzQMeJRrrv8UDzMCDBUMbVtZ8U4
	PEnSqx7LjUeKXmZDBnlQAD+K6jHL4hSQJ2hHbmSzPVlHDAjDUPut6bTc2NMeKK8XJqFdpL6gREiCB
	tML83UrC98kiGh3k9iZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaXV-0000000EO2m-2eyF;
	Fri, 07 Jun 2024 14:25:57 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaXR-0000000EO1t-2WZG
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 14:25:55 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c199e37f4eso1815760a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717770350; x=1718375150; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9qPH+lBWrZZasyMLxKJRPjQn+PImGEOakuO1diEZs0=;
        b=GrI+o8a4EsuvGWZKY3C9ALoA/uaZAagv7aJ6/Ci44HS0z1RDa292tIH7NNfh+Uo1ks
         eJFMMlthXc9IPxz703ivNcPsbWIVLuxavVHeL2zjCZ1HYTneV90CZDVr51Q/4DtGfsXV
         zr0o1EwaKGVw3lxJtRevQKL53EhxXBSM6D6sESsXLYqIYgLA6BA1mQ3t75ZvkEv/w0Y4
         Za+66R34SGfE3oNudCsr7trJtdTbGkjNvtatIW3wUbSjXJOrbF4lpUCmMztUnDmX4MZu
         8XdP7FhO/Yc8FmXoQ23OhkH1JyY3niuWALJgMg1Wx0yaNR3cx5PKORta99z/FaTOJc2/
         cNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717770350; x=1718375150;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9qPH+lBWrZZasyMLxKJRPjQn+PImGEOakuO1diEZs0=;
        b=SbwwwKjY7zsRN9LS1Vx7hME46Ud1r67qjlgwLLJfLMfY+Ld97okdvk1g6OtT9Y1A27
         PRJvBMgSKC1wNbXDgz6swcKSDpdoVqW6ebtEsYjViBVdjKtsXG4dofU9yAa4xNPVnuRp
         DFkOlDS37ZfWuGf6Pc8meqfoJaXbRDIZwmxhM/8e5IqAEV4qbltQoD9mEUqVYOUBOs8d
         No72ptOiK7emmxCB1IU1w3/hv1k+yAsaukzJoyGj5KDL/7iuR4NQNygtFWfMDuP3AO/q
         OeJ7/z5Bp/3Iy6MhacviwoInQPBfCoiI4fz/EK/DMVYmbTJAWzgf8LK1ELNGxGnAfOgi
         HKig==
X-Gm-Message-State: AOJu0YylFv6xueq2z8y+PCxDcReFefVil3Tcl3uweY/mQNAE46V1Xj3y
	2vL72WXkjx5q1KWnj+YhWFONT9qtTw32sSQDDIIRZGTAfa7HZfNxKvTfwbMC9xTu7h/EItYztvJ
	z
X-Google-Smtp-Source: AGHT+IHzRGhcmymdS4KHpM2RFwnsqcc+N5qSnpgO/uk9v0QN8m4yaH5C1JM/JGB/bkARn7BZRPB9/g==
X-Received: by 2002:a17:90a:8b94:b0:2bf:de54:f5b with SMTP id 98e67ed59e1d1-2c2bcad6429mr2681385a91.18.1717770349798;
        Fri, 07 Jun 2024 07:25:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28067b118sm5548542a91.26.2024.06.07.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 07:25:49 -0700 (PDT)
Date: Fri, 07 Jun 2024 07:25:49 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Jun 2024 07:25:38 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.10-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_072553_796668_4995BAFB 
X-CRM114-Status: UNSURE (   6.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc3

for you to fetch changes up to e2c79b4c5c4d83520abb570ca633ded09621c0a6:

  Revert "riscv: mm: accelerate pagefault when badaccess" (2024-06-03 07:41:13 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.10-rc3

* Another fix to avoid allocating pages that overlap with ERR_PTR, which
  manifests on rv32.
* A revert for the badaccess patch I incorrectly picked up an early
  version of.

----------------------------------------------------------------
Nam Cao (1):
      riscv: fix overlap of allocated page and PTR_ERR

Palmer Dabbelt (1):
      Revert "riscv: mm: accelerate pagefault when badaccess"

 arch/riscv/mm/fault.c |  4 ++--
 arch/riscv/mm/init.c  | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
