Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE69C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFqfJA0Yco94CvPl9TpTkA3TJoS+jqE+i6XV2xrEf5U=; b=cQkH0j2y/N6/Fh
	Uq/sY9LqZpz3AzVben+T5zB1cLx233iWbfnzEjTBRQ73DqeyUI2ZlZz6mZ9yeklHa8unTnl2drj4y
	Il63wWOATcaD+K9/d9Nnj0kq9bOS2+8BYuMXBiN05B9MGvAA6fzjgBPLDolyxugeegIx+Z0A3V63W
	Y6g6JBT9SAvjwO+Jufgqajgyx4VDp2DOKPynjJyGJIXenKCaDdWT6m/fa9jgLCpERpy7JZ0WpwdTb
	9nRye9f4CblJRJccnt56PlM4DEGi8bV/gAHAecAeSmGv8EXQJL5hEJFs0Cx52i5QFn/IR/ZyVgPMp
	zjbaCTS3u+NQp7tdNh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XgK-00E7AF-2U;
	Mon, 13 Nov 2023 14:12:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XgI-00E78m-12
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 14:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F2FCCE157F;
	Mon, 13 Nov 2023 14:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624ABC433C8;
	Mon, 13 Nov 2023 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884759;
	bh=7n9z+cHpOQ8W91XBkYQLoFLrh4UpmQ6en6y1XeCK3Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkaNk6Od6P7WGy82NQKqBftjUJ8iuNS2PhRkdz8VnwAV3mKYJ5Mk+KaKs7KA3WSyW
	 a7kDMBYayhA5IFV0P/w+CFhS/ZoaTMZcqfpbkA6jOHPAxqqvQ1REU9Iqf96v/zarno
	 0nl/6qmmr22QeG8oC8jEgdkb240HiEJgXXCsWx8uiOzgIYyeHJHwjHVybLfgRwiFtb
	 dhnOVdy8L+/5/fgnyO0XujxfX5xwKVFog+TAFRGKv/8vOtQR2+12oySA0AxmDcLvcJ
	 9BxNQtFf2solRjysjp/cdohH23nFQvltLOmKkMADTfXAB0m5nMmO3rXjQ8co7iRdLH
	 v9ElzPjCIZahw==
Date: Mon, 13 Nov 2023 22:00:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
Message-ID: <ZVIr8VH+29lpSpxb@xhacker>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
 <20231113-washable-elbow-629bf42b9be1@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113-washable-elbow-629bf42b9be1@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_061250_525507_B2D90BEE 
X-CRM114-Status: GOOD (  11.75  )
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

On Mon, Nov 13, 2023 at 01:36:54PM +0000, Conor Dooley wrote:
> On Mon, Nov 13, 2023 at 08:55:00AM +0800, Jisheng Zhang wrote:
> > Add devicetree binding for Sophgo CV1800B SoC reset controller.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> With the unterminated ifndef that was pointed out by the robots fixed,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > +/*				0-1	*/
> > +/*				10	*/
> > +/*				13	*/
> > +/*				15	*/
> > +/*				17	*/
> > +/*				36-39	*/
> > +/*				53-57	*/
> > +/*				59-60	*/
> > +/*				63-73	*/
> > +/*				90	*/
> > +/*				94	*/
> > +/*				102-292	*/
> 
> There are quite a lot of gaps here, do you know why that is?

The tail bits are for cpusys, so I guess the SoC designer want to
seperate them with guard? I'm not sure.

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
