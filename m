Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC2C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SnZFTDWs6LE2yPwBQZj3y8p1hEOUQlWCfJciHp7+30A=; b=by3OcZHyiU/kfe
	CJdyeCK5klnQ74zAWGNcTfgT7yfYHmY714xavbVqJT40UlNFwlweOPRgv6UupEQPccpk6ssPIoKBx
	kmp+oEpOsGupG7VAo5ZWmBI9TWcB2wPnQv/u1iBI7rFSpSBNX/GaWQoN/jSNFgrtso7auetI3AunA
	Wu+Ppvn1oPyd9V7Oo1S2QVdMHsyPwyZvbB3HpU0Bx8ogbopdC0msi2SFMbN9Y1GA3G70FWcJxJoDn
	YNZ1zTD/blR1wMu0EswnBSP4xx4/1I8WCDRgtM18F1y4jel+zvuHA0ZBV+0PxmfJ/eMVHfpWca6zz
	Ijozenzsp/vT334L5qWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzkW-00GXDX-1Q; Fri, 05 Aug 2022 16:00:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeU-00GTYB-BL
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v3so3784236wrp.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=i/2Te5aPkzaGgF6Yd5Elo1dMRE7ml/rzKBW+IcYIQIQ=;
        b=VrlJVqeBIviU6PDcuhASVU+PYr58lUA7zKvCXG4hq0NjWrBEuNKkixiE7cmHwuF6Gs
         iDg5tSHKkKaqj3gpe1kFfxPlKTf1FBNUK+SVnL/U1ObCsQ9cNOGU40liD3ih3HYhfWIW
         K2o2Q7gsA2Sq3L5/XJUpUhfkZITJN5B++Fbaod7CqVCDdR4agQtnow1IVbbBEiIGCYZr
         HDtka7hvt9hPNgKm3IiemK6f/4vnDxVrs8JS9uaWgrhPHrlIbR7VOYulLOIKoIH0ffcN
         62NuT50CcEb2IdBr6Yfe0FX4ZrNTIthyKqXyvYU9WZ90d0mReaLCgz0pWDGN4FubbKaX
         Qa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=i/2Te5aPkzaGgF6Yd5Elo1dMRE7ml/rzKBW+IcYIQIQ=;
        b=qBGYz1tOnBU2KOh//r/BJKbKzGOuuN0wyEhHRsnVSswyxqYbwCefsK+WgAmMurB+Qt
         PLxWNSopQHY8utpgWHHj5+o5XbX7HQKyI6mkMdgWqeDx5a3CFdOYGDcIVf8YrVwEKHas
         vT5LyvGmLoU0vkjSLL4CR4V6ZxNbzTImRexSnOpph6O5I3uYQYsYniV7J7Fd8idZeLUj
         l2jYLJwpv5mKGclIOc4totqlrxCL+MMSx+Gq7aMNutMF/fVun9LxpK4q8oX3j5+olkHL
         qphc1eLnBt2zuvVMapIaCUAoe2jWZxOpfLuXCi85tcYaVQSGB1/XPqSqF3nwuhnVYdXo
         lhxw==
X-Gm-Message-State: ACgBeo0kROOuGWXvNoKkJkkoYtg8UPGeh36rbhMgXXG7cj0jXabsdvYb
	COxxm/EVxVx2gKXQrYHVrMbuDw==
X-Google-Smtp-Source: AA6agR4ir/WJ2OZJuENnbVRZfcwfwGcqTB5otlRWWDzRBQGL7k/gziveqr6hVWSoTgd1c4r4WJQk8Q==
X-Received: by 2002:adf:d1c2:0:b0:220:762f:fc64 with SMTP id b2-20020adfd1c2000000b00220762ffc64mr4864194wrd.253.1659714853733;
        Fri, 05 Aug 2022 08:54:13 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:13 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/5] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Fri,  5 Aug 2022 16:54:00 +0100
Message-Id: <20220805155405.1504081-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085418_557517_0430AA7C 
X-CRM114-Status: GOOD (  10.49  )
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
Patch one of this series is lifted from an earlier submission by Palmer
that seems to have got lost by the wayside somewhere along the way,
hence the rather out of date email used for Palmer [0].

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings.

Thanks to Rob for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/qemu-devel/20190813225307.5792-1-palmer@sifive.com/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: Fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

Palmer Dabbelt (1):
  target/riscv: Ignore the S and U letters when formatting ISA strings

 hw/core/sysbus-fdt.c    |  2 +-
 hw/riscv/virt.c         | 10 +++++++---
 include/hw/riscv/virt.h |  1 +
 target/riscv/cpu.c      | 18 +++++++++++++++++-
 4 files changed, 26 insertions(+), 5 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
