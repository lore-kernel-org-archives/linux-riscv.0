Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C800CAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53oL1rCQU1qGoYMpBDKPjKkLpHSmGtYzv33rkHu/hbU=; b=CxZFylJ5qKW/4R
	OqZTenjygMBL+7Ox7dw3cHfZWMCByKc01VqpPgb4ThFuFwnRFPWOBdE5YUd8Ygm96CIzLT7RzRvY7
	NLvkMBeOef4d98iN8WdbQ1cNVG/Ua+6s6rKr7cwURt50hC/FrK8XrXw4cyRtEqxxp7QglOA06XJYY
	xYYmDcJxuTLqqMrL3VW0VCTGGf/9o2k5lnE23+6+M1y8Yk7Y6Mbj69KMPvFzK4eLxpgUdMDPFssB8
	3SfqgMC8GLuehudmvcg4SgEs5/9UgCwGKHviPSmTACg7YKh/B1kfJgW9AhvigNtdxs0tiykeS71uE
	X7SsYOfLf0qMF6BAFmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27vy-00000001K62-2Vh1;
	Fri, 26 Sep 2025 12:52:22 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27vx-00000001K5K-19gg
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 12:52:22 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-635355713d9so1593953d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758891140; x=1759495940; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeq95/+JFRlc8XyWn/nswZYQ27eu4+ApswNk/R1twrM=;
        b=oTG3MRnY4972A+IlfH9QyvbRijXUxXMgGovifkGT8bBDdoCDYKFCDtmoO0ncjeHvxT
         +bxWVTCaVcwMmaxcwBajYrJ1m4VjRAz54+8DMmOFt9xOIRSQEBL0mOC0nPO/4wbw2emu
         080YZnuJ8rM8AbiCTyZMlwErH7JVjiQTnAQf4Z8KcGO1y6kaYgPKwf3j7vXFF/FhkGyp
         yvOCd815kx/of7UuFQLmfLvIzFub+SQmDRxsTsVfPZtpLPahpJK8/HtDZjbzKGw/sACR
         akCdevb9weqvuiENEWO7Qq9re4iDoHGVCktiZhmesEArBV5+bsrNgdgYS/rBqIZUW+9k
         mTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758891140; x=1759495940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeq95/+JFRlc8XyWn/nswZYQ27eu4+ApswNk/R1twrM=;
        b=xHPv4Ex6fpIHCYtjqOVm1QdSDKjLKJqnst/UiZepaIzdwebOTEpGfmt4v4enJY1II0
         DrMKOYnxqsGiiAKp19mowTuE75XW+DXdVyhZ8eVJHsACys+rukKnWH5/UUbGu0EP13UW
         qnrabsiwDQcNUwFDg53HM3AAmk8P0/UBjHygOtapMezSYnjpXTUlpVOCB4X582n04QLj
         99MR4CuQalw0VNQ0puA7r/QTWdUi1MumAlO7QjffDkH6xIewUpcFFgRYOzLBfQOKkq2c
         Q4MTR39UqNuBISvJU/vagm382lVKObw275d9cyHkWnHVmSvln8z+zPHwwjQGWRPfUPJb
         tvyA==
X-Forwarded-Encrypted: i=1; AJvYcCXraOjILOW6nbTk6ifcbDHCGs9664zwuWK5ppUab3vxfkKLpe1Ll1A8+tDGNYejzb5X80X0UhEsRrQZ0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV4c6wCTVagwgk/J9bRZixBdqaQayhNBYc8v1ro1gVfgoaaUYp
	kGO/sIdlqI2J+I17wSDDcL5+yHvfkn0BuHM4aKci4Lbx2fJr3npTA4zeigd7rVO5BDPbdLJRoLS
	NjFrjV6KSjd7zlN8g6wEUdU9r1VkvCyG4QPP6EAErPw==
X-Gm-Gg: ASbGnctRybqShKfOc0u+SxjVgFqbfcwgl4DLJrd77PxP1VyWpjdLl8ZviGU+obduaL5
	iStRp/3JL0UBaMNqnJj8cEDMrrnMHiNw4cjvt8gyMM4OkqvK7kEyvfL9qyGqAxMmpVdL6EnpfGU
	1+y9fkWGOBrhqRZZTRHFDSrN9VZaF8UykKXdLPSYl5Hs+KY3D4rZ334uUwwlKsYg6bGaTaajnvT
	hMmmpOm
X-Google-Smtp-Source: AGHT+IFbegjMBskXETWZWAHtZmLSq0HPSiddGUE92rJmk6oAyCGRgWRczPzi/diLvmOjt/dbfSTu3Ew31MNwwvilOAo=
X-Received: by 2002:a05:690e:144c:b0:635:4ecd:75a0 with SMTP id
 956f58d0204a3-6361a89a815mr5888996d50.46.1758891139937; Fri, 26 Sep 2025
 05:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <aNYQkVuVpP3Daq7x@stanley.mountain>
In-Reply-To: <aNYQkVuVpP3Daq7x@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 14:51:43 +0200
X-Gm-Features: AS18NWAJ6VxhUJBeyo9x7sMCxxohCMAJ5raPfUmiVSZRv8RZbBNqJRlbPHJDbI0
Message-ID: <CAPDyKFq7mwW7ys6_1wnhf+BYBeDcsxgcL5HxGhnpxv1vMO2qaA@mail.gmail.com>
Subject: Re: [PATCH next] pmdomain: thead: Fix error pointer vs NULL bug in th1520_pd_reboot_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_055221_317226_7E051C67 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Drew Fustini <fustini@kernel.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Sept 2025 at 06:03, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The devm_auxiliary_device_create() returns NULL on error.  It never
> returns error pointers.  Using PTR_ERR_OR_ZERO() here means the function
> always returns success.  Replace the PTR_ERR_OR_ZERO() call check with
> a NULL check.
>
> Fixes: 64581f41f4c4 ("pmdomain: thead: create auxiliary device for rebooting")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/thead/th1520-pm-domains.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index 5213994101a5..d7cb9633c7c8 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -179,8 +179,10 @@ static int th1520_pd_reboot_init(struct device *dev,
>         struct auxiliary_device *adev;
>
>         adev = devm_auxiliary_device_create(dev, "reboot", aon_chan);
> +       if (!adev)
> +               return -ENODEV;
>
> -       return PTR_ERR_OR_ZERO(adev);
> +       return 0;
>  }
>
>  static int th1520_pd_probe(struct platform_device *pdev)
> --
> 2.51.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
