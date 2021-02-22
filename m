Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71603C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 17:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD6A64D9C
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 17:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD6A64D9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lp2ctCRUynRoVxA/9Yd/ZeS4NM9ltFLX5lHgO3blIIo=; b=jz+COE6l87DaSsYyr8rkYROl1z
	QFDs0iK0lu13jT2eU4sb1lRL3RuyRgv+IBNMYe1nvsCd87bPR+BxZyZ6WP6ARpPWQmA78t03JPkeC
	JSFY8L/s13Wst0SQ/r6+Cn4jxamaWN6dMqsm2uy38kp/4y2S78s/ZYilJOBSAnJekt/LdJyvaaW+g
	oP7CAwQ95Tx/cu/S8WG6qun6McUvlFqYkkLX+1O5cv2YHl1gpX7R/5qP1aizbR10QtWfOW4JwoHqZ
	xjR2OYVcV4hPB3daV2K50y1XC+gYlYaEcUoIpfcVXWZEqVWcueGpHyGK51FhPy3bmCmTKBmF3HwxX
	cV9mZfzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEFJW-0007iE-0k; Mon, 22 Feb 2021 17:48:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEFJS-0007he-Uk
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 17:48:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id do6so30804771ejc.3
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 09:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fyP7UwKRMN2zq6eNmDTOnJj19G4PIaEbS9WKm7ZygBE=;
 b=PUrINC2SBWq6oLLobOQEgSd5bYjPLN+TttmGuyDxk7mUSCKdaGtum3Bi4TqRO/a+jb
 q2NgYvr80nLicSi0SY2Bm+IJaMvs8io4+QEyMaX1raFxzKrPP7n3UF2l3SgKyblD5w4f
 +jAI+NJzhkTKcy8QZNUTA/HEoZG8yH1Gg1MgnPTt297iQoP+U03RLlIdSQ9cEQOL9+yd
 7fky7ML1RSDuETwD7ZV3YOKS00EB61QH6gRp3klTDET214akipsx+Zdezt716PCdo/kF
 iOpoJNTLOiu83r3Yz0ZAM6bKYr78G42fPLqd/tWfhJyGz1Ii8pdnqsNQvRvwjfGDbQZF
 6v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fyP7UwKRMN2zq6eNmDTOnJj19G4PIaEbS9WKm7ZygBE=;
 b=XMFnV5G/pbhOLw8tWnbYtYPShXBQjui+jGpgHaDaewg/CtRSiZWBLEAgLsE1XsDvy8
 QfB5oUp6xRgUKXEoAnR8/39FgUAcgZuHQbQJab2K62gcOGjPp8gcBVVJgSDSLQK2vYhs
 CIu9afCXNc3dDttiftXn8stayZHh7v/pFVxw6BJIXKnqLJP70k5nRErKxaIb/k8RNXK5
 SWjtrHJs68sM1//vhe5XwPwOCS19cLbicBS9UWoxncxBvu+ZYEW9kqf6iKVhMoF0eYLe
 Bg7tYO08Mb5Ch2/0tHdGJ/2mwb+viw16jDedVOKol0I/Qb69OCO+JZ71htY45Rcm+usR
 KlLg==
X-Gm-Message-State: AOAM532JoQVPYD5jvpLwPMDHfOdkNs3txsb9JU7jt+6It+UQbXGdFeFj
 RqZ9F8DogEORswm553W5nghh08iGumiMDBV+QQ5XVGXCO08r7eKs
X-Google-Smtp-Source: ABdhPJyyV2miN2e5V+Rf7k3+ZmPpPyEilWYcd0JDgLzCgVsL2QNBLJ0aDsCiJ9oUCgCOSwjEAHhgmzWbIhVZy15DIzE=
X-Received: by 2002:a17:906:444d:: with SMTP id
 i13mr21382620ejp.170.1614016077640; 
 Mon, 22 Feb 2021 09:47:57 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 22 Feb 2021 23:17:46 +0530
Message-ID: <CA+G9fYtXHHfLEd7+v05gG=1uMqWskTPof-4mrCnZ=xWZNgfZ7w@mail.gmail.com>
Subject: riscv: sbi.h:150:1: error: no return statement in function returning
 non-void [-Werror=return-type]
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_124803_150123_B700371D 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Following riscv tiny and allnoconfig build failed on linux next 20210222 tag
  - riscv (tinyconfig) with gcc-8, gcc-9 and gcc-10
  - riscv (allnoconfig) with gcc-8, gcc-9 and gcc-10

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=riscv
CROSS_COMPILE=riscv64-linux-gnu- 'CC=sccache riscv64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from arch/riscv/kernel/setup.c:29:
arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
arch/riscv/include/asm/sbi.h:150:1: error: no return statement in
function returning non-void [-Werror=return-type]
  150 | static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
      | ^~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:287: arch/riscv/kernel/setup.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

step to reproduce:
------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch riscv --toolchain gcc-9
--kconfig tinyconfig

build log,
https://builds.tuxbuild.com/1opbLmoztDBhgUOMidDILjVsQys/

-- 
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
