Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6B0C67871
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4vIhC80TE0rtm2aZhRnjIU7gVj3WXwkN90NZ34w/3E=; b=p+ZknypnnMxTmL
	C66o9U6SXZWtqc+KdwADbWKMLytbFDBtZ5oFURq4A0cuMbNjLI4BhS24QcQUTnbH0E2lLQ+ULlqNA
	qjhs0g4IKQw0EklHdR6K9Kwd6JZjST/rqnEnSjKLORtTQs3qG2y01njALzsq6yHwsFBIg8hQ3RvD/
	uJ5RnDpNoj0304KPUBGt4cVK7a1i1Aa+NJ2WLtjwIjSRevBLqBOQbFpMhdZpng5CQAgrSr+kq92rH
	Yl9Mg7T36mnKDzQ+1XgxTbv6/+MBBBMXljJvCDdvPAYZuipf+3rZ0ee9In0tMZCpAqmJlL0qjmWjC
	MCvgJgwBNkGV6hSEzrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjeW-00Dsud-FJ; Tue, 17 Jan 2023 10:57:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjd6-00Ds2a-Jf
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 10:55:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id b5so8975931wrn.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 02:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/3tpm+1tTz3Wh67+zjCvzmePmhVXCLhDHdQOJyGVPE=;
        b=RmSvhLBW46xXKn0DhfEzkoOeiRODIUgVjrFTKFDo6pY1PuYtC6OKZVRO2S4+SvnwZA
         V3yRJI+dRkP4jYn6VPcm0YZtwbV4aqngFngFD9kqJ3w9RkWDiyML4qJp4i2blD0vn1on
         PzLJyO271ipllUjipKNLXaodF59RAc9B4+nDlqkH4/Mjky5GzZDepIPRxfBUy86hFJ9J
         /EWNFllVfu3BhR6RNCFZPUe6zsCdXWH3wL3+xRKNfLJpAvlndZBxBcdtQvMW2A99VVdg
         wCM1u2cAVlq89AOsqq47S6H4y9TMRbRkzTJJ72OqqtK5Q/BMY/5HIHMn8tkLaQDH3Y+S
         Pnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/3tpm+1tTz3Wh67+zjCvzmePmhVXCLhDHdQOJyGVPE=;
        b=buUivKg8vG3d6QxIv652EidJWPr1EHZrSfH70CwmKEj0foz58LcO6F+gwxJUDk+yI1
         oZvq/n8P8/dFfRx6kAYhyMDfR4VIMvVRUPemQ63mDqLSz21QEqwGeCJjIYMNTWbervl/
         mGkCgWrjM8fGv+Ph7fiwdCjJLamOztiHVM4weqkMhoIVD8YdbE7bZNKNlgKlrjieYJOA
         zF9hK+H/k+Ml2sEBSzWxmDYjP3byDBdid8Yqh3KfwEBWf6w8wv/5shXJWzm12hRv/F18
         E/VP15mn4NAqtcNdJ+NOEHmJO+d+3IcCkx4yD7gJ8ShApyPS4tEGSobShLWvHpMvMaxZ
         06XA==
X-Gm-Message-State: AFqh2kqid3GzEk0ykK0GbAhKY0WWBkrsYLwEMcbWILv2FEuTXHS97K93
	c2xruA6RqJlLKWF+o/+t6OM3+A==
X-Google-Smtp-Source: AMrXdXu4tk82cLPBxHMf8rC7EwZnWgP0nSZzLSHlYPURhCAOh1o8JhR1C8N5GSKivz0MUPMUjD313g==
X-Received: by 2002:a5d:5190:0:b0:2bd:fde4:885c with SMTP id k16-20020a5d5190000000b002bdfde4885cmr2318679wrv.63.1673952944756;
        Tue, 17 Jan 2023 02:55:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h3-20020adfe983000000b002bdf5832843sm7631755wrm.66.2023.01.17.02.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:55:44 -0800 (PST)
Message-ID: <1b42fe97-16fa-d004-539f-54e2cfecd38f@linaro.org>
Date: Tue, 17 Jan 2023 11:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
 <20230116074259.22874-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116074259.22874-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_025548_753669_FEAA099E 
X-CRM114-Status: UNSURE (   9.10  )
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

On 16/01/2023 08:42, Walker Chen wrote:
> Add bindings for the Power Management Unit on the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml   | 45 +++++++++++++++++++
>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
