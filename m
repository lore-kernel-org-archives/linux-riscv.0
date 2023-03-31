Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE26EC761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNKCjNiJcd3qa2mq4sTe5hrM9TiEFAswb51gcW/QC/U=; b=2GTfZtAUY4V2yq
	0E6MiBF04whJ8xMvVGgaYYJcHxyOsXi/3u8cmadQG3mbGwhVaXHcsKaZbOuWCkDpUmqeJYSH8UKaw
	0HKGVzVS4K2qhIFo0faDgJ8MiV0q/xFxuR1YWw1SiXXODlaslY8dpKdsEBk0DqJx76cYtFZihErXH
	J6NdqzZJcpXtxxiqi9RUjhE0QxQtEI6P6/ndr5oGyGjjLJDk0puR2Ji2MONM9vfXByyPk/nwkcNNk
	0yiHn90+vh0nX8laNMjltTovgtnqMwTNSiiRaFMyAfx+C/rkB3Po6TPsc2e7wuUaSx0bRRgubrUks
	35dJlVzNFBPWKfIBfXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGFp-007pjn-0s;
	Fri, 31 Mar 2023 15:01:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGFk-007pi9-0S
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 15:01:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id l7so20670040pjg.5
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680274876;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTy0yiSfXZlT5wIkvPYiG31Ealo7FixMuHymNzLfkvg=;
        b=JFOIyU6yZBmDZV/8jNTFshY27fnyJIp3C9d5aMcbwRfPjpXXaEfLZ6oCpv8Ckn+3GY
         k+rszx935imT7OrnqnQOnCcWVr7AqZ+QKTe6fCt519sPOaOozbC7LI8QnIC5XOwc95R6
         4RSnlXWwBlXL4tk5XnVi9T5MT9bR9tTdX+xYOysDlzQ/JpdVA4doBuFd4s8OmakT/6KA
         F6rs00Cb/vLSwm7P9GiHE5tTSbGaKGD7VSgKKP/3+k1UVYY0vywC2HDNY9z3vnxNj8V2
         NRmjfO96B8tZ868CcFq8uIsqndXjbOWqQWzzKHocrw1WmKo3X49ZgsogjIaWJwbDpmYW
         3cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274876;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTy0yiSfXZlT5wIkvPYiG31Ealo7FixMuHymNzLfkvg=;
        b=DQJRiUNW2o8fnXe/LbIemN4KZVQP5TG41kA1FRxwaBWVxqqrvrtoUgMmlRKRpLN3oi
         sf2gnXJEiV3fNWTJgpE0PV0SJZLD8xC/iFmELEg1Km5boCRiBfRLpa6NvlIZF6dE+BDq
         vTWiCmHSbAKxgWmCluuEctPbmDJIf2IvhcMRHoSBnA3y1lkUVG0/bDs+hVOyAgfjkkq9
         D1hxLf5GS1y3NTMEkrGmyumsZ9S+FnlxLqg3hUyqwPdue+goNSIU7HA4TMAcldota0nU
         OrPA8oWst/slGWQR4N/aGWy5mt5noJ0c3q2Hre0FSyQE/7NjLjk48vrGpXPvHU0/ZsKc
         CdZQ==
X-Gm-Message-State: AO0yUKUB25zyLRVEx3Noh2yN07rhQDdItRAaWZDIA933ou//pQLAN8OR
	MlGTe+FUUTnHDo3WHvZdlSLpDQvuHqhGJNIWgoU=
X-Google-Smtp-Source: AK7set+SiqHaknAdisHnyCLvjse4REU4FBdc5BLp8Hcnx3nqtXvN76Gx8oxEFOIp3JpZ3+5L6Q9y9Q==
X-Received: by 2002:a05:6a20:3aaa:b0:d8:e105:eb25 with SMTP id d42-20020a056a203aaa00b000d8e105eb25mr24609038pzh.7.1680274875775;
        Fri, 31 Mar 2023 08:01:15 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id c22-20020a62e816000000b005cdbd9c8825sm1910085pfi.195.2023.03.31.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:01:05 -0700 (PDT)
Date: Fri, 31 Mar 2023 08:01:05 -0700 (PDT)
X-Google-Original-Date: Fri, 31 Mar 2023 08:00:56 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.3-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-39dd74a6-0889-4b33-b276-201f02823d17@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_080120_400033_DCDAC37B 
X-CRM114-Status: UNSURE (   5.31  )
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

The following changes since commit e89c2e815e76471cb507bd95728bf26da7976430:

  riscv: Handle zicsr/zifencei issues between clang and binutils (2023-03-23 12:52:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc5

for you to fetch changes up to 4622f159098e098611f393cccf73d52b007e70bc:

  Merge patch series "RISC-V: Fixes for riscv_has_extension[un]likely()'s alternative dependency" (2023-03-29 12:23:00 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.3-rc5

* A fix for FPU probing in XIP kernels.
* Always enable the alternative framework for non-XIP kernels.

----------------------------------------------------------------
Conor Dooley (2):
      RISC-V: add non-alternative fallback for riscv_has_extension_[un]likely()
      RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels

Palmer Dabbelt (1):
      Merge patch series "RISC-V: Fixes for riscv_has_extension[un]likely()'s alternative dependency"

 arch/riscv/Kconfig             | 12 +++++-----
 arch/riscv/Kconfig.erratas     |  6 ++---
 arch/riscv/include/asm/hwcap.h | 50 +++++++++++++++++++++++++-----------------
 3 files changed, 38 insertions(+), 30 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
