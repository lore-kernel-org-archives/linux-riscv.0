Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE5C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nVRzijUyI+RTUQ/PQ0WKYPyu16xrgxltDidzJ9F5s0=; b=L0BIAnsURXfiy3
	n++K2XEa8oiuide5gGa0pQi43oGdVABQoCbHJMqRNiO/WcavFHbHu3LN1sKcEIwLQJ18OV9I151ZO
	99YNjQRON7gta1hlE1NhX136uTYgPB2shRjTIkTcwOtmjPrtwtVoljhQELLwtnzkMCqrwctAOemFc
	syVk/uTRuHifTxNYByFo9oQUD/NOiqWvAFCxGuYHU3Zz1eCGuGkQEP5fZK7j4pVCuD5wS9OsRcuAQ
	gRTQiI2INlCqpNwkNh8Bt1gfVTvqRLctT1Ewl9Oh8xnERB/F/1QLkqBJa/7R7XH0rUHmpohxxpJmu
	AbsasHq2REEk1rblx4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcF2A-00BrIg-1n;
	Wed, 15 Mar 2023 00:30:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcF28-00BrHK-07
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 00:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5DDDB81C27;
	Wed, 15 Mar 2023 00:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802D2C4339B;
	Wed, 15 Mar 2023 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678840219;
	bh=vyxKtWor1GgdsppazI1GKwisemf4cHbxxelfecejTFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NwFgn7no1SNf9/Rt1sFsLJD1oT/5V7FTSVvRdgb++JWqbm2PG4XvNrrV9gburbViy
	 4op48ZM4uRZWCc3BkufMBigumIFPwvlP7dtGsocEqafLnRqsNj+uun79AUOORXhVSr
	 YN3Sd0LliOZfItxXUXo8DzJNaTuUEjdHEixB9gjOZGrDq7aLZhzoqoCqM5CCOZ7PZe
	 9RckPqB/fDqIMgUFNJ54NSrsJpt3ggxHxgCbgSe74NJJHoeZPT9GOfDbB5sfMx83Ya
	 a6vOrLjsDh7xTE2YcGSf4ORT8PKBJrTpiatDjqtUyX60EL8vn1veekMgsWHGtF5WtZ
	 Keem5xeyl8Z3Q==
Message-ID: <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for StarFive JH7110
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 14 Mar 2023 17:30:17 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_173024_241534_0B8232AA 
X-CRM114-Status: UNSURE (   9.34  )
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

Quoting Xingyu Wu (2023-03-14 05:43:53)
> This patch serises are to add new partial clock drivers and reset
> supports about System-Top-Group(STG), Image-Signal-Process(ISP)
> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.

What is your merge plan for this series? Did you intend for clk tree to
take the majority of patches? We won't take the dts changes through the
clk tree.

I think Philipp Zabel reviewed some earlier version of the patches and
provided reviewed-by tags. Can you check if they can be added here? If
so, please resend again, or get those merged through the reset tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
