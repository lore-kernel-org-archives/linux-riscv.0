Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B69C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYQxZVLOrXa9akGQOujCSOIdbbjGInlyl7OL9cyHjsk=; b=e7+NdITuG7eI9e
	qCfcQJ5XGYxjgZyRJWhI1bsua+MUVFjQuRR4aP0DMUqlhK+CiE7K2UIqFB6FpMuCPPDsTdblKiV19
	fXqavt+CCNae4nlVKkFmXr6AxXDgZGY6/3TiiyK+09nnAB3q0I4frOqwx0PPmHh1/0xilRbrQ5QrQ
	r99HiOXrh5J3KIMwoy/r/5tPEt6+4xcNdSKCznMMCLDDVdQLG0H+CcZLQKlcc71xFAprmq+BwC2Pu
	MNfdr4jPOyyX1mCCAxHY3KYo6v3qGhV79tZPaFSVRFxAQhF2xa2vflrw2bQmBd57/UKArj3AwIYwp
	iFL4yAP/GGuRmzAOTgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueD5u-00000002YYj-2bTc;
	Tue, 22 Jul 2025 13:31:46 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCB3-00000002RQr-3DeG
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 12:33:03 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-701046cfeefso84032996d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753187580; x=1753792380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=VdtQZ2Bife8kue0wlsNOsg8OKUIX9eU791ep2C8XZlBRCkuam+KKXeOjij0TlHz0q8
         v2WkcxCIi9b3OeCP/n/NEjHL4YFow6dAmCEeUEHQGEuouSgDWSB0llSN4owRkpGgIJvw
         6gU9cq2kMQRp1p5HrFQ0SLuYjgv/5cE1ek7Qde90/dUFLxZds0vckSXfGOxjfhGzQ9B0
         Lm3y6A3cMVZmJN28nReQuz9DXmR2Uq54MKgkRYaea68vDjiHMIyNjv8mARfXL2YF39u3
         ocoyfRXEPZZLUC1w+AonmLN83CrRo+i8p8Y1+EwiQZ5WH04zc3lnOYu5RgE2h5ExaFaT
         G5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187580; x=1753792380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=ayuiAodLZMLAMycfWhAsrMebGXz4n7Q6pHxP0KKBrMkQKhEe1oZJF4meOeS9Wrtsri
         6xKw9dcOHdKIA8c7Ba0lyjg1VIfig17J2BhPhNlHnKYkaCw+l/hiMq2aNb3jGGKVwiSe
         986gOTAXIbglencfnYccKsiRfB1cgivKDR8dXNX1WCayFKgh0p/SF6IzHiBWFogRydCn
         q8YfNSKgaPjWvHA/I3gdzrobVbOSi8ry4Mi08ehK46DcQ+gMGbnAX/heeRBFerRH95fx
         w3W+ydnx0cXYUmnDx+pJ7ZYRFjdcGfzAbWFNprtcFZh7TGv5y0Jq1z6MkA9du5Dd3Wga
         5RWw==
X-Forwarded-Encrypted: i=1; AJvYcCUK4ImHuFKZhtFT7W9eiyZeIz/+niQDEP9QwHSYTAsmtzeWshA2qO2qhVuF4Og76DHVImqegH5y2BW3kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGmWaPMIUE43lfha7vp9lhuFZgMEu9WAQshX2WuswOG6idMArs
	6DlBBYyzDVjHVhqg526G7QeYSfi5W8OElzrQzGs+9vtpLlL1jPdmePjwDpHhBIWlOYU=
X-Gm-Gg: ASbGnctkcV7jlQhJI3kYBl95JhFnLqlcyRy34Goe/EzfJRqROnu4s2uvMP6amlvozS8
	nSVFnOG1w0SVH5ZflsOEVGOXz8ywNgaM2PHsx8yyOwU6Xc2PevmAqxg7yQLy+hyape0D1PayT8i
	upbYtidABnqQfoH9cbXulq4yQHglNLG9bG5saSexjiSRnE2SfzMkHheXjl2MsQ9gJvqCteWfvXl
	TtCvgTKTVPQkYX3SdOGJpnf25ZJMdnnJ/eZehd1WeeaGOgiOIAE9giuZ25ldSXtELwMa4wZhDff
	nOuqj9K948ktNkORDTE2lGGOhcBhjMMer1lRGn4duN6KRoLImHIoWr+zfdtrEdbgpPU90tQxBMf
	n2GDUknvE8ktCGdGI+ipGPYp6VJZJq6JXnlBxqr8qdwWmV92l7s/cvqf8Ac9hti85DmUgsX0=
X-Google-Smtp-Source: AGHT+IG1XORWN4jprJEi5Zq8+C3EGaNg8eBzovmEwMCoERAkUr764LT8y1WytHb49WzOljrg37pQSg==
X-Received: by 2002:a05:6214:5886:b0:6fa:c2a4:f806 with SMTP id 6a1803df08f44-7051a11461dmr225240826d6.29.1753187578843;
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051baa8760sm50251346d6.92.2025.07.22.05.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Message-ID: <d6f147bf-2816-47d7-9a48-47562b8dde06@riscstar.com>
Date: Tue, 22 Jul 2025 07:32:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, mturquette@baylibre.com,
 sboyd@kernel.org, dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heylenay@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 unicornxdotw@foxmail.com, jszhang@kernel.org,
 zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053302_050758_A1E1646D 
X-CRM114-Status: GOOD (  13.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/21/25 2:07 PM, Akhilesh Patil wrote:
> Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> get correct rate entry. Follow .recalc_rate callback documentation
> as mentioned in include/linux/clk-provider.h for error return value.

"If the driver cannot figure out a rate for this clock, it
must return 0."

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>   drivers/clk/spacemit/ccu_pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index 4427dcfbbb97..45f540073a65 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>   
>   	WARN_ON_ONCE(!entry);
>   
> -	return entry ? entry->rate : -EINVAL;
> +	return entry ? entry->rate : 0;
>   }
>   
>   static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
