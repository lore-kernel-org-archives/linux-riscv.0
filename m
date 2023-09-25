Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D35CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-ID:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cM2hLIteQmmK29l9dv+IxEOlCDChB+cNHLgoHlrAUnI=; b=l6H7p83k+qMLQ5
	TPTcdBBElTAXHLQE/9EPoBbvgIAnNB7uGFGAPDw4G3CCqsczm1hOTdDyeXPq5luT5KM2DpBBZVJ49
	3GCpWIkjtG+jkUC6ootB8wSsFWKboh1dIcGtivHAMiwYFTqqjxQyArG/0m9Xa6iM3RS3gbbP5w9Da
	yc11DNOwgaXYk9VDv3w5LoHntWTZdQGtMeLAS9a55ZTAQjyydfsVmiwtxu3PWQxnow2fdrDhT9A8B
	QZp7cMcybBXp668pqoP8OUpllEEhPy7ysbSwBmf1QFFTy42Y+v7IoKtPf/+xs/+FjCq+Bgngjo3OM
	owZGnjq7wzfuSdO8Vh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRt-00EXlc-1p;
	Mon, 25 Sep 2023 15:24:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRq-00EXkk-0D
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:24:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27751ac0653so1487544a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695655470; x=1696260270; darn=lists.infradead.org;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=suBpbD/fhcF2LiKzuoSQV3QlpUgd+yc33AJZwdJq7fg=;
        b=v4rsMxOc8zaJU2OLVM3geaTI/oX0hG4gnnEBJZFHcP9X521kCkNMDO2CUOHzx29VJh
         Hq+oL5uUwoPecchrDZAB0xXfzeaDCRKDoyA21W3sucphihc7lTAQIKoQ93b8GZWEJre3
         hgCQugRC7HBfKo9efQ9BFMqbpWh8XuUfD3bYEqNzVsYlyP7lPU9iqotVVaGdDzGvUXWm
         J1HS2Z10OCxBO80qXhdt57yoJKcNcvF7jsJN4oXJ7OeByIh2vMLee99yVrgOh220aST9
         3MVs08lt366aSGIEf80Gt4EqoZqs572NTcQGDh9981UZ4T3pQoejU96yXqRL7ebiCvWH
         aX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695655470; x=1696260270;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suBpbD/fhcF2LiKzuoSQV3QlpUgd+yc33AJZwdJq7fg=;
        b=Kn5dDUyPS0F5L0qUCpHPkgK+FrDbX5vHC9VZoQRt0v1LJ+OsyYMu0NdfhkehyVXwf2
         svesPgV5uwTz/ZkN0SWLXYjfm3ciphZPZiHbV710uflLJeiBlHvvTcZRxZkG/J+6Smzf
         u7CLK2d119ayRnYQdoGY1HyYyXn2c2Z0oX4wzfCwEnAdWJw5v6OQDQ7fYJjc0BaohD46
         AHD/bAYxnHimMeXZglKzesYsgXnOEZAKA4g4fkxhX/sQMcOEIvSFiRTwxGuhP8wM4Dmk
         SRM16njxrEMLhxw/d1DRVrIe2+yGASjStEy8Xf6IghmM97wmBYptySLUlJQmuUNEjU57
         zU3A==
X-Gm-Message-State: AOJu0Yxg52HLL56iBcbnqfhWNzO5c0blmTChp7jzwypUqYcAIocMAeny
	YRVzJHMg3ewagOv1dT2oGo6L++K8sCrBbCbUuIjmfg==
X-Google-Smtp-Source: AGHT+IF++gneFaUoScjjEm1YQmbRjFbM0pMz/9sC08nquNEsUnXZiZfwdfyuIVmv2INhaDMheMui8w==
X-Received: by 2002:a17:90b:388d:b0:274:98c4:b6e7 with SMTP id mu13-20020a17090b388d00b0027498c4b6e7mr4280702pjb.24.1695655470130;
        Mon, 25 Sep 2023 08:24:30 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 20-20020a17090a199400b00268b439a0cbsm9018081pji.23.2023.09.25.08.24.28
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:24:29 -0700 (PDT)
Subject: [PATCH v3 0/2] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Mon, 25 Sep 2023 08:22:18 -0700
Message-ID: <20230925152409.29057-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_082434_330671_DFACC9CA 
X-CRM114-Status: UNSURE (   5.91  )
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

Looks like I forgot about the v2, there was just the one style issue.

Changes since v2 <20230830044129.11481-1-palmer@rivosinc.com>:
* Don't initialize static const with = 0.

Changes since v1 <20230712115740.943324-1-suagrfillet@gmail.com>:
* Fix the rv32 build with patch #1.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
