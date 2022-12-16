Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A05FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohO3S6hkoAp/YaLnB2xvNs2PHHVKjxZIl5EfAD/MhWQ=; b=u8LacTRQGMuXTH
	ebcw0J0j7aRIY2NlUmLqDjIeMD+FSnZaQjRRBbgPHC/gvuJtknlim57BSPjwYAtHg1BgSPRmQLLch
	sMubGU/S86sCUCqZorfkHCJktQRYXUbiw8pbQ8SNFFs4eX9e4BMq6R3gQYUKDLF2yU1fyTZyUWkNU
	fQGX2Gs7TjA0ezK+3dZ6mpcEHl/57beEJDrOmw8+/ayWgIiYCwhyjic0RUyZLGKkApB5bgeEtQ049
	7vi9m4poAU6jhLNxZsQo7JmpvnOoCtgCWtxIZPCE9vSQxQaRJsLkWksyMTlq6RLNlpVg8lVw+YUXy
	4nmcCd5CDSdhFCiflX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Xi-00EKs7-Ty; Fri, 16 Dec 2022 11:06:19 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Xf-00EKoY-5l
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:06:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id j4so3030269lfk.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWwD7yi6dLlMGSUE/zB+/IBPn3bSJ7pcQB2OAC/RxMI=;
        b=t1mum5FsO1hC6xNYTKNoqOJKipNV7LXcIuH0929xhlqEtUM+n3Km3L8gNCZgCRB9eb
         CKrXaj5Vn6yykjAZSfjpMDwJ1oXy8SUf3GlXRhN/9Q3n6WtRl5pSAVcHLEkE2S1VQVpW
         lZi9rur9SvwotSewu+XAwwCZDzJc5zjyuGquIY95K3kx7FIGBHS2Q125GmQ/2AE+iZsP
         EvYqWVkvzc28aRdHk/T6Od4uhygUHkhV5Vtis1nVDzomH/rJcTTBtyVUG/VeHsTzc6sR
         VmZrf/x6jCXpTfn4GqYctUDqntucjM9vy5wxgujEc0Chff9eAjPpv4ign2sTr8t9pB2w
         qH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWwD7yi6dLlMGSUE/zB+/IBPn3bSJ7pcQB2OAC/RxMI=;
        b=Q9sEGEPO0B2Wgu1HWkVsypeHQzWQX5yfIzthjqgWkq17vS+gbneLVO/CTyA0XGBA4z
         TL0bokd+I6qmGfHswNIGI4KwwSysZmrdTeh1l1xcJJQjnmYOuiHcSf/sEkY/hs7K8qFD
         o9nIfKj0C9p1ZTsLWQgxfxNKDj8MC7tePxyX/qWC2yuqXv474XDD5/QRPmPazIo5nqdT
         GA102gcxFMtNeuALOcEbDklsieU1tRMYDuzJSa7eGNi5MODNN5gDWuYMpyW33eYIMXov
         ZWqejd5ws41vPPIrU9yDDhS7499Dh2fC9Tq/RlT62ms0qYpzxLkAf0otp6b8RjrW7gN7
         TM2w==
X-Gm-Message-State: ANoB5pmTSmqJj+foITbbrRGNUd+Z+fhdqZqiaHzomcPT5EOFV+2hFfBn
	dFQOFEdOYSHfXCkjDwU0qGWOpA==
X-Google-Smtp-Source: AA0mqf4wZV02mHd6JVlBfvVxPzAtzLRWGiIk5hcgUumZmOSbhTAExJo0O+ngKichPTF35vO6AkHA1Q==
X-Received: by 2002:a19:5f5a:0:b0:4b5:9b5b:ae92 with SMTP id a26-20020a195f5a000000b004b59b5bae92mr8827282lfj.10.1671188771594;
        Fri, 16 Dec 2022 03:06:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m8-20020ac24288000000b004a2c3fd32edsm190452lfh.144.2022.12.16.03.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:06:11 -0800 (PST)
Message-ID: <a8e09f78-704f-13f0-15ad-6c6dca6997f3@linaro.org>
Date: Fri, 16 Dec 2022 12:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/9] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-5-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216070632.11444-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030615_329202_1DA4BA35 
X-CRM114-Status: UNSURE (   5.49  )
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

On 16/12/2022 08:06, Yanhong Wang wrote:
> Add documentation to describe StarFive dwmac driver(GMAC).
> 

Subject: drop second, redundant "bindings for".

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
