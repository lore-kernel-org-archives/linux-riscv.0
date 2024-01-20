Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA366C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kgr6keZXSRSn6R6FCNhDYWFajYQSmDgRVDUwynemTtI=; b=BBlEIN1bhFBV5x
	eZnm6DKlQly6ntWAnaPujw5bwTBxDiE1kdjim+JbL1zcLmMwMg8nc3f935AoCtOuCEG3JHz8QpJU6
	2fhSTRQnfivEFgrw8nAghXzryGgSEYZvUvvF0wsojA8Xust1qO1cmM65bESw66gWWEHtREr62W+nm
	LOAlVmYLxreQ7tGk/bWTZFnfpLOx7TmL8mV7kSQ/+G8adU7/85yGytcA1Htv2u3GBB+tCcF9k7YTM
	QShB9ripmvX5lyPjQwSeHn4myXh8oYeuxYmeVDudxzsxUgQKxeT8zHsxQOliLW7egNQoxosiyFgRD
	LTIwDJs9S5uK3kOKCZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKOk-008Yyy-0l;
	Sat, 20 Jan 2024 23:05:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKOe-008Yxy-0Z
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 23:05:08 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6dbce74f917so315307b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 15:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705791901; x=1706396701; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3SCOrYrydggrLqjpLHk4w5cWVMkEhMbtyx1lBVjnBQ=;
        b=2/kRIvq01kjT0Nzu4YMrVZIj3Y2ecG0gEkFbg/g3yf8Ind0/ODv36I8FD6XA4cVNwU
         8WRQ78RCNw9ERBUWGgkj/64qt3DPljVtDoYfIWiCFVt3iZihbgQfsJnxMYvTiIpg5DNg
         bz06Jnkq9Nr+9aZc6n/0mL4KLlhBjt/Y/YE8hEMLYfkw9cIJf8NeaMJVMomAzjye1tlD
         nYMBnjrXb9jPs87uWG8ShC5s4mkI+ZQp2t4SFItx6zR4APbgkagkiCH3ie5Nt7VNWX0b
         P/vZMr832FgL0EXKQ350mxRn7LzJHtEW1wIfJxfRtfj+rLGOtmtKJdTexkhs+pc+U6cR
         5MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705791901; x=1706396701;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3SCOrYrydggrLqjpLHk4w5cWVMkEhMbtyx1lBVjnBQ=;
        b=XMW8YGmtGcNXf8xaTHGK8TXYQxQIF/MQgJnGKoQcV1owX/lnPtUUCqEAS409NGqRf0
         jU7PCBie1FsTEQjFj3K42+XY0SGdfs+t7HT6cTCT/TSpUfr89HVI6TKp7X3fRbGlb48F
         Vd4brUxvniWz2DpcXnMYaraGuo8y0GZrFwagRWwHoDJ2UbNXibSxOM+T9BzbZyHZAdxv
         jAjCqnKqXRASYWn7/fCS6FLfc2ctKHEYoru/s0jn3/jnmYcAbrmSEpXSh1Samjr1Rs1Z
         4i67Qxc+3UeZlhWaiQdgOiG9qNHws1vXmWE68dA9ZcTPMNSQXEawHAjppSpaUu77oFEE
         +BJA==
X-Gm-Message-State: AOJu0YxWnYFoGzFMMrj2o59970/SWFUCDnd0mrFiZSJPugt8TAv3wkuv
	VGu3V8y1aCD3CtpBTiPO28rfNlQQYhoqZEgPYk9JXIJKmvI2z3YY874NPWZhGTs=
X-Google-Smtp-Source: AGHT+IFPl+JDJz51D6SslFtOqfSHiKip3ZHHDwE/E2G2OlYytJDDwJhc9iF62JtGrqUtyDKlwE+d9g==
X-Received: by 2002:a17:902:c94e:b0:1d5:3100:5365 with SMTP id i14-20020a170902c94e00b001d531005365mr892080pla.27.1705791900970;
        Sat, 20 Jan 2024 15:05:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902f25100b001d70e83f9c3sm4426120plc.242.2024.01.20.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 15:05:00 -0800 (PST)
Message-ID: <65ac519c.170a0220.d78ec.0236@mx.google.com>
Date: Sat, 20 Jan 2024 15:05:00 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.7-12908-ge5075d8ec5647
X-Kernelci-Report-Type: test
Subject: riscv/fixes baseline: 16 runs,
 1 regressions (v6.7-12908-ge5075d8ec5647)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_150504_238428_2123DA64 
X-CRM114-Status: UNSURE (   1.88  )
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

riscv/fixes baseline: 16 runs, 1 regressions (v6.7-12908-ge5075d8ec5647)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressions
------------------+-------+---------------+----------+-----------+------------
qemu_smp8_riscv64 | riscv | lab-collabora | gcc-10   | defconfig | 1          

  Details:  https://kernelci.org/test/job/riscv/branch/fixes/kernel/v6.7-12908-ge5075d8ec5647/plan/baseline/

  Test:     baseline
  Tree:     riscv
  Branch:   fixes
  Describe: v6.7-12908-ge5075d8ec5647
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
  SHA:      e5075d8ec5647322fb9e699bfb76331cc8ee098d 


Test Regressions
---------------- 


platform          | arch  | lab           | compiler | defconfig | regressions
------------------+-------+---------------+----------+-----------+------------
qemu_smp8_riscv64 | riscv | lab-collabora | gcc-10   | defconfig | 1          

  Details:     https://kernelci.org/test/plan/id/65ac4a57df0670ab3a52a400

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//riscv/fixes/v6.7-12908-ge5075d8ec5647/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//riscv/fixes/v6.7-12908-ge5075d8ec5647/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230623.0/riscv/rootfs.cpio.gz 


  * baseline.login: https://kernelci.org/test/case/id/65ac4a57df0670ab3a52a401
        new failure (last pass: riscv-for-linus-6.7-rc5-4-gb8b2711336f03) 
  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
