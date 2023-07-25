Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FB5C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ocul+7Ez016G5kc0BKvUnkcZSbiHq2qsG29L3/dxeJk=; b=Bc1Gb6LwQyfRpW
	3HezVbChH35Ry/45CdpHTwSp3uB9IQisEGs5guqGpH+M9YmFSfAnVTCEhVWPFTBw6uO4Ql8tB6q1I
	ebYfEaOEvQj0eYXhMyMb+jvUeeoVAapOGndJDzwMkrAOcZu+BfFZfR5HLJPnZRBeXiHKwgmkYBnmS
	D/qe1grGvFzkvFgNCk7Y7qZsmVnzlKgC7k1jAkFiGhkHQRY5xsk+mlAngUbx9mqosopEO+RxuNin4
	/jdLkx++2mv4C6GUlDWOjHgicp0VAxsH9YHumBZS4Wcw/BXQnXYdZRcrtcq+oq8cQFj9ik49WUHoU
	Sl6t80evDMMabAGIR9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66d-005kwP-20;
	Tue, 25 Jul 2023 00:40:51 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66a-005kul-1O
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:40:49 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso2012426a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245646; x=1690850446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJKuxFWSCWcxrpIbwE2dsS6yrYr3DSEy+K+qzjCR4Lk=;
        b=l7xvwTPERLpVvpQQOA4WRpuVk0EuJsgNwRQcR3ONJJsnjusafrjTwvgqUddBw4Wuh3
         BmRedeIM1hSUMspYRBmjkGxjYLDJEqbay+FwFo1Q9dvcHHfVhl9pehB9LoXpozEKnhRX
         lQo8f+NtlifbPya6IiRrMFhKKRReXp4TsJ7kYVqpdAH8wCgrV0fmTz90qmfNEd4eibVY
         5PgnFKtiNUMPPs0s8no4sflNGsXYaEl0X0FahJOt2IAnSPrA5DJLa01vafOTj6HvFOoi
         FLL7+CGmvCIDcRvhEjSwGlO82XHwYPeKazIdmMz1mT4a/fghYeAJ5+VPdHtr8KA4vzJr
         n/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245646; x=1690850446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJKuxFWSCWcxrpIbwE2dsS6yrYr3DSEy+K+qzjCR4Lk=;
        b=BgcZoYrZZrB0nibpOEhtoqc5cAOsl4OFf35+a0SYItLDycT+dAPXR7mgh9DdbHQRpM
         ElDWw5ogzR72JJYIvC+WsMSONl/z25E5vcNnFoeMPyqZCbK/r93Wk7FlCO5vyiESCz6e
         xGlewpphZjSKA+AoQeL+pB7T79fv0abFcVsPaj2quThkMMo18LoYfoAa5i5GxvaFgMoV
         10fiJeRHvY2QxECSNDXzMtUTGyGb0xFQHBQMkzicP/uwLs7FeqMTHq6ZK8DX4SSimsK4
         1/9Jhplb5jjTcqaN7DuBXsXLafyaIGbo5z6D6O5aq5p0mtHXd+YlVRuN13FEqOsetifK
         DPkw==
X-Gm-Message-State: ABy/qLbk4ogvUnM6ir0/1LTU52SmnmHW4uGKQq2A9ouPnmpot3oDvYi9
	DBOUoIOuZVnCN4SwTCkQ347ORQ==
X-Google-Smtp-Source: APBJJlFPb8LJJqI+24wS8Kl8vPzsOO78+Laoq3nKP3BBOg08DmgXv0tHgVQiYwYl8RCqUvPRzBE8VQ==
X-Received: by 2002:a05:6a20:1053:b0:137:23f1:4281 with SMTP id gt19-20020a056a20105300b0013723f14281mr11113757pzc.12.1690245646421;
        Mon, 24 Jul 2023 17:40:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:46 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] gpio: sifive: Module support
Date: Mon, 24 Jul 2023 17:40:38 -0700
Message-Id: <20230725004043.381573-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174048_467790_AE686EC8 
X-CRM114-Status: GOOD (  10.33  )
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

With the call to of_irq_count() removed, the SiFive GPIO driver can be
built as a module. This helps to minimize the size of a multiplatform
kernel, and is required by some downstream distributions (Android GKI).

This series removes the rest of the of_* API usage in the process.

Changes in v3:
 - Use dev_fwnode() instead of member access
 - Mention the SIFIVE_GPIO_MAX check in the commit message
 - Keep the variable for the parent IRQ domain
 - Add a comment explaining why the IRQ data lookup will succeed

Changes in v2:
 - Add 3 new patches removing of_* API usage
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

Samuel Holland (4):
  gpio: sifive: Directly use the device's fwnode
  gpio: sifive: Look up IRQs only once during probe
  gpio: sifive: Get the parent IRQ's domain from its irq_data
  gpio: sifive: Allow building the driver as a module

 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-sifive.c | 47 ++++++++++++++++----------------------
 2 files changed, 21 insertions(+), 28 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
