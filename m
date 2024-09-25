Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5BBCF9C6C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 05:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Mime-Version:From:Date:Message-Id
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ddOUy08S0fKQlVewspE+5Qu0Xl/HOMo0v3xihQHb5bQ=; b=xey7SXnaiXL3C7
	Rv7umOFUr3ztNzgJvIoT/Sti3jZ3M8npZrS2Fd3UYYg7IAeaj7Vq8C3fRg1NucZe6hUnznhCdWLgI
	YagCww6xVpxYH+jBS4COxX4r0ld13C9nV+az8UTr/5UGz+0qyEWxUploNBrrGCCb4NSA5PHBbXK8Z
	9Y/akRq1K7zS98DAC2HQ8meszxFR08LqyCQukRiNwmFzALkYmUqbYuy+SlI248cFIeJF1/8DWXgEY
	tyoh7wvur0Cu3Tamn3EuBYzwdiNmwQOKNUCcnLtSb4sv/uYFxIB0f0Nkj62LmWB1nrO0O+MX+QB1F
	4608XYIfB1xErXYRUaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKdh-000000043kY-36C3;
	Wed, 25 Sep 2024 05:32:37 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKcv-000000043YF-2FgM
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 05:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727242297;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=a6txcGONyEy3jDjRb3vFFGuVu+sHQ0dLCYuaB0BaxR0=;
 b=E0NKe+z/n+xXFsenCOT8WAqBcrRXiSHD373ERYZ1BWMIWbi6/6eFYOYP9IeIDcP+vhSuSP
 RtMCnsFxTiYx2zhPTUNzxwT2faaRHKWdgKmsTXVo2TgQNE8a61p8A2lQip9AVxuHM5WkP9
 7F+OiqHgttFzbkb/T03hOTaNfM+cN1Y9qOVJADdCW0GG/Igm/Ege7yctbWcoVvaZ4ye4O/
 lXl1gqt5f/zGMjwuaoiIKKb3awlTqHoKb2Lz0JInlrCwKXhWLmVLug1W+WV4PicZk+yCVt
 FLtstAFBqMW1LtzKMla3a5lJZE9vhX4m752Zkkpj7ad6n128dBtRuEQhGhwJOQ==
Subject: [PATCH v3 0/3] Add Framework FRANME0000 dts
Message-Id: <20240925053123.1364574-1-sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Wed, 25 Sep 2024 13:31:35 +0800
Date: Wed, 25 Sep 2024 13:31:20 +0800
X-Mailer: git-send-email 2.34.1
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+266f3a038+42e50e+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Emil Renner Berthing" <kernel@esmil.dk>
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_223150_207850_B804B28C 
X-CRM114-Status: UNSURE (   6.17  )
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

DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard 
powered by a StarFive JH7110 processor.This is a developer-focused 
product, aimed at making tinkering with RISC-V more accessible.
The Mainboard is under development and we'll share more on functionality, 
compatibility, and availability as the program progresses.

Framework Model: Framework FRANME0000
DeepComputing Model: DeepComputing fm7110

V1:
- Add framework dts and config.

V2:
- Add deepcomputing into vendor list.
- Add deepcomputing,fm7110 into model compatible list. 
- Fix the error about dtbs_check.
- Framework Config will be included in later patch.

V3:
- Update board features into description

Sandie Cao (3):
  dt-bindings: vendor: add deepcomputing
  dt-bindings: riscv: starfive: add deepcomputing,fm7110
  riscv: dts: starfive: add framework dts

 .../devicetree/bindings/riscv/starfive.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-framework.dts    | 34 +++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts


base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
