Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DEEC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 03:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ8oPC2vUygUkebsrijOi6q+CVoXCHLkvWCYRro68UI=; b=PQ4n6PI3KBF9mM
	27bXbPejY2j+SDXSN4w3gRUwjKp8SGDmzw0qw6PwWhhkccSR47HUcHNiRLkxLiGE1dcGA5qdRlEsS
	im324JWqmcGkMhg76psyIsfzCeGGpr2wqn4nCLGJ8iq3qbEtFOWov8wj96GHrEqjlXpy+gN1x4DC5
	UhI2ys1k1h1R3q40ERIMihUaOl3UEV3+KAd38f0kkF57JLO7095XDlHwnUKw3CI58PUNRfuxHXlm0
	8T0prcMYJ8XFL9gObibbQkEV1pkfNv8Zktq1KaJC+HKr/sjtVNI2nQaWBirLJeW5SrEEq+CVOX7c1
	OL0lPZuJLMCkuGUbgb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6k4H-004CGa-0u;
	Wed, 07 Jun 2023 03:42:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6k4E-004CFj-24
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 03:42:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-651e298be3fso6735909b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686109356; x=1688701356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5amr3SUDsqzdSzy/47lg6a8IdfkrVtyksktE2N9uX2s=;
        b=pG9v16DF0kJRXNnHQrtaQv1di9rgPuLK9JyDO3nX1wsvYUfkmBuWSVDD/4etvL6rG0
         khItlfqQ7lZIknwFLwzRVPHK3llkPaK3WF7/xIxfy2hiW+hAgMjO1lhXeF54pnVVSoFM
         A4RbZaCKs4AlHPD5LCDp+wUfA1PeQOsuz3wMIqgdqJOADCpZ3eaVI5jqrCP6kTU7kCWD
         fOQr7/2PYxeLJhs7T//i14GQlS0k/E5+oG+u+vZnpC3mSk03RHlyUWgMMrEuVHsO7z7e
         qNwhaX1Nj1RARTxkfp6taoYulUx/qw8WE3VPV4QxjdyAhPGTjR2XlJc+RB5HJbkWe7a5
         Awnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686109356; x=1688701356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5amr3SUDsqzdSzy/47lg6a8IdfkrVtyksktE2N9uX2s=;
        b=Bpj7E0KcYVR/V0yEzHVvL9Ba4dW7YC1vOsPajmeOUHb/yymJPaYpzPCtlmX+Fth/BZ
         8MPlJD9yjvEBfzmTXjuK8BoG1vhdCoyU8KWC4X2pPcjal8rdrN2y9uoRFXmnBgoPRYEL
         Q2YCTSIU1ikEqq54j81MqjECiWEZDpcDLGW5YuujMEom+nFsVTVPZYln9WpQnAwyk7cc
         pBGvwmLeaMjisMjoQdt00nmwZ1sDhlH4tmYBRvRaR09E+qJoBopyy6F79+GhDA1AimcH
         mlMt/A4gLr9m8enxoEnPbn0IAR6RC30KWLYyykC5Ja4iEbJW2EOsY+3RYmd6z/FzxTPs
         4x9A==
X-Gm-Message-State: AC+VfDwQ5y50XaJW3+u+1zNRAjdn2E2uY60bxxoqkzWWVUUzfO4jS9ds
	OlG3vprFQZX+Q+faORCFrivTBw==
X-Google-Smtp-Source: ACHHUZ5jCaF84UNonxB7KCxf8AOMiF/ye9ip8+WqDMTb1jALjhGRnv+csTkREcknVbiC31dS9AgSNQ==
X-Received: by 2002:a05:6a00:1794:b0:64d:632a:d0ac with SMTP id s20-20020a056a00179400b0064d632ad0acmr5534707pfg.25.1686109356519;
        Tue, 06 Jun 2023 20:42:36 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id i8-20020a635408000000b00520b677c645sm8092718pgb.41.2023.06.06.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 20:42:36 -0700 (PDT)
Date: Wed, 7 Jun 2023 09:12:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Message-ID: <20230607034234.rgjb43gchkdtpuxw@vireshk-i7>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
 <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
 <20230606-unsmooth-slip-c80fab59c9b4@wendy>
 <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_204238_704870_8C31A32D 
X-CRM114-Status: UNSURE (   7.15  )
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

On 07-06-23, 02:04, Mason Huo wrote:
> Or you can just ignore it?

I can do that :)

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
