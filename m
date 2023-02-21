Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C4C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V2X/B+rWFmDQvpd5ucolYB5GEUbaeT5bFJkCuz7gYo0=; b=T/cvXIQtc35G+/
	RBmVYqaXty0D/JJ+QjRROsbiOBF16ACa0YcBXh3T8M76kO2n+oWD1slebiSLoClr2UP2T+t2vxYZM
	QCgwShgu+cp3lWvQa1LhxdZkruCW60ywcr8v1scrVTl8Bfp7tMBBF1B1CnKd3jYocseJOeGJIwic7
	fF+xcZRxWEPHv21JE1ss00mC3Hm+AbhewFkEIue0Ltq3T6JD6wfRQhLRQpc3rS3nLwjeIWFcQG3CX
	KCwJrGPs+lh+76kzZEAub5QhfaEDr1xxpswq+prw5Y55s8prQlVFc5omMLba++bhkMyi2psTXRjLI
	tPS9IJDqGQvzh78AvSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOVp-00774t-40; Tue, 21 Feb 2023 09:00:37 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOVm-00773n-0r
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 09:00:35 +0000
Received: by mail-vs1-xe35.google.com with SMTP id 6so3723954vsv.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 01:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676970028;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snrQn0Tlo0gQ0uyxV6hinZ9sS9jKVp6Wr9FYbxThYg0=;
        b=Ihnac5gfGHfOeKIQ6rEZ747/YTP2w/waPucMxpymT9yMA4q5aG/5WwANfn3AIGnxSG
         L0TBbDRH1Iz1xP3I2Ip0KkjxjJ3TmsoeCBstrVs6DtpCf9VeCxhNr3fjIjkVf8N7E6Z+
         rrnCykcs5UxfoLJ6+ljrRqGjd4nWN0g4klu6u3heskV2b1v4BQoiV9aDetD5y2YR2H8U
         eI9cBVXZeCi4Kb/JLeCv3OwstOTqNN6vg5zKFyxS1ibf+2cAiWLRb5aVi4Nud3aFPhKm
         ZwU74tNe2xcAlRVdDtyd4xCwRqrRbKLE9yN9ftJ6F3FegpXAU3Tk0vDR0mCeNIyR9Jyn
         /h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676970028;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snrQn0Tlo0gQ0uyxV6hinZ9sS9jKVp6Wr9FYbxThYg0=;
        b=0rwpRO14VEGvgSo8v8ErpuieiASm9BWESwBZIUx+jel+pvgI5JqqPMm37Uc4VEeXkv
         H7brjWaelm4EAviEHWDpgoeKTscGmnp69VJoEme/nDO6DlmnNIm9QM0pFki/cI4oEfmc
         0IjgBiANHSE5ZnFiZCy+m3zyf6EDWzbk046wF7uAX2kS0thjaEGUSq7eVkYx2JTSNy4O
         Ntb6GH0AWHJny0DVFnBdM5Sp/G36H1wtPlRVTZpL8hFSXnUmH9PzruFBC4FgzCf8HU5Y
         vDY0V9XgvULHqsWMO4/tl3RA9b0AL3lcj1hyecwxa+zPWce8wRjloZNeqsjSOA1K69cC
         PwBA==
X-Gm-Message-State: AO0yUKUb6PljnKOp0RFtGeDSP8eKtSMYvqFdhpY+k/YcYMWaoSeR+BQz
	JAhAjDWn89bZthB2BprCLqCTucsliT39f2xU7uyBb/xXatue+IK+
X-Google-Smtp-Source: AK7set+3kFO9Mj/lchoJZ/OJccFPwKQD+LlOMwYfhMHf93Wr+N7ICLxTR5wKhJAMLAVWhex11pcwB4yjBiMiNk5Me/4=
X-Received: by 2002:a05:6102:a24:b0:41e:991d:8814 with SMTP id
 4-20020a0561020a2400b0041e991d8814mr134187vsb.71.1676970028117; Tue, 21 Feb
 2023 01:00:28 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 Feb 2023 14:30:17 +0530
Message-ID: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
Subject: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
To: llvm@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, conor@kernel.org, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_010034_142906_6BCBFCFB 
X-CRM114-Status: UNSURE (   3.99  )
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

The riscv defconfig and tinyconfig builds failed with clang-nightly
due to below build warnings / errors on latest stable-rc 5.10.

Regression on riscv:
  - build/clang-nightly-tinyconfig - FAILED
  - build/clang-nightly-defconfig - FAILED

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
-----
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
  git_sha: 7d11e4c4fc56eb25c5b41da93748dbcf21956316
  git_short_log: 7d11e4c4fc56 ("Linux 5.10.169-rc1")
  git_describe: v5.10.168-58-g7d11e4c4fc56

Build log:
----
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=riscv
CROSS_COMPILE=riscv64-linux-gnu- HOSTCC=clang CC=clang LLVM=1
LLVM_IAS=1 LD=riscv64-linux-gnu-ld
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/version.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/do_mounts.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/noinitramfs.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/calibrate.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'

Build details,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tinyconfig/details/

Build history,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-ga96fb51aec5a/testrun/14866489/suite/build/test/clang-nightly-defconfig/details/

https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tinyconfig/history/

steps to reproduce:
-----------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch riscv --toolchain
clang-nightly --kconfig tinyconfig LLVM=1 LLVM_IAS=1
LD=riscv64-linux-gnu-ld

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
