Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5611C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ0ql9gT/0H8LgAOkPKtgTOha0pcq8o5sKciiZWwBIs=; b=XzQCKZJmYsttoJ
	I1ps6Ovvwwqbv16o+g7STyWOufE2QUXx/MgLpMnixzL+LbE7C4QVwhVAhadNvsf/1TWXOV1VlP54K
	jUV7PvofxxcYy4sow2t+EZbbDqqwdJ59KW/a362qGQk+G16NPY4UFcaQC/7qtHaFRMgroB41zpKSv
	5NOt6cG2uqrgK5zWOpp6IXRA1hjw68FFdaBqHybfsauSu4cBur7WQ54HPZ/Oh+wkbypzO0VYGPDpX
	WTzEnZ75l8KlD7d5zR5Nc12iGHhRFw7Vm8eI7mp9nKUqi+k0HVULb7+aG+8zRw3zSx/utIIMx8Zmx
	2B8cUW5i7zkev6VtiK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bH-00000008cxO-28yL;
	Mon, 04 Mar 2024 10:31:15 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Li-00000008YfI-1s92
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Mar 2024 10:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+N71wqWv249drMinLaztWYu6UMc95KoKU+EZgTsHKk0=; b=YU+Hy+RA3nYjGADD/Dd0bDGsnQ
	JK8WyAxHBWqavPTa+8OzEgP5JljEbxeJOLHAiat9uGcmXs/q3RNyxNRPh9lLsoGetvg+5d3xUpiv4
	F9Ky2gRLdzRwHIVYKOnaNpygylYt6RqukgQe4+vf/3QjrnJGgdp51ivpg1+iljPy2OxLNfNkkbTmj
	PfZ++irk+3UM+CDlGQerz8jBfk2HmDIvV2FZgUMQm6bp9CxhlgmEd0LuADqjEf2zqDQnZzXLMO67w
	h9uwT0lOkrE6ASLJwaPMmDkC+CXshmLZkAk325k+/fr3gJ+I2HxQ3XoTwVNKz6MiIQE6h7D/eXU3B
	SQaQF6gg==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Lf-00000004nHS-0ADk
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:15:09 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so48027611fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 02:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547301; x=1710152101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+N71wqWv249drMinLaztWYu6UMc95KoKU+EZgTsHKk0=;
        b=eZwv4uXB4/HgIBcvuYU8V1hgo8ztAo+uyzsqgU8kpxsibJqtHl3QB6uy1TOZzvpNA/
         2JbBV9da4S+qoJ2SaUxi7iPvcs0NFV01I0E3UY9j+enBKc+kDrY0EcpubLlgpcDInCQT
         DFqNemEbNO9sLVuO0FYoUbW678GHKlc0pC60bZWNdVUp16KfOGiSHnofAF/lbcXXiABW
         06qxCM4II/E76Vv7F8DsdJZUe9FjtbHkmhx7baoLgAm1CBNMrxImKUq9oHGXXTQa8TAo
         rPERfp4mDVB6gsUmf4F1oOPjGCqJ2kaK7BuoCNGhhca8LyjCX1UiGtEdAumwfbe7vawy
         zF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547301; x=1710152101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N71wqWv249drMinLaztWYu6UMc95KoKU+EZgTsHKk0=;
        b=PqrBHA05JvvIoMHjryL1s00+IiBzKv1nTqNcUBN7AqdKxtQ427DbprGLnDtXyYKV5I
         Rdwj10PFPY/txmkK9kQGHXPCZu69iAIu620ksMhrTHb2SpzVQpRlVkqkvC5wEjlTimn5
         FuzhyJp8jkE4cgGlUKMkP8kMJyhUhnZjblYReql1+YFjD8QKBTKCD1KXCXq5qA+hBD+d
         NcTGgB+aV4TMp8G/j2JlVaWZzyEkWsPGbxR9J+tsWouf1+KZHREpDYgcFhef/QHlBiNq
         uh+J4fpnhDHSOeVGHJQ87lwvtmQh2CQ+8VEzILfwKv+VyGEhRN+FSlzaEaAkvkWJx/Ay
         0MhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzXSga/f015J4zFhz8/Q6rpjp+7Rzt5wuveaPsgy39bVF5K3kwF+r+AKULsGgi1ji2acfinrBPGvwzf0T5LmarQwkkvu794JmGTEdFxlHi
X-Gm-Message-State: AOJu0Yxqr477t/ZGo2+BqBWR8BnU5ipDCWTK6en+scqA3n/Ic2FIwSpU
	8t//hohb7d8EGQOTmHN75i50V34j+9cJZT1R1FEWcW5eV5LFnR9eNVivGhgn2aY=
X-Google-Smtp-Source: AGHT+IEmoTQNpJhlBEFBymKenckHc6iWq7+ohBmEQ4KWeCjchXincRN5Zfuqt7tPfiRwwdGgxK92fQ==
X-Received: by 2002:a19:7512:0:b0:513:2de3:6274 with SMTP id y18-20020a197512000000b005132de36274mr4902251lfe.55.1709547301268;
        Mon, 04 Mar 2024 02:15:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id lf7-20020a170907174700b00a44d66a16efsm2527968ejc.2.2024.03.04.02.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:15:00 -0800 (PST)
Message-ID: <91f0a339-ac0e-49df-bd26-dbfe1485308f@linaro.org>
Date: Mon, 4 Mar 2024 11:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, u.kleine-koenig@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, inochiama@outlook.com
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101507_266801_FD590874 
X-CRM114-Status: UNSURE (   8.63  )
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

On 04/03/2024 10:02, Jingbao Qiu wrote:
> Implement the PWM driver for CV1800.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

...

> +
> +	ret = devm_add_action_or_reset(&pdev->dev, devm_clk_rate_exclusive_put,
> +				       priv->clk);
> +	if (ret) {
> +		clk_rate_exclusive_put(priv->clk);
> +		return ret;

Please test this path - you have double put.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
