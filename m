Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95EC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 00:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AZ+2rt92nMbRIiSL7kRF51n89A3BPKVKSs/PuAorcTc=; b=aCNfLxR4ItZWOP
	oBf5lvm2Eea+6IaEDEUyAkn2kt/cvrTrG7yGgVk3/+eGGLk7za4WRLo8ydLKZGVRmueWtxW8shmcB
	7OP6aYDosPg+CMD33JVoklZLMKqf+X4i3AqKmOtlWrihAp6Ua8d14yoYhAxpVOGLwkUeVu3rhPTQy
	5KaVCNx5giMMBqWtzJhbkX+vHppwnW/B9W8TxDi3v/epgR5AMe3TCDO7sIBUF49pQV2Sr305VFKRJ
	H1gnUC8xrOQTQVXjIbAx9PqEQ7E7rpeNAMgzphnS1GGc+qI1x95WBcFzVqpElXWWMB6yH/o9bxlLN
	YKlfjh0pmIia88pkuUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6SY-004cS2-36;
	Fri, 14 Jul 2023 00:14:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6SU-004cOi-1b
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 00:14:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-668709767b1so982454b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689293690; x=1689898490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dKdw/fRpGMhPZx5yucAo2VmH/W0zeKNkjERAr97oOc=;
        b=DK487UlEpW2G5KFRjrV2Qfjy60Qn/3kFcFt39vvQNjsEy/EdjOhr/PmBjKDr5CA3ue
         oNYqCOjXL+TSPHDxeqvlWpse/XFj2PCH5gOs1+zKgSASKGaJaZdpuXaFcEcq8Rnz3g+y
         ts2DnoxMIPwZa5nAYgO2k12ohjijX+QJLCxmRGkoqm7IiF1YhtJDNVLQLoyjr/QWeryV
         sLBQARcgGMGbDvBPNh+ho4raziT+pePlPpswVWZYtwuJDXPVf3INeH9eVA7RV0TqGEU+
         p+gBY6VSbMqvdZfHFgkT4xA+5jHK7jye8x+ul57+5ybnNDFunisuInIaNp+Xb9wIXcyi
         quGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293690; x=1689898490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dKdw/fRpGMhPZx5yucAo2VmH/W0zeKNkjERAr97oOc=;
        b=B+1s7z9/67endXDUf9dEkNVdNHyzRuOI3iNo8sAthCbkA5/xqqas4rVeojqzMWHIM1
         3Ff18NXRQqey+tQ0+ffIHWREEU8tdX5VCxfpCWffL/Tff3fcVXMka+lhOkKgDtaGCVSy
         Fhq24qrleHuM3SRrkV6p5QBXRpH5z8Tg4zY1Kti4wS2cipnRk11tSHV3hiUFrYfAdiXa
         SgOkF8ARBG6YbBmINvfd8zueJ+1uOsJUcxMqvVP8sHsWIb+cXNA3i2uIAZuuO6r1R+xE
         iasna5x/yzt2koHUryfWe498UGYe1fccY9u7VlwqL30mfi56131trgCddywK06Cw8VJO
         7Hxg==
X-Gm-Message-State: ABy/qLbdkBqKn13DC78bFK1eet3lZERVWSnxzZDfWh0yGsLhY1eZHO6F
	wOx3e7JZf5gh7dw7id6sqavVxA==
X-Google-Smtp-Source: APBJJlGnN8YBws+YDNmDKckQ6/RCNHOhLy80mxzCgKrfd+QSmAYMBcKo9f0Tl8SPbx+/J+Wj39dEBQ==
X-Received: by 2002:a05:6a20:394f:b0:12f:952:11ee with SMTP id r15-20020a056a20394f00b0012f095211eemr2554686pzg.43.1689293690271;
        Thu, 13 Jul 2023 17:14:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm5938107pff.44.2023.07.13.17.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:14:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
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
Subject: [PATCH v5 0/4] RISC-V: mm: Make SV48 the default address space
Date: Thu, 13 Jul 2023 17:13:59 -0700
Message-ID: <20230714001430.75798-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_171454_530049_552E6EEA 
X-CRM114-Status: GOOD (  10.96  )
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
