Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64AAC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/1bwXYc4s2bHByiifpOvZjpcmUFcd/kQXrWf2SgSfVc=; b=1rEtLr//HWrqRp
	Vq3j08oyi1M/8OT4bQcNdm4sVSS2waQYGDmmgsHVFIig64zwoB5RktZqQnOv7QyI9EidSyKgfPV8m
	qZtf8IfFfK1oF92aIlspKcU+uGpZ1Sba/qQyKFyP13m5jbW1VX1rdAVesuC2/z5faU7c4WlJb1V4B
	eAsfvfAeSOmd5EVaM61TkEvA2m6gqw/YTTx7lEQ9/9zFIt9quLRvvXVKAx+fKA0H3hgPYZe3mA8o/
	2+mhibR/Ffw4l+DGyq+tPA7NTFB/OTL03iUCZW3Nw9SdMs/wrZswPKzEN2KDDp9CuPPpRV0tto/Qo
	r8RHZvW9OyxOBYyI+P/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9z9-00G4gz-T2; Mon, 08 Aug 2022 21:08:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9z5-00G4cu-L8
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:08:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id j7so12245070wrh.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Mu+MglJymBxabIBvUwjw2AFdmuPrcCRK+x2ras11sSw=;
        b=UTfXqut8bTa7JgXBR0VHUYxttE39IIXdx+kGphECVoz2oaUb6+Y6af7tM8mqls+AI/
         TYiO5AfDd63KO9Wj6rBPphEThFLv0VdpQnGEBy3db3S/V8v7hGQzKhu+8L9zWwDHL2gL
         n8olPJGToPM9p08FoLg+Px5aVqK0UKMnCsl2vC5MKV/X380k9XwvVnJD3baCSqKrV4nE
         5ZJJv9b1OzCZC4x0vUlvDWYJxL2cQHBR/b4VCreP+DpNkuI6QlV+1Be5P2b46/pdLmUo
         UitdxJJTPCl5XX+8NkYt3e5LEui6Lu0UIkOZyUtgz8v1z4hQ2icbK2Bdv22kViR0ORc5
         KXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Mu+MglJymBxabIBvUwjw2AFdmuPrcCRK+x2ras11sSw=;
        b=qqDFjH3c5KnAPiXWgQz00mcnZ2xjqoInYcxOxkjn+YB7PzlOkyR63ZP6jBUYMSYjZj
         /zOJBrOAM/A+yibHiekxNmsxS5UHGZhJDNiJPKJAqDpfG+P10kYy94L6t2UTFP9OWfc2
         jk0cfMZshwxZwuZEpgR0A6rHyKE8gdffWA6H22jpgc/MmzKKGo3zj9GKEgi8iGe1ro+y
         Zw+/2XKAGiWId31T3OZGZGNfbnS8ACgnAdiladrTrAtqp/ln968NF+AQS12zv7dzI9VA
         g8b6eXanVWSdQws1a0ybM8THY7HHPXEmLt3IlFTB7ou3z6asnBIfdIfM3NmVt6t/WJF6
         FH5g==
X-Gm-Message-State: ACgBeo0RbMfKNxVDthU69LtcSIBAn3dIYqGdk1SOUUMyVUIwCS0cSYc+
	Lx/mm7HVx24UjXeTa82xUcQQd6qeja2F81CU
X-Google-Smtp-Source: AA6agR5JiztensB8u1Cffi0TRYzTm5X+4y5aFY/uvv8GKqlzYcjlG//LNaMJnint02TuHq3pnW9gVw==
X-Received: by 2002:adf:fe81:0:b0:21b:88ea:6981 with SMTP id l1-20020adffe81000000b0021b88ea6981mr13290068wrr.616.1659992900293;
        Mon, 08 Aug 2022 14:08:20 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 14:08:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Mon,  8 Aug 2022 22:06:40 +0100
Message-Id: <20220808210643.2192602-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_140823_740730_B01445CD 
X-CRM114-Status: UNSURE (   8.91  )
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
A "sister" patchset for the kernel will clear the remaining warnings [0].
Thanks to Rob Herring for reporting these issues [1],
Conor.

Changes since v1:
- drop patch 1

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: Fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

 hw/core/sysbus-fdt.c    |  2 +-
 hw/riscv/virt.c         | 10 +++++++---
 include/hw/riscv/virt.h |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
