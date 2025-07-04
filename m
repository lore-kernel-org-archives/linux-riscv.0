Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4599C8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zlYKeOikRt5IErI9D78u5RhmfXVTlwTjMrAXQ9/Og4M=; b=SzAe2glx++lw6J
	LQfcSQDlO8T5HEZ/l3W1aXfzc7NKoGGzHg9PMSEeHlqZ88TC6DKwnpx1QZmPUfDjKzI2eiJo6wWC3
	h4LNrwEu6YbxU4NKt7UCLnJHeG0JGJITxyGx63Uv55mMqIOHyb4JsnIazYBsndSpqAnASDMQ48Tcf
	PgMufvWC81JfFrtbJpJ3Jeb3BRf53/hGJg1M2lqvYTfSq/+YBFl6M+pbb9IfDHGblPWZDdSLEVEC4
	ixYzhn5kKxWhwBmhSf7NFxzlYNWGYkhUwJ4HApBNsNePN/QmHlj2lrKes8JnEaPWIzWZZPBMbbhqz
	OynqAxbqrEFpl1MTee9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXie1-0000000EsAv-1BMX;
	Fri, 04 Jul 2025 15:48:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiZs-0000000ErjW-1De0
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:43:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7426c44e014so1038751b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751643831; x=1752248631; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fi7MgAC308LIP//ZnE1u51RXI1xNNSWwC3rsR+KjlY=;
        b=VtlZ/72zj3+NgbM1fC2YgFAduG7L5mV8gtgeQ6rwQyELWxmFO68Kkf23W4+A3wRMq7
         8xdo5BnTt1oh8pqU3lg1yHnLUPj+e5jD0koa9pUEhXxhzbp8KRjCDszh/PCqsRpP72G2
         JxnPWYL0zinpBagFwBjdZOWXtsqBBmoHVk5jQJxo0YcWk6aqjAPlKs2lpQtTxkcA0AKU
         ZyU4JvqMnaTE4epc86fE6pvsKokK1faJaWr7DOeLf62GzxPkzYChInE54phYqIcERPFR
         3q7mbWrtB42/9iYx9ny1wqXXRH0L10kzQs5fCqSkMi3lMqou4HP4eM5iPhBfFOvM5+0N
         hPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643831; x=1752248631;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Fi7MgAC308LIP//ZnE1u51RXI1xNNSWwC3rsR+KjlY=;
        b=nUPs7HdFTMRGpac7NfiTp2r/rnADsnXIFZcJ1GLnyY1AILtvOwAhoxADb5mfT889tV
         qcG429jC4H6cFk2PDZ0ymtkYy4dQcJWmgX+6rvUNbhDq7M/4QO5MjqKVOJyQalULExVH
         pYVAckalVxOOi+u0tpJPGwMdtX1yRMqIRJ+sZj8bvy8jMMgecPN33TmG2xz6PXtRpvKD
         58HRKQGCa5n+4jvknUn54SBbv8el3F8Y1MnpU5SFecsjmF8WCmCjVrz/m6ZXg3PTdmM/
         VpEk3iKQ9+Y7ZLKJBm/nbxMxZRKYX8gfYTU/keam/5pwvTrfLC+fJrUIBtXw3iVDiJfa
         zWFA==
X-Gm-Message-State: AOJu0YyTya/4ZKKfIoXzss25UzC0GvTM4HXtQuei6h8piWxNkF2Ajfpx
	JH0hZ5YTwF/t1o/IZ8RiU9oQPYi58zP7oNQfGB8UgkAD1txsDpK4fkDWfHec22vyCWb4xPGA/jv
	+zt0ppL0=
X-Gm-Gg: ASbGncsabNIxm7pJIC92mr0djc7uMjtGhn3IkvALvnEEubxs6PnVM3SJo19Cjt+Z6sy
	h9ihW6VROUV/jtsrHmNaJM7zKlMZQ86H2k62NUo0jOJf0oL+P15nitXKYL4p5Apqis6dwqUXnZT
	6oaCpfLk92rkrh8PM4O3JyqldbJ/2DldQ36yFp9HCllJlevEBHzaBzT7ge/d2BZsPoab/PISc/G
	SlKHmhPdjushsBj33OLq6tOGaH2kwvWU2u/AONMw4GPKtScIEzyxzSBdP+/+X6/U1mZdfy+saEX
	CSPRBxKZ72fnGBvf77POtW7VTiQIm8JxVsetNCS9dHqT3ofO72JUVt10IaJ78svY25Uw7A==
X-Google-Smtp-Source: AGHT+IEUDVoKYlkifMHSaDj7f/Nd2VF8qbFrSx0lugUxuKLLIiCCksgTeCHMnVKh28vqb/Op2sjC4Q==
X-Received: by 2002:a05:6a20:430b:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-225c07df36fmr5589536637.25.1751643830844;
        Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce43d69f8sm2458166b3a.179.2025.07.04.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
Date: Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jul 2025 08:43:29 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_084352_418401_61C8727D 
X-CRM114-Status: UNSURE (   7.38  )
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

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5

for you to fetch changes up to 5903a7452e642f1475f274373633522db168b60b:

  Merge tag 'riscv-fixes-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-07-02 10:51:00 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc6

* kCFI is restricted to clang-17 or newer, as earlier versions have
  known bugs.
* sbi_hsm_hart_start is now staticly allocated, to avoid tripping up the
  SBI HSM page mapping on sparse systems.

----------------------------------------------------------------
Nathan Chancellor (1):
      riscv: Require clang-17 or newer for kCFI

Palmer Dabbelt (1):
      Merge tag 'riscv-fixes-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Vivian Wang (1):
      riscv: cpu_ops_sbi: Use static array for boot_data

 arch/riscv/Kconfig              | 3 ++-
 arch/riscv/kernel/cpu_ops_sbi.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
