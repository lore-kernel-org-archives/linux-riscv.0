Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC786C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B+hhUAH62Q0HZh04dRFOwzixiHRTQO4Q+TSez8kf3w4=; b=G+ZaCDH6QhVfwp
	Jj5BdBzGJ3eYm//WXIZ3D3FKMISyjJsCgnWSCiIsw0LNUeKCfqnzbbRA4E5lCZZRZ0wsxKETL1vKQ
	Y6AD1O23M5pTRS5llRN2wopzxUH5ATEYWHbB2ifdJsTtwPDVmpO/OHPR3I+2QqiEBKmfGgizaa8AS
	gDLFz89bfpBfmAbOnBDynE0Lp8a52s/Zz09wo3qnIpWfBs4BXQJEGb6Oh4ELGjUKQii29xbN4IknT
	jKSc/oM+dVSw2tuhvwvNO4pVGD9oQBYc+INBtHuz2UV7IZic1IoKWWJ0FqYvkBz2aNKb6Tyj+6rf1
	7cuh7p3JYoBAo40MnLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbJUF-00EK7s-TD; Mon, 04 Apr 2022 09:59:03 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbJU6-00EJzy-ST
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 09:58:56 +0000
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e5e31c34bfso92428307b3.10
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
 b=ax8AZ1pm4ofTW+s0FnLRVMNYlqHoNDED5O0kTeYCr19DQHGTWUrgy54PtSPmwsxEr0
 CugW/TfIWmE5ZrEaHDHmkXvKL/KlXAbkXRbaq1h6hvgSS4zIGu/ugQjHbhlRQcc+qXYK
 JiTr2Yr4m2w4C87NSpvzhpLhe+tX875Fhog4L0K398FAbtph3dAs1+29F7HViZ8llf4/
 SNoYtYW7EoQudSJ8Et6LSW6s+fVN19jj6y+TVk7j4+CNHNQ5iesSEG9igyq3uggL7Hhq
 yYglHofcVo2rkMaDar9g6lsNEgI1UEvgnviQKcb2hSn88aGKvntd9MJS6iGDXtpFuEc6
 F7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
 b=NZnUy0DzwOHiHt084cgUxFD6DRSLgWQ0Wagidq/41K1nBiezoXWAWp7p6hRfV2PJpN
 JVdrh5w7qx2T7vyMVBMVRWSWhgYAoZcpt3cVtO1Kf8ZWOC3UBxg3gPaV4Yql1L4BdjFk
 A+7ppSO1Or9cnQWpCIchrZt7ju57PvG+VDNjmUuaoq312+4vIfUMM/DjZqxswumPDqkf
 4fJr4XSSD1Ja57DxBYaNac1+OTah5kIor4IWp3kkuJNdsNOjyU0GpSV38fpMVDTCSow1
 tr4k1XlOkTHXQLK6xirNNNMXA5OD3k5mx5aNeDYhBrp0ISsksjunq29ZkW/hpn7gg3Pq
 qZBg==
X-Gm-Message-State: AOAM530YFKlouB6bGNIqSXBbn81AuE90WSPxy11qXWGvPY3bb/a+PMvo
 PmEDZHUekiNEfkCsYlpKS1OVSJcyzExcwgJokj3nsQpk/hMjeltw
X-Google-Smtp-Source: ABdhPJyFL3cKn7V7sre/I6PQA8Oqq4hzE7C9nhhnTPXZUCObFfK1+FNV4saECxlTNxJ/XzfZ+W6EaQDzGSl+ASXQgsw=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr13812616ywf.36.1649066332945; Mon, 04
 Apr 2022 02:58:52 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Apr 2022 15:28:41 +0530
Message-ID: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
Subject: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_025855_031131_C4FACF1D 
X-CRM114-Status: UNSURE (   5.26  )
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

Linux next-20220404 riscv defconfig builds failed.

Regressions found on riscv:
   - riscv-riscv-clang-14-defconfig
   - riscv-riscv-gcc-10-defconfig
   - riscv-riscv-clang-13-defconfig
   - riscv-riscv-clang-12-defconfig
   - riscv-riscv-clang-11-defconfig
   - riscv-riscv-gcc-11-defconfig
   - riscv-riscv-gcc-8-defconfig
   - riscv-riscv-gcc-9-defconfig
   - riscv-riscv-clang-nightly-defconfig


arch/riscv/kernel/compat_signal.c:7:10: fatal error:
linux/tracehook.h: No such file or directory
  7 | #include <linux/tracehook.h>
    |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.build:289:
arch/riscv/kernel/compat_signal.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
    git_describe: next-20220404
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 696206280c5e5c028caf9fd259999cb72b1f6127
    kconfig: defconfig
    target_arch: riscv
    toolchain: gcc-11

steps to reproduce:
  # To install tuxmake on your system globally:
  # sudo pip3 install -U tuxmake
  #

  tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org


[1]  https://builds.tuxbuild.com/27JdBBUbSHIhFJ9Wsq3Z6ssitb6/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
