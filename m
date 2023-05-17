Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D8FC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgVzaYnxyeCoDCZUNPmI4tv0lIZ+1bGbcp718wpUNOU=; b=1DIazqzmFG2iUU
	kU6zki4aZ87BJVgYjY7BoUhZL6YRb6xjdtvotLCCZHt7RXiZAdlNszPE9ALrAy1SurHbgTs/9ym5B
	z/wlKV2+bszlB3Rdt+1HZz3CnfwUzF8fflqr/6biQ+T6zlIIx8G++c+Dcz9rI+j4tTgRInHB8mJ8T
	WhawNxuGMT1MUelZaiXd2zmEG/p/VJAybDNYBGob4c6wjto2955iE6QscffN+OqvN3TQPH/NS4I4p
	SuQTRuiFcJN+s/ogAcx8LO6Y8DqbJg1RGUQPD3xw7QkhZXmpSNSSxIeGod2qMfdkFZTUlQiRtNrjA
	OZoeEc/QBXPrJWk9t7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzH3i-009xED-1C;
	Wed, 17 May 2023 13:19:14 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzH3g-009xCv-0q
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 13:19:13 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id EA71E1FD68;
	Wed, 17 May 2023 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684329545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yEaZ9wXA+cWPA25h9EIXyAIeYp+OM3Sb2sM7l1qBrs=;
	b=ZuDLXj2q3LjuAXxfYXFwPYc1S7uyoELs8tGkJ7Jk1zO1qX9fWmrsZfajes9lw068PoF9A8
	nJKMvRxm5U5TINr5p/kRbnck4/ydolVIGq2cFp0CFMmEQXFCeIUVIwUkDmNH2b3DtvKlSg
	vIsrlolp/vXZpqcYLsGp1czILwqvVkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684329545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yEaZ9wXA+cWPA25h9EIXyAIeYp+OM3Sb2sM7l1qBrs=;
	b=HBCJlgZNK6zh9eXCRf0J3+tjRLv9+YX1OfIXxgyCNUkoGgaQx+IyxviEZsX9mxGTmQCIZP
	9Lep3ohD8ldxieDA==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 516F72C141;
	Wed, 17 May 2023 13:19:05 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 39BA64A04DB; Wed, 17 May 2023 15:19:05 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: <linux-riscv@lists.infradead.org>,  <devicetree@vger.kernel.org>,
  "Michael Turquette" <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Conor Dooley <conor@kernel.org>,  "Emil Renner
 Berthing" <kernel@esmil.dk>,  Rob Herring <robh+dt@kernel.org>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Hal Feng <hal.feng@starfivetech.com>,
  <linux-kernel@vger.kernel.org>,  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 08/10] reset: starfive: jh7110: Add StarFive
 STG/ISP/VOUT resets support
In-Reply-To: <20230424135409.6648-9-xingyu.wu@starfivetech.com> (Xingyu Wu's
	message of "Mon, 24 Apr 2023 21:54:07 +0800")
References: <20230424135409.6648-1-xingyu.wu@starfivetech.com>
	<20230424135409.6648-9-xingyu.wu@starfivetech.com>
X-Yow: Yow!  I'm imagining a surfer van filled with soy sauce!
Date: Wed, 17 May 2023 15:19:05 +0200
Message-ID: <mvmsfbvgkom.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061912_468428_EE716C7F 
X-CRM114-Status: UNSURE (   7.62  )
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

On Apr 24 2023, Xingyu Wu wrote:

> @@ -58,6 +76,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
>  		.name = "clk_starfive_jh7110_sys.rst-aon",
>  		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
>  	},
> +	{
> +		.name = "clk_starfive_jh7110_sys.rst-stg",
> +		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
> +	},
> +	{
> +		.name = "clk_starfive_jh7110_sys.rst-isp",
> +		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
> +	},
> +	{
> +		.name = "clk_starfive_jh7110_sys.rst-vout",

"clk_starfive_jh7110_sys.rst-vout" is exactly AUXILIARY_NAME_SIZE long,
thus lacks a null termination.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
