Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB324C25B5F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kN6Ys99n9AQ+96HcrPHJA+teoh9y+9LAZofPX5Dqjsk=; b=bb1MEfqIf6sCQa
	bN7r1j1t9ZFJEMvr/s+BluBJnKxnj0T8JZ5gey+TNEepKUSLL50PdcKOe1CuX/OeU6esL/EBIDWyH
	00sX1Oo/DWxJfVIhBgbeiaNgRnU8V9Rky8TNBPQrhTbgXL0pWMbeUh984SitDoAhm7UsGyQ+v4uVo
	idpWL6Dc+F7ybnb0VXQx8156fGWVC+50NNaltXl2FpJkadnt9kdY5yp4RLghPO+zC/guKLarzJKGB
	GSryDiKZFJ6eCweMt3TKDKGF6kJ3ysMAvPgk320C2b0NVCVRPXjKyI8TduUx0QTbx7h/3jmBrD5pc
	okf+5gBYeqJt4FL6w8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Llm-0000000BTxw-09PH;
	Tue, 07 May 2024 14:26:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lli-0000000BTwB-0OZf
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f43ee95078so2800656b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715091965; x=1715696765; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkGvtX4jUwYRJLbDOy4RLI6M69O2g7lMQEi2Kh6V+XU=;
        b=QpSrNUGfboxhydyWHDj00PHQ+2nOh+ic8KabKf/ZmVs+aZ0I6SXLXzabbTQg1s0oMV
         VoJDSTAIK57V3Mnb3iM/NS7Wf2sMGvAm41EC9vEhwol8ojTc/DV8LTdYUWKas4gOqTLQ
         YyRyPvEa9qr3KLsjiJLHa48DY3rUvnQrh5XNMBgWLdPRnWJb5y7OSGgg5tm7XJ1Wjs+l
         s9Ygp4TR/AJ/rSXM+wcUvmadZdHL1EDMUIkEDaqhCNd4irxNypQQyAk6KJT4UcehDiYW
         Stp9svxw5ss0n0NnNY+/z3eihIEAoxmP0/XWeyrVkDOZ9i3xcxKAJNSP4i8/s1SBSeJP
         cyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091965; x=1715696765;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkGvtX4jUwYRJLbDOy4RLI6M69O2g7lMQEi2Kh6V+XU=;
        b=lO9Rf5QDg6w0L+2d6OtPQL5SeLmvDGuRZHbfUlkiEb1c9kEhwECKrXAluX0jsf/8K5
         USkIzzrpredqnz76a9wmnDY/F2FYfx+keA8AzRXwdRg0KcMDWxHPUihQRnJOK6ufkX+V
         VvcBufvfc7XATnIYbTfAb+AEg+FL6UW4tERwMdifP/tJ0MLUvotPltYyQdg9S6kqTyeu
         vVDC2FlSDHqkqg1u75tyCH+VIAxkJY3nVOslXfmIlvQsrQSmbixkqrESX+DYHoZ0HOfN
         f1XeKEKE0Y0ZcAQk2tp5JpnFY0v5R3kKwMxxvEcce3uq39e3UHlyVBXZxUnBHVrWnbK3
         zEgw==
X-Forwarded-Encrypted: i=1; AJvYcCW/fEF60MKNtYCi9WPZEoOsH+mvFSZm1nUeX167uh4aGHDQP2iyUPA5guhIWYfFfFeF2mZ3O4bi46f3cXw5EHVQUTccFwM6gOEwD1Tv7vGI
X-Gm-Message-State: AOJu0YxJjN5KVIHzpmSCOIE4irgvWA1M5g7VXg7wgdl2hy0HAeY6hNTO
	Q/q7tVczAhOSt6SjEjWxaejlGbqmur/+YtFUS4f3C4FC5oKLvGwaixbKbAbFzw0=
X-Google-Smtp-Source: AGHT+IHfG907D2ZaVYbVRAYvbH+/piHHBre+FsyAhb2B6a1VTqojpliLbTmA9dXHy0VdebudgPk6cA==
X-Received: by 2002:a05:6a20:914c:b0:1af:a4d0:1614 with SMTP id x12-20020a056a20914c00b001afa4d01614mr7766162pzc.6.1715091965553;
        Tue, 07 May 2024 07:26:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i22-20020aa79096000000b006f44bcbe7e3sm7687554pfa.201.2024.05.07.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:26:05 -0700 (PDT)
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
Subject: [PATCH RFC RESEND 0/6] RISC-V IOMMU HPM and nested IOMMU support
Date: Tue,  7 May 2024 22:25:54 +0800
Message-Id: <20240507142600.23844-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072610_145811_34AB02E7 
X-CRM114-Status: UNSURE (   9.45  )
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
