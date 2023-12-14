Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6F9C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qqutzu8tSWBvyQuS7K5LR930pUKCdPiyXMTbfFMf6A=; b=D2esCNT+8Q5hfV
	9F3TgaevSAwxv/1IkvvwrX2n5rMJrH+JD+Trg7OxE8QK1D/bpD8BJ1HcW5FLt6+TAMU1sYXBAaKvK
	I1RRo3APWJ3uYZx50oF/7InCeBYmzfA0uEUryKchkOqTRPfkwMARWsV/hfJi6vHuvY9Ak50H2vyuJ
	xWEwDFyFOms3voBMbP5UZbmaXMT5FBKahtigsktvoI/+FI0nKYcqEpjO7vzEexdBElrfjc6dLb0a8
	F0WizNB0WRLbnJYZIimwJqCE0Qv0ion3Iektvt+HR7ybvyLOXBAFhH6L7it/SwJ4d+KlUA6/HFmG0
	fe/gsdf7z4rmDPsh3o/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3s-00HUWz-0y;
	Thu, 14 Dec 2023 10:35:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3p-00HUVZ-1h;
	Thu, 14 Dec 2023 10:35:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3332efd75c9so6822435f8f.2;
        Thu, 14 Dec 2023 02:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550120; x=1703154920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=gDHM0S6kxVaDBYaKUw3K5WPAYXKfa/hp3cHsm7wrALaEMCOVyz4yyYK96+6X/+iITz
         +orf9mmiAXyn2OywNrImt1zpPaKHg4TvxBqQ2PxZrvJxyuEf5WDfJy18Q61+g+re2DEm
         bmHFOBL0Bi07/fDY7eiG8ARwraI0PtFwk0Sso4IkQqKoLnAkCzZnrlK/rQlv/CMlNcVt
         Btih8h48F1b2aaGBjl3z5lMF7hwG+x6T3znKaizHCxNRUYHDWH/ZLaEO6o+A+Be1SHsz
         GK9QgYk/9TXQK2DKieCrwQkxZXVr1rB1YiiRVF9aHWhFmFmhOhatsdfL2n5yJLxq39E/
         /yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550120; x=1703154920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=Bwktfo0Pi9HWPRnyJ9GXNiwoh+ntK/zVAxd7QoBL51uKCL85jq0O5VITkPk2rwmiQW
         hXan32PKX/1b2NSCh5zhPMq9Moy0NRj4WKpRjd8FnKhDsMbfxvx53howrEYYw7dtK9a4
         sg9uOiGxkj42xVIumJ8rgHPHx+O5pgQT/KsMUpFU/TG2Gzu0PGqmPk7k66Ruew8+XeBu
         3lfl//Zi3A3wRNCpeZMdj4nUvVRTFYhFcAIb+dLlHUsm7jJ7xYzedMqOjuUnwZg+Wu5L
         PYNQyF44/T6ehjkzCMGHiDRdEecy+C9kuVjczTvoTV2I3Pw8Nb/cH4yGG3QeN+s4KjZo
         Imlg==
X-Gm-Message-State: AOJu0Yx+dEbrJd6jgHXShYu/vnZXBLfjAgf4IuhgHtThEkQKbNknYBoi
	HtreQXoZhTNbh61fT+/s71Y=
X-Google-Smtp-Source: AGHT+IHYPY97jc9qd+t5is/0cCaszwyL2E4cFGf6c7JTug0/K/MlULH3FTa3Xttj5loEfnYxN8qi2g==
X-Received: by 2002:a05:6000:235:b0:336:4a69:aa98 with SMTP id l21-20020a056000023500b003364a69aa98mr115808wrz.122.1702550119975;
        Thu, 14 Dec 2023 02:35:19 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:19 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 3/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Thu, 14 Dec 2023 11:33:40 +0100
Message-Id: <20231214103342.30775-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023521_567864_1496F5B2 
X-CRM114-Status: UNSURE (   9.65  )
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

The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
so the "cpufreq-dt" device is not created twice.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd1e1357c..2febcfc2c 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
  */
 static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "allwinner,sun50i-h6", },
+	{ .compatible = "allwinner,sun20i-d1", },
 
 	{ .compatible = "apple,arm-platform", },
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
