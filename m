Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0AFCD98F2
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsCQa7V1a3TdF8YHMbNyCE2Y+avM4tY80ldPL55KxpU=; b=mrDdhuLcfQNb7P
	18GPZBAhnj05Zflci+GeQcdbJH7FlodqKct6fNKW7uh/a7xHi+FYQYPPBz1/10Vg8VOTfgT/1nTCj
	kjP8UzQqI+H9bcAI2PvNEihRQxcpdDm4TwQff1ig/6HtI9wI75CAW2X/tQ/QKdG+0p0R9TKQQHBmF
	Ci1nEP/CQs886m6rJ4nDRGkUrUx8fNkcBnpNbXXcu4jaOAlQFY7bR1Jx6Zc/DbTtTEv4k7HR5z5yo
	o+dKkEfH+VVKkb+M18YPg6zdkAEZvtkkr5f8T5JDOw3TdCSRY0PxZm+FJrB3hLPuavXhLCHM0CTWq
	oZtChU9FdlzrdEInrvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPct-00000004APt-3yQt;
	Sun, 21 Jun 2026 21:22:47 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPcr-00000004APa-0WG2
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 21:22:46 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-399735e64d7so43139221fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782076962; x=1782681762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+wVB51ZpR/4K/CBW8nM4mMjix7DXbk9G9wR8jq7CTs=;
        b=s40NinWPnoANM/n6zM2NECRTh+X2h2cqGzvlnP+wBST1WhT4nCidp+P6inw/w/pdWV
         W8UlLNxbapD924mZ+QlkJFz6OrswG8Ie7h3LTHIR5z1Dl8hnhcqBewrohCDWOc6vr0kW
         2FzUGaBb/Vt+gLcmAWBZf3+xLI4Z7ebhxXaGcQCEyYJlE9Y+mNl0NS4WM7uHO4DNNS+h
         41xMq1QCjbDMpWGqKVsFV3IlidnnX8nHGjilKPPpBKxcxC0lH1iJWf46UDeZtn60oKvd
         EAT6rUkJqKaNKqJhHqCrb5X98eV+DzmnebQiyem881PT3gMaf0w2TLfEkzBdZNzLJtUW
         48RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782076962; x=1782681762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+wVB51ZpR/4K/CBW8nM4mMjix7DXbk9G9wR8jq7CTs=;
        b=loZV/udq5ATW83q9yXp+w0N18xtByYj45BFlgsBqP2Qet6YpzAAVU60hDA9Geokmjz
         LekktuI4U3TK8IhC37AG+zijzffB54NFL+Xt+UqOt0wtWIGP10jw8evVvelSNbUQasP1
         auaiFOiThXQEjy8y/eFGEOp+uIau2q4Hbz+lx0KjYhY2qPhPB0AS1jII1i5Hs3+N7N04
         55YHmApXyczA9EXckrZrU4cuQy2mrNSG0VAYyEXFnfoHYK73APY61WPT6mbKJgINll6+
         eOFz+mqJPekwGf7SvI3obyq2BO/wg+F/NLtOtwv0pRfyRskrmCckyEFgp/OfiAEn0tkP
         b8BA==
X-Forwarded-Encrypted: i=1; AFNElJ8P9MhkSZz8yrR2ZXb1+0b3z0Ekv838INQPU9oyk38DVeS8XxiwXGT18gb3jsz5ob+49Vh9MkyRewzwGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUNb4yMw5TbxG0Sq7aerdhKFNDnH/fPfBEw3yxASih4rmKK5MX
	x8YSMTcrwsI54tbQSkKwZe94mx2ScIPqv+iUX4xG7wUoS3yPAh6/rqKkIGJaFewU
X-Gm-Gg: AfdE7clC6fud/oKABiDmkLJKFuvG8nJG5gSe+Daw9t9h37KELRrcaZvPZzy4XjXw3je
	mpRqvfkMnvaIxA+b6iOpSYBJTumMT9d1P22wXzLJ8y5dX9ZqqeZBWHNyU5rqFKWgqlZA6bXQ9cz
	4liOUX3eb7LWBVY4TxeboSwBZZNCsLLmhdo4EpEcFHzGrHR0MJ3cpYQKc+eKG6J4hpRjJcPZfaV
	jXhI4uVYKtmOZ514eaAj3dlFXSsOZqYMdjXgpHgoKH7lXGSUdBAWsNl7RvKJcmXZ3CQsy7kiT0P
	B+6h/kxBWgLnyOaJWKCKCtV6BiXp3PbxZYwLp0yfBWSFeZVO+NW6nZM7nQYTZ57SnUIB5+qoN7Q
	DJqT+peTzSl5dE1FPaPH5n2FKABSCNawBYrDFJcNp0QFJ4YEgUZMfPsyGReyjEkjbbTkhFYsrLj
	o2n04ng7AKNQBfkqZLe47UafN7kl5S/QwILMZCjCda3Zsp6cvScA==
X-Received: by 2002:a05:651c:12c8:b0:399:5c27:79d6 with SMTP id 38308e7fff4ca-3998bbfb35fmr29994121fa.4.1782076961864;
        Sun, 21 Jun 2026 14:22:41 -0700 (PDT)
Received: from ik5070.localdomain (85-253-35-150.ip.elisa.ee. [85.253.35.150])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3999b17f8b8sm13494461fa.28.2026.06.21.14.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:22:41 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start process_srcu()
Date: Mon, 22 Jun 2026 00:22:40 +0300
Message-ID: <20260621212240.235045-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_142245_171679_B0206437 
X-CRM114-Status: UNSURE (   4.56  )
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

On Sat, 20 Jun 2026 05:25:25 -0400, Emil Renner Berthing wrote:
> Unfortunately it seems to halt booting on the Allwinner D1 single-core RISC-V
> SoC both on the 7.0 and 7.1 kernels:

I can confirm boot failures on Allwinner D1 (Lichee RV Dock) starting from v7.1-rc1.
My bisect points to:

  ff1c0c5d07028 ("Merge branch 'timers/urgent' into timers/core")

[1] https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
[2] https://lore.kernel.org/regressions/20260531165138.2696250-1-indrek.kruusa@gmail.com/

Best regards,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
