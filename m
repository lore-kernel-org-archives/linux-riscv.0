Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF71C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHqJfxQpO7+bawhS3ex7fEdm4dqJFnBtkFqbTqWCFf8=; b=2Ekaq7FNpPk9P1
	+O7/PbkPqzDaXdbUCdOpE2qmfHahsYWgs3NphraGiJomWfjtzemr+mcLsaV45CFMGBzBotyHgq9ea
	gxuGi+4LblAe3jTagKsFmTtWjsOGVXh5XV3ZMQdYJnoijv0bhUOyFQUDBT4dPJgFPxD0HXtNEJDVx
	BVxfxO++fDsmOVl9/TfgnBmuRt89paXla5db41GOEn0v5JRs6oWaC9gkVx80+zTmNZo2EbRglylHS
	4ts/8/kk7wpfz4/IZIbAmQTaXP/XRSqD/Wx69LEbGy8ojysZ9o/npRar7HoJeMIc97Ii7l0wUckjN
	PQexc3l8RGXRrE+O8ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOSy-001XfD-UP; Tue, 26 Jul 2022 17:35:32 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOSv-001XbU-PC
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 17:35:31 +0000
Received: by mail-lj1-x232.google.com with SMTP id o12so17277593ljc.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JHc7AYlRXZ6aiCtTe+oSlD5N4Ua+N3EzvkXaFf2RC4o=;
        b=N0deSDI+LiMOpces5+etS+NS14zNCm+md+u9gARDG0ixEpQGvSTtzErTuNz2esW0bT
         pXkajtBnlcabT+ZLAsxwBTnlCw0OlA5Cnt5/ohO0aXrKf0uwf5hwWi+MviSEd1CBBRjP
         GARs+6N9PoIAG51nVHvY68XB+6nN5SRbaAn23aBQTdq0DEDKIKgdLAY6y7p2XvQ/XosN
         Pd37hCg3n0SvCLNIHyOn3l0YWoYBZjVqlvxzuBK6aPAttokOg9VMKY/XelUJ/ZtuLpoj
         0gVLchzNRRmyDsHubxvRY9zv5ZG+0x3LJCGdwPqzLDj1wQMo8FO3NBAQE4g3UBz085Vd
         cq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JHc7AYlRXZ6aiCtTe+oSlD5N4Ua+N3EzvkXaFf2RC4o=;
        b=V1TAFj9HPqBO/yK67B4BjzMZjeq1iP01fJ4+Yudr6QTKGWeLJqW8Kev1zyRbIzvvJS
         QlTuHNRdFoMc2yXQ570TRpbmf+xR/Q3U4M1Rie/Qq4Rp3dKTC1+d7+gSPZUoj4zl/J11
         62421Z+J7wEner+8ntBWa6Z30XeeaB5NmjroLLg93syqdtBZZX60f0Zc02ffS+mHYu/E
         ++VFmtEPE8oIb3VDCLfB3ZH5Z3hFuFIokGO6/v9tUvnRtnzkqgIku7M22vxcXGV66dr5
         o3HFgPK/bJMoZx6oMVTDNf3HL1Rq0dQadfg+X82457T0jVnjGDCu7k3rAs4pF5az0DN4
         yfrQ==
X-Gm-Message-State: AJIora8Gvez4SuvTFHxsg6VLPMVfcGHu+Flw/ZEwRPud9TVUr6t8d0d7
	Bk0YYo9reVC0R0tt6kUZK/k3qQ==
X-Google-Smtp-Source: AGRyM1tmwXLiYKvaVFxKBF/ccqtJ5bZ4CGr5twneruJ80NjxbDQMnHuz7XCk6ts4YVIGB6Rk6qhsRA==
X-Received: by 2002:a2e:a16b:0:b0:25e:8fb:a1e1 with SMTP id u11-20020a2ea16b000000b0025e08fba1e1mr3784078ljl.270.1658856927106;
        Tue, 26 Jul 2022 10:35:27 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id w14-20020a05651234ce00b0048a7ce3ff84sm2246967lfr.285.2022.07.26.10.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 10:35:26 -0700 (PDT)
Message-ID: <246f132a-a23d-7c53-38a7-2bcec50d65e5@linaro.org>
Date: Tue, 26 Jul 2022 19:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: sifive: add cache-set value of 2048
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Atul Khare <atulkhare@rivosinc.com>, Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220726170725.3245278-1-mail@conchuod.ie>
 <20220726170725.3245278-2-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726170725.3245278-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_103529_864479_9C0108EF 
X-CRM114-Status: GOOD (  10.16  )
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

On 26/07/2022 19:07, Conor Dooley wrote:
> From: Atul Khare <atulkhare@rivosinc.com>
> 
> Fixes Running device tree schema validation error messages like
> '... cache-sets:0:0: 1024 was expected'.
> 
> The existing bindings had a single enumerated value of 1024, which
> trips up the dt-schema checks. The ISA permits any arbitrary power
> of two for the cache-sets value, but we decided to add the single
> additional value of 2048 because we couldn't spot an obvious way
> to express the constraint in the schema.

There is no way to express "power of two" but enum for multiple values
would work. Is there a reason to limit only to 2048?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
