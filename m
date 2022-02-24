Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEFC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HhkSvGMFFrijv5BiwK4q10Mse6tBRKxZkvgZiyItQyE=; b=C0cQVrhsJaCVUc
	q17RSD50qv0mR7GZib4dbqL3XFeDYBMrzfa2kGEvDb+9T86C76w9vvw5P24eaufN5ck+MSnC3Q9xF
	DQeo+1JpgSoAwKHSYnjjpISMFbMsOzLEpkTqI08KopwKWgej0dbAbCe3VzHZ7AdseY9M/vj6P2NS2
	WuLLRoAHScuwnisZMebvU1H8C5dU1aYWA7dmGj1qiasZ6ogVp2MUiSlIyUHGpXDPgXVIcjxjTBCWj
	1gQDIIZ8KM+hYFx0GLZ/Je/v3nzb2yiY4odpnLT8SmcYcD/leMJYI9omYDrRsBYkUNHoU0lQGNBSt
	gqIautLJ14LLRk7Ze45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNF1i-0016uH-ET; Thu, 24 Feb 2022 14:23:26 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNF1e-0016tC-CY
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 14:23:25 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d6923bca1aso26786957b3.9
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GVCRdf20z2if/WXkRWAWqNzxqWMrdd3fec2HBGui9Y4=;
 b=vpT0MGtjheNDD9UYyeQ9IF6ps2q6c5IYS7+YVX48yc4tWpxLckATwez9vl/fmKvKOu
 Un5tTk7mFMOKmEWwBimuEknvcP6F2sB3NkCGOVULWA773CqcI2y5x05UrJOEey09Y1Qe
 OJShbXk5oyDvWqTq2i9Ka5PCylSOR65FEwGo+hLe7OBJJig283XCAj/gVM7L7OOgVVkt
 XNRb/aPlYGIrf3l6nSI8wk/DbPGeeiUIuLdESZg34GXkZggbWQM6xlBatPy6Dy+uJnjp
 QWqq5zGiDQokTk0lCmwIrW6YT4xsP5OmXZCfFSVzLpNS4fCcMsnPPNCUwqQQerPw/0V7
 QxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GVCRdf20z2if/WXkRWAWqNzxqWMrdd3fec2HBGui9Y4=;
 b=c09dcLmbTolowoLFPqiblSJl1loPFortcBZR5AdntD1IAL1BGNrcgJYbtNW2B00aF2
 kxRoxBOTHVYDpD9hUM552uDBDAAWUaD17Q1UIvh5Kz3G6AfptYix/U0g9YmKAZ12B+Ok
 LA+b6pc9EqNQX5jE4z7+mS0sJax1C1wBLl0jV3qgRrHKyPFkN+4rFe7Z/osmAzM52Yeb
 wtJIekwKWUlzo7cZKwgT4yUZf5c+8bU0DSrVAqCuqh4VEfOIWwQ2vkbzxeNA0H1fSBJv
 /UauL8tRcB4bqBQnfr0irO1oX4K85gZTtt4vWHNzbTNFBTmr+3RHOyHmC4hyzG0T0NrM
 yFnQ==
X-Gm-Message-State: AOAM530oHF0xGJPO+dGe0brwyUKfs2+47vRatePmGCI/z1JVmdN6yqL5
 CzfScPCbdqzxr9sqhTbASTPYvfmqfLJmrOltQ/AFqA==
X-Google-Smtp-Source: ABdhPJy/5/6AxH9eFRdpjQp6L9u+IiFuFnYk1TdAAYF24CLqBAoWxW4orYo4f65bn53WsTGYXwmnMlZI0suLijbIyQ4=
X-Received: by 2002:a81:7812:0:b0:2d0:8c2c:5159 with SMTP id
 t18-20020a817812000000b002d08c2c5159mr2626955ywc.120.1645712600221; Thu, 24
 Feb 2022 06:23:20 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Feb 2022 19:53:09 +0530
Message-ID: <CA+G9fYuhipgPsHetpvBmD4GO7KGfhSRRAAgN2ZnoFUWiCKMy6Q@mail.gmail.com>
Subject: [next] riscv/kernel/vdso.c:123:27: error: 'next' undeclared
To: open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Tong Tiangen <tongtiangen@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jisheng Zhang <jszhang@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 lkft-triage@lists.linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_062322_479199_ACDCFC1F 
X-CRM114-Status: UNSURE (   8.64  )
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

[Please ignore this email if it is already reported]

Linux next-20220223 arch riscv builds failed due to following errors.
Build configs:
  - riscv-gcc-9-defconfig
  - riscv-gcc-9-defconfig
  - riscv-gcc-10-defconfig
  - riscv-gcc-11-defconfig

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: d4a0ae62a277377de396850ed4b709b6bd9b7326
  git_describe: next-20220223
  arch: riscv
  toolchain: gcc-11

Build error:
-----------
In file included from arch/riscv/kernel/vdso.c:10:
arch/riscv/kernel/vdso.c: In function 'vdso_join_timens':
arch/riscv/kernel/vdso.c:123:27: error: 'next' undeclared (first use
in this function); did you mean 'net'?
  123 |         for_each_vma(vmi, next) {
      |                           ^~~~
include/linux/mm.h:685:49: note: in definition of macro 'for_each_vma'
  685 | #define for_each_vma(vmi, vma)          while ((vma =
vma_next(&(vmi))) != NULL)
      |                                                 ^~~
arch/riscv/kernel/vdso.c:123:27: note: each undeclared identifier is
reported only once for each function it appears in
  123 |         for_each_vma(vmi, next) {
      |                           ^~~~
include/linux/mm.h:685:49: note: in definition of macro 'for_each_vma'
  685 | #define for_each_vma(vmi, vma)          while ((vma =
vma_next(&(vmi))) != NULL)
      |                                                 ^~~
make[3]: *** [scripts/Makefile.build:288: arch/riscv/kernel/vdso.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:614: arch/riscv/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1971: arch/riscv] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/25XO99nwfQgKrWKz4yfBPYw0wyU/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
