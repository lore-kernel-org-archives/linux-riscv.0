Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3B7CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 06:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMuf9WVxe/NTE1+UzEYjsKJGMShEupBU74w+ldMAXGk=; b=GADC18D9emuL5Y
	VP9XQ+3Sps6T2PPxeLcYHRgfqzKNV06Nyf6MdP1IxX0gNbfMvMBpbFkeA/FSdcVMMAYBI0rnFZLf7
	B5oqyA731uHDvQK8DdknGg+Kjl0l34hh6PGalyIxpmAmXfto/CPNTSMJlfLYjAln/OzCBiwjc0QlX
	k4RSVxlvRoP5wA1+FgKjHCSIhCtNT+CPu6sQ4CFcTaIpxkygEe7PiZjywHnVfg3b/USHOyPUmWefZ
	5FIgHR+zwMLnEBOtNrPPquYVlfWv8VE/BMsyuoVsuawwiEFiD3AbSXoliC4MDaS2gqGoTH7oWlE/1
	hNBKERrvtM8DzqE9mq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL2e-00000001fQP-00hB;
	Fri, 22 Aug 2025 06:14:24 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGdh-000000019SL-0ZFm
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 01:32:22 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-32519b32b6cso305933a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 18:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755826340; x=1756431140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=Fq/xOiUdU0jlbK+vCgBVxL8kIxvDMbbNVSgolSL0dV/Wohlrqt2UtxNMrc2Kuzj+kl
         2Rnkigf+oFvHllQluU1aYpb0O3QOW57KSJGD3rbQhDur7aVQwuS4pEuMraHZfNHAiGiO
         ws8U+MDGttKAKhJ8KGeZ3F3We/CyZa1xWldgFBZwOFMQsODTtpejmu1NzWGbPzyrxnKP
         HVb8gALtTS3UO80PxJWsadMBKOnwnBiWshbeAKjN7BFXF7l6qZfFocXlWrgbB6+qkmvs
         Z/xBo1CKYtZS4Sq3zQXAp+0FjX3ZkNWCarA+f63TOfe6I/1xeHClFYE7ezu+GvYI05/o
         yA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755826340; x=1756431140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=DMMrTrbFxs63vDLJb5AplPWBc0VjufogpuPenGUpet2kseUUHw+b2zE7e0hkRq957E
         3p7BlAAHOjsjT6EtioGyAzBIs/NPOlBAw/OuSC7xQ6D2NA2YJFU6qYl4np/G6H1Nms65
         7hqxSVn3ZQBNam4WXPyB+aSJpGuaU5RtptZv+iOHr5ViBAGAO3VPlMhb779LteT36hAt
         24Vl9jNdBxHaMG4BL3b/VlO+IlaneNYDN9GcIOvuYkkCm3YcyxAkWsdcWD2ll5Ppcsiy
         TYZCQTGez2advNU4eQra/XL924ain1apFJITe3WpzR4DtA9D9OJTCwt7bK7LLLdqRguG
         7vww==
X-Forwarded-Encrypted: i=1; AJvYcCVMH/uan50lUakD+FA5+9zmmU8+R03SfP5YdnRVTXnuiGZ04fxEgIliVZ0UxdIBEK7WaRQJhasvBRP4+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7hHZ9UAwa5M0s2Wd7O0fILjjyKbxumOHb7HnwKKcIVHu4BjG
	0KXNzNPdhchPGqba4ZUB0jBwFshy6aDL2Llm5H98fc5zbX/Bz9aCYnHa7KkwkbWA0/oDvA==
X-Gm-Gg: ASbGncvBXtxM/ahFi8UyrIzjfpCCYbV9QfcNo5Wsn81vHJThVyY529eLzCx8b9JrXsl
	lND/CrBT58fkrY7mXFs8j7AYjyiaK82mMXt0zW5iDXF2am/Noc39w4e7VayBwA3+Lk8l7aVuizy
	absNEpJBOA9uzv53GrG4f3W1M6QSO/PDk9eUnpNMOx5mNF9lWl05qUBH8IlX1WO3CDK/W3wGJnP
	Sz540N3zjX6J8EyBYghbZE3T43S9OBb/e+PFyREB9o7C15+BGt7743SGBccc6LcJQ4hn3MaVlW9
	+u4opXbc2hd09dbcR2+vJOkEVnwRmi1texEECaKhPxMhAznG6LlV2gDObByEbVIlrllYQhmKebO
	2wOM=
X-Google-Smtp-Source: AGHT+IHqg5BMS5H5H0CXatOkDxWYnVma8locc0gsDLlLL4jvBLJblPVH8Oi76UEBkFgq0T0ofvpIFQ==
X-Received: by 2002:a17:90b:1d91:b0:321:59e7:c5c5 with SMTP id 98e67ed59e1d1-325177426fcmr1615455a91.27.1755826339746;
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e8344494dsm8737468b3a.79.2025.08.21.18.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:32:15 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aKfInxTH8XeZo55z@troy-wujie14pro-arch>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_183221_175936_9083FA07 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f1..c1a3004df71d 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -53,7 +53,7 @@ examples:
>          reg = <0xd4010800 0x38>;
>          interrupt-parent = <&plic>;
>          interrupts = <36>;
> -        clocks =<&ccu 32>, <&ccu 84>;
> +        clocks = <&ccu 32>, <&ccu 84>;
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>

Best regards,
Troy
>          clock-names = "func", "bus";
>          clock-frequency = <100000>;
>      };
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
