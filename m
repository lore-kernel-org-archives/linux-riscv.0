Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A494C3ABC6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azr2FxEi8yQYU30AcBUxn34IGDPt1ktXz+2GAMelSOQ=; b=y7jo6boEuN1gZp
	J/uHySqxBALxtmoaT5+tibexySvD0/80ZsS7yuxBxR61qKxUooPTIaSrhspYy6O7scIernX8R7xIL
	2b377zTvxhoOcL7ynimHmyPt8c4tiUZsyRMVm1hpTkJ1Ti+zi54Y4nbb0PXeEsDjOvFQBZXWp9v4o
	scUlTVSP6S4lVLwDYIeGx8AUVktbAZW4K4S2WFLp0Aw5MNjMVgcL6JMkza6UYTXQG71KNKDTkL1H0
	wIM2cevA3RypKFcT2NJg6TNHGNsqb3SyZVKckGYix6ewD94cneFWtMdeP3I3K/sR1bMQNHpGHQMwP
	k9YT9/XO6H0o/Ysl5VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0lW-00000000gGW-27be;
	Thu, 08 May 2025 12:54:18 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0dw-00000000ehg-3OxR
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:46:30 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-879ed601971so141945241.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746708384; x=1747313184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxhL21BMpd7ZCe+Gl4Bl8PbrN0Fr94zagNOX3ZIRJuo=;
        b=k6jhUsVlfG6FisAeGisZVCG9Rmbqz73iqRDBIaax4OVjYmT2oYZ+QQhwPLxSFpTx7T
         eEGp4NdKu4pPAHZlvqtDjhG6TyED4YmniX9w+OtaBTq9WV2WWfye8jqNUdlWItky4hjo
         NenB3oMZy+j6CHVgWaKsGDKCCqL6osiEmRItfEkubfzgvjyUxhYFcRhjSuUBsHwNpFCT
         DFK3p0Eof/jHdILbo8ts7d17P0SXLXSn7ctUJniYNLBxpsm3dIK5sRraf6XZJJyyfgo9
         SyBOsgDJRpRZa/11m35llVulb4X9VDqtVFQMRRK7Srz0aueofwoD6QZX8u/To/p9pQxf
         DoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708384; x=1747313184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxhL21BMpd7ZCe+Gl4Bl8PbrN0Fr94zagNOX3ZIRJuo=;
        b=YGqFpcAL55OdtHxw6uMz5t43gbRDc+y1H1d1PgUCppBjY5ejdt+AfJIv7PzC4FVtpr
         xANpj57Zwl4asUEYBchaJhCGipthslngmGG8QIBb6u5aLdUkc3eiwpDtbMJsY4rqBR0T
         KFy+Z6c4N5MExbz5WaBqc2UX+aln1IryzFd48SQJyNkezSCIU2u3m01noX8CVmTYq58d
         Eh3SGg4/l18LWZSPmIkUZ/AMu0XKWYCfnA3A/mPZeNCsyePLG6UsFykOyDt5Z3GxNT6n
         ihd9ePLtRO/6aGxjs6k46kYTI4+fK2sahQTXhDVSmlAIZ87Tq4dtQS1E8vQwDH6y824u
         i/tw==
X-Forwarded-Encrypted: i=1; AJvYcCWw+9NYahA1EO7vuc1NqK5r4A6yPTwMKiGwrq6znf4WrPgz0E94xDcTZDOySesD09pW91kl4L/KGPqmZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxDJWD7dn9LtfY/OiYeBxXZypLocwourHGfFOFcXYG80w90mEZ
	Aq4PsUenLPlKgZICTI5midtUoCx9XsEMPJr5jQQP2/Vh7X3IDD8+igvgvwQnN6M1cdxRiaBjT1h
	H7ZQ+BSY/W7CPrTVisNPnkqTsYc6C1zQJHhF9bA==
