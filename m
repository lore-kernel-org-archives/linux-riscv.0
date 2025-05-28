Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED072C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtZOdoENSK+n6MccctygieEloh7wLvLEC68vbz15kNs=; b=SYy6kBvwZ5F2L8
	te0EAB+6u7eS/JRcDPFSGHAmaJjPiJn20uxLMqsR+Sb8SNXML623lzQPKwco9Bl0KOJ0JSSyuOaV5
	MCteNBo9BXmo6U8nC3rCO1D0LE1D3h69vC/uB4yjVyEHlpjaATuo5rHdavRkQTMmn9278WGgutg+h
	7/wNu571iBH9KdiUXcU0UN+EmTAH4CK/AIRyZw/tT69UzzRiCiLUnODQ87WPDJ+A1NbrDkTogOslq
	4GiMIyS9Dg701OBXovOoZrsI6AfSOvUylrIV+ZNPF86RfwS2P9CGv8mRmQUnrnXGwIvGU2n6drP8U
	rEQbzQbtDJ9m9stymBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDtS-0000000CpT0-1E3q;
	Wed, 28 May 2025 10:20:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDlI-0000000CoSv-2PFP
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:11:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23476a0a7c0so5400355ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427111; x=1749031911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1/Vt2mp73cleoni8AtXiYI0r+BUVH7GhRhyE5d0M3E=;
        b=H/fiKVBTgRhV9Kg2/RDH9M16MUBa8Yy+H9/VEzN46VZGyNfUc9Tlembiz3EiHSNbq4
         EsZF+qhjHxhyxVoZcKA9gUmINvUD467jDYqA0hiY1ohelKxPfzeyQnbv77YNDA9z/tNd
         3I0eE8t+cm9/nUxyU0rWGkzwcLaq1u5DMbGiLw22YNxegM97Sf74J6lGnX7eN0y5gipk
         Utx5TiUJewAq9fkOwPib8xKCBkUiHdcMgc7uYxDAsUd27M/Lw5rWN58lXNd2pSOPx8t5
         wDLOHSuEHs3MuHR9qP8bYcxpMHl7t3bL+DFfc4qmcZlHDeDGbrZbdSZgqj5CwnDUhu5t
         V2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427111; x=1749031911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1/Vt2mp73cleoni8AtXiYI0r+BUVH7GhRhyE5d0M3E=;
        b=stp9SmXB+8HetuV/bRk0OCnA0T/fFCwB+WXOssqg4Ij3iNQieL5ANxbl5jTH958iys
         hV14TBguNpoxCkivi5+cJTBTj50irCzYyQ2MiZFYAdPuRx6ai09EOWuE1ce1qgqwNf1E
         y1R4V9GQq5MNCKvy1eBgvGcEaihDNIZbHva+W5UbbbjWVzmiQ/tsebu202GcRiqvy7Kk
         iviMH1HlosaWuvLnV9cw7lvF2AKzq4C8472J+0Q/Rya17/stz2SL/8dnBbEag8//guo3
         SOdOjliySi03ObQtDWZIJO1z9CeVqgLUQ7q4MZVfQBiOxSW6JJATTXj/bMnVfh5UhEci
         W0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUaaInUpjW/x2AiiRsOgv4UsMI/Dw5Ig8BaCsth68KAWu8mNr+oRzBK4GXSvrfHHsOO9MZVKLWA4pmAwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqjken27UbQA4cZRtOrjQwrKaIj+/EmPDiKswsnPyNT+aH4O6u
	d/ePJM7yYD7uwInseNLUZHnVBUSzOiH/CoqKLYEuicjPv4a8YjV8G7+L
X-Gm-Gg: ASbGncsotaN5Wuy1/3tRYYPpH6IYRXuPSNsKnVDgjBCw0ZZZ9QFls6/Z8N0ss7kuXmF
	aJ56wJUf/FP9mfHcG1OTuaS3sxpXSpjoUVwkdcgvjdgeDZ+ONES8Z899wm5rvcZpXFo4baMbPZf
	p87NaHOBjB0jn/WqKLgT/bBqEMKaxZjOhn/cNJaINs6xrvGyqZAgWBAvQvjwzrK8gahn2pjGfEO
	oUN0Cduoe2x2ukfnrXNXB48NpCoxCaTmttG6UMHohEYUBBTOyhGruk7dV1v2GhAEMp3SvKpvgZb
	iQy/KwAK0ARscVujknVOuLS7BpN/XQM/FrbNH1hFrT1rcySmIUmZOGES
X-Google-Smtp-Source: AGHT+IFZgXlqFr/nZJIbvYhr8VBnFB2u+fgWRkPoYOa2czSx/AkDylcuc63qHSavCUSvhb5c85NwtQ==
X-Received: by 2002:a17:902:f693:b0:234:325:500b with SMTP id d9443c01a7336-234b74f4119mr68932215ad.22.1748427111266;
        Wed, 28 May 2025 03:11:51 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:11:50 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Wed, 28 May 2025 18:11:35 +0800
Message-ID: <20250528101139.28702-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_031152_616359_014C98C5 
X-CRM114-Status: UNSURE (   8.30  )
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

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v5:

  - Rename function and variables for clarity.
  - Modify code style.

Changes in v4:
  You can simply review or test the patches at the link [4].

  - add tags for mail.

Changes in v3:
  You can simply review or test the patches at the link [3].

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
Link: https://lore.kernel.org/linux-riscv/20250424012335.6246-1-looong.bin@gmail.com/ [3]
Link: https://lore.kernel.org/linux-riscv/20250428013501.6354-1-looong.bin@gmail.com/ [4]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 141 +++++++++++++++---
 2 files changed, 127 insertions(+), 18 deletions(-)

--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
