Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2936EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8URJKypRR01NEYpyotZqjiRo5SfpUgEbgzOXU5ZFkYg=; b=o1rUPuvNpxiBk+
	aNHiBCwOWULwxVA5TfDJJhh3WsJFY/rW9NJ+OaYVxpo2St4NYgkvybYHSsgouhlYd3kkiACSmTwun
	orP3Ls5D95tfcVUYEEmVFeE2v6bu1U8EcF3zt8bbcqHQgLi4zBoAgw15200ZphBfiKW2F1Dx8HDed
	VngbMckFh8PtjX3LJUvmVFBwyZexWAqoj8rQRtJYAD6df3CTPRJBlZmFu2YSyvt1lNUdyXhep3qWR
	zKbM6tJFdtcEnmycV/cpUFy710f8UInQ3id5ewIZCSllyNhhob0gVqw+f4E/KiQcmKnla/dOF6Nrq
	2oEQN/ofoCvQWRdcR0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeXQ-00BrMZ-1D;
	Tue, 20 Jun 2023 16:49:04 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeXN-00BrLz-31
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 16:49:03 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-77ac2eb07a3so182186139f.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 09:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687279741; x=1689871741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlSdhQ3eCYV+z1Kptfv3vGGIgHEt5bvqs3RHbJX+pe0=;
        b=Dx/S/D4DeZ4dI1TAff37D+FbXVCi/1dwsPv3yjzpUp8GTZ8BznJh8dWYMFEjWPyuUU
         F6ahy8dyTpxosx4Y5Aowju9CSwwj+TBiiCdJvPFPGeICJWA0EwlMzQXTsBzfjNZA5Ec7
         941hFQhICHokSRsbyP7pCEwCriO3iCfMCrOTfY2uctUaT1kbSaMmOwZnGOKntJwvpfeC
         KSb2E0DWB9K5m+WXh0qAzbrxdZfFz19UhLehZVweakTh9hCOfasuzr1yUkZdFsO8uoOZ
         6a3+Od25ALd0j8Gv2J6yMlN1DaaQzj5mpIUDlAGJDD/hVIXaQyRSDB7SEVbuGjp3fSGm
         3YEg==
X-Gm-Message-State: AC+VfDyzM5hjg8p0vO3wyTQig6Hz8uvxT+iU08Rsqj5ZcHb22tLh108p
	OxhYwAVzTcPE2fkyddfDxw==
X-Google-Smtp-Source: ACHHUZ5Oj0ipQS5YeJFc0dfgU05kiRIXolESi5d8MHZS7nV/rS8I4VVMxAxZWMRFY5ZK1rzNNHy4Rw==
X-Received: by 2002:a6b:7103:0:b0:774:934c:d178 with SMTP id q3-20020a6b7103000000b00774934cd178mr8559968iog.20.1687279740792;
        Tue, 20 Jun 2023 09:49:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c11-20020a02c9cb000000b00411bdcdc488sm693665jap.173.2023.06.20.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:49:00 -0700 (PDT)
Received: (nullmailer pid 3804095 invoked by uid 1000);
	Tue, 20 Jun 2023 16:48:58 -0000
Date: Tue, 20 Jun 2023 10:48:58 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
Message-ID: <168727973778.3804036.16013455064916997231.robh@kernel.org>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
 <20230615-viper-stoic-1ff8efd7d51d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615-viper-stoic-1ff8efd7d51d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_094901_972534_B038329B 
X-CRM114-Status: UNSURE (   9.84  )
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


On Thu, 15 Jun 2023 23:50:15 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> To permit validation of cpu nodes, swap "additionalProperties: true"
> out for "unevaluatedProperties: false".
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
