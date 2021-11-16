Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35495C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F420E63214
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F420E63214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGIWpxPxn4uy+9/yPAqkd3Jkrk+J9s+gtDo9Mxi8XvI=; b=NsdfGPTFXxO+/h
	k4JDaAZ0JdWj7rWa9ddc2piubQvdBTtP21QYZI0orW8EMKfLO7GIGjpZQFs/UfO6KdUq4OTyAsts+
	1u++yvhyr4f/+1NW3EkM4c9zaa5J4pL9GMgmoiAVWAikum85bFyLgL+Dx2SNhbxuKy0IkQtAR7LgQ
	zwQy5lwJpp2VQE0uLjKhE9QM5nz/Zf+lElM0Zip1WEfRAff6iArVULWYhGdZohONWHeSEPAv+f4Qm
	9Lz/MZQFhr9GkO+EXUt5XsSqr3VLnt0EYxGeV6URfKQv7h+8dSVZClrve9Y67DNoACBDlhSWz7aBO
	vDTPC7zbITbbOM/EIshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzxz-0023Yj-TQ; Tue, 16 Nov 2021 15:01:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzxw-0023XV-V7
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:01:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id t5so3600209edd.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=n9SeuxOXS3gI4AQNwEJV1oIlLn5uP2F8o0UII9zWz5LDEqfCBTVOn5m70Mjt/FVI59
 NlUSesXzufLGX5fWoa+TgTya1q+4LjU6VPDpsAw0EnjHO+T//9b7jFAAy/R2M44bvdSM
 /am+b4XYKGSR0upcBwY/+6B57gNRwBZLkSuwge5PfotKg2jCNV1Fn8NHXtSv1TiqE8+o
 Tpq5viWNUvtmDM38/cUZlU7JuC7brgk5Q8zU1SEgGlYEoPU6VeSGc0oHIwipiUo3FzhD
 VyYO+yu5eavWgkSgjERs/6VKy4B+1nQgq572MKwS+vwfS2dknwB9OssFIvAa40H2x8rT
 2WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=oYB2swSt+cio6ygnyn6YEctkVZlvPwDt1DeiTdoF45EaDXaGPw9kIySXSGsHx20iZ1
 vub37zwEaND+m/274JJb1l6f3mkAFskL+ThmxcrVSYbcj+IjqZhLJvIUP5plXBOCCCD6
 adin2w9iLWGwKXfIutVH0Oz3uJNJYd25QOw1CFB2jv0RnFpXqA25hYmQqCuNf36FqqWr
 dpic2ggiFc+TuqPGwXKCr3g3LrnoRMEo2MPfvEB1nzSBP9/S3MH7Xn/WJusmOz/M1M5z
 nZzda6v/YKXuxE/6Z4VauYjHbHu0o42X6tmOw9QNT3wnAYknW9m9cXxIyWMspzBC9k9i
 mn8A==
X-Gm-Message-State: AOAM532XhVk48xJfJQh1qXx1BdsTqdZMeY7ZWEeMPDP0zIsTNNqq71T4
 zCzlIFaGebPiCn+hYCFLZsfKgodRj48LZg==
X-Google-Smtp-Source: ABdhPJw+EQ13uDQl3bfi5CHEZDvZZHxGJHUGTdHoXtISUwk6v3kE2Bnu1lG3gg+1Uy+IoWc3a0Y7dQ==
X-Received: by 2002:a17:907:a088:: with SMTP id
 hu8mr11082855ejc.234.1637074902328; 
 Tue, 16 Nov 2021 07:01:42 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:41 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date: Tue, 16 Nov 2021 16:01:05 +0100
Message-Id: <20211116150119.2171-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070145_032654_F1B13D93 
X-CRM114-Status: UNSURE (   9.46  )
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
