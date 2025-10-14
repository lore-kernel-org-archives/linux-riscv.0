Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B268CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lWN51ncPysvPPJW64lCh8xir37ewKXxGSsrp0MBF0ds=; b=J5Jnf00RKP7yUf
	yq1Ck430aFzWj+3CLrU4X7GzzSWYwNMczIW+Bew+vovcXavSH66yBdcckwfKquowuGWjixj7nJ6H9
	B/odPkm0ycUjwewsUpAa8vpqiJbE9MqoBqcl8WvO2OhKuu70m/wBHEfzT7NElxOdeg3abGN/KPJxR
	wE+6Z+axIB/Fk9TQKQc123mpnGsdny9pQYkRPAUydpzj5VvdI7gPojmBV4zSaq07YVKyDzpscGgPL
	Cy7GMWeurQf7DxJY9XQrVqxI6lAcNO2KIF/ygX7cbXlNT4UtSI4DS0oKZmrtTxrWiUkwk9UiJDiHi
	gv2uFOeIa6pPnXXob41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8exv-0000000GSg3-3QFo;
	Tue, 14 Oct 2025 13:21:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8exs-0000000GSfT-2hQD
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:21:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-28a5b8b12a1so47850815ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760448080; x=1761052880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w63d3iN1NxniFWTpRTs5PQTHc3ix0F8ilLg1M56GOwQ=;
        b=InYtWXsaHrw8EoxgjOR014rV21Mzq4RHBBGsI5UmEJ2wnbEZtUIJMQbNui44h67pMP
         idKlzHVR/MEyAbQBkqPyAcbVRRr2IUS1HPwWLasLiJbqrQr3VQUS5Qo0tr/ncNeXEgnF
         l4nlQ8oBO8bvfRD2/giu5F5Y5WbRdMxvj2tt9GObsHboC5wBqkfA3X2/U8XBr8iph9uz
         hQV4NkHJzFC7pMjVP4ujoyTe6N1wUl6iFASZJb6Fm/2C0siPstXDhgQ6U0VzMKEP+bq0
         424DSDJBO4w09dcJGk/Uoo/OlvDe4o5vz5jnp1xU8X5EdXi3fqcKc0sxXDp5CO2D6AzG
         8wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448080; x=1761052880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w63d3iN1NxniFWTpRTs5PQTHc3ix0F8ilLg1M56GOwQ=;
        b=jvAlBSTxZEi9pb1GZIOUtukFGizY26ET9vLihBcEus/IyLTc7CidLbizsty7zeaC5r
         sut+PwOKzmkCSb5xqXTR8bPMlM8hKtdCc/alyz0YTidAnkUkS6eBeRwXMz/tM+QGx0xQ
         GVcXJPJ0xTqmwKGCkWZdh/fHJh44G1OL4RNz8iCItpkQD3Ww1O5+RlphsT3IFkBs0CnH
         SwmTpNSYqvYYmysW/FVWeblZiq3Gca785791jd9VbDlEo0SLC4NHZ6cERBOZTXiLyRoI
         lsqMvKqF7aAxBG4xxHX8t9PGx4fC7FUsnaTHnUY8U207fYaG1uRzbfy2v4pelSWnHH5s
         wQBg==
X-Forwarded-Encrypted: i=1; AJvYcCXiWCm7NOudV4ZJ1Rrnj9dLAPN1IPKqPHXe7UnmFGjOUoy2olE7i19FkL+BTaw2UcnNcSB1fqUk8UiMzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcgcr8VnsNv18DIkUWiZqxcG+tWTkqzQxlj9ox4xd6HXpwFdc2
	YtUOQ89k+ZGmXymieQRTBzsp/veDjJUEkrhN+ElP2qhRrQO2I8EkxmSIC8J3RvzyqHM=
X-Gm-Gg: ASbGncvDBRdJWYdLtSvWXs328M3n7ClUKW5aFPsed5XHpRY48BMadFvv/7BEaYeS2wj
	OuxG4lWnu+Pwnb9ukINTvGDOvH1OGv01z3sGimuAKOpXO7J1/Cc5ji6zZgABXMMTEshrrdMMhgI
	Up/GcrtKov/LBsmEw1K5LG6UqiOQHotM+SDmbfAMEQA8bk9HJglW8z6brpWdaes9KrnIQQHn34P
	xr45odFFZw78zSPU9vAAggkzK3psxqNTvusKqaXeKcSC2xwCsg2UvqxU//N1oePpyt89WoLqGY9
	fxJ3ScxOKhAEUIMJzaQ/N0vLWU3R2dd4eX89QqNJc/2aBuq4jwaGW3E7humtsAL5laDnvIgStzi
	Qq2kFrLBQuwXgQGT3fH5Zofo0mOI6El5S5aMP0ef0Gn1JLcQwYqLIZ1P0V1jukhEViJIiZe7B
X-Google-Smtp-Source: AGHT+IF7s3fLFOl9rdJb0wt/YGaCzHyGdkNVTxLw2zcP1cyGfw127m9LZ83PtoZ1nbrWcMLKHR37aA==
X-Received: by 2002:a17:902:f64d:b0:26c:e270:6dad with SMTP id d9443c01a7336-2902741e4a0mr268523345ad.60.1760448079692;
        Tue, 14 Oct 2025 06:21:19 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6f08sm164387635ad.26.2025.10.14.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:21:19 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/1] Common csr_read_num() and csr_write_num() for RISC-V
Date: Tue, 14 Oct 2025 18:51:05 +0530
Message-ID: <20251014132106.181155-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_062120_686920_EE116CDC 
X-CRM114-Status: UNSURE (   9.86  )
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

Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
access CSR based on CSR number discovered from somewhere. Add common
RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
for such drivers.

These patches can be found in the riscv_csr_read_num_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebase on Linux-6.18-rc1
 - Added reviewed-by tags

Changes since v1:
 - Make "out_err" mandatory for csr_read_num() and csr_write_num()
   in PATCH2 as suggested by Sunil and Drew. This also helps further
   simplify csr_read_num() and csr_write_num().

Anup Patel (1):
  RISC-V: Add common csr_read_num() and csr_write_num() functions

 arch/riscv/include/asm/csr.h |   3 +
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  17 ++--
 drivers/perf/riscv_pmu.c     |  54 ++----------
 5 files changed, 184 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
