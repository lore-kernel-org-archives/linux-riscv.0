Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A11C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=41pGesdvZvH6GDZHpLUWtm8tXN8U1DGl/ZiVDu/5sUE=; b=UsYfRbHV5aWCtE
	t1l73tPySIeHm8lqO7fC6lfCsR0idwq/plEtTtoXZ4bBmnr2HtsmRJ9YntgMPNjoHi7AZ9xKVAUn/
	AZpf5hAPJbhM7LD8Hs5SgRI7GNAeG3TgesfqaPKKJQVf6DMpN6kin+0jTC+qKAfi155sT0Nhy96+X
	hn1Os/LJMuPVUyAl6e147qV7CMzY4Wrenbz1G+DFsAGLIAgQmfbmPTpejEzDczQsTWHwT7uCPVokj
	nGoPBzD30ZZ8CdkFvE972CmZM26fv2zzV/seysFXCXTYHReXmi8dqPX3igEy+O+Sb1s6TT5UVLc7a
	yN/AWWhgNQnARNJPVnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1WG-000000059fn-2pXS;
	Thu, 23 May 2024 06:01:40 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1W9-000000059ea-1MGL
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 06:01:39 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-36c80f9c86bso29858985ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716444091; x=1717048891; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k3ZPaiFqnO4EbKK6yBhTjD89pF32UfyI76zAat1Nmlo=;
        b=s+ntOBWeYTB2ugh6McGZbPAL0jeOzeEIRSzfrbwSlu6LKf3+P0v3Cq9mMQaFp/789Q
         lYFdV8DxjE5+LAxHz+iIcirZhCqc5/2TsBNVSlN5niHh//Hds7t38Vwvb/iHNOtePKtz
         lTjoh6g0b11S6kMGVjd42KFfgPhqTG5Na3Vc5XiXOKXpnTA6TzM9wACZ7T+a7G6m4xbM
         B/g8Sgc0U1fwJHqpqP0R0txJZLsRPHb/8J+D0cjnrcQiqbY+051Laeg5lcWNDB9SD3XN
         a8BJN3Tb8AvxdJOn22U9ZlHkB5V5ViXWu21twvXSG1WFe7SrpKIdF5TdcRjT61rXu5La
         Ly3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444091; x=1717048891;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3ZPaiFqnO4EbKK6yBhTjD89pF32UfyI76zAat1Nmlo=;
        b=fZlZsWi2oam/NaXppxgQ/83BdROtRTY7DVeMLt4Q2jLEBIKgw++Aeh72XftKtbhl0p
         3Bkltvnxidgm/q+QSnguehwGhquzn3Lsr2RF7Nw3p9wDGnqKMC2Jav5OK2bxXh6hoRWd
         huNvmcDvHvLRJLExI+Dzltcn837HvYp1PWsG4YI5OUs8ebKwd8dxX+3I2hOOzGtkL4V3
         2sIMwfSYN+h6MWJjOozCky18gs7/vLiJTWsoAO9/nthj3XWFw28sGkvIzeKULpehBzvV
         Cx5Q0LaYal0YYkxsOX7kUJzc5UOsEPdrTLKxd3UE6J8SlpvfkLeVakIWNdJqCD4rOBBD
         lkGw==
X-Forwarded-Encrypted: i=1; AJvYcCV+wTkqeOUtoz3H1rIGAbu1YbqSjKtJkY/Mkk08dRZgAfd8/ymWZrdetrTm8K9Q23tqQ/2nKQO2N5Qope4GTZRDUhX7R1u5TygtN9uHmad7
X-Gm-Message-State: AOJu0Yxr1tEtqb1U8/TTrkJUFg7XcfSvJqGGHm5MMIq8EU6Sfz+NEmhm
	L+kMhJPODLq9w96ds25M+SFTFUnT4MU3uJR5bx8Y9cHilucURRVaz6oetUSODgk=
X-Google-Smtp-Source: AGHT+IH0ojkIVDWl+8VlMcTZ+Cg77l9US7tDAJe9uPCIfdSD8husm2KWXvwF+4i7ef94N6NqPEZc3w==
X-Received: by 2002:a05:6e02:1a61:b0:36c:48c5:d598 with SMTP id e9e14a558f8ab-371f664dd1emr59915265ab.0.1716444090803;
        Wed, 22 May 2024 23:01:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f677a20c6bsm13483916b3a.129.2024.05.22.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 23:01:30 -0700 (PDT)
Message-ID: <664edbba.a70a0220.b5319.3b8b@mx.google.com>
Date: Wed, 22 May 2024 23:01:30 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-11099-gc6c901b7d9833
X-Kernelci-Report-Type: test
Subject: riscv/for-next baseline: 10 runs,
 2 regressions (v6.9-11099-gc6c901b7d9833)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_230137_054294_979C6F3C 
X-CRM114-Status: UNSURE (   4.49  )
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

riscv/for-next baseline: 10 runs, 2 regressions (v6.9-11099-gc6c901b7d9833)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/for-next/kernel/v6.9-11099-gc6c901b7d9833/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   for-next
  Describe: v6.9-11099-gc6c901b7d9833
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      c6c901b7d9833514eccbc39572e55c7d81397a3c 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/664ed6ec67a27cdede4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb11u2))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.9-11099-gc6c901b7d9833/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.9-11099-gc6c901b7d9833/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/664ed6ec67a27cdede4c42dc
        new failure (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/664ed17494579811574c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.9-11099-gc6c901b7d9833/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.9-11099-gc6c901b7d9833/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/664ed17494579811574c42db
        new failure (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
