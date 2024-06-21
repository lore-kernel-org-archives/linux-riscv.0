Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C4EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+P4rxRasAoDwB3/oIOOXzUloIeAwwB8bn3UhJIIQ50o=; b=S0Fq2JUMEEn2Cz
	Vgxk4/jrGDJhQwJXU+y9i/JGcudFD5SGZQMPkLkCDGE/3pYR43xZ7adkq2CYRDbD02mjFuskP14Te
	xA/iimSypximZNh2yrdgN/iz+9uiXwZqm9osI2dlpMbulWYb899rXUqXVBoSvJkZl1rQdQQ9C9hKY
	F4PQvoLkL3RSmt+h+3tI+iXT8PCBRJ1B6H0VdbJCqMmjb96ZUckiDxLOuOn63bTo684L19Hufb3jp
	LonzXl8RXFhh4SFtR35q+hMmOGG9PX6GJUiCP1vBx5wrKFsJjjSmXv9w84N8YhqO7zwUpr9wMjPBa
	ReLMQLdbZa8ANLVpOgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZ84-00000008DxK-2aCd;
	Fri, 21 Jun 2024 07:56:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZ80-00000008DuI-2IRm;
	Fri, 21 Jun 2024 07:56:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F00E7240004;
	Fri, 21 Jun 2024 07:56:06 +0000 (UTC)
Message-ID: <1ade7f97-d837-428d-b056-f0a3121b0c71@ghiti.fr>
Date: Fri, 21 Jun 2024 09:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: apatel@ventanamicro.com, ajones@ventanamicro.com,
 greentime.hu@sifive.com, vincent.chen@sifive.com,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240605121512.32083-3-yongxuan.wang@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_005613_245143_EDA26339 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/06/2024 14:15, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>   .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..1e30988826b9 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,36 @@ properties:
>               ratified at commit 3f9ed34 ("Add ability to manually trigger
>               workflow. (#2)") of riscv-time-compare.
>   
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for raising page-fault
> +            exceptions when PTE A/D bits need be set


Maybe something like:

"The standard Svade supervisor-level extension for SW-managed PTE A/D 
bit updates as ratified..."

would be better, WDYT?


> as ratified in the 20240213
> +            version of the privileged ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1. Neither svade nor svadu in DT: default to svade.
> +            2. Only svade in DT: use svade.
> +            3. Only svadu in DT: use svadu.
> +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> +               svadu once the SBI FWFT extension is available).
> +
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> +            #25 from ved-rivos/ratified") of riscv-svadu.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1. Neither svade nor svadu in DT: default to svade.
> +            2. Only svade in DT: use svade.
> +            3. Only svadu in DT: use svadu.
> +            4. Both svade and svadu in DT: default to svade (Linux can switch to
> +               svadu once the SBI FWFT extension is available).


I would not duplicate this text, but rather say something like "Please 
refer to Svade dt-binding description for more details.".


> +
>           - const: svinval
>             description:
>               The standard Svinval supervisor-level extension for fine-grained

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
