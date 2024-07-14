Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF65C3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8DDvHS/qnMvKMzo6+cuuZa7WrOkMVhjSWCedn9sG9KA=; b=rKkDf6/GETrvdw
	b514OnJsIZaTenavLsvKgUK4MNDIJKGEGHeJFFES6/r7p3TYICxVz2JQggpVd0tadSiKaxUho+MWc
	tduQfFzacdQQdHV/wpo0pbVYICoww5NMXSgT1e9qLftCj9hM6Shb8S30WVDUT6d1mkazfKErqf0ei
	Df9Hpj5miCueEUa6FrOFwxbRz9MIgWGL1dwzTOjMwfzuA5p+rqD3iw55YJmwy05cq3koqLVWnSRA1
	ugKt5n/SawOnLLmw3kI6JW0WuZTQlAAmrIfjtb9h3cokoY8Ts4x3TBcfDRAuKD47DSFR3RfKKUuh9
	IKdyTp66A1AtemcaBL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT6ed-00000005BcD-1zjT;
	Sun, 14 Jul 2024 21:21:11 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT6eZ-00000005Bbc-46ow
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jul 2024 21:21:09 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1fbe6f83957so28842105ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jul 2024 14:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1720992067; x=1721596867; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7aWpgnOwUGkXOUIf/K9lPgFEh5Aub75C0cBK+s7jKRo=;
        b=mHfu+v3vhfFpvOi3szQY6cpyzw54/3e6tung9sQbhlHe8D9P4LS52jBV4F2t42l5QE
         tLRVZRIYVZU2Mi9xKd3DUuVq3fQocrklalhqGBO81eoVnvKZMJm2UGxO5cjLUzXS+hLk
         J6jRZjz1IwkPPp404zS0IgV5tbiWFMWaUYBcTEqvsFLnFmPGjKotEN7cdW6vH4mx4O5/
         5WwD6Jqajq9D5lcNQmEv05bOo2pnqzXgqj/hF2mv8rueNPWr5wPYpg0kXN3U1pEtlpkq
         NfxIVImfIUTPQLooHhOqAElei85+eGAS1Omgu+4xQrKvyrKuKO+IZc2A1xUdvM93DU9B
         86Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720992067; x=1721596867;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aWpgnOwUGkXOUIf/K9lPgFEh5Aub75C0cBK+s7jKRo=;
        b=i4+XL2W5nIwIuJhFL1jNcCLUF/XTVSVb9w2I4/pfveHLVzpq3sOOB90+J67kv6b/B8
         mxhjzUc4OSOE1tlb84PetqRrKlwROFsoUptfqtrArZIaHCCeozUkv27U+mS5JwBPHdNG
         V9WBr/FIegATivKy57KV3mg4683K5FDF7ZKcvL00x22m1rTgHHNPZJZ7DM4SNZyk9o1k
         O7X8wSEgUul1JBXejStf5Ix6Y+HxeVd5+93oU+dMZ2IzhZp0kcZsr1tM/OTgcg/+dOPg
         worwLeD4LEx2Xh18f1GfFQmDTXhAKnxwtiSGPZ6DVmXFf/BgSqsz9BvC9qsCvPz3/0NH
         o82Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiRIzJPuIAbQv3C71rk9fG4yb7F4QQ9zHhy8gkzDmr3W0cP0Cp2CcRps2jQ5JvmYD+vwWxurDfCYHE7AyxW/Lx3/DQr3ND2fvCYKNGKdQ6
X-Gm-Message-State: AOJu0YzPBmuhLwaN9l+X5XVYFmWikn33l3EXzavfRPKgeuk6C81QkHIt
	UyVqzgBTFOUhuLRGzItd9lxjR66uX5lGL5QrJCy91d0TCuV83uPhlCQxB2lm1Mg38t7sIeaupu3
	Dm3PWTA==
X-Google-Smtp-Source: AGHT+IGAOFbKxulrE4acoOI/WSXdDRrvSoMzb+9s8oRURju46z457p8v5a3PCnUTGyBlaUvTD8bK1Q==
X-Received: by 2002:a17:902:d4d0:b0:1fb:779e:4fd0 with SMTP id d9443c01a7336-1fbb6d3d176mr179748025ad.24.1720992067219;
        Sun, 14 Jul 2024 14:21:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc2783asm28286395ad.122.2024.07.14.14.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 14:21:06 -0700 (PDT)
Message-ID: <66944142.170a0220.ceea8.5b58@mx.google.com>
Date: Sun, 14 Jul 2024 14:21:06 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v6.10-rc1-63-g6ad8735994b8
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
Subject: riscv/for-next baseline: 20 runs,
 2 regressions (v6.10-rc1-63-g6ad8735994b8)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_142108_046682_052FB902 
X-CRM114-Status: UNSURE (   3.32  )
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

riscv/for-next baseline: 20 runs, 2 regressions (v6.10-rc1-63-g6ad8735994b8)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/for-next/kernel/v6.10-rc1-63-g6ad8735994b8/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   for-next
  Describe: v6.10-rc1-63-g6ad8735994b8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      6ad8735994b854b23c824dd6b1dd2126e893a3b4 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/66943de612a72296af7e7087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-63-g6ad8735994b8/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-63-g6ad8735994b8/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/66943de612a72296af7e7088
        failing since 52 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.9-11099-gc6c901b7d9833) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:     https://kernelci.org/test/plan/id/66943f4e9f5fe687207e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-63-g6ad8735994b8/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-63-g6ad8735994b8/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/66943f4e9f5fe687207e7070
        failing since 38 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.10-rc1-9-g6d8e604c9502) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
