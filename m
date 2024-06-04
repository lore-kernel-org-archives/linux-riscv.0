Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31864C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zaQcbLsyoOFsUfa7ccCoXtwgeRXRxs/SKr/jPq+qosY=; b=CB7fQgR+DXwOVI
	SS2Zl8/johHRHvst4H1ei9yRs4oFMfXULhcp6DrtPpxyhXYVVzOlwQCoGDMdq1NZAk8r6CYi25zSa
	2xps/qLU4OUiWDhIpGzNk0RJi2xXROxf0MQCzcHAVxlbmI6nK9w+6FkmMp9JA3DybsjX8BdIxOUq6
	tw2/IlxJlNbfBqp2opL7Y85t55giW7e+wLntd/0dLOQv5UcToz4j0dIWVYFiOvKEB8w5hzyd8soQW
	6qQPZ35pr/XknRWt4KC3ld15huw674E8rhnFkXYiinLPvSj2ll+KdqAo/WHzbsARrlcnxUCfGfnRV
	JRz/GXyKXtpKI9RqIFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETrF-00000002Qy0-44Ue;
	Tue, 04 Jun 2024 13:05:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETrD-00000002QwJ-0B8q
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 13:05:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52b950aa47bso1390038e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717506339; x=1718111139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcPd0EvGWInISD65KsuyYkyeorSvJUBJhZgfuheFWcQ=;
        b=bs5XQHyf2GMfQD1CBxMvlVxRqimutfxQzmv2Qyz8Ggj25l/HJ52KeCe7FN92s8UORG
         ZwYTiqR7RdLkLPrkF/ND1fwcTv+SYIBYw5/2EmzHKCV7xKLVT8aymu4ZQ2gNa8toIrlM
         uCE0cLrdCi3SjeV1hud/a1sqarc4rDzQ/R5hVT+lLLDfXbZoFZ5TtUvp0CLC3MinOtkX
         JhINXiFkyiKozo/6J6I0Z2K/02WJTMYViJDbW1HaUYMkq9eeaUMm2wZThU9AYFAJJ5yg
         DyuGiMfwICvEC2TmffqI7+dfAMw1huZkvB4O4vCupY4pH7St31ariThjp+JhgMg6RdQM
         aq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717506339; x=1718111139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcPd0EvGWInISD65KsuyYkyeorSvJUBJhZgfuheFWcQ=;
        b=Zo4iSWFxE5V/lTiRYlV7zl8GqjKYNjcvQmqmrOP8uCxwUpZNfJRFuR0KIbHO88RUg5
         JKNSplcZWMeCWdpo3IPLC+QqGI489oMkakwinXXO9CI/PnAJeXhiT5Qz8xjBVrTaO2dX
         TnXkzzdqslVs0ixdbMcGc058k4zcIfy8eLEoZEkx9C5k+1eJzyXnB8kRTjCRBpEbOMdC
         4mvaRkJ3M+n5PvfPsVSaFbcVTRUNZIBX+ASuCuFjF8jHR9sCGpLDX0BpkuHuXrP/hGU5
         Maw8EeXK2n2PlNJerO/btqecsGjy26LQyZGgDmfG+WTGVIdvY2CvPpwn51i+6faAynOo
         ZHaA==
X-Forwarded-Encrypted: i=1; AJvYcCUoc0MnpVHcRCAxO0jZezWeZp7bl8s9e/LFaIW3ndTTwSX1HM5V9B99kw5ZlepcoTqDm/OVOR0TM47dvd76Yoj1po1ZGHhRDDkeeOqMGzzS
X-Gm-Message-State: AOJu0YzTj+dx5wM0fza57sYfwdpKo5Qr56bgYJQHaVyxEnHokiQRbJlP
	5g16zL+hJ6OEhFF+MWqNJWhDGanZTT8JLeSjcHmWLMqXfbuvIjMYhtWeC+PZNPo=
X-Google-Smtp-Source: AGHT+IGQ0jryfZA0LLkh0n2aqxVrJ3UY9JtqM7qOVOHdB/b5Ws7J9Opew6MYO5nTDhRe6XK+lzEUpQ==
X-Received: by 2002:ac2:59c9:0:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52b8970c011mr7177186e87.43.1717506339216;
        Tue, 04 Jun 2024 06:05:39 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42148ae3262sm29798955e9.7.2024.06.04.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:05:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH] clk: sifive: prci: fix module autoloading
Date: Tue,  4 Jun 2024 15:05:31 +0200
Message-ID: <20240604130531.170371-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_060543_193224_7CE8D4C7 
X-CRM114-Status: UNSURE (   9.10  )
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

From: Krzysztof Kozlowski <krzk@kernel.org>

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.  Clocks are considered core
components, so usually they are built-in, however these can be built and
used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 drivers/clk/sifive/sifive-prci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index b32a59fe55e7..caba0400f8a2 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -603,6 +603,7 @@ static const struct of_device_id sifive_prci_of_match[] = {
 	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
 	{}
 };
+MODULE_DEVICE_TABLE(of, sifive_prci_of_match);
 
 static struct platform_driver sifive_prci_driver = {
 	.driver = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
