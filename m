Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C53C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0v3QFLGQgQxhFFfyMdj/KWAaWZAQVidMm65JhK1nYo=; b=BgKDZ6mr+pjtbL
	vAVJzI80ujKU7izU67k248ftibZUwQU0pbM4vbJ/OypdtLXFnb9HNJhqsktauxjRFyKMBk+0JdWfJ
	nkVXQdeG9F0YwOceDrNcJoMJr+gHfDlRJB0QbmNVS9kRM4vWu4oUo6rnyEir4u1URfX5W3rW+eeZe
	ewDY5E4uTdEMjjGl2ER9mMPaQbDGu1TZfnH1IBB5tw0w2lOsXzFyiRslV3uUI+RtyNGQkvYEwzhMf
	kUAn/eJ87GJu+0//ZLI9tNDnsXQ3lWPvgM7qyq5ZwgGIx5zrghsB84V87DLewaJq8n4K6CM6CG8+J
	yxVy9JE44amam+i97g5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhlL-004LWH-Ba; Tue, 18 Oct 2022 08:15:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhlI-004LV1-EF
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 08:15:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 25A48B81D7F;
	Tue, 18 Oct 2022 08:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF48EC433D6;
	Tue, 18 Oct 2022 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666080939;
	bh=NiAv+zV+OhVw/SMNAL4VCwWVxv3D3VbyawFBS3TxEQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9ZW3YG6niqCp1gyNqn3NCMLDVI4wJaWqxfJ3sJnoDCzYaeXv8C/RTr/7xTbN2ma5
	 Jcgmaes1h9cbLjBlx57/YNo8Z7I8qrYfggd0sWThLZOvxfNffo7bfY3QT0g9Dhdd6I
	 MJr2HYjCnLEq7cXeaz8X0hhm5Z2DuM5OrrxAi15UUbYRazfOwEMqo/70tOXYlEZD/P
	 CFSnqg4GfDghFJm4vJJwacOFS8oME8YDwJOhS5sbgBw7pagBQeaoLXpiCrtA4B+l5o
	 1jdJ+kPP/VM0Q+fOgnIe/vE2iExBEGF0uAYl3BjFQkoXcR2BssjhLTOvYtQa8XK7Yu
	 vY074BpKuMesQ==
Date: Tue, 18 Oct 2022 10:15:33 +0200
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: riscv: starfive: Add StarFive
 VisionFive V1 board
Message-ID: <Y05gpRFo5DjWTM0o@ziggy.stardust>
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
 <20221017210542.979051-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017210542.979051-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_011544_646350_8F67D3A1 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Oct 18, 2022 at 12:05:40AM +0300, Cristian Ciocaltea wrote:
> Document the compatibles for StarFive VisionFive V1 SBC [1].
> The board is based on the StarFive JH7100 SoC.
> 
> [1] https://github.com/starfive-tech/VisionFive
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 5b36243fd674..5d3fcee52d59 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -19,7 +19,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: beagle,beaglev-starlight-jh7100-r0
> +          - enum:
> +              - beagle,beaglev-starlight-jh7100-r0
> +              - starfive,visionfive-v1
>            - const: starfive,jh7100
>  
>  additionalProperties: true
> -- 
> 2.38.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
