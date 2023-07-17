Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C502EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 00:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fpuluNR3bEay4b/wCZMNciNWW9eiYdWpBsdf0LOm5s=; b=u23tCWpFF1U6VS
	lM9+XbYmUA3r9hjDJMFZHCoD2E/WZuGdoM2lYtigTlV5ltTN/bfwwjdMTvQVX3Brli5MRnMHmozLS
	p52ghAr92/WYaLr5NAA7cks+x3aZs8t4Mroc+wdXUPnDewm/u7iTTnHU6xtUTc92GkX8zct0x+NZL
	2o6kQ1cDLoy/qgwdfN7Rc0gSFP0tqu/e0Hwfn36qPRZkiNn5LfQGxXlP7nWaljtj78o1JjyuWVyFt
	jbvnNuWIXLUx7VZiaMACJi7ppa0YBhx30jDL6zXLoxfsSDG9LRnToRXe1b/atv+Y1hsLkxy/oh+5b
	nukAAduR8pIUcyvDp1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLBzB-00HEh7-0H;
	Mon, 17 Jul 2023 00:21:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLBz6-00HEdS-2H;
	Mon, 17 Jul 2023 00:21:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C45E360EEA;
	Mon, 17 Jul 2023 00:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DBCC433C8;
	Mon, 17 Jul 2023 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689553263;
	bh=39EhNC20zHNOUZZftRk8UzXhDqwqVwCGkzx3aUfaMEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CsNvDkbFBm8IHU1W1CEvJizKR5HJ3fu8EBFckaeY8SHPVJwIckWVGHSH9UWtg135k
	 ehS+t47/vQsSJvS9Fc2QgZj9SZe43AzXtWNbfeS60V1EpU0EBYKOPV1ry+4VsCkpMk
	 sElVNTM1a0Odzmu+rOnpY2YBgecji8e8P83ZBnPdDp+siipQpGXmSaUIjZFQfqbr+r
	 2C0iMy8rQ5f1XItfHehoD1rDQee5L0b0e8Fpa/sUhGX+DneXAL6VmSPIYfPOC16mWc
	 ULeE9U5UwGO0UNfz6Mp9G9YHyWxGzFUJZ+VhVL700EZBtWs8lfEL2fGVvB4/EHXSYG
	 xEJ9NCStZWjzg==
Message-ID: <1ac17275-7972-5161-0bf2-183d628e256e@kernel.org>
Date: Mon, 17 Jul 2023 09:20:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] reset: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230714174939.4063667-1-robh@kernel.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230714174939.4063667-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_172104_808279_C0F863B2 
X-CRM114-Status: UNSURE (   9.29  )
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

On 7/15/23 02:49, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
