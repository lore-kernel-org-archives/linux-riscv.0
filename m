Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71576C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9XdArf0pqMeuFdR/TZO32yXj/etTlpnSQqTeMb73lUQ=; b=prP2g3ZDqVkVn9
	K6stu2bKaQdzL4jPgDbsvh3uZ5f8B1WowzFyFobVrkbsSJrCu1Yv5hxnPCQ/cw5h8hTMsLrP40Erm
	YA/5xdrc+wVUrhPgyN4881PWxKjYDWPXltMtJr+VZ1FEQil9aXAktNBGRdo8xrC7mcRk8sCFFHaw2
	4AU6Z2+ObIHSYBSJjYbt1K8RWQ+dKUdUU41o8SoK+KQOUHCKpC7lnAiS40E5vUfubHuj3oqf0SuBJ
	EFvNWkQHJO8cR+q1WH9Gmx/pmxVHBmjg/QMrTQFN2rXpJLnVw5bfGhdBcvW/EdsVi7gS1nuHIMCg6
	7LJDnizdnhkDtX8PIu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi68y-00000004Ook-1T0O;
	Fri, 10 Jul 2026 07:59:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi68u-00000004Onn-3V46
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:59:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3800f0907d5so143520a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670368; x=1784275168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=NAkAjO1lg1eLZn8LC+my42Nnnz3nxE5lXBDGXxN3Sf2ykCmHLnwyj5Se31WNEYwi7F
         +ycP728KJMdsPze6tHjR3AYhWUmWHvehjD2y77jmyerpsGy7Mge/0VETLavdUe5R/iUW
         75CbBwv8AoC66O4yK3w9HUh9UuFERfUEeNY2FES40wIC+qj4ogHnqwAc/gx2H2P9QeIT
         NfEkhAL1tTloyZQqjJBNNR+yhHyraiPEdosfsBeJgVy2RiMsXzH9s63E5Kfy7NZU+9ni
         0ekKCwQ63B3JkyBN1Lrv8JdSoWOa1beZzAGfJbwNNpWVxTOb8FnrJawGkNvfr78DqsG9
         Dq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670368; x=1784275168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=H1hQ3kaMuRoPaGKBYcD5ojfAhdYzM4xCCtIHMxebHHDi/oMikeG9ojw3G0/Fvp0muN
         4LUSJoQo945L4mgMpYe1c6Au+cpRLiJDFQ5DmHYKmqZzrvCn34qRzz64Fj0GiWkzGBdt
         SlqYRHETI0FGbsvy1ltt8GIFLGZk4JqisuTfqTIk3vom882zZQqweoZxiEkt8hYORdlQ
         5hJTTbqXxGvNjuEGEbO7cdn7rn0Ii1YW+S91ZQ5vj4u5VXmVp0nBmuXenYIvSKq8dj4w
         5CRl0qs4dkEObxJiWDc9xpin4M2AdCY1WW9Gb+xFE1mM3t5i6Mg0GbKlWGHY1PXjltwB
         4qrg==
X-Forwarded-Encrypted: i=1; AHgh+RolN4Dl3i0Tl6ncxKXfhZwiJwwI8+1ZjZhRpMlukuASi7k16up5usNmZRXDA0UMVi/UVrCXxMIAWxShsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrV8RFYHrxFEsLY7hFUhWks8UmATmr0IIuA7FP3ep0Sz3aXfM6
	e0CFQkJ+1MkoQTaL0S7bxIDWwIEDll5NkoMZTDS3vVoizIBZ59arzxlM
X-Gm-Gg: AfdE7cl8HPRvrfQf9+xF00LUs67p9uTOBC5LiSkDrGEytgdgrv9prmDJqZ6eQWL0cFw
	SCdkAfgq27M6UILYZCJb0nmeSdXwsN/fR+Ngn0O1VfcqT7C/FEOR847VD+dytr40UR/Uy5JePRD
	6QtKOt173hPDknRMN13ZcWuZsfru4JaGGk3LGpeyK/+jA1po16EmCTCnCW+Y8w7WpKC9pyoSzkm
	B4sAJM1/99+dS/ly97lK7IzoCHTDpxDK0asyMdWWRpyffbDxMX6U2Z7QOvPNOfbEL5JOUmFXv4T
	7mi0/AJFGad9THPgr9i4fX2W/FbEYm+jOT4D988CTd+NZi4GK4CcvU/zXaajX03ukitF7LIWxEs
	RfJAarpYjsurjy9TivtSXgsLSXp7NDajae7EOVGhLdNDfZuEkt+2F+gzw9ZLoP+d0b09qNpxN/Z
	3+CgvNKfBYlIUmedc=
X-Received: by 2002:a05:6a20:12d2:b0:3bf:a543:e7da with SMTP id adf61e73a8af0-3c0bce50f42mr9139492637.3.1783670367797;
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Fri, 10 Jul 2026 15:59:14 +0800
Message-ID: <20260710075917.159969-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005928_875784_B418273E 
X-CRM114-Status: GOOD (  11.38  )
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

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (suggested by Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in
  cv180x.dtsi (reworked in v3, see above)
- Retained the &usb node because it is already defined in cv180x.dtsi
- Cleaned up the trailing blank line in the Makefile

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


base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
