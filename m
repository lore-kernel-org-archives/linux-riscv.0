Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E02CCA473
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysptYVMYYppMo2qUq6czLn925tkbkJXwct70MzlFcpU=; b=cxiYWEHweP0Oh/
	QCfEDLsaxnZZ/8OfxLnbrDXIcxUy6SBBhxcEPtljikRjQlrVUyAjHM87WV0IA+ZWAwEmphhlqiAGl
	X4IgyiBDw/L8LXXEdvhCpX+FyohQtHHQeFqJPMoMbxYvd4FRNspQ/wZYcit7pZxrhSBFFtOoe43+x
	SaScWjubDa7w9ZJdY/IPOb0HpCYxMehpgNdVcLisLxQ+igdE6khDrTJ+WImZQ9NTxnaEpYPEAAnX9
	+/5yZkbmjnxGb527o4uGvY+n5gNXiN0/WSAV/P5opiYq+6UUK6J1+yBUmeC44Y95Uo1Wo6VISxFR9
	Rn7OHkmALVuOZPfYLpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lqz-002yKR-1M; Fri, 24 Jun 2022 16:08:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lqv-002yJv-V2
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 16:08:15 +0000
Received: by mail-pj1-x102c.google.com with SMTP id p3-20020a17090a428300b001ec865eb4a2so6223408pjg.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:cc:from:to:message-id;
        bh=spPs9Kh5ojs3SRS6SOisJmBowfLYX6h0pwpaQVCmATc=;
        b=OOQwQsejeQlKbt2UzAYvBYDM91ItcQHMgj5FomAy5gRFoPGhCCYuOas+oX3/kpysGX
         Rptyn7UjcB/OZrSFIpq8QWU8KKXidyivS/wVCOnTRqr+tse+DOppn9kUdBi37HH+oM83
         eCqN/hQoAAN8JJexYF7im9rEXASfSmYsgirooRs/E+pTIQkqQFsx0vq3Kc5kmuPpPBgF
         y+XieLAqDEB7ZnKk6EQ5F5zNywMvRi7l3djlploU551bac5tDkX3Zw1NdjQvATRNHlDu
         z26QRvkrAM9/9zUqKyTHb8yVc4wCRof7NxnO1HLjtsJ0PTm5Wm4g5ylObydY8ndED2Fb
         yvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:cc:from:to:message-id;
        bh=spPs9Kh5ojs3SRS6SOisJmBowfLYX6h0pwpaQVCmATc=;
        b=09J479d7hQiSa65JImVb982DMbFMNHYoH1nJQe6shtknQfwzF1obWwR/evcAqGuPcQ
         E7YQKGktejk0G++eBwtIuuLdcE7W9RqYZOicdAdaWz60HAiuGjRNNcGKvluD6XbqDe6x
         1Q74/sFFm0c7QEiox2K7x2SI9AL3wWJpKVtdexTpa2VV75MylCFiEo3yWJUr3RzlQcy+
         3HzFjhotbIdZulQz+39jTD2VYHvAZYEIzds6tXHv7rtN7lH2tspdPf8ju1MKSGqHCgwx
         k8iPj+BzYM3PHI68lIiYYofJ07osuMTAzvwUBng15sC40mJatIgikmcY2ospFLbO+8G/
         P7Tg==
X-Gm-Message-State: AJIora9+dBFV2wNbPa9cMsKqFjxoVKQIs9yk5iBVIDdx7MpU8K9nuHzy
	9g4W1IRyeEM6sF276nOSuEwYXZWoXLUOog==
X-Google-Smtp-Source: AGRyM1umNBt5UoQa8o4X9DncGsEKMTMaXY8F5/kEULHEONR9NnfdGcqdijJnlh2NADsJZ0Aul8jKDw==
X-Received: by 2002:a17:902:f642:b0:169:714:b079 with SMTP id m2-20020a170902f64200b001690714b079mr43540771plg.117.1656086892581;
        Fri, 24 Jun 2022 09:08:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id h6-20020aa796c6000000b00522c8fb04adsm1976417pfq.176.2022.06.24.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:08:12 -0700 (PDT)
Date: Fri, 24 Jun 2022 09:08:12 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jun 2022 09:08:06 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Fix for 5.19-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-3e339ca6-0ed6-4d02-96b8-2f664f62cc8c@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090814_255906_6A0F9D97 
X-CRM114-Status: UNSURE (   4.65  )
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

The following changes since commit c836d9d17a7d102ded1ba4dbd4ee0bc42ba26211:

  RISC-V: Some Svpbmt fixes (2022-06-16 15:48:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc4

for you to fetch changes up to e83031564137cf37e07c2d10ad468046ff48a0cf:

  riscv: Fix ALT_THEAD_PMA's asm parameters (2022-06-17 06:16:46 -0700)

----------------------------------------------------------------
A Single RISC-V Fix for 5.19-rc4

* A fix to the T-Head memory type errata workaround that avoids behavior
  that is unsupported in the LLVM assembler.

----------------------------------------------------------------
Nathan Chancellor (1):
      riscv: Fix ALT_THEAD_PMA's asm parameters

 arch/riscv/include/asm/errata_list.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
