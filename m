Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FBC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiEDfPvEGwNQtktEM3P3mhJlaQh0WVycCO5Wc+yCvuY=; b=JU/56BSdXLfoyc
	AFmWc9jB3/HNa6yFgUnWSjlLWTTxy6vgoVci+VS1OKeNEtaIm7jyEmIjAcnzBYxG3NA0KQy0f/PEG
	Iw2f1IOn8UUzVziAQ/5o0sPVpQxTUbEc2wb+SzhZH290IcGMWGLhr1W86GrZ1hoCTvrT70xni2UcK
	462OutjUSi1z1Q2EzpXnPfAXK9iCKvF3WEbTriRA3RlccvfO46nSnsT4ni3JBH3A0nimyfjF+J+qa
	vU183G27RpjnTam50CVFkPC/EoCohCRgeAvWuT8S6Tfk8/bmnuSWL9g11J6joOCceT20jiNinVhyl
	zSHyYJmlfvUG4AUFmeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTraA-00000004GFW-3byf;
	Tue, 24 Jun 2025 00:32:15 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlyF-00000003h5m-3Lzj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 18:32:45 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-313a188174fso3497515a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750703563; x=1751308363; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=l03iKb6aV7N9Y8L7ua4uaCGy3iSYFe9yw0RWgOK+60n10Rpp3YEfFUlGX5uV+LSO7n
         Sgalz/1Xyd+bmehB252av+OfOgViM6L/ttNkRKlxP+s09edncSyW0Biyol9iurpBqK90
         fg0pxtHogE6i/MYjCX4uNp4FU7TYu/U9Lg/b8GE6sFptrhqXlxnMUiGfVISPPRmCMMid
         mVnj2CFpEzpqmPU/JTyCzXKqKDlqLT0NJ0ycU4KwXcO3ZGuF57W6TQE2w15FhMnoflCA
         TG2hFF2QWOx6pVawr+GYxVvlVoII34jcqboU8Pw9adCTIrD78+S97sc5ANGwwpI5R9vE
         9udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703563; x=1751308363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=ncoSsZUh7Xk9b5qqgdMrGb7SaOzX2ZdX4TxPULAx33k6wqTuQ9NnPzxAEL6Nznas/Z
         nUtEbAZjnbC/cf48URT1rLitC+rrnHKsZXoKoH+DtLcnKGwtH8U0jnOwol4ILkdyjzFb
         4t8HnVUApXmBoDATebHysAoCDrCaecRzCnfR2beAHQoZYstYoOrj4sjvM5MH2kZXX2+k
         QFfD2Fgg5B1ZmoH4rlqxZ7hekuEyY1rCMI2/B0FPvs+ZRS7YCbYW2KEOvlDZxkV1cMMj
         R3VneBUfUF5p016bn6/2/UmJcwGSWxKBZ8jzsyPLap0EpyQBl1Se2gTMEv55WeFgyUVV
         Jy7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWekX/wYzu67WhTeifNozxkTJ5AXuxLX73J4/UEtLmAnw3PGM5ECRCaG4vZnC5Q9R8PYywtH8Dzc4Ivnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjiyuADYDGp1+F0mx9Otwbsz4ONPmXI4NogdVOM+T7pjeW+qnu
	zzcoh2mUJKcJKUvzLrb6a4+xzq6YOhr5tg0L5xTUmjousn+YTkk0Z5qZ1MMRj2cIaEw/w26Mi4v
	XwWAPpDLnb+KSGUcY4f90To8Ag/BqMRCfogECDe8F/A==
X-Gm-Gg: ASbGncty1bIxqWlTPXe92zXMuxmVQFf6YnbU01cgMm/E9CmW/djS4Mw4r0DeaGv/Bid
	HpcMYo2UGNmqVnzXZJsJ0r/34MVpupwsErY0PPk5RdScNiwRAUeIp6I8mKdfPnfmotGweNZfYGj
	zGOcMRNk9Cvnsg/AVKBg7kHP22/z+5IX2KFb8v8VEIOItVShpakzkpjkfel5bmsEivl9BpHM14m
	jHJ
X-Google-Smtp-Source: AGHT+IFN+MuBxJ+QUL+UQe2hu7b0+Ppkb80MQX/ZVfwxCOW2lGiDat39qnGph06M7YMdl+YKMYdCUOnoxk8zPjTW19g=
X-Received: by 2002:a17:90b:4fd0:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-315ccc48857mr832647a91.1.1750703562413; Mon, 23 Jun 2025
 11:32:42 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 00:02:29 +0530
X-Gm-Features: Ac12FXz8Xagh8-R9UdOPbyOpKzegWYcA5INp1WSEVpTVF86rd3gJifht0qGqOmw
Message-ID: <CA+G9fYv2i5AOYOkepUq_Rz1wxfzu1o2W59xDgui7VPw7g-fV9w@mail.gmail.com>
Subject: next-20250623: riscv defconfig raid6 recov_rvv.c use of undeclared
 identifier 'raid6_empty_zero_page'
To: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-raid@vger.kernel.org
Cc: Song Liu <song@kernel.org>, yukuai3@huawei.com, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_113243_854905_34D6E0A3 
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

Regressions on riscv defconfig builds with gcc-13 and clang failed
on the Linux next-20250623 tag.

Regressions found on riscv
* riscv, build
  - clang-20-defconfig
  - gcc-13-defconfig
  - rustclang-nightly-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest
  - rv32-clang-20-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv defconfig raid6 recov_rvv.c use of undeclared
identifier 'raid6_empty_zero_page'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
lib/raid6/recov_rvv.c:168:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  168 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:171:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  171 |         ptrs[failb] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:206:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  206 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
3 errors generated.

## Source
* Kernel version: 6.16.0-rc3-next-20250623
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
* Git describe: next-20250623
* Project details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/
* Architectures: riscv
* Toolchains: gcc-13
* Kconfigs: defconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28829977/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/build/gcc-13-defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/config

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
