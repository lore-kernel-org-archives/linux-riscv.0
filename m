Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C167C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8A1608FB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F8A1608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGIWpxPxn4uy+9/yPAqkd3Jkrk+J9s+gtDo9Mxi8XvI=; b=PLtiQh1TNjg30p
	oCqBa2u6SSEpjb6xKBU/qKAZqwBXzwbJbkS9puOEObub2XfqwrKHU0ppv/rUIBGEz2ATiA6rDxXqZ
	PmwtxRtejyBelesycgmd2ZIKEnNagxMU4SV4jY6CFbe4xBkZRqyY/85x1BRphn+QTy62TmPk1nk8B
	X9ahLCBQkLl0F7fM903dy+paMgCtD14XA1FFbCBY5Ohq94RqyyMrgiTpkm5uAXkmrX6v+UboIgz0/
	k0JYbLQSlBb2MbdrIdOX2NV7aLpNBl0sdF4ET5S2M3xTKNMjULw6bn/Hgen7Sw778L+fgK4jzr3LR
	ZZ3LFbsn/4/YAZwu4FWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5R-008WCR-Bc; Thu, 21 Oct 2021 17:42:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5M-008W9C-IW
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id d3so2082305edp.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=mWE89sHweGOY+j+hW1QqqLKuiSPz/xmgEmzzCdXW9hBTP8EQ64s0Ulzhnf+MkDLHjm
 KR8Yh/YYtyBFzl1p6vEe6mifgP6KedlBFOhfoaTRI47EoyWoNUWpEBd1AI1X94KTCd21
 AGzdVVtPBGE8kptSU9ylZLKF1zX9yJPDjfNC+6R+ne11dB7ce0EUVqx8OlXBXvmcBI/I
 jDkL7z2PeK+JJsPCCjyw/jqh3ZlcMSpLKuBVTBGLfiv7ansubYoSnYcKBF+tIwkdzjf/
 9lTzDQetVCj051Vgi1qEmdyveEkm7W6eBmQRVQRSkOrknLN6mANdY//cVx+6WOHK/REb
 NFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=CWyk8e4QalAXhjnXZwpltqPSKtCnfX8WzyRqOYWZGmnt56Be79XjWyQr60k0qWaYdd
 LHqbjzZogT5m92q46LDlWCusSsNCQQbDpO7unpZjyWQZOIlqcQ4CUVo62UueZ/32KDqF
 XT/kow3H3masZB/a4bjceLL6VuRYCLdbY5toYbyjQrsZQ/+eUItU/kIx71R6ufVsj4ab
 VTOci/KNXnRJpzr24UEOwiqoJzc2V2FxFBR6Y0lWuoIPZMniOjtxc4m5rrWnaiJJWBQI
 4/jYB9BYHYUC4a/fI5x0trztDu/F338Y64n77HetlbrrPdrM3llk122e4F2pkhKBsVCR
 LxhQ==
X-Gm-Message-State: AOAM531cG/f525wvnIJpbgNiG64dgBpSGYfc6yoqKO/hqfCJ1shFEeqM
 AB9lna8ule7yWJJCwf2QaAPH4vEpGZFN/w==
X-Google-Smtp-Source: ABdhPJzWkkSvUs6yInTJJZYFPlu1bzWz0iSVhWp1tfIf6nvqfEmSq7afQ7b1RqTbUkWQth7PleQ67g==
X-Received: by 2002:a17:906:4793:: with SMTP id
 cw19mr8576035ejc.200.1634838154702; 
 Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date: Thu, 21 Oct 2021 19:42:09 +0200
Message-Id: <20211021174223.43310-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104236_648755_20811A9D 
X-CRM114-Status: UNSURE (   9.24  )
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

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..8d5f4687add9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-clint
+          - starfive,jh7100-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
