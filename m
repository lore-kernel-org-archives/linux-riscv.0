Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20780C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 10:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FEwpB544sR3/ky4dbN7bJtwCd9yXi/DJjkwxkQM80RY=; b=dyMjAKyx/nJD2U
	3pTFKBSjjqCv1LL9U5QIsq+Vc28aDkI94baKZ9SSpc8MlpobOxtuBFxq0T+oFC5cF118029Mr5+5k
	sDZXE8HDNb4afJuyJHhPlkhLFSCNNiH3H8K2Cdv3rNn0Z2Ko6qde8S0SYHnYWGGR/MQSnMkl32FrE
	xgq+pJJb6HLu1aNrNM8WkAQScKICA0WNJY1TgOI5LoBh7dgEp2WoFTea/wH0Gb5Nh1Lv+lMJDmKAK
	HecXzyn6T91TKA0YY58/0zqALiFZp95bP97bV6jk1aInInqpKbiIoqFK9HSR+yxdw4hTAmqbkfj9v
	thAkNKEwK3rWcWeZxFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIQRV-00000005CAe-3SnC;
	Sat, 15 Jun 2024 10:15:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIQRR-00000005CA4-3bpz
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 10:15:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f44b594deeso28614845ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jun 2024 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718446525; x=1719051325; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/52zkXQUNBS4sVHSxyXBazIxeiT2X6clQhcFwHZbk=;
        b=1GGe5OS5i8fbrS8awJV31ikTr6Ip+ealUwcegPKW/KUkiRG2f6VlrkM7lDHO4HT4xU
         X2Jm/SiXfjVK9toGPYWdk9P+EB1w2rldorw9kqTVk+VXYEI7G5m4UgLugBXiQQ6PVuEx
         8v/NTPlhpRz86PHzwOyyZcF85bECn1nX+s44DqERZQMJosnGo11TeXk0l2DL5nhw5EvQ
         drdknoKSx0twswLlnNzAhfgUrgJtziMEKYfjwqeXdWkVutEI1lRwBsVTHcD/B+HroRqi
         kobgggLew/7WQ39J0hsEkdAU1dS6Gdf56QhzZ29TVK5f8XAMJTZbL+Q3mIcY0uOLb4Ku
         KMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718446525; x=1719051325;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/52zkXQUNBS4sVHSxyXBazIxeiT2X6clQhcFwHZbk=;
        b=JsAvZf2x9iCLtchg2cIUHRB+nnqT4AkML+g+Eoy5FOlOB1DdrdmT/uZP/DX/4krmPG
         QHSpzR9+14SoqYd1RLHTaK+ogXVRNtU/+9MTDZebgTviK97GflQf9Uwdgees8yqgveV3
         4Ol0ASr5Q7jPIWdjed7PDyRfV4uqg0JqQQVDWl2wxJYvo0HulFkispDDZfCVkgAGngfb
         AaqTQFP8sg5UbZmSM1WDd91yd99LPBbTQJRnLkr3lDle66xzO+MSL1u2tJUYS7rqQh69
         YgJCeFvrJwQ6c0n0E2BaYH/hjqqzMWwhKmARjDc5dDf465F3fEpw2PzF+Vo8PG81EbLD
         hlig==
X-Forwarded-Encrypted: i=1; AJvYcCWbxRkT4iT7cHoZjU5ME0l1PbF6PeNsn6HsVqcmLL8hfF/x4eYhbMfkDR9y3rGGgX4YTCZ2zmreqoVJcfsw8ipSqFIEw4VXCrsyzWiLuW2Z
X-Gm-Message-State: AOJu0Yxp5hyo5/e8bptnISba4/XRprIOyUMhOfXWfWvt80eSHkoNpGtB
	NQuMerP8s3T5KjEBD+UOYF96NAU/3GFybFDhXpdHR7FCHP1fGHVpBwoPKNqKV0SQiLOHLe+vuOo
	i
X-Google-Smtp-Source: AGHT+IGhU2xDLwLkeeOLmiup5zNnJE93pUE/MwLE5gsTcCVzBqmys53lChN6WZTmhC9J/txIPp3z2A==
X-Received: by 2002:a17:902:e547:b0:1f6:fa4a:508c with SMTP id d9443c01a7336-1f862a0a21bmr51314805ad.57.1718446524750;
        Sat, 15 Jun 2024 03:15:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7f3fdsm46607055ad.112.2024.06.15.03.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 03:15:24 -0700 (PDT)
Message-ID: <666d69bc.170a0220.226ff.df50@mx.google.com>
Date: Sat, 15 Jun 2024 03:15:24 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v6.10-rc1-9-g6d8e604c9502
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
Subject: riscv/for-next baseline: 20 runs,
 4 regressions (v6.10-rc1-9-g6d8e604c9502)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_031526_245474_0B2F6219 
X-CRM114-Status: UNSURE (   3.23  )
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

riscv/for-next baseline: 20 runs, 4 regressions (v6.10-rc1-9-g6d8e604c9502)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig              | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/for-next/kernel/v6.10-rc1-9-g6d8e604c9502/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   for-next
  Describe: v6.10-rc1-9-g6d8e604c9502
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      6d8e604c950260627ba374956e56c3814fa824f9 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:     https://kernelci.org/test/plan/id/6660f7505a26d7e22c7e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb11u2))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6660f7505a26d7e22c7e7072
        new failure (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/6660f8a421e9cc3bfe7e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb11u2))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6660f8a421e9cc3bfe7e7071
        failing since 13 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.9-11099-gc6c901b7d9833) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig              | 1          

  Details:     https://kernelci.org/test/plan/id/6660f43740929de88b7e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6660f43740929de88b7e7078
        new failure (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/6660f5ce1bab65b4bd7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-9-g6d8e604c9502/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6660f5ce1bab65b4bd7e706e
        failing since 13 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.9-11099-gc6c901b7d9833) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
