Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD87D462D3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vxd0ijICYqNmHOsJaFye4KBLVtjJ31aefoU6k+vUdk=; b=UpXUyQKB1OlGnH
	b2p9ZKqhkXEk+OYyhtCpGvxIFMIVMrg574KKJC/tBs3SSnPt8DyN2u+tPRLtHKjJb0kFZQTTQnP9b
	IKjKyDXTyH4PivsZNuJcsoE4FoZdOk276raqdqN6Jqkx7xkI9gR/B412m68B3Zqi9Ph1h0srhrVi7
	UYT4Gjd78VEQCj0MnSP2K9smsYJhc9BSIPjDo7NKomAAcGIh/R7F0QigAfp4HpqzxDLKEQBtaCIfg
	ldh4vk1UZ7RRh5lVLxFOj4aDNySpaHcm7QPXCReY/XRy7n/+ZFwcfo82Zb/DcJ9mvFgd5wTNpDH2/
	UlO9WSH9dZr8F/LwFcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBG1j-00000007QM2-3aNR;
	Wed, 13 Nov 2024 16:15:31 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBG1g-00000007QJd-2gjT;
	Wed, 13 Nov 2024 16:15:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 959321BF20A;
	Wed, 13 Nov 2024 16:15:20 +0000 (UTC)
Message-ID: <eb8f399b-fa09-47fd-8102-9b65b0839dd5@ghiti.fr>
Date: Wed, 13 Nov 2024 17:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
Content-Language: en-US
To: Max Hsu <max.hsu@sifive.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_081528_843130_E6D4BF8F 
X-CRM114-Status: GOOD (  13.49  )
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

Hi Max,

On 20/09/2024 09:39, Max Hsu wrote:
> Add an entry for the Svukte extension to the riscv,isa-extensions
> property.
>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>   Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,13 @@ properties:
>               memory types as ratified in the 20191213 version of the privileged
>               ISA specification.
>   
> +        - const: svukte
> +          description:
> +            The standard Svukte supervisor-level extensions for making user-mode


s/extensions/extension


> +            accesses to supervisor memory raise page faults in constant time,
> +            mitigating attacks that attempt to discover the supervisor
> +            software's address-space layout, as PR#1564 of riscv-isa-manual.
> +
>           - const: zacas
>             description: |
>               The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
>

You'll need a new version for the proper commit sha1 once it gets 
ratified anyway, so with the typo fixed, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
