Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D964C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YWGnRWEb6XeWy0j88U3KQvzW3k9HabuxmNxXMtXXrQA=; b=RkOnc+Qdl48cGf
	PevrtRnlv+rXK2z0Xi3uSIe8oXpAGZ8W4kyeGEe980yc4tzky1hXGbxrNnYbnzwccA+8i75sMZFG+
	TOkn19U1CK3gKMhnoSQhfrrtFwYY4j4sTDPf3vZQUgRIwGDkUi1dmxrJKbcGlZmBXiezVZrjTZtCh
	XhtuYmIIc6eWOnPUoJF0NyfemtX/Jk7Qo7+WYrpXut7n76AzgFqOTqS1xKvu5dtFONogoLx7eYgIL
	xUGMMFUMHuRD80DTgUMpHgpPl2tfXDuU01ukzgFZhJAWjEY8JsSfU3HT3SwxnNywRQ+k9EZ8psE6l
	gFf2UfIIBsyJ1ENDRLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msvyp-00DmTN-AG; Thu, 02 Dec 2021 23:59:11 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msvyn-00DmRB-8Z
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 23:59:10 +0000
Received: by mail-pf1-x431.google.com with SMTP id n26so1157044pff.3
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 15:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nIUP/oAsb0deaFx8AiRlWHzAVs+zgWpixaimUD3qmrI=;
 b=X3R16PW7OZ05cI2BycEvEhKV6404CptCVWmUtqALdwE60RHH2rI5gn1Cz1VybHjkKs
 VLZn/yCRfpFLoH6DermEDDQ1qBlW58lqG1ztmMRGKFDb9/nKcxuKJQGSB1T0Fu8FMPKH
 uYCkAHAevtRwlmk6Bw2q0NAuSbqMqU58YBZ4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nIUP/oAsb0deaFx8AiRlWHzAVs+zgWpixaimUD3qmrI=;
 b=JYRgCw/kFnVejRUyKW5JifLjQzA3ej3+HEzq3oTAd3rs3F9B/qSoh4F9SFagLwW17F
 RyIivd4E8kuBKHeAwVStXkT5VpUOCn0Z1dgrSNTxesqdkS6ILu57xOoAbignlngNWG5N
 oIbyg2cKUqZgRjfT+NbJoGJLHT42KLOYmn2Djhx/vvASdXE3aNWLkjna69QUInJsDH8V
 DvcLYe9NqOvZ7uPDUkFdOjk7D2LPiTieWzUTEz70iF3Da1GUNruLG0gVQyUh/ouk3HWO
 dMoT7zul0egFFo6b6f2LScgf5t5foLln2mzTz4TzPeKPSHYxh7N+10rKg1oBN0Xmwavh
 Qe8g==
X-Gm-Message-State: AOAM533tGwn7rrWFZ57yONFGxp7PaTn2EL0L2kF+Pt2YRkrAOl6CCKlB
 Y0xXRia1OjaZOj7WvlYn+pYn
X-Google-Smtp-Source: ABdhPJyijRpuHUEwYC+fSPcV7Pavlt3yxKQGIknMGkSIRN08drUDyCrE2zeOer+XT4M/eoJFfSEuLg==
X-Received: by 2002:a05:6a00:10c5:b0:49f:de2c:1b23 with SMTP id
 d5-20020a056a0010c500b0049fde2c1b23mr15583424pfu.41.1638489548310; 
 Thu, 02 Dec 2021 15:59:08 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id lr6sm553598pjb.0.2021.12.02.15.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 15:59:08 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, anup.patel@wdc.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3] MAINTAINERS: Update Atish's email address
Date: Thu,  2 Dec 2021 15:58:23 -0800
Message-Id: <20211202235823.1926970-1-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_155909_397205_F06053B9 
X-CRM114-Status: UNSURE (   8.91  )
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

I am no longer employed by western digital. Update my email address to
personal one and add entries to .mailmap as well.

Signed-off-by: Atish Patra <atishp@atishpatra.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6277bb27b4bf..23f6b0a60adf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
 Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
+Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>
 Axel Dyks <xl@xlsigned.net>
 Axel Lin <axel.lin@gmail.com>
 Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5250298d2817..6c2a34da0314 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10434,7 +10434,7 @@ F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
 M:	Anup Patel <anup.patel@wdc.com>
-R:	Atish Patra <atish.patra@wdc.com>
+R:	Atish Patra <atishp@atishpatra.org>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
