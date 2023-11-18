Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6303C5AE5C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5eokoztOof4XquVPxmRyqtdEn5amuc0FDZXEN2TuRM=; b=4Qwbowake6VSNS
	aKltm3eRzCzDPBHCSvMeVHOVKMIi+J1Zi6nbwERjlItRj7yESnTq60MSZqNvVQdyjRLilTlpiM7p/
	xIX37EaVCfIcW+CRxDvhPZsxZ5YslAv8kDYFS2QxXUXYyNDYBy61xbjeelfD+7T/SNgwpI0oDnPvV
	mQZxUsQngt4ezNZsm4YQNbkTb94BpE6SpdPygaNi3qyWf1GepQgHYrroNLJptdYz2hmUSoPgFxp2F
	8kwwnkyNzhKiQSFXonxPqRG1tO2+ngVwH1ujXtPWhmg6QnulfWQ4qNkMJM7/AAjrnG2M+Fp7eBojN
	ITG6bAYHDfAkPGB4WDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBU-007n8i-32;
	Sat, 18 Nov 2023 03:39:52 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBS-007n6e-0B
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:51 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-359d27f6d46so9227955ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278789; x=1700883589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwuJDohRQ3aqDyqXIkqqX8SciM39GRJg3jYARQ14u9s=;
        b=KWbHJS61yq8VZvFUvxBEa49DuBFYKAZSoRqOl0A3Ao5WD3GwaKA5tDjoHAx1BsRwHY
         iwgH4dDGv604j9YuDcSExsh0de+0ihu04ZqEu7wkxe8dD3aszZ82slfZ7pHdBmgVVeoR
         Th2JzIV1/PRa5vOx2uHB1ftvndZ1oORFHVNel/+ufWduEhvMn6kG1AOL2paPbDj0XwR3
         axWyi5poLzja+O18PWx5X4RwwQdyAxXl/Tvy13yqAn6iO/9wltFNkdcXiSl/0UoB2qOi
         UvkkE5uPc1rkzlvWhAOtI4MjjdxBwy4hDLENDQiGMjqTpU4iGpM5yB7xG5oBNUqUfn5b
         R+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278789; x=1700883589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwuJDohRQ3aqDyqXIkqqX8SciM39GRJg3jYARQ14u9s=;
        b=Ngm+E1ltBslRFXfc8GjhoFi+7KaRTJgVhZs0ljhMOg1bKH4KK8WXj+7MFC+gvJdggw
         KyqR4b3nap6lZ2gvHjQXDiDGluTN9c3N/5wev93jMOSfjfB9tjoaaPRE9WxyjjcFGrOu
         +B8ftpurya1WGmHGjrJaLPgv/V5RAIoYZ+BjRQlgoUvRvynVeS3D9tqHm7ZqKYMvt8e0
         xrsjd6jmQF2UEF2Ei6CwRupEEQqUA2cTLg5AM3A5TTFLvhYK4InQKUldQJKWFpz01bY1
         wAt7jdIuHkh/kBUwdFD7mfjX3DgC2IslIKXZ0IfRBVg4b5teoZlQk/ltRexg3dW/SE1M
         VkZg==
X-Gm-Message-State: AOJu0Ywdq7zqdIumpYxRkCr6WSGFJvUOdCOPsDjEIoxu3gbMsNiL1Nk9
	cC+i2quwUrftYzg5+lncM89OEyExF3KepUSY7vo=
X-Google-Smtp-Source: AGHT+IHOlKnIVZ4ksof0LCT4ATUyA4aQHrNLe3GwQ2oPH5iU/GU5vmFy/egl6dy1iF7ul/LCCaVvEg==
X-Received: by 2002:a05:6e02:58f:b0:357:4a63:2ad2 with SMTP id c15-20020a056e02058f00b003574a632ad2mr1554139ils.21.1700278788781;
        Fri, 17 Nov 2023 19:39:48 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:48 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
Date: Sat, 18 Nov 2023 09:08:59 +0530
Message-Id: <20231118033859.726692-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193950_109050_813AFA7B 
X-CRM114-Status: UNSURE (   7.63  )
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..eaf34e871e30 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 89b601e253a6..5721af39afd1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
