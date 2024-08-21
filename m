Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF4C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47uOkUiAB9PAMbcAFmn9s8PIoTybRPnbBLoJ+2P8AFE=; b=vxYQ1H8vDoyos1
	NM7PfP3z9LPpmWJxuiE5vLlYJI+BLeFGjoQ4tYSK+ZNxMZ3VNuRbWz4E5rX53IYgWw/2QClrhBPCA
	um/XGaeeD8tkTOVRbW64fZTagB6Kf+F+4nKZJ8DidiuKOZAgCY6WyiSmwv8ikq2v4KYOD0Pv0XIvH
	EMw6VxPsISnQAKH8dv3h+l0GribdNBBng6hy/azz6ABbPjsNyd0eesQ3fvvUP3mVBRLr+uahGLuRx
	LxZMBKPhWSsQ+Cn/gWM4OH1q/uaabrrdPEoe52WPRWtgL8wLXbHvzHcIS/8uhFvSyeOoJfgPlj/MX
	F8sENh0071t4d5WtoaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmRK-00000009Kun-3aAD;
	Wed, 21 Aug 2024 14:35:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmRH-00000009Kt4-1lpw
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:35:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso74192825e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250954; x=1724855754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvwZ5YwSqjVjAyJCShHqzpR3GyktjwhDKbfpd5HNn9I=;
        b=GpLNWPQoICK7Twv3/nadclDvoH0A0T+Kw1C9aq/WqFmLNAZNgCz8o/fYaWhh+1P0KM
         CrYD9NOWMSZVvsWEh6qAxkJRyjnqookhJTdPHr4DeG9hJ5CB/1nCUS6g0tR55KyLjwCO
         OVaUMlHFJmBEva+wflrgqsz7/iQS9BubbEyUfsChzX1o2Zuok5Aw1WEF2uF5TTQ+5fHy
         SuHuuEg2foMX8/3oowugaKiuIjC4Hqqj+jIFFpHgcjX4cYRWMYro8kTENzIMyDBeVjGY
         +xkcEkr0KLKwv/a7amzxpEG67koSBiWk6pwqlPWL47cSPHXpPc1yGjSM59XbEhhA0iD7
         Ebjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250954; x=1724855754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvwZ5YwSqjVjAyJCShHqzpR3GyktjwhDKbfpd5HNn9I=;
        b=Utsp34HYlk+u0kB1lTZbG4fq2lKBXZ1h39LzWSm/wI0T6/Wi7RPSs8AOYq3k9L176I
         278G7NGzq4VjloNgHhETC9zzFsKaE/g5v8u37NOg3DV1oMZeAe8STToXB1uUxiydXEpx
         XODPPLi4pDk6z6D93no+9q2JUcNXCjbbLnQoOzsSSgHX7tRJ/9BT9/W5w0V7UjrdGACL
         PqZyTrqLMz3iOLkN50nOt4jj7euvLXJXN7y6JdoZmyZmLox233PceURAxVTKFZpLQwFE
         xhEcRDfbdaZhWxMFc/MNItQvCvKanQgJiROXxlwmQafOUVTPIrO3apsAMEpk9VkJNmL7
         A7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+QJhS/I6wJBxtjnU1Wotm64Q8OqayhGky4Ki8hndnnHolBKDwG0w3yPI+s0hHynZAXa6FZC1oAWUbTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgB4PQexzy1gJqDEwERduSqHHvMqp2urd+OYZC126YsEhAc0GT
	tHupspAYhh/r/Tr8nfX+HYahF3tLH62z0hatnrzCkh/F4RzZYnT+MCpZhKy1qv4=
X-Google-Smtp-Source: AGHT+IGKUdmvaw7fp6jVH5UhYyWJ0984BCjDbxk9W2P6qBYfR0XWj8kIWEpSBhCOcvDzSAZMrXgjRA==
X-Received: by 2002:adf:ed10:0:b0:371:8e24:1191 with SMTP id ffacd0b85a97d-372fd731e99mr1837015f8f.53.1724250953491;
        Wed, 21 Aug 2024 07:35:53 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718984c0d0sm15793407f8f.38.2024.08.21.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:35:53 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:35:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 12/13] dt-bindings: riscv: Add Ziccrse ISA extension
 description
Message-ID: <20240821-6cb6f81cbf450f400444014b@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-13-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-13-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_073555_485704_C5839E3A 
X-CRM114-Status: GOOD (  16.25  )
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

On Sun, Aug 18, 2024 at 08:35:37AM GMT, Alexandre Ghiti wrote:
> Add description for the Ziccrse ISA extension which was ratified in
> the riscv profiles specification v1.0.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a63578b95c4a..4f174c4c08ff 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -289,6 +289,12 @@ properties:
>              in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>              riscv-isa-manual.
>  
> +        - const: ziccrse
> +          description:
> +            The standard Ziccrse extension which provides forward progress
> +            guarantee on LR/SC sequences, as ratified in commit b1d806605f87
> +            ("Updated to ratified state.") of the riscv profiles specification.
> +
>          - const: zk
>            description:
>              The standard Zk Standard Scalar cryptography extension as ratified
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
