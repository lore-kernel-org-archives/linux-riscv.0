Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8099AC54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpBpihUQY0CL8MyIFF2lQCQ6Mj1sTCCt+iZtduww/8Q=; b=l1eK54Pt+1uTVz
	yoGpzB+CfJRtiFDEgUUN9lh5crtz59iJVxc5m9OqQtWOMW90L8v4z3/Uoy2UHZyGaDNZHGIFL6PR/
	6XPiktWCdsL1SkLVQHFlbJkuh73OphKvHmgEop0ndOQTDR6DGSRw5fNLUFVN/e4Gpml/Z/geOpk20
	14ALTEjX9t1xgKIkAZGEC+LINmd54vA6rr6DEA1D2If2Nm5XcrAy1/WdUff+/jNwoJTxQ+Nq1V8CB
	n3X1gMrIg0LqXZ6x8yez4T/lvhBvtlf8xhthoHXHpXxT2iZa/AT8EkRWQhPN0O+6ZDIcnQCxedvPe
	3URit84l4y2RETR2OT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKs6k-009Sow-QA; Thu, 26 Jan 2023 02:35:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKs6i-009SoG-H8
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 02:35:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 26E50B819AE;
	Thu, 26 Jan 2023 02:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0317C433EF;
	Thu, 26 Jan 2023 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674700517;
	bh=DkPTy3Ua5+WLPbmmRUi4CQa8iXqKdBmFuS11vog8WMg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IU6M6kNTG/ygSSnW6SkBbKWWrKHCjuZrhGbDVcT9wk8cWJNdjqjn78H5FgU62kFqe
	 +csMUpY1zjOQ/rBGWJfwxhxiTfdi+dudaa3BBADmu8ZniQRzAYGrzemG03K5VtjJRr
	 z9rFvFPdsp9ufwsj4VPOwbq6FaZH3ESrB8uUkQIjoThegt9yfBf1gTqSIQkuMGIcHb
	 6pXXQLrCTuCgv2Si128Gm2xvXIN8hu/3raBE0N41MuDSHiFnhpO2YkgjNpGowso0MG
	 uo472P7CFQz3NmjBj7UUa9Zv5Xx3HWBiAPEk4PshIdv/PYjNgIl7dJlbhSht9LT5w3
	 tBMzf2b7vL4Xw==
Message-ID: <eb37200702b27d239b2689daefc85ffa.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230120024445.244345-7-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com> <20230120024445.244345-7-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v1 06/11] clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 25 Jan 2023 18:35:15 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_183520_741622_F1EFE7BD 
X-CRM114-Status: GOOD (  10.60  )
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

Quoting Xingyu Wu (2023-01-19 18:44:40)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> new file mode 100644
> index 000000000000..f9fc94b4c6f8
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 Image-Signal-Process Clock Driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>

Same include comment. This signals this is a clk consumer, which it
isn't?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
