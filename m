Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07BC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 03:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qhd8hdxoFMOBwB/sQNeYiIvyNzE0GPAxcfsdC+wHI5w=; b=as2NOr52NzMRu6
	HN1EcyumADpHtPeZyTFK/MV3E7okDqW4qapBULaeZXUsAdjqoknJr7EtlLQKMajzRGQsEnrl1oGQE
	Y04LluxX6jry0MEzEWnpLF5ji2efU6PX00e63NRobj8UFjfPiAkKSmIaOsK3VYx8E/3LBjpDfad6e
	ro4/J6IDYQvRR+SuGO1fjFXYjyo99vyS1W0sWflFXYQp9w7lW3npW2ghuAFh63g76OKpy8ZlmSGHY
	agWj1VcsQUWv5fL3uTVAxSM9VwnHIVRKS9HuUr4C3VrfO1DFGd5Rw5EJklSUrzs40zvRVt7psrAdI
	nMRIFkLOgccwnid/wCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zBI-00000004uDd-00EV;
	Thu, 23 May 2024 03:31:52 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zBD-00000004uCr-3ckm
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 03:31:51 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f6bddf57f6so2349255b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 20:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716435105; x=1717039905; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zPABo0Y9vGyOCqNpKKebYzkxdTTv2JVXTnS+6+Oki94=;
        b=cDaN+KAt8VQbatMWT5tOvKr0dARdKHZeBbOvb4Ai98h7OIDC8QIBW7zypgVWiL4pII
         Ihcz0AlZwVlCkFY8oWFkvFn5lZBm5wBcfJ7fonoIa96sTOmVLgWKxBp/gBL6UhRy0hzY
         B93vPckHAcB/4UfEIR+L/UeXk9KDMqTj2ErGT4bNeZjUm1H3oqSu/H++O0Qa4Thu71YT
         L9gCkM7UrtF8NXPuQrhGCPTOKkE3tXmalNgqHTDBkLqq29KtPATJHAirV2SqXyn2hASd
         fgi3XIVKva2x5NTBEuOZL72ZD1Lqa0+td1Xs1sY3Jk7x1f2gcdJM9X9K8j8ub+ud8vOV
         GhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716435105; x=1717039905;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPABo0Y9vGyOCqNpKKebYzkxdTTv2JVXTnS+6+Oki94=;
        b=HHu+NNUzYWiTgXXxQO1VcUgqJ5ym+x+24dZXYi50nCNgG1LE1hiTx8XilzepJ7PSvz
         gSCCZSTJZGJ9pb7FPc5cHFsaHkZ8Gw2l6mrN8mFoudM3gxrCka3syq7hYUK7ai6qO8po
         ws3ADRpRxuXhjrvMJSNrY1RuYx924IlLyZ5mwGjkrfbda2DmDB/8vBj3QBXPbp/My3Bb
         ePWYzh5HWP33cr4F3qk8I/xUFzG8coN5v/GcxaIxCqfifHvuP1c+xWgRRYYBD5uctHlc
         f3YgkeogxwqB+dt7R9txIjlrTvIkVe7JUIC8QFgcnqwGdYINQMZPxJwALgYsnpMa5Fap
         7VUw==
X-Forwarded-Encrypted: i=1; AJvYcCWSrVG5UGSbVSuDufVh0PwtWr9SbRgkzBsxD9nufgQij/s5I5BiWKK1Gg3NsSHY2mawXbUfW4Dv65IcjAsZmIFi57leLjqaS6bl05Zttvya
X-Gm-Message-State: AOJu0Yw0djS8GYMSCacDadDWDR+8qyPhrn/TDMaXeb2Mtl5tcDU/VC9P
	lJ8TEqwRRTUYHCoj9138fKY92jRHfSPovR/rDrnheZphpuZiLP3txIlvMXtD6xqpFmHTSGVJqEL
	9T50=
X-Google-Smtp-Source: AGHT+IERKdNbCW2ykViEO00n7eIMk+z5rHE5uOXc7T1DLDntWnZLgW7Gl5e3DAXQl7ck9V+GSM+nrQ==
X-Received: by 2002:a05:6a20:da88:b0:1b0:9b7:bbce with SMTP id adf61e73a8af0-1b1f87edc05mr4296926637.4.1716435105515;
        Wed, 22 May 2024 20:31:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf33021sm251603085ad.124.2024.05.22.20.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 20:31:45 -0700 (PDT)
Message-ID: <664eb8a1.170a0220.e085c.2c3a@mx.google.com>
Date: Wed, 22 May 2024 20:31:45 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-11078-g0bfbc914d9433
X-Kernelci-Report-Type: test
Subject: riscv/fixes baseline: 10 runs,
 2 regressions (v6.9-11078-g0bfbc914d9433)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_203148_003274_D8CCA1E4 
X-CRM114-Status: UNSURE (   4.19  )
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

riscv/fixes baseline: 10 runs, 2 regressions (v6.9-11078-g0bfbc914d9433)

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

  Details:  https://kernelci.org/test/job/riscv/branch/fixes/kernel/v6.9-11078-g0bfbc914d9433/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   fixes
  Describe: v6.9-11078-g0bfbc914d9433
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/664eb3d258cd55f8bb4c43d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb11u2))
  Plain log:   https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/664eb3d258cd55f8bb4c43d5
        new failure (last pass: riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/664eb26a1ce473fc344c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/664eb26a1ce473fc344c42dd
        new failure (last pass: riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
