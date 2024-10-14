Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C99D18138
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMKH6gjbWQtLN94EbJhw139DeXaTgaQQIc9QRbA2L0w=; b=iwDDWyYuPDwIHj
	pIb87q/wo2nmdsZGhvEH0+vrCPLXkITm/Tj6mjdxmskqs9twWgOTtE+KJWEORrTYbKnjWq01ffuAL
	pDTycdZgyrY39vmgao3j/8gySOpxncFNDNdz3wIJaDAbaR7h8oyS4tatY586cSiuIkxlpbEcbcegc
	nHNBRwzYkek5fo5klXBozOa5PhwOvd1T13xB8cor0EEOO0eh40dEFKZYGDzrqDA5qttG0ohTZ9Q+a
	7CPqTN0H15o7QEDm+Fg3UFUMbEO+uNeXlQuNwICWWLIvt++rPnjblCFCJl1XdJWjnkipYCG0DaWp8
	MHka48AzmP4MRXTnk77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PH7-000000066Zl-23Tv;
	Mon, 14 Oct 2024 17:54:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PH4-000000066Yc-0H0J
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:31 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71df8585a42so3413990b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928468; x=1729533268; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WMPWjM4v7j14DyEcQ5hwRAd9xYSxf1LHTYEm0hMLIQ=;
        b=SLxenwido9c31fCjByE1fj9CH1RfnRjUgCpPckDAEGGHUVgnBVal+8Y/YAqPF6HzgX
         Oo1JZ/SrSiz2SqBPdzvoRJd+nfmQDSHpuBssx1R4ld5eA/4VuT0ltvPTw9Y2rjVMlIlq
         PsKNSs1lbf9HQBVFm3S1mC1pp233X6WhGCUcQ4Tq1I6tDMsyoca0QVTVtOnwcq+GP2kc
         uZH1ukP8a7xxKCdhXh/YM3AFZOMN/CHv2ugEwprtKEO/MgmPuMK8c2TklM7/uy792Rwn
         6t7EtZ0mOIjCxfVI4gmgx0VGyiMEmRmtNy5N0MSW8JnF6VW0u1/ZyPdSB/tlAcA4I+Ga
         0Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928468; x=1729533268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WMPWjM4v7j14DyEcQ5hwRAd9xYSxf1LHTYEm0hMLIQ=;
        b=NyIOZ7JroeavdXCy/YYWnbbkLBrP8cZ1MELIKa6dM5MOthh6u6iIrrBCZNYbfaqCfl
         sr/uXNeFU9EmSV2PrPL+KtyBph5swZJrvgkZl9j/nYyx0v8FKc+WA4vLvT96j4UO/9jr
         TuE15QH+J8oT5chAvdPprRngz0PGChn7kIK3Z/MF8fF7NRaB12We7T8cDwVk0U9Sn71k
         z3BQOM2jairJ8ph3BV1IKVAMKE7Kd/hnj8QU8apNlsALZnRa+rWuG/8c2etoRxoJy4Dt
         y481t7tIoNukT+BrFxYQApzi32AjH48YLrerlJyAS+/bZmnYwlaibGXZmLC9XfHFCk3D
         RUCA==
X-Gm-Message-State: AOJu0YwCaU83kKPjrqqX8HJLHIHmI4V1iP8VesHlDqfxyGnykwbGqp7h
	glVzbDklxlakfpN1CJKso9bpmJKcVyX4WA++QCon+duQtt0iN29xNEYatOzEvJc=
X-Google-Smtp-Source: AGHT+IGg0wES5gNNTPcTHOmFhOZ7P4Cnh4UasrOzlCIqf49HPyl8t7AfprhbcD8tS5R+AH+gxhD9rQ==
X-Received: by 2002:a05:6a00:2e06:b0:71e:6a13:9bac with SMTP id d2e1a72fcca58-71e6a139d5fmr4826861b3a.0.1728928467907;
        Mon, 14 Oct 2024 10:54:27 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:26 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/8] riscv: dts: thead: Add TH1520 pin controller support
Date: Mon, 14 Oct 2024 10:54:17 -0700
Message-Id: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMlaDWcC/x3MQQqAIBBA0avIrBtQU4KuEi1KpxoIE5UIpLsnL
 d/i/wqZElOGUVRIdHPmKzSoToA7lrATsm8GLbVRUvVYDmW1xMjBlXSiLxmt0YN1zmx+ldDCmGj
 j559O8/t+wF8+xWQAAAA=
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105430_151932_329B4AA7 
X-CRM114-Status: UNSURE (   8.78  )
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

This series of device tree patches enables the TH1520 pin controllers on
the BeagleV Ahead and Lichee Pi 4A boards.

Patches 1-7 have all been cherry picked from esmil's th1520 branch [1].
They do not have the issues pointed out in the previous series [2] that
I sent out which contained out dated versions of the patches.

The final patch was suggested by Emil as there are not currently any
users of the spi0 node so there is no need to enable it in the board dts
files.

I have tested on the BeagleV Ahead and the LicheePi 4A. The leds on the
BeagleV can be controlled as expected through sysfs.

[1] https://github.com/esmil/linux
[2] https://lore.kernel.org/lkml/20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com/

---
Drew Fustini (1):
      riscv: dts: thead: remove enabled property for spi0

Emil Renner Berthing (7):
      riscv: dts: thead: Add TH1520 pin control nodes
      riscv: dts: thead: Add TH1520 GPIO ranges
      riscv: dts: thead: Adjust TH1520 GPIO labels
      riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      riscv: dtb: thead: Add BeagleV Ahead LEDs
      riscv: dts: thead: Add missing GPIO clock-names

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 86 +++++++++++++++++++++-
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 30 +++++++-
 arch/riscv/boot/dts/thead/th1520.dtsi              | 70 ++++++++++++++----
 4 files changed, 202 insertions(+), 23 deletions(-)
---
base-commit: 66f5c917cba075cb2cdf8cad2019f72a1df0328f
change-id: 20241013-th1520-pinctrl-dts-54275cc4fdb0

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
