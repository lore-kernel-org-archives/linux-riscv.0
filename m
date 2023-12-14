Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8763CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CqfFEYWqwcXQsA5P7yJrn+DjgBnpofn3GHI46LHHP1Q=; b=QHQ2QeUWbjdqmc
	jYdWgCiR0Ip2WcLvW3Gqc9x3olGG1g8EcUgR5SgP8cpTZY+fPgFzr31l4YvnwyjSuPX9lCCAZG+qi
	ZRUnHIMZGjofjNCvlZinXcmrTj+XITYQfxYwwOpMzzv7uyH7XJQ06R3pnETW0PvogXjC4ml4HJzaI
	T+lcuyJIHM/nDd2yYF8DFV5w97yg9VH7JpsDUspzZiR896+aspV8ldpV5IZdfbiK7qX38+ubDtSLT
	PP/3xQUQ0MOOiU0sRkjjRvDxDxqNvV7HrKxlLAit2PAEAy3n6pijZP9rw+uUL99zVXpcUzE/zmdQn
	LPdAdO8IDET4sjggrg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj2l-00HU34-2V;
	Thu, 14 Dec 2023 10:34:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj2i-00HU2f-36;
	Thu, 14 Dec 2023 10:34:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-336447f240cso616538f8f.3;
        Thu, 14 Dec 2023 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550051; x=1703154851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9Bav5GT9+DiIlOayf2xo0fOPFAMpMbevtPaUgb/OCo=;
        b=P2wBDre9HgbTZbzWFEqb4hHFcFYsMe/ZtX6BbGIimWMpD2UQqsf7p1ZuoXeBKop5Ct
         E492/0lU+6wlZQXMqiNfXdkNta0reYYbqCHTkN+tvwU18WyTOAtSs5AzoPcD4Lefhih8
         pLMoriDj4lHd6487/cOY0bhZSFDD8WU0B0V7qSABtc8340suTV56hPgezanz1zyPsV+o
         pQWXDo4ajMNFLdRITLncYvFZhkvjUdlqIZWRP2+zah3nfn7LwL+iSalX44RffrMCz7jr
         ZqeJlazYsFtrZwh9KyOOTOhZr4qGySPpHHgIgRYE6Os45IHtULcElMW3qg19tx5F3zfn
         ZD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550051; x=1703154851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9Bav5GT9+DiIlOayf2xo0fOPFAMpMbevtPaUgb/OCo=;
        b=RfvzA9Wc6QoE9d6sXtZ1Tl5eJ5ixm3WbDjDqOXJXTAqv9EuWPOj1omA1TaIkoAX4fr
         46RuuoNVfUBXym5D8vpUyT/D6Xy3nfNTfjemr0P2//KYz0o2wgIKpw/hf8MFwRuSzrlZ
         UK/vMDG2fayW4Sx70fcka/RYkPkqbSnOtSUukYfXm2+9iSTWoePTkYRGodK823vt+gxv
         sWnIwoFNYRrN+oig51O9j926VRAQtVdCV0NlhVUTnzLADIzwC1TtjBR7BVMU2QBXSd9T
         XMco4QSOC7LonTASnbh2FchWqfUT9MBt4FGi5GPLZS7iXVY2Q3EGMqxf3hX+i59blP5a
         MQvw==
X-Gm-Message-State: AOJu0YwVFfEgWw/mMAIkHy4ezfle7R7SmpOsjE+cplXBEnRm/nvaKwjU
	eLLlIt8SCd1eSQwbIQ12/X7YIpLtB5be+g==
X-Google-Smtp-Source: AGHT+IHU8zAZ+E9+PZta62TwukgImvaSq5gWkMu2b2zX9JqnUFdExGM5t+FRMov8SdJb0wP4JxqGjg==
X-Received: by 2002:adf:ec8e:0:b0:333:2fd2:51d1 with SMTP id z14-20020adfec8e000000b003332fd251d1mr5060094wrn.74.1702550050755;
        Thu, 14 Dec 2023 02:34:10 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:34:09 -0800 (PST)
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
Subject: [PATCH 0/5] cpufreq support for the D1
Date: Thu, 14 Dec 2023 11:33:37 +0100
Message-Id: <20231214103342.30775-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023413_020936_73D78053 
X-CRM114-Status: GOOD (  12.72  )
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

This patch series adds support for cpufreq on the D1 SoC, and a new
Kconfig.riscv file to cater to cpufreq drivers that support RISC-V
SoCs.

The changes have been tested on a Lichee RV module.

Brandon Cheo Fusi (5):
  riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
  cpufreq: sun50i: Add D1 support
  cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
  cpufreq: Add support for RISC-V CPU Frequency scaling drivers
  cpufreq: Make sun50i h6 cpufreq Kconfig option generic

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
 drivers/cpufreq/Kconfig                       |  4 ++++
 drivers/cpufreq/Kconfig.arm                   |  4 ++--
 drivers/cpufreq/Kconfig.riscv                 | 16 ++++++++++++++++
 drivers/cpufreq/Makefile                      |  2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |  1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  1 +
 7 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cpufreq/Kconfig.riscv

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
