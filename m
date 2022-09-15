Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74236C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tK9naQqoOT5vqcRTqfJf1hwk2XOsu20VkqAR22Qz8lg=; b=jEu0AN/Khx25+R
	bIN9MroaseA6Kl6nPKNhiMpYtPwIi4EEHVj/I135rmo3/3Kq1ICqIOtp0qMI5V1qmqzjXbO6QRzun
	LJhaVaZ/S0rL7YccEJKH06L7cS4xoCoHkvgqwFnZ10m//L//tQer6+3642NHe6NW1IuIFmMClJjM8
	lw42QWyR1XEYtcsuqQDnAj7z58Okh1nEs3kfUom5RZ6epav20uHMp9zD9YlPlLGugTT6zgT2ZkDyB
	r7vR56dFeK3eUxro9HfI+VW6sc/FqlZUhLf4HRlOHnm7tl+eW476C8yTRNTYV+rd7mPwJBWxlrqAe
	KSgFhJSP6pQY6gltZe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQq-00FUSY-Bu; Thu, 15 Sep 2022 18:17:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQk-00FUAe-Oj
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso855918wmq.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ibdgAaqnlyBKPF0wq9BnsIa+piapHma/lJGXO+/rxrk=;
        b=htNR2PheEpPZDb/m7LbNTBE/5djFhHgvXryqym2grtgXZHZqGi87Ptq4mVShCcPv+e
         LMsLyDEM75fbD02+ZeElWdQwBvmXweC4re3Suw+my3IsUsWB8xT8DhBfa5aEC3ia+sjP
         /9Q33VI7m+j4lQMIsB9q//IaaOrQkB+enEgymjGTMhwXEV6kZ0PAhTBrMBQAz1KsHI/z
         fqadXca/qLz0QxUGu6C8Kp4rtLbhw/7u6TT2GmHqU52+CQ8bqo+0zvSuxUDGsJFaS6sj
         Nl/w0EIo+EaRxJV/94FHU4YNwGmU8DsWCKhjUosfgfzjdt7QjK2u22YnFn0KxM8P08OA
         Qr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ibdgAaqnlyBKPF0wq9BnsIa+piapHma/lJGXO+/rxrk=;
        b=KyXePtURab82ECFpDMUjy34Mv6qK2qVxqQGHrlu/j3vlKO3p/Q04YhqdwFlPWkvnch
         GEIAxSyeqzsYKm8SEs/vMLMLWTC2r0HDTz7ZkpBNrIa1niqkKhm8frL/IMA8P4a1o7cP
         Yfj/BHTqkWMtkHg3+kfLlujUx2cQSy6U2rMh7mS6m6ZcW9VYyj3IdavliA4yIK/damDw
         XAK5wWlbLZJ+yz1rpXJR0/AZapnqYVGHoqpRxLOFIgd96QfXvP/sofD+40yWAx2Nt+CO
         ayusEpzBfLWGr+0G7Sx1E5QUEe+ExrfX5TMhTQUBHh01PIZrktO8XEgPgaiVn4sIjTsH
         kbxQ==
X-Gm-Message-State: ACrzQf3iywxeGHUJuxtNwFfyquWOy83P0mkSubHnFc1FpIsf4ce274GB
	BSbbz4CCXrEKL0Lq2oDtKcg=
X-Google-Smtp-Source: AMsMyM7LsZh4q53nxahSfi9XCqj48tZH3611Kuzalqx0HPgh+d8lUYmiPnHsYWuHQxJDKhgXMEiPmw==
X-Received: by 2002:a05:600c:26d2:b0:3b4:7572:4317 with SMTP id 18-20020a05600c26d200b003b475724317mr797937wmv.134.1663265859875;
        Thu, 15 Sep 2022 11:17:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/10] MAINTAINERS: Add entry for Renesas RISC-V architecture
Date: Thu, 15 Sep 2022 19:15:57 +0100
Message-Id: <20220915181558.354737-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111742_941561_05526598 
X-CRM114-Status: GOOD (  10.98  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RISC-V architecture as part of ARM/Renesas architecture, as they have
the same maintainers, use the same development collaboration
infrastructure, and share many files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
* Merged as part of ARM

v1->v2
* New patch
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5f17c50dac3..99483c13b91c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2665,7 +2665,7 @@ F:	arch/arm/boot/dts/rtd*
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 
-ARM/RENESAS ARCHITECTURE
+ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
@@ -2686,6 +2686,7 @@ F:	arch/arm/configs/shmobile_defconfig
 F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
+F:	arch/riscv/boot/dts/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
