Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8467C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R0KiCJE7oe2XI9iBZ/ahv6kBbScZR0XxTC1aWAk5v+U=; b=Tw+BptB5p/sVIs
	pldjZLLqRotvyuSIr45mIzz5d7ASY0GPwwE/jdQYexMGfU59sMdR5y5PnMga963C95PXJMVf1TKXs
	8mtMnHZz2fvcTOjwU5sSbMl7LcSB9IBst9lG8zln1rCG0uJvepeh18aPVl0OIMvsFdJz0Pux4NM1Z
	U6ItXUDQF+mUfXdA5cHRPhSixN9GmuMSHQqK6Hzzkf6CRRV+zNRBmYwqj/WJiR08F2esmG+zNnKlJ
	ybFWZqnjpiMzXiyD60WHg5umD/n26ztlNhMd1c4fpA7FjeGA97w9CLshD/AeZOMwwSz93FcyAIZJI
	UKEsJG/KxgytEFo6Rrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sToPB-0000000Bbpq-1mqQ;
	Tue, 16 Jul 2024 20:04:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sToP8-0000000BbpU-3LVf
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 20:04:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70b0d0fefe3so3950007b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721160245; x=1721765045; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iQG8mIhVVmL6xGbNiHThIM12nVXndwU8wyKuegz3/QQ=;
        b=ecc6y37HB56OZbUxZ+Mx1c54DFZMhlS2B4kHDM1S0O7zSoYnYW4JTMSIpZUIuT3q45
         a9WYDhVAyy/pTU3lRk+zcp4+YVT0COKlxooKZKvW7wLOqIPgU7MTcQ1oJ3CayxmpUssf
         roJKbWscNAvZUu2zxd9RSf0fdcmwBrg1P3/EC0VJPZ5nr9R+WdaQfcSHJn+QhXtgfb+d
         0A9eSKJdKnV8J//zG3zq+Tbfh6zyvjRm4afCpfRCgtbEfYzud0Y6LCAvpu+4n30NH1pP
         q2WpEXn1nm6s0LQSmbrf6ZvZyY7t3PFryfgpwExR+BSsZPy2bkqCzJrkCRSqQ6fPY0dT
         1pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721160245; x=1721765045;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQG8mIhVVmL6xGbNiHThIM12nVXndwU8wyKuegz3/QQ=;
        b=C69h25Jdlgw8KmJYZT8LCNV71o/x7MpJ2dForPfFxzYD7kY3ybtovP6etyTigVvxF2
         D86e7/LSp/QtdoCvkEQTUzlfhTtY+k/mbAoG9Vn3oHQikDRQFUDQAFhPh4cKNf4huQjd
         3Z03UW6z5aht0Bv8IZf10YW5neEmRmZg+X/wtf/CaGqqElarUYVO7hM+vWJEYlQoPXv3
         /EeqT0O4LLHDNsGc4Yh1iG/WTFkTLaZaxmJ+Ay37biyI4kn+j9xSwpR/j5x7edW9NMOb
         myDGUtkpExAwTkEVlrRPp5UrGIRmp8jcJ+vSmUEYFJUhsr77WEpvMITN1oUAMFIasZt9
         /l7g==
X-Forwarded-Encrypted: i=1; AJvYcCUt1I8pgLK0id39SQ9i184g6bFUcANBh5AqEU1vLUwJAVZhHX58VRrJO4PAfY7oPmr39xGXec54zvBzaFlXLjwykrEgOkrupQ3AfLKAGrOd
X-Gm-Message-State: AOJu0YwP1ICgNfX/01Pg6Wn69eaaIXavleRFfBlyaMd1k5UzLNAK6FQp
	aHIM7e//vzvzEN07OeOMhmN693usTPQv06VTlSZwWRMk47l+QfOtPFM7k8LHyDY=
X-Google-Smtp-Source: AGHT+IGQ6z8jB7QEkj/iZ2WgJe7xj7brawT8Ba4BI00DYf9Qt/9D+TtS6U+RlyEuUftedqFGfqFnJg==
X-Received: by 2002:a05:6a20:a103:b0:1c0:ecfd:e6f9 with SMTP id adf61e73a8af0-1c3f11f1549mr4187470637.4.1721160245642;
        Tue, 16 Jul 2024 13:04:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedbe8c48sm6731988a91.4.2024.07.16.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 13:04:05 -0700 (PDT)
Message-ID: <6696d235.170a0220.1d6df.82dc@mx.google.com>
Date: Tue, 16 Jul 2024 13:04:05 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v6.10-rc1-64-g93b63f68d00a
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
Subject: riscv/for-next baseline: 20 runs,
 2 regressions (v6.10-rc1-64-g93b63f68d00a)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_130406_860358_E02ADA11 
X-CRM114-Status: UNSURE (   3.59  )
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

riscv/for-next baseline: 20 runs, 2 regressions (v6.10-rc1-64-g93b63f68d00a)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/for-next/kernel/v6.10-rc1-64-g93b63f68d00a/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   for-next
  Describe: v6.10-rc1-64-g93b63f68d00a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      93b63f68d00a0483b450b446e2ea5386a1b94213 


Test Regressions
---------------- 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          

  Details:     https://kernelci.org/test/plan/id/6696cb0ddd5066115e7e707b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_SMP=n
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-64-g93b63f68d00a/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-64-g93b63f68d00a/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6696cb0ddd5066115e7e707c
        failing since 54 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.9-11099-gc6c901b7d9833) 
 


platform             | arch  | lab          | compiler | defconfig              | regressions
---------------------+-------+--------------+----------+------------------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig              | 1          

  Details:     https://kernelci.org/test/plan/id/6696cdca5572503f9c7e7121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb12u1))
  Plain log:   https://storage.kernelci.org//riscv/for-next/v6.10-rc1-64-g93b63f68d00a/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//riscv/for-next/v6.10-rc1-64-g93b63f68d00a/riscv/defconfig/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/6696cdca5572503f9c7e7122
        failing since 40 days (last pass: riscv-for-linus-6.10-mw1-6-g018b9d9874e72, first fail: v6.10-rc1-9-g6d8e604c9502) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
