Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06850C4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 18:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD048613C7
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 18:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD048613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qbdN6tvwKSWZjbaO2vDkrSeVQEu8IJ9tbdcZk7LZjgw=; b=L+DAriqjjjMbGVxodm94vn6CuP
	ljLt+KGaNnNUjd3cRfSlS20ZuYD1cwlW9uP/F2GZTkCnQQjrtQVFg/mmbVwlSInbuBZ9hgZU7M5jY
	/bHQNFBAX5oV24+ab0pURavbZkOXlcfp7cq96ZpAdhJcTiwk+arZi39gEbZ7ldmo/zECFAtsNtHV3
	fBtHvxTXR6oWy7gKBRnBNgYPs1jmkECoOpeJpbheNweYf1LZLpWbu6bnnL+aVYKnhZZyJ9yhPL3Gp
	hXaV7IiqLKpn1MgLU+fSheD5bIj83teviYAhKHcmNWzYT4gJJpEZA4UMXB+JBgK1mc7q4tzQm9Vxr
	NQ/jdHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpxc8-000f2S-1e; Sun, 06 Jun 2021 18:35:12 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpxbt-000f0j-VF; Sun, 06 Jun 2021 18:34:59 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 683F358095C;
 Sun,  6 Jun 2021 14:34:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 06 Jun 2021 14:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=G
 sziDdiEcLgNbIeTOIsRjdv962qUztQ4UnJH/tTmvMw=; b=EZUXOLwK437ch/zcQ
 haRf5hyeYm5ILmih1jUVXueujEpl+sScSXHGaFu8YLsGXtLsEkbhIJIxve1Mzrnx
 h2uYTQRHUkucJJSt5EulKpSD1WJcHmJM4cRIjCPxr0Jzl2IkVg5HrNSx0MzQyuha
 OIK+xLNmpX9AuAKVarjx9WQYBcq6tZQVMJ1pAMSCXxn5f1yZLdbuIau/VvWl4UtN
 rorJjpOs3jPXVv53VA9ADcQi3G2jnUypHcaecXXevyOEHbYNu7zrcpi4mmWk3zub
 pPj+iiZPvMUlKlTbtIPDtnRAhYDYGzZmmSPTgZKJiFuLdP12EnLezo8SGeWX87U2
 3PDRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=GsziDdiEcLgNbIeTOIsRjdv962qUztQ4UnJH/tTmv
 Mw=; b=e0KKoLXtlkVQxbHPUrUXqvz7XIRJl25BEP9COQGud1nUuBl5cxDWmi7an
 T20LwKsLxYqFqAODM7AmKFm8CaMSOTpGOHgWATAQElU2Y6PjXyL3/q4StgkW7Iyz
 4OnL8BW2auLW0CKJPPOkbkUkAavh22gAKwgmf1DvaNJW6wFMqdJTZOzjFI8ecw2F
 nLgs7UJLyFF/0He53iEE5P8/Pr0YMQcEuV162iFm/Ca+JbSAGngpmIV9HP6795WV
 2NNcAY4ISON8/H1ddCCOWrAuo9JoA91XKVSO+bduKIDt71CODP+B+sbGT8gKsFrp
 ZftnB3TMOA47fRTetBJzdPjvfqjIQ==
X-ME-Sender: <xms:ShW9YHbTftpkWrNZ2g2wO3zP53jBxq-brtaLr1SOs7la9YEe6ujcZg>
 <xme:ShW9YGYpuoZv3HJFIYQsvdYDTYq8Jsiwc5_Bcxl-UxGJ20f09GBdGUlRaH4TWG7QH
 NMmIXi_uJJvZDYHpg>
