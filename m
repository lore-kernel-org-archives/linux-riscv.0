Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4F8C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F56Gp/lryuUEQNTPV6H+jd5Rz1Vjb1tHv3iUp4QpaaE=; b=zeeOCY65HgAJM3
	I7fXHU+So3bUeRfXvQL/SXCkQLpIuWC+k3TSdAEs9emyqb10UIz2jvhZHZjyTGmAwIUOhMuC9Ojlc
	4hyp3C87sabMLxzMKxJoA54X/i+M7DxmDul8TCJoLHtV7/JFVXdtULXKBsMJO9klMwyZc8LM3+KBW
	fInZy6nTZsDdhc/Dnfqaz+9Z4sx0U98QVCJOHoGYMmfH2D2Q98IuhTSp0VBdwHJpaPemlPhf/U/gn
	vrRLUG9i63wXtbZ6D8YL/0VmzsEEW5GMUfVR7Dd608sM1fIL6cWHsUz6RSBi9gDI2OSfXWuxOXP9D
	wTukMfb8aaHdn1evYX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn0wr-004QB9-SF; Fri, 06 May 2022 16:36:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn0wo-004QAa-Ln
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 16:36:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id e5so6530624pgc.5
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=qEVz08vvf0VIHBcvKAlc53ZhzOaZzAfXKDFQQpcAtv4=;
 b=lgRamTQd2O9lDl1x9NNyFEsZ6+OhPg0g9CVw4BrS31nsXQ1KXBn03r/1OzbZ//upQO
 gSakyor/ca1sM+pP/i4SiUfiZ/7aNp+aE5vrwr1NUBH8J004nMjdUIFOATKmEQtR2QCh
 Qr6eKKKliygkzmswa+mwDUQh4lHDgkri9QHRmcoNGgSodIPRbDDlTwZ9ykROh0fF1sPQ
 HJhtsW8YCDjEpBh5eDw72l6FrpmsBn+veC3LaHcv/u2RxAK+JqPC6z1vphiCChQK368n
 aFINi3jv4V8LFKZsMuHQQUhh9IXHj/oxSkRo/UjEwB/8jXPDxnFIORK7V4UlaS6eJrQs
 wApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=qEVz08vvf0VIHBcvKAlc53ZhzOaZzAfXKDFQQpcAtv4=;
 b=NurYldKmnS1OrqQuMNbvGl/HvBt4AFhMrw0vNBPLyBNODjeroEQMfctYjyTeX2QYU1
 NqChtd7DkXVZPdE5SMwvTChhzHExUBT4YHGQL/LUXr/c9mUieDh8BagTRGUCR+zFdIpu
 9Cd6XiuNftNYxT4LBXtojctjcwW/fufDujAkgUKoGFMLJP++0QkOmFXaEBj0aSvo0TXm
 N+I8ClNO6gUHGrWCIpW5BOhrtrvmHH6g2ll0y7niNSqVHC+gxq9ouzy+vs2F8vrk2CKF
 x3C6Vglhibvd/W+KOgiAM9eanN+Rrvc7hgytpiSnpJ92ZQmLctsffH2wCzHMqzbp+yco
 0wsw==
X-Gm-Message-State: AOAM531Pkugo9zVSsMQw+xgjFxXDBHACfyIBJEiOJd2kFwFwIKgQwuUS
 Tw87oexzPXpRSBq21pOESZ/VIYpIPsDJeg==
X-Google-Smtp-Source: ABdhPJzjEu3WfJZwCDhm62TWNxO8ndiU3Gx+YKY2ev0GNpx4ajYDUw+tIOLYoQQPMOL+3rFk1tMcuQ==
X-Received: by 2002:a63:6cca:0:b0:3ab:892e:bfa4 with SMTP id
 h193-20020a636cca000000b003ab892ebfa4mr3444656pgc.494.1651855012002; 
 Fri, 06 May 2022 09:36:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b3-20020a1709027e0300b0015e8d4eb1d3sm1968731plm.29.2022.05.06.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:36:51 -0700 (PDT)
Date: Fri, 06 May 2022 09:36:51 -0700 (PDT)
X-Google-Original-Date: Fri, 06 May 2022 09:36:06 PDT (-0700)
Subject: [GIT PULL] RISC-V Fix for 5.18-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-93e651e7-8975-4f60-8fab-31f695d9af2b@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_093654_973728_2891EAB8 
X-CRM114-Status: UNSURE (   6.86  )
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

The following changes since commit ac0280a9ca106c5501257e79d165f968712b5899:

  RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL (2022-04-26 08:19:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc6

for you to fetch changes up to c6fe81191bd74f7e6ae9ce96a4837df9485f3ab8:

  RISC-V: relocate DTB if it's outside memory region (2022-04-29 07:59:18 -0700)

----------------------------------------------------------------
RISC-V Fix for 5.18-rc6

* A fix to relocate the DTB early in boot, in cases where the bootloader
  doesn't put the DTB in a region that will end up mapped by the kernel.
  This manifests as a crash early in boot on a handful of
  configurations.

----------------------------------------------------------------
Nick Kossifidis (1):
      RISC-V: relocate DTB if it's outside memory region

 arch/riscv/mm/init.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
