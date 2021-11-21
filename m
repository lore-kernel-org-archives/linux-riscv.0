Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHQ2klkeG3aaG4m2tna539ysVrgRfpg766HpT6Eh7t4=; b=4RrrBKxDEj5I8f
	wmB44VROrLb0kcJnhnVMgH6YOiCnFI/e5g6eY2l0ec5GgsMYCpyXJqIhcF+2RGPumY65/L8ZH8nxw
	iFirXmgHHhg1X1Hdal4riRoOCye9W/Iq6A1ru+umRJ5RJqVR+kIBL6KBrC3RfObHzqy90baMoiSbm
	BDOJbbFKotCE8/NltmzXp6u+HxsmtYggCMgjG5oyiFBnWZwVYwE0JRt4bOxLAKRjQFNFVzs32etFW
	7ZaMG+aNYlJggxgIs49QERuO770gTL2lzHwEoncMqT2hOGAvvTQyhHEND7fm3MsXmE8jfetR9hnq2
	Ke6gyQGqUE/WPmYEUXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moqZ6-00E336-Pu; Sun, 21 Nov 2021 17:23:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moqZ4-00E32K-67
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 17:23:43 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9053C3F0EA
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637515420;
 bh=8EKhvAzuNETIXPZvBdvtzzbJxkmJKv3T8xcGJE2o9zc=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=Vcq5ocBFePw1joK3tninNkDLh7L4qkTioKUzYWhvcBRKQhTSqwFc5KUbYrbMtdjVa
 8Ba58iEGUsziz6d2KxMiE9yLepucEtumHSTopd+Ex9mZrgf0j7QfdugLLCEthnTODh
 mhNhNq6EyZnlx+PqXn7Vfq2XZjOmBP9STfssmPVkMiaJn+SfGc8PHmkNkJTdS4zUgE
 osy00h2UR+g2YgVeUInvGr0auuzd+lRyZhQ8h0VpA8TajFIbOsw+az+6I9OoRIy/BL
 rleVXLjXQ0REQPkEI1qPDtj1OwvgiibBhjuyqDjU/oAdfg5giVHZWljX58ykSxAFGP
 /9f0bq+eTzSIQ==
Received: by mail-lf1-f69.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso10361385lfb.17
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 09:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8EKhvAzuNETIXPZvBdvtzzbJxkmJKv3T8xcGJE2o9zc=;
 b=Fu44pQMZjODSCWqbJSf6FlpZvH3QWxqsjRxiV32B6UzwPF63teXBxjSSQHw42IcABq
 B/Rz3YzU3uyMBzxMCrYI/5TT/UpGZ6WoCaM34HqQN2/8n/BhqRw+LUww+xA9pFaZOuck
 P1fyJYyNiVhfCVMn53OhIjHBGkgcSGYkNUYvWEPQRGu/+kbf6sI1grW2WxH6rfH+Pj9d
 7Cr6JGFu/ghflwxVUiPcPgZ7C8F0HwN9UwERjymYMN4TqIs0po5HeeeEgDNNsEjetC9C
 RTnP9IwMuGjXM1aRNfq8C55C3OxSuMGRQcVCsZ6bPeckgYX9scyMtam04rHbGHOe+cdm
 jtbg==
X-Gm-Message-State: AOAM5313YAkR22ef/K0HOmdPRX4415wCJsuTx73Vr95NpZcgASQzS3iI
 +/4mvkbBeWSPhe0iC9J+mDTfnxKcvB+lxKEuJ/cx1tHBxDptW7jL59mklDKZnyJsXXJOsaOrGMT
 Y8GYi09sfnxDN3Zy4k0bv/ssTcYYuEpuXP53VA9PcRGocUQ==
X-Received: by 2002:a05:6512:104f:: with SMTP id
 c15mr51372078lfb.256.1637515419964; 
 Sun, 21 Nov 2021 09:23:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1jPqSJFTGZGAENICSqrdk2/BOSkXQMTiiA8ICivNbDKs03/7WG+pTjnVWK2WHcqcaxqwhpA==
X-Received: by 2002:a05:6512:104f:: with SMTP id
 c15mr51372056lfb.256.1637515419800; 
 Sun, 21 Nov 2021 09:23:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 u23sm701037lfo.35.2021.11.21.09.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 09:23:38 -0800 (PST)
Message-ID: <a6111407-c0a4-0c35-dc26-f30022df775b@canonical.com>
Date: Sun, 21 Nov 2021 18:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/6] riscv: dts: sifive unmatched: Expose the board ID
 eeprom
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
 <589539cd08e35c35b269a769caeac40b85ffd01c.1637362542.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <589539cd08e35c35b269a769caeac40b85ffd01c.1637362542.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_092342_400958_A56BEB0C 
X-CRM114-Status: GOOD (  12.27  )
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

On 19/11/2021 23:55, Vincent Pelletier wrote:
> Mark it as read-only as it is factory-programmed with identifying
> information, and no executable nor configuration:
> - eth MAC address
> - board model (PCB version, BoM version)
> - board serial number
> Accidental modification would cause misidentification which could brick
> the board, so marking read-only seem like both a safe and non-constraining
> choice.
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> 
> ---
> Changes since v2:
> - Fix end-of-commit-message separator so change lists do not end up in them.
> Changes since v1:
> - Remove trailing "." on subject line.
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
