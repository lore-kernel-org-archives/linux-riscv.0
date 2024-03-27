Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94701C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shHhab6IBaebh7vPTMYM1Uh9GjRF8qHw1DyET5Bq6cA=; b=2AUMl2U3TkS3gu
	jPglq7cLIp3OvP30NwRvUVoRCrV6bIyY02x3P42QpqGfZ7GzIGQjcj8lh9IUoRdFobITb7dofYr6c
	1uOefNsZh+r8+L9sBTCUYPnlL9XT+AxMv29usqwuxxod4DwkbUm367g6gcBuTu8APTOTgPpZ/EWwR
	yBjfs0eyUj6J/dTl5ZuHNaAoOVdufBeFDFpaz0pd7YvT55gbcoDcpksMH7Qp7yJSUFyHBimg1tBj0
	JL4UHExBIQWvwVUD3Ozh3uaVV8a99/wE+7yFA3jhKn0TbWFMUdvQ+NynTASt9A0UJ/mVO+dekkRI3
	NWG8N8Kp9RDKJyJUYaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSpR-000000092Jy-46Gb;
	Wed, 27 Mar 2024 12:56:29 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSpM-000000092GH-2MXQ
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:56:26 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7c8d2e0e9cfso190732339f.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711544182; x=1712148982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDUDMYuwU2SUxAqC60S/6H5qJEoJ0FMo+cGtvAM2eZo=;
        b=KlPi9vmP37zux/Pha8ZyNWB926vm3BIrR0BUljLfLjdLVs0Qw2dPwtOFV2tPEG6i/B
         G0rYam9YZSiyMUvg6S2OUFKeg5E4V54jnqYsMQXMgGoa77Ekvx/l5IGwAmS4LsvenEGN
         wScdvOJBqSJ0vK18ougsJbPQeIu0qiH21Sk3qn2pS7vfI+nhRz8Bm+koAeJvcb+a55ea
         Ict2gpngNilLS9GKKUTv5rhNGzAd0Mbjo6n93AKPKPdt/jrbM4mhENur8wWnvLyV3gQf
         7RSJ1qA7ttp30yd7ASteETeYrpsH3a436IwyNqyIOe+Ts+gs6scs4ayljsOPvBZlxC+n
         Kg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544182; x=1712148982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDUDMYuwU2SUxAqC60S/6H5qJEoJ0FMo+cGtvAM2eZo=;
        b=rpQaCyeUWtzAiwZisyLWmkPJD7CdN1qwMA42GGb4kzNE19jb11Q8GfwM54IiuHpkh+
         jhSbqoOfUP1o5xLT98bB8vvLMau6vcuD2jUyfjuBKPDkJ0w0eeW3JiTAoVFZs/6fjysq
         yLEQho/crXihBSPrdhIUuJLEuWxUdR0UKS6VexbhPn9XQDgemL0pfjPUXMZ2w1UDvFOi
         WbLdgZZ3Lc7L+2yPc+3Hfq6Bh0C7AZekeydchtyGjVP3HKRRrVXAbPski017zIrlHgNE
         D9qV+51HQ+YRPQllicKWeGxl2xDp9SoU7LMyWOVO+WUEEddZR6h03Tlxm3edse9Lw3AU
         z2bw==
X-Forwarded-Encrypted: i=1; AJvYcCXfkayRnuuL9P6kX1jpI4otv25PQGrR07oUdt+VyCRB1qlKm6tGQukf7/1/018M0qvzjNiMJPijP4/Y2Bfrn55hGRTscT9O0n2Z1qRa9Gs7
X-Gm-Message-State: AOJu0Yz1bHPak12RwWT+uH7TRIvfWQc5+cPrdKsXro8zmQm2bP5y9UDq
	HQDOKC6d/B2aPQOX3qwZK6qyiwRIYA1TgdudizeZelw9Fqg2SVH8Y1zhX0fSSBZeZHRbQZI+84L
	1
X-Google-Smtp-Source: AGHT+IGpHwDVcEaSCyL0jaVUFQB7IqtIxhkm8li1Yxlb1nP0/kTO6T5MUCR28gpsX+7hskI59QpZbA==
X-Received: by 2002:a5d:8508:0:b0:7c8:dc57:4dd3 with SMTP id q8-20020a5d8508000000b007c8dc574dd3mr5226769ion.6.1711544181585;
        Wed, 27 Mar 2024 05:56:21 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id k7-20020a02c647000000b00479db9b38f6sm3249826jan.66.2024.03.27.05.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 05:56:21 -0700 (PDT)
Message-ID: <b929afe5-c148-499a-906d-fcf208b02fcc@sifive.com>
Date: Wed, 27 Mar 2024 07:56:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.9-rc1 regression: irq: no irq domain found for
 interrupt-controller@c000000
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmplvfg90v.fsf@suse.de>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <mvmplvfg90v.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_055624_691027_3BFC42D8 
X-CRM114-Status: UNSURE (   6.91  )
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

Hi Andreas,

On 2024-03-27 7:21 AM, Andreas Schwab wrote:
> The SiFive ccache driver fails to look up its irqs:
> 
> [    0.762329] irq: no irq domain found for interrupt-controller@c000000 !
> [    0.769358] CCACHE: Could not request IRQ 0
> 
> This is fatal for the JH7100 based boards, since they depend on it for
> their DMA noncoherence.

I have posted a fix at
https://lore.kernel.org/linux-riscv/20240327054537.424980-1-samuel.holland@sifive.com/

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
