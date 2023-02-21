Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A8C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RGLQHmAWpX0PEQvFxTtIr9y0pekrcLcPty9mDWJ5IDo=; b=zNBFlE/9hBG184
	wYDJqOj+flMAjR8z13vjpMLFBaQ0o7sqMwy2U5/qyX9B/2nHVymLSYZxwfqLvyL5EwZ+p7bibjtmv
	fmhLupUzgmwm5kTNbFbW6w1fYqy7goE/Ea6wBO1Kpxg2PYFOr1rhWFJeN2ydZbz/NgMiGhCFyTHX/
	Qu95R8q5Ti+BlFgTqyx8Jt7IMbeWxOCSM4/IqWeLVJ72gTDZalfrwu1UDqbGm2VJRB1r2aDXM5taN
	w0xhXXDJ5gS3SAfoCCkUu7n3HcUr+8RKw9HFmdKcqSJ/oAQXK/1haDNJjN4psstK8qtjooH42HSKU
	33e4jlhiu0UWbRu914TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoI-009Rl1-4J; Tue, 21 Feb 2023 18:56:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXo6-009RgX-V5
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o12so21666984edb.9
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZIzRvc7dIUy4nOgy3khITy5mNesAgpukiOZYMO9HBs=;
        b=CvMGdA2lSm6clJ2CTDceKhf4cXVuAZENovyg8Hb83ly5hVB4B6HrdzG98kZLmB1qkq
         8NgxYbmOuE/exoxTrAnURz/Ks9g+BwvumtEh6lI8ZEv9rOSsWbqulh2v6mA7W5M3l6o4
         up4y3UtypVaOGH6EfvrMXvcg8HZTd6PRHYTbE/7l6YtOXI/xNXas84MQxjjGVUpJoWMj
         OyijrbpJRFcFGLlbYn2RXZyVXI040O9TqNWD6YDnhVk4JVlKM6rqHgumolJeK/7LFcKX
         uxTYc2sAxLBrDHCl1pWRIwk6SGsafHYJdygJ1ah4gUjiBkbm0lgkdExtDdqAL87yc2WD
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZIzRvc7dIUy4nOgy3khITy5mNesAgpukiOZYMO9HBs=;
        b=0FX7ObxLGfXt5wle1g78/ZkEy/ILCsf+8xbvfh7xLJYbJ6bNGJhU98ZP2+LlhcZlIn
         P3hSRw03+CnGMZnT486fTADoJl26GPJoLxoJt7cNGDVB2Qud6hq2dNBxNPTxkixuT4I+
         UbP2k/aO3rFcDYi/QWtNN+tzD/iozEhOe95w8khsMgcSmVmFY7xKLyOBN6wSkwLeC4+q
         XO4UikJq1hHA1DNEHBriSGg3KOusrVHK2rq0y2CvVbjn71VEJKZNLOclhQpl3Xfr8F2v
         YgWegFdv2mZXgWzW6FX5wkPVr8vGSYulCfBrUITGyJaUmH5e8suadGtr6nL48ksG//M1
         llJw==
X-Gm-Message-State: AO0yUKWs9Qd2mpf4DVqWgJMm95pZxlLFLhxMjyEZn7OAf9of5NOq3/Mg
	nzRMPAwlMvC5bCmMi6sUEwpjFG7PUR2JJ1xr
X-Google-Smtp-Source: AK7set8GGuiFrlj4F2eQPMlDPdgOeU20rDzUVpY872TWxAEwkH43uKvZUCVzDPD3u71kC8rrxQWgHg==
X-Received: by 2002:a17:907:98bc:b0:8b1:7b10:61d5 with SMTP id ju28-20020a17090798bc00b008b17b1061d5mr16540173ejc.33.1677005764488;
        Tue, 21 Feb 2023 10:56:04 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm192002edf.66.2023.02.21.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:04 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 0/5] riscv: alternative/cpufeature related cleanups
Date: Tue, 21 Feb 2023 19:55:58 +0100
Message-Id: <20230221185603.570882-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105607_018518_35A5FD62 
X-CRM114-Status: UNSURE (   6.51  )
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

This series has no intended functional change. These cleanups were
found while renaming errata_id to patch_id in order to better
convey that its purpose is larger than errata (it's also for
cpufeatures).

Based on riscv-linux/for-next

Thanks,
drew

Andrew Jones (5):
  riscv: Rename Kconfig.erratas to Kconfig.errata
  riscv: alternatives: Remove unnecessary define and unused struct
  riscv: alternatives: Rename errata_id to patch_id
  riscv: lib: Include hwcap.h directly
  riscv: cpufeature: Drop unused includes

 arch/riscv/Kconfig                            |  8 +--
 .../riscv/{Kconfig.erratas => Kconfig.errata} |  0
 arch/riscv/errata/sifive/errata.c             |  8 +--
 arch/riscv/errata/thead/errata.c              |  4 +-
 arch/riscv/include/asm/alternative-macros.h   | 72 +++++++++----------
 arch/riscv/include/asm/alternative.h          |  9 +--
 arch/riscv/kernel/cpufeature.c                | 11 +--
 arch/riscv/lib/strcmp.S                       |  3 +-
 arch/riscv/lib/strlen.S                       |  3 +-
 arch/riscv/lib/strncmp.S                      |  3 +-
 10 files changed, 53 insertions(+), 68 deletions(-)
 rename arch/riscv/{Kconfig.erratas => Kconfig.errata} (100%)

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
