Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF7FC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWkooVrZIgDBMi0SL/PDEyuqn2m/gE29cmOUyOAEDkM=; b=YVanYgNw3ur+ZS
	fcILheGM8FmnLaFQCYuLb87WGs+kXNnxYyj/xw7enLvOzmEjUyKTNX5qJZB254oqoGcE+H7akvITx
	ACd4EROST8XgyxVk5dxICW9OvoR8Sfevimr8VQy8A6LZYatXu/u1L7fdT8dBIlk4IpbtT+7ApfTOK
	2rFEkG6URJ8Igbze7m5omuztCHVeWx/VwVr4gqXaMJvrcrmXjvD30QajxRzYiWXDBWx/US/WL1U/d
	EFXalOlrmp67k3z4F17eM0WnuLxIm+NvCUt2CzphO45Pv5tqlhV59eCpWEF/W2AMz7+J8UvWg5fNv
	2M2tLdseTKqWXQ/Qlssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEZ2Y-00000003TET-1JXR;
	Tue, 04 Jun 2024 18:37:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEZ2V-00000003TE5-0CJW
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 18:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C4056142C;
	Tue,  4 Jun 2024 18:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3661C2BBFC;
	Tue,  4 Jun 2024 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717526261;
	bh=DzYmhCVLTbbGz9nX9THqcZl6MvWkHcmd5Ebv1OCgf3Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H6iyf4FYiijqhDj+kJTlMWo9y2L4Fy87O89QypH1ElA20bzuydlppo2lEH3MBmEhY
	 lo/JMlGvViBnlMmoQ91MVVD88WeeyNPp5rPwdemgjfb+FY+RuT+9r4y63nooFHISj5
	 wThfFw+oErp3KLu8dJUYyLMaBFQAEg54sLkOmeRv3X5lNf4+cKIcbQ3FpXAyKkY17Z
	 d50TDA0PWKWYRETS4m9wKaIgjzOYEicdJGxgFVykXF+pu31R+9yskXHUmelDxHAmTs
	 rzy0q/3O3C107rzBzAQK68vjr5rkkC9xKE2eQ2IeCSHcOglpN1sgRbSq7KXuaRf2zN
	 kJ+kVhL/Lzlcw==
Message-ID: <60ddc90da5b5dc6a4b0eec91b06bcbfc.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240604130531.170371-1-krzysztof.kozlowski@linaro.org>
References: <20240604130531.170371-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] clk: sifive: prci: fix module autoloading
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 04 Jun 2024 11:37:38 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_113743_223734_768F2DF6 
X-CRM114-Status: UNSURE (   5.81  )
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

Quoting Krzysztof Kozlowski (2024-06-04 06:05:31)
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
