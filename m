Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC293C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9Hd5p6ouZ92R2qkvZTeY6ip0kBuOzX31/1YxfK43Gs=; b=SMR3GuFigTVnGD
	vJ/MFmWe/tq2nW15xSI7ewmIWJq4fmqoj0Cys0dBoL2krFtqMzrCVNc3isY3icPTbP9pN2k3sf82f
	sr7KKyXEZmRfQaMYDKB/nWQLnrcIWejfw4IEPe3dvSyam8ALxH9CPcXvgqns6D3xyBZx/3Oo5gOMD
	KqlsN5OKewblNXT/R/QZIYvi6PAHT+N+1SQdewb2InlfkJNaktdRdwjFk66FIGjAxfjYcmA0YV226
	nY6j2eEkqw3NK6F6HYztky6lvrqf0NO1DZpqWB7vde+jXcDpuMnip9Z9kGhz3VD/zjgJxHNlVrlba
	IZ32NPH144ou+g1UFurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pelrb-00E73u-0B;
	Tue, 21 Mar 2023 23:57:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pelrY-00E73H-0u
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 23:57:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7984961ED6;
	Tue, 21 Mar 2023 23:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2664C433D2;
	Tue, 21 Mar 2023 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679443074;
	bh=UyBZQu//dK6YIN2Hhik6aydJiVU1mQzZJsoluwZgzgY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X1ywQzClIA/IIy6qrMSpj8zqk1nF2fQRr/gMkCbpxrrYNeXGA/BvmRvpoPC0Pe94H
	 b9sIBM4N6fli1D/xyntONk4da7U+sNXVA1VtTzRWjD1hTlN/bgd4VL4nx+IC7ClX88
	 d3mWHNOyBXBTGKCbFI++EormE7xMP8qDWYYj95Rq2J648rBKpv822K1C2mz+7RLgh4
	 ZeJ8Eh+e4+hy61RGxbFsolDjevVYKIH58AIWOwVx2gqe/h5hY2G2i1+Y5NJ72jOuE0
	 ex2gyko8ZDtJlKLgaWEBPEPN3QGXLFmRMIcvz5nKPb4is5WUmoNCb4eiG6Hfwx0xm/
	 NJYXPRUgN3uZw==
Message-ID: <62b766cef78d95793af95f428693c359.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <95f11f7c-611f-49a9-97e8-0de89846e430@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com> <95f11f7c-611f-49a9-97e8-0de89846e430@spud>
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for StarFive JH7110 RISC-V SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>, kernel@esmil.dk
Date: Tue, 21 Mar 2023 16:57:52 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_165756_366320_CD6AA44D 
X-CRM114-Status: UNSURE (   8.32  )
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

Quoting Conor Dooley (2023-03-21 16:03:54)
> 
> If you're happy on the driver side of things, do you want to pick those
> patches up on top of the bindings and send a PR to Stephen?

This sounds fine to me. Let me know if you plan to send a PR with the
starfive clk bits.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
