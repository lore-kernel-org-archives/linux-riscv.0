Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E719EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1Dnls7dPGqttkTtqDdh1Cm0oL+XejKgY7e2CXz2vvU=; b=JZPVl2NGdRutQ9
	XH2KyyYgiVE1Vk5sekUk5EkL8yLq6i7PDFBfjKE+Y3vP+ILSuT07CJOHQPZyEBdTu86Xt5GPhGt/Z
	7uSwCNxwJTrnCxHIs6TBDSgKK6eG0x1L4SS0HsZL0hGIQYXoz3JdPCQ3Hc7JYG9V3UVKYaOrOvwbq
	YeiTl4m2oS55SWVeAtp6aIKwiSrjyE7gtmxnxwhD/GwfKvdV/yoqmHWmMsTLGML+6e4GUWXWs5PlA
	sRBeEUvtcwfPaAsG3QEl4sb+biQrdWPj25n6+3NQKYD0h0HWYvgERZbj4OEFVMBOSdDx7Mot/xIhk
	sqvzRyseRY7WHy2wA+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O2u-00BH8j-2N;
	Wed, 14 Jun 2023 10:48:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O2q-00BH33-0x
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 10:48:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f8c9cb3144so4079925e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686739685; x=1689331685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJaQfZH5klVZ+UsbJ+KX7G2hR7Ab0l6J5mOqBdKcW9k=;
        b=n5w8Va0n+nyCFXsVC0zkVOUgZr+2F3h9VXFV4pczcK2fT1Kcm8QencSnIb/VAtt8an
         avJgH7XRWFnJpaL36SorUN7DaMG85kGxjuu2+Hw41D3lMWvFVk8vZ7d4XzyNtkdxGCzf
         i6vP1C06wdh8cFH8D4bNQUWzNCdi+sbAtcpHGWZW7p59LhbMqTZzYIJ6il2ZXcvWK03I
         HZGKkybRD2KdwTqKH81AmxwZh3RdRhhCxooeNqFA2NiBkGEjcU/BaE35Gw3BWRFLkmwx
         yi2ACtaPUFJzi7QZl5F8xulQf/0ITC79Sf5xIPRgVBPjUaI2VLMP7u0XcDKX9y3/W28R
         Ib+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686739685; x=1689331685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJaQfZH5klVZ+UsbJ+KX7G2hR7Ab0l6J5mOqBdKcW9k=;
        b=E63PRC5WfuRdok+tdJQnPfRg8/6C22Ju3S5bPCOm7SemqqN1kjQGP8I+BjMRbcVrv/
         8gQpSr5fBj9Hc/4U+xmx94bSDogXXQp2NdB2LI3+YzFzKCOeklk9VdRgbo2gJCLX88Il
         wg2dlvEN74xfGWE6BYIPoLIqV1DM/3Z2m9JAKTA7ku80spHrV9oyLzmoUxQTwXaRQsu+
         5mpc8DNyabrZA9pivabh+6ZRF9i+Ue3ME8i31FU/OYo6zqBm81MmJWuW4VlPybqG8ZBg
         dnBNbiUj9Y7WDZ43YFiV6gMXb6WT7B1VtWIo4Q1bdQsZBrgO00AMEkzHCHxVrpIL5s4c
         wQGg==
X-Gm-Message-State: AC+VfDywk12Xpe+HnPU3uljitY2dyEMtODgAg/jj1FaXqZAtz9A4xOeC
	goslwNZcorSlVxj8MOjTrUI=
X-Google-Smtp-Source: ACHHUZ45HkEYYAoQdp7hra7yjIvLJvzZvA32DSEBsIu3jc+3RXv3/cMGbB9dt+2+h2Teih1HhiSKNA==
X-Received: by 2002:a05:600c:c2:b0:3f7:30c0:c6a with SMTP id u2-20020a05600c00c200b003f730c00c6amr9747793wmm.25.1686739684957;
        Wed, 14 Jun 2023 03:48:04 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003f5ffba9ae1sm17154904wma.24.2023.06.14.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:48:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 1/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Wed, 14 Jun 2023 11:47:54 +0100
Message-Id: <20230614104759.228372-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_034808_368334_6F43181F 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8 -> v9
* Included RB tag from Geert

v7 -> v8
* No change

v6 -> v7
* No change

v5 -> v6
* No change

v4 -> v5
* Included RB tags

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
