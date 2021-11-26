Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7680FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H16YIj23WaHRiDiHjXCGuAQXZE1aMDMf0dkUIzh/lys=; b=GS03rvsWBupWKS
	i7+DL2WhFpjqhUt4h6CPTtEtRceX57oy5XT1m6JhtDp6UBInBvJMcVY8IJjjx+bPYR/Ma4MfdMX1x
	VgJ/14q9yhoytbbRSZPCtskkJITDukk0OpGpzywfJcvW0WRybcHdxg+lAY6Pj3xuVXSQ8g+U3y0jS
	E5ei+IBobHgHdGth6wRDb3hcY6TdeGpQdhQ1CnESkB1F8wttFG14cmPebdDP1bJW+5TDTjb6UTVl3
	1TF3JXcZTAesEvaXTHhS5A/mDiqFlP0JV3zh99OkOSHLHCh+G7J38WGbHQOFif+c58d6vo+YvOXzH
	BRfBA19pBn8knZXrvVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXon-009mAX-9K; Fri, 26 Nov 2021 09:46:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXok-009m9N-T6
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:46:56 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A9C573F225
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920013;
 bh=plA1T3f0xHkhw6F/UJZCjgOSSB/Tylz+pxOoFT+NB1A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=IZ1Y+ugyva+OJs5u936e9A0w7FeZTzAgTC3Q07umsF2Ls7KTIs9y0PHiNYk1NfjnA
 iIFa/oyejNYJzzku5wIg7PDs5zEC5wWKdTzASV+/FPz5F54CsTw+JPGsoLvL/PIwOG
 3mMHlhOmKJnAcJv2TEqzAyhJqQNqYps76AKi5ny5H2bzELIK4BzHDkaCXdqW6H5I7U
 LtLzOR68nRyFFvrhf16YzKAhvktIkpsENJW0Q330r/UfssoIWXEZkY8Sk8Msm5cxfl
 WtTmJebwJiezUL/vPTHLaKsefeXmk3aQkUfuc7zb9t6a5Py/N4OmAD0O1yg2hgga3S
 UAuDSNOYSZUvA==
Received: by mail-lf1-f72.google.com with SMTP id
 f15-20020a056512228f00b004037c0ab223so3977533lfu.16
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=plA1T3f0xHkhw6F/UJZCjgOSSB/Tylz+pxOoFT+NB1A=;
 b=uDnBZ8VFrP0XNmzpqFiOBYQ1dzoviwi7hR0an6u4BjJcwScTyk9ZyFR97ENwD/e8PP
 GjqDUUjkC+Z+GODncC189qMFg/0/HCOUT1NhaGwotCvrlI8w64DmdsaghpQVO1sE6njj
 48/Sqk5eiu23C1PJysBWSZLiHRqsB83O4TL7TJqAacg/wqlTGqgROhrjW2bWFYi8vzCS
 r9XqS+YbKQ3XFIRxFALJshOnlL20janhBjxNGwS/HznI6+c9Va94ujxteerg7VgAuCMo
 wRaJaAzsgN+ZfwPvVB/Ed5qSSA2/zJwN0XFJurIbZ5QlepF+/m8trdnVuxSaq4F/3dnv
 ToLQ==
X-Gm-Message-State: AOAM530ttVb4bYNYViKouNFEM+T8lKyjQq4p1KLtBx82R7R8WbKdd8pe
 7GWkI5l1i30XK+sJH4+3HhBlZbnvpQo794yAoNVEzErzkqiMQXGOJkSdzHvk5hQ7KhmVS94WAWH
 NTcF8BETcvW2Ia/WaDdm5KKDShRzBE5WIvQiYUPh3/cCF4Q==
X-Received: by 2002:a05:6512:118d:: with SMTP id
 g13mr29171406lfr.66.1637920013163; 
 Fri, 26 Nov 2021 01:46:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbeJMoWOxpyxld5Z90oscROEWxcofNpBSVu/AEgQCwOMsZppAAB4QQj7/jtOQ9sx6bOJK/uA==
X-Received: by 2002:a05:6512:118d:: with SMTP id
 g13mr29171394lfr.66.1637920013004; 
 Fri, 26 Nov 2021 01:46:53 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 d39sm464032lfv.78.2021.11.26.01.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:46:52 -0800 (PST)
Message-ID: <4838ed8a-5532-d5a0-1aa8-240f0c7c2c92@canonical.com>
Date: Fri, 26 Nov 2021 10:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 7/9] riscv: dts: sifive: Group tuples in register
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
 <20211125153131.163533-8-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-8-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014655_122296_7F5331A2 
X-CRM114-Status: GOOD (  11.14  )
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
> in "reg" properties containing register blocks should be grouped using
> angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
