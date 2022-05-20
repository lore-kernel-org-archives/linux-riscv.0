Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF97AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FJH+Ma2lmsIUt1MCNF2sKRk73EeIwVbWNzzIhUPv64g=; b=egpaBvCx3l+a0f
	JcmiBUZR19nio33T1jipiLijVoIuU2vk02v1VC5AyJZ0szKIH18TdkJVNjo7A5Xr+xYBbtE+paU6y
	DnxxYlJm7YfSqrpKHtAGB1FXoxc/PCTh8tTL/KP1vcV1Dh/GIH9GgU9NFnATlpXrSoK/FWjDb/4Re
	sN134/GAGWWDTmXEaaK2T3YB0Q8LjKuOpTCENGXrPxG3wiONXBBmxmX5kpWQm14UKfjUMcxamF72g
	qt7iGjfrOuDPbGfCN0aoFiBezIckkcMPurduWN6BP4DAGrvr9lN6N//nJl+YkTkXSmAYupuQuYcXM
	7jeOW1ng1rOCw8Pact3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4lr-00DIdC-3K; Fri, 20 May 2022 15:42:31 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4ln-00DIbP-H6
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:42:29 +0000
Received: by mail-pg1-x52f.google.com with SMTP id z3so6551260pgn.4
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=9O1f2uby0zF1P32LSN2FMpx0hIAco3n5Bs6/xy9ApFI=;
 b=jKO0iq7lQ1xQ4bnZ+ws+dIULKtsFxtFOS7MbiT5CcNTxlhn5rCPFM6DpZnbCBYqBop
 0gcX/R4ObVLroFeWjSaIiAJudD/7GdQgmQvt5ctxsSzCH8u50HtWelKgXmahZu9jcdL8
 KZ6Azppfly05DJqDiV0gLOjSjUs95LqvQqm0LAmi/cWjOsgUm5zvPWHyqz8DktAhk/o9
 f45ijqH4gKcSCqEzDvo0OJJYLzmcHCIsd9ig/iKCpb8pkPA6G56IuVwGM2c3JC1kIOPe
 94nqvxovyNL/a9P8dtwCsApeDZFp6tzOEvgBukqmAiBoAJ3Vh7SRJkBYn1xhl7EnzG5J
 kUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=9O1f2uby0zF1P32LSN2FMpx0hIAco3n5Bs6/xy9ApFI=;
 b=BXtVNMWTp6BWDmTaT5FVAsZszSPyYBSxtucpFtTOHdr+QG7oKdSm/ctSJF+dI1D+U2
 ZJ4b9huYfe65l+TrvgpNoUOLNctcZXxhkZ+8xrWVSh5idXb2RLUnshNqeXvJL0otAFFj
 rTm1cViCfIRAtrZe1dnjrjbxI66Nd+vX2TTXTtVj5WWsqS7Eyo3rZrE70oXnVMSPhtLI
 p8aObQC80Stg7k29EfxyU28SFEuFJseYSarAimr+liZ+futK63qPmHK0lcEtfjltEEa1
 uC4pf/aazh9uXyx6R1Wtv8BptYM6XdxhRtQl0pVmgLbu9SXP4TswehNwUlBxwTwu2Uxh
 Uj7w==
X-Gm-Message-State: AOAM530M21YnV8OUFoLxfm8Ok1FLCCikiG5Q/ChZrGA2nnuwDd/ZbBiQ
 DgklpiCnNa+pLgMwMv4lSGCbseJld/QH7w==
X-Google-Smtp-Source: ABdhPJzZLYUzziEx6OFJM4uFhj7Wleke9vzg8Yp/95RWj6BQKn25v6NMxMQ2T2rnmfilk9IuJ6tsOQ==
X-Received: by 2002:a63:d301:0:b0:3c1:7361:b260 with SMTP id
 b1-20020a63d301000000b003c17361b260mr9173962pgg.367.1653061343219; 
 Fri, 20 May 2022 08:42:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 144-20020a621696000000b0050dc76281acsm1975781pfw.134.2022.05.20.08.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:42:22 -0700 (PDT)
Date: Fri, 20 May 2022 08:42:22 -0700 (PDT)
X-Google-Original-Date: Fri, 20 May 2022 08:41:49 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.18
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d5b7ee6d-8d8f-4603-9a20-843f35fae857@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084227_776851_0A5EB97B 
X-CRM114-Status: UNSURE (   8.60  )
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

The following changes since commit c6fe81191bd74f7e6ae9ce96a4837df9485f3ab8:

  RISC-V: relocate DTB if it's outside memory region (2022-04-29 07:59:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc8

for you to fetch changes up to c932edeaf6d6e6cc25088e61c3fcf585c30497c0:

  riscv: dts: microchip: fix gpio1 reg property typo (2022-05-19 16:47:29 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.18

* A fix for the fu540-c000 device tree to avoid a schema check failure
  on the DMA node name.
* A fix to the PolarFire SOC device tree for a typo.

----------------------------------------------------------------
Neither of these is particularly high impact so no big deal if it's too late
for 5.18, but I figured there's no reason to wait as they're also very unlikely
to break anything.

----------------------------------------------------------------
Conor Paxton (1):
      riscv: dts: microchip: fix gpio1 reg property typo

Krzysztof Kozlowski (1):
      riscv: dts: sifive: fu540-c000: align dma node name with dtschema

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
