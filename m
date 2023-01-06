Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C428C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oNGE1i6R9zJqutW7kUl4VgMzsDrZ6TXEdGwIw1+9EM=; b=TRUoCw6bydEFOW
	F2s9Yp2DMZ+TUvJU4hxNSq1AnsNQE7zP76jdXdymKCH8HAUcjUPRwBj2VKFknr/xWOeKsf7lb9Zc1
	A1MpR6NCNbia4p1NbGrnh/ozQJCtnBdpFuIdTH0t6diSaOehgo8/EEdquMpLQuOaJ3YjJb84/j7+1
	fTbwKvhycHrMPm8IQJplkMTXD10lV2CX0qRVfmbGN+sk0580FdrzIEHDv3WnC+q6e0IJ+UGibEEwN
	YplIFq1aH6pJGo8Og+zrnU0T/FQSE7GSGR1NGbG+oBpaui6cVXhsrzf1uHtHNvq9ar0iBBC87L+XO
	aDupSOoIlC0JEmmEfT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlyF-0087B5-Ad; Fri, 06 Jan 2023 12:37:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlyB-00877p-BU
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 12:37:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m3so986081wmq.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 04:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfkdNWtaqfWf7qUFl/BGUV8KbJ5Fivhd3o6PbjSCcN8=;
        b=lP5AwIEjAC+3lfJNrf+S9HB/EoC0nnqsOeX2OpUVaCtd9m0t6N/SekUoj2S8/8a+oV
         3NDmOlZMPf/4H3gxlYzHbOKgYJbG1pAxkZU/IqDmP7gocWJYV6gw0qalGrw2uHDEa8ja
         t67SacSBAMqh8FhuwPMJsfsbaoEecUf/BhehB0RKihXqv/G+IKY59+9XVEDygULYFkvF
         MAs/IPzgz9TVNckMPf8yqsx24mYCQj7kzB7BZJNp+JLs3tqji7vbAiE5PvLDfKgerU1g
         AofBPUiNukfD4l5WoaQV8uFQ280d6gilfsIJQFcP14ZXCKqgN59C2j332NGhsr8QcgQ9
         CuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfkdNWtaqfWf7qUFl/BGUV8KbJ5Fivhd3o6PbjSCcN8=;
        b=RyEAUZT6dIHDEeOzDPOJ4GQthsgY8lQcFGTDenfLe8Nb7Bo0vU7wWUjMuQGOeb4TFg
         EYddJUsmDzcDVPVlboie1HewgVbdOpvnXJoyNwVX6ZiC1iGzwkZzVe3YwN2FLaRyKY1v
         Id+SKhlSmZsRLKfRIyjl7bqqb2p0fdKWvnnDJr65NHQ72S/KMBX8zbWxLZE0+RbIf+dN
         ZO8LQ21CSukZ+JzqTzN9QqvB+6wzDNR2G9Z0iEj/G63VElc4r0wmI/L51TVBLj9tK4dS
         PKQY7fHpC0kJyn4Qqn32xfWcJ13xc5gwgg/yVnG8Cc+PA+mM9l7qHZGyHJzz9LyI3I+p
         yLnQ==
X-Gm-Message-State: AFqh2kqx/l940wbol4RHcXHMcI4Vh1peD7h/gs40MkXVaFj5+UCWfGZe
	LjCT2B7FJDklBJla7k/q9pczAg==
X-Google-Smtp-Source: AMrXdXt4SwoPX7N00J959R6a9X52m1stIfhnB9gX7yMTUn+jnioUf0KQclnbmOfsHkl40kkFhoLvcA==
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id k13-20020a05600c0b4d00b003d349db0d84mr38422517wmr.20.1673008627610;
        Fri, 06 Jan 2023 04:37:07 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003a3442f1229sm6903655wmb.29.2023.01.06.04.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:37:07 -0800 (PST)
Message-ID: <e501df1b-93ac-b56e-cb57-8059fe251536@linaro.org>
Date: Fri, 6 Jan 2023 13:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/7] dt-bindings: net: snps,dwmac: Add dwmac-5.20
 version
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
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-2-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106030001.1952-2-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_043711_431514_A240A727 
X-CRM114-Status: UNSURE (   6.58  )
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

On 06/01/2023 03:59, Yanhong Wang wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add dwmac-5.20 IP version to snps.dwmac.yaml
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
