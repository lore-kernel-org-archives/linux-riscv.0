Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AADC07D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kviWeikuSL7dFV9pI/6QMWkadazUh2a8b1/rWc6J61w=; b=qCI38CTW9vwMcM
	yDcbzNg0uoKLBv+BM4TLaPQXIDMD31PXsoHtRQSJDnup97pJhBekuTzyCsWUkSs66nBX1yfdVuyIp
	RUB/UTrpbLxuxvuQPAeq18I/cWj2NLvrDgXNoLattEAzsUCkew2iD2wwzPFUjJuLhH7nk31YKPJQi
	b/NGkJANI2iRO1d9g/xGm/mGgY0ikl/TjY9P0L5a1goXpJExXMtC/qprh3yA41QPP9Ce7X2V93iPj
	uG5ywG7bvmOwOmS+2Oj8ceIbovfHOxcwrK56YRxOB72kiu7QqJlqqQZa0OpsQDCI0Qwc58D6zGVOC
	5mC5nypyXuYkpG8T67sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yv6-002624-0E;
	Mon, 27 Nov 2023 10:32:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yv1-00260F-19
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:32:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5488bf9e193so5551384a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701081165; x=1701685965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXMQoO+59B4RfteS2TdLsbxfrqFnOoPJv0gB7OXCjEY=;
        b=fFLzpwSBUFaAXVkl+u2JF6Rf5dCs77lQd9fgBr0WcwJTNM2VpyH8y6x6OtuavX2xnT
         s82r0cDpY3wHHJeLVzJUJ/x6N2dkLJMUVrucN4x8yYIMI/F0AQpA2E/VcSCIOsVktGDh
         R58Qf3gpdfIscxNaBjIqaxGkQSJGllVAkwrvS853XDogiUKiWX0VHPUa6uMImRahQSvr
         A3vaHF+d9h0vK77VRvE6T/AQqiAxiDyc9u+J0iulS5Iz/60fo173x2TYtrBIu8rsz7g8
         aWOVODV0nEFS2UGUTY5JaJlSaBmXPko48Jgrc4cY/Z1e9v10Zfgl6jsn+7igaTTrzGR9
         JfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081165; x=1701685965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXMQoO+59B4RfteS2TdLsbxfrqFnOoPJv0gB7OXCjEY=;
        b=vNXtAeUb8leODlY7n3WcrfzqBXyestIeucyMpuE/X6ZKYFJfjpvxUvsUr77Do6x/YO
         70Nk3usqmjvO6I9BsoqVaEuC2vN1FP5M6bRt0/wFs/q7aO2EIfwXJqfD1Zoj1k5+KmL8
         V4sPUox7zJCaanh40BR69q+zll9sOMZAI6G+mTkEqMS3gvkcVC4D65rWZXP3hiH+L9Hb
         GAN7NFqpPiJ4GE7gzI3rrfv81ZjFtr5pVAmB2sBQM0+xtpETkjTHUcpFEB3mi8NBsHdM
         8XR2/cwB1jf0/7aPALkkYu0vQXsa/7nLU5e+pBHtd4amT4cP7eqKo0ffdI2WI8pAyGDS
         3RUg==
X-Gm-Message-State: AOJu0YytBWzVnwbWm8IZIm4brjfms+VI4euY1sRpnEk2OA/NjS7zS0F1
	XE432P6bgzPNPO3NFWq/wxI=
X-Google-Smtp-Source: AGHT+IE53nVgDe6am8VQnSmuEc2nVIGn53iFk+onJPjPjQxuGPRfSA1eJw0A78ujNNjk2qYF4ie48w==
X-Received: by 2002:a50:d7dd:0:b0:54b:2894:d18f with SMTP id m29-20020a50d7dd000000b0054b2894d18fmr5121148edj.13.1701081165346;
        Mon, 27 Nov 2023 02:32:45 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id p5-20020a056402044500b00540ea3a25e6sm5142057edw.72.2023.11.27.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:32:45 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 0/2] membarrier: riscv: Provide core serializing command
Date: Mon, 27 Nov 2023 11:32:33 +0100
Message-Id: <20231127103235.28442-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023247_400392_1FA1090D 
X-CRM114-Status: UNSURE (   7.55  )
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

Following the RFC discussion at [1].

  Andrea

Changes since RFC:
  - add prepare_sync_core_cmd()
  - add #ifdeffery for nosmp builds

[1] https://lkml.kernel.org/r/20230803040111.5101-1-parri.andrea@gmail.com

Andrea Parri (2):
  locking: Introduce prepare_sync_core_cmd()
  membarrier: riscv: Provide core serializing command

 .../membarrier-sync-core/arch-support.txt     |  2 +-
 arch/riscv/Kconfig                            |  3 ++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++++++++++
 include/linux/sync_core.h                     | 16 +++++++++-
 init/Kconfig                                  |  3 ++
 kernel/sched/membarrier.c                     |  1 +
 6 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/sync_core.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
