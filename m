Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9AEEED617
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GbScQlBAJnNRX8YDJD85wqMw9n6/gARt9aeV1W6tyFE=; b=4KGs6nd5P2uy5j
	yPmm4cC9DI8k3b/mexGnGEvRE+02tG/zqbVJILjhyL0Dpi6oQEQn263ABxsQ3LZyk99ymVBQJyuAY
	UgLKab+Rqb7DkcpMSN7VcUEHmR+hoscVAg2/ziPcsb4zWMa780Yn/hHn/WrVyGuWWVQa4PfNJiCPo
	4gOXRMytRTS/ilNMpf49oFUcItwje38rG55ACeNU0CjGo5qzqppdVQLmE8i8AVdRfsAXgWZQL1UeI
	9TyZqJwX/NvJJ1w1yZjO0Dy0J5jPjOCKP3b1x8/KRJde/wmv7FM0LdBX6Q7nXs+GkWHf+1uVUSQNW
	CuNxEMHEKfIH7rwtmBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somdg-0000000Dh6b-2s7z;
	Thu, 12 Sep 2024 16:25:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somde-0000000Dh66-1kfR
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 16:25:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2068acc8a4fso11749375ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726158345; x=1726763145; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QILesIw2jO/jv8xws5YIjHNnjamw3bXH4diaHqXW30=;
        b=Bs97GaNGR2JDFcNkztQeIEfxKMwfMyE/i3c0xi8FUz59ASCGwEV1OmdTGbVPEeMz5z
         uenPAfrlqw4+zQbLurp7HB2vjbLbRiFmSR7wNDWjN9U3OKNOkLkGmPdO1nCWNGdLBK0B
         WquTv8+5gHP4qbPH80CURoH7OLAIcbdRI7Fc6i2rtdL5wPvB0SXGJxQNNvqB3nMIx11A
         PZCnhKmGe64d5JqhSoMd3CY4dfitcAC+t3MwYw5M9PjTvC5KmaIMduVMkelBUrydEOtT
         2hrXqlEAm0NvHC+4MvF5DxAd/Y6M1mHJHCbzbQIgysE+XBkgpbDwK5UuY3A+hHQTuF4n
         GfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726158345; x=1726763145;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QILesIw2jO/jv8xws5YIjHNnjamw3bXH4diaHqXW30=;
        b=VIEvGkK0JILSjxEVz+i6gDo8NPq49Wj/h4/B98qS0UeB5oAG8ste86StniqkkoiajU
         gal7UtRhD71PUXO58xcmpHDpRSXgDwlUqvDz4ffkZhfiUDZQNSQnt36JBGNFL/ioKR+Q
         Q3egibAx6IgLglirkHmn6KDcVbE1IQttst5rLxlt4UFoRvYKw2pkpjzfNwWyj9e3i3up
         2XIykoSlbJ8DSpEGW7CgN7mZgoLtNbvw0nAV2X2F6P+rcnKIN0tPN3S3ruJYpsu4hwmC
         XQGBBO22LwjSQAKHlUmsbQdbWogV0Uh6Is8WYuWYnFFBQVNfeNCT0lvz2pyu6o8QH/tE
         fSxA==
X-Gm-Message-State: AOJu0YxsHzGiPRGz0r6MvC9Fv4FemikjCfuMPDzhv/f5d/Y4YuqOFGA+
	mCaWe0D8W7lVJ8zOiiLkBllK+fBy7ePzY5c6g5oS5zF1QXjoWySCksixkVl05WVakNZPobJizPU
	7
X-Google-Smtp-Source: AGHT+IEEf6iT3JV53GFjFR8pXoISHJUM3Kt/EUI8UQxiP6hXee0eeD1F6ANvQcR2UhfoNqUnoEFChQ==
X-Received: by 2002:a17:902:e804:b0:205:88bf:bfe9 with SMTP id d9443c01a7336-2076e348076mr42857005ad.15.1726158344810;
        Thu, 12 Sep 2024 09:25:44 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b0096e9sm16037235ad.254.2024.09.12.09.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:25:44 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:25:44 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Sep 2024 09:25:42 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.11-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-61f22aea-eea4-4ed5-a803-92fa9df853cd@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_092546_741042_55675526 
X-CRM114-Status: UNSURE (   6.22  )
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

The following changes since commit 1ff95eb2bebda50c4c5406caaf201e0fcb24cc8f:

  riscv: Fix RISCV_ALTERNATIVE_EARLY (2024-09-03 07:57:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc8

for you to fetch changes up to 7c1e5b9690b0e14acead4ff98d8a6c40f2dff54b:

  riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF (2024-09-10 20:38:46 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.11-rc8

* Two fixes for smp_processor_id() calls in preemptible sections: one if
  the perf driver, and one in the fence.i prctl.

----------------------------------------------------------------
Alexandre Ghiti (1):
      drivers: perf: Fix smp_processor_id() use in preemptible code

Charlie Jenkins (1):
      riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF

 arch/riscv/mm/cacheflush.c   | 12 ++++++------
 drivers/perf/riscv_pmu_sbi.c |  7 ++++++-
 2 files changed, 12 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
