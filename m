Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F5C28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lSNQaOPfme/68VNrEtkjcLqFZsbkTIfUaS2SXgqLWrs=; b=zmo/9A55LVZbYr
	iDgxcccakfoE1kt6rWgv+0zYpzXNw5FVXDQRcyK+FGhK4nwJ9Rt1YXABneFCTpB1vPtmcYFIuoZIR
	xsJopY8291b90Huaj3bS08Cthh6tofEOxnzCNk+O0vN5QB5IZAq7AP22JxvQvA/wUb1ljT63oCwFQ
	j8nQgaWLgSL22LRR+9HBsLfFrmKbnGYGJdTglKQw4X/S5xPOUlk+0xm6UN+sHOWRNIQjA97oSc3xL
	SYqwMq8hA/252OLOhhEsa5gLzaRjj5qDT9qEabGD1QbmWgypKicFZTeHvwz92Db8qQZjOYWrEr6+5
	SN2qWHHw7PCc1uwhE7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy1H-00000006DXy-28bu;
	Wed, 02 Apr 2025 13:20:39 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy1E-00000006DXL-2vcc
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 13:20:38 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so2683401e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743600035; x=1744204835; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=Y4m8SkkFJVFq1bCtaFNazDNEEq9akeuijJxX3vCI75xV4i8561ezGdHMMFFqeIrUNG
         HLpOvyOOuffUJIOmPwurm+pS4ZD9xoD89id85+1DmGiWW5Kr88dGVUE/DSsma12VBGzA
         guctYLnEFn+YoffuP7LdD5BD4j4TJkAhV8VEwX+rUQqpL+TLEeWjJ63u3inb621p+c5e
         Tgq6bNYp1zAiODi79QLt9RVGLRXVvkRxlSmDbTbYWwz9pzxshNa8hth4VYpeQzir1PSU
         uXT2IgdRBAvcr1kZTgd15nhU7JGBwRS8mR3qnRl470E1y1DOpnudZegTPW48pOdVpF64
         /AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600035; x=1744204835;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=F2YR7o/NNAKKtJCf1h15ZO+rVa7XtvXi7pEk4uRQx4+CZ45OLPr6bb3vwAjoFQTfw6
         arY7JtLEbYmHKoUXsLXWSZN0U6jHqkM3oO9Lu72x5OPzz1u1JjwXIWJBeFjO4LuZBNyI
         qHf0wVJRTnT50HlSIEZA/T3j8JV6B0ht8lRxvx1uJUMBsnQiC3xibKKfg4RdziwcmrRI
         7D8uWkmDix+uBu/0x+BGTftJdeHYwJ2PmUHoXpFIHGZ5FLhafZSbo/dpLpCyqfjIH6/Z
         cej/lIqxIDGs1t2vu4msjSbEPuZzddKOrms2sy+vSOPpKPeh9J4c0fUQXD2gRhRiR6y2
         FkCQ==
X-Gm-Message-State: AOJu0Yxb6SKxNqeazAyITLFEwHuRGNsA7yBVij2pK3IRyXE0CvvR3V7O
	soXLos2gYGbKN1hdF9WfFoAVt3vhcV1RT1YbHt65dJcfccO706A3duqG7O4we0MdtWNVLIExmOw
	qiORkTMAdRQOe4A8zpzWtV5tCcyKojhcckNeaiuhGokZkyZ4TXDU=
X-Gm-Gg: ASbGncuxdPtv7W8HDbA6waye8yDccgObJ3QC/4yamdmWL/Ns3PQ71kaQXBrKu7z9MmH
	yS5yrgHxE4Pc1r9c7PmLjt5SmdDeW+I03tRqM+Wtlj0tSVSbJDna0hj52QCUlyEHwyKUct+0Mk0
	cd4KRsA3LXCDbLvDB+yJdzYZzOtRd3qvhb6AsooFBnKJ7hYhrIQoh5S9VHdXk=
X-Google-Smtp-Source: AGHT+IFsHe2qgE/3dZ7ATZQlTlH2f6sgRKoBUonASYXuz0Bb/UAqUiZV1X4Y0sczKgfKtwF36TiHquI/NJM5jnDcsl4=
X-Received: by 2002:a05:6122:249a:b0:526:42c2:8453 with SMTP id
 71dfb90a1353d-52642c2849fmr5205649e0c.7.1743600034755; Wed, 02 Apr 2025
 06:20:34 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:50:23 +0530
X-Gm-Features: AQ5f1Jq96Wf-mikRgwQXfn81V0rc9lAZ1ueGPOm8SXNAmq3Q4b2XBmmyCtKsgkM
Message-ID: <CA+G9fYug_77HoqyonvsnJiya2q+0-hf9k4Yjk_dDn7P91Sq+3A@mail.gmail.com>
Subject: next-20250402: riscv/mm/tlbflush.c:195:23: error: 'start' redeclared
 as different kind of symbol
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_062036_743295_3EBAE978 
X-CRM114-Status: UNSURE (   8.89  )
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

Regressions on riscv builds tinyconfig, allnoconfig failed with toolchains
clang-20 and gcc-13 on the Linux next starting from next-20250328.

First seen on the next-20250328
 Good: next-20250327
 Bad: next-20250328..next-20250402

Regressions found on riscv:
  - build/gcc-13-tinyconfig
  - build/gcc-13-allnoconfig
  - build/clang-20-tinyconfig
  - build/clang-20-allnoconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: riscv tlbflush.c error 'start' redeclared as
different kind of symbol

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arch/riscv/mm/tlbflush.c: In function 'arch_tlbbatch_add_pending':
arch/riscv/mm/tlbflush.c:195:23: error: 'start' redeclared as
different kind of symbol
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                       ^~~~~
arch/riscv/mm/tlbflush.c:193:53: note: previous definition of 'start'
with type 'long unsigned int'
  193 |                 struct mm_struct *mm, unsigned long start,
unsigned long end)
      |                                       ~~~~~~~~~~~~~~^~~~~
arch/riscv/mm/tlbflush.c:195:31: error: 'uaddr' undeclared (first use
in this function)
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                               ^~~~~
arch/riscv/mm/tlbflush.c:195:31: note: each undeclared identifier is
reported only once for each function it appears in


## Source
* Kernel version:  6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: fefb886b1344e222b3218f3c0165b0fd770e8b88
* Git describe: next-20250402
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/
* Architectures: riscv
* Toolchains: clang-20, gcc-13
* Kconfigs: tinyconfig, lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/config

## Steps to reproduce
- tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig tinyconfig LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
