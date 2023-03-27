Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03FFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhxOVKBT9X6TImImpA3xh3ch3ujKQYSWjeK1hq0+SQA=; b=VK41sJGmSfYfBa
	ti4U5UmJGT/9byqJfwc4luVaIROA/jt+6rMrL5b2OB7eUPobiKZ5stzWQWZWfD7/os4z23ySJ5h5x
	6zJdZEzi1haheSfyZU0Go3dQ4vIc9NM2ls3kUf1I72r4yvJxnN/7bAqfdHgYtH094iFLYXwOOtcFw
	RGE8EE/Hm3wqDiDExXmVk8+SGUQyATXcTPA2Cemyh7rISJldp3fqEvg+wFIVI9Lh5TmTzgtv21le4
	QbD8D6bQ8Qskdk6h9Q49bvnFUUzTdJAAAzVOgJaEf7BrqHZMF3tsCHKXDPakv/ySolf0iUdG4FBlt
	hypGdxIwskp8v5BF3XRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqz2-00Bwyy-2z;
	Mon, 27 Mar 2023 17:50:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqyz-00Bwwo-1T;
	Mon, 27 Mar 2023 17:50:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCC8961458;
	Mon, 27 Mar 2023 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33617C433D2;
	Mon, 27 Mar 2023 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679939410;
	bh=iEBkCyHBRxCPsptsyJpeOitfV6bXqpS4Fosucz4PPqY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S4zS/LRqvNuad3gzhdGoUMi0IxO5La9gxAsZT+W90KTBeFjQD45whS84D8Q6fJaAS
	 CGEP8OrbOPUAqGKL9U49Bve1B6TLL9QfKzlnoZKUhf0mXU1qRViFb3RHN/IQYqTpI9
	 3NR+D9pbFYKz+mei794QfnxBFBzJt2eiLowszok0z0v/GPjsX/ubvPgFG4A4zveMvj
	 c1M38EDfUc85CplkemXG8uLbkGjMYV89kq2cvUD7qpC+UmhPd5rTuaKsSYesmQHD6d
	 nOxWTsrg/Gl8wfWBfgMQ/gGhJSWNOdmnt53GBoPMwWc6KDFyn9GR+YDqCSLEeAStAD
	 h+FeSsaGxiCPQ==
Message-ID: <ed6ca4e15fe718116d0d22347e5c3c80.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230118191521.15544-2-marex@denx.de>
References: <20230118191521.15544-1-marex@denx.de> <20230118191521.15544-2-marex@denx.de>
Subject: Re: [PATCH v3 2/2] clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date: Mon, 27 Mar 2023 10:50:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_105013_535696_481D2C6C 
X-CRM114-Status: UNSURE (   8.62  )
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

Quoting Marek Vasut (2023-01-18 11:15:21)
> Add driver for the Skyworks Si521xx PCIe clock generators. Supported models
> are Si52144/Si52146/Si52147, tested model is Si52144. It should be possible
> to add Si5213x series as well.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
