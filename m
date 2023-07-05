Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97EEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZSOx2hF8XWgw7UMxGgHoXXvVzLRX4YHbWwch4QD5XI=; b=q0JOLrDduxTECF
	4fAv79iG+lnAzXEY2xl2Uth8UDL2NSltxDxgNTiz4Pelk/Fc1pC47uAbUF5AUVh8FQVMG+kJzhEc7
	67ihF5y0ssEpaaZ1BRLzMySm8jek9AJqFzn+h0bD1P6vYmOY4xCdEyJLNjrdjqtFcXe4Ij85ICdSw
	+6FzjLgTQQ/Yh/tXCpUxC7IVzxzHJ7SPc44Wf5tgyKrPTX5U28IVStyC6f+s/YeoqHHsPScXtzRSV
	qYkwgc5O032uwg7Nkqbjz5Hdg1l/0N80EGdPZLSJl3ySC2VF73vdmrYn/MCsFbUs8Az9aGsEmCtgV
	7RT1ONhBr4hKpDJI89rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7k7-00GpWR-2J;
	Wed, 05 Jul 2023 19:00:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7k3-00GpUc-12
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 19:00:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26307d808a4so12301a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688583641; x=1691175641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aefKDjie+XpptlnykMS4cjK4bXnjT0kz0bBmi0t14U=;
        b=bBeWNn4QoiUU5WmJ9K/HMlqyJhTj+wXsBHEvd0uGz2MQnsimK3tohAPlu74IT/69YY
         U7WseCSzhKFXSkVwIpubzNpMLDTJN4v79Fx5s3gsOq1P7dcO2RrtNAb6T867Gd4UoNny
         04u0Wz0miji0CvK5q3GwOmrS0V9Fbpna8xqVWSEWEw+BxRGFqickCZHCgI0ncSPfQfxt
         BgwAWyARnAYVtjU2Hd4O1PADwr78MAV8z4dcbJ6AMs8u0C9xp7QSy3/zWRLuqoXixr9b
         sz/jlM52lXgAREg7lI63e4ZMxx2LteDx9lHj9eJtFEiBiD2E/+cX+vM3rOdsOKXsIIrh
         cb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583641; x=1691175641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aefKDjie+XpptlnykMS4cjK4bXnjT0kz0bBmi0t14U=;
        b=ccU/NTiKhIpNS5Wm4XdniXDyOWz/gbfKTVJno4N/lfFY5Nmml99i8E7VTH0Zkw7bPT
         2sYBn/Rp2imuFjyVu9N0qfQOL8xcJEL2otkY62nFnwFUb6p2ly/iTivSHXo6EjG7oFnR
         cMYrBA63i0+2xw9j42N6B1pIO8JSUi7nP3le2kBlEFL4wiMIaD+CWSxnphV/L+hqfjPo
         qUQLZ/Qj9xkF7F6Zzei+Tnp62TGQc0tKdnQ7Nqf4Obhmb8n2MU/IKjFj1GC717ydO80i
         q3NvJP+zsd4mkwrRLa5mJgKmJZN0Q+hZgsd23M6szJk1GW/XHcRf63hoqWHB0lo7Udwd
         mMOQ==
X-Gm-Message-State: ABy/qLZSKH9cPCVj3FZTSQhSCJ9QRzxbcbrR1tLoziLkwCuMaj3oMGWv
	lMfKYg0F2YJ4hCph55gRBEJhIc4/lHd9zEgdCfA=
X-Google-Smtp-Source: APBJJlGxMtaefB5OYIH9A9tG4cey2jb2WUJlQHyarT2zV+fGHrgpUf+CVv6hEz+oGku5pKoWhIpl7w==
X-Received: by 2002:a17:90a:4985:b0:261:1141:b716 with SMTP id d5-20020a17090a498500b002611141b716mr16407697pjh.33.1688583641465;
        Wed, 05 Jul 2023 12:00:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902aa8700b001b0358848b0sm19323359plr.161.2023.07.05.12.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:00:41 -0700 (PDT)
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
	jrtc27@jrtc27.com
Subject: [RESEND PATCH v3 0/2] RISC-V: mm: Make SV48 the default address space
Date: Wed,  5 Jul 2023 11:59:40 -0700
Message-ID: <20230705190002.384799-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_120043_574970_3A0580B8 
X-CRM114-Status: UNSURE (   9.24  )
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Also enable users to select
desired address space using a non-zero hint address to mmap. Previous
kernel changes caused Java and other applications to be broken on sv57
which this patch fixes.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

Charlie Jenkins (2):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Update documentation and include test

 Documentation/riscv/vm-layout.rst             | 22 +++++++++
 arch/riscv/include/asm/elf.h                  |  2 +-
 arch/riscv/include/asm/pgtable.h              | 21 ++++++--
 arch/riscv/include/asm/processor.h            | 34 ++++++++++---
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |  1 +
 tools/testing/selftests/riscv/mm/Makefile     | 21 ++++++++
 .../selftests/riscv/mm/testcases/mmap.c       | 49 +++++++++++++++++++
 8 files changed, 139 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
