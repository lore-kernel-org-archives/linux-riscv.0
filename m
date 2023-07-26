Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C11C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NH4TA705NPGx7oWVWTwdjTrBKZSgd+MVALOZLnuXoQM=; b=0FYJHGwXGeugeO
	gYDSBetE20+bSgIjzMh7BzbW2sjNwb8Jb5wg5OmSE9A4yDzm8tnaM7O0LZlnDRtMLdiih2TzwZtuh
	38qeZVPJ48hPvW6F/QCQJPo8CNJDoONj8UrtCHqDFIeNazS4n+kL2K3K054m3Pve0V4mx7NzGyG/I
	lBaUbv3IJHHKSvKZaSPS6tNVjSoPJb/jjrhMRFf4QO28IO0TzHLeQ9wMB8rJ8kKvBbmn0HjhbeGxh
	UjEBseNkuVzNtsCl0T4b669XLqQros61EXTcb15gLlSYgY/h0QX0j1zyD8ESrcVwKCqrMEtgSBDAN
	pBjw8DNGQRtGOjOD1LMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjW4-00BIpr-26;
	Wed, 26 Jul 2023 18:45:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjW2-00BIoR-2d
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 18:45:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9636961C7A;
	Wed, 26 Jul 2023 18:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1C0C433C8;
	Wed, 26 Jul 2023 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690397141;
	bh=wjbAncjzdChPNXsbcDICv+H0kkp161w6++NSgxLMdxQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SjvyVGQPAjQmGTgnpkeeOstVxYM9sOdgxQh6cxqTbenjQDpsDk5cumDO1mEk/ZJxn
	 s2w3XUJMSVTIeDH9OC7nfvfz+uU2YSUv7CBBoL244lLyg1KuEAXQI2HEezQ9oQD8uM
	 qVmvtc6O9lxhwT9O7rq/LsD38XkHcVCgaBAFL/5nPjY2Xun/jXVxPrsU/8FwRQpA56
	 2jJcXjaGanMEzHZhDfoPvNodbSnvQLQhHSM9k1D5KMKnwHzYxNHaeJzJXPZv5h86VT
	 PgV0P58qkJgvUHCKUCwl/b2xQlccYwe4pqSF6wkKrtoR6cCWU2ypZ+/3i3LnRYgNfS
	 uUddz/1ddVFUQ==
Message-ID: <a5244f4c5a91c4c8e746b40f92359789.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230724055440.100947-1-xingyu.wu@starfivetech.com>
References: <20230724055440.100947-1-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v1] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT resets support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org
Date: Wed, 26 Jul 2023 11:45:37 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_114542_918490_1692059F 
X-CRM114-Status: UNSURE (   7.07  )
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

Quoting Xingyu Wu (2023-07-23 22:54:40)
> Add new struct members and auxiliary_device_id of resets to support
> System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
> JH7110 SoC.
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
