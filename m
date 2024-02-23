Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26451C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lhIQcQuc2W4xpQd7ITZp5xr5dempW918c90WeoZXCM=; b=xMwZMhq8AA4s4Q
	+1KkKMdMO/FKSm3wQfbT8YlhWIDjdoYXsoUdxLcgY42X4PX3NZhI/H0kwAnAhdlo5dD9wI9YljIDP
	aX5kLCmbFP4kqIkFsq/aXK+2IPS2vWJ1MVbNc/MkQPHDWca2Nu0cun1lJC0rlX7/dIKBjEVvKDbM4
	N/CatAoAEQTHvBpEwwRibKQzT1d8pnfsVAnqXsJr45zlpap/9lzR5D7UuR0J1fNrxY3nzYGsWSl+s
	tQjaRpTAm4F3BXU8z1Md99fsSJuGoes3maSJCNH1boTIKmlp5vITNpeRv8IxV4RFiJAUKCfcJHDKZ
	UDyxphi19g30iHyuzu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJGg-000000078vc-1sap;
	Fri, 23 Feb 2024 00:18:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJGV-000000078u5-1xhY
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5364BCE2A1B;
	Fri, 23 Feb 2024 00:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2754DC433C7;
	Fri, 23 Feb 2024 00:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647488;
	bh=Ks6S87lN3ZaIzK+Hds8ANCpr7U/DpNOOdaVwkmZI6Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLNIvJ+E3dTX3iuAgItNjbCkp/RlALOa0ROQFpMb2mySw+F+vXcrl+GqZcoYe8Jib
	 gMzDizVlF4stykMFl/GJjt+v5K5hkRca5+MKROKK3GAJP6DSrR+TR/Atxp+z8y+M2u
	 R1EEgVDiZiX5+Sl1HnWn8N4Pzp30ZOAeu65XvMtNiHaRh/n6enLuXe4K9SBKstMoqp
	 Gx9YsC6pd+TsVWamvTJFirYYEmpZEFtPh5BUpMpNb0agtZ0RWNvcPFsjLwmLQTkZ7s
	 A8njZGI+kEzXhcVEUsaZZPBBOjdrSeh/W1Gt/excoFfK6XgHT/BSR6OHPvZMZSGDTY
	 uAmUcg3vKwzjw==
Date: Thu, 22 Feb 2024 17:17:59 -0700
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: robh+dt@kernel.org, richardcochran@gmail.com, linux-clk@vger.kernel.org,
	guoren@kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
	chao.wei@sophgo.com, jszhang@kernel.org, haijiao.liu@sophgo.com,
	linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	paul.walmsley@sifive.com, devicetree@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	xiaoguang.xing@sophgo.com, inochiama@outlook.com, conor@kernel.org
Subject: Re: [PATCH v11 2/5] dt-bindings: clock: sophgo: add RP gate clocks
 for SG2042
Message-ID: <170864747893.3863853.16417888208319440708.robh@kernel.org>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
 <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_161811_705122_71DC3F02 
X-CRM114-Status: UNSURE (   7.95  )
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


On Tue, 20 Feb 2024 11:08:59 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the gate clocks of RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 43 ++++++++++++++
>  .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
