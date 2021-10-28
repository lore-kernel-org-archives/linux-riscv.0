Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DEDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D559A60527
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D559A60527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TBQjpyoA0Y3DQwxRoITVqZyPYSRslSGflmgHE/ClwCk=; b=UhqSL7bgTnlu7k
	0WTvVF4gRuzRwQElsAkpeCsx8xulbXVuxQUIrrLyu2YHjmg/DEVIbq0reAkyEzcnO2wgLZsuPZGav
	E1QRcnWErOFw27cHR3VdVUmEO0cyJNwCEOJuBIvg/vD89s4VmqvYpfrOeiOy19XTd6AdKMSEXmBW7
	JAT0inmm11EP7wIf36IVkd/VBF6Wmdtg4A5SJgLIL9WNlwsGS33qi6ErusMFn+iQstSv228hwne0Z
	K2ElZ8DmFY3QjbFXGZB/AYhb/iM4DlM1Bx7aOW1akbho9BIkVgyzf6xuR7DPWZPIzAmq04KSge1b+
	c/d48B82tmdcsN9QsjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5tF-0081Dh-Pi; Thu, 28 Oct 2021 13:56:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg5tC-0081Ce-FP
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 13:56:19 +0000
Received: by mail-ed1-x534.google.com with SMTP id r4so24632223edi.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WSTbLQavJNJbT4+PxFGX9NBSygatu7Mx2BWU1M2IA2U=;
 b=U++kpKdE+2a6HUWZiDL/odN4hCBdt3L+qULt3hHPa/2P6zCxdca9gqn2cM3gRKwagi
 chgn50EDLkUleTLN0fUwcSIxigQI50idixTeOrkl94/LDeFHMyuqZZQyVHb1Ko6CyKs7
 o3Gpr9QhKRStzhAFFoxxKt1s2uE/GP73DnLWtjByQGKIuE2+4Ipb44R1RgVKqrqRVQAD
 WDDZ+e2ixnLHfyvHh+6DfS3TI/aZfGpo+oK6+9/IKWE2+VnelKtmB1zqt7G+LdUEOJrV
 ZkSvz6hxm/awWMTifrNYi/wrQ/k3b7Wr1ISOdhX7f24VMXaquxFTUd+TOu5Wr3yrqI/h
 rBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WSTbLQavJNJbT4+PxFGX9NBSygatu7Mx2BWU1M2IA2U=;
 b=3joHbMrLs5I4DOAICbuSapbgcz3ufUdC2L7zn0yetCgM1C7mbP52iuJHNSqFRV+680
 k2daUx9/2LLJooFED27PGBVRqfkjKYEeoXmBwnUI0NNISciK8m3ShPOoxaztkTD5umf4
 rFp1BNJHz5B5Y+WrC6T5pF1zHLCZciNFQHwOihKSV+uLbEsKXHUNWnjF8vewflF1KX4G
 taTI/QIblU27wZOReeefZh+5tRZJSnIcBQ6663AiDWGO74Gkkw5DH0AOvCY3KlCXNwmQ
 wVUFTd33/VAVo9d5WSsAzCPECmKM3nMtyEtsa3QP3Z+xYTJfrqkBN0SGvBfmw01MED3e
 /qwA==
X-Gm-Message-State: AOAM531W7z9Mmd85yhDEyNmy6cW08FV5n5menS2TKOipH4HdNrfW2RN2
 1pnCCdrdgz1mTJbqw3KNwuZOenb3NIN0tUDkpsY4WvZOLvyI+A==
X-Google-Smtp-Source: ABdhPJzv7K5ZsTrqrtIRGOqtedD4ahyQ77vmK32yoFXb3w63Si5JEFI12AyJy2mm97F+JWBeShvcXI/WHjJoEvltq7s=
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr6182196edd.103.1635429375474; 
 Thu, 28 Oct 2021 06:56:15 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Oct 2021 19:26:04 +0530
Message-ID: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
Subject: riscv: delay.c:77:17: error: implicit declaration of function
 'cpu_relax' [-Werror=implicit-function-declaration]
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_065618_545798_4F4492CF 
X-CRM114-Status: UNSURE (   4.72  )
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

Regression found on riscv gcc-11 built with defconfig
Following build warnings / errors reported on linux next 20211028.

metadata:
    git_describe: next-20211028
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 503f375baa99 (\"Add linux-next specific files for 20211028\")
    target_arch: riscv
    toolchain: gcc-11

build error :
--------------
/builds/linux/arch/riscv/lib/delay.c: In function '__delay':
/builds/linux/arch/riscv/lib/delay.c:77:17: error: implicit
declaration of function 'cpu_relax'
[-Werror=implicit-function-declaration]
   77 |                 cpu_relax();
      |                 ^~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [/builds/linux/scripts/Makefile.build:288:
arch/riscv/lib/delay.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/208R1uE0CO13gO5XbrrWlqwau7r/build.log

build config:
-------------
https://builds.tuxbuild.com/208R1uE0CO13gO5XbrrWlqwau7r/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
