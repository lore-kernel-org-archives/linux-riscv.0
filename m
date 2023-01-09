Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ADC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJ2e9RLFqAvNKPQSaOXIJzMW+DmRVLMj1iGDmyoCoSI=; b=vZWzjUs8peRBl+
	kAuEmuQ6hwHhPdB9BD+/qvb8pe+8wOYeE7D0GdHth8mYVxS6NzhhIZ0pvB2iD1a/0P1t6Rt+0bpq3
	H0ZPJaAbsMiOwFWpTLJz6lmyk5QFSp9Ng6oGzKkf49ET7YJ2Lsz1uxasVaUGZ3G54XQbV1hrk7Vvp
	cvIJLQT/bEilFnrx0OMiNeOkWTktJVQpgHAGPY6vsp3i+MxCoyjt3vcxRCi8efF9c1XS5cadnXUaI
	GaT/UEiKwOaac0WZGoQ+TfKa1P5cfnY1GAj4DrTWflXRbwtLNY4Zcx+vDiIu1ufnB9Okwu9pymhb6
	NdW0UQcdLTXs3gha8L5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEumN-002Vcl-HP; Mon, 09 Jan 2023 16:13:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEum3-002VXa-JE
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 16:13:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id co23so8702915wrb.4
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfiNGwJ7nUW2t/7W07NzXNetigfULajsYrYfNX1hTqI=;
        b=V32aGgayNcRgyV3hZzHKzk9rB+/sTElIiVBlCUFiadIhjVdF09ElSQL5sfaDtUfERK
         Y73xmvp0NAnblGHZc18oF3DHYK+9X6MHX3vpA9wNCh4ckp/R+7Ly5z5tyh5KbjxwWrlY
         ypqBs9gxgMOwNYJgC4OOlGPDqHDk4KgKS7ZO8NQ4ijY5oRuw4UprjvS73G4qmZ90M/ZY
         hswiQ1jt2mefqxFStgsPpdTOUNek6w+A2FtghsxuKhQwhw7njWaU6CZAO3TpdikBemL/
         0m7d4/EMWu87X6Aqm5m1Q+urHQjtslk1MzGPx2U2KIT62uFld08tiQU77jUHagkijePw
         qBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfiNGwJ7nUW2t/7W07NzXNetigfULajsYrYfNX1hTqI=;
        b=nM//7i+W03xorZNxNUpwgfwdI1xEwFGaCrQUBHCWpq5gnu6HW1sHddKxci97eSA6G2
         5RwuUAURoqA4g0F+sUITgffCoUgO5pcVipvQJVHNPeMpWtxYhKuQFLRJIGRK/c5/zPMM
         2IsCmELEfYTd8V+AroM0Vq2YsWuhOHC7mYvGCVO1M3Hp5ULH5ay/sXjh0bIVZi5cMvoE
         oVe3Rg4vSd7jecjWRYn/Q4S3xURcYsHcxP66v8UOqPqAeSV2u78DD4XWllK93AMuFytF
         sK9Z949qLus5japdxTjq5bkB8O5tZ/vMBDPmm/k8Q5q73/AwUAiuzqpVyAPzKkQxWNwW
         Lu7A==
X-Gm-Message-State: AFqh2kozzusfqhY46fIgPVCQ4nzsghvJkyVoc9/ALQEycbZYxa4AydA1
	Thh8PJqkJL1ES3VY3HRI7krO+w==
X-Google-Smtp-Source: AMrXdXva9ejqrScLSqJndmjhzGnLcXaKNxvT63XElWgwEiO/vbKsn8Gw5EoGvIn5+AWshodqmk7R9Q==
X-Received: by 2002:adf:f482:0:b0:2bb:f4bf:e758 with SMTP id l2-20020adff482000000b002bbf4bfe758mr2736091wro.48.1673280800820;
        Mon, 09 Jan 2023 08:13:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m10-20020a056000008a00b002683695bf97sm8825933wrx.58.2023.01.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 08:13:20 -0800 (PST)
Message-ID: <3b4d93e1-a065-49f9-93d7-cec4807d411e@linaro.org>
Date: Mon, 9 Jan 2023 17:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/6] cacheinfo: Check 'cache-unified' property to count
 cache leaves
Content-Language: en-US
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Gavin Shan <gshan@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-4-pierre.gondois@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104183033.755668-4-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_081323_645987_0BD96977 
X-CRM114-Status: UNSURE (   9.87  )
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

On 04/01/2023 19:30, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> '[d-|i-|]cache-size' property is required. The 'cache-unified'
> property is specifies whether the cache level is separate
> or unified.
> 
> If the cache-size property is missing, no cache leaves is accounted.
> This can lead to a 'BUG: KASAN: slab-out-of-bounds' [1] bug.
> 
> Check 'cache-unified' property and always account for at least
> one cache leave when parsing the device tree.
> 
> [1] https://lore.kernel.org/all/0f19cb3f-d6cf-4032-66d2-dedc9d09a0e3@linaro.org/
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

Thanks, solves the issue:

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
