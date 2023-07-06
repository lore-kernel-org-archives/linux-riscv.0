Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B75C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aAkQVvXNg05DaNeiB1SY+4x1a71gr2FOgA3xHjBzjU0=; b=enVWCR7mR0leQM
	hGlqbs+BaK+x3UoJIGlEMMUHSfCoOs5Y2rqQadUoD84gklMg4YT2Q71ICOamkt66fgM6DYoyeaIKl
	89v9AP9JGKBwqFqNFDsxcoMZXIijPMBYY3RQZnptpdmWfRHBKG0H9rRI87ghmXtV+5sgmyvO4NJEd
	2L9i8LWA2mSga27NQKdM6k2IBFjq6wPUi+znwVB/gnMCxOcsX/jUeLzK7cqgDXQMenPo1EkB3ewnu
	Y3ZxuCrVDHQjtsCScEVxixdPnoGQqwVMd9yOdSRoB3gz6wLaCDZsG+Nj+WfZ6w5kBPoup0a/fVqFl
	VxjIOZgNvNqHF/1ZmBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjZ-000FcG-1z;
	Thu, 06 Jul 2023 03:32:45 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjW-000FbG-2S
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 03:32:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-668711086f4so157452b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 20:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614361; x=1691206361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5PFYuSIj52/sZJ3+8LDJADq0fIHUY/OVaPigx63RO0=;
        b=cBEsKWkSoLlGv8wtC+WCyTN7xQd0yQaZDPTaTTvI1e1SPr+CZVNWRTVP/kACtk4gcE
         8cU76UUbkrMR3f4q/Dv/Q7F8XBR6rutb4+NYT26XtT6p1rXsVLEn57gY2i86aIj77AkV
         NOpp1bS3nOHcPqi4utmvGbQw8IMZjHtJ1aXq+Z0CKKluXT7HHuhxdXvOMii6DcEa/x5K
         b1B+5oxWuWRXZxGFPA9GjbuvJUBGNEX1Lijhsa17/j0DR2hU6bwovqhyetS/ZMtg8wMJ
         ie2uKyIdQEhUDlOMLjMn/NsmYaDLVNYJwDY2lRhnbQHbIwsr49m48mXsFW/wdX1QqToG
         EAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614361; x=1691206361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5PFYuSIj52/sZJ3+8LDJADq0fIHUY/OVaPigx63RO0=;
        b=VYz/88hw3IQrK7wISPkA2ljdILreefZbDwfN4iHWRjx3mL2p9tJUCfnIbRmkxQ4FF8
         BAD29+wNeZNo8WXVZHVZ6/YCs9M5hkxw+vXXaCLGjgNplMgBK231P7nC+J9a8Rkh6n8V
         2vyOdP4z/+bsr3MQQUt+3yjtjt0+zy4EK9zlFDxfRJneDjMGp++LglFEN+CoxT2G2oIC
         m9fLlLT1Om/oZjKIUH+jPLiGr2aj8nvyEvKNQE0UKKK4nX200QsfmvhFgpIL6z8CvcdC
         gfnGZiLpwufXv6SNiOkRrFl2uE8Z4yL1IP1JTGTN9iaG0gkmprsv0jhw1WBHnRhSqrcc
         JprA==
X-Gm-Message-State: ABy/qLYNZviHfwcqjfgtlPAGJ8Cnzj3UyVzaAgb6AXsHyKI3py6ro9xh
	HDPIGpWAP9XyweEg5trScnbOOQ==
X-Google-Smtp-Source: APBJJlHBbv/XBNLZLg1kBXFLrwbRPGj/YLdy+ZtS9HAhqs+IxMadbHcjITFaQQ87f5sKJHxbPGeiow==
X-Received: by 2002:a05:6a00:ad6:b0:67a:72d5:3365 with SMTP id c22-20020a056a000ad600b0067a72d53365mr6814701pfl.6.1688614361341;
        Wed, 05 Jul 2023 20:32:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/3] RISC-V: Support querying vendor extensions
Date: Wed, 05 Jul 2023 20:30:16 -0700
Message-Id: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEk1pmQC/x3MSwqAIBRG4a3EHSf4gIK2EhGWv3knFhoRSHvPG
 p7BdwplJEamoSmUcHHmPdZQbUNrsHGDYFebtNRGdroXZ4B184Xo9jTjPhE/koV0RktrlPLrQlU
 fCZ7v/zxOz/MCZKB7+2kAAAA=
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com, evan@rivosinc.com, 
 heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_203243_019428_DCE18B01 
X-CRM114-Status: UNSURE (   9.39  )
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

Introduce extensible method of querying vendor extensions. Keys above
1UL<<63 passed into the riscv_hwprobe syscall are reserved for vendor
extensions. The appropriate vendor is resolved using the discovered
mvendorid. Vendor specific code is then entered which determines how to
respond to the input hwprobe key.

The T-Head 0.7.1 vector extension is used to complete this vendor
extension framework. If vector support is compiled in and the cpu is
T-Head c906, determined with (marchid == 0 && mimpid == 0), then the
value of the hwprobe pair is set to 1 (defined as
THEAD_ISA_EXT0_V0_7_1).

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (3):
      RISC-V: Framework for vendor extensions
      RISC-V: Add T-Head 0.7.1 vector extension to hwprobe
      RISC-V: Include documentation for hwprobe vendor extensions

 Documentation/riscv/hwprobe.rst                 | 17 +++++++
 arch/riscv/Kbuild                               |  1 +
 arch/riscv/Kconfig                              |  1 +
 arch/riscv/Kconfig.vendor                       | 14 ++++++
 arch/riscv/include/asm/extensions.h             | 16 +++++++
 arch/riscv/include/asm/hwprobe.h                |  1 +
 arch/riscv/kernel/sys_riscv.c                   | 60 +++++++++++++++++++++++--
 arch/riscv/vendor_extensions/Makefile           |  5 +++
 arch/riscv/vendor_extensions/thead/Makefile     |  8 ++++
 arch/riscv/vendor_extensions/thead/extensions.c | 24 ++++++++++
 10 files changed, 144 insertions(+), 3 deletions(-)
---
base-commit: 53cdf865f90ba922a854c65ed05b519f9d728424
change-id: 20230627-thead_vendor_extensions-0d320a311fcb
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
