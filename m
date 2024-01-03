Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BEC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTaRSEJxNPlx9ZxG6C8OEDiHzCatqC29MAOEh+J12f0=; b=Y5ZFow1lJUxzOB
	BA8+dnOY6KmKH2t84d/0Dluc/CNVBWLKERXpDmPKKsNBRzVW1EmIgh4tIoEQ7p+wUVQLs2PGLAlA2
	RicQD9AC8bIlATmUElNOjdVM0qaMMLkfT+Idz+LMyxNlJAs0Agy3vSXgWZg8jjlLQaWfucLwprPMn
	ueG3ukxvnlTA+2e7+ghzYeGSnZ69efZa1aA8sqnoh0HBjGNFN24ia7n0NETQxYcAPtMSwwp2L1qmd
	NgMvZHjqn2ZoxUuv4TfcR/k980tY077MTNpZtP1no34UhnhM5Tm66sBxLYyBrCXLXwXY4WIQGCWQq
	srsxg2/1KstQPcHq1M9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3fu-00BK1d-1F;
	Wed, 03 Jan 2024 16:00:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3fr-00BK0t-35
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kntl/nAgkMTrS0b6uVdfD+vMpj63I1IJoYMsR9G9+XQ=;
	b=OwxSQiMoooOrDIrvVRQJPl2wIn/u+QDI2Ne+n3VZS8jdZ5ZiIGkX+YGBTKTsxMtwuRRcsC
	AN3FbuahfcIdrc3soHvScFKY2F6Vv4EmThUgSI2oqyQp5a8KIY2QC+xnw50cKTK/qZ4wia
	x5D0w9OZMC5kXct4Lf1/2sAgwh1VODI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-lbqSuK9JN4aOB5QqnlakNQ-1; Wed, 03 Jan 2024 11:00:50 -0500
X-MC-Unique: lbqSuK9JN4aOB5QqnlakNQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28cb44ab1cbso2250218a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297647; x=1704902447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kntl/nAgkMTrS0b6uVdfD+vMpj63I1IJoYMsR9G9+XQ=;
        b=ra3s/kIHE4BcHkJp5wksyg7MMpJLGUfhcotYnfCxKMEC+j7q+YDMTrP1YZJBikcm1a
         sXLPtdeQU485JGhMeOhGPYDOVrZpbsAfMGLy7kTpS0UARd4eHg3Ts6hm2UzwX9Z/zPsk
         OhvWv1rAM7YQ24PnCqlsVEtoUvavXQUliA5AQzDY2/OjqmJmbvI39oNotmVJDsAdDRGV
         n5TsrOy4FACJLtPmk7k7rgnAH/yqfJORkBD4e8hrYOzsqMDd+gJz/TAEZuuRLBQtFUBm
         t/9XxSeWv5kiHcHkNdfP3NaF9iGhzFaQ9KLQgF/9G8pFXcHAcIPHGAnl6qyDY2NyjTYl
         Ce9A==
X-Gm-Message-State: AOJu0YzdQKzPlz14OE/mXPiUeQSYSji4eVaQf2tOGXI8enlgFkHTmGij
	CLUxav2f4XfITJY1m6VV19xxLoA/9tL5NH2NQGYkwQQMLPCXGxFnyUmHU4+2EAsxODXyCSV9JKH
	Ej/Zr54/J8/r1q1wYq4T8KouJz/LoVGY/rmJE
X-Received: by 2002:a17:90a:8904:b0:28a:cbce:71ab with SMTP id u4-20020a17090a890400b0028acbce71abmr6468989pjn.13.1704297647437;
        Wed, 03 Jan 2024 08:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt/3y+tufgltM/XFXS9WiJx4E8Mcef48BephLcAK7LUU4REFf4sxMOI/5885O5oAW116hzaw==
X-Received: by 2002:a17:90a:8904:b0:28a:cbce:71ab with SMTP id u4-20020a17090a890400b0028acbce71abmr6468965pjn.13.1704297647085;
        Wed, 03 Jan 2024 08:00:47 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:00:46 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greg Ungerer <gerg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 0/5] riscv: Introduce compat-mode helpers & improve arch_get_mmap_end()
Date: Wed,  3 Jan 2024 13:00:18 -0300
Message-ID: <20240103160024.70305-2-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080056_070080_7FA67951 
X-CRM114-Status: UNSURE (   9.25  )
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

I just saw the opportunity of optimizing the helper is_compat_task() by
introducing a compile-time test, and it made possible to remove some
#ifdef's without any loss of performance.

I also saw the possibility of removing the direct check of task flags from
general code, and concentrated it in asm/compat.h by creating a few more
helpers, which in the end helped optimize code.

arch_get_mmap_end() just got a simple improvement and some extra docs.

Changes since RFC:
- Fused with other patchset:  Improve arch_get_mmap_end() macro
- Renamed from "Introduce & Optimize compat-mode helpers"

Leonardo Bras (5):
  riscv: Improve arch_get_mmap_end() macro
  riscv: Replace direct thread flag check with is_compat_task()
  riscv: add compile-time test into is_compat_task()
  riscv: Introduce is_compat_thread() into compat.h
  riscv: Introduce set_compat_task() in asm/compat.h

 arch/riscv/include/asm/compat.h    | 19 +++++++++++++++++++
 arch/riscv/include/asm/elf.h       | 11 ++---------
 arch/riscv/include/asm/pgtable.h   |  8 +-------
 arch/riscv/include/asm/processor.h | 16 +++++++++++-----
 arch/riscv/kernel/ptrace.c         |  6 +++---
 5 files changed, 36 insertions(+), 24 deletions(-)


base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
