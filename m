Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3747AC19F2B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASYAEw8fXHbHYuKxIe2/t7Bh4Uu8uaF2biZo9adBeSA=; b=Eg6zZETiWE9kwa
	irrweVBJlWpIuVEFTmtuOE6T6oekgSwHFAlssgtOx+MX28UIJ1gCr44LuK3T2prkZxIHexEbItGj3
	eE8p9EDQ84PFRF+OHc/cGaM5JsysfCdEPq1vB1A1L6PEPSg+bEZaOy1soppskFmwgwrp2OMqI0Ogz
	cWNrs9lLxdQjlrapK9taCTPYkyKkKsqAY5AB3qej1ItwyNnOYHtVCifu2Mk510LEVhnN5qEeKr9vp
	lnLkV2ZCJht5vrvdx7r1dNjgSxoojEdzYNcqny3GmYf0QqCl/XrXi3cQjW3jOf4NvNPpxRmiRwBBR
	kcFcQNiJAdb3U7+3pQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJY48-005CVW-Bn; Thu, 04 Aug 2022 10:26:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJY45-005CTv-U5
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 10:26:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id f20so22930405lfc.10
        for <linux-riscv@lists.infradead.org>; Thu, 04 Aug 2022 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=om03wwz+ZRnw5a2g8oUVqYCoqVIUjoKqhcO8rFCadcw=;
        b=M2Va+IhCt0l+iJnOqhZr3jywFUBCv/qc9QlFrkONLKlv3qU/cb0fMmpmmzWFQZXRg1
         bN/k+HBNAeEQF2fddmXqxd7UOx/LRnNQ7yDfBWlROPTejYU385tvHmUvkR6Uc1EAYehC
         xxchK75ONT490fdepDKJRHPQWIjW5x1IPrXMGDbqhcIRioqcdXSiyLcNpSO7Vy0ZDRwI
         8JUBp9UClNtzPYW9ytkrreB9ZmxbHzRMFBLylK6JCnl7jua2M/JQ9QPzOgZmJDAxPG9z
         TJYirVwMwviVjMceEks+yOLYH2DZtSmXOAC9msiiusP106Z9wGC6CXG+rhzu+nQhMDE7
         qPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=om03wwz+ZRnw5a2g8oUVqYCoqVIUjoKqhcO8rFCadcw=;
        b=SZ/GEp5YtJCHBD1Om6AiqfVJIQmqeOpR3yG5vGt4ZmIWaQxUEaO6OyBvpUWloNG8QF
         02WwF7+5HHFy36OXwhArIFm+u1jDKo8yA51qSEvu6/iPZ/k+p6ue85vHxU6dx2m8PhrB
         uKo1SsJcbyhNmHNPjcAbfHmWV6oGnMdC1vNDRGIO2ydoQviRAbTWfgGoWLZ9I7FroCzt
         DBn2eHAtT6Q0k1UsACQhRyx6QUTlB8JgLLiVZ7iBTYVNXJdKupxf1cburdGwc9yQUUIj
         ivAk/f/JAruDRJT2GbEtpZS3r3zv7j/TGLnX1HyLnDpFnpMto0RzIelvogyCo52Tx4O/
         aw9w==
X-Gm-Message-State: ACgBeo04CYOcroWaszD9v6SjGSSG0+5psq3Y9j+mqpGbmgJhPeHpy3u5
	dAzgBH611E6gl/sUr8JtXRhTuw==
X-Google-Smtp-Source: AA6agR7hL7vrJGcvBVTx0kL6VXd32MqAgQaIcASH9HdfeJuV4zVTkYFxtwLQnjxiLYJ6lcJhGzIDew==
X-Received: by 2002:a19:6414:0:b0:48a:eb80:816b with SMTP id y20-20020a196414000000b0048aeb80816bmr440726lfb.360.1659608810844;
        Thu, 04 Aug 2022 03:26:50 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0048a83336343sm73833lfr.252.2022.08.04.03.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 03:26:50 -0700 (PDT)
Message-ID: <950740ff-5b00-93f1-d39f-b71680958f7d@linaro.org>
Date: Thu, 4 Aug 2022 12:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: riscv: fix SiFive l2-cache's cache-sets
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Atul Khare <atulkhare@rivosinc.com>, Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220803185359.942928-1-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220803185359.942928-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_032654_002597_162AB9DC 
X-CRM114-Status: GOOD (  17.05  )
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

On 03/08/2022 20:54, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Fix device tree schema validation error messages for the SiFive
> Unmatched: ' cache-sets:0:0: 1024 was expected'.
> 
> The existing bindings allow for just 1024 cache-sets but the fu740 on
> Unmatched the has 2048 cache-sets. The ISA itself permits any arbitrary
> power of two, however this is not supported by dt-schema. The RTL for
> the IP, to which the number of cache-sets is a tunable parameter, has
> been released publicly so speculatively adding a small number of
> "reasonable" values seems unwise also.
> 
> Instead, as the binding only supports two distinct controllers: add 2048
> and explicitly lock it to the fu740's l2 cache while limiting 1024 to
> the l2 cache on the fu540.
> 
> Fixes: af951c3a113b ("dt-bindings: riscv: Update l2 cache DT documentation to add support for SiFive FU740")
> Reported-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I split this off from the existing series as there is no dependancy
> between this cache change and the gpio patch. The prior series can
> be found at:
> https://lore.kernel.org/all/20220726170725.3245278-2-mail@conchuod.ie/
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
