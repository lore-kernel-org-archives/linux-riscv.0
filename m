Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD0C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z0cGkyMTZkGYylHOIEPW8aAYx4DAOiEqdcrgitSZyfk=; b=mPpVgl+NO17uRe
	BGrCdDKL1hWhoK/gMgLGvuuMlRtbcModvdSxQZIUlL6DhfArJGxkACPdJwUYoaFeTs38kJztXIrzZ
	hNrygyjPkLsehPDljaxD14RjeoSUkBEw5QJ6pOYqau0Vkq3Jq+thu2XfmIbOuBzxhPZGYe/XKdYci
	32vUa6FshuxoZWd2bKcoViH+R9VUaCA/xBvbUy4txNHJYVCEV2UmWMS4Smuz3a3PMiYNN0ehMv064
	gqyeEGZeuWwjjB76Pi9tsRkJTZalOlxHWbyBeh/WXOUbkn3T0qrQj1gRoKHuogf1JBZVKuUXHQkFv
	OzQnK218++4BVx6BY2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesJ-00CW7e-14;
	Wed, 25 Oct 2023 14:28:47 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesF-00CW5s-2e
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:28:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso4673544b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698244114; x=1698848914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEwjrIZXUzvnboalMTbBIVYhD3jIm+zf9phzakfFM5w=;
        b=T1cj0WXLhBcMlkyRpDH4dabxw2R91SuY8D6b7LWTWxI4wGFx6xE2pjfGlp30wRzQYu
         cJiNJwQ519OSXA0dVpW4l+IPS6qseJBCW7xVtL3F9TA7lXKZCPMxy9GA1St20Xmj5SuT
         xa+l4sjkqX5qGnLts6bzvyjf7rm0o9H5hUYHWsr/xRpHdl8c7ldC/C0LqUzfexv0EcVe
         +eJfwbHciJ95mWzOgDRQWWCa3J0eNhINTe9FAmOY0PAuP3qnx4g9EGykzMyWh4L+7Pp2
         sXWDHFehO9dEgzMayELybyT4RZIvTheJrwBB1ZRN+h+cPKvQLLBYDbfGlqgLp6hYwaqE
         fhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244114; x=1698848914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEwjrIZXUzvnboalMTbBIVYhD3jIm+zf9phzakfFM5w=;
        b=OWN8iaxg/WK65J7d3YQNwh+3LrP8NXatumPHVQfVgUaUFgIal2aX44H1/s+ssjSsQn
         urZJlhqrNAT0q0nmi6s8ikNzcv5Hv6405N5sdM+GHEmOD/eEP3TdEzp+BwiF4ZTgXT8t
         tlqb4o1s210V+c1D7IUmuowI4I6Hlc9XMujV12eh5pphWCA9HA8cSAA78YR40UKrEbyo
         +W1jFmS+HLvyQzVlnOyQaaktBIsI9R+oR3cSAlxEyj95mp4jFZBIZveeoMqocI/VNZwS
         XtzWhsojw/jnmee5m3No5aD29UmMGFTqZ8CWtspFSvxkq/kc59jzRXxnTOwnd1wI3aCV
         dWhA==
X-Gm-Message-State: AOJu0YxkRjvyQlI8ZzQ/uwuYjexDPE9kU8M0XP0V5lJRZle0QtN3wNji
	1aDuobk9iCaNXneyLA6WxMTqzA==
X-Google-Smtp-Source: AGHT+IGqHSfZyCCoNbFPfpUZAAjL1u1VHnmwQd86TL9A12x8J8QFDFGPslh4kvKAvGwIbEI0Ix5ZpQ==
X-Received: by 2002:a05:6a00:1a4f:b0:690:3b59:cc7b with SMTP id h15-20020a056a001a4f00b006903b59cc7bmr13717214pfv.32.1698244114269;
        Wed, 25 Oct 2023 07:28:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id g2-20020aa796a2000000b0068ff6d21563sm9817411pfk.148.2023.10.25.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:28:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 0/3] Linux RISC-V AIA Preparatory Series
Date: Wed, 25 Oct 2023 19:58:17 +0530
Message-Id: <20231025142820.390238-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_072843_858595_F602FB2D 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The first three patches of the v11 Linux RISC-V AIA series can be
merged independently hence sending these patches as an independent
perparatory series.
(Refer, https://www.spinics.net/lists/devicetree/msg643764.html)

These patches can also be found in the riscv_aia_prep_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (3):
  RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
  of: property: Add fw_devlink support for msi-parent
  irqchip/sifive-plic: Fix syscore registration for multi-socket systems

 arch/riscv/kernel/cpu.c           | 11 ++++++-----
 drivers/irqchip/irq-sifive-plic.c |  7 ++++---
 drivers/of/property.c             |  2 ++
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
