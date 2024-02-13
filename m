Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64722C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jgpm6VVymUkJooarhNJcWHmw7gogloCsbm01nL/1xaE=; b=KvSHQRbJvq3mpQ
	o+v0XhLt7VPEDOEwnf3d4hiRIIIT+qAx+dHKa/hFQBoZYuIqucCS+zWbxpvb/fbEqOpWRNSLWlM7Y
	FkrOZ63AO62m4fvqz1XifSKpXxTUaqjh9Df5wMxVvAzEGkTqKwUpfgJbrqBsCSWwBJLmID1WgoGHp
	xvH7nO6EYp/UGqVe57vzw92X42tW8dRZ7vrhagk/0SAVJtj+V3+VFwFm2S0eM5+eexGlTAKK2RzU3
	aYQODQMhuKNBgHaDuBcGsiuRHQkLlvClhmB6Yff0wm4atL6+5a+r3kzcMznnLLDA1K5w2BZbOIZ1U
	HQpWOylv65SQ55gOM+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0f8-0000000AtsV-3Cz0;
	Tue, 13 Feb 2024 21:49:58 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0f6-0000000Atrn-0HCl
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 21:49:57 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3c02fd8e970so2409447b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707860995; x=1708465795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6l18M20UlttJ6hQRRWVYFjce2uAgn5/FsOhdrXI7DY=;
        b=Kjwp+bNpotJtudDeJnbTFju9IdY4jtQGXs329KHxcCEdPMpqYHYJ6wAtTlgi4HWfBy
         d4zeBRClu5+wcYkN9lxr2KGzwL30kZtbz6Kzt3lpgS7qJA7PmXPZKzrUqXHOawcZ6+Zo
         pHfvNzUiPyQAc7DnqSsviEs4BYqeiZBcb4YD5AW3pdY3n/Ccrlge7dscEFUo9iS7t5xg
         uBwkxYxX3F3H4taTHNpCyQqBeAh2DSPctUEnSK4HiPGU3sWMmBragEVFBlhR7H0H/BgZ
         0IXQy98P961ZpoWyAxjB3NvmcRPrNThKs/PX29NiONO6MqYMluHzlfhQxr+OgHcTCb5Q
         Pmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860995; x=1708465795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6l18M20UlttJ6hQRRWVYFjce2uAgn5/FsOhdrXI7DY=;
        b=SNGMmvpLjLxQIWgpMiK9bNwrCRR+puGGhoyuOlevbXPCHBQP2t3joaRUYMHghNzn5P
         p33Zvu9nsql6PiNb8Y6ITUlmxpeMhhAehkq12x5yM+bq2JHCfn18WD3Z8s+l4MYmJebR
         xJP6A4iSvXnwQD6kEwje68MJUBCyRNm1p/vWLIelgvqxzkJak2753eNg7Y5OGc1EpKIu
         lvAriyAAvpjC8l/OLpCEqpWgErklrlzChZk7OnW0ZKtqG/QnLdvzzlYkNsINEqAHU2XU
         44WXjzTtbGB0NwgR4CwUDMWhVSpGDpXa/ZX9XAwve+KJgqNUkFWMo9dnmR7Eq2r5IdBx
         /FRg==
X-Forwarded-Encrypted: i=1; AJvYcCV1a9VZFAcXHCenI6f+LH9xIsQX5Yj8R0E1cY4mh7x1blWOIkblLPC6hmdEY+xTlRkZP/ic/T5l8dmsiI3W/UGz0oCFD0Qz8S/Mj6cppQli
X-Gm-Message-State: AOJu0YxIh4g77srpKDUaUBREhw3qVNaYEXQvKkcQykrj/fhtnI5yEB/+
	y8ytpoOwdR0xdlpWkHvPq2bWGcz1Q5HDbbKlU02dZ3RwiF6l8wLGKBGDFtlvq1Y=
X-Google-Smtp-Source: AGHT+IFqSMXfxB/oldwVigXARqzWYZx2jPooo18sZemsf5ELEAuDlhoQS2ynY/ktzdx9/+1IJYWCKQ==
X-Received: by 2002:a05:6808:b02:b0:3bf:fcae:17c6 with SMTP id s2-20020a0568080b0200b003bffcae17c6mr625928oij.30.1707860994869;
        Tue, 13 Feb 2024 13:49:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3kStFGXxfomEi3Rg1qhWvNjTJYyDgWDJs6ii+0YD9XoJ7lrPOHGQbn/+4oR3iBrFGREC4Gi67jIlsV1jItYqG4VgEG5si4F6ErZ3Kv/+E
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id c3-20020ac86603000000b0042dae4c1594sm859749qtp.47.2024.02.13.13.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 13:49:54 -0800 (PST)
Message-ID: <4854dbc3-7c35-432d-b991-0951496eaa2b@sifive.com>
Date: Tue, 13 Feb 2024 15:49:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sifive: add missing #interrupt-cells to pmic
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20240213-protegee-shoplift-c9bc09f62a7a@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240213-protegee-shoplift-c9bc09f62a7a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_134956_145860_A06B5754 
X-CRM114-Status: UNSURE (   7.32  )
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

On 2024-02-13 1:47 PM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> At W=2 dtc complains:
> hifive-unmatched-a00.dts:120.10-238.4: Warning (interrupt_provider): /soc/i2c@10030000/pmic@58: Missing '#interrupt-cells' in interrupt provider
> 
> Add the missing property.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
