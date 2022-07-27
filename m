Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6B4C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KsfMmF9U4Fe+FO5ZX/XXVg7KKKo4g9eB658F6nOBg8=; b=eilRK0kSXcO5jA
	YHLqtJSHG093L7ATPM0JlZvgBNSKi+hVPft1E4zpa+ydVjRDTzjusIiusectAfCHd7X5M/xJEA0v5
	wwu0k4HXWpb2KjFgpZrHpkI5zWXYozLQOjKk6qoK4HHTCzSBU0ouFaH/59hXFmg/qervbIUshPBQy
	ar19yZ9Yrs5cgkIxvSdJuRTRpF4NggYGOC1LD0AIACYvbMbTYDlRfWVFQ2rolx2rN7SH1VeMPctIH
	F/b4z+QROt3OU1hdYijEo79i/m8JdRolLfnH6cTJO6T897KbTevSiW6W8Kjv0s+0/RnvAkpRQKbWH
	HQhdFIVLX0jgJSl6HAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGclV-00BNbY-61; Wed, 27 Jul 2022 08:51:37 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGclS-00BNYg-4D
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:51:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id z13so18670857ljj.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PVFH91R9182JZgovmYgx9fh+rbCW9xXMf9XMQHHcGtI=;
        b=DQKxEDaNs9dN2Rnmzv9DYf2NTRBetk5E65HXSVlh+hjab6ivhkb1o21ugBztrRqgUB
         GDwEh9iHU+TeJoILMZX+JtoSdP0Jdm6+4zyE6aCzYUraVZgR75iA/GkTu79vn8jyhR/N
         en19/Yz1DDYjFHHRnoKIOpXhCoi3/VGYfvYH3ZgxYR6pqMxLfttdWsPBNNBzdRLq6qrQ
         XXdmWt0WBz+dfdrfNmW0l8VjyCTOQ9OMYH0PZ1UaftLTaH+auhhwLM4pphpPZIdusY75
         Sn1Rqdv2UkY9xVx+wosI/GA04IxDN3sKSe9jwrIqsMbidhgRSz9agEhyz6TFmFYM5pvW
         6+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PVFH91R9182JZgovmYgx9fh+rbCW9xXMf9XMQHHcGtI=;
        b=iNrk008ADNwcaZjAVyWTqTVK9/MNf9anqmF0ZvFlNsXQA6fqRekEzzemXlUxRdQTVe
         MEZh+9bxsgDgQbWN2EtlYs2FKOs8tD/Z6ZEPmr+U0urnLjGif8xWIUD7Mg5vDHrE+WnL
         56nIFTWzpx9eAyqyJCLEcDwhlz+VK1ZG+i1JPBNrQcmeZl5qbeA90GPenffKesam8G5+
         USiwte7xTA1f7R7tIo5avnsmk4JPkM2wWDlpPbnhrw9Pp3kFP1rww7wzsTyOzmGsj05U
         bZ9YFAvJEsBZZ5poOYDAxVZIYVqXTq6IpgkIjzPLLGHz46CXRAsBioItKVqaLGiOs0eU
         6Hrw==
X-Gm-Message-State: AJIora9Yxzulinf5IFWVB54qbM9iALHyHpUGkI8//yot/v1/RMwzs0EK
	DBmdrxEEiziYcoKSvIDiIhXI5w==
X-Google-Smtp-Source: AGRyM1viBZddp3vcu2pn8e8WUuPaFcvD+j8cQRKmZ3C0PR+Ll08SG6+N7TT8crxPgCzm9NEoi++G/g==
X-Received: by 2002:a2e:8247:0:b0:25d:b515:92e with SMTP id j7-20020a2e8247000000b0025db515092emr7302969ljh.527.1658911891770;
        Wed, 27 Jul 2022 01:51:31 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id 25-20020a2e1459000000b0025de9a05176sm3513356lju.111.2022.07.27.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:51:31 -0700 (PDT)
Message-ID: <90efbb20-f030-5b87-699d-741d0a769d01@linaro.org>
Date: Wed, 27 Jul 2022 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/6] dt-bindings: riscv: Sort the CPU core list
 alphabetically
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015134_198311_8DD22A80 
X-CRM114-Status: UNSURE (   9.32  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Sort the CPU cores list alphabetically for maintenance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
