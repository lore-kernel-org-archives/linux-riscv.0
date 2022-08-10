Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16021C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OKQ+S+HBBhm5Ja64Sy7bkNFfSAwJr4dtC3cuWxWbENA=; b=LKDOBzEyLgQrHA
	G2ji1XCgylKiQaYfseNeR5H71+Ej9uTaGZSuekUjYsobrMorvsONOUaQriFWfmOZyuYdjqY9rz7e1
	/Ffne7c39Ml7eeoU8mkKIDO7dsrkDJluwV41K8bLI8gLRW8nU3FJ4nyw9GNWSETw2ehWBMZeMEy2G
	BJ8ItomuMe5joz1mZnzTymssIDbyV1BjGpyzdRXD4pJW3CQK9vK27SSYeUNnYSlbQuL5s88gTCG2v
	W6oZvko7GyLJ0rsRtdwwZNvAfTwlQNT+cOLNBfpUUaGwDSW215TZiaJlnvaQKFddXpBKW1Szw3DLo
	wV9ilSvV7XUH3NUPF/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqij-00Dr7T-4R; Wed, 10 Aug 2022 18:46:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqig-00Dr5U-PH
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 18:46:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id n4so16974205wrp.10
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
        b=D+bGATHkhF0dkAypX0Wg/9uVqtvaAxsfK7oJ/WhaffXKsIURPk7G5ewlN1qcL0BBo2
         1/x6nejFPw/rCqBa8wDh5LLlcakLthHfkRW4G7QlD29WM6gPFv3GORqvkBN2Do9heGur
         TKQgsrK5ZIimSUT8Uq04k3eXU+f9bzIMMSVBqVy5ncvFGArVKWH57Ds5dl8z4Mm789PP
         s/6hHPDXnJPkZpCErscRolu48YQDO42BF7aoZv3ZbW+XIcS50lQOJKgLHjy2ltYlNSOY
         PxoXeX2GglLqm3joFlCx05vDatlQ5t0OU18NleoH+o1wTOKpxdjbLGUcVL6prcdyGEys
         WP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
        b=QIZvh4Rqx5eiwz2J/8KsKk1MOlv5BGTTuC7q1SsCeSNxoAKUkqd2PV+d3CPjDuviTZ
         w0d89C1c4CFySuuDHCFkCub2V9LiKh8UEwsgSvm7NW3F9FZbwuDjfFbLadpJMh2CJUHr
         kIhLZzf40dS8Nvx8fKl7tyxqDHY/PoW+7QeRxk0FN+f5N7jXJttVOYR+TqamwnjbgTBC
         lf4QT9vnsd1M+fKTgGuuOcqjgnpfm75PWBg83nkEYQC+tENietkYUKbLHFq+bUgcsY5q
         Ls+fi1c5/6JhNK3WjzKq6f590Rq67wGXXe3nPZ3jYP/zqfRT1/yG+XtL4S9OBaFR2jWX
         xuhQ==
X-Gm-Message-State: ACgBeo3RQcwoPJJ9UKbd2h515MWjfYplg87dFuETf+e/0ksAILL8a4Kq
	YBxeIqTiMu8/Hlq/KzFSPy9yNQ==
X-Google-Smtp-Source: AA6agR4lftJ4rR1enjLROy20IwJTTV2mtwSG+GS7NWTbpXZhAG1kqQkAn8L7RaD16xE75EHUvj0Sng==
X-Received: by 2002:a05:6000:987:b0:221:7e59:45ec with SMTP id by7-20020a056000098700b002217e5945ecmr13407125wrb.64.1660157175809;
        Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Wed, 10 Aug 2022 19:46:08 +0100
Message-Id: <20220810184612.157317-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_114618_857664_0B9FAD69 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings.
Thanks to Rob Herring for reporting these issues [1],
Conor.

Changes since v2:
- move the syscon subnodes back to the top level instead of into the
  syscon node
Changes since v1:
- drop patch 1

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

 hw/core/sysbus-fdt.c    | 2 +-
 hw/riscv/virt.c         | 8 +++++---
 include/hw/riscv/virt.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
