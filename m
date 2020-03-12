Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD23C2BB1D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 02:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3ED320735
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 02:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/3Ry3F5";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="c1mMG2I+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3ED320735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xjmkUAJV0P0YoZQeq03wBLs4ipixrmI828N0sC8YCYY=; b=c/3Ry3F58xecsY
	F09z5S8emYNUv7tQRTxk/qzCt3/Ypv14v3+SOllXXbHKOw+Z3DKcL8ld1MbhpALVuJmHGHmIJ9OqA
	lTFH3Pa0uw+x8G9Yb7xUIYKLK/ZD3E950LMUpWUhq/2fSrsHiB0aAKAFPsAu9UWg0tymFCEKQomZ4
	YC+mdgvfDIyxMAnvMHFcEvK8LIuRA//VSPaNReyRFBFz9KiKRhaJtoNmVIrkQN0OpFDtsTfInvdXL
	jDrWlJW5Xlxys3BK+1+VAZd/eHx+qDPjEeIJOlBvQYnIaezsgVTqnW7EAom/RGJojr4IEdf5cDECq
	EFCnFbjwAc6SKR0+Y8MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCE3c-0004KA-Go; Thu, 12 Mar 2020 02:58:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCE3X-0004JZ-9F
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 02:58:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id 23so2493988pfj.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2020 19:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xjmkUAJV0P0YoZQeq03wBLs4ipixrmI828N0sC8YCYY=;
 b=c1mMG2I+a4RImGoQCDTKsYcKG/bwp8PYVHJrAvIK8DRDiZ+lwBG/C2Ky1Q+cSPObRD
 JGBKmFCmIbAtoEGyFtpRKO8lopfd3fkGBa6Yl75i5sF6D3xIXsNQmZoHGlvS22w+9xEP
 2dLJnVqhouZRMMou/QxjzCe7a61hIdZggh9fBni49Vf2WYJ50VvvMkUxZJzg+x4DSna2
 /3wrt775hBm1Oyw/WZQPQUo74Eyw/evPVg6+2W+H/6Z7Fl3hQVjH491gbkv/ZRiy2MxZ
 5DlyzJU83/zAkozQJBSMeEZC7MrluYWKJ+rrbTxnQnGOWzXm1XD1Nnx9QMYNxjjJGmzS
 YE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xjmkUAJV0P0YoZQeq03wBLs4ipixrmI828N0sC8YCYY=;
 b=idZlbv+pJiDz7x2CHYw9iNWCGg/XogrN6NMjzSKMPMFzRuEPkpPOLbnvytuvJaXGz2
 tUrYbX3f6RD3zL3x3f1l5HDl5UC2toxrqPzeJMm4pGY09VjTfICIwd1KwckCOu8Dnyoh
 qqBpK2nDKMhw7isGaEhTLH8EVCJqWSYDrtGAAzP2O+IAYZDmapjeoSDk3XNJ588LUGCc
 MwTENg9wlhKoEuYfCob8v38Uvg7QQ0c5/kdV1kjgVVFguK4LPtMqNkRTTzwTSj8nOr5F
 vnPuYvmlKLxL7LsZsuKcNyUZuEiuPWuHRRcuPGi+7gvPxLw9Z5Ei5bHN19GWPkBjaIe+
 tyVQ==
X-Gm-Message-State: ANhLgQ3bposRI+xLe4q0OYNFXhk/PmqDHom0xtqdobU9xNHMa37WAXgR
 QUE9RZFxTdabf2bEc26+5ezVhA==
X-Google-Smtp-Source: ADFU+vsxz2V6zzv4+5/CZTt5AhT5BOQ0j3WoZWiA9Z7bC4BtMeX4jcXf5VBJ3paF3L0GYn0/pQHx1A==
X-Received: by 2002:a63:c54b:: with SMTP id g11mr5665118pgd.164.1583981921025; 
 Wed, 11 Mar 2020 19:58:41 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i11sm1910322pfd.202.2020.03.11.19.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 19:58:40 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] RISC-V page table dumper
Date: Thu, 12 Mar 2020 10:58:34 +0800
Message-Id: <20200312025836.68977-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_195843_327393_9FC5014D 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch supports dumping page tables, and it's implemented on top of
the generic page table dumper patch set.

Changed in v3:
 - Modify warning message.

Changed in v2:
 - Remove unnecessary #ifdef directive.

Zong Li (2):
  riscv: Add support to dump the kernel page tables
  riscv: Use macro definition instead of magic number

 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/kasan.h   |   2 +-
 arch/riscv/include/asm/pgtable.h |  10 +
 arch/riscv/include/asm/ptdump.h  |  11 ++
 arch/riscv/mm/Makefile           |   1 +
 arch/riscv/mm/ptdump.c           | 317 +++++++++++++++++++++++++++++++
 6 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/mm/ptdump.c

-- 
2.25.1


