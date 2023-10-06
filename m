Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF72E81E01
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgvDfBaTu4QF5Q5Qd0J23Wefg7xG4tjVOWr3KEBkn7k=; b=fqLSf+1TZcIrOr
	RhOCg1tFr+KbAuVrC4u1DdkovyZW4tnhfhl8k2YOEUJHcX7vYCzWsBwfkTGmfGfeGX668P99yiiis
	t0l88SI1cSXaL2rCnnPzqyYpkBEhgzxOLYIxghP77z7/6tE4RfyRm2zA1BYYozUk6RJXnBlPvMoQ1
	iNcmKpVNb2VoPVyhsKoRQSGICEJb3PS9Lx//7kV4KebGr6HFJyDjNMB/MTGxhhDt6zqYwyTmS/q7r
	PAAJKas0E4X9GbEPL0lHRR0Hf62YH3tXNbB81Bkw4RnZkAr2gWvLqTTSQTKIYI4t5AqiG/E7rezH9
	qbU44myh6zGAuuCLW4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolrT-005yzY-1K;
	Fri, 06 Oct 2023 14:31:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolrQ-005yyE-31
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 14:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9668A60E92;
	Fri,  6 Oct 2023 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64AAC433C7;
	Fri,  6 Oct 2023 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696602680;
	bh=nCFnzaxTyQnf0s8PRBk5ThFbbfcNzhWzaiOiujcLzAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds4Y+CGMr4nxb9xtPlBxsVbuq7NNSKY+oBuk/emMQytDMzfUnkEvZKVAdkHThcOpk
	 RDuBnsx7kq4MjpQrTRNtY1F54lG6MJ6BIzEDWVryB5aed4qPCW+EL6MikeXIhyvZ2U
	 X/jM7hd4++XacEf9F4RRVCKeseYEqDkaXp9wI9T1TYsaW/wc4oya3H7TgbLMxakrQq
	 o9e5ud0T5kQTKf0A8/VebSuyX6B70CRZSVaFUZVxZXPTwtj0BN59QbInAYpfosejme
	 ECbpuj4rdnKEpxMgT08/UeV/2MfNN74W6CAyZELu3E4D26o+g41ePFauOCZMEQuTjF
	 qLNa6Fdg2JwRQ==
From: Conor Dooley <conor@kernel.org>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: (subset) [PATCH v4 00/10] Add Milk-V Pioneer RISC-V board support
Date: Fri,  6 Oct 2023 15:31:10 +0100
Message-Id: <20231006-empathy-unrefined-ff1168095093@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QKsUC5/THVZjdfivIf8dEs0fchdgMXpltrn24bZhqm4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKkKUjpHtr5We+mjv2lqPPuDbhmRSrmtTRIcL9fKsE/yn pj8cPLdjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkwGWGfybLtDI1V6vPnyOz xqp3ZcQmwaNr6/q/SD/73c35tGlW2UeG/5WxHUpRLiqtue+mbeczX/9xput67a0zd7D82SX0lYV jAhcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_073125_017086_E40817FA 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, 04 Oct 2023 23:37:20 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.
> 
> Now only support basic uart drivers to boot up into a basic console.
> 
> [...]

[10/10] riscv: defconfig: enable SOPHGO SoC
        https://git.kernel.org/conor/c/a4bbe6e3d9f6

b4 is confused, but I applied the whole series, temporarily, to a
"sophgo" branch. IIRC I asked for the defconfig patch to have
savedefconfig run it it, so I did that and amended the patch.
More notably, I changed the commit message for the aclint patch, to
drop the discussion about incorrect use of the sifive,clint compatible.
That meant that 90% of the commit message vanished, so I'd like you guys
to take a look and see if the new text works for you.
If it is acceptable, I'll merge in both this series and the milkv duo
stuff. Acks on that series from one of the folks added as a maintainer
here are still appreciated and will be applied.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
