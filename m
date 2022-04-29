Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF437C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/nbxsfzTM8Z9WjusPcdVOA031DGv8MlD2Y8mGzAlQTY=; b=CUzTA/aF0kzmlD
	u7amVSK/eNtq+3WgRMpcvA1eZL3+HgiYoX/YTYCGM0qMuYUoaulM6h9ZTtyPu2H8+b6mAYleaXPce
	dDuyeODBRxXpxXq/WgY/c9uk4VVM8pJlopVK73nCdc40mtH6dC2S6ri5zXXO105ZNlLUstOsA1w+S
	zjFviUpnAxv+Oo5BkJv6rYSZpWCEX3hPuWraOuvwst7zmqjX0KpyrqOiXRS5FvfbVXSr2vr0oVZ92
	J6XfTpFi2eNuBEWBzQ3C87m3YvftJahOwJZcuJuQmJVeSFsfiH4FrdWo7LENGd4abgnujput68J5b
	kRzRcixA8kjTxpQlTEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkTe4-00BzV0-1b; Fri, 29 Apr 2022 16:39:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkTe0-00BzSS-FM
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 16:39:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b12so7609396plg.4
 for <linux-riscv@lists.infradead.org>; Fri, 29 Apr 2022 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=YTMYWglJvPxKf/1GGyXAmCCcwylWdWEiN/xnc6H4bII=;
 b=o1jWtkGx+gsZKQRsxZdhrXhfVUTRcyKnmoTvYkBIldeUZvn0qlLyyiVV7XnlaIjF4A
 LVypMwXn5fAnh+ghQ987B+getFJU1yz3LEgzlDEqYIusXqz5ZnnQcLl9jD40RmhcpQ0j
 IYRaDmeLyUX4oKvNrvbkxymyYvVTq20uFbRZ2ZFEUNPpsun5Azkk2L6UfnhgTWAeRxBu
 SDjaGt1M97ZRQpMZsKFEpOdjXIjIMZOJdMMAfkOeBBrNb3GfN5jBb4I91Y9iPV0NNJvW
 62ZUNV3tHzBu5aGBBuzznxrw9OwalHawyVIwSOGrWt5g5fYnhPLXv58RJVpqxNXRHpxj
 zXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=YTMYWglJvPxKf/1GGyXAmCCcwylWdWEiN/xnc6H4bII=;
 b=6Wnw+xSKZFGIA6CiIgGT5HL7+2yoiM8kJH8BCap1XHCIoZGhj4mdn/U4gxBqHRdzGs
 8YobGhSwyDxwgCQm8B9TVKiNJYg+VzwdnrOKGrRacFkUMrHMcY6mqIpAJBQGO2ZLQ4OP
 Dmkry6r/DCOLXhy5zJ1hoOamUUkhtKbBpt6Bvv3YXbElKdacpoiFYPl5pHPWDqLPU4EW
 9uJ+dodGobtCwuN1jrScCpCmqDOW6PpiXigOgX2bv9LEeCsggixVXqevAOs4Oml1ucSS
 Pbu0IsnZMniDgnLOhj6148LueePyp+evh3z5joFMmPI4biVZA3ZojbWGWbmgSzQT+g2E
 jFBA==
X-Gm-Message-State: AOAM533V4RWIc7QMnq6cSXfLsWITI7wa85r4Zav4ZyUBTDwfnf4N1dnu
 kBPWaMhx/0mH4ghJagYZMdf7VhT55PtEVA==
X-Google-Smtp-Source: ABdhPJwQWxUqLl5/Zu2o/iphx2H7waYswkLfcS81pxZLHOe9vRl6qKy4w3qTXb8VQ5AeIc7hAn165A==
X-Received: by 2002:a17:90b:4b41:b0:1d9:b562:5bbe with SMTP id
 mi1-20020a17090b4b4100b001d9b5625bbemr68533pjb.61.1651250336123; 
 Fri, 29 Apr 2022 09:38:56 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 h7-20020aa786c7000000b00505bf336385sm3622057pfo.124.2022.04.29.09.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 09:38:55 -0700 (PDT)
Date: Fri, 29 Apr 2022 09:38:55 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Apr 2022 09:38:49 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.18-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-23ee08e3-f500-4297-bd05-a1902598d9b3@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_093900_770267_BEBC47DA 
X-CRM114-Status: UNSURE (   6.84  )
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

The following changes since commit bf9bac40b7635e2ce43ba0051a64c3fd44312405:

  RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE (2022-04-21 15:10:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc5

for you to fetch changes up to ac0280a9ca106c5501257e79d165f968712b5899:

  RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL (2022-04-26 08:19:53 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.18-rc6

* A fix to properly ensure a single CPU is running during patch_text().
* A defconfig update to include RPMSG_CTRL when RPMSG_CHAR was set,
  necessary after a recent refactoring.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL

Guo Ren (1):
      riscv: patch_text: Fixup last cpu should be master

 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 arch/riscv/kernel/patch.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
