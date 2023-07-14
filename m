Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B0EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/kLfAJbafSO9Qn7xuh+bRVMvouUloXHkr0beLYkTlnA=; b=PEglcHtJAAqHmC
	A70/WpZWSSps/X9RojV3lSSimOKSFT3F/69Kk7ghoOI6G71JsRAk9+P73WldXMazTLrUSwNwtKUhO
	l29+3TVJ92kkn6xpoZeGzABZjMXbLXptFCITqcNdXFxQDYTW9U0ZojHilcPuF9gpiZXP1JI3MgYNZ
	/oscm9JtPj5VHwmWPpynZQBGtOJsvBm/qYifWbgjN/qLi6aSF8jWxDsrwQ/yKbs7cKTRDqv5qBdEs
	t95oY73OVquJNRH1IJ6e9+9qIEf1RSFv4x16CAVGIVeVuLzTGskKzHrc4BWfNuIoLKRAxu6QWGKHu
	Izq4lAPQXR8d4UXo/9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5O-006haf-2v;
	Fri, 14 Jul 2023 16:56:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5K-006hT4-39
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:56:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8a44ee159so13165215ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353755; x=1689958555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u86Vccu0MjIpV1lk8gugdD4Hj3xwuyAB97KWj8HD83Y=;
        b=DcSFI3El+kQ7LUhr7I9CNLzPEPRrFlKiPN0ROzCgA+1cx5EXlSbbSIgcwQR813I1L+
         3uvoKmq2u01aQ1HX/F+kykKZKylNNs2J3TaYWmJfiC83cJEInBDz4UCDaT5YwZ28E5St
         H4SWKBVBsD2CZuKTjWB7EmNUDRNO0LJL6JSIOLpEXHgP2Y0TUROAagLq2gTnozEMMH92
         2lDqhD+T+AR9CiYZ0dScRh/n98YBFJOdLfHH+j2EkhhSk32EX6cf10DVILFLv9++ETt4
         wXVVrJ8jvwSLjrVIHuumet2G6Uj24MK9BtcXy0zdk2NFm15eYGcfgjfjwSJyXAwIkWWZ
         Nr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353755; x=1689958555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u86Vccu0MjIpV1lk8gugdD4Hj3xwuyAB97KWj8HD83Y=;
        b=cTdB90kpn+RIsckfBDHNMOBrIPRI6/HWxiVcbCEyenUXTbb3ceScA7qNpqVvjEh9Z0
         1WOAujiFAP2gGDXDtbbU4tOSnlI+j+GXNWJZNPqhH6CioEJQuHVratWpxh3ZBpWJjSaB
         0En9YWb+Njb3GJOVgkX/vg0neTaeZ2iK0i0cwFwdBNx7/xDUwymFIb4GpvtUOnyRS3SJ
         1Sx9LnRB32RDp3syJfMY7CkDcfpXysG13S5lh32/v+LV7Ce3u247LC5EcMP32MbIScpc
         J9xDdApt5Evpg6O7erlWsWuVDV2OJ/hldZ+mild/w8GjGSulfHaQVP/fQwivJRP0ebza
         +FrA==
X-Gm-Message-State: ABy/qLYR6booH/+y2YUtDF65u48QDr7oK+2WMK2lbjOZh5kb1UphZDtN
	P6TFAT43mCTrlIQAbr6SYxp4uhGwaM87csA+T7w=
X-Google-Smtp-Source: APBJJlGGxbl6qGLIF7f2rYJjwvRaITLsmSOC7pkB9qZSGRIv+YlRfSsJaker/tHyOogKYwVG0JmwNg==
X-Received: by 2002:a17:903:2288:b0:1b8:af85:e959 with SMTP id b8-20020a170903228800b001b8af85e959mr4250415plh.53.1689353755192;
        Fri, 14 Jul 2023 09:55:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:54 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v6 0/4] RISC-V: mm: Make SV48 the default address space
Date: Fri, 14 Jul 2023 09:54:48 -0700
Message-ID: <20230714165508.94561-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_095603_065034_BD7C05E2 
X-CRM114-Status: GOOD (  11.46  )
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Users can now select a
desired address space using a non-zero hint address to mmap. Previously,
requesting the default address space from mmap by passing zero as the hint
address would result in using the largest address space possible. Some
applications depend on empty bits in the virtual address space, like Go and
Java, so this patch provides more flexibility for application developers.

-Charlie

---
v6:
- Rebase onto the correct base

v5:
- Minor wording change in documentation
- Change some parenthesis in arch_get_mmap_ macros
- Added case for addr==0 in arch_get_mmap_ because without this, programs would
  crash if RLIMIT_STACK was modified before executing the program. This was
  tested using the libhugetlbfs tests. 

v4:
- Split testcases/document patch into test cases, in-code documentation, and
  formal documentation patches
- Modified the mmap_base macro to be more legible and better represent memory
  layout
- Fixed documentation to better reflect the implmentation
- Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
- Added additional test case for rlimit changes
---

Charlie Jenkins (4):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Add tests for RISC-V mm
  RISC-V: mm: Update pgtable comment documentation
  RISC-V: mm: Document mmap changes

 Documentation/riscv/vm-layout.rst             |  22 +++
 arch/riscv/include/asm/elf.h                  |   2 +-
 arch/riscv/include/asm/pgtable.h              |  20 ++-
 arch/riscv/include/asm/processor.h            |  46 +++++-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |   1 +
 tools/testing/selftests/riscv/mm/Makefile     |  21 +++
 .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
 8 files changed, 234 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
