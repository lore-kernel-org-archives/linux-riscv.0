Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FEAC4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 06:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC8C6023F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 06:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC8C6023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uf21FDz/PYuzAO2p8E5zDG334C7hV/Hh2HEDA0N5bBs=; b=BxOBLGdWRPLhM+
	GV30IlNxbqr8mrsVEuzF62/zReCrSUDoF1loY4AvBjloEL9EKr+gNFW13TIwKOPnndfVaeRDOf+ST
	boC0v3HG2AFvzwnGabUySR53k6BnUokSnR7d0UWu1pKDW0H6NE1kcLhh41YNb/i3rL3770oE6oh2g
	u0I3pbT/oSOS7cpjmGF/dVlcRBazNPim5WadxmJ6MrFi7H414TUNJj9uyb1gfQc9HedyDKxGXmrGN
	O04aJ19mKL0nBLS5gtvyCDmWEfVzoStpBhEvph2jbRLDa05FbIRPTmzW6F/77MuK0LRHUGYzt3g7X
	fCnq10ufrw3D65tQ0Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEnWY-00Dx9C-7r; Sat, 14 Aug 2021 06:52:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEnWU-00Dx8W-GR
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 06:52:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id w14so18550690pjh.5
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=xiWIs3sY5kKi+XKFiiCom1CbSNm2N5jCulCs6CDrg0A=;
 b=bOyHjR2lyUuP1uh1PyterGYVjgPGptdS83UJH1mxRtsMxOnoqPcYIUcwulbc4mlIg3
 8Os2bBWBiPP/z5IPcDKr5kxdN23BVuADWK8TJhK9VRlXWPC4f3iuauC3jGgy27XjDH/Q
 L+3t/TmrtreqUVn0CrHTBTKJurPQHSfPzlz/WBQcGDs4sriMG5R2op6n/tDVZqhhSUn4
 yxGC6Zop9PlCwFsKDmuoRNmOTLGdMEg3yf0E8PNi42IKZZnM/qbOQyyrqRc6ug2122vd
 OMHbar9fhnkVfWiocqqvVyesGv1mEyMHACh5dOkR5d48vMnTmKbdTa7e2m3EECy0/Mh1
 TxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=xiWIs3sY5kKi+XKFiiCom1CbSNm2N5jCulCs6CDrg0A=;
 b=QU3LjKSbmPnx9In83GDMa7QF+D77BJgTgjkQnHTd2hxDFMK0wObK4P0Phq0nbohe7I
 0AZ7IDsX4u92ChIJJBbiLNSE+zYDcOr1QmTMWCqXUmer1MEcR9Ergv7C/rF9zijeN4cf
 SuDsV4dc9t3pBisysE/M26pnjK9BpbDs+j9G93Rx2ZZA/7bXRic+MM/r0+f7aPCSUWUH
 V7e+BG78KbUIFg4Y89ZYPxpU+UPr5GfKXSzkvhkeGczfwki4J1sa9nMH7ukOzMMxBKIz
 AX1uOIAOQJyvwPA/ZHFWlhRdnYfUnk4r0wPax3G5YZdG/il/GC9/ih7oXzkDHtQTWV8G
 WBgw==
X-Gm-Message-State: AOAM530xVSoDq1NkmbRWSWYaiik9k68KFdGRSnOPEBJlfANf9QBEepD7
 xWQjjkrJwMPQbRKNQ9m44bzGapuJAL5l6w==
X-Google-Smtp-Source: ABdhPJzv/CRvgnLeOZF/zbHg/X+9VxSH7LvMm0YJpE8vhIg6NJd5Ow9N7QyuHWh2jLvRZ87vG+QdUg==
X-Received: by 2002:a17:902:9b89:b0:12d:7f02:f6a5 with SMTP id
 y9-20020a1709029b8900b0012d7f02f6a5mr4874020plp.39.1628923920450; 
 Fri, 13 Aug 2021 23:52:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k22sm713215pff.154.2021.08.13.23.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 23:51:59 -0700 (PDT)
Date: Fri, 13 Aug 2021 23:51:59 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Aug 2021 23:51:54 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.14-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-eb8a31c1-f921-487c-8e96-8d4c32f8ed16@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_235202_662534_015AD1AB 
X-CRM114-Status: UNSURE (   9.19  )
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

The following changes since commit 867432bec1c6e7df21a361d7f12022a8c5f54022:

  Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED" (2021-08-06 22:41:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc6

for you to fetch changes up to fdf3a7a1e0a67a52f631b055975c6ac7e0e49a65:

  riscv: Fix comment regarding kernel mapping overlapping with IS_ERR_VALUE (2021-08-12 07:16:58 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.14-rc6

* A fix to avoid passing -mno-relax to compilers that don't support it.
* A comment fix.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix comment regarding kernel mapping overlapping with IS_ERR_VALUE

Changbin Du (1):
      riscv: kexec: do not add '-mno-relax' flag if compiler doesn't support it

 arch/riscv/kernel/Makefile | 2 +-
 arch/riscv/mm/init.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
