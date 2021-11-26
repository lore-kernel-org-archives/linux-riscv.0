Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE9C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRVa6OWufuJLLW+rn/alLJkERwly4obRdGOamUtauhA=; b=CUwkq6HtuPYTnY
	Fxyh9Qa7zCEz+XiodLnGji9GjVXhYi2swhp0ZOl77yOtuiNmtKIQzEzxiasUqXH2LEHKmV7tCK4sa
	izIp4KqdmJucXBDSAef5/WNfbHq2xkNIpwskexvf/ksG0OGO6DGZUbaKrVSHCqenMAyDwtHV13YYd
	7h8nZQ6WwBUzJQLSCFF62BgQhMngmccXw+GQgidJXGC+mPo15qMbULpBq9iZZXO+AZYKJVfHCHloY
	OKiOn1Ygcxp76QXUZCN+Hcpz4QzTkNX6gDG794Ixjq5q5fLa61HAe7kvRVM6QbHdPi56X0CEubuHt
	XmTaSY1EEEsqoGMAumsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXw5-009omA-12; Fri, 26 Nov 2021 09:54:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXvP-009oLq-Ba
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:53:48 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 51C174001C
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920425;
 bh=w0EoIKkAxcLpQhYM6DrPKSl6NdTzEKDgHyUHGj2QTug=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=i+cBK1SPzLswl/lqLnSWOtufDbCpmQmBYLmg0JXfMTZGyaD8vV1lXotVhlRxymrrC
 OrXeGLKQSLdsfbmAUIg1Sp79XGwEeYAjZ/AEDThKBXdtpf3twA4pUbVkUFCd+FGCRj
 h2fBh7H7xPoRag2FQHHv8vqUgOGZbULOkVAITkMmIpNDOZ+V3h8ftyUrelBmCvLtvc
 BDve8jeP0dAFgZ2eKmwJf3PQ2+KWOiMx2ZpqMPQk+PwkajWEAeLc8OcdcseLYCKG9B
 FgisphemezeX7Tr2UzSEjKF+THSz3FojtkGCcssx780qxU5AX41sC+7lIQZtiexYJx
 JfOyyZqvgqnZg==
Received: by mail-lf1-f72.google.com with SMTP id
 c15-20020a05651200cf00b0040524451deeso3944570lfp.20
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w0EoIKkAxcLpQhYM6DrPKSl6NdTzEKDgHyUHGj2QTug=;
 b=q2yWl9LiVrWenm8i15SRAR1Vw10MT/X9PQcGYJPH3N3ze9+wqQ1bv3wNV7abEL6y47
 W0lwJ4L/FiHW5F1XtzOX6fRvK7YTId09rt4y/yNpcRVdgl1r/0yB3ImXmJRW7sAliyJg
 CKXTRz7Th616PJNvogyqoiH1Z3sE/xphlpKyS/9uqLz06nAEF8fUubcEcJiQy1tlR/IU
 +b/9Y/HoFNVP07HI40sUjOlkeqjyxcNWPIl5FC2xyXMT3xnh9+++0tb5T+4CJyDbLyAk
 +Qb1xF9de3H4BvXRyx3Ycl5y0KA97YrARjbl8XYcf7WOiuH6z/C0hhxCeFt8FIT7ECs5
 269A==
X-Gm-Message-State: AOAM531SpuPrCu7e1FOW4+gui6aG+9D6qlHDWUh0LP3e05twfub20nxO
 AcrvYBSnktmNtgLVCB1+zzdk+fVI5IeT34F4+nZ7F4g3ZcO9precPvbOoUmOdWWsihARu4i/ynX
 80I9cU1y89GB+VU/WXZDnypEhXHP3rxO9BQl3lX/5D3whrw==
X-Received: by 2002:a19:484b:: with SMTP id v72mr27586332lfa.338.1637920424831; 
 Fri, 26 Nov 2021 01:53:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCeJXwq4ItYaL/wZ9/DJC6araykCT+DROx/0u16osfb9BzE6vCtxx6cSJnlcE99nqMNt0Ewg==
X-Received: by 2002:a19:484b:: with SMTP id v72mr27586318lfa.338.1637920424685; 
 Fri, 26 Nov 2021 01:53:44 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 l19sm118529ljq.137.2021.11.26.01.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:53:44 -0800 (PST)
Message-ID: <7f00d652-3587-b77e-a92b-bf1947fd01cd@canonical.com>
Date: Fri, 26 Nov 2021 10:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/9] riscv: dts: canaan: Group tuples in interrupt
 properties
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-3-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-3-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015347_613886_073AB374 
X-CRM114-Status: GOOD (  11.99  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
> 
> Fix this by grouping the tuples of "interrupts" and
> "interrupts-extended" properties using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
