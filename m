Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26895C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 16:06:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC074601FF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 16:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC074601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:CC:Message-ID:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3UDnZD6ye+0wMFd/A0wmiVAm/esSAKeYFzNzhHTDHA=; b=5AnGzSIXGM8fIU
	cDrxBjiXQw36C7kmPmUwSYAXwiXeWCtvIOQiCL92mNQweFmZT2C1nduYKc8SXVZv40H5iuCqwUwv+
	gQm0YP4QzOqNN6tCanil7ResthYvfsDzs/xZjZN1ZC2oP0HZnpIaaMkoIPYpLILgw0AyAzW9RSS24
	vcy4EPEYBP4b1hfzp1iOxfFqmjQz+eukW0K3FQGfoDTO2gjku+o0XfcfJljsp09phRG1rUwMW0lxw
	MmYXxk+bNmzvCsVPwmhCuJ6MsbksOa5rxKyNgyNSCYIJ7lz1UME7BHKYimqiMMZfnZQZN3zxvRU3u
	ppLuNMokJMVd7Se0oQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgqrb-00DEqG-6O; Sat, 30 Oct 2021 16:05:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgqrX-00DEpa-Pr
 for linux-riscv@lists.infradead.org; Sat, 30 Oct 2021 16:05:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id oa4so9319241pjb.2
 for <linux-riscv@lists.infradead.org>; Sat, 30 Oct 2021 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:message-id:cc:from:to;
 bh=6VwdY920IT0wmuMCZoXGOCvpa/shHqhuGOaRMVKSK/g=;
 b=rAoO6wAtROQh0CGD4m9G4K7cCR70fw8f2+OXWDCxFNk0Z6pXlHmErnmY7N9/5gXOaH
 wjEY+f6v7Bh8ir8fbdw2+WILDBHVLn1+Pf22VETKlBGTG9KduFfkDo30TXqd3Au2JSOc
 VtShTgTkTZs/6Jyzz1gr5fmI19OG0j/tdxYWDJJbStwGkiombChsquXNHwM2zza3Xg8m
 dAHq8thrEJ/vjueXVfl9pqnhtxxPoNBX1IvjXylVYJb8pVd4iHlEqiDCYbTNWWZNWRv9
 dCnEyLd74l7sS+UKN1TBC+yQQxdAtF1VaehW2qzIDXJ2vRq7b95dcPyT8KZC/qU3xTtr
 Tjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:message-id:cc:from:to;
 bh=6VwdY920IT0wmuMCZoXGOCvpa/shHqhuGOaRMVKSK/g=;
 b=c5U5B2rhF59es4H9mp5cLYiB+SC2Xut3CVpz7BjQQU6aPelDtumCPzpnZTr2eJPcPq
 fLRctKhvXHC2yvNzHbi689jcRsOp+xU0BQMFU47e9Du55ilSfgudN9gk+uvUXSd+Ry/F
 tiPQqW7r6lnnOD6IhhjdtauULZSrlAb6p531vjEvbcWpGb7EPtd4vT48yFOTqZ5U/ZE3
 AMt83LBmAmcAKAzAumgsfnub7PQCcIqq8SJWRY1A2M59GxL2gw97KTrwXl1R8Eyls/5w
 Do2iBi3WdNbT/henehA9LFC8nozqFOXkvjgfZ4Gqrc1ZXN9aPY/+53HSh+CTHau10WfA
 pF5Q==
X-Gm-Message-State: AOAM530oSyVk45ZF2yO1uwPP5sCj2lUTxFJPXniUOHUeVbkRPtswSgaL
 lbgTJhTcdYQ55FrF5yZVP4/bFA==
X-Google-Smtp-Source: ABdhPJxVqTLHMZANaoRY1Xt8kG25qX7Ff5XydcgriVC51+IzCFGJ9KjKfox5gKkr/hwv7k9pZ+cAhw==
X-Received: by 2002:a17:90b:1a87:: with SMTP id
 ng7mr944834pjb.230.1635609942038; 
 Sat, 30 Oct 2021 09:05:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id nv5sm9513337pjb.10.2021.10.30.09.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 09:05:40 -0700 (PDT)
Date: Sat, 30 Oct 2021 09:05:40 -0700 (PDT)
X-Google-Original-Date: Sat, 30 Oct 2021 09:04:54 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.15 (or -rc8)
Message-ID: <mhng-5efadc14-a2c3-4c9d-a383-8ecb782399e7@penguin>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_090543_908069_6B578F30 
X-CRM114-Status: UNSURE (   9.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3ef6ca4f354c53abf263cbeb51e7272523c294d8:

  checksyscalls: Unconditionally ignore fstat{,at}64 (2021-10-07 17:16:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-rc8

for you to fetch changes up to 54c5639d8f507ebefa814f574cb6f763033a72a5:

  riscv: Fix asan-stack clang build (2021-10-29 08:54:50 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.15 (or -rc8)

* A fix to ensure the trap vector's address is aligned.
* A fix to avoid re-populating the KASAN shadow memory.
* A fix to allow kasan to build without warnings, which have recently
  become errors.

----------------------------------------------------------------
I know these are pretty late, but they do fix concrete issues.  It's not a big
deal if they don't make it for 5.15, as it's very likely they end up on stable
either way.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Do not re-populate shadow memory with kasan_populate_early_shadow
      riscv: Fix asan-stack clang build

Chen Lu (1):
      riscv: fix misalgned trap vector base address

 arch/riscv/Kconfig             |  6 ++++++
 arch/riscv/include/asm/kasan.h |  3 +--
 arch/riscv/kernel/head.S       |  1 +
 arch/riscv/mm/kasan_init.c     | 14 +++-----------
 4 files changed, 11 insertions(+), 13 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
