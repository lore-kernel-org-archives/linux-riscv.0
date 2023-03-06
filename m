Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559E5C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovCUAsxCvXQHb43hXXcMBF3JjOT/WEMU8/MGR3r4qA8=; b=S4ewiqnlFDsLFT
	bGbvq+biHx7n1ibjSmMgd1eQlDGiJLTC3CHtCgbPpjqBgGbxnLaxHJWGFlFMuvOQls+wXOnMQtLrK
	Rtw5dgH9nHA/rk9WlYS48l7+QZQPj0q367MKcs0bRnuhFjbbOSdyOWtFJ5FyLb9tycA+VdV1clZW5
	FhATWVPjVbFstm5Pbw+vj/yDQWRq0Y53ebnKHs8AnJk2AXXQ6+H9bJ/Y8f9K/3kiGBNWOtrTJ0v7R
	yGUQKGBJYiH/lUnjCkAaVaDHExpjcdnqubucQJuTO9EKS997RbZl5bqkzA8ZICMFPEXenxXcwUIa8
	zdfUukFDeT8MMD0WiTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJMM-00FHrG-9K; Mon, 06 Mar 2023 22:31:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJMI-00FHq2-SZ
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:31:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9ACBCB81148;
	Mon,  6 Mar 2023 22:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579A0C433EF;
	Mon,  6 Mar 2023 22:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141862;
	bh=3RH6Lj+D0k6nUlkCe/B+3mDKPE4YWOnpQN8pqKQ5HcM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rUZiYVGpUAjYWJ7YKrIeSgAuVfvEi9RXlhGMflabjnTQfc5fOu3enom8Ki6cJQSjI
	 eZ9EW7K2A5ewSuMn055XyiumMlhdLFVrSrtJVaOmvoa76AY4YHvkX1v2mQOOD/MeBN
	 jllDtRThZDncZSzM/Yj4h4XibuatmEZH9CwM9o3Xzp1IabmarV+2D6zDbyXbNE87MC
	 bpU/sUFHmXtqilR5YcTz6bOZjf7OFdyuAry3tdK5WDNDC/AQ52YWsK2zuVFzpePyDf
	 HOieLD/Ksw8DO8WYpWnpTofpwa+ixtBKZy0xstKwXt5/wPTlFcb+azqQk1iQ8zS51S
	 OPjNCRb5gr2NA==
Message-ID: <3b0a1481873a2a7c26015fcedcc673b3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230301002657.352637-2-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com> <20230301002657.352637-2-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <Mr.Bossman075@gmail.com>, Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>, Michael Turquette <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Date: Mon, 06 Mar 2023 14:31:00 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_143107_089633_1E0AAED7 
X-CRM114-Status: UNSURE (   9.16  )
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

Quoting Jesse Taube (2023-02-28 16:26:55)
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> index 67a7cb3503c3..4eed667eddaf 100644
> --- a/drivers/clk/clk-k210.c
> +++ b/drivers/clk/clk-k210.c
> @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw *hw,
>         f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
>         od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
>  
> -       return (u64)parent_rate * f / (r * od);
> +       return div_u64((u64)parent_rate * f, r * od);

The equation 'r * od' can't overflow 32-bits, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
