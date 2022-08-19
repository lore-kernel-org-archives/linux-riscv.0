Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E8BC28B2B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xR1Kj1JK2g5n/Y0ekM7aA4mlZtba+7XZmhWwl2WgjY=; b=y2jd50SYEOKfDW
	5092Dv4qlLEuGD8iDDDSUnx4UaYTDdwpgTsJv/35UtJF1AUHNmwa8+xOiHyfeddDiJe19uGbMUbLk
	6D3Oqe3K9zhnGRvrLLyzdAtGZoPsP0cT8+TcXrRI8QGEmitc11B3L2QpcQFmwxqB37ifAGq5mScXr
	wL/2e7Nno+TlxSmDnqBcVlLBqW9Y+b/oee8AyuJ40IFc+YwOHFhREZMwAACwLLlFf+Wytk0aU4A/c
	jHYejCNrxU1/syMppppPlPOZAOU4ph5x/1qeioznmmFxmb7rr7lxJ+l3PYTOrKVvAJ2yV8TbjSRs6
	3WCqPwM+tX9PTRQdeNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4ra-00AN8X-Qs; Fri, 19 Aug 2022 16:28:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4rV-00AN5v-VV
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 16:28:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id g8so670250plq.11
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=abzc3IOKnyG7znaSmuM01q+gkHWZzs9HSxr2HJ0iv2I=;
        b=zN1oJKSHaYJnt399XMEgCNiDx5IFWzHDDfmVDnEfaIhQwq0JOFS1xyHjyodC6823TG
         Oe6ULewp3RIbm4ja2NINrl7wnhn1j+05WCs/jIVopJNL0KF+ptDkdQfSxq6mXPX6QYAq
         uRIJqTSvDVc6sQEGF1Gaqsipw/V5nofBpJX3JYtVQsr8M0GRSmGZpYMyEa5vFfjGya2N
         UXUaNFZ3O4uVl69RFUv1Dacp8LLGtaBrZltuST81we2rPgFYJPyD429sIeK+DK/h2yX+
         Bg1xUOVLEEf3KwyN7q4mExNlEN+Lk8upd2NszmG/eRZcZnktH5zOskNliY38WvpfTvkR
         2Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=abzc3IOKnyG7znaSmuM01q+gkHWZzs9HSxr2HJ0iv2I=;
        b=me9FyI8YV/KOoaliDo63StkG/40DIelS4vjt/cRc4MHQVdKcFs6pJYZKUXvJiPJIJy
         40N2RrZs5LNiObieByhaKVYwI/hfH5t7h+VQ5vX/8W/wqwwneSEes+P1BnSE452EO3MJ
         5GcFEt96tfS16dZ8zWPdoigInv7lIbrNGZZTS5+eRGGaljUG5Zt8LgP1rOmkJc/fKCdT
         nl8bnGSoADjusgTWZBdQIfmrbhZh3sa7SA1Y4iKMkmuPLGRH2tEncxB+/cGSJlw7JHmd
         DbiYqUpA1Z00xpAcEvwC7ESddQgCtYpRGHoHw9MbmX1SNRgA2Wq2Nb/gE078x/c59Ped
         G2Nw==
X-Gm-Message-State: ACgBeo1VxtzSyB6Xs1UFvAqeus0zj++Dq8A4cqS2qo380v0rZXwfJ83i
	w8GF/3QQxmHFTY6mUbyZSzr+DgD4X3j0aQ==
X-Google-Smtp-Source: AA6agR6TstUoTsCyFarnRhLu89OJkhoG4+9grz0keRlRZ7DUxoVPSTmy6IFj6kWsetXsrU6Uv83TEg==
X-Received: by 2002:a17:902:e805:b0:16f:4a25:b5bd with SMTP id u5-20020a170902e80500b0016f4a25b5bdmr7948210plg.85.1660926524787;
        Fri, 19 Aug 2022 09:28:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id mm24-20020a17090b359800b001f24c08c3fesm5515603pjb.1.2022.08.19.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 09:28:44 -0700 (PDT)
Date: Fri, 19 Aug 2022 09:28:44 -0700 (PDT)
X-Google-Original-Date: Fri, 19 Aug 2022 09:28:42 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.0-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-74337228-62c4-40ed-b7af-0d988ff94993@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_092846_254069_10522B6A 
X-CRM114-Status: UNSURE (   7.00  )
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

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc2

for you to fetch changes up to 96264230a6817bcd4a7ae0fc30c60bfb46499f68:

  perf: riscv legacy: fix kerneldoc comment warning (2022-08-18 14:19:26 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.0-rc2

* A fix to make the ISA extension static keys writable after init.  This
  manifests at least as a crash when loading modules (including KVM).
* A fixup for a build warning related to a poorly formed comment in our
  perf driver.

----------------------------------------------------------------
Andrew Jones (1):
      riscv: Ensure isa-ext static keys are writable

Conor Dooley (1):
      perf: riscv legacy: fix kerneldoc comment warning

 arch/riscv/kernel/cpufeature.c  | 2 +-
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