X-ME-Received: <xmr:ShW9YJ-c3TPGv6fiL1xvhqXSPn_Q7qDO_YbaKxlyUdk5ky4lzsJBz-QO0mSp8Fl4ajn6X0_W0eSCCe1hWd47XAKTQnWuF5xKd5tr7YRBNALQm4qhVLN-PsJPnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedthedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeu
 teeugfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ShW9YNr1ibks6jBIiP38v-G20L-zsMkVALuX-oNglalWPHCX2_umXw>
 <xmx:ShW9YCpO298eFV4yy372t2Ad_2iW5berjKUqR4uu7KtVQ4iKEntgsw>
 <xmx:ShW9YDSgOFS8N4atyq19YuD7ZFikLW_2Prg38NQ0Hti33L3vhsVJDw>
 <xmx:TBW9YHiXKsC_zU763HivDrsPLlzei19JK_ZfcW-ZPfIq76v3kk5FJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 14:34:49 -0400 (EDT)
Subject: Re: [PATCH v5 5/8] cpuidle: Factor-out power domain related code from
 PSCI domain driver
To: Anup Patel <anup.patel@wdc.com>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush
 <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
References: <20210602112321.2241566-1-anup.patel@wdc.com>
 <20210602112321.2241566-6-anup.patel@wdc.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <82217630-5f89-50dc-bbca-e591bee90950@sholland.org>
Date: Sun, 6 Jun 2021 13:34:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602112321.2241566-6-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_113458_181479_11CFE341 
X-CRM114-Status: GOOD (  18.42  )
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

On 6/2/21 6:23 AM, Anup Patel wrote:
> The generic power domain related code in PSCI domain driver is largely
> independent of PSCI and can be shared with RISC-V SBI domain driver
> hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/cpuidle/Kconfig               |   4 +
>  drivers/cpuidle/Kconfig.arm           |   1 +
>  drivers/cpuidle/Makefile              |   1 +
>  drivers/cpuidle/cpuidle-psci-domain.c | 138 +------------------
>  drivers/cpuidle/cpuidle-psci.h        |  15 ++-
>  drivers/cpuidle/dt_idle_genpd.c       | 182 ++++++++++++++++++++++++++
>  drivers/cpuidle/dt_idle_genpd.h       |  50 +++++++
>  8 files changed, 263 insertions(+), 135 deletions(-)
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
> 
...
> diff --git a/drivers/cpuidle/dt_idle_genpd.h b/drivers/cpuidle/dt_idle_genpd.h
> new file mode 100644
> index 000000000000..a8a3bad3cb7f
> --- /dev/null
> +++ b/drivers/cpuidle/dt_idle_genpd.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DT_IDLE_GENPD
> +#define __DT_IDLE_GENPD
> +
> +struct device_node;
> +struct generic_pm_domain;
> +
> +#ifdef CONFIG_DT_IDLE_GENPD
> +
> +void dt_idle_pd_free(struct generic_pm_domain *pd);
> +
> +struct generic_pm_domain *dt_idle_pd_alloc(struct device_node *np,
> +			int (*parse_state)(struct device_node *, u32 *));
> +
> +int dt_idle_pd_init_topology(struct device_node *np);
> +
> +struct device *dt_idle_attach_cpu(int cpu, const char *name);
> +
> +void dt_idle_detach_cpu(struct device *dev);
> +
> +#else
> +
> +static inline void dt_idle_pd_free(struct generic_pm_domain *pd)
> +{
> +}
> +
> +static inline struct generic_pm_domain *dt_idle_pd_alloc(
> +			struct device_node *np,
> +			int (*parse_state)(struct device_node *, u32 *));

In file included from drivers/cpuidle/cpuidle-sbi.c:27:
drivers/cpuidle/dt_idle_genpd.h:29:1: error: expected identifier or '('
before '{' token
   29 | {
      | ^

Looks like you have a stray semicolon here.

> +{
> +	return NULL;
> +}
> +
> +static inline int dt_idle_pd_init_topology(struct device_node *np)
> +{
> +	return 0;
> +}
> +
> +static inline struct device *dt_idle_attach_cpu(int cpu, const char *name)
> +{
> +	return NULL;
> +}
> +
> +static inline void dt_idle_detach_cpu(struct device *dev)
> +{
> +}
> +
> +#endif
> +
> +#endif
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
