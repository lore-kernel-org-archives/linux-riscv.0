Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B46C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 23:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=woMvob2RWMtfQV3Lj4sbGXJw1EJjhCuJvDGCTR0mLDU=; b=UJqGKJs/XPlDNU
	7IX8FjZhXhcK3MGOtblfDj7AN1QaKIIA4mohtvVj8YnqfJYd9nzIvLCPGasgIJOjL+LZ8M10kHwqI
	xykr2pP2/4YzBeWCwRu2vaO3WTk8Sip9nUS8xmIMQXzuJX0iv6nHgaeqfc3871X9uUp90BXMhCYJW
	z6emMty5iCq13F49WfWuvQggbga90gCMxRF7pBaMo3z8ZaEdjGKpVGKvnDJdns77ipCirW/SC1wiI
	j82+G6ekLcGK6hynTooa+h3pMsODx9VwvgOmhBzOuwanm6MitHdqPRSU9c+lmjOUWc1o4Hrij7Zrs
	WomeicmrWWqXDmoo9woQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZi3L-0007fl-AK; Wed, 30 Mar 2022 23:48:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZi3J-0007f1-1y
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 23:48:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id f3so19090461pfe.2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 16:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=qBPGxp5mcQc4QZY8fFiZjVaI3n1akSFYZ8khR08Ev/8=;
 b=eKehRzx3Bdx40er/MgtTkPeSzGb096H8wDgKvamKLh2skigPsj/2DEy/2gN1MkWuJb
 j292p+zlwkmHLoPKAxCZjM5wufHYcjiXSSPXDx+5yRx9Fr7ECbsHalHXWpHiEVP4/otX
 osFrFJN0i3zvZFqhyWseZn/6fvyeTHbZf09v7xuuT1usUhh91ysN+7T7sAKP6x1nDY59
 917uca5QAEAsE+RpBcE+5hr6v9vzlhJh8dzkezP1bzf1+zlF3UfMkPwnye7NPCVXoD5v
 FXifhOb5ZYoSIfHf3lUHf1eUYz18A6pxne5MiPgpTaQUYRT/M0VEfb514o8b21FDSqgm
 7AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=qBPGxp5mcQc4QZY8fFiZjVaI3n1akSFYZ8khR08Ev/8=;
 b=gO2ufviTp0+htm4mr9md7kiDkYlz1cT7ZZGowoOVQSPmwkoVAkcCb3glKeyDiD/loM
 eDASAAOVnBZCbTwRZDaMVA3u90xZIxw8q2zQpgGy3+yPDutaVjJrwXRUiQrxTUM0A/Vt
 SxB1frhiDz4QfMNs5ku9r1llYyeQKW1Sx+tKKiReRaj3pT2no4YjYf5/fh5bWBOqJ8+o
 XZ8hSbbnM6AKigI9D5cTf2ujFBpcLv3qD+/Tu+LdYEf5gLUApxQe/U85h5lyURTqsT8U
 Z/LXI+pz4f+jWvzEWYxoh3qW93JyAVf7RVTLHkXZktoD/NgVtvaBiOgrEcIi1hxeD0Af
 eLhw==
X-Gm-Message-State: AOAM532xx7ui8V9IbpHz3I9wYv7dvvmccgMAS7RuSrX/B0x8RKdldzup
 lWbyBujU4q+0pdJTC8WXDBaP0Q==
X-Google-Smtp-Source: ABdhPJw0eTer3uAW+Qu+xSBIF5rbYg9osobJhrjnYEvqPlPLOMX3LZkn6jvKpGKDimlZWzaSUKjlTg==
X-Received: by 2002:a63:6f44:0:b0:398:31d6:e37f with SMTP id
 k65-20020a636f44000000b0039831d6e37fmr8177965pgc.177.1648684115385; 
 Wed, 30 Mar 2022 16:48:35 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a001ad000b004fb358ffe86sm16629736pfv.137.2022.03.30.16.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 16:48:35 -0700 (PDT)
Subject: [PATCH 1/3] RISC-V: defconfig: Drop redundant SBI HVC and earlycon
Date: Wed, 30 Mar 2022 16:47:37 -0700
Message-Id: <20220330234739.1956-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, heinrich.schuchardt@canonical.com,
 atishp@atishpatra.org, 
 mchitale@ventanamicro.com, alexandre.ghiti@canonical.com,
 damien.lemoal@opensource.wdc.com, 
 axboe@kernel.dk, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_164837_206955_0C6EE85D 
X-CRM114-Status: UNSURE (   8.05  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As of 3938d5a2f936 ("riscv: default to CONFIG_RISCV_SBI_V01=n") we no
longer default to enabling SBI-0.1 support, so these dependent configs
no longer have any effect.  Remove them to avoid clutter.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig      | 2 --
 arch/riscv/configs/rv32_defconfig | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 7cd10ded7bf8..74df9e1dd2d2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -64,8 +64,6 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_HVC_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index e0e5c7c09ab8..cabfd6a5b47b 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -62,8 +62,6 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_HVC_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
