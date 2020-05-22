Return-Path: <SRS0=+Vgc=7E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FFEC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 May 2020 18:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C4520663
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 May 2020 18:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZHJP/NN";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="dDt/3eIT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C4520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rD8FJvrr0fC2ieKuRxFHZchacDqiMocM1Gb2Kxm//Vs=; b=MZHJP/NNS3zxW86BeyB01+W0LK
	+rTBDJlXsT8HP7SEvVpq4pV2p/xAmUBrH36NK7ztu1VDurP1ku8lcfHxxC0g9GTZGVKLDhC+e5kEE
	h6K45ekO6Hj2IeAhuW7BD0sM1AArCWNNQLE3/vSa5Xqag9E5auE2/PuMJ9O7oi4sdioVhZ6llFuWa
	pznVgauyiZ30j2BX9EpuHg4fVaIeV48X0sTwTfKCXtt4J3CvJHM2+2974ehV03o+CqWe/lvZsoaic
	rGMkmzfBNGZ64c2WmmbWkJl7g4L8VFHL3vVf2J+xgl7sAmiHVxhJpUm4t9oSROEMgOBSJKtaa88yp
	16FBNl2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcByp-0007wM-CB; Fri, 22 May 2020 18:01:11 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcByn-0007vp-9o
 for linux-riscv@lists.infradead.org; Fri, 22 May 2020 18:01:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id j21so5312893pgb.7
 for <linux-riscv@lists.infradead.org>; Fri, 22 May 2020 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=rD8FJvrr0fC2ieKuRxFHZchacDqiMocM1Gb2Kxm//Vs=;
 b=dDt/3eITjzRN4TUYt+d7Zp8lrPurA2/TZD2ebIN5BAPbwEdBaQtDJyPNYul2loH6OG
 sH4zthUeuoWnFm1wXBDERLHVx5+LxPNrqrC+U+C1u5sg4nn17+dtK/VO/BcZ0v35HMB9
 LiDm/+lgyHC2CaRVrOUNeftcOPs/yZbGiK8fnnv6bjju/HyKCcVpSQcm8tEpqsTBpfla
 u904r5FiUoAhNt9ZIFfXXAY+nW1Vro+S58Hc69Weede8JkBU6FWd+5Opm+OIf5FeClJt
 EQ4viSX1ptlh9+aylekROeXpFArGMnJOFROr+EZOxnHUfHAbTTQ6rdD3bIGvyoOlxRHL
 TCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=rD8FJvrr0fC2ieKuRxFHZchacDqiMocM1Gb2Kxm//Vs=;
 b=R63Fue3186kgXOZmtGBwR1Vev9B8IuVMaGAqMuXO+Xx0zdEHLYYF7VOZDlT3ogWxx+
 oXqNtucO5hAhaEn5DnX2+G2iO6WA+Wu3pV2fs2RaaCTWawVJZG7CsOSDnvnqLwUYjZ75
 MH2qha/N0UrDBzlezzFvlJvJo1ukwQwyuYvdFuIueaQaWUVYyK7Q5xnZHvqAo8rS1rMA
 0zEZMw+QwNgQkJVdUBIzzXAjCnOPFqmOUBkWtQ5C9Vvfo4wXP+eyJxtJiCFgIk6ypVn5
 2iZptPRKreykSnak7I7LGwrnltjB6UcJzBKjcNxbRA7AZx6Lq2Jxu1nihL+3FiR48tHj
 yo6w==
X-Gm-Message-State: AOAM531y5bjNef8yo3MVVVhb5XRc9gpMYBayOOpoDMV0EODnw0RF7T2k
 bhFCcEz7tAkJJIGqGJTI+PTfwMYOWoO0yg==
X-Google-Smtp-Source: ABdhPJxjmVU9uuWtPRJsTb3MP4L7ia/njIBcR4S0BXftGNI5B0ZPqVM7lLCKJWfVpeRv0/YQHhOZWA==
X-Received: by 2002:a62:b503:: with SMTP id y3mr5073233pfe.3.1590170466372;
 Fri, 22 May 2020 11:01:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w12sm5950957pjb.11.2020.05.22.11.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 11:01:05 -0700 (PDT)
Date: Fri, 22 May 2020 11:01:05 -0700 (PDT)
X-Google-Original-Date: Fri, 22 May 2020 10:54:02 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.7-rc7
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-258df3d4-aa39-484e-9fde-7d93432f3205@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_110109_390529_68AD12ED 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce:

  Linux 5.7-rc6 (2020-05-17 16:48:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.7-rc7

for you to fetch changes up to 8356c379cfba8b1b90b0a2423f6afbbe2cdc5d91:

  RISC-V: gp_in_global needs register keyword (2020-05-21 13:28:26 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.7-rc7

This tag contains two fixes:

* Another !MMU build fix that was a straggler from last week.
* A fix to use the "register" keyword for the GP global register variable.

----------------------------------------------------------------
Kefeng Wang (1):
      riscv: Fix print_vm_layout build error if NOMMU

Palmer Dabbelt (1):
      RISC-V: gp_in_global needs register keyword

 arch/riscv/kernel/process.c | 2 +-
 arch/riscv/mm/init.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

