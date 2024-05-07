Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073B5C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kN6Ys99n9AQ+96HcrPHJA+teoh9y+9LAZofPX5Dqjsk=; b=Dzhp7HOpP6rIZp
	l87AEyBqpDFTLaE10TdMT0OZXHXhWWwQupYSCJJhnzOfASd4EVSx5aNE5zdY3J4Dx916PmdfCLkpk
	m07/6cI+0/FtKouc+vDZVkJuVg9wjuiew8M7XSXbn2bKM5cw+WsXdNM/oegKiYnP3u2ghlEhk6W4N
	JHIH/OlhFZrbPS7SeJXB9yvC1qvZH/IUUfZkhoaVSAKZWLNdlnbq86tJqX6Rxb1GGEH5DwQIKUowQ
	6YxBRWTt2mrNgL0FpGvAYKwqEZ3YmBpJe3JYgv2hsaGzEknGLB3l92bL6Q3aO34/l+qaoSXyasf1p
	Qf3nnaWIwYrvpioMl2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LTy-0000000BOI3-3ny6;
	Tue, 07 May 2024 14:07:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LTu-0000000BOED-2oX1
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:07:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ecddf96313so27324995ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715090862; x=1715695662; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkGvtX4jUwYRJLbDOy4RLI6M69O2g7lMQEi2Kh6V+XU=;
        b=DVN6bP2jsLQFhN+wC0lJigl6j13Nh5YsRQfwq2NNZt18BZLdgtoBk+KL9r/Sh3nZeg
         9G0r6zXdgY7X3MJX2l0kLkZDDCfW5JJR+IMyYMvaPotbSggjTi1/ssjkrU8NiGoBHQt0
         HUkprbpc9wcqFGnoBKS4QTq2upwF90WoEUFHrk4Hy5SUqALtOJNmarmo1N2TNfmap3Vd
         wCHlDp8Hbi510+EdFcvXGxA7wwY6vuGvv2oWbh/IU1Bpc7+Oogtwk0HLOKrL8BdsWVfQ
         5ewzsZy92rOlrHi5CdFTic1+zuBBFZZ9/Y3TDQcV6hdnjk7kah91ey5BrJMeR4EfpVuf
         jliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715090862; x=1715695662;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkGvtX4jUwYRJLbDOy4RLI6M69O2g7lMQEi2Kh6V+XU=;
        b=CBotdXz1LzyBjRnDy/ObficDN+z1smd/E9e2tnnN6EMTU1ZX7SAvVYooJ65XyzwyHu
         K/E7BMteRE+LxdrMehCeaWEuxOZd5EFLJGSO/9p+5NDIwUItyxXb+ubn20oY5vcWREmN
         Yvp2gI0QoLPRs0uKmgTxNtWkMKyc4E/izXI4GVAtKCACzNSoGhF/ZYYvg1XfoDL+Yxej
         Wvzf0+8UwoE1p14mr/ppLhtjm6wdh3/lpsSFcqXznhDDcMZfNU///1/ewEuj7JD1b51p
         V0PQOoECCj42gEmWse2jQDkql214V5Y8Aa77mu4gd2aqWPUA852UksBEpuoVglm08s2Y
         k6EA==
X-Forwarded-Encrypted: i=1; AJvYcCXLVjUMOhej8947rpxpgZjPc7SmsZr6xO6B5n+QLUTGwypRUak+bFC2/J4kykX1M8bjjAf6dVQP1nIf4MLw7LkkOWKyy3ynYPMnrhs5xS1A
X-Gm-Message-State: AOJu0YxctVb9cndgELsJCjzgXAZeOyuqdeMqa19oB0J+iLZjwvfbvb7b
	1JrToZq3q/UPzsYQe2lux89cjIUl6xYvqRXdRmmlhDzilUqaoicvgu9/xsNMfgv7+2l/86jTDeu
	x
X-Google-Smtp-Source: AGHT+IEZquwWePQ2daUPDLBtKy+IdyRf8hFqcaeC1wV3eDUCTRzWsQMIJUGo2E2KSkbpK4Iiw+UIPw==
X-Received: by 2002:a17:902:e947:b0:1e2:8841:8d67 with SMTP id b7-20020a170902e94700b001e288418d67mr18129070pll.32.1715090862451;
        Tue, 07 May 2024 07:07:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090301c600b001ecf8659bd7sm10061883plh.257.2024.05.07.07.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:07:42 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC 0/6] RISC-V IOMMU HPM and nested IOMMU support
Date: Tue,  7 May 2024 22:07:31 +0800
Message-Id: <cover.1715072254.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_070746_825638_C62F6EE5 
X-CRM114-Status: UNSURE (   9.43  )
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

This series includes RISC-V IOMMU hardware performance monitor and
nested IOMMU support. It also introduces operations for the g-stage
table, which are required for nested IOMMU.

This patch set is implemented on top of the RISC-V IOMMU v4 series [1],
and it will be submitted as an RFC until the RISC-V IOMMU has been
merged. Additionally, it will be updated as needed when a new version
of the RISC-V IOMMU series is posted.

[1] link: https://lists.infradead.org/pipermail/linux-riscv/2024-May/053708.html

Zong Li (6):
  iommu/riscv: Add RISC-V IOMMU PMU support
  iommu/riscv: Support HPM and interrupt handling
  iommu/riscv: support GSCID
  iommu/riscv: support nested iommu for getting iommu hardware
    information
  iommu/riscv: support nested iommu for creating domains owned by
    userspace
  iommu/riscv: support nested iommu for flushing cache

 drivers/iommu/riscv/Makefile     |   4 +-
 drivers/iommu/riscv/iommu-bits.h |  22 ++
 drivers/iommu/riscv/iommu-pmu.c  | 477 ++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      | 481 +++++++++++++++++++++++++++++--
 drivers/iommu/riscv/iommu.h      |   8 +
 include/uapi/linux/iommufd.h     |  39 +++
 6 files changed, 1002 insertions(+), 29 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-pmu.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
