Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF3EC0502E
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0htuHyBO3OZ058Be3UvB8vTGqL9LoP9dfmWpw/tC/NY=; b=dj2IPw42PcEAJr
	IG2adwjvLLVzvVKC9OhW8ZpVaEykgo74VWhXffn8Dis9Mpj3uCAcW++WS9i+V99183yJ6PA/oBX1W
	p/EsogkUD8SPlX+IsjCByep1yK+WC9QIqfIOTgiNBZRgC9iqvIee+WdqiZAQzYxeViLxOqAbAPQ4M
	32qFv73gcq7/Yj569CJJEUrz2OpjHXk/f6cAGqfbWawL6GHQVontXT8ueGQtu9Ob5yez1ghvb26LG
	Q/+WhNNStTrULlKKF10IGa1kSEH+tC4rXXuEO63YyENl9zbu+rFk7Lh0HXlM2f4HRWudNbL9/08yg
	+TkIhPLg24095Drl975Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs0n-006k6r-0q; Sat, 27 Aug 2022 09:21:53 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs0k-006k5x-Rj
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 09:21:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id x10so3616420ljq.4
        for <linux-riscv@lists.infradead.org>; Sat, 27 Aug 2022 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=q7Ikynj4nNNIvdVXeyhtGitK3OC8iSFGzk+Qet79628=;
        b=HLSvceKDscDXEx3fym/v2tvYpG8WiIobbxGsziM6Z5uOiktXKZfJ5FCBigVt5mmgHd
         +0O0OhT5i+n0f3zcLhmLq1DzS/r7jYVCbMEShEQnM851IqznDXgiVR/www91NXmTinjS
         WbnquEXbgbuFYUM19KQz/X+ZmJtFTybtgKpvGBeKLC1KsTfOvZ9w7IQ9gj8RWDJIvJHb
         KSptHjMSbf28TfmbXhtz8lwXG6i0Dl6dyTbununkqT8k012Azv5FcXvhwzNS8ty6dPPO
         3JUuc6Jhg+kj4V091W8JG9VLLUqFFnBnwjfwONsMK72mDD6eGxTGfVns4ccb9/wnjDhx
         Jg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=q7Ikynj4nNNIvdVXeyhtGitK3OC8iSFGzk+Qet79628=;
        b=05MmoCKjofWoecZ58V334LK7+1KYPgqZYKf/qcMlS5Q5M+MugRYKkIbApehUKW2YzC
         HSnwG6Fbs5DZSdvRJ/aiwkFdoUXlNQqrh+mZ5e7/hOblgzJEGRtInfTEF/3Ben3zBYd3
         SbXMdjRN91jxsDgmljQU+F3QeqyZ5tD9BPAXsyFyd2B/IHpSyKi4caGJ2EvQPB4jyT8L
         +ByPCZ1/eoj8EdMX/3wK9rCAiDExoglODtUl82nxHCzbTJ0bTXNh195pP66SrKCZVAjn
         EKvHQdzmLlHtkM2k942n7r2sJozTOUFblpXr8Qk2sUp47AtIiiqrFqmiDzemCoIhynHK
         WixA==
X-Gm-Message-State: ACgBeo2UOmQCu3Lee0q6OT8U4vfvRhqJHxbdFdtscRqzsIFcCFYVN0lp
	WGIADZyCIfrALrE2PXZwmxrS5rncYUPOhNUn
X-Google-Smtp-Source: AA6agR410TJyPm1w/2J1z9GmQhGxG/NdoMgKQMew1CctZvxTUs5Dnk/ttTa04Jd79EDLDE05PUyyog==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id k8-20020a2e92c8000000b0025d6ddfe71dmr3145798ljh.170.1661592109487;
        Sat, 27 Aug 2022 02:21:49 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f18-20020a05651232d200b0048af2fe78c4sm627121lfg.3.2022.08.27.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 02:21:49 -0700 (PDT)
Message-ID: <ab8bd3b6-59f8-4a24-0328-21cb7515f58b@linaro.org>
Date: Sat, 27 Aug 2022 12:21:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/9] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shravan Chippa <shravan.chippa@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril Jean <Cyril.Jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Vattipalli Praveen <praveen.kumar@microchip.com>,
 Wolfgang Grandegger <wg@aries-embedded.de>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
 <20220826142806.3658434-2-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826142806.3658434-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_022150_934489_D8E6824B 
X-CRM114-Status: GOOD (  11.51  )
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

On 26/08/2022 17:27, Conor Dooley wrote:
> The icicle kit reference design's v2022.09 release,made some changes
> to the memory map - including adding the ability to read the fabric
> clock controllers via the system controller bus & making the PCI
> controller work with upstream Linux.
> 
> While the PCI was not working in the v2022.03 design, so nothing is
> broken there in terms of backwards compatibility, the fabric clocks
> used in the v2022.03 design were chosen by the individual run of the
> synthesis tool. In the v2022.09 reference design, the clocks are fixed
> to use the "north west" fabric Clock Conditioning Circuitry.
> 
> Make use of a new compatible to denote that this is not backwards
> compatible.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
