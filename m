Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16508CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E1fGTUPb5VF2XJhqidFS+EXNBW33TdGmpWtIrNmFyNw=; b=1wadIrRJaiMkMO
	V9fBeTXIurWgghxlluCjLkEvIeJfow0HUIdJEBt5UgqP219JyISdpk2jyzW9/UsYBDDhIgBQnl/wx
	TK9gCt18Q4azkobE8v+NEX5SLzIsEYy4umIpr9sR7+gJBvbnf7a7algHq6FXLZssTqSBIuypxOSCG
	6c47AsBmMTxSWzOIRi7elFNh5a6q8gYLn0hG4bJiizSdE12SZ7vL/gvhFwu4EHXpTfFe+RDBOwTQ1
	FvK5Pe9IxbaFmXxglwIWItyllU/HRawnAtP6oJkLHkehUD/5Q2gHmnGwL+pInLglpIowKn8jj7V+0
	MgxN0MS7SZtylq7GtytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFW-0000000CpIq-0pKb;
	Sun, 17 May 2026 14:13:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFT-0000000CpII-0O9q
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 14:13:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so1149682b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027222; x=1779632022; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=Iq921hTlI9DwiJdspWT6riJga7cKC4Jr7LpihK+kd0bhosgNXEzt2iZQDg4dNMaHWO
         Shkwj/xlryQMoti/gH4AvrzPWE+C0M9HxkO3BLm8Tx8lPx+Kz2TEJpDDoWdl3tgcRu8T
         jmex44oEdjd1rYAinF+FL+uwCKjC41geg53bYfjBE4jWwT0/wndA4169q/r25ZONH5l0
         R8H53Hur0b0lIH0WVwK5sm2YmO72K/+DGu82fQ7A6gUQc0vxKkCOEJ3HSCpULw3RA6fo
         kKgh4TD0H5qBdAK4GqmtmSeLI0EdklLi2rBoVd4bgvRUZGgj7WDK+ovTaok+jnYRRXUX
         tNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027222; x=1779632022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=Eo6KKBTpvynmCIHwObVaKVr/26CoKZ8Qck3j1jwONgPep711GNLSW+e+QsqsqG9Bh7
         j64V83q4wiMVlD3OMpOIIzpDUKkcllw5fuNnIs+zYtsEIBpIO2BVmCygB+yIuW5PXckl
         Ic4fJxjFbQIdpmP1f7vQKQ9B73UHuymj8sVWZcuLxk6m10iuTSSS5awbAH2YkMThZHmh
         Ar4vmT5epT3SZVCFhE6L+hNVhc7nz14vH5uKOWJe2Tbl0eM6agjB3NHMv+LJUehhndmF
         YTPaMzbfbwEDsrnhuRm3aoESxXZnHO8JK7M/g4NgY4TeYl2Ob25V+qCK0J9wj8ZnO5+h
         weHQ==
X-Gm-Message-State: AOJu0YyMMlyqOB6IMno1MlEuYxF26YFSdHc2tl7+fRKpzwJqN8GdZFca
	ojUc4IpLd1hNKgoBQu9G/vQKfGccp+THYB9IfV1tdoH+u14CKKCEkXyw
X-Gm-Gg: Acq92OFYRQPMPi4pwh1VchWpA5cZcqSHhdKTpUnFcoAeP9lelznG5Gb53+bmi/WJNLK
	K8MoCFrAl+e7Cl2gmmIEIqGbwTwWe131AJm758WOw5ilRsJlJxlu10F8X6VinNAS5Yt53w5N2Zq
	w5vBEhadZnUmQziNx0tcP/ss6uY199hQjbHGwkwGf+EvDiR/YyJT2bGosh7oOoVD4FipPX+4Ggd
	WlPzASawjwh1LVUhuHiw+J9o27Cr68sFzSh1LKj3q0AA8cIAqzc96YOvdCwwyCCY4KPq6DUBlz+
	krG/HD9N1BMuHKSm3rsFjGMD4FepdSO6zjTnsI2ImaZhfKGqjkuRp04epbvEWBN+xleSAYRoDEk
	9PnOfRjYUTBQN1/jBOXTXlCWVxlAJhq/LRwppbJhToPSraG1vPnNQsqGO2qYN+Ff4Fvqg7OE5J9
	2zJG5dkw/KvChEnJ8P9tMWEae1Q9Ol
X-Received: by 2002:a05:6a00:4212:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-83f33d0356bmr11819618b3a.21.1779027221951;
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/4] clk: add Siflower SF21 topcrm support
Date: Sun, 17 May 2026 22:12:54 +0800
Message-Id: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3eI0I0PdkvyC5KJcXUMLU7NkA9MkM0NjCyWgjoKi1LTMCrBp0bG
 1tQAa2/r4XQAAAA==
X-Change-ID: 20260515-sf21-topcrm-1856c05b6138
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_071343_139970_F7B678C3 
X-CRM114-Status: UNSURE (   6.44  )
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

Siflower SF21A6826 and SF21H8898 are RISC-V chips with quad-core
T-Head C908 for home routers and gateways.
This series adds the initial RISC-V Kconfig entry for Siflower SoCs and
support for the toplevel clock and reset module on Siflower SF21 socs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Chuanhong Guo (4):
      riscv: add Siflower RISC-V SoC family Kconfig support
      dt-bindings: clock: add binding header for sf21-topcrm
      dt-bindings: clock: add doc for Siflower sf21-topcrm
      clk: add support for siflower sf21-topcrm

 .../bindings/clock/siflower,sf21-topcrm.yaml       |   69 ++
 arch/riscv/Kconfig.socs                            |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/siflower/Kconfig                       |   22 +
 drivers/clk/siflower/Makefile                      |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c             | 1053 ++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   |   63 ++
 8 files changed, 1217 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-sf21-topcrm-1856c05b6138

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
