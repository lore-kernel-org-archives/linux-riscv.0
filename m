Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE88CCE9D41
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/hgfDFaURKhpWaP0vgkNkRiB2mTwBQJlzXsvWRXo3U=; b=G76AODulaSIKEy
	JiLOU5cUyqhUSo0irNqeoTeHe+qGtEXJ2WF9XkMu/dPnaRKI9cSOgKayUkCk85/nD0/Bhq1RoA9jz
	N3Mwq1SxE6rxTlABdSBE/l3XJBtzVCprXW8Wrt19XHAtzd5/PDfysSiuIcnxuj7oSQ0v2T8T0mD2h
	GeUo8ai+WoKr9LGbwU7IVgqGvtkb2Qw5w7Fs3cVV6KfOzFW2c9cmWEnjfr36uZHB0m98KVay6bI5L
	nu1SsHxu+uA+5pjxfCPuv1B5xMfL6GPwk5/KmkiRfeMtkxWYgEGFd9k2Rlt8SXtebKt6VtGzAnUaC
	psDb0eDytYvgN2rqI9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8I0-0000000DJL2-1xUj;
	Tue, 06 Jan 2026 14:44:04 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Hv-0000000DJIj-1HLN
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 14:44:02 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c15e8b2f1aso90021485a.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710638; x=1768315438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=LFAUdAIB2mPUYemSeHGbhfLP+d/EN5gOl0ADjxUcTlaObQqbamt2oKUGhdy7PFhFVH
         MD89pUU+B+23Y3JrQEAMrbot7ensMN7NK5uoE9N2tjGSUQzNpo0G4DRgCX/wjVAJS0z2
         +hhuN9/c3P6JPHxBEOgDGhnUHSY8SnhRS4T9Z4iSOXrAA9Hj4bqTQlACXEz27TI6LZGM
         GZ6g3Dqv8nYLJLeskeOh024ru7urrX15wqgWEm5PZCEY+hd6+Hp8thpVTsjN0FXfQRns
         sHB2eEi8NObHx50yFxAcLUmQ4ImH0L5cQFhwfjveEEqtFeRGYptuSIFX5pMmF1WxkxzA
         NpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710638; x=1768315438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=Fx2QsNMioW3ty1Vspqlkcz2pH4hgAp/8oBNMe79NQLWVX5ZXnuX1fe2lAOOxMFVLyc
         ra2totCFjWPlR7Ri+oxvdOnjpfV9u5+AhCNPTF21XsbZ7EjY3qZl0qvAEzdM53ZMiEde
         PR10jRdbbDR4FEkm0HPvHHcd9g25C34tVQxJRUvE0sP9IkuqsLZPfqY9WPYgb2vsSRYC
         ydX1VetgjcyjBJf44SLNT99Oo9N2OhbNuiqlHBuvZ3JFGAvRdVIbVPk/kQqXzvEruN//
         Z7VgMeeMtrVGgoMPDPBuU8+NObR3dKTWfC1Xl7it3v/UeyYgt5uK5IxoNG1etuu5HL/y
         VzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh5i956FQRub7c7gvFrpcYc3A+kvLa6CvoG8RZOb54NaGSwINwm270gbDdVgkdarlKLVIzCwUAo1UrNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYYC8B6s1YGxFwgk9m89rT5mTS1jx6jJQb5h91FQ+WHHdHPmtd
	8Ikot+pjDJlD2Mjrbm5jtM09LTqm3SqHR1O+P3rbQn4fDbD4BhwpbV4sWU+J2dx7rEI=
X-Gm-Gg: AY/fxX41hJfLshXjgZPubV3ImCP+7HsVE7rdS/LO0o8l2JZ5wS75BOsCDL9o/KWMJIg
	CpjGk9jlmk51TaqSXrXr21UH1vVMoRVBQvVBtrB11ww4P0bb6Wf48K8Jnd5yjtLdERGgmnZS2aK
	CImzc4Hg3AUNRu6nEJsPE0m5Jb5nf4QHJbLeKY2ZcGECiknP6o9BDfxnxSZ4qz85L/C5UvnOxxZ
	AEExmYr8M1brIrjfvsnlge/WvD3H10etLeAfsDgvXFjqk/zd8y/zG+pGqKV2sfbowc4/0HR5BRK
	UXZcNEpJbXpr5/jHYP2C4uoblxtMgVWGA23xY3OLcNW1fYBnAm63K3Su+cdM6sGPWakh+jfZF+B
	PB1N/Ewig9i5W5UDERTLqEPA4lNaclhP4PuG7QIDbz9uECzvEwIuynYvKsZt7xdBDGmiPRzX3VP
	lJNwrn7t/FfugsLkvre6S4fPFh9A5WWBM3uaTrtg3TtjnpvbbCDOc=
X-Google-Smtp-Source: AGHT+IGsExHw7kmZLolfw+ZMAQgKhdT3ljZ72+j77ytqYSqQi2wGdBc4Exxo++iBk542WCsTNheI3A==
X-Received: by 2002:a05:620a:1a9c:b0:892:25d5:2ec with SMTP id af79cd13be357-8c37eb7afe5mr382734385a.27.1767710638057;
        Tue, 06 Jan 2026 06:43:58 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:57 -0800 (PST)
Message-ID: <017413d7-426f-495e-94df-b93e39b0be98@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: spacemit: add platform SoC prefix to reset
 name
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064359_356075_8FA15376 
X-CRM114-Status: GOOD (  17.28  )
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

On 1/3/26 1:26 AM, Yixun Lan wrote:
> This change is needed for adding future new SpacemiT K3 reset driver.
> 
> Since both K1 and K3 reset code register via the same module which its
> name changed to spacemit_ccu, it's necessary to encode the platform/SoC
> in the reset auxiliary device name to distinguish them, otherwise two
> reset drivers will claim to support same "compatible" auxiliary device
> even in the case of only one CCU clock driver got registered, which in
> the end lead to a broken reset driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 02c792a73759..dee14d25f75d 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -789,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= "k1-mpmu-reset",
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> @@ -900,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.reset_name	= "apbc-reset",
> +	.reset_name	= "k1-apbc-reset",
>   	.hws		= k1_ccu_apbc_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>   };
> @@ -971,21 +971,21 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.reset_name	= "apmu-reset",
> +	.reset_name	= "k1-apmu-reset",
>   	.hws		= k1_ccu_apmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> -	.reset_name	= "rcpu-reset",
> +	.reset_name	= "k1-rcpu-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> -	.reset_name	= "rcpu2-reset",
> +	.reset_name	= "k1-rcpu2-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> -	.reset_name	= "apbc2-reset",
> +	.reset_name	= "k1-apbc2-reset",
>   };
>   
>   static const struct of_device_id of_k1_ccu_match[] = {
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
