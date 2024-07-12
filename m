Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA8EC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gbfQiA/Q12XXUqMd79lqCUAKvIgyvsQ6mjRQvoWHJJI=; b=nwxWHzUrNzP/24
	wbIUkjkyXlE588qE3h85tyoIuVP+smhGCmIhkeQVXgjNDdiG6l6RQaOzf2z9kMMFadiLFbh+x3+Nu
	YgCoJzVZtcPQj30r+3onK2tCpvz6+NgF86kJBnRK3k3Bl8KkJGeJzxoM6zHFfS1fdt5cqrhgtWnHS
	eL/EXQ44/fjXTtbZJb1i3LELsw/8CQsKYCTHzRYCF24ewNA4eDbYxBC1Y9f/sCsEXT8FRVUQxXNI/
	GyiTSrF68AyBvwM6g70XD0kzxho+4cAenhSN0psQ6XAzAsr0O6UfhAPsz+AgEObie13TkFXnS3T2V
	dY+TbIDh0AQ8w0vDJo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSEa8-0000000HRqT-3vxx;
	Fri, 12 Jul 2024 11:36:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSEa5-0000000HRpx-2tFw
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 11:36:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70afe18837cso1433575b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1720784212; x=1721389012; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8QPyZ5RScU5gTyXOYP4p8Zbe8xfm/1xv6aVNQh5O90M=;
        b=c96pUyEcdbSSll6LiVjFQGbU/HQ/jRZwcDRG7SMbGaxWpZi6l2k3X7IKgvN0M9OgWd
         242XDuBGXhmldzu+gbxK11xunB9a2J+IIUwDDKM8axyPqv+dAMciYuraGcKy8vHwPBJK
         fFdraVOXVqc1rKnrFeEHCqLy3lZ0NT5wtWI0oFWMBkspVLbNKujRh06E4b+IYH0PSFZk
         /rdOfRhHzPTgTdQ2hvH0UtI9o0hQDgEnxbmvVnwS+Jk4JUwYH5BNKUn3IY51hfm64UmB
         LL8k4CaDPytJIHOUFfRS28iT7oDI6Hn3gip4ZckArIRj1Z/vmoSTZHNZeVBeSyGhdL2a
         7kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720784212; x=1721389012;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QPyZ5RScU5gTyXOYP4p8Zbe8xfm/1xv6aVNQh5O90M=;
        b=sf2jHPBC1irB7JDk/C9ETjYg/exIXSbc8i1ze/xx1vGXp9XSacjhtLvbOqS7FrcgtR
         wk/ONgi9d4rDB5J58KmA/O9PI3lfPaUNyq60ARjSo4KIbcCzilDFEzmxZyNib1N+fVx3
         d4Iov/o/qacHOn9J93D6HVqKt+B5t0kcQnOhZTlvyBQkl+NpsCCHDcMJtzrdO6HPwho8
         g1msTHiXd31cYe48UaL5shFTCwcGEPkoFEdTBT7RVj24Kv+3hUarFwhi3MnKXHMi2AFH
         54Mpo/LCKtcTu6Zm4Nkg/pto6GXkInrBUc31cMMEh1zplfghyHq66BpAWvlXFOTNZXMi
         pW1A==
X-Forwarded-Encrypted: i=1; AJvYcCXFu/bPzPi4E0P27tRwls0CXtWntK4qU6ePYo0G76Zxkn9AH9Qc0h7zhWFkVGwCS5ykJIs4dEeygzN52Rg/VWGqrCXI37Hm8v93YVoTk+WO
X-Gm-Message-State: AOJu0Yy/NitiNZoiD+KjeGx22MB7/akRu0XtMoN4B7/YXds5MgLmL2Sn
	CfPcqvCppTQfLleKFbTX6eRFs4XxvU0fF0KQvFB7JNxnFhFWA840G0fpwsJvnvK+DFYQ8r/ucR3
	z
X-Google-Smtp-Source: AGHT+IFYp9uXl/P6/Xcfm7oLVZTdy2eelyygNVA6Z94yO88iDTj8a2VnY0+dYVSpsmR4/1WeidEZ4g==
X-Received: by 2002:a05:6a00:1395:b0:70a:f57c:fa1d with SMTP id d2e1a72fcca58-70b43623b6amr14291802b3a.29.1720784212312;
        Fri, 12 Jul 2024 04:36:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c3905sm7258379b3a.79.2024.07.12.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 04:36:51 -0700 (PDT)
Message-ID: <66911553.050a0220.26b25.f281@mx.google.com>
Date: Fri, 12 Jul 2024 04:36:51 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v6.10-rc1-55-gc9b8cd139c1d
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
Subject: riscv/for-next baseline: 20 runs,
 2 regressions (v6.10-rc1-55-gc9b8cd139c1d)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_043653_749756_7F063786 
X-CRM114-Status: UNSURE (   3.50  )
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

riscv/for-next baseline: 20 runs, 2 regressions (v6.10-rc1-55-gc9b8cd139c1d)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/for-next/kernel/v6.10-rc1-55-gc9b8cd139c1d/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   for-next
  Describe: v6.10-rc1-55-gc9b8cd139c1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      c9b8cd139c1dfb95eb86fd6a58cfe2089843d1d4 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:     https://kernelci.org/test/plan/id/66910d31db85c9bf927e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-55-gc9b8cd139c1d/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-55-gc9b8cd139c1d/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/66910d31db85c9bf927e7071
        failing since 36 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.10-rc1-9-g6d8e604c9502) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/6691101c0c53e66b727e70a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-55-gc9b8cd139c1d/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-55-gc9b8cd139c1d/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6691101c0c53e66b727e70a8
        failing since 50 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.9-11099-gc6c901b7d9833) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
