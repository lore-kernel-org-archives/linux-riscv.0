Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c0szPyvoyeSAl/KwyQoK1E7D1xnvfKnCT29VzAs8Bog=; b=x6Xxx/L3hfZYsi
	4HjB1/lRVoznir0HdWiFvV6uLc8CDs9wIT2hP+7eWGSh2LIcIJuFuuRONfKR010Ir87ibpLO71mvh
	PKc5Z3clMmjkTgV0L+BjHzUDaxF2eXYMAJvKTRtILUTBtdl/mlFuDMBGYK+4Q0uEj9IQkDpWghUIB
	f38yqc20uEH9NAoJufF234/9/Yvx0vegb54sG6E+NUN9w1dsZ+dT+5HagAOSbzGhl2tE8WqeI0sRl
	z5fPsYqe/D60LP0fIsp5d5Y65TcTzJfrBAWuCSlcEb/rbBrHebiN/YcMVFL97YL8O17h3WqFSvWR8
	WkdVB/FlV0vV4ND85/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZagz-00000006PXq-42iq;
	Thu, 01 Aug 2024 18:38:25 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZagw-00000006PVl-1MMW
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2cfd1b25aaaso2388606a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537500; x=1723142300; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odurubX05L/alYO7ZB7p+uzZRMihsa585lYB4q5XK2s=;
        b=QbiOqybDETm+gur6aEbhDieiLMUn0mWLucWhHBWK9geu25XM3B6LKQlHSbM4rWLckp
         DzeLbeR0bExAUJCm0II9wJUsunbKMl0YMJ27i9j8UbqqAIfdrkKXG4INnd2/phplrXYH
         dXVPxzmIu/NgmTHgwwlR6+s0zBpep+eMfM2i14XsjgCm7p/4nOCMBst59v/KxhKF+qnl
         P9GWBm1CVp0nyKlS6b7yEazeVTz0kFvickrYbNR4/LOUMYu0Koa0FOrwIi3xYpoY+8Wv
         W+wy2Abl6cUy44gvDE9Miq+WTUFIU7cH9KpYW4gi3n+HBGn5bK+pcWRDF0vBGtA30rvN
         fSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537500; x=1723142300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odurubX05L/alYO7ZB7p+uzZRMihsa585lYB4q5XK2s=;
        b=K2M1aCv58qgdi7nrBoXcwyl/EML6Dv2ywyZdoad3+wELRmCpvQEf7uvrpn6qUj0kXn
         XKodhKM0vQE9HOhDMJ7cK04tpl6G6joOt5GkeYcP8jvKCOT+Qi1Li44m14jUxvE71he5
         frCIY7k0w7LhIark/MrLogF/2mFPMZgDsEVAUcsJVFo884vyPxOwfYsXH1IDuaol3TTK
         BTYNHMyGUfEYp0sys6RkS5gHrO054cHtwDk+LrmAufwFG7EuR1qooMmSIzCgBryYjlzv
         bPagPOmqaVy3JjlJBmFROg7voirwBKGY6hbXk1V1F9mRrULI3E0Yw8sp7zYp+BTsDOsq
         uB1Q==
X-Gm-Message-State: AOJu0YyLdk2Eu6cfRD9XfU9mfweZOzEx+eYYS5zf8Y0onvtR7EUgAoVx
	xwmKtiHXnx8+OgpFAYKcjVtg99HxYyj3NhTB13TBufrWtEnnsbMPRSjQl54dDdA=
X-Google-Smtp-Source: AGHT+IFyxM+4b6rxuziOtoQq+fzlqhfg2RrpGYQix6E4h5Nra628Qj6ThEm6sTZ/5/OUa1hkRYoZmQ==
X-Received: by 2002:a17:90a:3885:b0:2cb:511f:35f with SMTP id 98e67ed59e1d1-2cff9414351mr1286202a91.15.1722537500263;
        Thu, 01 Aug 2024 11:38:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:19 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Subject: [PATCH 0/6] riscv: dts: thead: Enable TH1520 AP_SUBSYS clock
 controller
Date: Thu, 01 Aug 2024 11:38:04 -0700
Message-Id: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAzWq2YC/yXMyw6DIBCF4Vcxsy4JMyBeXqVxATJW0qot0KaJ8
 d1L6vI/yfl2SBwDJ+irHSJ/QgrbWgIvFYyzXW8sgi8NJEnLRqHIM9Ykxfi4C5+TcKgn6TpreLJ
 QTs/IU/j+wetwduTXu7j5HMHZxGLcliXkvlKEhIx1q3VXHOONdcYRG+WIfOdbqRusjYLhOH7wD
 bT5rAAAAA==
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=drew@pdp7.com;
 h=from:subject:message-id; bh=fc0TjBqsBBzAbreLePWGgYrgMgY88HZhgtkzJ+8R3sU=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStvia5aV9uRVKRY8qdpJgFEkdLGLhvcdUc/hPEaS759
 9jfa6eXdpSyMIhxMMiKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmkibI8D97tW/L6UkcS7Yq
 Bdxb2jHv/JTqo4KMhad+/Vxgnn/HtLKSkeGWQDNbBlvEXFZ+xzaV0K4Jy53uCnFH35281nXKioU
 Pb7ACAA==
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113822_502116_4274AF65 
X-CRM114-Status: UNSURE (   9.41  )
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

This series contains the dts patches to enable the TH1520 AP_SUBSYS
clock controller [1] and convert peripherals from fixed clocks to real
clocks. The dt-bindings and driver patches from a previous series [2]
have already been merged into v6.11-rc1:

 ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
 1037885b309c ("dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller")

Changes from that previous series [2]:
 - Move the clock-controller node in th1520.dtsi so that the nodes are
   still sorted by address
 - Add patch to convert SPI from fixed clock to real clock

This series is based on my clk-for-next tree [3] as of commit:

 32121e158449 ("riscv: dts: thead: add basic spi node")

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
Link: https://lore.kernel.org/lkml/20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com/ [2]
Link: https://github.com/pdp7/linux/tree/thead-dt-for-next [3]

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Drew Fustini (6):
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      riscv: dts: thead: add clock to TH1520 gpio nodes
      riscv: dts: thead: change TH1520 SPI node to use clock controller

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 16 -----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 16 -----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 81 ++++++++++------------
 3 files changed, 37 insertions(+), 76 deletions(-)
---
base-commit: 32121e158449f0b6d6ab6b2e63b22d9d80471563
change-id: 20240731-th1520-clk-dts-b14f0b9a6efa

Best regards,
-- 
Drew Fustini <drew@pdp7.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