X-Gm-Gg: ASbGnctPTUrpK+3yyEKvTcCozLYN7ljJ/fDWZUgFIufKaXNIG64i8zNRmO1fFr97d5S
	CWd5uGa6K/xM8GkBA9eL8EK15nWvplU1CCBHpdUGNfdVtoqo+lBUHs6u0PlJXJ8WtbjhooLSOMb
	9XYqxn/u6SSb1vrjUYmG8x2gohFliyVrG3OHOXqumZKUD+EfaO96O3gEk=
X-Google-Smtp-Source: AGHT+IFbvVLt60GR/D06kXgXguRPxKyPhSA1l9Mw/CXrZpcupzwQrtjV+ttTgDBVDbqFZyYz6tmMEWUoqdrcuK9JqVw=
X-Received: by 2002:a05:6122:d0c:b0:52a:c0db:29e3 with SMTP id
 71dfb90a1353d-52c37adcb5bmr4445788e0c.10.1746708384263; Thu, 08 May 2025
 05:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250508112618.875786933@linuxfoundation.org>
In-Reply-To: <20250508112618.875786933@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 May 2025 18:16:12 +0530
X-Gm-Features: AX0GCFv8JbrdwShAXY5M9k1TMxLoslym5xx2qqXHrMOUjCEEzcClWt3y2dmQbkc
Message-ID: <CA+G9fYsKqxUExVW1rEhU8_5pYOuhkzXyeL9TmTyGVsV2-C-PFQ@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/129] 6.6.90-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054628_860093_FC1E427D 
X-CRM114-Status: GOOD (  17.62  )
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

On Thu, 8 May 2025 at 17:00, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.90 release.
> There are 129 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 10 May 2025 11:25:47 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.90-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on riscv with allyesconfig and allmodconfig builds failed with
clang-20 and gcc-13 toolchain on the stable-rc 6.6.90-rc1 and 6.6.90-rc2

* riscv, build
  - clang-20-allmodconfig
  - gcc-13-allmodconfig
  - gcc-13-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv uprobes.c unused variable 'start'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error riscv
arch/riscv/kernel/probes/uprobes.c: In function 'arch_uprobe_copy_ixol':
arch/riscv/kernel/probes/uprobes.c:170:23: error: unused variable
'start' [-Werror=unused-variable]
  170 |         unsigned long start = (unsigned long)dst;
      |                       ^~~~~
cc1: all warnings being treated as errors

## Build riscv
* Build log:  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2woO9vttziZGlSKcBdoVu2LZm8Q/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2woO9vttziZGlSKcBdoVu2LZm8Q/config
* Toolchain: gcc-13 and clang-20

## Steps to reproduce
 -  tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig allmodconfig

## Build
* kernel: 6.6.90-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: a7b3b5860e08c3b29b4a004562b9691d7c25a2f3
* git describe: v6.6.89-130-ga7b3b5860e08
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08

## Test Regressions (compared to v6.6.87-586-gda7333f263c3)

* riscv, build
  - clang-20-allmodconfig
  - gcc-13-allmodconfig
  - gcc-13-allyesconfig

## Metric Regressions (compared to v6.6.87-586-gda7333f263c3)

## Test Fixes (compared to v6.6.87-586-gda7333f263c3)

## Metric Fixes (compared to v6.6.87-586-gda7333f263c3)

## Test result summary
total: 112131, pass: 91642, fail: 4421, skip: 15654, xfail: 414

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 129 passed, 0 failed
* arm64: 44 total, 44 passed, 0 failed
* i386: 27 total, 20 passed, 7 failed
* mips: 26 total, 22 passed, 4 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 20 total, 17 passed, 3 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* riscv: 37 total, 33 passed, 4 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-efivarfs
* kselftest-exec
* kselftest-fpu
* kselftest-ftrace
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-livepatch
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-tc-testing
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* kvm-unit-tests
* lava
* libgpiod
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
