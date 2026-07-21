Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701DC4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVA0Jg++wqtcVoOE9pa25w8YMjelbXDFvFlgeM6qAq8=; b=rwG5s29/mynNBs
	eFjEATPvxv/qF5f40aGu6ohMjAfk4TC/DApLpnp4Nxh8LwtltefuF5etb8Z+nXsdeLbVnOGWCoB8w
	VZ7uiD4VKU6840OT9PsLNaeWLSWEnlIH0QK/jZWH5Phpl0Pg7Z1iSHUUYxhyukKQw+Wx5Npg53Myl
	r4j+qn3cP0cUeY5Hl0WL0Uu9ZNhTka57eBIBZSQYdaP/5HL7StVRNTZtuNnrGxyLE4C4Ghg1Mc6bZ
	qIf/0sejz6cTfh3lag1zcg6gEc0DNhVBChpHR6jP+43CU3uLDZzTaxNx2ZmPSJvSgNPdLIvIiqwCg
	hkCpP1NcfvAaeOv8FKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzR-0000000Aawq-3A9r;
	Tue, 21 Jul 2026 23:35:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzP-0000000Aaw6-0e4o
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:35:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc7a269ca1so27058675ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676906; x=1785281706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44FYsvelFg/ZZt8P6qAAoFOauHqEtOhIhSjgQ14AYP4=;
        b=mR+rwkAtJjq6f4pGbNB669HTGJh0+JG+lttkiiHSKl4IdS51316tvj289D/30WJEMP
         yhR+e5k7i5VdGnPALgQYvglb62fHU7+8UQ38qgeQNFR+S4cmc5VIdvrcgzbRaXqW3caH
         shX1GyrfUXeHOf8UNT0mTpxzHgE+V5fE4uvDC/HqDdhErY79DIE6yzYXA+YdQRe8e/JG
         WbPDwS+BWE3RZozmPZKIDdBmxZXCa86tiNa3H51De5SG9jBc0NKTzetzui8QLgiiv5TH
         w5qLYJBsmuIVz6n2QkFKJ1et4vqognVETfbOgJIIEIediV4zkCgb6jA5MWLTms5MY5Rg
         30Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676906; x=1785281706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44FYsvelFg/ZZt8P6qAAoFOauHqEtOhIhSjgQ14AYP4=;
        b=Y96oLhKWLSt0/w6T3cbYfiM6mJCwc4SSbogbMsmbsaOEyLVKxmP2Op3gvUFl+8QK0C
         Q8QVubWES2EpWxV7LI1f+f6gHTmgXBAG4cWlbzfYkfu3THyPuBQzFLCtA8O61J8NOp5l
         Aas+ZwcrTr7X4PD6brLs+kcR8DL0FQX17Q0p/ZN0gaB62fZDa8HFxUKoUB3pJMif7IkQ
         9PkOWReoO9aDyr0MJ5YTThyzym5BKTGjzKzQsSP6yjU8mB7fsvk7GXucFhcpteOogn3g
         1WklDVov+IAYRDv38yP5P+tCIhEyaoJf47lefbpUePHXTJSkLWNcn86JchsL4i7Wl/RS
         7EMw==
X-Forwarded-Encrypted: i=1; AHgh+RodVFRFHyYgu4yFJ4XpmUXKcDKY8M9d/7LJjZ+eeJP+VlO//ujE8bGJWLEK0sDBXGP/63i4gaY60me9Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztwTk/RiNTbfjiz0/OQruwzI/tXSP58qvMUl1nQ7TGcL8e8Pxx
	DX+db7gJsOcRjU1QAS9RKlZ4PT+OLyzoMVFqp4jDN6eJ7WAXNfGNHagB
X-Gm-Gg: AR+sD12clkKufAIK+cYgudX+OFq8gKudVUd6xhB7nh571wTV5MdImlE1sa7BLh72UkO
	mO/b66lgxPA5vS2sdVsDLzhGaLsUlOgUZfag8zYR/Y7H1lH29ub3loNMk9uooVGeGTg9wa15MQq
	dGsqxZI+PZJmJ3EN3pAzt3M50wL5O00CcAHUBb45UXXkwP01LNV6etlv/huAdnv/SHeEHGX4n4L
	7iZVzMLDMHm/sn4hIZdmHw7fshz7VRqE1+zBWKgLJn1uuVgzLQ1ttIWb8RqVhkUCIdWkkIHBoam
	166rklLM03/RFoAnJK9mzu3+ZlasAY9TUYlPi0GzZ3ovV3lIXD4CqJlDly52g9xYQONZ4lxo1vx
	VCCbRd456qGWHKcpwPXXD2PRFKw76PGl+IKOh4lu1Lz+MzuNfPakQNtuFy/YLnuw5aaPqV3XEW2
	iFa8ILQkZaV3FMvvxzTz8Jv8BNZM5YkRpbbrPPIKPiUGI1dOg4zpaiTESv2zdEZ1QnKTNLODCZH
	x/GZ41Q7FeETRA2DIpxda05ZVJrmvtAnX2Hcy7W
X-Received: by 2002:a05:6a21:9217:b0:3c3:8d53:373d with SMTP id adf61e73a8af0-3c40f9efaa2mr4810951637.3.1784676905564;
        Tue, 21 Jul 2026 16:35:05 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:04 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS:Keyword:sophgo)
Subject: [PATCH v4 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 22 Jul 2026 07:34:41 +0800
Message-ID: <20260721233452.112204-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163507_198832_A4161C76 
X-CRM114-Status: GOOD (  10.38  )
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

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This series adds the board binding, the PWR_GPIO controller node for
the CV180x/CV181x family, and the board device tree with support for
the UART console, SD/MMC, USB host and the onboard blue status LED.

Tested on actual Milk-V Duo 256M hardware: verified boot to shell,
SD card rootfs mount, USB host (root hub detected) and the heartbeat
LED, both via the default heartbeat trigger and manual sysfs control.

Changes since v3:
- Move the pwr_gpio node in cv180x.dtsi to follow unit-address ordering,
  placing it between usb@4340000 and rtc@5025000 (Inochi Amaoto)

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in cv180x.dtsi
  (reworked in v3)
- Retained the &usb node because it is already defined in cv180x.dtsi

Chen-Yu Yeh (3):
  dt-bindings: soc: sophgo: add Milk-V Duo 256M board
  riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
  riscv: dts: sophgo: Add Milk-V Duo 256M board support

 .../bindings/soc/sophgo/sophgo.yaml           |   4 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  18 +++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts


base-commit: 980ab36ae5972c83f683b939e50c469c4947229e
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
