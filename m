Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F23EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tZPHJaktc9+cFMnZ7SkkIo0djHM5ZgnDN2SO3uvDj60=; b=GfEHdMHVr0NNf/Y/1VWQvXCNKq
	afzwxsEidR52WTk3z94+2hvOcBz2jpVz0Xrtqdg1b0AEYFwmY8nWuwT7YcDUabWWQSuVzv7mzYOPC
	qGDeaVV7sBnlOD9g2aTB5PeQdPyqn9Q4UtMwExKYB1+mS8Uk8Gfi+7KlJyE80flt5gWUvhiaizvd5
	XTryZvzyOoTBkKyd2+UooZPjlA/e6/dQh21dH6zPQcKyvFOFFwOjM/912QoBYazz445U+PeZHoXR2
	TNofmDIfW4gr0kWaYxJ/d2yJz6+5dezjJfT4YjmWQ+Y6rrrekqEbP68avoY4dMRJjuRYCeaVUT90K
	ZBOM+ZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RKl-00000002zI2-1vbR;
	Mon, 29 Apr 2024 13:46:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RKh-00000002zHT-44dB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:46:17 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9D3BC3FE58
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714398373;
	bh=h6mJvCJK1Jea7r50yUqQ7vE5+7yhc8VviIpbBrR7hhY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uS5jUxohJWzfK3EwyqhQCmG1dV0U5QqpU5C3Atiw/U1wO2BBZ8GMW7pss8h3MTCYX
	 lU9nSWGsNpUuccehcDc5ljkyiZOwQElGVud9woNi/jVFXHdTx3TP2FT5xy1x7hRIlx
	 yCEnL116w6UA/9iSjD7oJdv563V6QgfwPA7FSH3Cx19u0fjUOzagZp5mqybIAOPQ0M
	 rYISwG5hrQ0Jh0mzpC6spAHiD2tQNg3j5lw1NDF49F9tOzJ3n9JUcswkrUI6mFpdOP
	 KHogZy4qTlU+IMRcmQ+Qwz1tba09bXnBzqGPou7YRA9UR4oM1Af2kCzErEU6FkUcsY
	 W7ZOBLnxgUf2g==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4393e712cd5so59426461cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398372; x=1715003172;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6mJvCJK1Jea7r50yUqQ7vE5+7yhc8VviIpbBrR7hhY=;
        b=g27WVmdn1qqsVNgZRaoMmj4v0ecmf+6O4EF8q7J31sv5akqZNjYnZtnmC0KvKBJYlG
         oYQaJVMHX2gtU+PnoNzEfu0ccR/ow3PoVJrgYUo4TfUj4RTGxz1POxGXpythHNkXxfRY
         EqWRMJK+NZNjWkkeP0VQ3GSIH+6kkLeUaJvkVODZS5Jcy+af2h1CfjFS7b7XrpoygZSC
         6scBo9ZDlWrIYoqIOT501pT9Nxj1Qx+UCPyt4hfaorcqWfDrxijqulFQJoaUoE34/riM
         5xhfpIKe468GADQ/fJrO1d5FVyLgQ8QQLTxTVWJKtLIJcAuNQLbceEEr3plzKnpQbgWv
         h8zQ==
X-Gm-Message-State: AOJu0YymCFNJgf/jOQzp6oTlrRcgNX8WG3wwoVCPKe6jGJh46ciFIgEz
	phbpGcUY/ftaiC1EVwAhhgxVHXd297PWScoJSGVaVTAlow5U5sQYbZ0IzWuBXLxjvNajyGqbQOX
	Cd2FHXEI7I4dGnOkRlH1lsOsrudYqV8bvEm2bl7H6MFg91evY0uaUbvC85tHQeEL2AMxcXcE+Py
	f+nq7E4e1LXEqeh3lLdSoxG1RwZvIcBfAeFL+K5uhcPjSCZA/lslO4lfxj
X-Received: by 2002:a05:622a:18a3:b0:43b:7:6b42 with SMTP id v35-20020a05622a18a300b0043b00076b42mr1868771qtc.46.1714398372609;
        Mon, 29 Apr 2024 06:46:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIlDbe7IDabCj+xHEpXMlCy+uSz6SBjFMnmfn0odAlBGQ9fDFSnW9gobHhiUN+TFENPPlf8J74IM1KUJt/YOY=
X-Received: by 2002:a05:622a:18a3:b0:43b:7:6b42 with SMTP id
 v35-20020a05622a18a300b0043b00076b42mr1868758qtc.46.1714398372378; Mon, 29
 Apr 2024 06:46:12 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 08:46:12 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240429001317.432-6-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org> <20240429001317.432-6-jszhang@kernel.org>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 08:46:12 -0500
Message-ID: <CAJM55Z-aoe-whriE4_MuHxtTB2OfFSaatLW_6Beg50+vrNSg6w@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] riscv: dts: starfive: visionfive 2: add tf cd-gpios
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_064616_300522_D98E0E97 
X-CRM114-Status: GOOD (  12.34  )
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

Jisheng Zhang wrote:
> Per VisionFive 2 1.2B, and 1.3A boards' SCH, GPIO 41 is used as
> card detect. So add "cd-gpios" property for this.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 910c07bd4af9..b6030d63459d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -303,7 +303,7 @@ &mmc1 {
>  	bus-width = <4>;
>  	no-sdio;
>  	no-mmc;
> -	broken-cd;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;

nit if you need to respin this anyway: i know the properties are already not
sorted, but i'd prefer to not add more properties out of order.

In any case
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>


>  	cap-sd-highspeed;
>  	post-power-on-delay-ms = <200>;
>  	pinctrl-names = "default";
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
