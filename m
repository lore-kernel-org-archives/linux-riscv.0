Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA4C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B5TGlpuGRI3ESAWpklo9bTt3mvFPooTpxmP6k0pf+PI=; b=SSa5hedHbTiFRp
	0e9HjVSY/x1ik46L2YcbhZBNa+I9PmYb0sYeNIOlNDzGheAy2toQTIorVdCYldcA63hF/RBAwrSFV
	6ZW54z9ehkdMzeGbdLcKlNKfv2v8hu+4cZ2YZ8bHqlVOgUGhBth2v4if47YQB9v7tFpAD5LU/7Xx9
	9ZeFh5SVffZNKXQJdXfDzJkbOtqRzomUgcvWjNRMlWOn2L4OpWMZtX3ODw9ChCfEHy6kpw2Q5PSX6
	u5zvAlGv/sVAeTCXGcyBMGIKtJ4jdf76cZrc3o8VgkwjuR/0fL2rUKN8DmgUyfk4f9Bgge/r0yIqk
	w1qwKLdiGjT0afkKn3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUKl-00CI0F-0K;
	Fri, 12 May 2023 15:05:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUKj-00CHyo-0m
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 15:05:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6439f186366so6350570b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683903921; x=1686495921;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrSKXQMrxZy3B2xcqbpKyp9JfcjpHClnhEvXrHIQx28=;
        b=swn0xzMao9c+7wrFYVIGTExuBibZc6aUZAGfyeRYhTp3aZXqqRNaof4AjCvfETX9V5
         YVvP2yfwG/AQUbdBkHmnHm200r3rHSfwrcCx2k9mxADy118J5re3bfA9WTgDSlvodFLS
         XI91/xIlACifIiItrxtMuZ098pEluhpiEXdk/zk87MmN2MxROEgcKJupCTS3GdX0BuUe
         eNDT3TPWLXc+ERsUTgLVuQc9XS/lZMsSgtz0U4Rws3HUZmRrAAqdLld1w2d0PDUsR4E8
         oBmIIxo8bZwaKIe4kxIm+2Ry3p72SwgJC7pFCXtd744yUwidLo3l4bLdOtgZOopo/Yib
         0BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683903921; x=1686495921;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrSKXQMrxZy3B2xcqbpKyp9JfcjpHClnhEvXrHIQx28=;
        b=OYzYSjK4Ibv7NVkeIyDKmvq+6cQaympH/99ajMhbKcQ2sz2r1V/OX1NPy3COJfvbcm
         3G+J3a8W0h5ByffeFhmm83LiU/w0IijUNnqiRe9eKVI1RrJpCWZagi3pfk67kBgpgf0s
         6GMhGKszkjmGmJTEig+ltifIHWUWu0q3PN0f7ec0qkAT6w/RZS8QkPu3iMblL7NdS/kq
         Uk0a2SZqnygpDH3/qvLSunz6Q/5sjR6YsyobhQ4UbNGaR+KvM1lTVDSOVChXj6nN2nUC
         LtTRHlY7UQzXQi99tUKdxi5CP0Gt+elv4RRYiLw6KYveRnis8WAp0OaeNvDhbkrKPM7B
         TdWw==
X-Gm-Message-State: AC+VfDyNBQUOaiNurSFPmmRc360BzHHb1sM5lZfEeasW/5uQq4WzBgVS
	i7ShexVkW8KUcOBzBc6q/MzEC6La+R64xVH7z0Y=
X-Google-Smtp-Source: ACHHUZ7quZ/W/3oBQEaRf/HYdJB9y9lDWuJfi0McS7LZztm4C7a7wfdb5/pX6q0IS1pfwSYdHzYviQ==
X-Received: by 2002:a05:6a20:8e03:b0:104:2226:1b96 with SMTP id y3-20020a056a208e0300b0010422261b96mr6492368pzj.22.1683903921429;
        Fri, 12 May 2023 08:05:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090a408500b0024c1ac09394sm17325869pjg.19.2023.05.12.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 08:05:20 -0700 (PDT)
Date: Fri, 12 May 2023 08:05:20 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 08:05:12 PDT (-0700)
Subject: [GIT PULL] RISC-V Fix for 6.4-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f7f97b7f-e3aa-4fff-abc7-19439d1720fe@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_080525_469824_E2CC72EC 
X-CRM114-Status: UNSURE (   9.45  )
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

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc2

for you to fetch changes up to 3b90b09af5be42491a8a74a549318cfa265b3029:

  riscv: Fix orphan section warnings caused by kernel/pi (2023-05-09 18:20:23 -0700)

----------------------------------------------------------------
RISC-V Fix for 6.4-rc2

* A fix to the linker script to avoid orpahaned sections in kernel/pi.

----------------------------------------------------------------
Just a single fix this week for a build issue.  That'd usually be a good sign,
but we've started to get some reports of boot failures on some
hardware/bootloader configurations.  Nothing concrete yet, but I've got a funny
feeling that's where much of the bug hunting is going right now.

Nothing's reproducing on my end, though, and this fixes some pretty concrete
issues so I figured there's no reason to delay it.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix orphan section warnings caused by kernel/pi

 arch/riscv/kernel/pi/Makefile   | 2 +-
 arch/riscv/kernel/vmlinux.lds.S | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
