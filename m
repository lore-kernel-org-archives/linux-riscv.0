Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C680C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qDEz50DHP1YV58D/lBoX/77Lu22qNTUkO+SpXvM07AY=; b=fTvY2eZcbZ/CcC
	EqmVNw+HY9+ujAAiydGS+i3iRHNtPe/6Q2Q6ii3hhzJww/LIB/B2xAATP4Aq8VvU/L4g0cxhWLrVZ
	sadFEijSyn9d3MZWLyFGc4wPBwA5jzCQjBs4Q+h5NFkq5S1q23t6rG3Vzs5z76yg+/fMDrSyrmKC8
	EzcQN0C1AbKYyN3VEr0iX29Jt/nH2Ru1+6b8edg/xiJNBg0ntgx0qbtJgTj/h9RJshdDRQmIKV4Rp
	HmdYPyt67hW9MccB7HhML5jzRxWTYuuSsrVDZQhCpyTP9tBxfQl6qT+o4wF9AT87oZfps79dVX2f4
	5vNMxLTtAUHuenHL0zqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cxt-007zxC-Cp; Fri, 17 Jun 2022 14:28:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cxq-007zw6-3B
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 14:28:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so7318045pjb.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:cc:from:to:message-id;
        bh=Tcqogqr7saSROb6VJsAgZfCbPF8TWLw9G8OGokI3FTg=;
        b=E+4Jz3GGbPeUBX1+iOzQKk5b9D+kTxwstYr74i+tyWOs4q5olcWYlxQTD+bNKoXBRI
         amXrbYO2XleVeyrFW123CtKxnGQUGn+D/QCzkZoVqoY4xii4i+D4YVF5ATiRYFn+nyMn
         NJoeCFYUYL8z8BvPzsuLQSjRJUIRV9cQXjWkaFzla0uTQElu8y3uFgAoMKQQUsw7893K
         bs2qE8ZJNQXl/dsRMdt3a8wIGoVYTPa+fLuQ0h/m093JHgjB1YLwEkndjCPqM6f3LYEK
         IYPth2ugj1/I1fSbYZr7sZrtxN/RIaZiQx/1t3HQ56tKleur6cM/7pNP6SJ4/cUZC6y4
         vjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:cc:from:to:message-id;
        bh=Tcqogqr7saSROb6VJsAgZfCbPF8TWLw9G8OGokI3FTg=;
        b=A1x7NkoLtrDOdSQI8SkJghwpJWfORH+82FpERxrcYpUYLpbdcbCjKs7qctOPmB7DIW
         nKsfm9F9dzYeAhhRbU4FQL8Y4LQQj5snj8kP3rTrC0x3hwnRi7537+K3NK/zNMzHmE3X
         rOzO/z+f2suTVif3HLuFQ22QuwZq+m3u5S5UdbQYkLSg57GOJDGlyT0EFaTca75vvA7I
         PMAXyTs+EDUEvRA40fjOWnGxcxtKQ3NrvUTL4ap4ubW4i/ZQ+xT/ZqYiaNUWTOsUhtBX
         +E7a45rCK2Yc791QoZcLe4QCuNq+QRzZy1K7bv0AY91pZ9mMpvSOf4RV5SiRwED2guZU
         mn4w==
X-Gm-Message-State: AJIora8y7Tl/hMprUL3zyrXVZIGx1m1hwqiA3NTHkTPCDvjCFZw8yLP8
	2vbLYBO72geByTDgPTLAx8EiolAK7M5ltw==
X-Google-Smtp-Source: AGRyM1sQZnAyDmRJkonXd8bV0/gW4lFtzB5JN6E3PmH6DvPKId+IFv/dku2ioZg+/nr1ZDvNRhr14g==
X-Received: by 2002:a17:903:32c4:b0:163:e765:5071 with SMTP id i4-20020a17090332c400b00163e7655071mr9695779plr.153.1655476122875;
        Fri, 17 Jun 2022 07:28:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id ik4-20020a170902ab0400b001637704269fsm3606589plb.223.2022.06.17.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:28:41 -0700 (PDT)
Date: Fri, 17 Jun 2022 07:28:41 -0700 (PDT)
X-Google-Original-Date: Fri, 17 Jun 2022 07:28:39 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.19-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-67f78725-bcd9-4c12-920d-2377a998b9f0@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_072846_373522_B4A0C645 
X-CRM114-Status: UNSURE (   9.48  )
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

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc3

for you to fetch changes up to c836d9d17a7d102ded1ba4dbd4ee0bc42ba26211:

  RISC-V: Some Svpbmt fixes (2022-06-16 15:48:39 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.19-rc3

* A fix for the PolarFire SOC's device tree.
* A handful of fixes for the recently added Svpmbt support.
* An improvement to the Kconfig text for Svpbmt.

----------------------------------------------------------------
This is my first time taking an actual pull request, so sorry if I screwed
something up.  It's just a single patch and I checked over things last night,
though now that I look at this again I see that pretty much everyone is using
the git URLs instead of the SSH URLs.  Happy to re-spin this for next week if
that's a problem, but it looks like I've done that a handful of times before.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: re-add pdma to mpfs device tree

Heiko Stuebner (3):
      riscv: fix dependency for t-head errata
      riscv: drop cpufeature_apply_feature tracking variable
      riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol

Palmer Dabbelt (2):
      Merge tag 'dt-fixes-for-palmer-5.19-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/conor/linux into fixes
      RISC-V: Some Svpbmt fixes

 arch/riscv/Kconfig                      | 9 +++++++--
 arch/riscv/Kconfig.erratas              | 1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 9 +++++++++
 arch/riscv/kernel/cpufeature.c          | 5 +----
 4 files changed, 18 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
