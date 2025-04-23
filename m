Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DFBC369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MCgDI/+tBpk2KMOO6+NutnvarBY+Zj0JSr9rdzsNJxY=; b=LSsaPPatLtLFR8
	O606he/O38NV9gT2f3CalxgY6/McYUFL+mJPu692xKvpGWy6Fjg2ZzaMkdxzrjxLXE8BuAXRnSvT7
	4NCb8VqgI1qw47qJawqDxcBbsUdIy67vGwGIW46sb6eFpHSMSTS1txkDi2wNkKrc2Rk19UTtXOJlo
	FsBCW5+heFJY9Bzqv/HHxtNBR0Ajw2T+wYQ+vAX4lrbs0ToNWi5KG0m1TCulAaz3wAIs2k4b6unqT
	QstM1E9kk+0hOyhpRfDbS7Vl22xIL0q3yqSZ1Bq3dupoNjiJO05JZKlDeCEwuvzVsL1h+gF4OlRuP
	BfHuoZpX8kluoj2UQHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5e-0000000BImj-1RFf;
	Wed, 23 Apr 2025 17:40:54 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bML-0000000ArnB-3yeS
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 14:45:59 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so2386242241.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745419556; x=1746024356; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XVzS4DFXKFHCvPld98KfR1XMwmy5WtS3R3h/ahLL1ME=;
        b=K+EF1ZQWwjflKlfbKoDQ7NICkrxPYfQ3ZIoxRpKVsQynLFVvZqZ5U+CN/TkTLOklCK
         qDXYqrIrC59gIoq/usRgFQp5qVQJxoMvc/dyoEFk4xhq7t1IF+o63QV3ie79/gL513FW
         JLFwgY9IHMuwvVQ05fswyj7FXlaLOcZ1by0YTB/Wl6oYTXSgNJpnGKoTl6jiXroUETs4
         F469s0NR5Pd3ywEur0j0L/WY+SY6j+ecDpekpJfVL3Mhbi5FbRrPYbCU530qs/Mgvq6n
         ZteKB84Z8zNByr2YlRFPiEspHhv/88F1IeZ93IozQo60JXw1aXpYtumoNigH0lrW1Yqi
         CbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419556; x=1746024356;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVzS4DFXKFHCvPld98KfR1XMwmy5WtS3R3h/ahLL1ME=;
        b=YY5Epn5MV2H/WhzZGLc4FlsF5B5clQSn2eajDSyqag6/AvhMGPF5sPyadLj3bohtOF
         7TVjCY3tcaGy1Pp3WNcSWHyNnYcWv9H+C6ar4VrAqk7WtnYnHw09GMizVySvosTIOamF
         lMwI+cpOM/nDmoapPWIsycmSIbR1+d+xVMbdb0nYO1MshZGkeX2F2B6l1XtAHbUhDOaC
         AxJO7tbqlkPHjHvYNoR5Or+evtqHe5C2sIIKzUCWtVGRky0GCy/DZXOc9VtX9XQVHXKq
         psA1x2ZJF2Ggh8FZ19mA2VhQaW9mIoWGT11KWwQsBo5zIapEaxXTfIz/teaA09nQT55w
         6M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvEHYFwyaXe2rCFcgeP9IiuUMKxw8V5iBQ1t3co0XvDU3R38ya70CtutDUiXKPIVnLU6TyrkTsqD0cug==@lists.infradead.org
X-Gm-Message-State: AOJu0YydeheW1MGe23ln2Nti6mSV+0OKHyy3IjLsGqwEbilVJGfeUgXz
	c992tqw73lqESTrmCXafEW+dwBuR/ycwzqENnmIPyPfmSh3paLg6hmGjomdpOt25kYXSUGoinmj
	Jhmd004kR0sTCT/BaX0mingoXLeXA1LUP1E9Nfw==
X-Gm-Gg: ASbGncv67aDib5AcNQTRIw+BFb+2AA035N/bAc3z5UI4VkA2nA8snvPZzjMHN9cVHJv
	o8gZSmqQwlMkJzNdXm/jj2FpyzS21uSWqzOwCMpra2JQGvKGJXfKYP2ouBd8SarGr9AWOadYPga
	HXrIx1iQLS7Y11t0GTF4uDF8wHhOPABduRV7RcFgN7FSDcqmTpeiyIfQDsjLV8sLFS5Do=
X-Google-Smtp-Source: AGHT+IERRJGw6BAbTzZ7eENF+DT2FWTrJnr1CWFNiPg11ivsYpv0iKhIOifBDRXvHHv1G8kwWKWca5Of8Ul4FmXDow8=
X-Received: by 2002:a05:6102:3195:b0:4bb:db41:3b6c with SMTP id
 ada2fe7eead31-4cb8012897dmr13504466137.12.1745419556210; Wed, 23 Apr 2025
 07:45:56 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 23 Apr 2025 20:15:45 +0530
X-Gm-Features: ATxdqUFKPsvKE8tS36jt8rkB_HWHxH1SfL5siJ13k1SJ6uSB3Mz80W-5YsuEDvs
Message-ID: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
Subject: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
To: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Nam Cao <namcao@linutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_074558_009035_C32F26A7 
X-CRM114-Status: UNSURE (   5.35  )
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

Regressions on riscv tinyconfig and lkftconfig failed with clang-20
and gcc-13 on the Linux next-20250422 tag onwards.

The defconfig builds pass but tinyconfig and lkftconfig (compat and
VDSO) failed.

First seen on the next-20250422
 Good: next-20250417
 Bad:  next-20250422..next-20250423

Regressions found on riscv:
  - build/rv32-clang-20-tinyconfig
  - build/rv32-clang-20-tinyconfig
  - build/korg-clang-20-lkftconfig-hardening
  - build/gcc-13-lkftconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv vdso.so.dbg dynamic relocations are not supported

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log riscv
build errors with gcc
arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
make[3]: *** [arch/riscv/kernel/vdso/Makefile:60:
arch/riscv/kernel/vdso/vdso.so.dbg] Error 1

build errors with clang
ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
'__vdso_getrandom' failed: symbol not defined
llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
such file or directory
ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
'__vdso_getrandom' failed: symbol not defined
llvm-objcopy: error:
'arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg': No such file or
directory
arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared
identifier 'compat__vdso_rt_sigreturn_offset'
  220 |         regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
      |                                   ^
arch/riscv/include/asm/vdso.h:29:42: note: expanded from macro
'COMPAT_VDSO_SYMBOL'
   29 |         (void __user *)((unsigned long)(base) +
compat__vdso_##name##_offset)
      |                                                 ^
<scratch space>:317:1: note: expanded from here
  317 | compat__vdso_rt_sigreturn_offset
      | ^
1 error generated.


## Source
* Kernel version: 6.15.0-rc3
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
* Git describe: next-20250422
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/
* Architectures: riscv
* Toolchains: clang-20, gcc-13
* Kconfigs: lkftconfig

## Build riscv
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/config

## Steps to reproduce on riscv
 - tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig tinyconfig --kconfig-add rv32_defconfig LLVM=1
 - tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/config

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
