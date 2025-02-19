Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3BAC021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIAiMPwTwXfZ5OUdJhl9WOCf/uUa+8GpjLq1YEsAl3Y=; b=Q4eZzkaF/hb9Ls
	MRJIsgzdO9IDMTgtIIuSAZnrbOUNM5tQNZuIwH11hUQWKP/eDOsbLvogf0LXsZUnXizaJ5U91J0D+
	6BJVjcVoyI+dLcAS27OgoP7398KPsGkubh1lCy32ddGRxk1bOpTYMFZsVBO4CLHwERDb/JNq5IHTR
	PEt7h2i20Y7ovHKsj2ui4/vPFMuioyt7Or3KIl51CylBykg57aeXr8EeBQVWxV9WHMyMXo5mV78d7
	XwMuvvANjmdtJEIhVDvZ32QnJscco7WAFU8QxnkFoVWLKoCdWP2ZNS2b0HyB2ab28ZrqXGQatwc9F
	vWyQq6H1PEFAQyKeLwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tko3S-0000000E8wY-0usW;
	Wed, 19 Feb 2025 17:40:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko3P-0000000E8vK-1oyA
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Feb 2025 17:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8eo9rCRuU49n5wSct/OIVcQyLihy7VPjN7QFcXylCq0=; b=f1XzU8LQoibuGarRj5sJywEARz
	m2M1N7oC7zLcjM9NTt3ZGUPf4+YdYt2OfYdFArXGk3sjUWVtCEbfLqNtc7HqfbQ+jssugZ1L/z2I7
	hP8gt4SSemMZNn1CJxevq7EqZBVsMKqKvFW5fifpOpDs9hbhW00FE8qPfD0dBu7HpLgJV2wZ+d1Hy
	2E6ApsoK61GlATclyd2DL4CDC6G29r2FQB5Dg1BFPQ6QsUZRoc6OcB2eijwnxIeRunmzMwgTgeVT2
	yBVUFZwbBqDMdfXDyCePjL0Y0n5UMfSbkTigKwwJo04Zy5k4Hut5vpSsjYg1Uj1U/8/oz3fYZz3SI
	ZpXzM+mg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko3M-00000002HvJ-01Sc
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 17:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 847195C5BA8;
	Wed, 19 Feb 2025 17:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19829C4CEE7;
	Wed, 19 Feb 2025 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739986804;
	bh=tWVlyiku6DDOUnayBYaxpOjbrGAy4KLPY4ZzqIVbggQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fj3nFcO4p1Gtl81ozgFHEc2Qun4lIHnDhbOt8ODtD1oku4EgZlitKQv2hJvvuseYt
	 LIqXk2IOWeaMQFhtuXJ682LuFKxaySfGQyEDINInigwJKrI6Ns3sLQiKS3ElqtALas
	 n7us10yW7NRHAYck4H2kIOJOrFEPCk6fAl45wKIGiI6vRChBKD/8UTAZVV32pieZ8s
	 +XMp40eyMflX8ITGfXh4I4ig5yKjAfDvxcUimgo5k+7XaC1rOcdxxoK6jMi0U4nZYR
	 nPO6ikCpcVTM62YpZEUcKn5W4W6vkNQc99fWthEQXhhWlYpVkv3q/HOsmuvAhsuxbl
	 FziwD4+QwEwUQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	E Shattow <e@freeshell.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable USB3.0 for Pine64 Star64
Date: Wed, 19 Feb 2025 17:39:55 +0000
Message-ID: <20250219-cut-lankiness-0c5c0a561fc6@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102183746.411526-1-e@freeshell.de>
References: <20250102183746.411526-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YZAIZV2rwVuZrYvda7DwESnPj1jkxo9S/jbsdffmwyU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnbxHP6PI4F+M3813FYYrG/jcb5pdyF7I/iry9UUnH/W v9/FdPTjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk/n2G/9kVL19p32af9G7f 0mMOWzZNijkWkbHs4u2kPddmHBJ3O3iXkWF/wNeGB8FLdsf3Pv7V4Lx5m8M25cr3jtYKfSbVDH2 TdPgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_174008_385611_900B49FB 
X-CRM114-Status: UNSURE (   5.80  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 02 Jan 2025 10:37:35 -0800, E Shattow wrote:
> Add PCIe configuration of USB3.0 registers for pciephy0 mode on all
> JH7110 targets:
> 
> VisionFive2 1.2a, not applicable (USB-C peripheral mode power input)
> VisionFive2 1.3b, not applicable (USB-C peripheral mode power input)
> Milk-V Mars, one USB-A port USB3.0 disable (USB2.0 + PCIe0 peripheral)
> Pine64 Star64, one USB-A port USB3.0 enable (USB3.0 + PCIe0 disable)
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0 configuration registers
      https://git.kernel.org/conor/c/65e8b9912670
[2/2] riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port
      https://git.kernel.org/conor/c/38818f7c9c17

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
