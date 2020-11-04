Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC30DC4741F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C002074B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FH5JK4SH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOvIce5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26C002074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5rtZibRIw0cYOT1yKC6uC6qjgh6oZMZkU4QddlIqWSQ=; b=FH5JK4SHOfOqoXw5hlW7uKpEj
	/bG96CnHKapteCZZDzgGMwrAiLfus6QZIauE/dWFzGHOlSsB5XHxuppBBkxqyiDYHAn1qzUV9slzt
	wr6eyPuoe/5JuBFz0BLHNdh4MygwdIZOVFOCptvHiAvSuXrX3jXGA4xK1tDZJeTBvDDhI5OZ5qHQF
	mLIUuGLuQBEdYA9nv85TVp0cYu7cF+A2fknKPzIwF8DJntoFsT1gW0f0Fl9ToUamH+UNCsQSr/1T0
	d8/OU1r7gPbCzh8xh/AVbWTQw7IreDc0X0q8e+wC1wnZJj+zOZ+sbknf9xXnUBijJ4gjeXrPAL/sC
	s8vVgnEyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaOaG-0001U1-Ld; Wed, 04 Nov 2020 19:36:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaOaE-0001SQ-0c
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 19:36:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id 33so12522147wrl.7
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxIwRMD6TNBg9udmxGZqLaXn9yYcY9lwNa4w1OOgomY=;
 b=jOvIce5Y8cX6tbhY9L9KsU+MZChw1k/jcW944Xh2LDWfP2jwxOiW4gq2+Bawg47x9z
 bNE4CHODRlR5URrZecp9S23e5lzUQfpT3inK47e3MR7A9u2JyHP1M5Nu+flMLBMovr4X
 4XuSxNmW2Ig982I82J5WyB5huHaeXoOCGUxU/+C0hOeCouFqYCUOSu7VHvBDKs4Hyycg
 ydDhqoQ9Bav7qws0Xzs9/iSiy3k+R6NSlYZ2rseiR47s64hWEF0pq5Zjd7FLYVnRCdDR
 NHSrZIOa5qvgwc3XTM+5JX8tmYoA3cGjK5D4IcJjYCNa5MRZmHCdUnAD/e4dR4spsuN2
 e3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxIwRMD6TNBg9udmxGZqLaXn9yYcY9lwNa4w1OOgomY=;
 b=uNWa2E+3MYhtPY3oH53mvw8VDcgfuz4mYWR3f0A3Vn/M4Pxm1jmnHqrHIiL1tbbu8U
 IYWcbV467Tt/6HJClkr47eWygABPd1lYGf/15+KpWH2Yss0sELrWb5dYFU+K9jXevDJd
 LnuzKeaP1+JsMi8hGL6I/Uzhn0T0rlgi9HvYLs8GzUUe0RVAsqa7lfIFwzQzEs6df4lT
 QrVZWpPqJAIpHRUN9IoZ3aj9fgY3uU1KVDQvTj7Dvk5AJEPNZRZ1H+gIofi7BOWJp/8e
 GX9SLppXuVldjbVbtc0qaRSZNfZv6jyqTttRsTr1Jh/+up9JxGZeugo0zxPSaST+mkuH
 3XQQ==
X-Gm-Message-State: AOAM532vDijYyHwv3p7VRGSHVeg6tOGt7Glbnt124rAYRb4UFLzMUW6e
 H5SnrJow5csWZFMvlQV3rqaW8g==
X-Google-Smtp-Source: ABdhPJxku7Y3Kg5JTrtXlnam3qROwaJDh/c2CuIvjzLZI/zWTYPrraJ+G80GnqYixVTfkfiagatmeA==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr33601906wrq.193.1604518596915; 
 Wed, 04 Nov 2020 11:36:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:36:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/36] tty: serial: sifive: Struct headers should start with
 'struct <name>'
Date: Wed,  4 Nov 2020 19:35:38 +0000
Message-Id: <20201104193549.4026187-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_143638_093214_91817B56 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Also supply a missing member description.

Fixes the following W=1 kernel build warning(s):

 drivers/tty/serial/sifive.c:157: warning: cannot understand function prototype: 'struct sifive_serial_port '

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/sifive.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4e..1066eebe3b28b 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -144,12 +144,13 @@
  */
 
 /**
- * sifive_serial_port - driver-specific data extension to struct uart_port
+ * struct sifive_serial_port - driver-specific data extension to struct uart_port
  * @port: struct uart_port embedded in this struct
  * @dev: struct device *
  * @ier: shadowed copy of the interrupt enable register
  * @clkin_rate: input clock to the UART IP block.
  * @baud_rate: UART serial line rate (e.g., 115200 baud)
+ * @clk: reference to this device's clock
  * @clk_notifier: clock rate change notifier for upstream clock changes
  *
  * Configuration data specific to this SiFive UART.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
