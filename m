Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C080DC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 01:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXGnv614t12M5riet2rgPRL+oDBU3cUkNF2BzS6vWB0=; b=wsQ2zrEljnnvIo
	9QqJfaqjfDyIyFoI7KcIHF3Ytnp97m/jNOn9I/eBvnFj+UbZOmbhzyuGtj3HuPHN0GDpTLtzJUGWv
	t9a+NxgisJi1pI4iP6Sg5czycB1Tmvm9dQFXKqNcLn5BbOANoqOll4t1qQrdyWTP8agZjRydMcCpz
	N7kQtZhWNtYr0s+VK5piKNhM74xcGavc9rD4PtWguGTi2zT8wI1igxX3BEIpEpPXbKr95CO3A4spN
	1i5p4owTSD/Old9mzgU0akrlhNBXAb4az1ae2AoHQgFeBlyYavHKWoa+XS66Ub5svWUEBm+RmhfVq
	gy4YYEam1KN/Du87a9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2B6-009rVk-3i; Wed, 01 Feb 2023 01:44:48 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2B3-009rVC-G0
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 01:44:46 +0000
Received: by mail-oi1-f171.google.com with SMTP id d188so14536296oia.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 17:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXwTZgiPmgELyuj9MUwWX8YzaCtDhA3ytFvllU7DMXs=;
        b=cema2drz8che3KsNfT6k8AB1+JzkqC/MWLyLljco2UirusWEgtP85r0Pi4F7WVqWP9
         QeYkAJyonzNlj6wegJ2oyHv51/fh4bh12jc/WwH/POKmtc45A8TkzindG2n2TCSRsuPp
         J9uduw285on6rI4Bl+arNFBWNgBzkU1lgbarbNVexhqZr3FsuCMv9NyildDWhVY+w8PV
         oKJIF8KR6pvuOREpA3O/HWFJaStFeNVbgrNQTPZnp9QIlWgQTf7d3UwFhC4w6ewEeL88
         p95IVWToAYlExxQPz9XBj/LT4LpGRsUdpFuqwHh/CflRRqV+vVJKxXVqss7DMOwGeGga
         fR8g==
X-Gm-Message-State: AO0yUKXdViEQpBsMO5TBb49wmHRty5eYnsbfyT4e1vTvAmuhcRdCVWcV
	nj3lBr3EyRf0DUa5EVed/CKgK0t2TA==
X-Google-Smtp-Source: AK7set+FZoHi7elOF65zpP8ZutGk1Jngax+dH8ZskVeZ8YY0Mo5VpXGo0yGCn4+eTAs/apLAEMHCQg==
X-Received: by 2002:aca:110f:0:b0:378:477c:3e0e with SMTP id 15-20020aca110f000000b00378477c3e0emr302653oir.45.1675215883089;
        Tue, 31 Jan 2023 17:44:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s33-20020a0568302aa100b0068bd3001922sm3076967otu.45.2023.01.31.17.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 17:44:42 -0800 (PST)
Received: (nullmailer pid 2297811 invoked by uid 1000);
	Wed, 01 Feb 2023 01:44:41 -0000
Date: Tue, 31 Jan 2023 19:44:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, "David S . Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: Add StarFive crypto module
Message-ID: <167521588146.2297772.10966946099496116680.robh@kernel.org>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-2-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130154242.112613-2-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_174445_553343_C2EAB63D 
X-CRM114-Status: UNSURE (   9.25  )
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


On Mon, 30 Jan 2023 23:42:39 +0800, Jia Jie Ho wrote:
> Add documentation to describe StarFive cryptographic engine.
> 
> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  .../crypto/starfive,jh7110-crypto.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
