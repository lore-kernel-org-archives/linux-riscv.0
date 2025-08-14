Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC8CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezVZ7y4N3q7fKfzt60lzBazY4uSf2WfCqf18wv6qToc=; b=0ap7JtUPG9Gvm+
	vdKubY0E+csHR/SCgHLRpKlO/xIUHXbv4zQyI7fc+kge++b9o0EmI6nfiyoT1RWBvULAErZfNuYGI
	i+xVLGAD41B229dH1/fH6R7DVYgKSzM/TF9tDGhm5wo7HCRcQNvwlvPNp1vSy6vxPbYD0KMsHl1us
	ErCqDhBxTBamIQ8/V5n//iZ8MukbSB+px0jDxv0PG/uoZd/8tbIezZDf5cKKqtSzOpfSeysj/UfRI
	j5fsWEMb6GrFqyq0Xjl9HKf5FS+db/gAMA3iCAMRXCChWZ5+nW49JJr7mIhEo7I3wGpELjh5v7Hbv
	cfzpUD9QrqOAqoEZB9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUXV-0000000GTX4-3rGC;
	Thu, 14 Aug 2025 09:46:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSE1-0000000G3sW-1L7M
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B54B544E7B;
	Thu, 14 Aug 2025 07:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD973C4CEEF;
	Thu, 14 Aug 2025 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755155892;
	bh=52ehO+DOq53l2aYyTZJdDIBWa6OjxxGD+1qhG8Awh3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nix0yIIdTjI+fR7Id/9ebkykAAv/B3UFIRcp+bfgF19dtpUak1b+k8oBwPfm1OWwS
	 cAea565o+u2YuyepoBXI43/xr/Np4U4gDLjcXuWqknupLJrw5P0NlqpCywOhe6j93u
	 k1NXlpR2TpIm+qrePtRsxfZ2nTUOONoz0NfUhTdkYQXnSQIdha3k2y9Frifdj7yA9Z
	 o1sPBxnVhCzYx8Q9zVRTSzEqdMI5C3QW8nMHB/42r9DY2HS2b3/KEGdB66DmEhY4oZ
	 7YdgK03sra2PzWZ2EJGqZysP4fHA1L+ylCQBY1cPsOlpYLxxSH9Qj1z+uaGa+NdV3A
	 kH5U/2dX5cvWw==
Message-ID: <d7278d14-2c7e-4414-9ae6-7639d8f69c94@kernel.org>
Date: Thu, 14 Aug 2025 09:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] dt-bindings: mailbox: thead,th1520-mbox: retrofit
 for other mailboxes
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250814070757.2267325-1-uwu@icenowy.me>
 <20250814070757.2267325-2-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250814070757.2267325-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_001813_406314_773FEBCF 
X-CRM114-Status: GOOD (  26.83  )
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

On 14/08/2025 09:07, Icenowy Zheng wrote:
> The current binding of thead,th1520-mbox can only apply to the C910T
> mailbox (which has an ID of 0).
> 
> Because of the weird mailbox register mapping practice for world
> seperation on TH1520, the binding needs some reword, in addition to add
> a property for mailbox ID, to describe other mailboxes.
> 
> Update the binding, in order to make it suitable to describe other

But I do not see any new device being added.

> mailboxes. The example is also updated, with an addition of mbox_c910t
> label to show that the example describes this specfiic mailbox, mailbox
> ID added and the register window sizes updated to the values from the
> manual (previously the remote-icu0 register windows is declared to be
> overly small that it would never work).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 49 ++++++++++++++-----
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> index 0971fb97896ef..5a24d2e8a6a8c 100644
> --- a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> @@ -12,6 +12,17 @@ description:
>    through mailbox channels. It also allows one core to signal another processor
>    using interrupts via the Interrupt Controller Unit (ICU).
>  
> +  The SoC is divided to two worlds, REE and TEE, although it's currently unknown
> +  how to enable the seperation between worlds so the seperation does not exist
> +  yet. However each mailbox is assigned to a certain world, and register windows
> +  for mailboxes are assigned to different worlds too. In a certain world's
> +  register windows for mailboxes, only mailboxes assigned to this world will
> +  have the local ICU part mapped (in addition to the remote ICU part of the
> +  other same-world mailbox), and mailboxes assigned to the other world have
> +  only the coressponding remote ICU part mapped to this world. Two mailboxes
> +  (C910T and E902) are assigned to the TEE world and two mailboxes (C906 and
> +  C910R) are assigned to the REE world.
> +
>  maintainers:
>    - Michal Wilczynski <m.wilczynski@samsung.com>
>  
> @@ -22,9 +33,9 @@ properties:
>    clocks:
>      items:
>        - description: Clock for the local mailbox
> -      - description: Clock for remote ICU 0
> -      - description: Clock for remote ICU 1
> -      - description: Clock for remote ICU 2
> +      - description: Clock for the other mailbox in the same world
> +      - description: Clock for the first mailbox in the other world
> +      - description: Clock for the second mailbox in the other world
>  
>    clock-names:
>      items:
> @@ -35,10 +46,14 @@ properties:
>  
>    reg:
>      items:
> -      - description: Mailbox local base address
> -      - description: Remote ICU 0 base address
> -      - description: Remote ICU 1 base address
> -      - description: Remote ICU 2 base address
> +      - description: Base address of this specific mailbox
> +      - description: Base address of the other mailbox in the same world
> +      - description:
> +          Base address of the register window in this world corresponding to the
> +          first other-world mailbox.
> +      - description:
> +          Base address of the register window in this world corresponding to the
> +          second other-world mailbox.

This feels like ABI change.

>  
>    reg-names:
>      items:
> @@ -50,10 +65,17 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  thead,mbox-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The ID of this specific mailbox that this device tree node describes. For
> +      compatibility with old device trees, if missing, the ID is default to 0,
> +      the C910T mailbox.

No, you cannot have instance IDs. It's even explicitly documented in
writing bindings.

> +
>    '#mbox-cells':
>      const: 1
>      description:
> -      The one and only cell describes destination CPU ID.
> +      The one and only cell describes destination mailbox ID.
>  
>  required:
>    - compatible
> @@ -72,12 +94,12 @@ examples:
>      soc {
>        #address-cells = <2>;
>        #size-cells = <2>;
> -      mailbox@ffffc38000 {
> +      mbox_c910t: mailbox@ffffc38000 {

No, don't add unused labels. This is not improving the binding.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
